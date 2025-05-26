Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B346BC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OjjPBtsge7+f1IGpohtX95LZVPwUF9STmZhVxxCdSo=; b=nl22hH1yrUlKKy
	JSFh9LmIky4zeh7emAH3I2QJFtZ/tADmH+tGREn/ntZwbw6pwf535b0D+7nNI5ozwpdM/hxlMcurW
	urvSdSp9LDd24Re7Ea+OsuCqXBg8r02j3sk089zQZ5ZnJtmC/EszoBfzQzpPLCwakOFpRtGWfgUL7
	Gk2N5FvoLRXsveoKpxDVq+zvXfl3qBgSdO0EzrWbzROpQm7d6SmUq8drkjJ0J8Ny2gnXmWsnuHljs
	FDCNJgX+0QSbLx+QTayIbW6AvJ4IgTOCwTbD5yq2bC2mXIRaki3Av/iO9Su5lZyhNpV4STMFwdrmD
	8ZP9HI4I6YK/h29PTq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZ0Z-000000093PY-2neQ;
	Mon, 26 May 2025 14:40:55 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZ0W-000000093Mi-3sSG
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 14:40:54 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a338;
	Mon, 26 May 2025 22:40:43 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:40:19 +0800
Subject: [PATCH v4 3/4] usb: dwc3: add generic driver to support flattened
 DT
MIME-Version: 1.0
Message-Id: <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=6956;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=Z5+l2LS4FLiuHcGP6xncYtlXScMGvhd7SS6ZusY5OmI=;
 b=8HN+deS9nwPP6UlNOEjqQZgejc+uNCtsoQU9+B/TWhqMOZSF4hhXe5IqzxA89JzLxFBcZKuQv
 KkjWqwuCfs6BJb2x1fPghnU9aWZkTK4SdNBSXK7ebxdyPRBw0Rw5D8M
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0lIVk5DSE1IHh1NSU9IS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d09ec2803a1kunm5f56ec4c12ea5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mk06PRw*LDE2TQxNMDQuFDEq
	LxkKFCpVSlVKTE9DSUxLT05LSkJNVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFDT0NPNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_074053_245707_54943DC6 
X-CRM114-Status: GOOD (  18.66  )
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

To support flattened dwc3 dt model and drop the glue layer, introduce the
`dwc3-generic` driver. This enables direct binding of the DWC3 core driver
and offers an alternative to the existing glue driver `dwc3-of-simple`.

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/usb/dwc3/Kconfig             |   9 ++
 drivers/usb/dwc3/Makefile            |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c | 189 +++++++++++++++++++++++++++++++++++
 3 files changed, 199 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 310d182e10b50b253d7e5a51674806e6ec442a2a..082627f39c9726ee4e0c5f966c5bc454f5541c9a 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -118,6 +118,15 @@ config USB_DWC3_OF_SIMPLE
 	  Currently supports Xilinx and Qualcomm DWC USB3 IP.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_GENERIC_PLAT
