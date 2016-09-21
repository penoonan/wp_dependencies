#Uniqify Some 3rd Party PHP libs

##The problem
Wordpress plugins can't safely use 3rd party libraries from Composer because the versions of the libraries they use could conflict with the versions _other_ plugins are using. [Here, see](http://wordpress.stackexchange.com/a/175394)
 
##The solution
Create a shell script to prefix all the top level namespaces with a unique string of your choosing. A derivation of your plugin name, perhaps?

This repo mostly serves as a proof of concept. It's dirty as hell both in spirit and in execution. It won't work on all operating systems. I'm using a Mac with Bash 4.4. I had to install perl's `rename` command separately. Kinda bullshit IMO but there you have it.

Clone this project, navigate to the root directory and type the command `bash wp_dependencies.sh [MyUniqueString]`

Your unique string should contain no spaces or special characters - it's going into filenames and php namespaces.

So yeah, once you've done that, just sit back and watch the magic happen. Woo woo.

Play around in `index.php`. It presumes the prefix `pno`. Change that to whatever you used. Run a little `php -S localhost:8080` and navigate there to see the fruits of your labor.

Oh yeah - if you want to add new dependencies, you need to add their top level namespace to the `namespaces` array in `wp_dependencies.sh`;

Thanks for reading. Keep it sleazy.