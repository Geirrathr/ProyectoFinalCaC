
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Persistencia {

    private Connection cn;
    private ResultSet rs;
    private PreparedStatement ps;
    private Statement s;
    private ResultSetMetaData rsm;

    public String servidor, basededatos, usuario, clave, ejecutar;

    public Connection conectarse() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            servidor = "localhost:3306/";
            basededatos = "proyecto-final-cac";
            usuario = "root";
            clave = "";

            cn = DriverManager.getConnection("jdbc:mysql://" + servidor + basededatos
                    + "?autoReconnect=true&useSSL=false", usuario, clave);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Persistencia.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Persistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cn;
    }

    public ResultSet consultaSQL(String busqueda) {
        try {
            ps = conectarse().prepareStatement(busqueda);
            rs = ps.executeQuery();
            rsm = rs.getMetaData();
        } catch (SQLException ex) {
            Logger.getLogger(Persistencia.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
    }

    //retorna la cantidad de líneas modificadas en la base de datos, 0 si no modifica nada
    public int insertSQL(String query) {
        int lineas = 0;

        try {
            lineas = conectarse().prepareStatement(query).executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Persistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lineas;
    }
}
