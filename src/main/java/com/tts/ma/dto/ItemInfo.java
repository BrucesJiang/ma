package com.tts.ma.dto;

/**
 * @Description
 * @Author Bruce Jiang
 * @Date 2018/8/20 13:56
 * @Version
 */
public class ItemInfo {
    private int index;
    private String username;
    private String hvd;
    private String salt;
    private int size;
    private String belongTo;
    private String remoteAddr;
    private String lastAuditTime;
    private boolean state;

    public ItemInfo() {

    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getHvd() {
        return hvd;
    }

    public void setHvd(String hvd) {
        this.hvd = hvd;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getBelongTo() {
        return belongTo;
    }

    public void setBelongTo(String belongTo) {
        this.belongTo = belongTo;
    }

    public String getRemoteAddr() {
        return remoteAddr;
    }

    public void setRemoteAddr(String remoteAddr) {
        this.remoteAddr = remoteAddr;
    }

    public String getLastAuditTime() {
        return lastAuditTime;
    }

    public void setLastAuditTime(String lastAuditTime) {
        this.lastAuditTime = lastAuditTime;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

}
