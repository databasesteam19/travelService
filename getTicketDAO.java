package com.web.dao;
import com.web.connections.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
public class GetTicketDAO {
	public static boolean addTicket(String customer_id, String ticket_num, String flight_num) throws SQLException {
		boolean success = false;
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement p1 = conn.prepareStatement("insert into buys values (?,?,?,?,?);");
			p1.setString(1,customer_id);
			p1.setString(2,ticket_num);
			p1.setString(3,"100");
			Date date = new Date();
			SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm:ss");
			p1.setString(4,timeFormatter.format(date));
			SimpleDateFormat dayFormatter = new SimpleDateFormat("yyy-MM-dd");
			p1.setString(5,dayFormatter.format(date));
			p1.executeUpdate();
			PreparedStatement p2 = conn.prepareStatement("insert into make_book_have__list_Reservation values (?,?,?,?);");
			p2.setString(1,"0");
			p2.setString(2,customer_id);
			p2.setString(3,flight_num);
			p2.setString(4,ticket_num);
			p2.executeUpdate();
			PreparedStatement p3 = conn.prepareStatement("update flight_tickets set reserved='1' where flight_tickets.ticket_unique_num=?;");
			p3.setString(1,ticket_num);
			p3.executeUpdate();
			success =  true;
		} catch(Exception e) {
			System.out.println("Exception when trying to add ticket to customer");
			e.printStackTrace();
		}
		return success;
	}
	
	public static boolean deleteTicket(String customer_id, String ticket_num) throws SQLException {
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement p1 = conn.prepareStatement("delete from buys where customer_id=? and ticket_unique_num=?;");
			p1.setString(1,customer_id);
			p1.setString(2,ticket_num);
			p1.execute();
			PreparedStatement p2 = conn.prepareStatement("delete from make_book_have__list_Reservation where customer_id=? and ticket_unique_num=?;");
			p2.setString(1,customer_id);
			p2.setString(2,ticket_num);
			p2.execute();
			PreparedStatement p3 = conn.prepareStatement("update flight_tickets set reserved='0' where ticket_unique_num=?;");
			p3.setString(1,ticket_num);
			p3.execute();
			return true;
		} catch(Exception e) {
			System.err.println("SQL erro thrown when trying tot execute delete ticket update");
			e.printStackTrace();
		}
		return false;
	}
}
