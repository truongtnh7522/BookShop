package com.bookshop.dto;

public class SellerDTO extends AbstractDTO<SellerDTO>{
	public String getSellername() {
		return sellername;
	}
	public void setSellername(String sellername) {
		this.sellername = sellername;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	private String sellername;
	private String images;
	private Boolean status;
}
