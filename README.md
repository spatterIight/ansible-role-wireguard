# ansible-role-wireguard

## What it is

Install and configure WireGuard VPNs

## How to use

To use this role simply define, at a minimum, the `wireguard_networks` variable and execute the role agaisn't your host(s).

One thing to keep in mind is how this role manages the public/private key-pair:
  1. If a private key does not exist AND is not defined in `wireguard_networks` it will be generated.
  2. If a public key is not defined it will be generated based on the private key and printed. You must add it your `wireguard_networks` definition and re-run the role.
  3. If you do store the private key in Ansible, be sure to store it in an Ansible Vault.

## Role Variables

| Variable              | Default         | Description                                     |
|-----------------------|-----------------|-------------------------------------------------|
| `wireguard_user`      | root            | The user to permission as                       |
| `wireguard_group`     | root            | The group to permission as                      |
| `wireguard_directory` | /etc/wireguard  | The base WireGuard configuration directory      |
| `wireguard_networks`  | []              | A list of dictionaries of networks to configure |

## Default Playbook
```
---
- hosts: node
  become: true
  gather_facts: true
  roles:
    - ansible-role-wireguard
  vars:
    wireguard_networks:
      - network_name: wg0
        address: 172.24.18.1/32
        mtu: 1300
        public_key: YiQUJf/2YK8gsOrVuV1CtF7Y98wY5eaTc16MpI38JEM=
        peers:
          - endpoint: 192.168.1.1:5555
            allowed_ips: 0.0.0.0/0
            public_key: "{{ hostvars['my_endpoint_host']['wireguard_networks'][0]['public_key'] }}"
