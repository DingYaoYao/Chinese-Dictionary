package com.dingyao.huiwan.entiey;

import javax.persistence.*;

@Table(name = "huiwan.chiku")
public class Chiku {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String text;

    private Integer len;

    private String pinyin;

    private String caizi;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return len
     */
    public Integer getLen() {
        return len;
    }

    /**
     * @param len
     */
    public void setLen(Integer len) {
        this.len = len;
    }

    /**
     * @return pinyin
     */
    public String getPinyin() {
        return pinyin;
    }

    /**
     * @param pinyin
     */
    public void setPinyin(String pinyin) {
        this.pinyin = pinyin;
    }

    /**
     * @return caizi
     */
    public String getCaizi() {
        return caizi;
    }

    /**
     * @param caizi
     */
    public void setCaizi(String caizi) {
        this.caizi = caizi;
    }
}