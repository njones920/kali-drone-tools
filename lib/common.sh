#!/bin/bash

PROJECT_NAME="Kali Drone Tools"
MENU_FILE="/etc/xdg/menus/applications-merged/kali-applications.menu"
MENU_BACKUP="${MENU_FILE}.pre-kali-drone-tools"
MENU_MARKER='<Name>Drone &amp; UAV</Name>'

die() {
    printf 'ERROR: %s\n' "$*" >&2
    exit 1
}

info() {
    printf '==> %s\n' "$*"
}

require_root() {
    [ "$(id -u)" -eq 0 ] || die "run this command with sudo"
}

require_kali() {
    [ -r /etc/os-release ] || die "cannot identify the operating system"
    # shellcheck disable=SC1091
    . /etc/os-release
    [ "${ID:-}" = "kali" ] || die "this installer supports Kali Linux only"
}

require_amd64() {
    [ "$(dpkg --print-architecture)" = "amd64" ] ||
        die "this release supports amd64 only; no changes were made"
}
