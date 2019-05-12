$(function () {
    //creating active menu
    switch (menu) {
        case 'All Products':
            $('#allProducts').addClass('active');
            break;
        case 'Mobile':
            $('#Mobile').addClass('active');
            break;
        default:
                $('#listProducts').addClass('active');
                $('#a_'+menu).addClass('active');
            break;
    }
    var $table = $('#productListTable');

    //execute the below code only where we have the table
    if ($table.length){

        alert("hkjhkj");
        var JsonUrl = '';
        if (window.categoryId == ''){
            JsonUrl =  window.contextRoot + '/api/allProducts';
        }
        else{
            JsonUrl = window.contextRoot + '/api/category/'+ window.categoryId+'/products';
        }
        $table.DataTable({
            lengthMenu:[[3,5,10,-1],['3 Records','5 Records','10 Records','ALL']],
            pageLength: 5 ,
            ajax: {
                url: JsonUrl,
                dataSrc: ''
            },
            columns: [
                {
                    data: 'name',
                },
                {
                    data: 'brand',
                },
                {
                    data: 'unitPrice',
                },
                {
                    data: 'quantity',
                }
            ]
        });
    }

});

//Code for jquery DataTable
//Create a dataset
