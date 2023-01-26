Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5F3C27C76
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 02:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2j0NGmoHgPzlIjjta4FoxrmXKexZmXyfBVH1ClPgGY=; b=oGb6A5IYOLbzdm
	6tQOZar7M9+jfaB5KPt0DbpiX5c5+vkbm9NuBUK06eBnjbtplo5jcBglqtu+tZj9sy4AujvLiQAhl
	Nn/FpqLF1ltrPTEPxAe3/ALmnsQD0tqm0/Fis2VDjzWXFOUiX4lCbiB3sUt0fIEh6kwxxuVenu2H9
	U5pHYrYyLM47r+qCjeubCL0mrH3qDr8rGA2iSWSu4Wq+vadlzcCuxh5ufSZwuuZhxAtHjS/A6wY/4
	+vdzf/dnsTfRXEGIBrdXC/xIiyP3xGF06ZnCXsLeKW+8+NeBpvUOlkXS1zoUOgoUfqQwvRIIE21qH
	VqAiwg11xyUkoEO8I9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKs5c-009SjJ-OO; Thu, 26 Jan 2023 02:34:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKs5Z-009SiL-BM
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 02:34:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 334CAB81B98;
	Thu, 26 Jan 2023 02:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA85CC433EF;
	Thu, 26 Jan 2023 02:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674700436;
	bh=Il7LG4ejHekxUtc6VH+odoRiPLXcTpXSKfw7eUQYsFw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=phJuHk0FkgflVcJdesQNPhed6IEfKsW2IsoMBqDB/ugW0wjz9B0CGoW90lUS9wgC8
	 Lblrw2Ws7KvDVDDWANZxW9FmEhpQmufYjraG5d32iWR/Or18FbCJdmR6OBO1qaSEHv
	 GxTxEHi3oNQUNwGiX/UxGWEid0tgsP3y5Bq8L3NNua1frOydmG6DVSK+Xb/9kKuxfC
	 /gNd24j7nE/TrMH9L/QXgykVEU63tsg1lPzigf2MasjQQSeG+cR9j/gsZEPaSQt7Td
	 VTBjoYk5yLJ3fivRTZeO3C1GjkH9TZca5NAhMKvWTS5VuTZz2XPdlI+/0tlKtGrUmk
	 9D2J0NIl5wnxQ==
Message-ID: <5bb5263d26b157548d7ba39f80989c69.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230120024445.244345-4-xingyu.wu@starfivetech.com>
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com> <20230120024445.244345-4-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v1 03/11] clk: starfive: Add StarFive JH7110 System-Top-Group clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 25 Jan 2023 18:33:54 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_183409_695803_FA8AD28E 
X-CRM114-Status: GOOD (  19.13  )
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

Quoting Xingyu Wu (2023-01-19 18:44:37)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-stg.c b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> new file mode 100644
> index 000000000000..c2740f44e796
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-stg.c
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7110 System-Top-Group Clock Driver
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>

Is this include used? If not, please remove.

> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
[...]
> +static int jh7110_stgcrg_probe(struct platform_device *pdev)
> +{
> +       struct jh71x0_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH7110_STGCLK_END),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       dev_set_drvdata(priv->dev, priv->base);
> +
> +       for (idx = 0; idx < JH7110_STGCLK_END; idx++) {
> +               u32 max = jh7110_stgclk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh7110_stgclk_data[idx].name,
> +                       .ops = starfive_jh71x0_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh7110_stgclk_data[idx].flags,
> +               };
> +               struct jh71x0_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh7110_stgclk_data[idx].parents[i];
> +
> +                       if (pidx < JH7110_STGCLK_END)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx == JH7110_STGCLK_OSC)
> +                               parents[i].fw_name = "osc";
> +                       else if (pidx == JH7110_STGCLK_HIFI4_CORE)
> +                               parents[i].fw_name = "hifi4_core";
> +                       else if (pidx == JH7110_STGCLK_STG_AXIAHB)
> +                               parents[i].fw_name = "stg_axiahb";
> +                       else if (pidx == JH7110_STGCLK_USB_125M)
> +                               parents[i].fw_name = "usb_125m";
> +                       else if (pidx == JH7110_STGCLK_CPU_BUS)
> +                               parents[i].fw_name = "cpu_bus";
> +                       else if (pidx == JH7110_STGCLK_HIFI4_AXI)
> +                               parents[i].fw_name = "hifi4_axi";
> +                       else if (pidx == JH7110_STGCLK_NOCSTG_BUS)
> +                               parents[i].fw_name = "nocstg_bus";
> +                       else if (pidx == JH7110_STGCLK_APB_BUS)
> +                               parents[i].fw_name = "apb_bus";

Can this be an array lookup instead of a pile of conditions?

	if (pidx < JH7110_STGCLK_END)
		...
	else
		parents[i].fw_name = fw_table[pidx - JH7110_STGCLK_END];

Or even better, don't use strings at all and just make the 'pidx' number
(possibly minus the end constant) be the 'clocks' property index that
you want.

> +               }
> +
> +               clk->hw.init = &init;
> +               clk->idx = idx;
> +               clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +               ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh7110_stgclk_get, priv);
> +       if (ret)
> +               return ret;
> +
> +       return jh7110_reset_controller_register(priv, "reset-stg", 2);

Is this also devm-ified?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
