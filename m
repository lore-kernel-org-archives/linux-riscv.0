Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3447C6FD1B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyimNEEzRFfFPrr69TJA7M31c8Eh8t20k07+Dyague0=; b=IL0nuuo/Bhh2wS
	DKumzzwaS6mmchw+G0NH23XgzxlKWUpIriEW7egvISy2x29tW6VZAmcmjs6BJAFcWRCBv0Pr4PFju
	zyVkAhcccj/wqBGivuyXzEM4Pmskw0nYumJRo5KUIpFgBdOp4hIa9vNbGHbMVlibBLdl8uE0cZh/D
	iPTWeHQc2atumAACRQlSy6Fmbgry6tNC0DXpWYrzgXlC2FMInR+mM2FGs8gdJrwNWVvTUigobi5oV
	Kts5r31JEfpE4FyHUCgDzK+Q3ihuFPjln4llFLGUZCxRVLLpSxl6AV6W5OpXPTA2bemHgIMaSn1u7
	bawynW9okwRiRScfcT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCBS-00DQxv-Bw; Mon, 06 Mar 2023 14:51:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC0S-00DLY6-K5
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 14:40:07 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E335241304
	for <linux-riscv@lists.infradead.org>; Mon,  6 Mar 2023 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678113595;
	bh=qW5xSmxdKjIllEUHvJ4dJwdCFXtHwGvw1GNV6BFAGZk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=IOK8YuhFrwl7i+lZoCkGwwiiWkyOAKJeOc2djF1/dCLLAqE0v3dFj7X2h2xQmXuTV
	 1wSEm8gw2HtLzViBr98+aYFnCHeas2mxt6NljVC5dWnbu/HH71EaVCka6WANxebEr4
	 6xME08BBIcW5qjgfiKj930Ti6qp/Ml94k+g4saH2ve2s92Xg7oo3+KQwZh4MDa50qa
	 xw9gELE5zVK8hbVHlDPPBStpHaaXDTol+d2jpL+9jc46WI6qqpy6BDFz8/W2J5yTDx
	 pRu+K3WM3JxvWNoeERXl6E6Ss0iIQlRfzIARGJovo2BfcqauQlKf5chr047fS29khm
	 0IP1SyQgoP++Q==
Received: by mail-qt1-f197.google.com with SMTP id g13-20020ac8124d000000b003bfba5d76a3so5275477qtj.15
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 06:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113595;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qW5xSmxdKjIllEUHvJ4dJwdCFXtHwGvw1GNV6BFAGZk=;
        b=2PcbejcsmDUunsn4dbdHcMqHb4yjRomJ+SCRWugRjiwiqvMY1tDEl0K5Ut2gKdI8Zn
         Tl9zE1Xr5/zPCK+3snyq/xJRcFocPdQKCDI9k7wSg8EMR6QnA6DJcX5NDvlgEw90bhE1
         AuN6RQ6XQ+QaJAu8ZdSGJyPgIbmvHeVPNCsg2ePc2Ht1NXVN8byVbQvvqRjJu6oaG4C5
         islefiRTOQ3h751Yudo5P82lOlmqsn0Nj+fkmJ4yzO4+hspxBdopNeNUm5VBig4SEZs1
         2zh/celCGUppWT38tJCFFj3Xu8std5o/OPZniHWXc2L2msHJ2itQJibk8zDHRsaVTsud
         6pQw==
X-Gm-Message-State: AO0yUKX91/wzFkKizBaSsOSUlh5Jatb+fADqaxEfUJhth5Jxc4cUL4UP
	WRTWbV3cVPm48naixG4QrpibriuCbX99uj2t5bB+xWVw2LR7Zg97sdcHSyhkvUUHuwjfeNSstH7
	e5lDUdpmWOBfF1abR1YBEcm8g/MAERnwCqG/fgxxH2oBpl7nZAGaqrZq40uURHQ==
X-Received: by 2002:a05:6214:b04:b0:56e:917a:1c19 with SMTP id u4-20020a0562140b0400b0056e917a1c19mr2609272qvj.0.1678113594907;
        Mon, 06 Mar 2023 06:39:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/ehV6HNf3S4FDeQyHkWVmBdfzUrtJQgMvbF9DrzBzPARNK/FID8eqVdEk5fo+Vs9b0LwywNHLGCvDf2s6ysZo=
X-Received: by 2002:a05:6214:b04:b0:56e:917a:1c19 with SMTP id
 u4-20020a0562140b0400b0056e917a1c19mr2609267qvj.0.1678113594619; Mon, 06 Mar
 2023 06:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20230306140430.28951-1-walker.chen@starfivetech.com> <20230306140430.28951-3-walker.chen@starfivetech.com>
In-Reply-To: <20230306140430.28951-3-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 6 Mar 2023 15:39:38 +0100
Message-ID: <CAJM55Z_216xezPNE1tXBsWA9pKk1ZaKsNVM=4PuHrg5Cgs3zcw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_064005_122038_F1B7DE26 
X-CRM114-Status: GOOD (  27.60  )
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

On Mon, 6 Mar 2023 at 15:04, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> Add dma reset operation in device probe and use different configuration
> on CH_CFG registers according to match data. Update all uses of
> of_device_is_compatible with of_device_get_match_data.
>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Hi Walker,

Again please remove my Reviewed-by when you're adding a bunch of new
code as you're doing here.

> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 67 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  2 +
>  2 files changed, 61 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index bf85aa0979ec..d1148f6fbcf9 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -21,10 +21,12 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/of_dma.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>
> @@ -46,6 +48,12 @@
>         DMA_SLAVE_BUSWIDTH_32_BYTES     | \
>         DMA_SLAVE_BUSWIDTH_64_BYTES)
>
> +struct axi_dma_chip_config {
> +       int (*apb_setup)(struct platform_device *pdev, struct axi_dma_chip *chip);
> +       int (*reset_init)(struct platform_device *pdev);
> +       bool use_cfg2;
> +};
> +
>  static inline void
>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
>  {
> @@ -86,7 +94,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>
>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
> +           !chan->chip->dw->hdata->use_cfg2) {
>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> @@ -1142,7 +1151,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>         axi_chan_disable(chan);
>
>         ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
> -                                       !(val & chan_active), 1000, 10000);
> +                                       !(val & chan_active), 1000, DMAC_TIMEOUT_US);
>         if (ret == -ETIMEDOUT)
>                 dev_warn(dchan2dev(dchan),
>                          "%s failed to stop\n", axi_chan_name(chan));
> @@ -1367,13 +1376,33 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>         return 0;
>  }
>
> +static int intel_apb_setup(struct platform_device *pdev, struct axi_dma_chip *chip)
> +{
> +       chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(chip->apb_regs))
> +               return PTR_ERR(chip->apb_regs);
> +       else
> +               return 0;
> +}
> +
> +static int jh7110_reset_init(struct platform_device *pdev)
> +{
> +       struct reset_control *resets;
> +
> +       resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +       if (IS_ERR(resets))
> +               return PTR_ERR(resets);
> +
> +       return reset_control_deassert(resets);
> +}
> +
>  static int dw_probe(struct platform_device *pdev)
>  {
> -       struct device_node *node = pdev->dev.of_node;
>         struct axi_dma_chip *chip;
>         struct resource *mem;
>         struct dw_axi_dma *dw;
>         struct dw_axi_dma_hcfg *hdata;
> +       const struct axi_dma_chip_config *ccfg;
>         u32 i;
>         int ret;
>
> @@ -1402,10 +1431,21 @@ static int dw_probe(struct platform_device *pdev)
>         if (IS_ERR(chip->regs))
>                 return PTR_ERR(chip->regs);
>
> -       if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
> -               chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
> -               if (IS_ERR(chip->apb_regs))
> -                       return PTR_ERR(chip->apb_regs);
> +       ccfg = of_device_get_match_data(&pdev->dev);
> +       if (ccfg) {
> +               if (ccfg->apb_setup) {
> +                       ret = ccfg->apb_setup(pdev, chip);
> +                       if (ret)
> +                               return ret;
> +               }
> +
> +               if (ccfg->reset_init) {
> +                       ret = ccfg->reset_init(pdev);
> +                       if (ret)
> +                               return ret;
> +               }
> +
> +               chip->dw->hdata->use_cfg2 = ccfg->use_cfg2;

This claims and deasserts the resets before the clocks, whereas your
previous versions did it after turning the clocks on. Which is the
correct order?

Also this certainly gets rid of of_device_is_compatible calls, but
seems like a lot of code to do that. Did you consider something like

+#define AXI_DMA_FLAG_HAS_APB_REGS BIT(0)
+#define AXI_DMA_FLAG_HAS_RESETS BIT(1)
+#define AXI_DMA_FLAG_USE_CFG2 BIT(2)

+unsigned int flags = (uintptr_t)device_get_match_data(&pdev->dev);

-if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
+if (flags & AXI_DMA_FLAG_HAS_APB_REGS) {

-if (of_device_is_compatible(node, "starfive,jh7110-axi-dma)) {
+if (flags & AXI_DMA_FLAG_HAS_RESETS) {

+chip->dw->hwdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);

-{ .compatible = "intel,kmb-axi-dma" },
+{ .compatible = "intel,kmb-axi-dma", .data = (void
*)AXI_DMA_FLAG_HAS_APB_REGS },
+{ .compatible = "starive,jh7110-axi-dma", .data = (void
*)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2) },

>         }
>
>         chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> @@ -1557,9 +1597,20 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>         SET_RUNTIME_PM_OPS(axi_dma_runtime_suspend, axi_dma_runtime_resume, NULL)
>  };
>
> +static const struct axi_dma_chip_config intel_chip_config = {
> +       .apb_setup = intel_apb_setup,
> +       .use_cfg2 = false,
> +};
> +
> +static const struct axi_dma_chip_config jh7110_chip_config = {
> +       .reset_init = jh7110_reset_init,
> +       .use_cfg2 = true,
> +};
> +
>  static const struct of_device_id dw_dma_of_id_table[] = {
>         { .compatible = "snps,axi-dma-1.01a" },
> -       { .compatible = "intel,kmb-axi-dma" },
> +       { .compatible = "intel,kmb-axi-dma", .data = &intel_chip_config },
> +       { .compatible = "starfive,jh7110-axi-dma", .data = &jh7110_chip_config },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index e9d5eb0fd594..b906d5884efe 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -21,6 +21,7 @@
>  #define DMAC_MAX_CHANNELS      16
>  #define DMAC_MAX_MASTERS       2
>  #define DMAC_MAX_BLK_SIZE      0x200000
> +#define DMAC_TIMEOUT_US                200000
>
>  struct dw_axi_dma_hcfg {
>         u32     nr_channels;
> @@ -33,6 +34,7 @@ struct dw_axi_dma_hcfg {
>         /* Register map for DMAX_NUM_CHANNELS <= 8 */
>         bool    reg_map_8_channels;
>         bool    restrict_axi_burst_len;
> +       bool    use_cfg2;
>  };
>
>  struct axi_dma_chan {
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
