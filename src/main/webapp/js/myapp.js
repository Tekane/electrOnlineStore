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


    //Admin DataTable
    var $adminProductsTable = $('#adminProductsTable');

    if ($adminProductsTable.length) {

        var JsonUrl = window.contextRoot+'/api/admin/allProducts';

        $adminProductsTable.DataTable({
            lengthMenu:[[10,30,50,-1],['10 Records','30 Records','50 Records','ALL']],
            pageLength: 30 ,
            ajax: {
                url: JsonUrl,
                dataSrc: ''
            },
            columns: [
                {
                  data :'id',
                },
                {
                    data:'code',
                    mRender: function(data , type , row){
                        return '<img src="'+window.contextRoot+'/images/'+data+'.jpg" class="adminDataTableImg"/>';
                    }
                },
                {
                    data: 'name',
                },
                {
                    data: 'brand',
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
                    data:'unitPrice',
                    mRender: function(data, type ,row){
                        return '&#82; ' + data
                    }
                },
                {
                    data: 'active',
                    bSortable: false,
                    mRender: function (data,type,row) {
                        var str = '';
                        str += '<label class="switch">';
                        if(data == "TRUE" ){
                            str += '<input type="checkbox" checked="checked" value="'+row.id+'" />';
                        }else {
                            str += '<input type="checkbox" value="'+row.id+'" />';
                        }
                        str += '<div class="slider"></div> </label>';
                        return str;
                    }

                },
                {
                    data:'id',
                    bSortable:false,
                    mRender: function (data,type,row) {
                        var str = '';
                          str += '<a href="'+window.contextRoot+'/manage/'+data+'/product" class="btn btn-warning">' +
                            '<span class="glyphicon glyphicon-pencil"></span>\</a>';
                        return str;
                    }
                }
            ]
            ,
            initComplete: function () {
                var  api = this.api();
                //Toggle switch
                api.$('.switch input[type=checkbox]').on('change',function () {
                    var checkbox = $(this) ;
                    //return the value of checkbox (true or false)
                    var  checked = checkbox.prop('checked');
                    var  dMsg =  (checked) ? 'You want to activate the product ?' : 'You want to deactivate the product ?';

                    var value = checkbox.prop('value');

                    bootbox.confirm({
                        size: 'medium',
                        title: 'Product activation & deactivation',
                        message:dMsg,
                        callback: function (confirmed) {
                            if (confirmed){
                                 var activationUrl = window.contextRoot+'/manage/product/'+ value +'/activation';
                                 $.post(activationUrl , function (data) {
                                     bootbox.alert({
                                        size: 'medium',
                                         title: 'Information',
                                        message:data
                                    });
                                });
                            }
                            else {
                                checkbox.prop('checked',!checked);
                            }
                        }
                    });
                })
            }
        });
    }
});

//Code for jquery DataTable
//Create a dataset
