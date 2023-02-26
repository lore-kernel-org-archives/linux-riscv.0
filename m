Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC2C64ED6
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IJ63J1faZoyHpUy8W6mlMXLjZUV8mz9g5QkFEzX+wM=; b=SKTdhE7uSIYTle
	EPTztmAgp9A4xU2ASd5dfemt0/cV49X7FwvtEwvR/egO4FQX4eJHTBrGJFW/SYiNO1HBfrtmrOt4Z
	wKn3XyNIRm5VYs3nhPC07+rcZjGcyYxIdnpb1rfdcGN7e/mjopB4sAH6KH9ec6lyZClW2Ua1qO8g6
	Bej3L66CAPjfciUEsen2sl37NB1MVTTXX1RSTdn3aq9PYtqMwwrpDyvjK8rfqeGIZ/qX2cM6NTWx2
	hZhnPV1C2nqIp4BjD2s2vhiqBJicalPHTrqXERq9ADWqvhe/h92JBX7sv5i8FQOG7yVH5cfqQ4xaj
	G+VfNvaPTHJSJzLWFPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWHyI-007NwB-Ck; Sun, 26 Feb 2023 14:25:50 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWHyE-007Nvc-TI
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 14:25:49 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 35FD13F59A
	for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677421541;
	bh=CE3OT5IllSccKQ947nt7em2EjnyBc3+YZANwp69JN68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I8Esoa7MZ8h/NXPF3Wihs3B7VE5EKqxDIsPAsV02BDV0tE+DdJSkdzSpTp9Mtw0s0
	 xiEhMi6BQMiYNojL/+TAahDQ1cIX3PtXybsm4IUYf2UG87Qx/e+lsFzUVv5JWqh6gS
	 xsFiJfIrUAStT9ls9xp+88Gzlw+pTmXruUftPuL8mE28X/HTtBu/voyPMg7P7gdOfi
	 9rHbJ9MBXUawtdO7WCXsC8om/T/ZndVlbCrx6trY2Zob3Oc0Ggd380N3tVMNTuYxQG
	 56A16gZ4XfJe1PM733piV/o0C/YJ9LyyKPWUsVZnjwEuEbiW1uClfvkgmX3WKZWES0
	 XkYJFaGoHzK+w==
Received: by mail-qv1-f70.google.com with SMTP id jy22-20020a0562142b5600b005710b856106so2110785qvb.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 06:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CE3OT5IllSccKQ947nt7em2EjnyBc3+YZANwp69JN68=;
        b=N7hHc9lDbNi4aJkwZ6QR82Phcu2PeNMuy28h6seT1pnFmGdOvck79NDvBxFu7KuOO2
         qd0GjOLvBXipaa4tueomloB1OBIegBQie4CqBilnE9t6XKcSG1NU5vhwwq+lxVCeueTZ
         e+LOqkD5d+WtBHZPs8IbeqSphlck4BKNFAUEOD8awJYKPfkgcUKVOWII07xXTKref+i9
         P8z627Q5b0fJW0PExn/fqL8PeM5MNygoxBhRvjAMbW+7B6vuTGZ3G0hAWWtwlcPUqXSp
         rr2l10PEW5TmJuhnV0oLKoXBuam0DoRjvZjDMPMY5nySSRTfPKmFZ+h57+D8/IfNlAjB
         brnw==
X-Gm-Message-State: AO0yUKVXc/fLitYJw0lpdLsRgPe32iUyxmPJgiHdhAH7gH78+GOzo8KC
	zRM3FgYhvdi48pJiyVMOff0tTsAy5wp2o+n0ckVKZZCp14ZhH8E3oqTmMiiMcvhJkCdFItk4x8K
	hxRAgjViEVEesUPhoD8KyGcNpueYrg1QV/x73ICB1tpQLEFUCxVHUN/w81JfxTQ==
X-Received: by 2002:ac8:7007:0:b0:3bf:c91e:2cad with SMTP id x7-20020ac87007000000b003bfc91e2cadmr898434qtm.3.1677421540103;
        Sun, 26 Feb 2023 06:25:40 -0800 (PST)
