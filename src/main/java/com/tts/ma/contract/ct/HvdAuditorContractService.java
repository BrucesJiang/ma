package com.tts.ma.contract.ct;

import com.tts.ma.contract.utils.Constants;
import com.tts.ma.dto.ItemInfo;
import org.springframework.stereotype.Service;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.tuples.generated.Tuple7;

import java.io.IOException;
import java.math.BigInteger;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/23 15:21
 * @Version
 */
@Service
public class HvdAuditorContractService {
    private HVDAuditor hvdAuditor;

    public HvdAuditorContractService() throws IOException, CipherException{
        Credentials credentials = WalletUtils.loadCredentials(Constants.PASSWORD, Constants.PATH);
        hvdAuditor = Contract.getHvdAuditorContract(credentials, Constants.HVDAuditor_Contract_Address);
    }

    public TransactionReceipt addHVD(String hvd, String salt, BigInteger size, String belongto, String remoteaddr, String lastaudittime, BigInteger state) throws Exception {
        return hvdAuditor.addHVD(hvd, salt, size, belongto, remoteaddr, lastaudittime, state).send();
    }

    public BigInteger returnTotal() throws Exception {
        return hvdAuditor.returnTotal().send();
    }

    public String getHvd(BigInteger id) throws Exception {
        return hvdAuditor.getHvd(id).send();
    }

    public String getSalt(BigInteger id) throws Exception {
        return hvdAuditor.getSalt(id).send();
    }

    public BigInteger getSize(BigInteger id) throws Exception {
        return hvdAuditor.getSize(id).send();
    }

    public String getBelongTo(BigInteger id) throws Exception {
        return hvdAuditor.getBelongTo(id).send();
    }

    public String getRemoteAddr(BigInteger id) throws Exception {
        return hvdAuditor.getRemoteAddr(id).send();
    }

    public String getLastAuditTime(BigInteger id) throws Exception {
        return hvdAuditor.getLastAuditTime(id).send();
    }

    public Boolean getState(BigInteger id) throws Exception {
        BigInteger bigInteger = hvdAuditor.getStater(id).send();
        if(bigInteger.equals("0")) return false;
        else return true;
    }

    public ItemInfo getItemInfo(BigInteger id) throws Exception {
        Tuple7<String, String, BigInteger, String, String, String, BigInteger> re = hvdAuditor.getHvdAndSalt(id).send();
        ItemInfo itemInfo = new ItemInfo();
        itemInfo.setHvd(re.getValue1());
        itemInfo.setSalt(re.getValue2());
        itemInfo.setSize(re.getValue3().intValue());
        itemInfo.setBelongTo(re.getValue4());
        itemInfo.setRemoteAddr(re.getValue5());
        itemInfo.setLastAuditTime(re.getValue6());
        itemInfo.setState(re.getValue7().intValue()==0?false:true);
        return itemInfo;
    }
}
