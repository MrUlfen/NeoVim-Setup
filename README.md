# NeoVim-Setup

1. install neovim from this link https://github.comneovimneovimblobmasterINSTALL.md

2. or you can install Chocolatey (witch is recomanded -- its basicly a package downlaoder you can also install NEOVIM that way by tying (-- choco install neovim --) ) by opening windows PowerShell in ADministrator mode and enter this and folow the steps Yes To ALL
3.  ( here is the thing you put in PowerShel) --- Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]SecurityProtocol = [System.Net.ServicePointManager]SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('httpscommunity.chocolatey.orginstall.ps1'))

4. install git and folow the install instructions (link) --- https://git-scm.comdownloads

5. install nerfonts the one i use is called Caskaydia Mono NerdFont (Link) --- https://www.nerdfonts.comfont-downloads --- (( this is for some plugins and its recuired after its installed go in to Command Prompt and powershell and or you can click the wheel cog
   and scrol down and open appearance in the FONT FACE choose the newly instaled caskaydia nerd font on both Command Prompt and powershell.
6. before booting up NeoVim you need to add neovim to system variable or user variable -- to do this go down left corner to the search bar search for
   environment variables after that i presume you dont have acces to edit system variables so on top in user vasrtiables klick on the one that says PATH and click edit now iwant you to check if there already is a name that has neovim i nther if yes you can
   avoid this step. if it isnt there add a new variable and ad the path to nvim it should look something like this --- (Ctoolsneovimnvim-win64bin)
7. now you should be done
8. now iside this git repository ther eis a nvim folder inside it it should have a init.lua download that and go t o %appdata% and go to local scrol down if you dont se nvim folder create one and pase init.lua in there
9. open nvim folder and copy the filepatch go inside cmd and type --- cd and the file location should end with nvim.
10. now you can type nvim init.lua and yo ushould see a bunch of code click smeicolon this one  and type wq that  means save and quit open nvim init.lua again and type PlugInstall and after everything is isntalled you close entire cmd
    and open the file location of nvim and and type nvim init.lua again now if everything should be isntalled hopefully without errors 



11. now all plugins wil install after that is done close cmd and re-open it and open nvim again ind command prompt bytyping nvim if everything is installed as follows everything should be okay with no error
   if errors appear send me a message and i can correct it i may have forgotten somthing because i cant remember eactly the order idownlaoded everything (if yo ucant reatch me) copy the error code you get when yopu start up nvim and ask ChatGPT for helip and its    
   cruchial that you spesify that yo uare using wiondows and editing in windows nevim
