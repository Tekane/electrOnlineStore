<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="container">
	<div class="row">
		<c:if test="${not empty message}">
			<div class="col-xs-12">
				<div class="alert alert-success alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					${message}
				</div>
			</div>
		</c:if>
		<div class="col-md-offset-2 col-md-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4>Product Management</h4>
				</div>
				<div  class="panel-body">
					<!-- Form Elements -->
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/products" method="post">
					<div class="form-group">
						<label class="control-label col-md-4">Enter Product Name:</label>
						<div class="col-md-8">
							<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/>
							<span class="error text-danger">Please enter product name!</span>
						</div>
					</div>

						<div class="form-group">
							<label class="control-label col-md-4">Enter brand Name:</label>
							<div class="col-md-8">
								<sf:input type="text" path="brand" id="brand" placeholder="Brand Name" class="form-control"/>
								<span class="error text-danger">Please Enter brand name!</span>
							</div>
						</div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="description">Product description:</label>
                            <div class="col-md-8">
                                <sf:textarea path="description" id="description" row="5" placeholder="Write a description"></sf:textarea>
                            </div>
                        </div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter unit price:</label>
							<div class="col-md-8">
								<sf:input type="number" id="unitPrice" path="unitPrice" placeholder="Unit price in &#82;" class="form-control"/>
								<span class="error text-danger">Please Enter unit price in &#82;!</span>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity Available:</label>
							<div class="col-md-8">
								<sf:input type="number" id="quantity" path="quantity" placeholder="Quantity Available"  class="form-control"/>
								<span class="error text-danger">Please Enter quantity</span>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="categoryId">Select Category:</label>
							<div class="col-md-8">
								<sf:select class="form-control" id="categoryId" path="categoryId"
									items="${categories}"
									itemLabel ="name"
									itemValue ="id"
							></sf:select>
								<span class="error text-danger">Please select category</span>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4"></label>
							<div class="col-md-8">
								<input class="btn btn-primary" name="submit" id="submit" type="submit" value="Submit"/>
							</div>
						</div>
						<!--Hidden fields for product-->
						<sf:hidden path="id"></sf:hidden>
						<sf:hidden path="code"></sf:hidden>
						<sf:hidden path="supplierId"></sf:hidden>
						<sf:hidden path="purchases"></sf:hidden>
						<sf:hidden path="active"></sf:hidden>
						<sf:hidden path="views"></sf:hidden>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>