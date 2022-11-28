<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="productAPI" value="/api/product" />
<c:url var="productURL" value="/quan-tri/san-pham/danh-sach" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- sweetalert -->
    <script src="<c:url value='/template/sweetalert/sweetalert2.min.js' />"></script>
    <link rel="stylesheet" href="<c:url value='/template/sweetalert/sweetalert2.min.css' />" />
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>


</head>
<body>


	<%-- <div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="trang-chu">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard
						</a>
						<div class="sb-sidenav-menu-heading">Interface</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								  <a class="nav-link" href="<c:url value='san-pham/danh-sach'/>">Product</a>
                                    <a class="nav-link" href="<c:url value='danh-muc/danh-sach'/>">Category</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth"> Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="login.html">Login</a> <a
											class="nav-link" href="register.html">Register</a> <a
											class="nav-link" href="password.html">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
									data-bs-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError"> Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-bs-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="401.html">401 Page</a> <a
											class="nav-link" href="404.html">404 Page</a> <a
											class="nav-link" href="500.html">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Addons</div>
						<a class="nav-link" href="charts.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts
						</a> <a class="nav-link" href="tables.html">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
 --%>






		<div id="layoutSidenav_content">
			<main>
				<form action="<c:url value='/quan-tri/san-pham/danh-sach'/>"
					id="formSubmit" method="get">
					<div class="container-fluid px-4">
						<h1 class="mt-4">Product</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item active">Detail List-Product</li>
						</ol>
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<div class="card mb-4" >
							<div class="card-header" >
								<i class="fas fa-table me-1"></i> List-Product
								

								<button style="float:right" id="btnDelete" type="button"
									onclick="warningBeforeDelete()"
									class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
									data-toggle="tooltip" title='Xóa bài viết'>
									<span> <i class="fa-solid fa-trash"></i>
									</span>
								</button>
								<c:url var="createProductURL"
									value="/quan-tri/san-pham/chinh-sua" />
								Thêm sản phẩm <a flag="info" style="float:right;margin-right:10px"
									class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
									data-toggle="tooltip" title='Thêm bài viết'
									href='${createProductURL}'> <span> <i
										class="fa fa-plus-circle bigger-110 purple"></i>
								</span>
								</a>

							</div>
							<div class="card-body">
							<b style="color: red;">SELLECT ALL</b>
<th><input style="width: 20px; height: 20px" type="checkbox" id="checkAll" class="checkall" onclick="checkall()"></th>
								<table id="datatablesSimple">

									<thead>
										<tr>
											
											<th>Select</th>
											<th>Name</th>
											<th>Price</th>
											<th>Images</th>
											<th>Description</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<!-- <th><input type="checkbox" id="checkAll"></th> -->
											<th>Name</th>
											<th>Price</th>
											<th>Images</th>
											<th>Description</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="item" items="${dto.listResult}">
											<tr>
												<td><input style="width: 15px; height: 15px" type="checkbox" id="checkbox_${item.id}" class="checkbox"
													value="${item.id}"></td>
												<td>${item.productName}</td>
												<td>${item.price}</td>
												<td><img src="${item.images}" width="120" height="80">
												</td>
												<td>${item.description}</td>
												<td>${item.status}</td> 
												<td><c:url var="updateProductURL"
														value="/quan-tri/san-pham/chinh-sua">
														<c:param name="id" value="${item.id}" />
													</c:url> <a class="btn btn-primary btn-block text-uppercase"
													data-toggle="tooltip" title="Cập nhật bài viết"
													href='${updateProductURL}'><i class="far fa-edit"></i>
												</a></td>



											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</form>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>

		</div>
	</div>

	<!-- /.main-content -->
	<script>
	/**
	 * Check all records
	 */
	function checkall(){
	    var checked = $('input:checkbox[id^="checkbox_"]');
	    if($('input.checkall').is(':checked')) {
	        if(checked.length > 0){
	            $('.checkbox').each(function(){
	                this.checked = true;
	            });
	        }
	    } else {
	        if(checked.length > 0){
	            $('.checkbox').each(function(){
	                this.checked = false;
	            });
	        }
	    }
	}
		function warningBeforeDelete() {
			swal({
				title : "Xác nhận xóa",
				text : "Bạn có chắc chắn muốn xóa hay không",
				type : "warning",
				showCancelButton : true,
				confirmButtonClass : "btn-success",
				cancelButtonClass : "btn-danger",
				confirmButtonText : "Xác nhận",
				cancelButtonText : "Hủy bỏ",
			}).then(
					function(isConfirm) {
						if (isConfirm) {
							var ids = $('tbody input[type=checkbox]:checked')
									.map(function() {
										return $(this).val();
									}).get();
							deleteNew(ids);
						}
					});
		}
		
		function deleteNew(data) {
			$
					.ajax({
						url : '${productAPI}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${productURL}?message=delete_success";
						},
						error : function(error) {
							window.location.href = "${productURL}?message=error_system";
						}
					});
		}
	</script>


































</body>
</html>