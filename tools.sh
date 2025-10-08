#!/bin/bash
TOOLS=(
    "git"           
    "curl"          
    "wget"          
    "unzip"         
    "zip"           
    "vim"           
    "tmux"          
    "net-tools"     
    "htop"          
)

check_root() {
    if [[ $EUID -ne 0 ]]; then
        exit 1
    fi
}

main_install() {
    check_root

    if ! apt update; then
        exit 1
    fi

    for tool in "${TOOLS[@]}"; do
        if apt install -y "$tool" > /dev/null 2>&1; then
        else
        fi
    done

    apt autoremove -y
    apt clean

}
main_install
exit 0
