$(function () {
    //creating active menu
    switch (menu) {
        case 'All Products':
            $('#allProducts').addClass('active');
            break;
        case 'Mobile':
            $('#Mobile').addClass('active');
            break;
        case 'Manage Products':
            $('#manageProducts').addClass('active');
            break;
        default:
                $('#listProducts').addClass('active');
                $('#a_'+menu).addClass('active');
            break;
    }
    var $table = $('#productListTable');

    //execute the below code only where we have the table
    if ($table.length){

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
                    data:'code',
                    mRender: function(data , type , row){
                        return '<img src="'+window.contextRoot+'/images/'+data+'.jpg" class="dataTableImg"/>';
                    }
                },
                {
                    data: 'name',
                },
                {
                    data: 'brand',
                },
                {
                    data:'unitPrice',
                    mRender: function(data, type ,row){
                        return '&#82; ' + data
                    }
                },
                {
                    data:'quantity',
                    mRender: function (data , type ,  row){
                        if(data < 1){
                            return '<span style="color:red">Out of Stock</span>';
                        }
                        return data;
                    }
                },
                {
                    data: 'id',
                    bSortable: false,
                    mRender: function(data, type ,row){
                        var str ='';
                        str  += '<a href="'+window.contextRoot+'/show/'+data+'/product" class="btn btn-primary"><span class="glyphicon glyphicon-eye-open"></span><a/> &#160';
                        if(row.quantity < 1){
                            str  += '<a href="javascript:void(0)" class="btn btn-success disabled"><span class="glyphicon glyphicon-shopping-cart"><a/>';
                        } else {
                            str  += '<a href="'+window.contextRoot+'/cart/add/'+data+'/product" class="btn btn-success"><span class="glyphicon glyphicon-shopping-cart"><a/>';
                        }
                        return str;
                    }
                }

            ]
        });
    }

    //dismissing the alert after 2 seconds
   var $alert = $('.alert')
    if ($alert.length){
        setTimeout(function () {
            $alert.fadeOut('slow');
        },2000)
    }

});

//Code for jquery DataTable
//Create a dataset
