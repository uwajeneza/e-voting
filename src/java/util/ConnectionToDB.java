package util;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author UWAJENEZA Nicole
 */
public class ConnectionToDB {
    public Connection con = null;
    public PreparedStatement ps = null;
    public ResultSet rs = null;
    public Statement s = null;
    
    public void getConnection(){
        try {
//            registration of mysql jdbc driver
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/class?","root","");
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void getDisconnection(){
    if(con!=null){
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    if(ps!=null){
        try {
            ps.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    if(rs!=null){
        try {
            rs.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    if(s!=null){
        try {
            s.close();
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        }
    }
}