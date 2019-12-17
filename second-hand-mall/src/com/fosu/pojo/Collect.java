package com.fosu.pojo;

public class Collect {
    private Integer collectId;

    private Integer userId;

    private Integer goodId;

    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "collectId=" + collectId +
                ", userId=" + userId +
                ", goodId=" + goodId +
                '}';
    }
}