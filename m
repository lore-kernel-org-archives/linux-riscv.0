Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FBEC77B61
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 01:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kSOTEUS2gkKsfastyHId0KGDU248iX1Cq4FFFp6Llo=; b=c8AqIq3tOnLHxC
	gyuEtYJiWzeCIsR46LMQatx4/cCyKOhIy2HAj5e5hDOuJrWizzWwJdHG4BmyzHYgRE4faeTTVMyUd
	CSH8TdY4NJ3UUSSYQ1tYgaaDuWThRdpm8oQyq4ZDNr/eWa0xzmvTDmu3SqPmoTKpUAq/p+0MddWRz
	c7wcZtaN8+X2JPDxmDMFiZyK0BdpyAuqD3WNXS2Scxn+fgV0c+r9voaCtr1u3G4OEOhmYOyFUTik7
	+d7R5pUDDb8aZMkgGAyIZ6O33B36gfdzklH5OgKBTPNdW+TxoMewUePH9W6JNda2QIDE0AjmLgZCr
	f8VBPQoVflkxq9LFXbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkxJV-00BWjI-1R;
	Sat, 08 Apr 2023 01:24:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkxJR-00BWhf-1e
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 01:24:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7995A24E3F4;
	Sat,  8 Apr 2023 09:24:05 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 8 Apr
 2023 09:24:05 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 8 Apr
 2023 09:24:04 +0800
Message-ID: <152393bc-7d21-d19e-0800-fc4231a208b0@starfivetech.com>
Date: Sat, 8 Apr 2023 09:24:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [-net-next v11 6/6] net: stmmac: starfive-dmac: Add phy interface
 settings
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Pedro Moreira <pmmoreir@synopsys.com>, Richard Cochran
	<richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230407110356.8449-1-samin.guo@starfivetech.com>
 <20230407110356.8449-7-samin.guo@starfivetech.com>
 <CAJM55Z9LF+p-jWQkPzK=0ovfrXN0b-E5Ed49sbC9xOdrH5SuKA@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z9LF+p-jWQkPzK=0ovfrXN0b-E5Ed49sbC9xOdrH5SuKA@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_182417_886580_D55D8C88 
X-CRM114-Status: GOOD (  18.63  )
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

Re: [-net-next v11 6/6] net: stmmac: starfive-dmac: Add phy interface settings
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
to: Samin Guo <samin.guo@starfivetech.com>
data: 2023/4/8

> Hi Samin,
> 
> If you're respinning this series anyway, please use "net: stmmac:
> dwmac-starfive:" to match the filename.
>
Thanks, will fix.
 
> On Fri, 7 Apr 2023 at 13:05, Samin Guo <samin.guo@starfivetech.com> wrote:
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
>>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 48 +++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
>> index 4963d4008485..d6a1eddb51e8 100644
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
>> @@ -46,6 +50,46 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed)
>>                 dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
>>  }
>>
>> +static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>> +{
>> +       struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>> +       struct regmap *regmap;
>> +       unsigned int args[2];
>> +       unsigned int mode;
>> +       int err;
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
>> +       if (IS_ERR(regmap))
>> +               return dev_err_probe(dwmac->dev, PTR_ERR(regmap), "syscon regmap failed\n");
> 
> This message is a bit misleading. It's not actually that the regmap
> failed, but getting/looking up the regmap failed.
Will fix.

Best regards,
Samin
> 
>> +       /* args[0]:offset  args[1]: shift */
>> +       err = regmap_update_bits(regmap, args[0],
>> +                                STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
>> +                                mode << args[1]);
>> +       if (err)
>> +               return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
>> +
>> +       return 0;
>> +}
>> +
>>  static int starfive_dwmac_probe(struct platform_device *pdev)
>>  {
>>         struct plat_stmmacenet_data *plat_dat;
>> @@ -91,6 +135,10 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
>>         plat_dat->bsp_priv = dwmac;
>>         plat_dat->dma_cfg->dche = true;
>>
>> +       err = starfive_dwmac_set_mode(plat_dat);
>> +       if (err)
>> +               return err;
>> +
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
