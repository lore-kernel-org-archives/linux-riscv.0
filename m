Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A7CD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WCGZvjOclZfgf5bUD1N2NteO/c0piBXPUBiYhO1MAo=; b=zxYsIRXUkfpSlL
	/1YQ/MdLpgd5CtmE83tYJtczQW1BOg+qXZHsvcoKBYOxk+Jj40q9l2vFriKDhEmWzh1mi3tUmtGE4
	OJnBWhdWjKREx1hNfE2fBMz7sJMKaPOiKiITdPWFKQAk/vDO5wkES/hW1irlWTTjkEQrWBV3D5W0F
	3doyIJxwXdTodO60DxHUXWAQNKWHwIxuJsyMLdeHwKjN8Cpr3v5AuvqRWi0vDerlL48rHeWwYyVJT
	zzzmz3im6TrWN3sqa2o+QUgtRSmjPbRdHBPi0H4GZCbodnmG/rtGGv9vAEHI6bPz/aUvTN9r2oFke
	SMa9cdsaN2K4RkcWlS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupBd-0000000AwtH-2W2T;
	Thu, 11 Apr 2024 07:49:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupBa-0000000AwsG-04RH
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1462ACE10FF;
	Thu, 11 Apr 2024 07:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FA2C433F1;
	Thu, 11 Apr 2024 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712821767;
	bh=GQQD6YHCcBkicBSPTMO2OoklUsO8Qz/uM9luYCPMi30=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=crdVATW2FLVb3crXNiLBHqFn6ynsHqIcCfM5bLTeAs5VDh9JY3eMei8amlkl5tVKg
	 KES6kIL4Nwmjyjybv5PKIyspbnq+7a96u7fm66OoqzqrsQkyuTQN0O1W5nRgiVzQSw
	 UmWvDHagKpqtXszJ/ezQrDVD7m2jOogiY3vsGAzDZLnaF2pQcq7sxhOhQK/G4bHWWu
	 Kui7KQaf1dY6ThAosg5QR005yovEguC3NhlZO/Ed6HpmFQUcAH0c2zku7BC2f8OdCf
	 ccCr0G79iv3SXv3wtIlpUHus7wwW7R/VN3JmNhf8cVGRwivsYVjnbSLJuwle6WToGZ
	 OPUboYjEB4J/Q==
Message-ID: <44131080f148a472ed5dee901a66ffa7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240110133128.286657-9-jeeheng.sia@starfivetech.com>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com> <20240110133128.286657-9-jeeheng.sia@starfivetech.com>
Subject: Re: [RFC v3 08/16] clk: starfive: Add JH8100 North-West clock generator driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, aou@eecs.berkeley.edu, conor@kernel.org, emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, kernel@esmil.dk, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, xingyu.wu@starfivetech.com
Date: Thu, 11 Apr 2024 00:49:25 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004930_453147_46A55E57 
X-CRM114-Status: GOOD (  14.11  )
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

Quoting Sia Jee Heng (2024-01-10 05:31:20)
> diff --git a/drivers/clk/starfive/clk-starfive-jh8100-nw.c b/drivers/clk/starfive/clk-starfive-jh8100-nw.c
> new file mode 100644
> index 000000000000..018f5af6c777
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh8100-nw.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH8100 North-West Clock Driver
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
[...]
> +
> +static int jh8100_nwcrg_probe(struct platform_device *pdev)
> +{
> +       struct starfive_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH8100_NWCLK_NUM_CLKS),
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
> +       for (idx = 0; idx < JH8100_NWCLK_NUM_CLKS; idx++) {
> +               u32 max = jh8100_nwcrg_clk_data[idx].max;
> +               struct clk_parent_data parents[4] = {};
> +               struct clk_init_data init = {
> +                       .name = jh8100_nwcrg_clk_data[idx].name,
> +                       .ops = starfive_clk_ops(max),
> +                       .parent_data = parents,
> +                       .num_parents =
> +                               ((max & STARFIVE_CLK_MUX_MASK) >> STARFIVE_CLK_MUX_SHIFT) + 1,
> +                       .flags = jh8100_nwcrg_clk_data[idx].flags,
> +               };
> +               struct starfive_clk *clk = &priv->reg[idx];
> +               unsigned int i;
> +
> +               for (i = 0; i < init.num_parents; i++) {
> +                       unsigned int pidx = jh8100_nwcrg_clk_data[idx].parents[i];
> +
> +                       if (pidx < JH8100_NWCLK_NUM_CLKS)
> +                               parents[i].hw = &priv->reg[pidx].hw;
> +                       else if (pidx == JH8100_NWCLK_OSC)
> +                               parents[i].fw_name = "osc";

Please generate this one time with structures and use an index instead
of string names. This is faster in multiple ways, and the parent data is
copied anyway.

> +                       else if (pidx == JH8100_NWCLK_APB_BUS)
> +                               parents[i].fw_name = "apb_bus";
> +                       else if (pidx == JH8100_NWCLK_APB_BUS_PER4)
> +                               parents[i].fw_name = "apb_bus_per4";

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
