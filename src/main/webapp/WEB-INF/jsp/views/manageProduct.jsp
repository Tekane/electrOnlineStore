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
					<sf:form class="form-horizontal" modelAttribute="product" action="${contextRoot}/manage/products" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<label class="control-label col-md-4">Enter Product Name:</label>
						<div class="col-md-8">
							<sf:input type="text" path="name" id="name" placeholder="Product Name" class="form-control"/>
							<sf:errors path="name" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
						</div>
					</div>

						<div class="form-group">
							<label class="control-label col-md-4">Enter brand Name:</label>
							<div class="col-md-8">
								<sf:input  path="brand" id="brand" placeholder="Brand Name" class="form-control"/>
								<sf:errors path="brand" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
							</div>
						</div>

                        <div class="form-group">
                            <label class="control-label col-md-4" for="description">Product description:</label>
                            <div class="col-md-8">
                                <sf:textarea path="description" id="description" row="5" placeholder="Write a description"></sf:textarea>
								<sf:errors path="description" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
                            </div>
                        </div>

						<div class="form-group">
							<label class="control-label col-md-4" for="unitPrice">Enter unit price:</label>
							<div class="col-md-8">
								<sf:input id="unitPrice" path="unitPrice" placeholder="Unit price in &#82;" class="form-control"/>
								<sf:errors path="unitPrice" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="quantity">Quantity Available:</label>
							<div class="col-md-8">
								<sf:input  id="quantity" path="quantity" placeholder="Quantity Available"  class="form-control"/>
								<sf:errors path="quantity" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-md-4" for="file">Upload Image:</label>
							<div class="col-md-8">
								<sf:input type="file" id="file" path="file"  class="form-control"/>
								<sf:errors path="file" cssClass="help-block" cssStyle="color: red" element="em"></sf:errors>
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
									<c:if test="${product.id == 0}">
								<div class="text-right">
									</br>
										<button type="button" data-toggle="modal" data-target="#myCategoryModal"
												class="btn btn-warning btn-sm">Add Category</button>
									</c:if>
								</div>
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
	<div class="row">
		<div class="col-xs-12">
			<h3>Available Products</h3>
			</hr>
		</div>
		<div class="col-xs-12">
			<div style="overflow: auto">
				<!--Product table for Admin-->
				<table id="adminProductsTable" class="table table-striped table-bordered">
					<thead>
					<tr>
						<th>Id</th>
						<th>Image</th>
						<th>Brand</th>
						<th>Name</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Active</th>
						<th>Edit</th>
					</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myCategoryModal" role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!--Modal Header-->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Add new Category</h4>
				</div>
				<!--Modal Body-->
				<div class="modal-body">
					<!--Category form-->
					<sf:form id ="categoryForm" action="${contextRoot}/manage/category" modelAttribute="category"  method="post"
							 class="form-horizontal">
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category Name</label>
							<div class="col-md-8">
								<sf:input path="name" id="category_name" class="form-control"></sf:input>
							</div>
						</div>

						<div class="form-group">
							<label for="category_description" class="control-label col-md-4">Category Description</label>
							<div class="col-md-8">
								<sf:textarea path="description" cols="" rows="5" id="category_description" class="form-control" ></sf:textarea>
							</div>
						</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" value="Add category" class="btn btn-primary"/>
								</div>
							</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>