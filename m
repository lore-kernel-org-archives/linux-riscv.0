Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD0C77B6C
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 04:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrHcrwAStnFrRY+0//ikMswysh5EV2ZsFixElXuhHWg=; b=yilnFZjPNAZRt0
	vwnt9q8g0FwpZKHBRoVMrk02dGzI/KFkdm+4ihrfBU/FypTLIdM/uIZR0WPYp3EhvxjVGTjXEuV4H
	ZSLt8WPHnXA6jmNX4liQ2nHV3zlh+LS5V1oQUyIYmTM2r3E9VniCNUwB+PCauGhsGB4b6xN63xFWZ
	Abh1yUh82uEW/HFdx8rPQ89mnKAWBypyoSZeW8W3FW1WzGGu88IBMrgnR0zE53c3hus6O4kOvA2cb
	0GCA61VhUn3NBQBTDwZ0ESC1bU/CYwK6gILFlXBgHwCf0knmNHduKOCZ3EGIPkANN0TeIyrZlPvzP
	A4mq8r9FCmOkY/IztUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoC0-004xkj-1f;
	Thu, 13 Apr 2023 04:04:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmoBx-004xkD-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 04:04:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A505E61F0B;
	Thu, 13 Apr 2023 04:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D6CC433D2;
	Thu, 13 Apr 2023 04:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681358651;
	bh=zvJiEhQ1HyWzEwQWMAukKRYsB3PgKTx7d8gXOm4L39U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=o8HjE7WTVnNuENI4+a96yd16ZLOvGIhnxbWMYp0h++xs+RHjBjt5RfIyXs3UY7bw+
	 6RZw3lNh+U12GCdc5f15SzTfNa78a6aTK6Y4nvQ8RnCmFl+Bb5LJzYgqj9AGIYNDOX
	 UPRQorSMLfZfGwqKz89M6i9CaAjkE1M9hnT4UKAFcbbj0LyzgtTiGZzDYMTpUBUf4k
	 0grkgFGXMHPrm9bZADRpAn2W0JtGIo8s3FrA5t/KGAajHPNUKaSF+MZBECsxfan57g
	 nGaXgQm61ABUEjR+5YY1jOjVrZs83BVo/1SZ1SrhIUWlUXaAGQTEUbrGnVws6bbeDy
	 5P3KSqo0RJntw==
Message-ID: <cd4a11ae65e186799145410969d40421.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <463ee23c-f617-bed0-27a8-56c6fb40d092@starfivetech.com>
References: <20230411135558.44282-1-xingyu.wu@starfivetech.com> <20230411135558.44282-8-xingyu.wu@starfivetech.com> <683cbe934d1df9436e003466d2a419ef.sboyd@kernel.org> <463ee23c-f617-bed0-27a8-56c6fb40d092@starfivetech.com>
Subject: Re: [PATCH v4 07/10] clk: starfive: Add StarFive JH7110 Video-Output clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Wed, 12 Apr 2023 21:04:08 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_210413_581006_FA01E7C9 
X-CRM114-Status: GOOD (  30.86  )
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

Quoting Xingyu Wu (2023-04-11 23:15:26)
> On 2023/4/12 2:33, Stephen Boyd wrote:
> > Quoting Xingyu Wu (2023-04-11 06:55:55)
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-vout.c b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> >> new file mode 100644
> >> index 000000000000..4c6f5ae198cf
> >> --- /dev/null
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-vout.c
> >> @@ -0,0 +1,239 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * StarFive JH7110 Video-Output Clock Driver
> >> + *
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/io.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/pm_runtime.h>
> >> +#include <linux/reset.h>
> > 
> > Include module.h, device.h, and kernel.h for things like ERR_PTR().
> 
> The local headfile 'clk-starfive-jh71x0.h' from the basic JH71x0 clock driver
> already includes the device.h. 
> And I found the module.h is included in device/driver.h file and then it is included
> in the device.h file.
> The kernel.h is included in the clk.h file.
> So do I still need to list them?

Yes.

> 
> > Probably need to include a reset header as well for reset APIs.
> 
> The reset APIs like devm_reset_control_get_shared() and reset_control_deassert()
> come from the reset.h file and I have included it.

Cool, I missed it.

