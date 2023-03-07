Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D05C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 01:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmE6PDxF8dvDmWLkkDOT0KaeYZCNGzroFeubzPUSYvA=; b=UmmC6g3bYJtT4c
	JPQKcQcGSY0WCpcqmedBGJU0QCoGEeASfwEBYxG8l1sDFxqAwzgYQADk3O9hEDU2rgaRDtZ+VbEcC
	UCNq+n1uJR2Gey13vaKzPk0wyeaz3+V2TvnLTVQ7Ym3iIEfAClZNZ2TsmR0t7xTpvVS4+3Dk4RwcZ
	sC/VKKIqj+7kiA4zD6kjIEc9Bm4G1nOKalwJuCZlYrr93ahwpB7pgzwtlOLaLY2YeSDNjMjqIhxyF
	E+osMKOusLtqJYJ7xtg4ll0s3MGcWBowrBvt1zGDCees0v1VrU5zKykzCM/8a3J+4mTW0NIVQnfci
	6A/Sd27m0BChChhmYPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMHb-00Fl8e-Rb; Tue, 07 Mar 2023 01:38:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMHY-00Fl6m-0B
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 01:38:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5E11724E21B;
	Tue,  7 Mar 2023 09:38:07 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:38:07 +0800
Received: from [192.168.125.96] (183.27.97.46) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:38:06 +0800
Message-ID: <ed697ea0-0f52-59d8-a68e-cc07ccd2e2b0@starfivetech.com>
Date: Tue, 7 Mar 2023 09:38:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 2/3] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
	<vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
 <20230306140430.28951-3-walker.chen@starfivetech.com>
 <CAJM55Z_216xezPNE1tXBsWA9pKk1ZaKsNVM=4PuHrg5Cgs3zcw@mail.gmail.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <CAJM55Z_216xezPNE1tXBsWA9pKk1ZaKsNVM=4PuHrg5Cgs3zcw@mail.gmail.com>
X-Originating-IP: [183.27.97.46]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_173824_369088_7C2A0915 
X-CRM114-Status: GOOD (  24.08  )
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



On 2023/3/6 22:39, Emil Renner Berthing wrote:
> On Mon, 6 Mar 2023 at 15:04, Walker Chen <walker.chen@starfivetech.com> wrote:
>>
>> Add dma reset operation in device probe and use different configuration
>> on CH_CFG registers according to match data. Update all uses of
>> of_device_is_compatible with of_device_get_match_data.
>>
>> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> 
> Hi Walker,
> 
> Again please remove my Reviewed-by when you're adding a bunch of new
> code as you're doing here.

Sorry, I made another simple mistake.

> 
>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>> ---
>>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 67 ++++++++++++++++---
>>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  2 +
>>  2 files changed, 61 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
>> index bf85aa0979ec..d1148f6fbcf9 100644
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
>> @@ -46,6 +48,12 @@
>>         DMA_SLAVE_BUSWIDTH_32_BYTES     | \
>>         DMA_SLAVE_BUSWIDTH_64_BYTES)
>>
>> +struct axi_dma_chip_config {
>> +       int (*apb_setup)(struct platform_device *pdev, struct axi_dma_chip *chip);
>> +       int (*reset_init)(struct platform_device *pdev);
>> +       bool use_cfg2;
>> +};
>> +
>>  static inline void
>>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
>>  {
>> @@ -86,7 +94,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>>
>>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
>> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
>> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
>> +           !chan->chip->dw->hdata->use_cfg2) {
>>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
>> @@ -1142,7 +1151,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>>         axi_chan_disable(chan);
>>
>>         ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
>> -                                       !(val & chan_active), 1000, 10000);
>> +                                       !(val & chan_active), 1000, DMAC_TIMEOUT_US);
>>         if (ret == -ETIMEDOUT)
>>                 dev_warn(dchan2dev(dchan),
>>                          "%s failed to stop\n", axi_chan_name(chan));
>> @@ -1367,13 +1376,33 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>>         return 0;
>>  }
>>
>> +static int intel_apb_setup(struct platform_device *pdev, struct axi_dma_chip *chip)
>> +{
>> +       chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
>> +       if (IS_ERR(chip->apb_regs))
>> +               return PTR_ERR(chip->apb_regs);
>> +       else
>> +               return 0;
>> +}
>> +
>> +static int jh7110_reset_init(struct platform_device *pdev)
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
>> -       struct device_node *node = pdev->dev.of_node;
>>         struct axi_dma_chip *chip;
>>         struct resource *mem;
>>         struct dw_axi_dma *dw;
>>         struct dw_axi_dma_hcfg *hdata;
>> +       const struct axi_dma_chip_config *ccfg;
>>         u32 i;
>>         int ret;
>>
>> @@ -1402,10 +1431,21 @@ static int dw_probe(struct platform_device *pdev)
>>         if (IS_ERR(chip->regs))
>>                 return PTR_ERR(chip->regs);
>>
>> -       if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
>> -               chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
>> -               if (IS_ERR(chip->apb_regs))
>> -                       return PTR_ERR(chip->apb_regs);
>> +       ccfg = of_device_get_match_data(&pdev->dev);
>> +       if (ccfg) {
>> +               if (ccfg->apb_setup) {
>> +                       ret = ccfg->apb_setup(pdev, chip);
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +
>> +               if (ccfg->reset_init) {
>> +                       ret = ccfg->reset_init(pdev);
>> +                       if (ret)
>> +                               return ret;
>> +               }
>> +
>> +               chip->dw->hdata->use_cfg2 = ccfg->use_cfg2;
> 
> This claims and deasserts the resets before the clocks, whereas your
> previous versions did it after turning the clocks on. Which is the
> correct order?

The order has no problem, I have tested it with audio pwmdac on VisionFive2 board.

> 
> Also this certainly gets rid of of_device_is_compatible calls, but
> seems like a lot of code to do that. Did you consider something like
> 
> +#define AXI_DMA_FLAG_HAS_APB_REGS BIT(0)
> +#define AXI_DMA_FLAG_HAS_RESETS BIT(1)
> +#define AXI_DMA_FLAG_USE_CFG2 BIT(2)
> 
> +unsigned int flags = (uintptr_t)device_get_match_data(&pdev->dev);
> 
> -if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
> +if (flags & AXI_DMA_FLAG_HAS_APB_REGS) {
> 
> -if (of_device_is_compatible(node, "starfive,jh7110-axi-dma)) {
> +if (flags & AXI_DMA_FLAG_HAS_RESETS) {
> 
> +chip->dw->hwdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> 
> -{ .compatible = "intel,kmb-axi-dma" },
> +{ .compatible = "intel,kmb-axi-dma", .data = (void
> *)AXI_DMA_FLAG_HAS_APB_REGS },
> +{ .compatible = "starive,jh7110-axi-dma", .data = (void
> *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2) },

Of course, it's better to have less code. I will try your method.

Thank you for taking the time to review and comment.

Best regards,
Walker

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
