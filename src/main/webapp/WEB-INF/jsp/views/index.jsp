<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>PTS Online Store ${title}</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css"/>

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

<!-- COLLECTION-->
<%@include file="./shared/collection.jsp"%>
<!-- /COLLECTION -->

<!-- New Products-->
<%@include file="./shared/new_products.jsp"%>
<!-- /New Products -->

<!-- HOT DEAL SECTION -->
<%@include file="./shared/hot_deals.jsp"%>
<!-- /HOT DEAL SECTION -->

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
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
