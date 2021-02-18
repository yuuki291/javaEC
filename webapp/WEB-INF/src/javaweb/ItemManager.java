package javaweb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ItemManager implements ItemSummaryView,ItemDetailView{

	@Override
	public List<Item> itemList() {

		List<Item> itemList = new ArrayList<Item>();

		MySQLDatabase database = new MySQLDatabase("jdbc/javaweb");

		try {

			Connection conn = database.connect();
			String sql = "SELECT product_cd, product_nm, unit_price FROM product";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()){

				Item item = new Item();
				item.setProduct_Cd(rs.getString("product_cd"));
				item.setProduct_Nm(rs.getString("product_nm"));
				item.setUnit_Price(rs.getBigDecimal("unit_price"));

				itemList.add(item);

			}

			rs.close();
			stmt.close();
			conn.close();

		} catch (SQLException e){

			e.printStackTrace();
		}
		return itemList;
	}

	@Override
	public Item itemDetail(String itemCd) {

		Item item = new Item();
        MySQLDatabase database = new MySQLDatabase("jdbc/javaweb");

        try{

        	Connection conn = database.connect();
        	String sql = "SELECT product_cd, product_nm, unit_price, description FROM product WHERE product_cd = ?";


        	PreparedStatement stmt = conn.prepareStatement(sql);
        	stmt.setString(1, itemCd);

        	ResultSet rs = stmt.executeQuery();

			while(rs.next()){

        		item.setProduct_Cd(rs.getString("product_cd"));
				item.setProduct_Nm(rs.getString("product_nm"));
				item.setUnit_Price(rs.getBigDecimal("unit_price"));
				item.setDescription(rs.getString("description"));
        	}

			rs.close();
			stmt.close();
			conn.close();


        }catch (SQLException e){

        	e.printStackTrace();
        }

		return item;
	}

}
