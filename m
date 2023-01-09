Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34003C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNbHkNkl84FW7QUmIqgUadwLJUfeBMqAl+qMA/xZ1TI=; b=xwvUiLwdToLgn/
	VQFS2E0ej/NoGsDyfhRC6g26uRo/nX+DVNLRajrTpSAtKnYNFG/vZJCZxVXzu17Ebmb0huy6cj5X+
	SI9P6Uu1AkNdx9uDl4TKE/gkptrU9cVuRkM0t8uXDQ3EiDF6ycUhZrJXOGPu57LQu2fvUOzMHx10S
	RCCY6dVA3FEMSLj6mtALY7zIfHGMQhmRSQMHFN/WhUJ/WZAvVP5xSMCr5nyarWKbyy5pStzAFyPKh
	6l7nL8Hysbj7IS3gcNoOvj0SB/Z8p3oEK2+2zruuO6wwx8CElCLUvEB84P3sYMC+cLLBUMOppW4kW
	uni3kc1skRsSxRoZrZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEgk5-00Gc0w-Jz; Mon, 09 Jan 2023 01:14:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEgk1-00Gbul-1i
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 01:14:24 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 792FB24E0FC;
	Mon,  9 Jan 2023 09:13:30 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 09:13:30 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 09:13:28 +0800
Message-ID: <cfa385a6-50d4-a2c3-907a-0bc0647467ec@starfivetech.com>
Date: Mon, 9 Jan 2023 09:13:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/7] net: stmmac: Add glue layer for StarFive JH7110
 SoCs
To: <Arun.Ramadoss@microchip.com>, <netdev@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
CC: <andrew@lunn.ch>, <robh+dt@kernel.org>, <pgwipeout@gmail.com>,
	<kernel@esmil.dk>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<edumazet@google.com>, <richardcochran@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <davem@davemloft.net>,
	<hkallweit1@gmail.com>
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-6-yanhong.wang@starfivetech.com>
 <720bffcd0dde99d6a87aea6baa8b5ccefe65a178.camel@microchip.com>
Content-Language: en-US
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <720bffcd0dde99d6a87aea6baa8b5ccefe65a178.camel@microchip.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_171421_430617_5BA8D665 
X-CRM114-Status: GOOD (  17.73  )
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



On 2023/1/8 19:11, Arun.Ramadoss@microchip.com wrote:
> Hi Yanhong,
> 
> On Fri, 2023-01-06 at 10:59 +0800, Yanhong Wang wrote:
>> This adds StarFive dwmac driver support on the StarFive JH7110 SoCs.
>> 
>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> ---
>>  MAINTAINERS                                   |   1 +
>>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
>>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>>  .../stmicro/stmmac/dwmac-starfive-plat.c      | 123
>> ++++++++++++++++++
>>  4 files changed, 137 insertions(+)
>>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-
>> starfive-plat.c
>> 
>> 
>> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-
>> plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
>> new file mode 100644
>> index 000000000000..910095b10fe4
>> --- /dev/null
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive-plat.c
>> @@ -0,0 +1,123 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * StarFive DWMAC platform driver
>> + *
>> + * Copyright(C) 2022 StarFive Technology Co., Ltd.
>> + *
>> + */
>> +
>> +#include <linux/of_device.h>
> 
> Blank line between header with <  > and " "
> 

Thanks, i will fix.

>> +#include "stmmac_platform.h"
>> +
>> +struct starfive_dwmac {
>> +	struct device *dev;
>> +	struct clk *clk_tx;
>> +	struct clk *clk_gtx;
>> +	struct clk *clk_gtxc;
>> +};
>> +
>> +static void starfive_eth_plat_fix_mac_speed(void *priv, unsigned int
>> speed)
>> +{
>> +	struct starfive_dwmac *dwmac = priv;
>> +	unsigned long rate;
>> +	int err;
>> +
>> +	switch (speed) {
>> +	case SPEED_1000:
>> +		rate = 125000000;
>> +		break;
>> +	case SPEED_100:
>> +		rate = 25000000;
>> +		break;
>> +	case SPEED_10:
>> +		rate = 2500000;
>> +		break;
>> +	default:
>> +		dev_err(dwmac->dev, "invalid speed %u\n", speed);
>> +		return;
> 
> Do we need to return value, since it is invalid speed. But the return
> value of function is void.
> 

I will fix.

>> +	}
>> +
>> +	err = clk_set_rate(dwmac->clk_gtx, rate);
>> +	if (err)
>> +		dev_err(dwmac->dev, "failed to set tx rate %lu\n",
>> rate);
>> +}
>> +
>> +static int starfive_eth_plat_probe(struct platform_device *pdev)
>> +{
>> +	struct plat_stmmacenet_data *plat_dat;
>> +	struct stmmac_resources stmmac_res;
>> +	struct starfive_dwmac *dwmac;
>> +	int (*syscon_init)(struct device *dev);
> 
> Reverse christmas tree.
> 

I will delete the unused variable syscon_init.

>> +	int err;
>> +
>> +	err = stmmac_get_platform_resources(pdev, &stmmac_res);
>> +	if (err)
>> +		return err;
>> +
>> +	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
>> +	if (IS_ERR(plat_dat)) {
>> +		dev_err(&pdev->dev, "dt configuration failed\n");
>> +		return PTR_ERR(plat_dat);
>> +	}
>> +
>> +	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
>> +	if (!dwmac)
>> +		return -ENOMEM;
>> +
>> +	syscon_init = of_device_get_match_data(&pdev->dev);
>> +	if (syscon_init) {
>> +		err = syscon_init(&pdev->dev);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	dwmac->clk_tx = devm_clk_get_enabled(&pdev->dev, "tx");
>> +	if (IS_ERR(dwmac->clk_tx))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
>> >clk_tx),
>> +						"error getting tx
>> clock\n");
>> +
>> +	dwmac->clk_gtx = devm_clk_get_enabled(&pdev->dev, "gtx");
>> +	if (IS_ERR(dwmac->clk_gtx))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
>> >clk_gtx),
>> +						"error getting gtx
>> clock\n");
>> +
>> +	dwmac->clk_gtxc = devm_clk_get_enabled(&pdev->dev, "gtxc");
>> +	if (IS_ERR(dwmac->clk_gtxc))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac-
>> >clk_gtxc),
>> +						"error getting gtxc
>> clock\n");
>> +
>> +	dwmac->dev = &pdev->dev;
>> +	plat_dat->fix_mac_speed = starfive_eth_plat_fix_mac_speed;
>> +	plat_dat->init = NULL;
>> +	plat_dat->bsp_priv = dwmac;
>> +	plat_dat->dma_cfg->dche = true;
>> +
>> +	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>> +	if (err) {
>> +		stmmac_remove_config_dt(pdev, plat_dat);
>> +		return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
