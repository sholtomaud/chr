set GITHUB_GIT=C:\Users\smaud\AppData\Local\GitHub\PortableGit_054f2e797ebafd44a30203088cd3d58663c627ef
set GITHUB_POSH_GIT=C:\Users\smaud\AppData\Local\GitHub\PoshGit_8aecd991d8ccf3dc78b8cd397ee4e1595f8556d4
set GITHUB_SHELL=true
set GIT_INSTALL_ROOT=C:\Users\smaud\AppData\Local\GitHub\PortableGit_054f2e797ebafd44a30203088cd3d58663c627ef
set POSH_GIT=C:\Users\smaud\AppData\Local\GitHub\PoshGit_8aecd991d8ccf3dc78b8cd397ee4e1595f8556d4\profile.example.ps1
set PATH=%PATH%;C:\Program Files (x86)\Git\bin;C:\Dev\chr\
set HOME=C:\Dev\
rem set INICHR=S:\Hydstra\prod\hyd\dat\ini\chr\
set INICHR=C:\temp\inichrtest\
#set PERL_MB_OPT=--install_base C:\temp\test\
set PERL_MM_OPT=INSTALL_BASE=S:/Hydstra/prod/hyd/dat/ini/chr
#set INSTALL_BASE=C:\temp\test\

set drive=%CD:~0,2%
title %drive%

start %drive%/Dev/chr/console2/console.exe

