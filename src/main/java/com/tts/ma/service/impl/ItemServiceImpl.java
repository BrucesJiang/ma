package com.tts.ma.service.impl;

import com.tts.ma.contract.ct.HvdAuditorContractService;
import com.tts.ma.dto.ItemInfo;
import com.tts.ma.service.ItemService;
import com.tts.ma.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    HvdAuditorContractService hvdService;

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
            info.setSize(random.nextInt());
            String hvd = Utils.getSHA256("haha" + salt);
            info.setHvd(hvd);
            info.setLastAuditTime(simpleDateFormat.format(new Date().getTime()));
            list.add(info);
        }

        return list;
    }
}
