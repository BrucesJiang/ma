package com.tts.ma.service.impl;

import com.tts.ma.dto.ItemInfo;
import com.tts.ma.service.ItemService;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 14:00
 * @Version
 */
@Service
public class ItemServiceImpl implements ItemService{
    @Override
    public List<ItemInfo> getAllItems() {
        return data();
    }

    @Override
    public List<ItemInfo> getItems(List<Integer> idx) {
        return data();
    }

    @Override
    public ItemInfo getItemById(int index) {
        return null;
    }

    @Override
    public int getTotoalNum() {
        return 0;
    }

    private static List<ItemInfo> data() {
        List<ItemInfo> list = new ArrayList<>();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Random random = new Random();
        ItemInfo info = null;
        for(int i = 0; i < 30; i++) {
            info = new ItemInfo();

            info.setIndex(i);
            int salt = random.nextInt();
            info.setSalt(salt + "");
            info.setSize(random.nextInt() + "");
            String hvd = getSHA256("haha" + salt);
            info.setHvd(hvd);
            info.setLastAuditTime(simpleDateFormat.format(new Date().getTime()));
            list.add(info);
        }

        return list;
    }


    /**
     *  利用java原生的摘要实现SHA256加密
     * @param str 加密后的报文
     * @return
     */
    public static String getSHA256(String str){
        MessageDigest messageDigest;
        String encodeStr = "";
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(str.getBytes("UTF-8"));
            encodeStr = byte2Hex(messageDigest.digest());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encodeStr;
    }

    private static String byte2Hex(byte[] bytes){
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("0x");
        String temp = null;
        for (int i=0;i<bytes.length;i++){
            temp = Integer.toHexString(bytes[i] & 0xFF);
            if (temp.length()==1){
                //1得到一位的进行补0操作
                stringBuffer.append("0");
            }
            stringBuffer.append(temp);
        }
        return stringBuffer.toString();
    }
}
