#!/bin/bash

#delete current stuff and update dependencies
rm composer.lock
rm -rf vendor
composer update --no-dev

# loop through dependencies and update namespaces
# to prevent namespace collisions with other plugins

unique=$1
namespaces=("League" "Doctrine" "Interop" "GuzzleHttp" "Carbon" "Psr" "Symfony")
for old in ${namespaces[@]}
do
    new=$unique$old
    regex="s/$old/$new/g"

    echo "Changing $old to $new"

    LC_ALL=C

    # all instances of the text inside files
    find ./vendor -type f -exec sed -i -e "$regex" {} \;

    #all instances of the text in directory names
    find ./vendor -type d -name "$old" -depth -exec rename $regex {} +

    #all instances of the text in file names
    find ./vendor -type f -name '*'$old'*' -execdir bash -c 'mv {} "$(echo {} | sed -e 's/$old/$new/g')"' {} \;

    # delete these files the command leaves behind ...

    find ./vendor -name "*-e" -type f -delete
done

composer dump-autoload
