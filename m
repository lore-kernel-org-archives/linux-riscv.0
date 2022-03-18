Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC3CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5OGRl5yTuyP+Ir3v986p080zbhs2B3e1pGLvZPoMdk=; b=OajtNM6Z7A88i3
	Ok915Wb7RMSOuj2N5WCKbRe8rycgV40P2S4fiVCKBhKvsGhM0sk7JnHzvpTvQ1O6Lunhn3ULnjSor
	fwpVzc3WcNdRVKcIwKgsCGnfGoFSKC6x6oq3MtRdpwh2qWlGQKGol/sphnCowJY4mAgnwdIeHslcB
	V/4GZ3IonPzvN5alqywyaYiObYTbIAAM3fYifCF4kcWZobG4Tf5ja4HU9QhOgHTucPpZ378Le1zcd
	cDa/IPgfEoO8T4/P2z4wUEtxZYqRx/iOBq16PUvDaSWZj6nMCBRL65TTa0aLPRprqk7HzZc6nwDyB
	Gj/awG2Ie+7nPlAU9vUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEBi-002BzT-RV; Fri, 18 Mar 2022 15:06:46 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVE21-0026qU-7q
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 14:56:47 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nVE1r-0000kv-ND; Fri, 18 Mar 2022 14:56:35 +0000
Message-ID: <cd90c33d-d4ea-de8a-9634-24d0cd394fe1@codethink.co.uk>
Date: Fri, 18 Mar 2022 14:56:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] i2c: add support for microchip fpga i2c controllers
Content-Language: en-GB
To: Conor Dooley <conor.dooley@microchip.com>, wsa@kernel.org,
 linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 daire.mcnamara@microchip.com
References: <20220315153206.833291-1-conor.dooley@microchip.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220315153206.833291-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_075645_351208_CF0F74C1 
X-CRM114-Status: GOOD (  23.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/03/2022 15:32, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
> 
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/i2c/busses/Kconfig              |  11 +
>   drivers/i2c/busses/Makefile             |   1 +
>   drivers/i2c/busses/i2c-microchip-core.c | 487 ++++++++++++++++++++++++
>   3 files changed, 499 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-microchip-core.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..3d4d8e0e9de7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -781,6 +781,17 @@ config I2C_MESON
>   	  If you say yes to this option, support will be included for the
>   	  I2C interface on the Amlogic Meson family of SoCs.
>   

snip

> +
> +static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl &= ~CTRL_ENS1;
> +	writel(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl |= CTRL_ENS1;
> +	writel(ctrl, idev->base + CORE_I2C_CTRL);
> +}

Not sure why you would use readl/writel with an u8, surely an
readb/writeb be better?


> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status = idev->isr_status;
> +	u8 ctrl;
> +
> +	if (!idev->buf) {
> +		dev_warn(idev->dev, "unexpected interrupt\n");
> +		return IRQ_HANDLED;
> +	}

is IRQ_HANDLED correct here?

> +
> +static int mchp_corei2c_probe(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = NULL;
> +	struct resource *res;
> +	int irq, ret;
> +	u32 val;
> +
> +	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(idev->base))
> +		return PTR_ERR(idev->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "missing interrupt resource\n");
> +
> +	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(idev->i2c_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
> +				     "missing clock\n");
> +
> +	idev->dev = &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);
> +
> +	val = device_property_read_u32(idev->dev, "clock-frequency",
> +				       &idev->bus_clk_rate);
> +	if (val) {
> +		dev_info(&pdev->dev, "default to 100kHz\n");
> +		idev->bus_clk_rate = 100000;
> +	}
> +
> +	if (idev->bus_clk_rate > 400000)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "clock-frequency too high: %d\n",
> +				     idev->bus_clk_rate);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> +			       pdev->name, idev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to claim irq %d\n", irq);
> +
> +	ret = clk_prepare_enable(idev->i2c_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable clock\n");
> +
> +	ret = mchp_corei2c_init(idev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to program clock divider\n");

going to leak a prepared clock from here on?

> +	i2c_set_adapdata(&idev->adapter, idev);
> +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +		 "Microchip I2C hw bus");
> +	idev->adapter.owner = THIS_MODULE;
> +	idev->adapter.algo = &mchp_corei2c_algo;
> +	idev->adapter.dev.parent = &pdev->dev;
> +	idev->adapter.dev.of_node = pdev->dev.of_node;
> +
> +	platform_set_drvdata(pdev, idev);
> +
> +	ret = i2c_add_adapter(&idev->adapter);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");

not sure if necessary, doesn't the i2c core also announce?

> +	return 0;
> +}
> +
> +static int mchp_corei2c_remove(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(idev->i2c_clk);
> +	i2c_del_adapter(&idev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mchp_corei2c_of_match[] = {
> +	{ .compatible = "microchip,mpfs-i2c" },
> +	{ .compatible = "microchip,corei2c-rtl-v7" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
> +
> +static struct platform_driver mchp_corei2c_driver = {
> +	.probe = mchp_corei2c_probe,
> +	.remove = mchp_corei2c_remove,
> +	.driver = {
> +		.name = "microchip-corei2c",
> +		.of_match_table = mchp_corei2c_of_match,
> +	},
> +};
> +
> +module_platform_driver(mchp_corei2c_driver);
> +
> +MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL v2");


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
