Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE864C74A5B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 01:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9oerqMaklw/RaI2lhlyVH81gb4dIIHqgwXUxq0lyFNc=; b=LR64tLdPwcGxLW
	VbejDUX06cg/kghXG2vyXKOPhtDf2dW3rJ1Rao6lpQZK9szxFhfNYTiGh90vCiCmfUbpC5i7Xv3ia
	lYquj1GepjPwj3gtoC5ZA9eVK2RjgKL4PFzpZ+VedEMS6AbWwbSz+125GDtQplJhedb9UD/trywIq
	4oPPiTsXPGDN6soL5xcXq+p2L7AFmH9X443ZKheo4AOOUCFLN48KvcL1hm2VcDfnbdQx863Wjsc7o
	OpHbd+xzUzuFWda3RXZj/FndjnXT+HcZEePcDJVnTEXFLRdsg4DkZPjojyV2FiEmPmWMqw7K5lCL6
	8E8I697WFFTGbIoL6HYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgbgy-009TFi-09;
	Mon, 27 Mar 2023 01:30:36 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgbgt-009TDk-19
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 01:30:34 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 27CE024E13F;
	Mon, 27 Mar 2023 09:29:55 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 09:29:55 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 09:29:53 +0800
Message-ID: <670108d3-d8d7-102b-75fc-52e2db8945f2@starfivetech.com>
Date: Mon, 27 Mar 2023 09:29:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 6/6] net: stmmac: starfive_dmac: Add phy interface
 settings
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Jose Abreu <joabreu@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230324022819.2324-1-samin.guo@starfivetech.com>
 <20230324022819.2324-7-samin.guo@starfivetech.com>
 <CAJM55Z8_W9yOcL+yGAwB-qanD_-bbf16VjCP66P_xDFW6-c+3A@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z8_W9yOcL+yGAwB-qanD_-bbf16VjCP66P_xDFW6-c+3A@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_183031_708899_D291F503 
X-CRM114-Status: GOOD (  22.36  )
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


Re: [PATCH v8 6/6] net: stmmac: starfive_dmac: Add phy interface settings
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/3/24

> On Fri, 24 Mar 2023 at 03:30, Samin Guo <samin.guo@starfivetech.com> wrote:
>>
>> dwmac supports multiple modess. When working under rmii and rgmii,
>> you need to set different phy interfaces.
>>
>> According to the dwmac document, when working in rmii, it needs to be
>> set to 0x4, and rgmii needs to be set to 0x1.
>>
>> The phy interface needs to be set in syscon, the format is as follows:
>> starfive,syscon: <&syscon, offset, shift>
>>
>> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
>> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
>> ---
>>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>> index ef5a769b1c75..84690c8f0250 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>> @@ -13,6 +13,10 @@
>>
>>  #include "stmmac_platform.h"
>>
>> +#define STARFIVE_DWMAC_PHY_INFT_RGMII  0x1
>> +#define STARFIVE_DWMAC_PHY_INFT_RMII   0x4
>> +#define STARFIVE_DWMAC_PHY_INFT_FIELD  0x7U
>> +
>>  struct starfive_dwmac {
>>         struct device *dev;
>>         struct clk *clk_tx;
>> @@ -44,6 +48,43 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
>>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>>  }
>>
>> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>> +{
>> +       struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>> +       struct regmap *regmap;
>> +       unsigned int args[2];
>> +       unsigned int mode;
>> +
>> +       switch (plat_dat->interface) {
>> +       case PHY_INTERFACE_MODE_RMII:
>> +               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
>> +               break;
>> +
>> +       case PHY_INTERFACE_MODE_RGMII:
>> +       case PHY_INTERFACE_MODE_RGMII_ID:
>> +               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
>> +               break;
>> +
>> +       default:
>> +               dev_err(dwmac->dev, "unsupported interface %d\n",
>> +                       plat_dat->interface);
>> +               return -EINVAL;
>> +       }
>> +
>> +       regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
>> +                                                     "starfive,syscon",
>> +                                                     2, args);
>> +       if (IS_ERR(regmap)) {
>> +               dev_err(dwmac->dev, "syscon regmap failed.\n");
>> +               return -ENXIO;
>> +       }
>> +
>> +       /* args[0]:offset  args[1]: shift */
>> +       return regmap_update_bits(regmap, args[0],
>> +                                 STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
>> +                                 mode << args[1]);
>> +}
>> +
>>  static int starfive_dwmac_probe(struct platform_device *pdev)
>>  {
>>         struct plat_stmmacenet_data *plat_dat;
>> @@ -89,6 +130,12 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>>         plat_dat->bsp_priv = dwmac;
>>         plat_dat->dma_cfg->dche = true;
>>
>> +       err = starfive_dwmac_set_mode(plat_dat);
>> +       if (err) {
>> +               dev_err(&pdev->dev, "dwmac set mode failed.\n");
>> +               return err;
>> +       }
> 
> Usually it's better to keep all error messages at the same "level".
> Like this you'll get two error messages if
> syscon_regmap_lookup_by_phandle_args fails. So I'd suggest moving this
> message into the starfive_dwmac_set_mode function and while you're at
> it you can do
> 
> err = regmap_update_bits(...);
> if (err)
>   return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
> 
> Also the file is called dwmac-starfive.c, so I'd expect the patch
> header to be "net: stmmac: dwmac-starfive: Add phy interface
> settings".
> 
> /Emil
> 

Thanks, the next version will be optimized.

Best regards,
Samin
>>         err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>>         if (err) {
>>                 stmmac_remove_config_dt(pdev, plat_dat);
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
