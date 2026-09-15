# Package scope

Kali Drone Tools is a curated view of software already supplied by Kali Linux.
It adds a metapackage and a menu domain; it does not replace Kali's repositories.

## Included domains

| Domain | Representative packages and workflows |
|---|---|
| SDR and RF | GNU Radio, Gqrx, SDR++, Inspectrum, rtl_433, SatDump and common SoapySDR backends |
| Remote ID foundations | Kismet wireless capture and the packaged AntSDR DJI DroneID helper |
| Telemetry | pymavlink, serial tooling and CAN/DroneCAN foundations |
| GNSS | GNSS-SDR, gpsd, GPSBabel, Viking and RTKLIB command-line tools |
| Airspace awareness | readsb, gr-air-modes and supporting capture/analysis tools |
| Firmware and hardware | Binwalk, Rizin, radare2, OpenOCD, flashrom, PulseView and programmer utilities |
| Computer vision foundations | OpenCV, ONNX Runtime, NumPy and portable CPU PyTorch by default |
| Network recon | Nmap, Bettercap, Wireshark with drone protocol dissectors |

The metapackage also recommends the radio backends and Kismet capture helpers
present in Kali's archive. It does not claim that every protocol is decodable
over the air or that one receiver covers every drone band.

## Kept in existing Kali domains

General-purpose tools stay where Kali already organizes them:

| Need | Existing Kali domain |
|---|---|
| Password recovery | Credential Access tools |
| Full reverse-engineering suite | Forensics / Reverse Engineering |
| Disk and memory forensics | Forensics |
| General network and web testing | Reconnaissance / Discovery |

This avoids turning a focused drone toolbox into a second copy of Kali's full
security suite.

## Baseline boundary

The project covers the Kali-native toolbox and menu integration. Hardware
setup and the Damn Vulnerable Drone lab are documented and installed separately.
