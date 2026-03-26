# show help by default
default:
    @just --list --justfile "{{ justfile() }}"

lint:
    pre-commit run --all-files
