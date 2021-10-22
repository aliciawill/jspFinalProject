package shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReplyDAO {
	Connection con;

	public ReplyDAO() {
		try {
			// 1.�ٿ�ε� �޾Ҵ� connector����
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("1.connector���� ok..");

			// 2.�������� ����� ������ �̿��ؼ� ����
			String url = "jdbc:mysql://localhost:3306/shop8";
			String user = "root";
			String password = "1234";
			con = DriverManager.getConnection(url, user, password);
			System.out.println("2.db���� ok.. ");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ReplyDTO> list(BbsDTO dto) {
		
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();
		//list�� ��� ���� �������.
		//�迭�� ����� �̸� ������ ����.
		//int[] num = new int[10];
		
		ReplyDTO dto2 = null; 
		//������ ��ġ�� ������ ����� �� �ִ� ����!
		//select�޼ҵ� ������������ �� �� �ִ� ��������
		//�������� = local����
		
		try {
			String sql = "select * from reply where bbsid = ?"; // �ش��ϴ� class�� ������� ������,
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId()); //bbs�� id
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				dto2 = new ReplyDTO();
				String id = rs.getString(1);
				String bbsid = rs.getString(2);
				String content = rs.getString(3);
				String writer = rs.getString(4);
				dto2.setId(id);
				dto2.setBbsid(bbsid);
				dto2.setContent(content);
				dto2.setWriter(writer);
				list.add(dto2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	} //method
	
	
	public void insert(ReplyDTO dto) {
		try {
			String sql = "insert into reply(bbsid, content, writer) values (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getBbsid());
			ps.setString(2, dto.getContent());
			ps.setString(3, dto.getWriter());
			System.out.println("3. SQL�� ����� ok...");
			ps.executeUpdate();
			System.out.println("4. SQL�� DB�� ���� ok...");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
