package net.hedtech.my.first.web.plugin

public class Comuna{

    private String  code
    private String  desc

    public Comuna(String code , String desc){

        this.code = code
        this.desc = desc
    }

    public String  getCode(){
        return this.code
    }
    
    public String  getDesc(){
        return this.desc
    }

    public void  setDesc(String desc){
        this.desc = desc
    }

    public void  setCode(String code){
        this.code = code
    }



    

}