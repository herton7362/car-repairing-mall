package com.framework.module.product.domain;

import com.kratos.entity.BaseEntity;
import com.kratos.module.attachment.domain.Attachment;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商品
 * @author tang he
 * @since 1.0.0
 */
@Entity
@ApiModel("商品")
public class Product extends BaseEntity {
    @ApiModelProperty(value = "商品分类")
    @ManyToOne(fetch = FetchType.EAGER)
    private ProductCategory productCategory;
    @ApiModelProperty(value = "商品代码")
    @Column(length = 50)
    private String code;
    @ApiModelProperty(value = "商品名称")
    @Column(length = 500)
    private String name;
    @ApiModelProperty(value = "商品备注")
    @Column(length = 200)
    private String remark;
    @ApiModelProperty(value = "商品赠送积分")
    private Integer points;
    @ApiModelProperty(value = "商品单价")
    @Column(length = 11, precision = 2)
    private Double price;
    @ApiModelProperty(value = "是否上架")
    private Boolean onSale;
    @ApiModelProperty(value = "是否推荐")
    private Boolean recommend;
    @ApiModelProperty(value = "封面图片")
    @ManyToOne
    private Attachment coverImage;
    @ApiModelProperty(value = "商品样式集")
    @ManyToMany
    @JoinTable(name="product_styles",joinColumns={@JoinColumn(name="product_id")},inverseJoinColumns={@JoinColumn(name="attachment_id")})
    private List<Attachment> styleImages;
    @ApiModelProperty(value = "商品详情")
    @ManyToMany
    @JoinTable(name="product_details",joinColumns={@JoinColumn(name="product_id")},inverseJoinColumns={@JoinColumn(name="attachment_id")})
    private List<Attachment> detailImages;
    @ApiModelProperty(value = "详细描述")
    @Lob
    @Type(type="text")
    private String description;
    @ApiModelProperty(value = "库存数量")
    private Long stockCount;
    @ApiModelProperty(value = "商品规格")
    @OneToMany(mappedBy = "product")
    private List<ProductProductStandard> productProductStandards;
    @ApiModelProperty(value = "sku")
    @OneToMany(mappedBy = "product")
    @Where(clause="logically_deleted=0")
    @OrderBy(clause="sort_number asc")
    private List<Sku> skus;
    @ApiModelProperty(value = "维修系统维修项目id")
    @Column(length = 36)
    private String repairSysMaintenanceItemId;
    @ApiModelProperty(value = "维修系统配件id")
    @Column(length = 36)
    private String repairSysPartsId;

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Boolean getOnSale() {
        return onSale;
    }

    public void setOnSale(Boolean onSale) {
        this.onSale = onSale;
    }

    public Boolean getRecommend() {
        return recommend;
    }

    public void setRecommend(Boolean recommend) {
        this.recommend = recommend;
    }

    public Attachment getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(Attachment coverImage) {
        this.coverImage = coverImage;
    }

    public List<Attachment> getStyleImages() {
        return styleImages;
    }

    public void setStyleImages(List<Attachment> styleImages) {
        this.styleImages = styleImages;
    }

    public List<Attachment> getDetailImages() {
        return detailImages;
    }

    public void setDetailImages(List<Attachment> detailImages) {
        this.detailImages = detailImages;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getStockCount() {
        return stockCount;
    }

    public void setStockCount(Long stockCount) {
        this.stockCount = stockCount;
    }

    public List<ProductProductStandard> getProductProductStandards() {
        if(productProductStandards != null && !productProductStandards.isEmpty()) {
            return productProductStandards
                    .stream()
                    .sorted((o1, o2) -> {
                        if(o1.getProductStandard() != null && o2.getProductStandard() != null) {
                            return o1.getProductStandard().getSortNumber().compareTo(o2.getProductStandard().getSortNumber());
                        } else {
                            return 0;
                        }
                    })
                    .collect(Collectors.toList());
        }
        return productProductStandards;
    }

    public void setProductProductStandards(List<ProductProductStandard> productProductStandards) {
        this.productProductStandards = productProductStandards;
    }

    public List<Sku> getSkus() {
        return skus;
    }

    public void setSkus(List<Sku> skus) {
        this.skus = skus;
    }
}
