# Molecule Testing

## Installation

```bash
python3 -m venv ./molecule/venv
source ./molecule/venv/bin/activate
pip3 install -r ./molecule/requirements.txt
```

## Scenarios

### `basic`

Tests a single WireGuard tunnel between two containers (`wg-peer1` and `wg-peer2`).

- One tunnel: `wg0` on 10.100.0.0/24, port 51820
- Verifies: service active, interface exists, end-to-end ping across the tunnel

### `multi_tunnel`

Tests two simultaneous WireGuard tunnels and validates the role's per-tunnel smart restart logic.

- Two tunnels: `wg0` (10.100.0.0/24, port 51820) and `wg1` (10.101.0.0/24, port 51821)
- Per-tunnel restart test: mutates only the wg0 peer config, then asserts that wg0 was restarted and wg1 was not

## Running

Ubuntu 24.04 (default):

```bash
molecule test --scenario-name basic
molecule test --scenario-name multi_tunnel
```

Other distributions:

```bash
# Ubuntu 22.04
MOLECULE_DISTRO=ubuntu2204 molecule test --scenario-name basic
MOLECULE_DISTRO=ubuntu2204 molecule test --scenario-name multi_tunnel

# Debian 13
MOLECULE_DISTRO=debian13 molecule test --scenario-name basic
MOLECULE_DISTRO=debian13 molecule test --scenario-name multi_tunnel

# Debian 12
MOLECULE_DISTRO=debian12 molecule test --scenario-name basic
MOLECULE_DISTRO=debian12 molecule test --scenario-name multi_tunnel
```
