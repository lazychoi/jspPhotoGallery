package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class memberDAO {
	
	private Connection con;
	private PreparedStatement psmt;
	private ResultSet rs;
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/photoDB";
			String user = "root";
			String pw = "1234567890";
			con = DriverManager.getConnection(url, user, pw);
			System.out.println("DB Connected");
			return con;
		} catch(ClassNotFoundException e) {
			System.out.println(e.getMessage());
			System.out.println("Cannot Load JDBC Driver");
			return null;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
			System.out.println("Cannot Connect DB");
			return null;
		}
	}
	
	public void writeMember(memberDTO mt) {
		
		try {
			con = getConnection();
			String sql = "insert into member (id, password, email) values (?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, mt.getId());
			psmt.setString(2, mt.getPassword());
			psmt.setString(3, mt.getEmail());
			psmt.executeUpdate();
			System.out.println("Write Success");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				con.close();
				psmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public boolean checkMember(String id, String pw) {

		try {
			con = getConnection();
			String sql = "Select * from member where id=? and password=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if(rs.next())
				return true;
			else
				return false;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		} finally {
			try {
				con.close();
				psmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	

}
