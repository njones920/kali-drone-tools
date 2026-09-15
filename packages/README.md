# Release packages

Release archives contain one verified package here:

- `kali-tools-drone_2026.3.0_amd64.deb`

SHA-256:

```text
58c339143bb41036ed7c2cedddd210e2ddfa05c370313b6ab86b84174b9cf71c  kali-tools-drone_2026.3.0_amd64.deb
```

The metapackage source is under `packaging/`.

Unlike the Parrot edition, no bundled pymavlink compatibility package is needed.
Kali's `python3-pymavlink` (2.4.37-0kali2) installs cleanly without the retired
`python3-future` dependency.
