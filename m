Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B4FC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 06:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHrRoaUvpOmpxH6i2vAv1bcrPcGQVwFlU8ZLuqCV96k=; b=wPYag/3nd0iqls
	EDWYn254RJ8bmF9IyV6WEqwQkWClaxeSTp0zL0y8Oe+5PYXVUm6/mIYkt7JuXQN+us/MvI4CXT19x
	I8kN60zIdg3V00C1ymhSo85GGn3cgHlrj7DwXkyXFpgkTfN+6CsIc3mLwiOiGwRq3NCot+VZNDNq5
	a6hM9i1vYlqGhkDfKIAzd7qeZYZXHWydTA5StFmejwpiKF+vup5r9uS4b8SyroD98txYxYo9c5BCj
	TjDfUopSeURMg+FN8RWIJHwhwmLeSEJjlxvdJPs+TQwdRk5gCKXYznXErh+cwuxoRVOXx6pfEviu3
	yFQNMN8/wPzaMR3lwfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dRI-005MdZ-13; Thu, 01 Dec 2022 06:52:56 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0dRC-005MXD-Ew
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 06:52:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6DB1C24E337;
	Thu,  1 Dec 2022 14:52:22 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 14:52:22 +0800
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Dec
 2022 14:52:22 +0800
Received: from EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e]) by
 EXMBX068.cuchost.com ([fe80::c4da:cbc4:bb39:ca7e%16]) with mapi id
 15.00.1497.044; Thu, 1 Dec 2022 14:52:22 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine support
Thread-Topic: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine
 support
Thread-Index: AQHZBH/rqnMRzesHF0+7VtyEEKwoza5W7JSAgAGlN8A=
Date: Thu, 1 Dec 2022 06:52:22 +0000
Message-ID: <60ad0da0116044d3a1fe575e9904e22c@EXMBX068.cuchost.com>
References: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
 <20221130055214.2416888-2-jiajie.ho@starfivetech.com>
 <aafb1c32-bc00-2db2-edbd-aa4771f33ac7@linaro.org>
