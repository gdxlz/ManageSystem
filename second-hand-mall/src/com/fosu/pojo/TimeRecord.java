package com.fosu.pojo;

import java.util.Date;

public class TimeRecord {
    private Integer recordId;

    private Integer goodId;

    private Date uptime;

    private Date downtime;

    private Date sailtime;

    private Integer buyerId;

    public Integer getRecordId() {
        return recordId;
    }

    public void setRecordId(Integer recordId) {
        this.recordId = recordId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Date getUptime() {
        return uptime;
    }

    public void setUptime(Date uptime) {
        this.uptime = uptime;
    }

    public Date getDowntime() {
        return downtime;
    }

    public void setDowntime(Date downtime) {
        this.downtime = downtime;
    }

    public Date getSailtime() {
        return sailtime;
    }

    public void setSailtime(Date sailtime) {
        this.sailtime = sailtime;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

	@Override
	public String toString() {
		return "TimeRecord [recordId=" + recordId + ", goodId=" + goodId + ", uptime=" + uptime + ", downtime="
				+ downtime + ", sailtime=" + sailtime + ", buyerId=" + buyerId + "]";
	}
    
}