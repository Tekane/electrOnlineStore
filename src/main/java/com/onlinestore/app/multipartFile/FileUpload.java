package com.onlinestore.app.multipartFile;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    private static final String ABS_PATH = "/home/kgodisho/IdeaProjects/onlinestore/src/main/webapp/images/";
    private static  String REAL_PATH = "";
    private static final Logger logger = LoggerFactory.getLogger(FileUpload.class);

    //Method to upload file
    public static void uploadFile(HttpServletRequest request, MultipartFile file , String code){
        //Get the real path
        REAL_PATH = request.getSession().getServletContext().getRealPath("/images/");
        logger.info(REAL_PATH);

        //Check if the directories exist
        if (!new File(ABS_PATH).exists()){
            new File(ABS_PATH).mkdirs();
        }
        if (!new File(REAL_PATH).exists()){
            new File(REAL_PATH).mkdirs();
        }
        try {
            //server upload
            file.transferTo(new File(REAL_PATH + code +".jpg"));
            //project directory upload
            file.transferTo(new File(ABS_PATH + code +".jpg"));
        }catch (IOException e){
            logger.error(e.getMessage());
        }
    }
}
