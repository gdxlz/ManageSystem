package com.fosu.util;

import javax.xml.bind.annotation.XmlRootElement;

import com.fosu.pojo.Good;

import java.util.List;


@XmlRootElement
public class GoodGrid {
    private int current;//当前页面号
    private int rowCount;//每页行数
    private int total;//总行数
    private List<Good> rows;

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Good> getRows() {
        return rows;
    }

    public void setRows(List<Good> rows) {
        this.rows = rows;
    }
}
