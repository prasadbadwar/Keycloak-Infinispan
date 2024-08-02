<---------Info------------>
-This project is configured & setup for cross-site communications between keycloak and Infinispan to acheived active-active setup.
-In this project, there are two sites LON and NYC and on each site there are two instance of Infinispan (primary and replica) and one keycloak instance simultaneously.
-All instances running on same network i.e. mynetwork.
-Version used for Keycloak is v21.0(docker keycloak image) and infinispan v15.0(quay.io/infinispan/server:15.0)
-Mysql is not required. If need to use external database that time only can uncomment the DB service(mysql/postgresql)




<-------RUN THE PROJECT---------->
NOTE: Docker is required to run the project.

Need to download and place the required jar files below.
-org.keycloak.keycloak-common-21.0.2.jar
-org.keycloak.keycloak-core-21.0.2.jar
-org.keycloak.keycloak-model-infinispan-21.0.2.jar
-org.keycloak.keycloak-model-infinispan-25.0.1.jar
-org.keycloak.keycloak-server-spi-21.0.2.jar
-org.keycloak.keycloak-server-spi-private-21.0.2.jar
-org.keycloak.keycloak-services-21.0.2.jar
-mysql-connector-j-8.0.31.jar
-postgresql-42.7.3.jar

1]open cmd on project directory location
2]Run 'docker-compose up' or 'docker-compose up -d' command in CMD.
3]To stop docker or terminate run 'docker-compose down' command in CMD.
4] open browser and hit below url->
    1]https://localhost:8443/     ---for LON keycloak (Username:admin   Pass:admin)
    2]https://localhost:443/      ---for NYC keycloak (Username:admin   Pass:admin)
    3]https://localhost:11222     ---for LON Infinispan(Primary) (Username:admin   Pass:passsword)
    4]https://localhost:11221     ---for LON Infinispan(Backup/replica) (Username:admin   Pass:passsword)
    5]https://localhost:31222     ---for NYC Infinispan(Primary) (Username:admin   Pass:passsword)
    6]https://localhost:31223     ---for NYC Infinispan(Backup/replica) (Username:admin   Pass:passsword)

5]After successful login into keycloak, you can see cache stored in clientsession in infinispan




<---------Commands------------>
#Self signed certificate
openssl req -newkey rsa:2048 -nodes -keyout keycloak.key -x509 -days 3650 -out keycloak.crt -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/CN=myapp.com"




<------Error & Solutions----------->
*error:Unknown Host exception
solution:Put the host name in infinispan-xsite file same as the service name mention in docker file of infinispan instance for e.g.infinispan-server-nyc-1 

*error:WARN  [org.infinispan.HOTROD] (Thread-0) ISPN004005: Error received from the server: org.infinispan.commons.CacheException: ISPN000936: Class 'org.keycloak.cluster.infinispan.WrapperClusterEvent' blocked by deserialization allow list. Adjust the configuration serialization allow list regular expression to include this class.
solution: need to add <serialization> tag in infinispan-xsite.xml file/infinispan.xml