In-Reply-To: <aafb1c32-bc00-2db2-edbd-aa4771f33ac7@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_225251_063035_DC7BADF7 
X-CRM114-Status: GOOD (  29.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, November 30, 2022 9:16 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S . Miller <davem@davemloft.net>;
> Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: Re: [PATCH 1/6] crypto: starfive - Add StarFive crypto engine
> support
> 

Hi Krzysztof Kozlowski,

> On 30/11/2022 06:52, Jia Jie Ho wrote:
> > Adding device probe and DMA init for StarFive hardware crypto engine.
> >
> > Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> > Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> > ---
> 
> 
> > +
> > +static const struct of_device_id starfive_dt_ids[] = {
> > +	{ .compatible = "starfive,jh7110-crypto", .data = NULL},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, starfive_dt_ids);
> 
> Keep your table close to its usage, just like in many other drivers.
> 

Moving this in the next version.

> > +
> > +static int starfive_dma_init(struct starfive_sec_dev *sdev) {
> > +	dma_cap_mask_t mask;
> > +	int err;
> > +
> > +	sdev->sec_xm_m = NULL;
> > +	sdev->sec_xm_p = NULL;
> > +
> > +	dma_cap_zero(mask);
> > +	dma_cap_set(DMA_SLAVE, mask);
> > +
> > +	sdev->sec_xm_m = dma_request_chan(sdev->dev, "sec_m");
> > +	if (IS_ERR(sdev->sec_xm_m)) {
> > +		dev_err(sdev->dev, "sec_m dma channel request failed.\n");
> 
> return dev_err_probe
> 

I'll replace this and the following return error with dev_err_probe .

> > +		return PTR_ERR(sdev->sec_xm_m);
> > +	}
> > +
> > +	sdev->sec_xm_p = dma_request_chan(sdev->dev, "sec_p");
> > +	if (IS_ERR(sdev->sec_xm_p)) {
> > +		dev_err(sdev->dev, "sec_p dma channel request failed.\n");
> 
> dev_err_probe
> 
> > +		goto err_dma_out;
> > +	}
> > +
> > +	init_completion(&sdev->sec_comp_m);
> > +	init_completion(&sdev->sec_comp_p);
> > +
> > +	return 0;
> > +
> > +err_dma_out:
> > +	dma_release_channel(sdev->sec_xm_m);
> 
> I don't think you tested it. Not even built with proper tools liek smatch,
> sparse, W=1. Where do you set err?
> 

I'll compile this driver with proper tools before submitting the new patch series.

> > +
> > +	return err;
> > +}
> > +
> > +static void starfive_dma_cleanup(struct starfive_sec_dev *sdev) {
> > +	dma_release_channel(sdev->sec_xm_p);
> > +	dma_release_channel(sdev->sec_xm_m);
> > +}
> > +
> > +static int starfive_cryp_probe(struct platform_device *pdev) {
> > +	struct device *dev = &pdev->dev;
> > +	struct starfive_sec_dev *sdev;
> > +	struct resource *res;
> > +	int pages = 0;
> > +	int ret;
> > +
> > +	sdev = devm_kzalloc(dev, sizeof(*sdev), GFP_KERNEL);
> > +	if (!sdev)
> > +		return -ENOMEM;
> > +
> > +	sdev->dev = dev;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "secreg");
> > +	sdev->io_base = devm_ioremap_resource(dev, res);
> 
> I think there is a wrapper for both calls...
> 

I'll replace this with devm_platform_ioremap_resource_byname()

> > +
> > +	if (IS_ERR(sdev->io_base))
> > +		return PTR_ERR(sdev->io_base);
> > +
> > +	sdev->use_side_channel_mitigation =
> > +		device_property_read_bool(dev, "enable-side-channel-
> mitigation");
> > +	sdev->use_dma = device_property_read_bool(dev, "enable-dma");
> > +	sdev->dma_maxburst = 32;
> > +
> > +	sdev->sec_hclk = devm_clk_get(dev, "sec_hclk");
> > +	if (IS_ERR(sdev->sec_hclk)) {
> > +		dev_err(dev, "Failed to get sec_hclk.\n");
> > +		return PTR_ERR(sdev->sec_hclk);
> 
> return dev_err_probe
> 
> > +	}
> > +
> > +	sdev->sec_ahb = devm_clk_get(dev, "sec_ahb");
> > +	if (IS_ERR(sdev->sec_ahb)) {
> > +		dev_err(dev, "Failed to get sec_ahb.\n");
> > +		return PTR_ERR(sdev->sec_ahb);
> 
> return dev_err_probe
> 
> > +	}
> > +
> > +	sdev->rst_hresetn = devm_reset_control_get_shared(sdev->dev,
> "sec_hre");
> > +	if (IS_ERR(sdev->rst_hresetn)) {
> > +		dev_err(sdev->dev, "Failed to get sec_hre.\n");
> > +		return PTR_ERR(sdev->rst_hresetn);
> 
> return dev_err_probe
> 
> > +	}
> > +
> > +	clk_prepare_enable(sdev->sec_hclk);
> > +	clk_prepare_enable(sdev->sec_ahb);
> > +	reset_control_deassert(sdev->rst_hresetn);
> > +
> > +	platform_set_drvdata(pdev, sdev);
> > +
> > +	spin_lock(&dev_list.lock);
> > +	list_add(&sdev->list, &dev_list.dev_list);
> > +	spin_unlock(&dev_list.lock);
> > +
> > +	if (sdev->use_dma) {
> > +		ret = starfive_dma_init(sdev);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to initialize DMA channel.\n");
> > +			goto err_dma_init;
> > +		}
> > +	}
> > +
> > +	pages = get_order(STARFIVE_MSG_BUFFER_SIZE);
> > +
> > +	sdev->pages_count = pages >> 1;
> > +	sdev->data_buf_len = STARFIVE_MSG_BUFFER_SIZE >> 1;
> > +
> > +	/* Initialize crypto engine */
> > +	sdev->engine = crypto_engine_alloc_init(dev, 1);
> > +	if (!sdev->engine) {
> > +		ret = -ENOMEM;
> > +		goto err_engine;
> > +	}
> > +
> > +	ret = crypto_engine_start(sdev->engine);
> > +	if (ret)
> > +		goto err_engine_start;
> > +
> > +	dev_info(dev, "Crypto engine started\n");
> 
> Drop silly probe success messages.
> 

Removing this in the next version.

> > +
> > +	return 0;
> > +
> > +err_engine_start:
> > +	crypto_engine_exit(sdev->engine);
> > +err_engine:
> > +	starfive_dma_cleanup(sdev);
> > +err_dma_init:
> > +	spin_lock(&dev_list.lock);
> > +	list_del(&sdev->list);
> > +	spin_unlock(&dev_list.lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int starfive_cryp_remove(struct platform_device *pdev) {
> > +	struct starfive_sec_dev *sdev = platform_get_drvdata(pdev);
> > +
> > +	if (!sdev)
> > +		return -ENODEV;
> > +
> > +	crypto_engine_stop(sdev->engine);
> > +	crypto_engine_exit(sdev->engine);
> > +
> > +	starfive_dma_cleanup(sdev);
> > +
> > +	spin_lock(&dev_list.lock);
> > +	list_del(&sdev->list);
> > +	spin_unlock(&dev_list.lock);
> > +
> > +	clk_disable_unprepare(sdev->sec_hclk);
> > +	clk_disable_unprepare(sdev->sec_ahb);
> > +	reset_control_assert(sdev->rst_hresetn);
> > +
> > +	return 0;
> > +}
> > +
> > +#ifdef CONFIG_PM
> > +static int starfive_cryp_runtime_suspend(struct device *dev) {
> > +	struct starfive_sec_dev *sdev = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(sdev->sec_ahb);
> > +	clk_disable_unprepare(sdev->sec_hclk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int starfive_cryp_runtime_resume(struct device *dev) {
> > +	struct starfive_sec_dev *sdev = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(sdev->sec_ahb);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "Failed to prepare_enable sec_ahb
> clock\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_prepare_enable(sdev->sec_hclk);
> > +	if (ret) {
> > +		dev_err(sdev->dev, "Failed to prepare_enable sec_hclk
> clock\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops starfive_cryp_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +				pm_runtime_force_resume)
> > +	SET_RUNTIME_PM_OPS(starfive_cryp_runtime_suspend,
> > +			   starfive_cryp_runtime_resume, NULL) };
> > +
> > +static struct platform_driver starfive_cryp_driver = {
> > +	.probe  = starfive_cryp_probe,
> > +	.remove = starfive_cryp_remove,
> > +	.driver = {
> > +		.name           = DRIVER_NAME,
> > +		.pm		= &starfive_cryp_pm_ops,
> > +		.of_match_table = starfive_dt_ids,
> > +	},
> > +};
> > +
> > +module_platform_driver(starfive_cryp_driver);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("StarFive hardware crypto acceleration");
> > diff --git a/drivers/crypto/starfive/starfive-regs.h
> > b/drivers/crypto/starfive/starfive-regs.h
> > new file mode 100644
> > index 000000000000..0d680cb1f502
> > --- /dev/null
> > +++ b/drivers/crypto/starfive/starfive-regs.h
> > @@ -0,0 +1,26 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */ #ifndef __STARFIVE_REGS_H__
> > +#define __STARFIVE_REGS_H__
> > +
> > +#define STARFIVE_ALG_CR_OFFSET			0x0
> > +#define STARFIVE_ALG_FIFO_OFFSET		0x4
> > +#define STARFIVE_IE_MASK_OFFSET			0x8
> > +#define STARFIVE_IE_FLAG_OFFSET			0xc
> > +#define STARFIVE_DMA_IN_LEN_OFFSET		0x10
> > +#define STARFIVE_DMA_OUT_LEN_OFFSET		0x14
> > +
> > +union starfive_alg_cr {
> > +	u32 v;
> > +	struct {
> > +		u32 start			:1;
> > +		u32 aes_dma_en			:1;
> > +		u32 rsvd_0			:1;
> > +		u32 hash_dma_en			:1;
> > +		u32 alg_done			:1;
> > +		u32 rsvd_1			:3;
> > +		u32 clear			:1;
> > +		u32 rsvd_2			:23;
> > +	};
> > +};
> > +
> > +#endif
> > diff --git a/drivers/crypto/starfive/starfive-str.h
> > b/drivers/crypto/starfive/starfive-str.h
> > new file mode 100644
> > index 000000000000..4ba3c56f0573
> > --- /dev/null
> > +++ b/drivers/crypto/starfive/starfive-str.h
> > @@ -0,0 +1,74 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */ #ifndef __STARFIVE_STR_H__
> > +#define __STARFIVE_STR_H__
> > +
> > +#include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dmaengine.h>
> > +
> > +#include <crypto/engine.h>
> > +
> > +#include "starfive-regs.h"
> > +
> > +#define STARFIVE_MSG_BUFFER_SIZE		SZ_16K
> > +
> > +struct starfive_sec_ctx {
> > +	struct crypto_engine_ctx		enginectx;
> > +	struct starfive_sec_dev			*sdev;
> > +
> > +	u8					*buffer;
> > +};
> > +
> > +struct starfive_sec_dev {
> > +	struct list_head			list;
> > +	struct device				*dev;
> > +
> > +	struct clk				*sec_hclk;
> > +	struct clk				*sec_ahb;
> > +	struct reset_control			*rst_hresetn;
> > +
> > +	void __iomem				*io_base;
> > +	phys_addr_t				io_phys_base;
> > +
> > +	size_t					data_buf_len;
> > +	int					pages_count;
> > +	u32					use_side_channel_mitigation;
> > +	u32					use_dma;
> > +	u32					dma_maxburst;
> > +	struct dma_chan				*sec_xm_m;
> > +	struct dma_chan				*sec_xm_p;
> > +	struct dma_slave_config			cfg_in;
> > +	struct dma_slave_config			cfg_out;
> > +	struct completion			sec_comp_m;
> > +	struct completion			sec_comp_p;
> > +
> > +	struct crypto_engine			*engine;
> > +
> > +	union starfive_alg_cr			alg_cr;
> > +};
> > +
> > +static inline u32 starfive_sec_read(struct starfive_sec_dev *sdev,
> > +u32 offset) {
> > +	return __raw_readl(sdev->io_base + offset);
> 
> I don't think these read/write wrappers help anyhow...
> 

These wrappers are used by the crypto primitives in this patch series.
I'll move these to subsequent patches when they are first used.

Thank you for spending time reviewing and providing helpful comments
for this driver.

Regards,
Jia Jie
 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