> 
> > 
> >> +
> >> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> >> +
> >> +#include "clk-starfive-jh7110.h"
> >> +
> >> +/* external clocks */
> >> +#define JH7110_VOUTCLK_VOUT_SRC                        (JH7110_VOUTCLK_END + 0)
> >> +#define JH7110_VOUTCLK_VOUT_TOP_AHB            (JH7110_VOUTCLK_END + 1)
> >> +#define JH7110_VOUTCLK_VOUT_TOP_AXI            (JH7110_VOUTCLK_END + 2)
> >> +#define JH7110_VOUTCLK_VOUT_TOP_HDMITX0_MCLK   (JH7110_VOUTCLK_END + 3)
> >> +#define JH7110_VOUTCLK_I2STX0_BCLK             (JH7110_VOUTCLK_END + 4)
> >> +#define JH7110_VOUTCLK_HDMITX0_PIXELCLK                (JH7110_VOUTCLK_END + 5)
> >> +#define JH7110_VOUTCLK_EXT_END                 (JH7110_VOUTCLK_END + 6)
> >> +
> >> +/* VOUT domian clocks */
> >> +struct vout_top_crg {
> >> +       struct clk_bulk_data *top_clks;
> >> +       int top_clks_num;
> > 
> > size_t?
> 
> Will modify to 'unsigned int'.

Why not size_t?

> 
> > 
> >> +       if (ret < 0)
> >> +               return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
> >> +
> >> +       ret = jh7110_vout_top_crg_init(priv, top);
> >> +       if (ret)
> >> +               goto err_clk;
> >> +
> >> +       top->base = priv->base;
> >> +       dev_set_drvdata(priv->dev, (void *)(&top->base));
> > 
> > See comment later about setting this to 'top' instead. Casting away
> > iomem markings is not good hygiene.
> 
> JH7110 resets as the auxiliary device of clocks use the same iomem as the clocks
> and the iomem will be got by dev_get_drvdata() in the 7110 reset drivers when registering reset.
> So I follow the basic 7110 reset driver and also set the iomem not top_crg struct.

Oh I totally missed that this is how it's been done for the other
starfive driver. It's still not good hygiene to stash the iomem pointer
that way because the iomem marking is lost and has to be recovered. Can
you make a wrapper struct, either for the adev or to pass in struct
device::platform_data?

---8<---
diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 5ec210644e1d..851b93d0f371 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -11,6 +11,9 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <soc/starfive/reset-starfive-jh71x0.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 
@@ -335,26 +338,32 @@ static void jh7110_reset_unregister_adev(void *_adev)
 	struct auxiliary_device *adev = _adev;
 
 	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
 }
 
 static void jh7110_reset_adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
 
-	auxiliary_device_uninit(adev);
+	kfree(rdev);
 }
 
 int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 				     const char *adev_name,
 				     u32 adev_id)
 {
+	struct jh71x0_reset_adev *rdev;
 	struct auxiliary_device *adev;
 	int ret;
 
-	adev = devm_kzalloc(priv->dev, sizeof(*adev), GFP_KERNEL);
-	if (!adev)
+	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
 		return -ENOMEM;
 
+	rdev->base = priv->base;
+
+	adev = &rdev->adev;
 	adev->name = adev_name;
 	adev->dev.parent = priv->dev;
 	adev->dev.release = jh7110_reset_adev_release;
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index c1b3a490d951..2d26ae95c8cc 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -7,6 +7,8 @@
 
 #include <linux/auxiliary_bus.h>
 
+#include <soc/starfive/reset-starfive-jh71x0.h>
+
 #include "reset-starfive-jh71x0.h"
 
 #include <dt-bindings/reset/starfive,jh7110-crg.h>
@@ -33,14 +35,15 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
 	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
-	void __iomem **base = (void __iomem **)dev_get_drvdata(adev->dev.parent);
+	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
+	void __iomem *base = rdev->base;
 
 	if (!info || !base)
 		return -ENODEV;
 
 	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
-					      *base + info->assert_offset,
-					      *base + info->status_offset,
+					      base + info->assert_offset,
+					      base + info->status_offset,
 					      NULL,
 					      info->nr_resets,
 					      NULL);
diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-jh71x0.h
new file mode 100644
index 000000000000..47b486ececc5
--- /dev/null
+++ b/include/soc/starfive/reset-starfive-jh71x0.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_STARFIVE_RESET_JH71X0_H
+#define __SOC_STARFIVE_RESET_JH71X0_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/compiler_types.h>
+#include <linux/container_of.h>
+
+struct jh71x0_reset_adev {
+	void __iomem *base;
+	struct auxiliary_device adev;
+};
+
+#define to_jh71x0_reset_adev(_adev) \
+	container_of((_adev), struct jh71x0_reset_adev, adev)
+
+#endif
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
