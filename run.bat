mkdir CircleRound
mkdir tmp
cd tmp
call ..\type.bat
copy ..\download\*.mp3
call ..\rename.bat
move *-*.mp3 ..\CircleRound
cd..
