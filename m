Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FE3C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 13:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHM5CeNxWac7QglHBlCxYdVgwCElQuksjyEuPUgyzw4=; b=XhEbOrgevZ2Fun
	q1hM/6O4VaEJ7zpksNSktsrpGmnrr5a7vAbcrdwP3SOTURqMun2YSVdZloiXSXquPZR0WUV/T6wYs
	+j3QMFyPLpa+nD0B/cfHPh1MCHBJvn9H4570sjQLL2lVOs1JF0Zhf/+w/ufzYjmS7ObuG7Jb4eBm/
	ckHJotBqU+YN70nH5H/pTI/L5bQdLseb1XpWZTAS6sgFg6y2jCSeQfADS0ITeb/r/e+Q0VuWYX7rx
	V7Q6g/89GD/BJtHVZnA/YJhcHm88z7VqNSClGzZ0WL0epYXlabC3aMNW/f5m/yP1jnU8YoFlmnqm9
	1OzGb38/8hXVm+/VCJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhYR-004VUN-0H;
	Fri, 24 Mar 2023 13:34:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhYN-004VTH-2E
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 13:34:01 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 65FD44430B
	for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1679664835;
	bh=baRLhktlWOxcXvwHFNv0QgrA5IgUVwTfkSsdMkEu4+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=b34nfFRc1TfAcYkAdvQbNUvYd2zY0XJmbIxm4YuEEqwbARIb3CoHSAAKNtgykJZDg
	 Sa3aBSNsXcgs36j1XG5VwnqCqmlvblPCKgNanTRh2QclfcW6rq7/MKz+5kUDI9rTq3
	 1YPXCASO/60wnY45RTVq3LFngmVKm3P1btuNk69+1sgkUOoWna6yXMF2w0+xvfOT3a
	 xGaAhqDf99yYwYAB1nBrTlpqs6+YWYx5nfpZMq3QUWlBzooWVwhZCAag0xz9NJpDWj
	 tiTc/F4JUEyWNnywsRt3MMmI4m3VNlCYxusYyVUMjePX81+VrxnlVapQRywAnF0bPK
	 CydrXFrzReHFA==
Received: by mail-qv1-f72.google.com with SMTP id a10-20020a0ccdca000000b005d70160fbb0so988407qvn.21
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 06:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679664834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baRLhktlWOxcXvwHFNv0QgrA5IgUVwTfkSsdMkEu4+4=;
        b=ezBlWtEgKMuiUWdYXh3HiJncD5I1h+8jDTc0HqgDXun/qD8tceAS852hzwZE2FsnzW
         sZgCCCpG67AshHhsVkPGXIV7CHh/bHdfdU2V7y/KzA6yBRJPbwK9QMKSXZqffbIMRgi5
         ICSgxDA7Wz7DSOQRGLtqk0oVfYDLc2qY87WL3DutMaafChFoj3fsOvBvczyQqgi+6MzS
         bJM6jnJRPtYZb/i9hC+cOI3pN8yQm2CwRtIJ7dHxctAslKVi+VQRMnrnKU4mTm+Zj2Qe
         abKfZ37SDQV++wfWLQ3nwM4f2XJ49O0U+k9scyjTFZtpOhp0qPSZbXqcy1z43oq8ahGZ
         5U0Q==
X-Gm-Message-State: AO0yUKWTlTsnRr8Ehuh5+ZhNYLH//3PvdgqpLuNbzV2aWxtyNas5EGlX
	4sUIFlg9WOQXV2BdA2/RSywUbFSftgVyABGn8Ey+jLPI4j8Nn65iu5ryyMVQ/Z/jfhHkNLfIB6P
	WMXv0TPC8XGBks+SyS/3D7a/25BOhnKiFMx6MzzjYBi9AfqiXY9QSPv1mpwZl/w==
X-Received: by 2002:a05:620a:a18:b0:746:7f12:f2f3 with SMTP id i24-20020a05620a0a1800b007467f12f2f3mr651791qka.13.1679664834416;
        Fri, 24 Mar 2023 06:33:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set+PMWroXLuUn1KxCXS1+t1n+7MwGF6fo/rG+E0PHsQotj4U0S9r3aNHlQweDVOeiRzH2jNJj64BuscgHlEEvaU=
