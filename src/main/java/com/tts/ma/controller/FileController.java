package com.tts.ma.controller;

import com.tts.ma.contract.ct.HVDAuditor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.util.List;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/22 15:59
 * @Version
 */
@Controller
public class FileController {
    @Autowired
    HVDAuditor hvdAuditor;

    @RequestMapping("file")
    public String index() {
        return "dataSynchronized";
    }

    //多文件上传
    @RequestMapping(value = "/batch/upload", method = RequestMethod.POST)
    @ResponseBody
    public String handleFileUpload(HttpServletRequest request) {
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("file");
        MultipartFile file = null;
        BufferedOutputStream stream = null;
        for (int i = 0; i < files.size(); ++i) {
            file = files.get(i);
            if (!file.isEmpty()) {
                try {
                    System.out.println(file.getSize());
                    System.out.println(file.getOriginalFilename());
                    //byte[] bytes = file.getBytes();
                    //stream = new BufferedOutputStream(new FileOutputStream(
                    //        new File(file.getOriginalFilename())));
                    //stream.write(bytes);
                    //stream.close();
                    //hvdAuditor.addHVD();
                } catch (Exception e) {
                    stream = null;
                    return "You failed to upload " + i + " => "
                            + e.getMessage();
                }
            } else {
                return "You failed to upload " + i
                        + " because the file was empty.";
            }
        }
        return "upload successful";
    }
}
