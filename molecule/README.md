# Molecule Testing

This role supports [Molecule](https://docs.ansible.com/projects/molecule/), an Ansible testing framework designed for developing and testing Ansible collections, playbooks, and roles.

## Prerequisites

To utilize Molecule you need to prepare several requirements:

- **x86** computer running one of these operating systems that make use of [systemd](https://systemd.io/):
  - **Archlinux**
  - **CentOS**, **Rocky Linux**, **AlmaLinux**, or possibly other RHEL alternatives (although your mileage may vary)
  - **Debian** (10/Buster or newer)
  - **Ubuntu** (18.04 or newer)
- `root` access on the computer which Molecule runs against
- [Ansible](http://ansible.com/) program
- [Python](https://www.python.org/)
  - Most distributions install Python by default, but some don't (e.g. Ubuntu 18.04) and require manual installation (something like `apt-get install python3`)
- [Docker](https://www.docker.com)
  - Access to Docker UNIX socket (`/var/run/docker.sock`) is required by default

## Installation

To set up the environment for using Molecule, run the command below on the terminal:

```bash
python3 -m venv ./molecule/venv
source ./molecule/venv/bin/activate
pip3 install -r ./molecule/requirements.txt
```

## Scenarios

Currently there are two testing scenarios available.

### `basic`

Tests a single WireGuard tunnel between two containers (`wg-peer1` and `wg-peer2`).

- One tunnel: `wg0` on 10.100.0.0/24, port 51820
- Verifies: service active, interface exists, end-to-end ping across the tunnel

### `multi_tunnel`

Tests two simultaneous WireGuard tunnels and validates the role's per-tunnel smart restart logic.

- Two tunnels: `wg0` (10.100.0.0/24, port 51820) and `wg1` (10.101.0.0/24, port 51821)
- Per-tunnel restart test: mutates only the wg0 peer config, then asserts that wg0 was restarted and wg1 was not

## Running

By default it is configured to run the scenarios on Ubuntu 24.04.

```bash
molecule test --scenario-name basic
molecule test --scenario-name multi_tunnel
```

You can utilize other distributions by setting one to the `MOLECULE_DISTRO` environment variable:

```bash
# Ubuntu 24.04
MOLECULE_DISTRO=ubuntu2404 molecule test --scenario-name basic
MOLECULE_DISTRO=ubuntu2404 molecule test --scenario-name multi_tunnel

# Debian 13
MOLECULE_DISTRO=debian13 molecule test --scenario-name basic
MOLECULE_DISTRO=debian13 molecule test --scenario-name multi_tunnel
```
