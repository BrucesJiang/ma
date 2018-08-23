package com.tts.ma.contract.ct;

import com.tts.ma.contract.utils.Constants;
import org.springframework.stereotype.Service;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;

import java.io.IOException;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/23 16:53
 * @Version
 */
@Service
public class UserContractService {
    private Register register;

    public UserContractService() throws IOException, CipherException {
        Credentials credentials = WalletUtils.loadCredentials(Constants.PASSWORD, Constants.PATH);
        register = Contract.getRegisterContract(credentials, Constants.Register_Contract_Address);
    }

    public boolean login(String username, String password) throws Exception {
        return register.login(username,password).send();

    }

    public boolean checkRegister(String adress,String username) throws Exception {
        return register.checkRegister(adress,username).send();
    }

    public boolean register(String adress, String username, String password) throws Exception {
        if(!checkRegister(adress,username)){
            register.register(adress,username,password).send();
            return true;
        }
        return false;
    }

    public void updatePassword(String username, String newPass) throws Exception {
        register.updatePassword(username,newPass.getBytes("UTF-8")).send();
    }
}
