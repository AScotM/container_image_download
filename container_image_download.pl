#!/usr/bin/perl
use strict;
use warnings;

my $image_name = "rockylinux";  # Change to the image you want

# Check if the image is already downloaded
my $existing_images = `podman images --format "{{.Repository}}:{{.Tag}}"`;

if ($existing_images =~ /\b\Q$image_name\E\b/) {
    print "Image '$image_name' is already downloaded.\n";
} else {
    print "Image '$image_name' not found. Downloading...\n";
    system("podman pull $image_name") == 0 or die "Failed to pull image: $!";
}

