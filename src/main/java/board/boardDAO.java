package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class boardDAO {

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
	
	public void write(boardDTO bt) {		
		try {
			con = getConnection();
			String sql = "insert into board (title, content, id, filename) values (?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bt.getTitle());
			psmt.setString(2, bt.getContent());
			psmt.setString(3, bt.getId());
			psmt.setString(4, bt.getFilename());
			psmt.executeUpdate();
			System.out.println("Write Success");
		} catch (Exception e) {
			System.out.println("write error => " + e.getMessage());
		} finally {
			try {
				con.close();
				psmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	
	public String makeList() {
		String line = "";
		int num = 0;
		String title = "";
		String id = "";
		String content = "";
		String filename = "";
		try {
			con = getConnection();
			String sql = "select * from board";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				num = rs.getInt("num");
				title = rs.getString("title");
				id = rs.getString("id");
				filename = rs.getString("filename");
				content = rs.getString("content");
//				String newLine = 
//						"<tr><td><a href='ReadForm.jsp?num="+num+"'>"+num+"</a></td>" +
//						"<tr><td>"+id+"</td>"
//						+ "<td><a href='ReadForm.jsp?num="+num+"'>"+title+"</a></td>"
//						+ "<td><a href='ReadForm.jsp?num="+num+"'>" 
//						+ "<img src='./upload/" + filename + "' style='max-width:300px;'></a></td>" // 상대 경로(현재 폴더인 .을 꼭 찍어야 함)
//						+ "<td><a href='FileDown.jsp?filename=" + filename + "'>사진 받기</a></td></tr>";
//						+ "<td>"+content+"</td></tr>";
				String newLine = "<div width='80%'><a href='ReadForm.jsp?num="+num+"'><img src='./upload/" + filename + "' style='max-width:300px; margin:10px'></a>"
						         + "<br><span><a href='FileDown.jsp?filename=" + filename + "'>사진 받기</a></span>"
								 + "&nbsp;&nbsp;&nbsp;&nbsp;<button class='heart'>좋아요</button><span class='plus'></span></div>";
				line += newLine;
			}
		} catch (Exception e) {
			System.out.println("makeList error => " + e.getMessage());
		} finally {
			try {
				con.close();
				psmt.close();
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return line;	
	}
	
	
	public boardDTO read(int num) {		
		boardDTO bt = new boardDTO();
		try {
			con = getConnection();
			String sql = "select * from board where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			if(rs.next())
			{
				bt.setNum(rs.getInt("num"));
				bt.setTitle(rs.getString("title"));
				bt.setContent(rs.getString("content"));
				bt.setId(rs.getString("id"));
				bt.setFilename(rs.getString("filename"));
			}
			System.out.println("read Success");
		} catch (Exception e) {
			System.out.println("read error => " + e.getMessage());
		} finally {
			try {
				con.close();
				psmt.close();
				rs.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return bt;
	}
	
	public boolean delete(int num) {
		try {
			con = getConnection();
			String sql = "delete from board where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("delete error => " + e.getMessage());
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
	
	public void update(boardDTO bt) {		
		try {
			con = getConnection();
			String sql = "update board set title=?, content=?, filename=? where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bt.getTitle());
			psmt.setString(2, bt.getContent());
			psmt.setString(3, bt.getFilename());
			psmt.setInt(4, bt.getNum());
			psmt.executeUpdate();
			System.out.println("Update Success");
		} catch (Exception e) {
			System.out.println("update error => " + e.getMessage());
		} finally {
			try {
				con.close();
				psmt.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	public int getLastNum() {
		try {
			con = getConnection();
			String sql = "select max(num) from board";
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getLatNum error => " + e.getMessage());
			return -1;
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
