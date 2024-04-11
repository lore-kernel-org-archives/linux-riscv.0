Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D7BCD1292
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 07:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=of4gBMJJ6QGiiwFRg9RhHErHtI6V7+lCsXBDCjkJFK4=; b=XdKeK5C4L49ubi
	2x3y8O0MpFWzLrLhpdhwW6X0IqiID1A7Vy0OHIyKvK1AblgH61S4osXJvXf546Ex+yCmUnxmdHv6G
	xzBKT1q/yfyDzBDu+Fu4zVBUd313WyzNc7UpNbcNaBp8k+NGjRQdoLvLuVEGvh6MXe1lhkd4c/PFt
	woPe92V4ONuFZo29xXaQbDHA660vSqvQVq4MfzVOpE11rQ2icdLT44mJFWVSWLvi6SSdTUYBVvnnv
	179CcUEVjx6y0MmYOyzZiaIScuP+o02bHqyRrJHqRid2WHMwkA950FZQOzJJELFnWA5ad/II8ycJG
	TD3m0LTPvhQGBMAm20aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup84-0000000Avp3-1mqD;
	Thu, 11 Apr 2024 07:45:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rup80-0000000AvmW-32DU
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 07:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D37C5CE2F56;
	Thu, 11 Apr 2024 07:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B73C433F1;
	Thu, 11 Apr 2024 07:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712821546;
	bh=bIJYJVzqanaZpwzfS5AEQO7u84UA48mefo7TJ6Lffno=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tG/lFgCur7g9BOwGLDPzXN5cSqy9ewWid7Mh0o4YCsdccnNmtKYDatti9HQ6V2FeY
	 KNSoDo/Wqe3RsMPhSIouPSrXHQ5+1/AqjC0QW2sDlU3z5RW3e6y6zhmZobwDcYlSJS
	 kw+Kekd3JK5Kz0IIgwkI4CtMbYlWs9zbtaoI1aR9hXpJFCSzoR10y3WQNwFFhpe6x2
	 b30i3G6oDWPxmbv9D7Pae6AUQqso6INKBRJC2Vh5GqSnAHxB88Cf8uJkAOEU9Wmkhg
	 ZmBzpLnDCIpumupVEiZ7KmI1owJ/pQlPUekASduGLkIAZlVYeHnR8KkzHKfDZBjTZ4
	 1sbajJFOa/UFA==
Message-ID: <deb23094f40df7df9e7330e95af4e64d.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240110133128.286657-7-jeeheng.sia@starfivetech.com>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com> <20240110133128.286657-7-jeeheng.sia@starfivetech.com>
Subject: Re: [RFC v3 06/16] clk: starfive: Add JH8100 System clock generator driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, jeeheng.sia@starfivetech.com, leyfoon.tan@starfivetech.com
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, aou@eecs.berkeley.edu, conor@kernel.org, emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, kernel@esmil.dk, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, xingyu.wu@starfivetech.com
Date: Thu, 11 Apr 2024 00:45:43 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_004549_184596_E042E839 
X-CRM114-Status: GOOD (  16.28  )
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

Quoting Sia Jee Heng (2024-01-10 05:31:18)
> diff --git a/drivers/clk/starfive/clk-starfive-jh8100-sys.c b/drivers/clk/starfive/clk-starfive-jh8100-sys.c
> new file mode 100644
> index 000000000000..6d7e750dce82
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh8100-sys.c
> @@ -0,0 +1,415 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH8100 System Clock Driver
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> + *
> + */
> +
> +#include <linux/clk.h>

Drop this unused include.

> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/io.h>

Is this include used in this file?

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <soc/starfive/reset-starfive-common.h>
> +
> +#include <dt-bindings/clock/starfive,jh8100-crg.h>
> +
> +#include "clk-starfive-jh8100.h"
> +
> +#define JH8100_SYSCLK_NUM_CLKS                 (JH8100_SYSCLK_NNE_ICG_EN + 1)
> +
[...]
> +
> +static void jh8100_reset_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +       struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
> +
> +       kfree(rdev);
> +}
> +
> +int jh8100_reset_controller_register(struct starfive_clk_priv *priv,

Just pass 'dev' and 'base' instead.

> +                                    const char *adev_name,
> +                                    u32 adev_id)
> +{
> +       struct starfive_reset_adev *rdev;
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
> +       if (!rdev)
> +               return -ENOMEM;
> +
> +       rdev->base = priv->base;
> +
> +       adev = &rdev->adev;
> +       adev->name = adev_name;
> +       adev->dev.parent = priv->dev;
> +       adev->dev.release = jh8100_reset_adev_release;
> +       adev->id = adev_id;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret)
> +               return ret;
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(priv->dev,
> +                                       jh8100_reset_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(jh8100_reset_controller_register);

Move this to drivers/reset/ please.

> +
> +static int __init jh8100_syscrg_probe(struct platform_device *pdev)
> +{
> +       struct starfive_clk_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev,
> +                           struct_size(priv, reg, JH8100_SYSCLK_NUM_CLKS),
> +                           GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev = &pdev->dev;
> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
[...]
> +
> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, jh8100_sysclk_get, priv);
> +       if (ret)
> +               return ret;
> +
> +       return jh8100_reset_controller_register(priv, "rst-sys", 0);
> +}
> +
> +static const struct of_device_id jh8100_syscrg_match[] = {
> +       { .compatible = "starfive,jh8100-syscrg" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver jh8100_syscrg_driver = {
> +       .driver = {
> +               .name = "clk-starfive-jh8100-sys",
> +               .of_match_table = jh8100_syscrg_match,
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +builtin_platform_driver_probe(jh8100_syscrg_driver, jh8100_syscrg_probe);
> diff --git a/drivers/clk/starfive/clk-starfive-jh8100.h b/drivers/clk/starfive/clk-starfive-jh8100.h
> new file mode 100644
> index 000000000000..9b69a56fe5fc
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh8100.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __CLK_STARFIVE_JH8100_H
> +#define __CLK_STARFIVE_JH8100_H
> +
> +#include "clk-starfive-common.h"

Drop this include.

> +
> +int jh8100_reset_controller_register(struct starfive_clk_priv *priv,

Forward declare starfive_clk_priv instead.

> +                                    const char *adev_name,
> +                                    u32 adev_id);

Why is this header here at all?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
