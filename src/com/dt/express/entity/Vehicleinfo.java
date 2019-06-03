package com.dt.express.entity;

public class Vehicleinfo {
    private String id;

    private String type;

    private Integer price;

    private String driver;

    private String pt;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver == null ? null : driver.trim();
    }

    public String getPt() {
        return pt;
    }

    public void setPt(String pt) {
        this.pt = pt == null ? null : pt.trim();
    }
}