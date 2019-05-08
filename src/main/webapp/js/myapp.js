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
});