package com.tts.ma.contract.ct;

import com.tts.ma.contract.utils.Constants;
import org.web3j.crypto.Credentials;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.http.HttpService;

/**
 * @Description 获取Contract对象
 * @Author Bruce Jiang
 * @Date 2018/8/23 15:09
 * @Version
 */
public final class Contract {
        public static Register getRegisterContract(Credentials credentials, String contractAdress){
            Web3j web3j = Web3j.build(new HttpService());
            Register register = null;
            try{
                register = new Register(contractAdress,web3j,credentials, Constants.GAS_PRICE,Constants.GAS_LIMIT);
            }catch (Exception e) {
                e.printStackTrace();
            }
            return register;
        }
        public static HVDAuditor getHvdAuditorContract(Credentials credentials, String contractAdress){
            Web3j web3j = Web3j.build(new HttpService());

            HVDAuditor hvdAuditor = null;
            try{
                hvdAuditor = new HVDAuditor(contractAdress,web3j,credentials,Constants.GAS_PRICE,Constants.GAS_LIMIT);
            }catch (Exception e) {
                e.printStackTrace();
            }
            return hvdAuditor;
        }
}
