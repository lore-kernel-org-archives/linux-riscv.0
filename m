Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F74AC56202
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B78032237B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIndQVnU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="CJObZz3V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B78032237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aCX179Y4yxKbj+9A1wBMlgbpc57hRMQhePbK3RVzJuA=; b=RIndQVnUxkRaSO2Nuzg39j9+L
	F6/sK6e22HAHfPiWjAsoeoNYa0gR57ra+WrOwkGHQHDqkgYRda/L2/v9FESwWGoFpk3/OONIruep9
	Q5mZck+KTp2E83YXx+JGIFCrLb4JgtVtTXjTN7W902tr03Q61fl3yJiEc5yTR+P8AR+UD2jXzMRJL
	q1t2ycDbq/2EKCDNcTxhEA3i95JVuju8Rwgjy25nky1TOdd89hAcsy5ZgAfFRsMTMhQ2SLL9Uhyvk
	eHTaG4tPL8Lx2E77/p1icOq31+Hvv9A2Ec8AwnbbtfLQN6ESXMW6hkd5/qIouLAQggtfv/4VtNkhS
	4DJR1ABFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgHia-0004jn-T0; Sat, 21 Nov 2020 01:29:37 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgHiX-0004iX-Dk
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 01:29:34 +0000
Received: by mail-pf1-x444.google.com with SMTP id v5so5534971pff.10
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 17:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Gmc1ZQK4Z7FJ+nkEJlaWLOCIx0EhjlxA5CekSRKuc3I=;
 b=CJObZz3VgypRprpxFzhnUStf/tm/ekOtG6WFuHqCtp/ZMpbd3Oj2pbzyN+GJS71Iai
 z362qF1phkcs0996rdZexf2Kfo7j09o1fhCky5mY5Yry+kPlsNDTD1V+5bZdABnae95Z
 E/E7Hc1Pk+CwKgQvZoatyLOi5/EjarSXcZUEs1zyVnPV32V60pZXR2e4IUtxClVQJEsd
 2JuxYzeUXu5fGU6WLdzLYds/tMFJER9loZI4v2iUo6tI3Wq0hhfLl2+/X9h+iULdD3NO
 gVGT6z0T1lzkUtMVe8MSjqUtfdpWSAuUh3elXiDVKRQvgY9z19Qdreizw2ssTsQkOff+
 DVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Gmc1ZQK4Z7FJ+nkEJlaWLOCIx0EhjlxA5CekSRKuc3I=;
 b=ixAC2rHc+2n/vA1U5K4UD122erfGlT3Bo3yeopsDsvauKLHA18ihg2+LOm+vN4/iqE
 hn458pgsEsikCXOgLTyauuCxOan0DPB9hVRW8SpLtldy0Wry2JXbMSL0mvBwJt0DbDRb
 0fKuAcyraqzSiOoDmX93JeustOpVXL+bIgqypR3hze5Qrb3l4DyHzgG6HgxvwQPs12dR
 qK7SjQUWKbb329xCtK9LjoGuoJdQfP6JuJLK6v1DtlCW0kk2ariO3BnxPEysSLxSBJAx
 bQADH/ooL9Q33ElsIj3MxPbIP15KxJg+Fm+lo75b/UQ5r1Z3Op1ruIgo/d9RyF+5A5va
 0YRg==
X-Gm-Message-State: AOAM532YVhsP1JmXYHbV269K11K5NdZGprQ1/deGObff5gegZQAr7pWH
 tY7a021I1ypkSbWUpYVhqcmHpg==
X-Google-Smtp-Source: ABdhPJwvrCGGFh+uqhHBDn+ONmkr3peDB3CNtE971PXKihKlcH2YlRD3I2Yfw+VfEpSjfykRBSEbCg==
X-Received: by 2002:a17:90a:d58e:: with SMTP id
 v14mr4401542pju.191.1605922171418; 
 Fri, 20 Nov 2020 17:29:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id l7sm5583805pjg.29.2020.11.20.17.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 17:29:30 -0800 (PST)
Date: Fri, 20 Nov 2020 17:29:30 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:28:04 PST (-0800)
Subject: Re: [PATCH v4 3/4] clk: sifive: Add a driver for the SiFive FU740
 PRCI IP block
