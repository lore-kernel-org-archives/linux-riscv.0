Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188DFEB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxX0E3uJEVPkMVAK2XUL1LGsf4lkto3eKifvOAxQ3gI=; b=SVJJ9Og/I9BwHM
	jCXW1+q/H+gXquec7+WtEDngqAw95TVSDqM4ixtFdLjGl5tUoc4UWklPCpDo7rpBfdjSO8W13iCSJ
	+QtTHulz401EOLEVIJXbX38W4VZVZ49mFFD9YnyGZ6/j3tomKMgGo/ZNPFUZAL8hKS/sjVIKMx15K
	6HbZpdmpAjtv1muB3bU+/nZZfoCf5P0x0ggEdSfuYO3SrJmKXpSSbJ15sSSiUS/zWlPdQMDHHAQ7T
	6D8V92RMpX4NJOcDnuY44AhFlMo4+Rav2I+BuCFbWvxwD0uJZ5GZxwzmMEXlxpyJrPB5NewbOUPZk
	5lMQxiDyYAeUlC1j0dQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHQ-00A4Dd-3B;
	Mon, 26 Jun 2023 11:21:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkHL-00A3ye-2V;
	Mon, 26 Jun 2023 11:21:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BAEBD24E046;
	Mon, 26 Jun 2023 19:20:30 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:20:30 +0800
Received: from [192.168.125.127] (113.72.146.167) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:20:29 +0800
Message-ID: <1c6036f2-bacf-2c2c-0649-6ad75ece9e06@starfivetech.com>
Date: Mon, 26 Jun 2023 19:20:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 3/5] phy: starfive: Add JH7110 USB 2.0 PHY driver
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Roger Quadros <rogerq@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Mason Huo <mason.huo@starfivetech.com>
References: <20230619094759.21013-1-minda.chen@starfivetech.com>
 <20230619094759.21013-4-minda.chen@starfivetech.com>
 <ZJLbCbG9+XnGVjKb@matsya>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <ZJLbCbG9+XnGVjKb@matsya>
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042108_301090_628C5C54 
X-CRM114-Status: GOOD (  23.17  )
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



