package com.onlinestore.app.ecxeption;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class GlobalExceptionHandlerController implements ErrorController {

    @GetMapping("/error")
    public ModelAndView handlerNotFoundException(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        Object status =  request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        String code = null;
        if (status !=null){
            Integer statusCode = Integer.parseInt(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()){
                code = "404 error page";
            }else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()){
                code = "error-500";
            }

        }
        model.setViewName("/views/error-page");
        model.addObject("errorTitle","This page is not Constructed");
        model.addObject("errorDescription","The page you are looking for is not available!");
        model.addObject("title",code);

        return model;
    }

    @Override
    public String getErrorPath() {
        return "error-page";
    }
}
