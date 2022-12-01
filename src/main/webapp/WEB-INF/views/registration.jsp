<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng Ký</title>
</head>
<body>
	





	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-md-6 order-md-2">
					<img
						src="<c:url value='/template/login/images/undraw_file_sync_ot38.svg'/>"
						alt="Image" class="img-fluid">
				</div>
				<div class="col-md-6 contents">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<div class="mb-4">
								<h3>
									Sign In to <strong>Colorlib</strong>
								</h3>
								<p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente
									sit aut eos consectetur adipisicing.</p>
							</div>

<form:form action="registration" method="post"
								modelAttribute="users">
							<!-- success message -->
							<c:if test="${param.success}">
								<div>
									<div class="alert alert-info">You've successfully
										registered to our awesome app!</div>
								</div>
							</c:if>

							<h1>Registration</h1>

							<c:if test="${param.incorrectAccount != null}">
								<div class="alert alert-danger">Username or password
									incorrect</div>
							</c:if>
							<c:if test="${param.accessDenied != null}">
								<div class="alert alert-danger">you Not authorize</div>
							</c:if>
							
								<div class="form-group">
									<label class="control-label" for="fullName"> Full Name
									</label>
									<form:input id="fullName" class="form-control" path="fullName" />
								</div>
								<div class="form-group">
									<label class="control-label" for="userName"> User Name
									</label>
									<form:input id="userName" class="form-control" path="userName" />
								</div>
								<div class="form-group">
									<label class="control-label" for="password"> Password </label>
									<form:input id="password" class="form-control" type="password"
										path="password" />
								</div>
								<div class="form-group">
									<label class="control-label" for="phone"> Phone </label>
									<form:input id="phone" class="form-control" path="phone" />
								</div>
								<div class="form-group">
									<label class="control-label" for="images"> Images </label>
									<form:input id="images" class="form-control" path="images" />
								</div>
								<div class="form-group">
									<label class="control-label" for="status"> Status </label>
									<form:input id="status" class="form-control" path="status" />
								</div>


								<div class="d-flex mb-5 align-items-center">
									<label class="control control--checkbox mb-0"><span
										class="caption">Remember me</span> <input type="checkbox"
										checked="checked" />
										<div class="control__indicator"></div> </label> <span class="ml-auto"><a
										href="<c:url value='/registration'/>" class="forgot-pass">Registration</a></span>
									<span class="ml-auto"><a href="#" class="forgot-pass">Forgot
											Password</a></span>
								</div>

								<div class="form-group">
									<button type="submit" class="btn btn-success">Register</button>
									<span>Already registered? <a
										href="<c:url value='/dang-nhap'/>">Login here</a></span>
								</div>

								<span class="d-block text-left my-4 text-muted"> or sign
									in with</span>

								<div class="social-login">
									<a href="#" class="facebook"> <span
										class="icon-facebook mr-3"></span>
									</a> <a href="#" class="twitter"> <span
										class="icon-twitter mr-3"></span>
									</a> <a href="#" class="google"> <span class="icon-google mr-3"></span>
									</a>
								</div>
							</form:form>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>



</body>
</html>