On 2023/6/21 19:12, Vinod Koul wrote:
> On 19-06-23, 17:47, Minda Chen wrote:
>> Add Starfive JH7110 SoC USB 2.0 PHY driver support.
>> USB 2.0 PHY default connect to Cadence USB controller.
>> 
>> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
>> Reviewed-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  MAINTAINERS                           |   6 ++
>>  drivers/phy/Kconfig                   |   1 +
>>  drivers/phy/Makefile                  |   1 +
>>  drivers/phy/starfive/Kconfig          |  15 +++
>>  drivers/phy/starfive/Makefile         |   2 +
>>  drivers/phy/starfive/phy-jh7110-usb.c | 150 ++++++++++++++++++++++++++
>>  6 files changed, 175 insertions(+)
>>  create mode 100644 drivers/phy/starfive/Kconfig
>>  create mode 100644 drivers/phy/starfive/Makefile
>>  create mode 100644 drivers/phy/starfive/phy-jh7110-usb.c
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f794002a192e..d2ce89a8d31c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20174,6 +20174,12 @@ S:	Supported
>>  F:	Documentation/devicetree/bindings/watchdog/starfive*
>>  F:	drivers/watchdog/starfive-wdt.c
>>  
>> +STARFIVE JH71X0 USB PHY DRIVER
>> +M:	Minda Chen <minda.chen@starfivetech.com>
>> +S:	Supported
>> +F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> +F:	drivers/phy/starfive/phy-jh7110-usb.c
>> +
>>  STATIC BRANCH/CALL
>>  M:	Peter Zijlstra <peterz@infradead.org>
>>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index f46e3148d286..0000149edbc4 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -91,6 +91,7 @@ source "drivers/phy/rockchip/Kconfig"
>>  source "drivers/phy/samsung/Kconfig"
>>  source "drivers/phy/socionext/Kconfig"
>>  source "drivers/phy/st/Kconfig"
>> +source "drivers/phy/starfive/Kconfig"
>>  source "drivers/phy/sunplus/Kconfig"
>>  source "drivers/phy/tegra/Kconfig"
>>  source "drivers/phy/ti/Kconfig"
>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index 54f312c10a40..fb3dc9de6111 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile
>> @@ -31,6 +31,7 @@ obj-y					+= allwinner/	\
>>  					   samsung/	\
>>  					   socionext/	\
>>  					   st/		\
>> +					   starfive/	\
>>  					   sunplus/	\
>>  					   tegra/	\
>>  					   ti/		\
>> diff --git a/drivers/phy/starfive/Kconfig b/drivers/phy/starfive/Kconfig
>> new file mode 100644
>> index 000000000000..2283feadfc76
>> --- /dev/null
>> +++ b/drivers/phy/starfive/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# Phy drivers for StarFive platforms
>> +#
>> +
>> +config PHY_STARFIVE_JH7110_USB
>> +	tristate "Starfive JH7110 USB 2.0 PHY support"
>> +	depends on USB_SUPPORT
>> +	select GENERIC_PHY
>> +	select USB_PHY
>> +	help
>> +	  Enable this to support the StarFive USB 2.0 PHY,
>> +	  used with the Cadence USB controller.
>> +	  If M is selected, the module will be called
>> +	  phy-jh7110-usb.ko.
>> diff --git a/drivers/phy/starfive/Makefile b/drivers/phy/starfive/Makefile
>> new file mode 100644
>> index 000000000000..52e9a09cc619
>> --- /dev/null
>> +++ b/drivers/phy/starfive/Makefile
>> @@ -0,0 +1,2 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +obj-$(CONFIG_PHY_STARFIVE_JH7110_USB)	+= phy-jh7110-usb.o
>> diff --git a/drivers/phy/starfive/phy-jh7110-usb.c b/drivers/phy/starfive/phy-jh7110-usb.c
>> new file mode 100644
>> index 000000000000..90d788423705
>> --- /dev/null
>> +++ b/drivers/phy/starfive/phy-jh7110-usb.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * StarFive JH7110 USB 2.0 PHY driver
>> + *
>> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
>> + * Author: Minda Chen <minda.chen@starfivetech.com>
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/err.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/usb/of.h>
>> +
>> +#define USB_125M_CLK_RATE		125000000
>> +#define USB_LS_KEEPALIVE_OFF		0x4
>> +#define USB_LS_KEEPALIVE_ENABLE		BIT(4)
>> +
>> +struct jh7110_usb2_phy {
>> +	struct phy *phy;
>> +	void __iomem *regs;
>> +	struct clk *usb_125m_clk;
>> +	struct clk *app_125m;
>> +	enum phy_mode mode;
>> +};
>> +
>> +static void jh7110_usb2_mode_set(struct jh7110_usb2_phy *phy)
>> +{
>> +	unsigned int val;
>> +
>> +	if (phy->mode != PHY_MODE_USB_HOST) {
>> +		/* Enable the LS speed keep-alive signal */
>> +		val = readl(phy->regs + USB_LS_KEEPALIVE_OFF);
>> +		val |= USB_LS_KEEPALIVE_ENABLE;
>> +		writel(val, phy->regs + USB_LS_KEEPALIVE_OFF);
>> +	}
> 
> looks like this sets only for host, so why not call it
> jh7110_usb2_set_host_mode() rather than get confused about
> jh7110_usb2_mode_set/jh7110_usb2_phy_set_mode
> 
Thanks , It is only for host, I will change it.
>> +}
>> +
>> +static int jh7110_usb2_phy_set_mode(struct phy *_phy,
>> +				    enum phy_mode mode, int submode)
>> +{
>> +	struct jh7110_usb2_phy *phy = phy_get_drvdata(_phy);
>> +
>> +	switch (mode) {
>> +	case PHY_MODE_USB_HOST:
>> +	case PHY_MODE_USB_DEVICE:
>> +	case PHY_MODE_USB_OTG:
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (mode != phy->mode) {
>> +		dev_dbg(&_phy->dev, "Changing phy to %d\n", mode);
>> +		phy->mode = mode;
>> +		jh7110_usb2_mode_set(phy);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int jh7110_usb2_phy_init(struct phy *_phy)
>> +{
>> +	struct jh7110_usb2_phy *phy = phy_get_drvdata(_phy);
>> +	int ret;
>> +
>> +	ret = clk_set_rate(phy->usb_125m_clk, USB_125M_CLK_RATE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = clk_prepare_enable(phy->app_125m);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int jh7110_usb2_phy_exit(struct phy *_phy)
>> +{
>> +	struct jh7110_usb2_phy *phy = phy_get_drvdata(_phy);
>> +
>> +	clk_disable_unprepare(phy->app_125m);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct phy_ops jh7110_usb2_phy_ops = {
>> +	.init		= jh7110_usb2_phy_init,
>> +	.exit		= jh7110_usb2_phy_exit,
>> +	.set_mode	= jh7110_usb2_phy_set_mode,
>> +	.owner		= THIS_MODULE,
>> +};
>> +
>> +static int jh7110_usb_phy_probe(struct platform_device *pdev)
>> +{
>> +	struct jh7110_usb2_phy *phy;
>> +	struct device *dev = &pdev->dev;
>> +	struct phy_provider *phy_provider;
>> +
>> +	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
>> +	if (!phy)
>> +		return -ENOMEM;
>> +
>> +	phy->usb_125m_clk = devm_clk_get(dev, "125m");
>> +	if (IS_ERR(phy->usb_125m_clk))
>> +		return dev_err_probe(dev, PTR_ERR(phy->usb_125m_clk),
>> +			"Failed to get 125m clock\n");
>> +
>> +	phy->app_125m = devm_clk_get(dev, "app_125m");
>> +	if (IS_ERR(phy->app_125m))
>> +		return dev_err_probe(dev, PTR_ERR(phy->app_125m),
>> +			"Failed to get app 125m clock\n");
>> +
>> +	phy->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(phy->regs))
>> +		return dev_err_probe(dev, PTR_ERR(phy->regs),
>> +			"Failed to map phy base\n");
>> +
>> +	phy->phy = devm_phy_create(dev, NULL, &jh7110_usb2_phy_ops);
>> +	if (IS_ERR(phy->phy))
>> +		return dev_err_probe(dev, PTR_ERR(phy->phy),
>> +			"Failed to create phy\n");
>> +
>> +	phy_set_drvdata(phy->phy, phy);
>> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +
>> +	return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static const struct of_device_id jh7110_usb_phy_of_match[] = {
>> +	{ .compatible = "starfive,jh7110-usb-phy" },
>> +	{ /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, jh7110_usb_phy_of_match);
>> +
>> +static struct platform_driver jh7110_usb_phy_driver = {
>> +	.probe	= jh7110_usb_phy_probe,
>> +	.driver = {
>> +		.of_match_table	= jh7110_usb_phy_of_match,
>> +		.name  = "jh7110-usb-phy",
>> +	}
>> +};
>> +module_platform_driver(jh7110_usb_phy_driver);
> 
> A very light driver, only setting couple of things for hw. Can you
> explain how phy registers are configured, am sure there would be many
> more..? Do you rely on bootloader or some other entity for that?
> 
Phy Setting is set by reset. Because it is for StarFive JH7110 only. The same as PCIe PHY.
>> +
>> +MODULE_DESCRIPTION("StarFive JH7110 USB 2.0 PHY driver");
>> +MODULE_AUTHOR("Minda Chen <minda.chen@starfivetech.com>");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
