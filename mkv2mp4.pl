#!/usr/bin/perl -t 
# mkv to mp4 converter by tbe
# Output files are PS3 compatible
#
# This software is developed under the GPLv2 License
#
# Version: 0.8a
#
# ToDo:
# - improve error management
# - include subtitle functions
# - make source nicer
#
#
# Questens mail to: tbe@boreus.de
#
# Developers welcome

use strict;
use warnings;

my ( $infile, $outfile, %tracks, $vid_track, $audio_track, %defaults, $channels,
    $fps );
my ( $mkvinfo, $mkvextract, $faac, $mplayer, $MP4Box, $mkfifo );

sub promptUser {
    my ( $promptString, $defaultValue ) = @_;
    if ($defaultValue) {
        print $promptString, " [", $defaultValue, "]: ";
    }
    else {
        print $promptString, ": ";
    }
    $| = 1;
    $_ = <STDIN>;
    chomp;
    if ("$defaultValue") {
        return $_ ? $_ : $defaultValue;
    }
    else {
        return $_;
    }
}

sub get_bins {
    die "no mkvinfo found" unless $mkvinfo = `which mkvinfo 2>/dev/null`;
    die "no mkvextract found"
      unless $mkvextract = `which mkvextract 2>/dev/null`;
    die "no faac found"    unless $faac    = `which faac 2>/dev/null`;
    die "no mplayer found" unless $mplayer = `which mplayer 2>/dev/null`;
    die "no MP4Box found"  unless $MP4Box  = `which MP4Box 2>/dev/null`;
    die "no mkfifo found"  unless $mkfifo  = `which mkfifo 2>/dev/null`;

    # removing \n
    $mkvinfo    =~ s/\s+$//;
    $mkvextract =~ s/\s+$//;
    $faac       =~ s/\s+$//;
    $mplayer    =~ s/\s+$//;
    $MP4Box     =~ s/\s+$//;
    $mkfifo     =~ s/\s+$//;
}

sub parse_args {
    die "usage: $0 inputfile outputfile\n" unless ( @ARGV == 2 );
    $infile  = "\'$ARGV[0]\'";
    $outfile = "\'$ARGV[1]\'";
}

sub get_mkvinfo {
    my ($track_id);
    print "Getting matroska information for $infile\n\n";
    open MKVI, "$mkvinfo $infile |";
    while (<MKVI>) {
        if ( $_ =~ m/Track number: (\d+)/ ) {
            $track_id = "$1";
        }
        elsif ( $_ =~ m/Track type: (\w+)/ ) {
            $tracks{$track_id}{"type"} = $1;
        }
        elsif ( $_ =~ m/Default flag: 1/ ) {
            $defaults{ $tracks{$track_id}{"type"} } = $track_id;
        }
        elsif ( $_ =~ m/Language: (\w+)/ ) {
            $tracks{$track_id}{"lang"} = $1;
        }
        elsif ( $_ =~ m/Name: (.*)$/ ) {
            $tracks{$track_id}{"name"} = $1;
        }
        elsif ( $_ =~ m/Default duration:.*\((.*) fps.*/ ) {
            $tracks{$track_id}{"fps"} = $1;
        }
        elsif ( $_ =~ m/Channels: (\d+)/ ) {
            $tracks{$track_id}{"channels"} = $1;
        }
    }
    close MKVI;
}

sub print_mkvinfo {
    my ( $video, $audio, $subs );
    foreach my $track ( sort keys %tracks ) {
        if ( $tracks{$track}{'type'} eq "video" ) {
            $video .=
"$track\: $tracks{$track}{'name'}, $tracks{$track}{'lang'}, $tracks{$track}{'fps'} fps\n";
        }
        elsif ( $tracks{$track}{'type'} eq "audio" ) {
            $audio .=
"$track\: $tracks{$track}{'name'}, $tracks{$track}{'lang'}, $tracks{$track}{'channels'} channels\n";
        }
    }
    print "Video-Tracks:\n";
    print $video;
    print "\nAudio-Tracks:\n";
    print $audio;
    print "\n\n";
}

sub users_choice {
    $vid_track =
      &promptUser( "Please select your video-track", $defaults{'video'} );
    $fps = $tracks{$vid_track}{"fps"};
    $audio_track =
      &promptUser( "Please select your audio-track", $defaults{'audio'} );
    $channels = $tracks{$audio_track}{"channels"};
}

sub extract {
    print
      "\n\nExtracting video:$vid_track and audio:$audio_track from $infile\n";
    open MKVE,
"$mkvextract tracks $infile $vid_track\:video.h264 $audio_track\:audio.ac3 |";
    while (<MKVE>) {
        print $_;
    }
    die unless ( $? == 0 );
    close MKVE;
}

sub edit_vid {
    my $buffer;
    print "\n\nManipulating video.h264\n";
    open( VID, "+<video.h264" );
    seek( VID, 7, 0 );
    read( VID, $buffer, 1, 0 );
    printf( "Changing offset %s from %02x to 29\n", '0x07', ord($buffer) );
    seek( VID, 7, 0 );
    print VID chr(0x29);
}

sub convert_audio() {
    my $mplayer_args = "";
    print "\n\nCreating FIFO file\n";
    `rm -f audiodump.wav; $mkfifo audiodump.wav`;
    die "Cannot create FIFO file" unless ( $? == 0 );
    print "\nConverting audio.ac3 to audio.m4a MP4 Audio Stream\n\n";
    open( FAAC, "$faac -q 0.20 -o audio.m4a audiodump.wav |" );
    open( MPLAYER,
		"$mplayer audio.ac3  -vc null -vo null -ao pcm:fast -channels $channels 1>/dev/null 2>mplayer_error.log |"
    	);
    while (<MPLAYER>) {
        print $_;
    }
    die "Error while reading the audio source\nSee mplayer_error.log"
      unless ( $? == 0 );
    while (<FAAC>) {
        print $_;
    }
    close FAAC;
    close MKVE;
    die "Error while converting the audio source" unless ( $? == 0 );
    print "Converting done, removing temporary files\n\n";
    `rm -f audio.ac3 audiodump.wav`;
}

sub create_mp4 {
    print "\n\nCreating mp4 container\n";
    open( MP4BOX,
        "$MP4Box -fps $fps -add video.h264 -add audio.m4a $outfile |" );
    while (<MP4BOX>) {
        print $_;
    }
    close MP4BOX;
    print "\n\nDone packing, removing temporary files\n";
    `rm -rf video.h264 audio.m4a`;
    my $remove =
      &promptUser( "Do you want to remove the source-file to? (y/n)", "n" );
    if ( $remove eq "y" ) {
        `rm -f $infile`;
    }
    print "Removed files.\nDone\nhf\n";
}

sub main {
    get_bins();
    parse_args();
    get_mkvinfo();
    print_mkvinfo();
    users_choice();
    extract();
    edit_vid();
    convert_audio();
    create_mp4();
}

main();
