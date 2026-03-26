# Molecule Testing

## Installation

```bash
python3 -m venv ./molecule/venv
source ./molecule/venv/bin/activate
pip3 install -r ./molecule/requirements.txt
```

# Execution

Ubuntu:
```bash
# Ubuntu 24.04
MOLECULE_DISTRO=ubuntu2404 molecule test --scenario-name stroke
MOLECULE_DISTRO=ubuntu2404 molecule test --scenario-name vici

# Ubuntu 22.04
MOLECULE_DISTRO=ubuntu2204 molecule test --scenario-name stroke
MOLECULE_DISTRO=ubuntu2204 molecule test --scenario-name vici
```

Debian:
```bash
# Debian 13
MOLECULE_DISTRO=debian13 molecule test --scenario-name stroke
MOLECULE_DISTRO=debian13 molecule test --scenario-name vici

# Debian 12
MOLECULE_DISTRO=debian12 molecule test --scenario-name stroke
MOLECULE_DISTRO=debian12 molecule test --scenario-name vici
```
