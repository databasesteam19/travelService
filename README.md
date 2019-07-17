# travelService
How to setup and run the local instance of AirportLocal:

Programs:
-Eclipse Enterprise Edition (Latest)
-Tomcat 9
-MySql Community Edition
-MySql Workbench (Reccomended)
-JDBC MySql Connector (.jar file)

Setting up Tomcat 9:
1. Download and extract whatever archive format works with your OS.
2. Following the running.txt file included in the Apache tomcat folder, create an environment varibale called CATALINA_HOME which points to the extracted Apache Tomcat folder (NOT bin etc...).
3. Make sure to check/create a JAVA_HOME environment variable which points to the Java JDK home directory for the version you wish to use with Tomcat.
4. Run tomcat as per the instructions in the running.txt file as a TEST, if you get any errors recheck your environment varibles.
5. Make sure to SHUTDOWN your Tomcat test, since from now on you'll be running Tomcat locally via eclipse.

Making the AirportLocal Project in Eclipse:
1. Go to file->new->other->server->server-> then pick your apache tomcat version and create it with the either custom or defualt settings (e.g. localhost:8080 as the http server or whatever port you want).
2. Open the server view by going to window->show view->servers or window->show view->other->servers.
3. Double click on your newly created tomcat server to open the config page and while the server is STOPPED, under Server Locations, click the radio button that says "Use Tomcat Installation".. and save the server, (this gets rid of some 404 errors).
4. Create a new Dynamic Web Project by going to file->new->Dynamic Web Project and name it AirportLocal, in the intial settings change the "target runtime" to your Apache version (e.g. ApacheTomcat v9.0) and click finish.
5. Download the JDBC connector file and extract the connector .jar, add the jar file as an external resource in your project by right click the project->build path->configure build parth->libraries->add external jars and find the connector jar you downloaded, add it with a meaningful name to your project library. Copy the jar file in a file explorer (e.g. outside of eclipse) and put a copy in the lib folder of your tomcat installation.
6. Copy the java files from the src folder of the AirportLocal.zip into the JavaResources->src folder of your project. Note that you may have to manually repackage them since they are in com.web.connections and com.web.controllers respectively. 
7. Copy the html, css, js, and jsp folders from AirportLocal.zip->WebContent into the WebContent folder fo your project. At this point all the files you need should be in the project.
8. Go through each of the html, jsp and java files to make sure the paths specified are valid for your setup. In the html files the paths to check will be in the <link>, <script>, and <form> tags. In the jsp files the pats will be part of a RequestDispatcher initialization. In the java files, the paths will also be part of a RrequestDispatcher intialization.
9. Go through the sql queries in the jsp files which will be in a prepareStatement or an executeUpdate, and change them to match your database implementation.
10. In the DBConnection.java file, read the comments and change the names/urls to match your MySql database.
11. Link your project with the tomcat server by right clicking the server in the servers view, clicking on Add/Remove and adding your prject to the servers resource list.
12. Start the tomcat server by right clicking it in the server view and hitting start. Check the console for any sever-breaking errors.
13. Open the register-form.html file and run it, a dialouge will pop up asking where to run it, select your tomcat server and hit finish. If your see an error 404, that usually means that there is something wrong with your paths, or your tomcat config. Make sure to not add any web.xml or context.xml files unless completely nessicary.
 