X-Received: by 2002:a05:620a:a18:b0:746:7f12:f2f3 with SMTP id
 i24-20020a05620a0a1800b007467f12f2f3mr651787qka.13.1679664834154; Fri, 24 Mar
 2023 06:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230322094820.24738-1-walker.chen@starfivetech.com> <20230322094820.24738-3-walker.chen@starfivetech.com>
In-Reply-To: <20230322094820.24738-3-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 24 Mar 2023 14:33:38 +0100
Message-ID: <CAJM55Z9VfY76ZxTxX-o56MNppALKbYuYvx6+fXvx=3LAg6gKDw@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_063400_144848_943E1FD3 
X-CRM114-Status: GOOD (  23.06  )
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

On Wed, 22 Mar 2023 at 10:48, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> Add DMA reset operation in device probe and use different configuration
> on CH_CFG registers according to match data. Update all uses of
> of_device_is_compatible with of_device_get_match_data.
>
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>

Thanks!
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 38 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  2 files changed, 34 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index 4169e1d7d5ca..6cfcb541d8c3 100644
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
> @@ -46,6 +48,10 @@
>         DMA_SLAVE_BUSWIDTH_32_BYTES     | \
>         DMA_SLAVE_BUSWIDTH_64_BYTES)
>
> +#define AXI_DMA_FLAG_HAS_APB_REGS      BIT(0)
> +#define AXI_DMA_FLAG_HAS_RESETS                BIT(1)
> +#define AXI_DMA_FLAG_USE_CFG2          BIT(2)
> +
>  static inline void
>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
>  {
> @@ -86,7 +92,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>
>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
> +           !chan->chip->dw->hdata->use_cfg2) {
>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> @@ -1367,10 +1374,11 @@ static int parse_device_properties(struct axi_dma_chip *chip)
>
>  static int dw_probe(struct platform_device *pdev)
>  {
> -       struct device_node *node = pdev->dev.of_node;
>         struct axi_dma_chip *chip;
>         struct dw_axi_dma *dw;
>         struct dw_axi_dma_hcfg *hdata;
> +       struct reset_control *resets;
> +       unsigned int flags;
>         u32 i;
>         int ret;
>
> @@ -1398,12 +1406,25 @@ static int dw_probe(struct platform_device *pdev)
>         if (IS_ERR(chip->regs))
>                 return PTR_ERR(chip->regs);
>
> -       if (of_device_is_compatible(node, "intel,kmb-axi-dma")) {
> +       flags = (uintptr_t)of_device_get_match_data(&pdev->dev);
> +       if (flags & AXI_DMA_FLAG_HAS_APB_REGS) {
>                 chip->apb_regs = devm_platform_ioremap_resource(pdev, 1);
>                 if (IS_ERR(chip->apb_regs))
>                         return PTR_ERR(chip->apb_regs);
>         }
>
> +       if (flags & AXI_DMA_FLAG_HAS_RESETS) {
> +               resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +               if (IS_ERR(resets))
> +                       return PTR_ERR(resets);
> +
> +               ret = reset_control_deassert(resets);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> +
>         chip->core_clk = devm_clk_get(chip->dev, "core-clk");
>         if (IS_ERR(chip->core_clk))
>                 return PTR_ERR(chip->core_clk);
> @@ -1554,8 +1575,15 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>  };
>
>  static const struct of_device_id dw_dma_of_id_table[] = {
> -       { .compatible = "snps,axi-dma-1.01a" },
> -       { .compatible = "intel,kmb-axi-dma" },
> +       {
> +               .compatible = "snps,axi-dma-1.01a"
> +       }, {
> +               .compatible = "intel,kmb-axi-dma",
> +               .data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
> +       }, {
> +               .compatible = "starfive,jh7110-axi-dma",
> +               .data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
> +       },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index e9d5eb0fd594..eb267cb24f67 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -33,6 +33,7 @@ struct dw_axi_dma_hcfg {
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
