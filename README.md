# easy-nginx-docker
Quick, easy-to-use nginx setup. Put your html/css/js files in the project root to serve them.

## Requirements
You need to have Docker installed

## Usage
```
git clone https://github.com/bkestelman/easy-nginx-docker
```
Copy your website files (index.html, css, js, etc.) into easy-nginx-docker/, then run:
```
bash run.sh tag [port] # replace 'tag' with whatever tag you want for the docker image 
```

Modifying your site files in easy-nginx-docker/ will change your site in real time. 

You can run multiple containers on different ports using the same tag. 

To run different versions of your site at the same time, clone easy-nginx-docker again (rename the first one) copy a different version of your site there, and run the script as above. 

## Feedback
Please open an issue to report a bug or request a feature. The goal of this project is to make setting up a site as quick and easy as possible!
