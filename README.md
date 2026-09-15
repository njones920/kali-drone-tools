<p align="center">
  <img src="assets/kali-drone-tools.svg" alt="Kali Drone Tools" width="100%">
</p>

<p align="center">
  <a href="https://www.kali.org/"><img alt="Kali Linux" src="https://img.shields.io/badge/Kali_Linux-rolling-557c94?style=flat-square"></a>
  <img alt="Architecture: amd64" src="https://img.shields.io/badge/architecture-amd64-7857d8?style=flat-square">
  <a href="LICENSE"><img alt="License: GPL-3.0-or-later" src="https://img.shields.io/badge/license-GPL--3.0--or--later-8bc34a?style=flat-square"></a>
  <a href="https://github.com/njones920/kali-drone-tools/releases/tag/v2026.3.0"><img alt="Release: v2026.3.0" src="https://img.shields.io/badge/release-v2026.3.0-8bc34a?style=flat-square"></a>
</p>

Kali Drone Tools turns a standard Kali Linux desktop into a focused drone and
UAV security workstation. It installs a curated, archive-native toolbox and adds
the missing **Drone & UAV** application-menu domain.

Ported from [parrot-drone-tools](https://github.com/njones920/parrot-drone-tools)
and adapted for Kali's menu system, package naming, and rolling release model.

## What it adds

| Menu category | Working set |
|---|---|
| SDR & RF Analysis | GNU Radio, Gqrx, SDR++, Inspectrum, HackRF, rtl_433, SatDump |
| Remote ID & DroneID | Kismet, AntSDR DJI DroneID capture helper, Bettercap |
| MAVLink & Ground Control | pymavlink tools and CAN/DroneCAN foundations |
| GNSS & GPS | GNSS-SDR, gpsd tools, GPS conversion and RTK foundations |
| Counter-UAS & Detection | ADS-B airspace awareness, Nmap drone recon, Wireshark drone filters |
| Firmware & Hardware | Binwalk, Rizin, OpenOCD, flashrom, PulseView and serial tools |

The metapackage recommends the relevant SDR backends and Kismet capture helpers
already available in Kali, so supported radios can be added later without
rebuilding the workstation.

### Kali-specific additions

Three launchers beyond the original Parrot edition:

- **Wireshark** — graphical packet analyzer with AR.Drone, DJI UAV, and UAVCAN
  dissector filters preconfigured
- **Bettercap** — network reconnaissance and MITM for drone Wi-Fi links
- **Nmap** — network scanning tuned for drone companion computers and GCS ports

## Quick start

### 1. Get the repository

```bash
git clone https://github.com/njones920/kali-drone-tools.git
cd kali-drone-tools
```

Release archives work too; the installer only needs the complete repository
contents.

### 2. Install

```bash
sudo ./install.sh
```

The installer will:

1. Confirm Kali Linux and amd64 before changing anything.
2. Confirm that the installed Kali menu layout is compatible.
3. Verify the bundled package against `SHA256SUMS`.
4. Install `kali-tools-drone` through APT.
5. Add seven menu categories and 26 launchers.
6. Run the same verification available to the user.

Expect approximately **2.4 GB** of archive downloads on a minimal installation.
Suggested packages are not installed automatically.

### 3. Verify

```bash
./verify.sh
```

Healthy output looks like:

```text
PASS  kali-tools-drone 2026.3.0
PASS  pymavlink 2.4.37
PASS  7 menu categories
PASS  26 application launchers
PASS  Drone & UAV menu registered once
```

The script is safe to run again. Existing menu integration is detected instead
of duplicated.

## Requirements

- Kali Linux (rolling release)
- amd64 architecture
- Internet access to Kali's package repositories
- `sudo`
- Approximately 2.4 GB for the recommended toolbox

No SDR, drone, radio, or GPU is required to install it.

## Damn Vulnerable Drone (DVD) integration

This toolkit is designed as the natural companion workstation for
[Damn Vulnerable Drone](https://github.com/nicholasaleks/Damn-Vulnerable-Drone).
DVD provides the simulated vulnerable drone lab; Kali Drone Tools provides the
analysis and attack workstation.

When DVD is installed alongside this toolkit (`dvd-kali`), the verify script
will detect and report it. DVD remains an optional external lab and is not
installed automatically.

## Why one bundled package?

`kali-tools-drone` is the small metapackage that defines the toolbox.

Unlike the Parrot edition, no bundled pymavlink compatibility package is needed.
Kali's `python3-pymavlink` (2.4.37-0kali2) installs cleanly without the retired
`python3-future` dependency that blocked installation on Parrot 7.x.

The metapackage's Debian source is included under `packaging/` for inspection.
Everything else is resolved normally from Kali's repositories.

The original pymavlink compatibility patch is retained under `patches/` for
reference and for anyone building against other Debian-based distributions.

## Scope

The baseline is built from Kali's package archive. Hardware setup is left to
Kali and the device vendor, while Damn Vulnerable Drone remains a separate
optional lab. See [package scope](docs/PACKAGE-SCOPE.md) and
[hardware notes](docs/HARDWARE.md).

## Uninstall

```bash
sudo ./uninstall.sh
```

This removes the Drone & UAV menu integration and metapackage. Tools previously
installed by APT are retained, avoiding a surprise mass-removal of software or
user data.

## Repository layout

```text
install.sh             guarded installer
verify.sh              read-only installation checks
uninstall.sh           conservative menu/metapackage removal
menu/                  7 categories, 26 launchers and menu patch
packages/              verified installable packages and checksums
packaging/             Debian source for kali-tools-drone
patches/               pymavlink compatibility patch (reference)
docs/                  scope and hardware guidance
```

## Differences from parrot-drone-tools

| Change | Detail |
|---|---|
| Menu system | Kali's `kali-applications.menu` with `kali-drone-*` categories |
| Launcher protection | Removed — Kali doesn't need parrot-menu shadowing |
| OS detection | `ID=kali` in `/etc/os-release`; no version gate (rolling) |
| sudo wrapper | Standard `sudo` instead of `parrot-exec --sudo` |
| pymavlink | No bundled patch needed; Kali's repo version works |
| Extra launchers | +3 Kali-specific: Wireshark, Bettercap, Nmap |
| DVD reference | `dvd-kali` instead of `dvd-parrot` |

## License

Original project work is copyright © 2026 Nate Jones and released under
[GPL-3.0-or-later](LICENSE), matching Kali's menu and conversion tooling.
Bundled and derived components retain their upstream copyrights and licenses;
see [third-party notices](THIRD_PARTY.md).
