package javaweb;

import java.math.BigDecimal;

public class Item implements java.io.Serializable{


	private String product_cd;
	private String product_nm;
	private BigDecimal unit_price;
	private String description;
	private String product_img;

	public String getProduct_Cd(){
		return product_cd;
	}

	public String getProduct_Nm(){
		return product_nm;
	}

	public BigDecimal getUnit_Price(){
		return unit_price;
	}

	public String getDescription(){
		return description;
	}

	public String getProduct_Img(){
		return product_img;
	}


	public void setProduct_Cd(String product_cd){
		this.product_cd = product_cd;
	}

	public void setProduct_Nm(String product_nm){
		this.product_nm = product_nm;
	}

	public void setUnit_Price(BigDecimal unit_price){
		this.unit_price = unit_price;
	}

	public void setDescription(String description){
		this.description = description;
	}

	public void setProduct_Img(String product_img){
		this.product_img = product_img;
	}



}
