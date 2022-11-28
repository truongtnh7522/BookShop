package com.bookshop.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name = "product")
public class ProductEntity extends BaseEntity{
	@Column(name="createDate")
	private Date createDate;
	@Column(name="productCode")
	private Long productCode;
	@Column(name="amount")
	private Long amount;
	@Column(name="stock")
	private Long stock;
	@Column(name="wishlist")
	private Long wishlist;
	@Column(name="status")
	private Long status;
	
	@Column(name="productName")
	private String productName;
	@Column(name="description")
	private String description;
	@Column(name="images")
	private String images;
	@Column(name="price")
	private Double price;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    private CategoryEntity category;
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seller_id")
    private CategoryEntity seller;
	public CategoryEntity getSeller() {
		return seller;
	}
	public void setSeller(CategoryEntity seller) {
		this.seller = seller;
	}
	public CategoryEntity getCategory() {
		return category;
	}
	public void setCategory(CategoryEntity category) {
		this.category = category;
	}
	public Long getProductCode() {
		return productCode;
	}
	public void setProductCode(Long productCode) {
		this.productCode = productCode;
	}
	
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public Long getStock() {
		return stock;
	}
	public void setStock(Long stock) {
		this.stock = stock;
	}
	public Long getWishlist() {
		return wishlist;
	}
	public void setWishlist(Long wishlist) {
		this.wishlist = wishlist;
	}
	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
	
}
