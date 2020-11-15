# Ruby on Rails on Passenger on Docker on Google Cloud Run Test App 

Passenger Nginx is my favourite Rails web server, and Google Cloud Run 
looks like the ideal hosting platform, but I couldn't find any examples 
of them working together so I built one.

This repository comes from the book source code described below,
and I have modified it to launch on Cloud Run. 

There are several issues solved here, including :

* templating the nginx config to use the specified PORT
* disabling the internal syslog, because it clashes with Cloud Run
* installing debugging tools
* updating to Ruby 2.5
* using the base docker image init system
 

Please note: I'm not concerned about it fully working, and so I haven't 
got the database connection working, but it probably will. 

\- Gary McGhee, Buzzware Solutions


# Apress Source Code

This repository accompanies [*Deploying Rails with Docker, Kubernetes and ECS*](http://www.apress.com/9781484224144) by Pablo Acu�a (Apress, 2016).

![Cover image](9781484224144.jpg)

Download the files as a zip using the green button, or clone the repository to your machine using Git.

## Releases

Release v1.0 corresponds to the code in the published book, without corrections or updates.

## Contributions

See the file Contributing.md for more information on how you can contribute to this repository.
