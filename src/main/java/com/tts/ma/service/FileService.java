package com.tts.ma.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/23 14:21
 * @Version
 */
public interface FileService {
    public void synchronzeFile(MultipartFile file);
}
