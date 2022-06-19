Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478F5C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaMG0RGyYoK3GKMvBg42DD/+/KQ01o4Dr3yQd/33PeU=; b=YVvu9clFir13yZ
	tjBbVP+ScKR+PbMg8N+J0Juea5cd4lzbl0o9bCoaEutNBUS5zfiOTMJH0k6QXcIWxBSZkNYGcVRdK
	pQNBAeHoWVr0oBBOkK3d53FlktQISkHtkPuIG3d0Fapx2WeUopU8cd1GEIQ9c58kJh6RicKao8LFK
	PCWxCfBhhg479UpzhN2sQeuuzDAtRzh+rCcpuc5lP9ncO+Ke4y539QGEEgKdQ/yqM+TupUbO6ozZU
	kJzxofasf4RdcY4FPOXjqF2BW/RiNxApEf6Z2YJH+j3N4uCY67LNfbEu0gAGcTc3w4f/hgNejTwTg
	6yUijIj0R5J7d5/MtkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y84-00EjQ4-Rb; Sun, 19 Jun 2022 16:50:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2y7y-00EjNN-Fv
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 16:50:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q9so11668441wrd.8
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jun 2022 09:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2U26d1RUDN40F8pXZDx2og6vajjIrs72J5qYfLoOCUY=;
        b=a/KqKSDua/YhHcpIKxVc8N8J0GVZLdyKnxxK3no+G+TEd54zlxZbnLXf6+9OWzvsxq
         DOd0uguBWie7LqV06kD7ZewrXbZPCniZgbyif/L35ANFqGvpRp3UwzXxwM1ScFl1R0+R
         28pxiiOS0ZDKMTZk0Qk2yfnP6ng/hJ5fwURg02GE+LwyOBgbhADUjLuaQv4os/xaHTBT
         IFzNk/9XQwZJ/2Tno4ftGaxnf95/ShVfH4KNIDRQFq9WF/zVnQWNH1uLrncHDmAmS3CZ
         91gn5GRHKWbHzpo6+ol9JmDwsRhcIqpRtwZLgaOyidCrvd9kWy3GZFXCjX0xopx+CIeq
         CzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2U26d1RUDN40F8pXZDx2og6vajjIrs72J5qYfLoOCUY=;
        b=4fDF6s6dm2vDv+p2/U7NceV/7o76htRsvNJgHmrV9q5rNS6Wc1Xj3emZTDppzoGop7
         BhEzvzNRFqA69I6dS2ZJwr6SHRchfEjM+3G9NnFd2GtmOH3xeI6XQPoWhlabqviwfTxm
         K5KAym+bRAcz9um9O9nsIKhJaO6NRGyR7HbliKQ9Ax/ZYK7hxnEEV6rD8OTE3sN84tsx
         1KNQO/SArgfQMXAEMZFes8Zj83FIhWHEQ8qBjNHP+v/uPRo5RBqIZl0O8k+qyMTBxCF6
         2IR3cpMk6y8BJ2ZmbH/nUhhSETG3xWVpdfeJR3uwdhSskRKMXT/0JOycYVriKmy9Twrh
         gcIA==
X-Gm-Message-State: AJIora9eXC5THmOyh70lG+X7Ikj4lZxsp0CjeCqEZ5FbwPUBvUUdEA9I
	ugkbFP5VV3IVjb9EpuEH+EskAUS94toK7TpcLoU=
X-Google-Smtp-Source: AGRyM1u2F06uLF9I1C9pTm9cF8MTa7GrTptuqR0ZCQFATDOGJcdnLqgdR8SoNllm822PnnzCYlk8BA==
X-Received: by 2002:adf:de8d:0:b0:21a:23e0:6881 with SMTP id w13-20020adfde8d000000b0021a23e06881mr18743406wrl.291.1655657420799;
        Sun, 19 Jun 2022 09:50:20 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id m14-20020adfdc4e000000b0021a3c960214sm9189510wrj.6.2022.06.19.09.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 09:50:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC 3/6] clk: microchip: mpfs: add reset controller
