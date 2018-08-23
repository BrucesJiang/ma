package com.tts.ma.utils;

import com.tts.ma.contract.ct.HVDAuditor;
import com.tts.ma.contract.ct.HvdAuditorContractService;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.math.BigInteger;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/23 14:25
 * @Version
 */
public class Scheduler {
    public static void scheduleThread(File file, HVDAuditor hvdAuditor, int nThreads) {
        ExecutorService executorService = Executors.newFixedThreadPool(nThreads);
        synchronizedFile(file, executorService, hvdAuditor);
    }

    public static void scheduleThread(List<MultipartFile> files, HvdAuditorContractService hvdAuditor, int nThreads) {
        ExecutorService executorService = Executors.newFixedThreadPool(nThreads);
        for(int i = 0; i< files.size(); i++) {  //这里需要处理文件为空的情况
            if(!files.get(i).isEmpty()){
                synzhronzedFile(files.get(i), executorService, hvdAuditor);
            }
        }
    }

    private static void synzhronzedFile(final MultipartFile file, ExecutorService executorService, HvdAuditorContractService hvdAuditor) {
        executorService.execute(() -> {
            try{
                byte[] bytes = file.getBytes();
                Random random = new Random();
                int salt = 2 << (random.nextInt(10));
                String hvd = Utils.getSHA256(new String(bytes) + salt);
                //System.out.println("hvd = " + hvd);
                //System.out.println("salt = " + salt);

                try{
                    hvdAuditor.addHVD(hvd, salt+"", new BigInteger(bytes.length + ""),  file.toString(),
                            "http://localhost:3306/test", null, new BigInteger("1"));
                }catch (Exception e) {
                    e.printStackTrace();
                }
            }catch (IOException e) {
                e.printStackTrace();
            }
        });
    }

    private static void synchronizedFile(final File file, ExecutorService executorService, HVDAuditor hvdAuditor) {
        if(file.isDirectory()) {
            final File[] files = file.listFiles();
            for(int i = 0; i < files.length; i ++ ) {
                synchronizedFile(files[i], executorService, hvdAuditor);
            }
        }else if(file.isFile()) {
            System.out.println("execute");
            executorService.execute(() -> {
                try{
                    BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
                    Random random = new Random();
                    float y = random.nextFloat();
                    int x = random.nextInt(10) + 1;
                    byte[] buffer = new byte[(int)(x*y*1024*1024)];
                    int len = 0;
                    while((len = bufferedInputStream.read(buffer)) != 0) {
                        System.out.println(buffer);
                        int salt = 2 << (random.nextInt(10));
                        String hvd = Utils.getSHA256(new String(buffer) + salt);
                        //System.out.println("hvd = " + hvd);
                        //System.out.println("salt = " + salt);

                        try{
                            hvdAuditor.addHVD(hvd, salt+"", new BigInteger(len + ""),  file.toString(), "http://localhost:3306/test", null, new BigInteger("1")).send();
                        }catch (Exception e) {
                            e.printStackTrace();
                        }
                        y = random.nextFloat();
                        x = random.nextInt(10) + 1;
                        buffer = new byte[(int)(x*y*1024)];
                    }
                    bufferedInputStream.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            });
        }
    }
}