+       tristate "DWC3 Generic Platform Driver"
+       depends on OF && COMMON_CLK
+       default USB_DWC3
+       help
+         Support USB3 functionality in simple SoC integrations.
+         Currently supports SpacemiT DWC USB3 IP.
+         Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_ST
 	tristate "STMicroelectronics Platforms"
 	depends on (ARCH_STI || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 830e6c9e5fe073c1f662ce34b6a4a2da34c407a2..96469e48ff9d189cc8d0b65e65424eae2158bcfe 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
+obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)	+= dwc3-generic-plat.o
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
new file mode 100644
index 0000000000000000000000000000000000000000..8ff4626d324c40ecb52e115832c803fed7d38354
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * dwc3-generic-plat.c - DesignWare USB3 generic platform driver
+ *
+ * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
+ *
+ * Inspired by dwc3-qcom.c and dwc3-of-simple.c
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include "glue.h"
+
+struct dwc3_generic {
+	struct device		*dev;
+	struct dwc3		dwc;
+	struct clk_bulk_data	*clks;
+	int			num_clocks;
+	struct reset_control	*resets;
+};
+
+static int dwc3_generic_probe(struct platform_device *pdev)
+{
+	struct dwc3_probe_data probe_data = {};
+	struct device *dev = &pdev->dev;
+	struct dwc3_generic *dwc3;
+	struct resource *res;
+	int ret;
+
+	dwc3 = devm_kzalloc(dev, sizeof(*dwc3), GFP_KERNEL);
+	if (!dwc3)
+		return -ENOMEM;
+
+	dwc3->dev = dev;
+
+	platform_set_drvdata(pdev, dwc3);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "missing memory resource\n");
+		return -ENODEV;
+	}
+
+	dwc3->resets = of_reset_control_array_get_optional_exclusive(dev->of_node);
+	if (IS_ERR(dwc3->resets))
+		return dev_err_probe(dev, PTR_ERR(dwc3->resets), "failed to get reset\n");
+
+	ret = reset_control_assert(dwc3->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	usleep_range(10, 1000);
+
+	ret = reset_control_deassert(dwc3->resets);
+	if (ret) {
+		dev_err(dev, "failed to deassert reset\n");
+		goto reset_assert;
+	}
+
+	ret = clk_bulk_get_all(dwc3->dev, &dwc3->clks);
+	if (ret < 0) {
+		dev_err(dev, "failed to get clocks\n");
+		goto reset_assert;
+	}
+
+	dwc3->num_clocks = ret;
+
+	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		goto reset_assert;
+	}
+
+	dwc3->dwc.dev = dev;
+	probe_data.dwc = &dwc3->dwc;
+	probe_data.res = res;
+	probe_data.ignore_clocks_and_resets = true;
+	ret = dwc3_core_probe(&probe_data);
+	if (ret)  {
+		dev_err(dev, "failed to register DWC3 Core\n");
+		goto clk_disable;
+	}
+
+	return 0;
+
+clk_disable:
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
+
+reset_assert:
+	reset_control_assert(dwc3->resets);
+
+	return ret;
+}
+
+static void dwc3_generic_remove(struct platform_device *pdev)
+{
+	struct dwc3_generic *dwc3 = platform_get_drvdata(pdev);
+
+	dwc3_core_remove(&dwc3->dwc);
+
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+	clk_bulk_put_all(dwc3->num_clocks, dwc3->clks);
+
+	reset_control_assert(dwc3->resets);
+}
+
+static int __maybe_unused dwc3_generic_suspend(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dwc3_pm_suspend(&dwc3->dwc);
+	if (ret)
+		return ret;
+
+	clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_generic_resume(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
+	if (ret)
+		return ret;
+
+	ret = dwc3_pm_resume(&dwc3->dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int __maybe_unused dwc3_generic_runtime_suspend(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_suspend(&dwc3->dwc);
+}
+
+static int __maybe_unused dwc3_generic_runtime_resume(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_resume(&dwc3->dwc);
+}
+
+static int __maybe_unused dwc3_generic_runtime_idle(struct device *dev)
+{
+	struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
+
+	return dwc3_runtime_idle(&dwc3->dwc);
+}
+
+static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(dwc3_generic_suspend, dwc3_generic_resume)
+	SET_RUNTIME_PM_OPS(dwc3_generic_runtime_suspend, dwc3_generic_runtime_resume,
+			   dwc3_generic_runtime_idle)
+};
+
+static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "spacemit,k1-dwc3", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
+
+static struct platform_driver dwc3_generic_driver = {
+	.probe		= dwc3_generic_probe,
+	.remove		= dwc3_generic_remove,
+	.driver		= {
+		.name	= "dwc3-generic-plat",
+		.of_match_table = dwc3_generic_of_match,
+#ifdef CONFIG_PM_SLEEP
+		.pm	= &dwc3_generic_dev_pm_ops,
+#endif /* CONFIG_PM_SLEEP */
+	},
+};
+module_platform_driver(dwc3_generic_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 generic platform driver");

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