Date: Sun, 19 Jun 2022 17:49:33 +0100
Message-Id: <20220619164935.1492823-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619164935.1492823-1-mail@conchuod.ie>
References: <20220619164935.1492823-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_095022_614804_E90D16C8 
X-CRM114-Status: GOOD (  20.50  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add a reset controller to PolarFire SoC's clock driver. This reset
controller is registered as an aux device and read/write functions
exported to the drivers namespace so that the reset controller can
access the peripheral device reset register.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/Kconfig    |   1 +
 drivers/clk/microchip/clk-mpfs.c | 118 ++++++++++++++++++++++++++++---
 include/soc/microchip/mpfs.h     |   8 +++
 3 files changed, 116 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
index a5a99873c4f5..b46e864b3bd8 100644
--- a/drivers/clk/microchip/Kconfig
+++ b/drivers/clk/microchip/Kconfig
@@ -6,5 +6,6 @@ config COMMON_CLK_PIC32
 config MCHP_CLK_MPFS
 	bool "Clk driver for PolarFire SoC"
 	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Supports Clock Configuration for PolarFire SoC
diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 070c3b896559..19a9f8cd12ff 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -3,12 +3,15 @@
  * Daire McNamara,<daire.mcnamara@microchip.com>
  * Copyright (C) 2020 Microchip Technology Inc.  All rights reserved.
  */
+#include "linux/device.h"
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/clock/microchip,mpfs-clock.h>
+#include <soc/microchip/mpfs.h>
 
 /* address offset of control registers */
 #define REG_MSSPLL_REF_CR	0x08u
@@ -28,6 +31,7 @@
 #define MSSPLL_FIXED_DIV	4u
 
 struct mpfs_clock_data {
+	struct device *dev;
 	void __iomem *base;
 	void __iomem *msspll_base;
 	struct clk_hw_onecell_data hw_data;
@@ -302,10 +306,6 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
 
 	spin_lock_irqsave(&mpfs_clk_lock, flags);
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	val = reg & ~(1u << periph->shift);
-	writel_relaxed(val, base_addr + REG_SUBBLK_RESET_CR);
-
 	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
 	val = reg | (1u << periph->shift);
 	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
@@ -339,12 +339,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
 	void __iomem *base_addr = periph_hw->sys_base;
 	u32 reg;
 
-	reg = readl_relaxed(base_addr + REG_SUBBLK_RESET_CR);
-	if ((reg & (1u << periph->shift)) == 0u) {
-		reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
-		if (reg & (1u << periph->shift))
-			return 1;
-	}
+	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
+	if (reg & (1u << periph->shift))
+		return 1;
 
 	return 0;
 }
@@ -438,6 +435,99 @@ static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_c
 	return 0;
 }
 
+/*
+ * Peripheral clock resets
+ */
+
+#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
+
+u32 mpfs_reset_read(struct device *dev)
+{
+	struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
+
+	return readl_relaxed(clock_data->base + REG_SUBBLK_RESET_CR);
+}
+EXPORT_SYMBOL_NS_GPL(mpfs_reset_read, MCHP_CLK_MPFS);
+
+void mpfs_reset_write(struct device *dev, u32 val)
+{
+	struct mpfs_clock_data *clock_data = dev_get_drvdata(dev->parent);
+
+	writel_relaxed(val, clock_data->base + REG_SUBBLK_RESET_CR);
+}
+EXPORT_SYMBOL_NS_GPL(mpfs_reset_write, MCHP_CLK_MPFS);
+
+static void mpfs_reset_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+}
+
+static void mpfs_reset_adev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	auxiliary_device_uninit(adev);
+
+	kfree(adev->name);
+	kfree(adev);
+}
+
+static struct auxiliary_device *mpfs_reset_adev_alloc(struct mpfs_clock_data *clk_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return ERR_PTR(-ENOMEM);
+
+	adev->name = "reset-mpfs";
+	adev->dev.parent = clk_data->dev;
+	adev->dev.release = mpfs_reset_adev_release;
+	adev->id = 666u;
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ERR_PTR(ret);
+	}
+
+	return adev;
+}
+
+static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = mpfs_reset_adev_alloc(clk_data);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(clk_data->dev, mpfs_reset_unregister_adev, adev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+#else /* !CONFIG_RESET_CONTROLLER */
+
+static int mpfs_reset_controller_register(struct mpfs_clock_data *clk_data)
+{
+	return 0;
+}
+
+#endif /* !CONFIG_RESET_CONTROLLER */
+
 static int mpfs_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -462,6 +552,8 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 		return PTR_ERR(clk_data->msspll_base);
 
 	clk_data->hw_data.num = num_clks;
+	clk_data->dev = dev;
+	dev_set_drvdata(dev, clk_data);
 
 	ret = mpfs_clk_register_mssplls(dev, mpfs_msspll_clks, ARRAY_SIZE(mpfs_msspll_clks),
 					clk_data);
@@ -481,6 +573,10 @@ static int mpfs_clk_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = mpfs_reset_controller_register(clk_data);
+	if (ret)
+		return ret;
+
 	return ret;
 }
 
@@ -488,7 +584,7 @@ static const struct of_device_id mpfs_clk_of_match_table[] = {
 	{ .compatible = "microchip,mpfs-clkcfg", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, mpfs_clk_match_table);
+MODULE_DEVICE_TABLE(of, mpfs_clk_of_match_table);
 
 static struct platform_driver mpfs_clk_driver = {
 	.probe = mpfs_clk_probe,
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 6466515262bd..f916dcde457f 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -40,4 +40,12 @@ struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
+#if IS_ENABLED(CONFIG_MCHP_CLK_MPFS)
+
+u32 mpfs_reset_read(struct device *dev);
+
+void mpfs_reset_write(struct device *dev, u32 val);
+
+#endif /* if IS_ENABLED(CONFIG_MCHP_CLK_MPFS) */
+
 #endif /* __SOC_MPFS_H__ */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
