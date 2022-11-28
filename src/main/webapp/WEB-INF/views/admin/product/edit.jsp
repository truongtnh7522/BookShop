<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="productURL" value="/quan-tri/san-pham/danh-sach" />
<c:url var="editproductURL" value="/quan-tri/san-pham/chinh-sua" />
<c:url var="productAPI" value="/api/category" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="<c:url value='/template/edit/css/fontawesome.min.css'/>">
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="<c:url value='/template/edit/css/bootstrap.min.css'/>">
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="<c:url value='/template/edit/css/templatemo-style.css'/>">
</head>
<body>

<!-- 
	<div id="layoutSidenav">
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
								<a class="nav-link" href="danh-sach">Static Navigation</a> <a class="nav-link" href="danh-muc/danh-sach">Category</a>
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
		</div> -->
		<div id="layoutSidenav_content">
			<main>
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a></li>

						<li><a href="#">Forms</a></li>
						<li class="active">Form Elements</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<form:form class="tm-edit-product-form" role="form" id="formSubmit"
					modelAttribute="dto">






					<div class="container-fluid px-4">
						<h1 class="mt-4">Product</h1>
						<ol class="breadcrumb mb-4">
							<li class="breadcrumb-item active">Detail List-Product</li>
						</ol>
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<div class="container tm-mt-big tm-mb-big">
							<div class="row">
								<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
									<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
										<div class="row">
											<div class="col-12">
												<h2 class="tm-block-title d-inline-block">Add Product</h2>
											</div>

										</div>
										<div class="row tm-edit-product-row">
											<div class="col-xl-6 col-lg-6 col-md-12">

												<div class="form-group mb-3">
													<label for="name">Product Name </label>
													<form:input path="productName" id="name" name="productName"
														type="text" class="form-control validate" />
												</div>
												<div class="form-group mb-3">
													<label for="description">Description</label>
													<form:textarea name="description" path="description"
														class="form-control validate" rows="3" />
												</div>
												<div class="form-group mb-3">
													<label for="category">Category</label>
													<form:select class="custom-select tm-select-accounts"
														path="categoryCode" id="categoryCode">
														<form:option value="" label="-- Chọn thể loại --" />
														<form:options items="${categories}" />
													</form:select>
												</div>
												<div class="form-group mb-3">
													<form:input path="images" id="images" name="images"
														type="text" class="form-control validate" />


												</div>
												<div class="row">
													<!-- <div class="form-group mb-3 col-xs-12 col-sm-6">
															<label for="expire_date">Expire Date </label> <input
																id="expire_date" name="expire_date" type="text"
																class="form-control validate" data-large-mode="true" />
														</div>
														<div class="form-group mb-3 col-xs-12 col-sm-6">
															<label for="stock">Units In Stock </label> <input
																id="stock" name="stock" type="text"
																class="form-control validate" required />
														</div> -->
												</div>

											</div>
											<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
												<!-- <div class="tm-product-img-dummy mx-auto">
														<i class="fas fa-cloud-upload-alt tm-upload-icon"
															onclick="document.getElementById('uploadImage').click();"></i>
													</div> -->
												<div class="custom-file mt-3 mb-3">
													<img id="uploadPreview"
														style="width: 300px; height: 200px;" />
													<form:input path="images" id="uploadImage" type="file"
														name="images" onchange="PreviewImage();" />
													<input type="button"
														class="btn btn-primary btn-block mx-auto"
														value="UPLOAD PRODUCT IMAGE"
														onclick="document.getElementById('uploadImage').click();" />
												</div>
											</div>
											<form:hidden path="id" id="productId" />
											<div class="col-12">
												<c:if test="${not empty dto.id}">
													<button type="button" id="btnAddOrUpdateProduct"
														class="btn btn-primary btn-block text-uppercase">Update
														Product Now</button>
												</c:if>
												<c:if test="${empty dto.id}">
													<button type="button" id="btnAddOrUpdateProduct"
														class="btn btn-primary btn-block text-uppercase">Add
														Product Now</button>
												</c:if>
												&nbsp; &nbsp; &nbsp;
												<button class="btn btn-primary btn-block text-uppercase"
													type="reset">
													<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
												</button>
											</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form:form>
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











	<script src="<c:url value='/template/edit/js/jquery-3.3.1.min.js'/>"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="<c:url value='/template/edit/jquery-ui-datepicker/jquery-ui.min.js'/>"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="<c:url value='/template/edit/js/bootstrap.min.js'/>"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker();
		});
	</script>

	<script type="text/javascript">
		function PreviewImage() {
			var oFReader = new FileReader();
			oFReader
					.readAsDataURL(document.getElementById("uploadImage").files[0]);

			oFReader.onload = function(oFREvent) {
				document.getElementById("uploadPreview").src = oFREvent.target.result;
			};
		};
	</script>

	<script>
		$('#btnAddOrUpdateProduct').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var id = $('#productId').val();
			if (id == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		});

		function addNew(data) {
			$
					.ajax({
						url : '${productAPI}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${editproductURL}?id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${productURL}?message=error_system";
						}
					});
		}

		function updateNew(data) {
			$.ajax({
				url : '${productAPI}',
				type : 'PUT',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editproductURL}?id=" + result.id
							+ "&message=update_success";
				},
				error : function(error) {
					window.location.href = "${editproductURL}?id=" + result.id
							+ "&message=error_system";
				}
			});
		}
	</script>





</body>
</html>