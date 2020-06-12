function copy () {
    cp ~/.config/$1 config $2
}

copy latte -r
copy fontconfig -r
copy fish -r
copy touchpadxlibinputrc
copy plasmashellrc
copy plasma-org.kde.plasma.desktop-appletsrc
copy mimeapps.list
copy libinput-gestures.conf
copy lattedockrc
copy kwinrulesrc
copy kwinrc
copy krunnerrc
copy konsolerc
copy khotkeysrc
copy kglobalshortcutsrc
copy kfontinstuirc
copy kdialogrc
copy kdeglobals
copy gtkrc-2.0
copy gtkrc
copy dolphinrc
copy breezerc
