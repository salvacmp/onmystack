#!/bin/bash

set -o errexit

verify_npm(){
    curl -sIk http://localhost:81/login | grep -i openresty
    if [ ${?} = 0 ]; then
        echo '[O]  https://localhost:81/'
    else
        echo '[X]  https://localhost:81/'
        exit 1
    fi          
}    

verify_page(){
    curl -sIk http://localhost:80/ | grep -i openresty
    if [ ${?} = 0 ]; then
        echo '[O]  http://localhost:80/' 
    else
        echo '[X]  http://localhost:80/'
        exit 1
    fi            
}


main(){
    verify_npm
    verify_page
}
main
