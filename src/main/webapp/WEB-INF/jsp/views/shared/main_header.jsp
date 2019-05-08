<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- LOGO -->
			<div class="col-md-3">
				<div class="header-logo">
					<a href="${contextRoot}/index" class="logo">
						<img src="./img/logo.png" alt="">
					</a>
				</div>
			</div>
			<!-- /LOGO -->

			<!-- SEARCH BAR -->
			<div class="col-md-6">
				<div class="header-search">
					<form>
						<select class="input-select" id="my_selection">
						    	<option value="select">Categories</option>
								<c:forEach items="${categories}" var="category">
									<option value="${category.name}" href="${contextRoot}/show/category/${category.id}/products" id="a_${category.name}">${category.name}</option>
								</c:forEach>
						</select>
						<input class="input" placeholder="Search here">
						<button class="search-btn">Search</button>
                        <script>
                            document.getElementById('my_selection').onchange = function() {
                                window.location.href = this.children[this.selectedIndex].getAttribute('href');
                            }
                        </script>
					</form>
				</div>
			</div>
			<!-- /SEARCH BAR -->

			<!-- ACCOUNT -->
			<div class="col-md-3 clearfix">
				<div class="header-ctn">
					<!-- Wishlist -->
					<div>
						<a href="#">
							<i class="fa fa-heart-o"></i>
							<span>Your Wishlist</span>
							<div class="qty">2</div>
						</a>
					</div>
					<!-- /Wishlist -->

					<!-- Cart -->
					<div class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
							<i class="fa fa-shopping-cart"></i>
							<span>Your Cart</span>
							<div class="qty">3</div>
						</a>
						<div class="cart-dropdown">
							<div class="cart-list">
								<div class="product-widget">
									<div class="product-img">
										<img src="./img/product01.png" alt="">
									</div>
									<div class="product-body">
										<h3 class="product-name"><a href="#">product name goes here</a></h3>
										<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
									</div>
									<button class="delete"><i class="fa fa-close"></i></button>
								</div>

								<div class="product-widget">
									<div class="product-img">
										<img src="./img/product02.png" alt="">
									</div>
									<div class="product-body">
										<h3 class="product-name"><a href="#">product name goes here</a></h3>
										<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
									</div>
									<button class="delete"><i class="fa fa-close"></i></button>
								</div>
							</div>
							<div class="cart-summary">
								<small>3 Item(s) selected</small>
								<h5>SUBTOTAL: $2940.00</h5>
							</div>
							<div class="cart-btns">
								<a href="#">View Cart</a>
								<a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /Cart -->

					<!-- Menu Toogle -->
					<div class="menu-toggle">
						<a href="#">
							<i class="fa fa-bars"></i>
							<span>Menu</span>
						</a>
					</div>
					<!-- /Menu Toogle -->
				</div>
			</div>
			<!-- /ACCOUNT -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
</div>