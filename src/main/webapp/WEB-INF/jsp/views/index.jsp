<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>PTS Online Store ${title}</title>
	<script>
		window.menu = '${title}';
		window.contextRoot = '${contextRoot}';
	</script>

    <style><%@include file="/css/myapp.css"%></style>
	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css"/>

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="/css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="/css/slick-theme.css"/>

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="/css/nouislider.min.css"/>

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="/css/style.css"/>

	<!--Adding bootstrap dataTable-->
	<link type="text/css" rel="stylesheet" href="/css/dataTables.bootstrap.css"/>

	<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<%@include file="shared/top_header.jsp"%>
	<!-- /TOP HEADER -->

	<!-- MAIN HEADER -->
	<%@include file="shared/main_header.jsp"%>
	<!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<%@include file="./shared/navbar.jsp"%>
<!-- /NAVIGATION -->
<!-- loading the home content -->
<!-- CONTAINER -->
<c:if test= "${userClickHome == true}">
	<%@include file="home.jsp"%>
</c:if>
<c:if test="${userClickAllProducts == true or userClickCategoryProducts == true}">
	<%@include file="allProducts.jsp"%>
</c:if>
<c:if test="${userClickGetProduct == true}">
	<%@include file="singleProduct.jsp"%>
</c:if>
<c:if test="${userClickManageProducts == true}">
	<%@include file="manageProduct.jsp"%>
</c:if>
<!-- /CONTAINER -->

<!-- TOP SELLING1 -->
<%@include file="./shared/top_selling1.jsp"%>
<!-- /TOP SELLING1-->

<!-- TOP SELLING2-->
<%@include file="./shared/top_selling2.jsp"%>
<!-- /TOP SELLING2-->

<!-- NEWSLETTER -->
<%@include file="./shared/new_letter.jsp"%>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<%@include file="./shared/footer.jsp"%>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/slick.min.js"></script>
<script src="/js/nouislider.min.js"></script>
<!-- DataTable plugin-->
<script src="/js/jquery.dataTables.js"></script>
<script src="/js/dataTables.bootstrap.js"></script>
<!-- DataTable Plugin -->
<<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script><%@include file="/js/nouislider.min.js"%></script>
<script src="/js/jquery.zoom.min.js"></script>
<script src="/js/main.js"></script>
<script><%@include file="/js/bootbox.min.js"%></script>
<script><%@include file="/js/myapp.js"%></script>
</body>
</html>
