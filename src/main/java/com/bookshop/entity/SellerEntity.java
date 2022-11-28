package com.bookshop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "seller")
public class SellerEntity extends BaseEntity{
	@Column(name="sellername")
	private String sellername;
	@Column(name="images")
	private String images;
	@Column(name="status")
	private Boolean status;
	@OneToMany(mappedBy = "seller")
	private List<ProductEntity> products = new ArrayList<>();
	public String getSellername() {
		return sellername;
	}
	public List<ProductEntity> getProducts() {
		return products;
	}
	public void setProducts(List<ProductEntity> products) {
		this.products = products;
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
}