X-Google-Smtp-Source: AK7set/zy1s2v+Lzd9J0sv9I/9lsKv+esWVBt0QC2Ah3KHHqofKm+G9VBwwKfAON+OfBw4vmzheo5xJnbGkq5mOaqdI=
X-Received: by 2002:ac8:7007:0:b0:3bf:c91e:2cad with SMTP id
 x7-20020ac87007000000b003bfc91e2cadmr898429qtm.3.1677421539852; Sun, 26 Feb
 2023 06:25:39 -0800 (PST)
MIME-Version: 1.0
References: <20230221140424.719-1-walker.chen@starfivetech.com> <20230221140424.719-3-walker.chen@starfivetech.com>
In-Reply-To: <20230221140424.719-3-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 26 Feb 2023 15:25:23 +0100
Message-ID: <CAJM55Z_buj_CBKtJw=n_K-Ma4ZGP9pmy_uM20nLpJhTMNh=bJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dmaengine: dw-axi-dmac: Add support for StarFive
 JH7110 DMA
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_062547_262809_CF916798 
X-CRM114-Status: GOOD (  24.85  )
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

On Tue, 21 Feb 2023 at 15:04, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> Add DMA reset operation in device probe and use different configuration
> on CH_CFG registers according to compatible string.
>
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 19 +++++++++++++++++--
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  3 +++
>  2 files changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index bf85aa0979ec..858c4337650f 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/property.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>
> @@ -86,7 +87,8 @@ static inline void axi_chan_config_write(struct axi_dma_chan *chan,
>
>         cfg_lo = (config->dst_multblk_type << CH_CFG_L_DST_MULTBLK_TYPE_POS |
>                   config->src_multblk_type << CH_CFG_L_SRC_MULTBLK_TYPE_POS);
> -       if (chan->chip->dw->hdata->reg_map_8_channels) {
> +       if (chan->chip->dw->hdata->reg_map_8_channels &&
> +           !chan->chip->dw->hdata->use_cfg2) {
>                 cfg_hi = config->tt_fc << CH_CFG_H_TT_FC_POS |
>                          config->hs_sel_src << CH_CFG_H_HS_SEL_SRC_POS |
>                          config->hs_sel_dst << CH_CFG_H_HS_SEL_DST_POS |
> @@ -1142,7 +1144,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
>         axi_chan_disable(chan);
>
>         ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
> -                                       !(val & chan_active), 1000, 10000);
> +                                       !(val & chan_active), 1000, DMAC_TIMEOUT_US);
>         if (ret == -ETIMEDOUT)
>                 dev_warn(dchan2dev(dchan),
>                          "%s failed to stop\n", axi_chan_name(chan));
> @@ -1416,6 +1418,18 @@ static int dw_probe(struct platform_device *pdev)
>         if (IS_ERR(chip->cfgr_clk))
>                 return PTR_ERR(chip->cfgr_clk);
>
> +       if (of_device_is_compatible(node, "starfive,jh7110-axi-dma")) {
> +               chip->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +               if (IS_ERR(chip->resets))
> +                       return PTR_ERR(chip->resets);
> +
> +               ret = reset_control_deassert(chip->resets);
> +               if (ret)
> +                       return ret;
> +
> +               chip->dw->hdata->use_cfg2 = true;
> +       }
> +

In the future it would be great to use match data rather than all the
calls to of_device_is_compatible.

>         ret = parse_device_properties(chip);
>         if (ret)
>                 return ret;
> @@ -1560,6 +1574,7 @@ static const struct dev_pm_ops dw_axi_dma_pm_ops = {
>  static const struct of_device_id dw_dma_of_id_table[] = {
>         { .compatible = "snps,axi-dma-1.01a" },
>         { .compatible = "intel,kmb-axi-dma" },
> +       { .compatible = "starfive,jh7110-axi-dma" },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index e9d5eb0fd594..761d95691c02 100644
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
> @@ -70,6 +72,7 @@ struct axi_dma_chip {
>         struct clk              *core_clk;
>         struct clk              *cfgr_clk;
>         struct dw_axi_dma       *dw;
> +       struct reset_control    *resets;

This added field only seems to be written, but not read from anywhere.
With that fixed:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>  };
>
>  /* LLI == Linked List Item */
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
