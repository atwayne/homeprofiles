#!/usr/bin/env bash
set -euo pipefail

dotfiles=(
    .bash_aliases
    .bashrc
    .gitconfig
    .gitignore
    .hushlogin
    .npmrc
    .vimrc
    .zshrc
)

source_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
home_dir="$(cd -- "$HOME" && pwd -P)"

printf 'WARNING: This will replace matching dotfiles in %s with symlinks to %s.\n' "$home_dir" "$source_dir"
printf 'Existing files and symlinks will be copied to a new backup folder first.\n'
printf 'Directories and non-dotfiles (including mac-brew.sh) will not be installed.\n'

if [[ "$source_dir" == "$home_dir" ]]; then
    printf 'Error: Keep this repository outside your home directory itself.\n' >&2
    exit 1
fi

for dotfile in "${dotfiles[@]}"; do
    source="$source_dir/$dotfile"
    if [[ ! -f "$source" ]]; then
        printf 'Error: Missing dotfile or source is not a regular file: %s\n' "$source" >&2
        exit 1
    fi
    target="$home_dir/$dotfile"
    if [[ -e "$target" && ! -f "$target" && ! -L "$target" ]]; then
        printf 'Error: Refusing to replace a directory or special file: %s\n' "$target" >&2
        exit 1
    fi
done

backup_dir="$(mktemp -d "$home_dir/.homeprofiles-backup.XXXXXXXX")"
printf 'Backup folder: %s\n' "$backup_dir"

for dotfile in "${dotfiles[@]}"; do
    target="$home_dir/$dotfile"
    if [[ -e "$target" || -L "$target" ]]; then
        cp -pP "$target" "$backup_dir/"
    fi
done

for dotfile in "${dotfiles[@]}"; do
    source="$source_dir/$dotfile"
    target="$home_dir/$dotfile"
    rm -f "$target"
    ln -s "$source" "$target"
    printf 'Linked %s -> %s\n' "$target" "$source"
done

printf 'Installation complete. Backups are in %s\n' "$backup_dir"