In-Reply-To: <20201111100608.108842-4-zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-c9b6aff3-72de-4ccc-9b9d-8ec7229c101d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_202933_645443_AB987620 
X-CRM114-Status: GOOD (  37.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, pragnesh.patel@openfive.com,
 yash.shah@sifive.com, hes@sifive.com, schwab@linux-m68k.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 erik.danie@sifive.com, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, pragnesh.patel@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 02:06:07 PST (-0800), zong.li@sifive.com wrote:
> Add driver code for the SiFive FU740 PRCI IP block. This IP block
> handles reset and clock control for the SiFive FU740 device and
> implements SoC-level clock tree controls and dividers.
>
> This driver contains bug fixes and contributions from
> Henry Styles <hes@sifive.com>
> Erik Danie <erik.danie@sifive.com>
> Pragnesh Patel <pragnesh.patel@sifive.com>
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Cc: Henry Styles <hes@sifive.com>
> Cc: Erik Danie <erik.danie@sifive.com>
> Cc: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  drivers/clk/sifive/Kconfig                    |   4 +-
>  drivers/clk/sifive/Makefile                   |   1 +
>  drivers/clk/sifive/fu740-prci.c               | 122 ++++++++++++++++++
>  drivers/clk/sifive/fu740-prci.h               |  21 +++
>  drivers/clk/sifive/sifive-prci.c              | 120 +++++++++++++++++
>  drivers/clk/sifive/sifive-prci.h              |  88 +++++++++++++
>  include/dt-bindings/clock/sifive-fu740-prci.h |  23 ++++

I don't see the bindings in Documentation, but assuming they're in flight

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

>  7 files changed, 377 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/sifive/fu740-prci.c
>  create mode 100644 drivers/clk/sifive/fu740-prci.h
>  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
>
> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> index ab48cf7e0105..1c14eb20c066 100644
> --- a/drivers/clk/sifive/Kconfig
> +++ b/drivers/clk/sifive/Kconfig
> @@ -13,7 +13,7 @@ config CLK_SIFIVE_PRCI
>  	select CLK_ANALOGBITS_WRPLL_CLN28HPC
>  	help
>  	  Supports the Power Reset Clock interface (PRCI) IP block found in
> -	  FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,
> -	  enable this driver.
> +	  FU540/FU740 SoCs. If this kernel is meant to run on a SiFive FU540/
> +	  FU740 SoCs, enable this driver.
>
>  endif
> diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
> index fe3e2cb4c4d8..2c05798e4ba4 100644
> --- a/drivers/clk/sifive/Makefile
> +++ b/drivers/clk/sifive/Makefile
> @@ -2,3 +2,4 @@
>  obj-y += sifive-prci.o
>
>  obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu540-prci.o
> +obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu740-prci.o
> diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
> new file mode 100644
> index 000000000000..3b87e273c3eb
> --- /dev/null
> +++ b/drivers/clk/sifive/fu740-prci.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2018-2019 SiFive, Inc.
> + * Wesley Terpstra
> + * Paul Walmsley
> + * Zong Li
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/clock/sifive-fu740-prci.h>
> +#include <linux/module.h>
> +#include "sifive-prci.h"
> +
> +/* PRCI integration data for each WRPLL instance */
> +
> +static struct __prci_wrpll_data __prci_corepll_data = {
> +	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
> +	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
> +	.disable_bypass = sifive_prci_coreclksel_use_final_corepll,
> +};
> +
> +static struct __prci_wrpll_data __prci_ddrpll_data = {
> +	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
> +};
> +
> +static struct __prci_wrpll_data __prci_gemgxlpll_data = {
> +	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
> +};
> +
> +static struct __prci_wrpll_data __prci_dvfscorepll_data = {
> +	.cfg0_offs = PRCI_DVFSCOREPLLCFG0_OFFSET,
> +	.enable_bypass = sifive_prci_corepllsel_use_corepll,
> +	.disable_bypass = sifive_prci_corepllsel_use_dvfscorepll,
> +};
> +
> +static struct __prci_wrpll_data __prci_hfpclkpll_data = {
> +	.cfg0_offs = PRCI_HFPCLKPLLCFG0_OFFSET,
> +	.enable_bypass = sifive_prci_hfpclkpllsel_use_hfclk,
> +	.disable_bypass = sifive_prci_hfpclkpllsel_use_hfpclkpll,
> +};
> +
> +static struct __prci_wrpll_data __prci_cltxpll_data = {
> +	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
> +};
> +
> +/* Linux clock framework integration */
> +
> +static const struct clk_ops sifive_fu740_prci_wrpll_clk_ops = {
> +	.set_rate = sifive_prci_wrpll_set_rate,
> +	.round_rate = sifive_prci_wrpll_round_rate,
> +	.recalc_rate = sifive_prci_wrpll_recalc_rate,
> +};
> +
> +static const struct clk_ops sifive_fu740_prci_wrpll_ro_clk_ops = {
> +	.recalc_rate = sifive_prci_wrpll_recalc_rate,
> +};
> +
> +static const struct clk_ops sifive_fu740_prci_tlclksel_clk_ops = {
> +	.recalc_rate = sifive_prci_tlclksel_recalc_rate,
> +};
> +
> +static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
> +	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
> +};
> +
> +/* List of clock controls provided by the PRCI */
> +struct __prci_clock __prci_init_clocks_fu740[] = {
> +	[PRCI_CLK_COREPLL] = {
> +		.name = "corepll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_clk_ops,
> +		.pwd = &__prci_corepll_data,
> +	},
> +	[PRCI_CLK_DDRPLL] = {
> +		.name = "ddrpll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_ro_clk_ops,
> +		.pwd = &__prci_ddrpll_data,
> +	},
> +	[PRCI_CLK_GEMGXLPLL] = {
> +		.name = "gemgxlpll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_clk_ops,
> +		.pwd = &__prci_gemgxlpll_data,
> +	},
> +	[PRCI_CLK_DVFSCOREPLL] = {
> +		.name = "dvfscorepll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_clk_ops,
> +		.pwd = &__prci_dvfscorepll_data,
> +	},
> +	[PRCI_CLK_HFPCLKPLL] = {
> +		.name = "hfpclkpll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_clk_ops,
> +		.pwd = &__prci_hfpclkpll_data,
> +	},
> +	[PRCI_CLK_CLTXPLL] = {
> +		.name = "cltxpll",
> +		.parent_name = "hfclk",
> +		.ops = &sifive_fu740_prci_wrpll_clk_ops,
> +		.pwd = &__prci_cltxpll_data,
> +	},
> +	[PRCI_CLK_TLCLK] = {
> +		.name = "tlclk",
> +		.parent_name = "corepll",
> +		.ops = &sifive_fu740_prci_tlclksel_clk_ops,
> +	},
> +	[PRCI_CLK_PCLK] = {
> +		.name = "pclk",
> +		.parent_name = "hfpclkpll",
> +		.ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
> +	},
> +};
> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
> new file mode 100644
> index 000000000000..13ef971f7764
> --- /dev/null
> +++ b/drivers/clk/sifive/fu740-prci.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 SiFive, Inc.
> + * Zong Li
> + */
> +
> +#ifndef __SIFIVE_CLK_FU740_PRCI_H
> +#define __SIFIVE_CLK_FU740_PRCI_H
> +
> +#include "sifive-prci.h"
> +
> +#define NUM_CLOCK_FU740	8
> +
> +extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> +
> +static const struct prci_clk_desc prci_clk_fu740 = {
> +	.clks = __prci_init_clocks_fu740,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu740),
> +};
> +
> +#endif /* __SIFIVE_CLK_FU740_PRCI_H */
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 0ac729eeb71b..4098dbc5881a 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -27,6 +27,7 @@
>  #include <linux/of_device.h>
>  #include "sifive-prci.h"
>  #include "fu540-prci.h"
> +#include "fu740-prci.h"
>
>  /*
>   * Private functions
> @@ -242,6 +243,18 @@ unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
>  	return div_u64(parent_rate, div);
>  }
>
> +/* HFPCLK clock integration */
> +
> +unsigned long sifive_prci_hfpclkplldiv_recalc_rate(struct clk_hw *hw,
> +						   unsigned long parent_rate)
> +{
> +	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
> +	struct __prci_data *pd = pc->pd;
> +	u32 div = __prci_readl(pd, PRCI_HFPCLKPLLDIV_OFFSET);
> +
> +	return div_u64(parent_rate, div + 2);
> +}
> +
>  /*
>   * Core clock mux control
>   */
> @@ -287,6 +300,112 @@ void sifive_prci_coreclksel_use_corepll(struct __prci_data *pd)
>  	r = __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);	/* barrier */
>  }
>
> +/**
> + * sifive_prci_coreclksel_use_final_corepll() - switch the CORECLK mux to output
> + * FINAL_COREPLL
> + * @pd: struct __prci_data * for the PRCI containing the CORECLK mux reg
> + *
> + * Switch the CORECLK mux to the final COREPLL output clock; return once
> + * complete.
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PRCI_CORECLKSEL_OFFSET register.
> + */
> +void sifive_prci_coreclksel_use_final_corepll(struct __prci_data *pd)
> +{
> +	u32 r;
> +
> +	r = __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);
> +	r &= ~PRCI_CORECLKSEL_CORECLKSEL_MASK;
> +	__prci_writel(r, PRCI_CORECLKSEL_OFFSET, pd);
> +
> +	r = __prci_readl(pd, PRCI_CORECLKSEL_OFFSET);	/* barrier */
> +}
> +
> +/**
> + * sifive_prci_corepllsel_use_dvfscorepll() - switch the COREPLL mux to
> + * output DVFS_COREPLL
> + * @pd: struct __prci_data * for the PRCI containing the COREPLL mux reg
> + *
> + * Switch the COREPLL mux to the DVFSCOREPLL output clock; return once complete.
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PRCI_COREPLLSEL_OFFSET register.
> + */
> +void sifive_prci_corepllsel_use_dvfscorepll(struct __prci_data *pd)
> +{
> +	u32 r;
> +
> +	r = __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);
> +	r |= PRCI_COREPLLSEL_COREPLLSEL_MASK;
> +	__prci_writel(r, PRCI_COREPLLSEL_OFFSET, pd);
> +
> +	r = __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);	/* barrier */
> +}
> +
> +/**
> + * sifive_prci_corepllsel_use_corepll() - switch the COREPLL mux to
> + * output COREPLL
> + * @pd: struct __prci_data * for the PRCI containing the COREPLL mux reg
> + *
> + * Switch the COREPLL mux to the COREPLL output clock; return once complete.
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PRCI_COREPLLSEL_OFFSET register.
> + */
> +void sifive_prci_corepllsel_use_corepll(struct __prci_data *pd)
> +{
> +	u32 r;
> +
> +	r = __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);
> +	r &= ~PRCI_COREPLLSEL_COREPLLSEL_MASK;
> +	__prci_writel(r, PRCI_COREPLLSEL_OFFSET, pd);
> +
> +	r = __prci_readl(pd, PRCI_COREPLLSEL_OFFSET);	/* barrier */
> +}
> +
> +/**
> + * sifive_prci_hfpclkpllsel_use_hfclk() - switch the HFPCLKPLL mux to
> + * output HFCLK
> + * @pd: struct __prci_data * for the PRCI containing the HFPCLKPLL mux reg
> + *
> + * Switch the HFPCLKPLL mux to the HFCLK input source; return once complete.
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PRCI_HFPCLKPLLSEL_OFFSET register.
> + */
> +void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd)
> +{
> +	u32 r;
> +
> +	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);
> +	r |= PRCI_HFPCLKPLLSEL_HFPCLKPLLSEL_MASK;
> +	__prci_writel(r, PRCI_HFPCLKPLLSEL_OFFSET, pd);
> +
> +	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
> +}
> +
> +/**
> + * sifive_prci_hfpclkpllsel_use_hfpclkpll() - switch the HFPCLKPLL mux to
> + * output HFPCLKPLL
> + * @pd: struct __prci_data * for the PRCI containing the HFPCLKPLL mux reg
> + *
> + * Switch the HFPCLKPLL mux to the HFPCLKPLL output clock; return once complete.
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PRCI_HFPCLKPLLSEL_OFFSET register.
> + */
> +void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd)
> +{
> +	u32 r;
> +
> +	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);
> +	r &= ~PRCI_HFPCLKPLLSEL_HFPCLKPLLSEL_MASK;
> +	__prci_writel(r, PRCI_HFPCLKPLLSEL_OFFSET, pd);
> +
> +	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
> +}
> +
>  /**
>   * __prci_register_clocks() - register clock controls in the PRCI
>   * @dev: Linux struct device *
> @@ -391,6 +510,7 @@ static int sifive_prci_probe(struct platform_device *pdev)
>
>  static const struct of_device_id sifive_prci_of_match[] = {
>  	{.compatible = "sifive,fu540-c000-prci", .data = &prci_clk_fu540},
> +	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
>  	{}
>  };
>
> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> index 025f717bc053..802fc8fb9c09 100644
> --- a/drivers/clk/sifive/sifive-prci.h
> +++ b/drivers/clk/sifive/sifive-prci.h
> @@ -117,6 +117,87 @@
>  #define PRCI_CLKMUXSTATUSREG_TLCLKSEL_STATUS_MASK			\
>  		(0x1 << PRCI_CLKMUXSTATUSREG_TLCLKSEL_STATUS_SHIFT)
>
> +/* CLTXPLLCFG0 */
> +#define PRCI_CLTXPLLCFG0_OFFSET		0x30
> +#define PRCI_CLTXPLLCFG0_DIVR_SHIFT	0
> +#define PRCI_CLTXPLLCFG0_DIVR_MASK	(0x3f << PRCI_CLTXPLLCFG0_DIVR_SHIFT)
> +#define PRCI_CLTXPLLCFG0_DIVF_SHIFT	6
> +#define PRCI_CLTXPLLCFG0_DIVF_MASK	(0x1ff << PRCI_CLTXPLLCFG0_DIVF_SHIFT)
> +#define PRCI_CLTXPLLCFG0_DIVQ_SHIFT	15
> +#define PRCI_CLTXPLLCFG0_DIVQ_MASK	(0x7 << PRCI_CLTXPLLCFG0_DIVQ_SHIFT)
> +#define PRCI_CLTXPLLCFG0_RANGE_SHIFT	18
> +#define PRCI_CLTXPLLCFG0_RANGE_MASK	(0x7 << PRCI_CLTXPLLCFG0_RANGE_SHIFT)
> +#define PRCI_CLTXPLLCFG0_BYPASS_SHIFT	24
> +#define PRCI_CLTXPLLCFG0_BYPASS_MASK	(0x1 << PRCI_CLTXPLLCFG0_BYPASS_SHIFT)
> +#define PRCI_CLTXPLLCFG0_FSE_SHIFT	25
> +#define PRCI_CLTXPLLCFG0_FSE_MASK	(0x1 << PRCI_CLTXPLLCFG0_FSE_SHIFT)
> +#define PRCI_CLTXPLLCFG0_LOCK_SHIFT	31
> +#define PRCI_CLTXPLLCFG0_LOCK_MASK	(0x1 << PRCI_CLTXPLLCFG0_LOCK_SHIFT)
> +
> +/* CLTXPLLCFG1 */
> +#define PRCI_CLTXPLLCFG1_OFFSET		0x34
> +#define PRCI_CLTXPLLCFG1_CKE_SHIFT	31
> +#define PRCI_CLTXPLLCFG1_CKE_MASK	(0x1 << PRCI_CLTXPLLCFG1_CKE_SHIFT)
> +
> +/* DVFSCOREPLLCFG0 */
> +#define PRCI_DVFSCOREPLLCFG0_OFFSET	0x38
> +
> +/* DVFSCOREPLLCFG1 */
> +#define PRCI_DVFSCOREPLLCFG1_OFFSET	0x3c
> +#define PRCI_DVFSCOREPLLCFG1_CKE_SHIFT	31
> +#define PRCI_DVFSCOREPLLCFG1_CKE_MASK	(0x1 << PRCI_DVFSCOREPLLCFG1_CKE_SHIFT)
> +
> +/* COREPLLSEL */
> +#define PRCI_COREPLLSEL_OFFSET			0x40
> +#define PRCI_COREPLLSEL_COREPLLSEL_SHIFT	0
> +#define PRCI_COREPLLSEL_COREPLLSEL_MASK					\
> +		(0x1 << PRCI_COREPLLSEL_COREPLLSEL_SHIFT)
> +
> +/* HFPCLKPLLCFG0 */
> +#define PRCI_HFPCLKPLLCFG0_OFFSET		0x50
> +#define PRCI_HFPCLKPLL_CFG0_DIVR_SHIFT		0
> +#define PRCI_HFPCLKPLL_CFG0_DIVR_MASK					\
> +		(0x3f << PRCI_HFPCLKPLLCFG0_DIVR_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_DIVF_SHIFT		6
> +#define PRCI_HFPCLKPLL_CFG0_DIVF_MASK					\
> +		(0x1ff << PRCI_HFPCLKPLLCFG0_DIVF_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_DIVQ_SHIFT		15
> +#define PRCI_HFPCLKPLL_CFG0_DIVQ_MASK					\
> +		(0x7 << PRCI_HFPCLKPLLCFG0_DIVQ_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_RANGE_SHIFT		18
> +#define PRCI_HFPCLKPLL_CFG0_RANGE_MASK					\
> +		(0x7 << PRCI_HFPCLKPLLCFG0_RANGE_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_BYPASS_SHIFT	24
> +#define PRCI_HFPCLKPLL_CFG0_BYPASS_MASK					\
> +		(0x1 << PRCI_HFPCLKPLLCFG0_BYPASS_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_FSE_SHIFT		25
> +#define PRCI_HFPCLKPLL_CFG0_FSE_MASK					\
> +		(0x1 << PRCI_HFPCLKPLLCFG0_FSE_SHIFT)
> +#define PRCI_HFPCLKPLL_CFG0_LOCK_SHIFT		31
> +#define PRCI_HFPCLKPLL_CFG0_LOCK_MASK					\
> +		(0x1 << PRCI_HFPCLKPLLCFG0_LOCK_SHIFT)
> +
> +/* HFPCLKPLLCFG1 */
> +#define PRCI_HFPCLKPLLCFG1_OFFSET		0x54
> +#define PRCI_HFPCLKPLLCFG1_CKE_SHIFT		31
> +#define PRCI_HFPCLKPLLCFG1_CKE_MASK					\
> +		(0x1 << PRCI_HFPCLKPLLCFG1_CKE_SHIFT)
> +
> +/* HFPCLKPLLSEL */
> +#define PRCI_HFPCLKPLLSEL_OFFSET		0x58
> +#define PRCI_HFPCLKPLLSEL_HFPCLKPLLSEL_SHIFT	0
> +#define PRCI_HFPCLKPLLSEL_HFPCLKPLLSEL_MASK				\
> +		(0x1 << PRCI_HFPCLKPLLSEL_HFPCLKPLLSEL_SHIFT)
> +
> +/* HFPCLKPLLDIV */
> +#define PRCI_HFPCLKPLLDIV_OFFSET		0x5c
> +
> +/* PRCIPLL */
> +#define PRCI_PRCIPLL_OFFSET			0xe0
> +
> +/* PROCMONCFG */
> +#define PRCI_PROCMONCFG_OFFSET			0xf0
> +
>  /*
>   * Private structures
>   */
> @@ -187,6 +268,11 @@ struct prci_clk_desc {
>  /* Core clock mux control */
>  void sifive_prci_coreclksel_use_hfclk(struct __prci_data *pd);
>  void sifive_prci_coreclksel_use_corepll(struct __prci_data *pd);
> +void sifive_prci_coreclksel_use_final_corepll(struct __prci_data *pd);
> +void sifive_prci_corepllsel_use_dvfscorepll(struct __prci_data *pd);
> +void sifive_prci_corepllsel_use_corepll(struct __prci_data *pd);
> +void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd);
> +void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd);
>
>  /* Linux clock framework integration */
>  long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
> @@ -197,5 +283,7 @@ unsigned long sifive_prci_wrpll_recalc_rate(struct clk_hw *hw,
>  					    unsigned long parent_rate);
>  unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
>  					       unsigned long parent_rate);
> +unsigned long sifive_prci_hfpclkplldiv_recalc_rate(struct clk_hw *hw,
> +						   unsigned long parent_rate);
>
>  #endif /* __SIFIVE_CLK_SIFIVE_PRCI_H */
> diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
> new file mode 100644
> index 000000000000..cd7706ea5677
> --- /dev/null
> +++ b/include/dt-bindings/clock/sifive-fu740-prci.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (C) 2019 SiFive, Inc.
> + * Wesley Terpstra
> + * Paul Walmsley
> + * Zong Li
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H
> +#define __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H
> +
> +/* Clock indexes for use by Device Tree data and the PRCI driver */
> +
> +#define PRCI_CLK_COREPLL	       0
> +#define PRCI_CLK_DDRPLL		       1
> +#define PRCI_CLK_GEMGXLPLL	       2
> +#define PRCI_CLK_DVFSCOREPLL	       3
> +#define PRCI_CLK_HFPCLKPLL	       4
> +#define PRCI_CLK_CLTXPLL	       5
> +#define PRCI_CLK_TLCLK		       6
> +#define PRCI_CLK_PCLK		       7
> +
> +#endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
