Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 515E1C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajv/RoC6g+yktswD3XsL92sbHTg7uzsAFpHL83BnSH0=; b=takFNZ40P+ENEI
	TUScao7TGuCR17FR0o0ZLhNlIMTuW1p2+7a3G7nytjTRuBfk9xGhnAJf+Vf83u8RXQn6cj1kyxlMp
	g2Ohn5h1gGtV9trz+9ZW0jM2pp5Q4XakbuRgTjeudaE1dp8bNmqLBzq0UMDx+CfoJzVxNYIga62Ax
	3qr15iqU2mT2APrlUnkvHPrfgJooFQgNX9u2p0wFYi/cLBmT3vnyG/bk6/jImQHLlvvPjpw13IeGS
	Y/fvAo38ga7Z+dtHOfOjLoJ+r16/YSQnKRW6LIcqebEiMa27bFWaAmjmdIJ6Q3FYvyNF6qU105kts
	C9bEsORkNEBpLyiLwKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0cy-005MI7-1g; Fri, 03 Mar 2023 08:18:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0cr-005ME5-91
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 08:18:54 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 70D5D24E24F;
	Fri,  3 Mar 2023 16:18:15 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:18:15 +0800
Received: from [192.168.125.93] (113.72.145.171) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 3 Mar
 2023 16:18:14 +0800
Message-ID: <ffe8f7d0-8f47-859f-e7f8-8343b3ae6330@starfivetech.com>
Date: Fri, 3 Mar 2023 16:18:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v3 2/3] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230227131042.16125-1-walker.chen@starfivetech.com>
 <20230227131042.16125-3-walker.chen@starfivetech.com>
 <CAJM55Z946EVyN50KcBmh7chOOnzwTOjwLR+Z_fCOrfin9j7LNA@mail.gmail.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z946EVyN50KcBmh7chOOnzwTOjwLR+Z_fCOrfin9j7LNA@mail.gmail.com>
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_001849_645277_23A2B878 
X-CRM114-Status: GOOD (  27.81  )
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



On 2023/2/27 21:47, Emil Renner Berthing wrote:
> On Mon, 27 Feb 2023 at 14:11, Walker Chen <walker.chen@starfivetech.com> wrote:
>>
>> Add DMA reset operation in device probe and use different configuration
>> on CH_CFG registers according to match data.
>>
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Hi Walker,
> 
> Firstly your Signed-off-by should be the last line.
> 
> I may have been unclear in my last review, sorry. I meant to give my
> reviewed-by if you just removed the reset pointer that was never used.
> This new version also adds a lot of new code.
> 
> Though, I'm glad you want to update the driver to use match data
> rather than of_device_is_compatible, but then please update all uses
> of of_device_is_compatible. With this patch starfive uses match data
> and the intel,kmb-axi-dma still uses of_device_is_compatible.

Hey Emil, thank you for pointing out these problems for me.
Will be fixed.

> More comments below..
> 
>> ---
>>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 34 +++++++++++++++++--
>>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  7 ++++
>>  2 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> index bf85aa0979ec..400eeef707bf 100644
>> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> @@ -21,10 +21,12 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>> +#include <linux/of_device.h>
>>  #include <linux/of_dma.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/property.h>
>> +#include <linux/reset.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>
>> @@ -86,7 +88,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>>
>>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
>> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
>> +           !chan->chip->dw->hdata->use_cfg2) {
>>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
>> @@ -1142,7 +1145,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>>         axi_chan_disable(chan);
>>
>>         ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
>> -                                       !(val & chan_active), 1000, 10000);
>> +                                       !(val & chan_active), 1000, DMAC_TIMEOUT_US);
>>         if (ret == -ETIMEDOUT)
>>                 dev_warn(dchan2dev(dchan),
>>                          "%s failed to stop\n", axi_chan_name(chan));
>> @@ -1367,6 +1370,17 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>>         return 0;
>>  }
>>
>> +static int jh7110_rst_init(struct platform_device *pdev)
>> +{
>> +       struct reset_control *resets;
>> +
>> +       resets = devm_reset_control_array_get_exclusive(&pdev->dev);
>> +       if (IS_ERR(resets))
>> +               return PTR_ERR(resets);
>> +
>> +       return reset_control_deassert(resets);
>> +}
>> +
>>  static int dw_probe(struct platform_device *pdev)
>>  {
>>         struct device_node *node = pdev->dev.of_node;
>> @@ -1374,6 +1388,7 @@ static int dw_probe(struct platform_device *pdev)
>>         struct resource *mem;
>>         struct dw_axi_dma *dw;
>>         struct dw_axi_dma_hcfg *hdata;
>> +       const struct axi_dma_chip_config *ccfg;
>>         u32 i;
>>         int ret;
>>
>> @@ -1416,6 +1431,15 @@ static int dw_probe(struct platform_device *pdev)
>>         if (IS_ERR(chip->cfgr_clk))
>>                 return PTR_ERR(chip->cfgr_clk);
>>
>> +       ccfg = of_device_get_match_data(&pdev->dev);
>> +       if (ccfg) {
>> +               ret = ccfg->rst_init(pdev);
>> +               if (ret)
>> +                       return ret;
>> +
>> +               chip->dw->hdata->use_cfg2 = ccfg->use_cfg2;
>> +       }
>> +
>>         ret = parse_device_properties(chip);
>>         if (ret)
>>                 return ret;
>> @@ -1557,9 +1581,15 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>>         SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend, axi_dma_runtime_resume, NULL)
>>  };
>>
>> +static const struct axi_dma_chip_config jh7110_chip_config = {
>> +       .rst_init = jh7110_rst_init,
>> +       .use_cfg2 = true,
>> +};
>> +
>>  static const struct of_device_id dw_dma_of_id_table[] = {
>>         { .compatible = "snps,axi-dma-1.01a" },
>>         { .compatible = "intel,kmb-axi-dma" },
>> +       { .compatible = "starfive,jh7110-axi-dma", .data = &jh7110_chip_config },
>>         {}
>>  };
>>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> index e9d5eb0fd594..7b404ae9a26a 100644
>> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
>> @@ -21,6 +21,7 @@
>>  #define DMAC_MAX_CHANNELS      16
>>  #define DMAC_MAX_MASTERS       2
>>  #define DMAC_MAX_BLK_SIZE      0x200000
>> +#define DMAC_TIMEOUT_US                200000
>>
>>  struct dw_axi_dma_hcfg {
>>         u32     nr_channels;
>> @@ -33,6 +34,7 @@ struct dw_axi_dma_hcfg {
>>         /* Register map for DMAX_NUM_CHANNELS <= 8 */
>>         bool    reg_map_8_channels;
>>         bool    restrict_axi_burst_len;
>> +       bool    use_cfg2;
>>  };
>>
>>  struct axi_dma_chan {
>> @@ -72,6 +74,11 @@ struct axi_dma_chip {
>>         struct dw_axi_dma       *dw;
>>  };
>>
>> +struct axi_dma_chip_config {
>> +       int (*rst_init)(struct platform_device *pdev);
> 
> Please just spell reset in full, it's not that much longer.

Okay, this will be modified.

> 
>> +       bool use_cfg2;
>> +};
>> +
> 
> This struct is only used in dw-axi-dmac-platform.c above, so no need
> to add it here.

Okay, will be fixed.

Thank you very much for your review and comment!

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
