
Get-ChildItem -Recurse -Path .\bucket | ForEach-Object -Process {
    $content=Get-Content $_.FullName
    if ($content -match 'ghfast.top') {
        # 如果包含，则输出消息并跳出循环
        Write-Output "文本中包含 'ghfast.top'，进行下一个。"
        return
    }
    # GitHub Releases
    (Get-Content $_.FullName) -replace '(github\.com/.+/releases/.*download)', 'ghfast.top/https://$1' | Set-Content -Path $_.FullName

    # GitHub Archive
    (Get-Content $_.FullName) -replace '(github\.com/.+/archive/)', 'ghfast.top/https://$1' | Set-Content -Path $_.FullName

    # GitHub Raw
    (Get-Content $_.FullName) -replace '(raw\.githubusercontent\.com)', 'ghfast.top/https://$1' | Set-Content -Path $_.FullName
    (Get-Content $_.FullName) -replace '(github\.com/.+/raw/)', 'ghfast.top/https://$1'          | Set-Content -Path $_.FullName

    # SourceForge
    # Use jaist
    # (Get-Content $_.FullName) -replace '(//downloads\.sourceforge\.net/project/.+)(\")', '$1?use_mirror=jaist$2' | Set-Content -Path $_.FullName
    # (Get-Content $_.FullName) -replace '(#/.+)(\?use_mirror=jaist)', '$2$1' | Set-Content -Path $_.FullName
    # (Get-Content $_.FullName) -replace '(//sourceforge\.net/projects/.+/files/.+)(\")', '$1/download?use_mirror=jaist$2' | Set-Content -Path $_.FullName
    # (Get-Content $_.FullName) -replace '(#/.+)(/download\?use_mirror=jaist)', '$2$1' | Set-Content -Path $_.FullName
    # Or use zenlayer

    # KDE Apps
    (Get-Content $_.FullName) -replace 'download\.kde\.org', 'mirrors.ustc.edu.cn/kde' | Set-Content -Path $_.FullName

    # 7-Zip
    (Get-Content $_.FullName) -replace 'www\.7-zip\.org/a', 'mirror.nju.edu.cn/7-zip' | Set-Content -Path $_.FullName

    # LaTeX, MiKTeX
    (Get-Content $_.FullName) -replace '(miktex\.org/download/ctan)|(mirrors.+/CTAN)', 'mirrors.aliyun.com/CTAN' | Set-Content -Path $_.FullName

    # Node
    (Get-Content $_.FullName) -replace 'nodejs\.org/dist', 'npmmirror.com/mirrors/node' | Set-Content -Path $_.FullName
    # Or
    # (Get-Content $_.FullName) -replace 'nodejs\.org/dist', 'mirrors.aliyun.com/nodejs-release' | Set-Content -Path $_.FullName

    # Python
    (Get-Content $_.FullName) -replace 'www\.python\.org/ftp/python', 'npmmirror.com/mirrors/python' | Set-Content -Path $_.FullName

    # Go
    (Get-Content $_.FullName) -replace 'dl\.google\.com/go', 'mirrors.aliyun.com/golang' | Set-Content -Path $_.FullName

    # VLC
    (Get-Content $_.FullName) -replace 'download\.videolan\.org/pub', 'mirrors.aliyun.com/videolan' | Set-Content -Path $_.FullName

    # Inkscape
    (Get-Content $_.FullName) -replace 'media\.inkscape\.org/dl/resources/file', 'mirrors.nju.edu.cn/inkscape' | Set-Content -Path $_.FullName

    # DBeaver
    (Get-Content $_.FullName) -replace 'dbeaver\.io/files', 'ghfast.top/https://github.com/dbeaver/dbeaver/releases/download' | Set-Content -Path $_.FullName
    # Or
    # (Get-Content $_.FullName) -replace 'dbeaver\.io/files', 'mirrors.nju.edu.cn/github-release/dbeaver/dbeaver' | Set-Content -Path $_.FullName

    # OBS Studio
    (Get-Content $_.FullName) -replace 'cdn-fastly\.obsproject\.com/downloads/OBS-Studio-(.+)-Windows\.zip', 'ghfast.top/https://github.com/obsproject/obs-studio/releases/download/$1/OBS-Studio-$1-Windows.zip' | Set-Content -Path $_.FullName
    # Or
    # (Get-Content $_.FullName) -replace 'cdn-fastly\.obsproject\.com/downloads/OBS-Studio-(.+)-Windows\.zip', 'mirrors.nju.edu.cn/github-release/obsproject/obs-studio/OBS%20Studio%20$1/OBS-Studio-$1-Windows.zip' | Set-Content -Path $_.FullName
    # (Get-Content $_.FullName) -replace 'cdn-fastly\.obsproject\.com/downloads/OBS-Studio-(.+)-Windows\.zip', 'mirrors.tuna.tsinghua.edu.cn/github-release/obsproject/obs-studio/OBS%20Studio%20$1/OBS-Studio-$1-Windows.zip' | Set-Content -Path $_.FullName

    # OBS Studio 2.7
    (Get-Content $_.FullName) -replace 'cdn-fastly\.obsproject\.com/downloads/OBS-Studio-(.+)-Full', 'ghfast.top/https://github.com/obsproject/obs-studio/releases/download/$1/OBS-Studio-$1-Full' | Set-Content -Path $_.FullName

    # GIMP
    (Get-Content $_.FullName) -replace 'download\.gimp\.org/mirror/pub', 'mirrors.aliyun.com/gimp' | Set-Content -Path $_.FullName

    # Blender
    (Get-Content $_.FullName) -replace 'download\.blender\.org', 'mirrors.aliyun.com/blender' | Set-Content -Path $_.FullName

    # VirtualBox
    (Get-Content $_.FullName) -replace 'download\.virtualbox\.org/virtualbox', 'mirrors.nju.edu.cn/virtualbox' | Set-Content -Path $_.FullName

    # Wireshark
    # (Get-Content $_.FullName) -replace 'www\.wireshark\.org/download', 'mirrors.nju.edu.cn/wireshark' | Set-Content -Path $_.FullName

    # Lunacy
    (Get-Content $_.FullName) -replace 'lun-eu\.icons8\.com/s/', 'lcdn.icons8.com/' | Set-Content -Path $_.FullName

    # Strawberry
    (Get-Content $_.FullName) -replace 'files\.jkvinge\.net/packages/strawberry/StrawberrySetup-(.+)-mingw-x', 'ghfast.top/https://github.com/strawberrymusicplayer/strawberry/releases/download/$1/StrawberrySetup-$1-mingw-x' | Set-Content -Path $_.FullName

    # SumatraPDF
    (Get-Content $_.FullName) -replace 'files\.sumatrapdfreader\.org/file/kjk-files/software/sumatrapdf/rel', 'www.sumatrapdfreader.org/dl/rel' | Set-Content -Path $_.FullName

    # Vim
    (Get-Content $_.FullName) -replace 'ftp\.nluug\.nl/pub/vim/pc', 'mirrors.ustc.edu.cn/vim/pc' | Set-Content -Path $_.FullName

    # Cygwin
    (Get-Content $_.FullName) -replace '//.*/cygwin/', '//mirrors.aliyun.com/cygwin/' | Set-Content -Path $_.FullName

    # Tor Browser, Tor
    # Or
    # https://tor.ybti.net/dist/
    # https://mirror.freedif.org/TorProject/dist
    # https://mirror.oldsql.cc/tor/dist/
    # https://tor.zilog.es/dist/
    # https://torproject.ph3x.at/dist/
    # https://www.eprci.com/tor/dist/
    # https://tor.calyxinstitute.org/dist/
    # https://torproject.mirror.metalgamer.eu/dist/
    # https://cyberside.net.ee/sibul/dist/
    (Get-Content $_.FullName) -replace 'archive\.torproject\.org/tor-package-archive', 'tor.ybti.net/dist' | Set-Content -Path $_.FullName

    # FastCopy
    (Get-Content $_.FullName) -replace 'fastcopy\.jp/archive', 'ghfast.top/https://raw.githubusercontent.com/FastCopyLab/FastCopyDist2/main' | Set-Content -Path $_.FullName

    # Kodi
    (Get-Content $_.FullName) -replace 'mirrors\.kodi\.tv', 'mirrors.tuna.tsinghua.edu.cn/kodi' | Set-Content -Path $_.FullName

    # Typora
    (Get-Content $_.FullName) -replace 'download\.typora\.io', 'download2.typoraio.cn' | Set-Content -Path $_.FullName

    # Scripts
    (Get-Content $_.FullName) -replace '(bucketsdir\\\\).+(\\\\scripts)', '$1scoop-cn$2' | Set-Content -Path $_.FullName

    # 将 suggest 路径改为 scoop-cn
    (Get-Content $_.FullName) -creplace '\"main/|\"extras/|\"versions/|\"nirsoft/|\"sysinternals/|\"php/|\"nerd-fonts/|\"nonportable/|\"java/|\"games/', '"scoop-cn/' | Set-Content -Path $_.FullName

    # 将 depends 路径改为 scoop-cn
    (Get-Content $_.FullName) -replace '\"depends\":\s*\"(scoop\-cn/)?', '"depends": "scoop-cn/' | Set-Content -Path $_.FullName
}
