#!/bin/bash
set -ueo pipefail

declare -a fonts=(
    CascadiaCove
    FiraCode
    # FiraMono
    JetBrainsMono
)

fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

echo -e "\e[0;32mScript:\e[0m \e[0;34mClonning\e[0m \e[0;31mNerdFonts\e[0m \e[0;34mrepo (sparse)\e[0m"
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts

for font in "${fonts[@]}"; do
    echo -e "\e[0;32mScript:\e[0m \e[0;34mClonning font:\e[0m \e[0;31m${font}\e[0m"
    git sparse-checkout add "patched-fonts/${font}"
    echo -e "\e[0;32mScript:\e[0m \e[0;34mInstalling font:\e[0m \e[0;31m${font}\e[0m"
    ./install.sh "${font}"
done

echo -e "\e[0;32mScript:\e[0m \e[0;34mCleaning the mess...\e[0m"
cd ../
rm -rf nerd-fonts
