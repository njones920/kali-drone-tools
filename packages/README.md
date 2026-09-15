# Release packages

Release archives contain one verified package here:

- `kali-tools-drone_2025.1.0_amd64.deb`

SHA-256:

```text
f242a778b5a2bd40eda7b51cdff226d29db9166de86afc67370899687364337f  kali-tools-drone_2025.1.0_amd64.deb
```

The metapackage source is under `packaging/`.

Unlike the Parrot edition, no bundled pymavlink compatibility package is needed.
Kali's `python3-pymavlink` (2.4.37-0kali2) installs cleanly without the retired
`python3-future` dependency.
