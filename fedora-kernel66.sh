#!/bin/bash

# Function to download RPMs from URLs
download_rpms() {
    urls=("$@")  # Accept URLs as arguments
    for url in "${urls[@]}"; do
        wget "$url"  # Download RPM
    done
}

# Function to install RPMs using dnf
install_rpms() {
    rpms=("$@")  # Accept RPM filenames as arguments
    for rpm in "${rpms[@]}"; do
        sudo dnf install -y "$rpm"  # Install RPM
    done
}

# Set Fedora version variable
fedora_version=39

# Adjust Fedora version if needed
if [ "$fedora_version" -eq 38 ]; then
    version_suffix="100.fc38"
else
    version_suffix="200.fc39"
fi

# Construct URLs based on Fedora version
rpm_urls=(
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-6.6.14-$version_suffix.x86_64.rpm"
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-core-6.6.14-$version_suffix.x86_64.rpm"
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-modules-6.6.14-$version_suffix.x86_64.rpm"
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-modules-core-6.6.14-$version_suffix.x86_64.rpm"
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-devel-6.6.14-$version_suffix.x86_64.rpm"
    "https://kojipkgs.fedoraproject.org//packages/kernel/6.6.14/$version_suffix/x86_64/kernel-modules-extra-6.6.14-$version_suffix.x86_64.rpm"
)

# Download RPMs
download_rpms "${rpm_urls[@]}"

# Install RPMs
install_rpms *.rpm

# make sure to create kmod for kernel 6.6
akmods --force

