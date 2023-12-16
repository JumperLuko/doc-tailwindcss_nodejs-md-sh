#!/bin/bash

##~ Basic packages

# sudo dnf install nodejs

# ext install bradlc.vscode-tailwindcss

# ext install ritwickdey.LiveServer

##~ functions

enterContinue () {
    echo ""
    read -p "Press edit now"
    nano $fileEdit
    echo ""
}

##~ Basic files

read -p "Please check if you have the nodejs installed, and press enter"
echo "Creating Folders and Files"

mkdir public
touch ./public/index.html
mkdir src
touch ./src/input.css

npm init -y
npm install -D tailwindcss
npx tailwindcss init

##~ Adjusting files

echo "Adjusting files"

echo "@tailwind base;" >> ./src/input.css
echo "@tailwind components;" >> ./src/input.css
echo "@tailwind utilities;" >> ./src/input.css

echo ""
fileEdit="./tailwind.config.js"
echo "Please copy the commando bellow, to put in line 3 ($fileEdit)"
echo 'content: ["./public/*.html"],'
enterContinue

echo ""
fileEdit="./public/index.html"
echo '<!DOCTYPE html>' >> $fileEdit && echo '<html lang="en">' >> $fileEdit && echo '<head>' >> $fileEdit && echo '    <meta charset="UTF-8">' >> $fileEdit && echo '    <meta name="viewport" content="width=device-width, initial-scale=1.0">' >> $fileEdit && echo '    <title>Tailwind CSS Installation</title>' >> $fileEdit && echo '    <link rel="stylesheet" href="style.css">' >> $fileEdit && echo '</head>' >> $fileEdit && echo '<body class="bg-yellow-500">' >> $fileEdit && echo '    <h1 class="text-black">Tailwind css</h1>' >> $fileEdit && echo '</body>' >> $fileEdit && echo '</html>' >> $fileEdit
echo "I insert in $fileEdit the head tag"
echo '<link rel="stylesheet" href="style.css">'

echo ""
fileEdit="./package.json"
echo "Please copy the commando bellow in line 6 you see "scripts": {. bellow put that line ($fileEdit)"
echo '"build": "tailwindcss -i ./src/input.css -o ./public/style.css --minify --watch"'
enterContinue

echo "now run"
echo "npm run build"
echo ""
echo "Making the first compile"
npx tailwindcss -i ./src/input.css -o ./public/style.css --minify
read -p "and run your live server. Enter to close all"