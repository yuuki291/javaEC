package javaweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MySQLDatabase {

	 private String jndiName;


     public MySQLDatabase(String jndiName) {

    	 this.jndiName = jndiName;

     }

     public Connection connect() throws SQLException{

    	 Connection conn = null;


    	 try {

    		 DataSource ds = InitialContext.doLookup("java:comp/env/" + jndiName);
    		 conn = ds.getConnection();

    	 }catch (NamingException e) {

    		 String url = "jdbc:mysql://localhost:3306/javaweb?characterEncoding=UTF-8&serverTimezone=JST&autoReconnect=true&useSST";
             String user = "root";
             String password = "Matuura1";


             conn = DriverManager.getConnection(url, user, password);
    	 }
           return conn;
     }

}
