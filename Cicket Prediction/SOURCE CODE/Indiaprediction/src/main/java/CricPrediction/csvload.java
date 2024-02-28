/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CricPrediction;

/**
 *
 * @author Beast
 */
import java.sql.Connection;
import java.sql.Statement;
 
 
public class csvload
{
    public static void main(String[] args)
    {
          
            readCsvUsingLoad();
    }
 
   
        private static void readCsvUsingLoad()
    {
        try (Connection connection = SQLconnection.getconnection())
        {
            
            String filepath="D:\\upload.csv";
 
                String loadQuery = "LOAD DATA LOCAL INFILE 'D:\\Test\\upload.csv' \n" +
"INTO TABLE odidata \n" +
"FIELDS TERMINATED BY ',' \n" +
"ENCLOSED BY '\"'\n" +
"LINES TERMINATED BY '\\n'\n";
                System.out.println(loadQuery);
                Statement stmt = connection.createStatement();
                stmt.execute(loadQuery);
        }
        catch (Exception e)
        {
                e.printStackTrace();
        }
    }
 
}