$(function () {
    //creating active menu
    switch (menu) {
        case 'allProducts':
            $('#allProducts').addClass('active');
            break;
        default:
                $('#home').addClass('active');
            break;
    }
});