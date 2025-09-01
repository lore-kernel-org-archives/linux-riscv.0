Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C205BCA1006
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1UM1wIUZy6KanuR/RBZslyEhkgEZq68RBYl/UWtmiI=; b=XV3VCaSQ33Cfz1
	U676NFuDrRAHz6/+XXxyu7cnpqz3xfpluXg9R/jjXzvvnXyToGMaJ49BUjfXgem8IojHVd1lGJ0xl
	MJsRmO4OWRiaChPXAUt9mfThEKcu3CBcs1i3p14cfvOWRqrklocXiwxXWlmC63DhykC5WATVJ0LNB
	gnSOmDcYhVsDNdgl0Pv+ShirnZQ67J/WbESc2ZPqsMlQEXDAmKvAFJmyvLTgh6qi+GiGkIG6TAjiE
	TTcMF7ieoiAZhAc63qqhzKTQkLB0mGt/TGy6k8u/mzHGikUciC97oORmJyRr3qbmhHDXsV0JpBX/y
	V6w9S5pK4k0WpqWqVbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4DU-0000000CciR-0kP4;
	Mon, 01 Sep 2025 13:05:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2LU-0000000BzUN-1FYt
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:05:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C291F41A4A;
	Mon,  1 Sep 2025 11:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3668CC4CEF0;
	Mon,  1 Sep 2025 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724707;
	bh=SZ65yBZC7lEGa0Ak3OsvShyUfq6wluR5gsaWqbe1c/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c+d3JVqRFLTcr+GcqArPycExsPnuBk7OOd/FD14wcF/IffTcuAtRVm9C3zk9knRDX
	 es4eAOokPlSO0PwB8ptjiy3Y6+oxDrruSPXISGnuSc534SCANX5XMgsArmNOXG87Js
	 3pQCWtAirCdnnuZHagDl3dEuOH5DMbNtpeeFsm2otXRrYl9te1ES4zD9LL5KPc1EvE
	 HeBTmVMsvcmfiIu5zQlJW3wOgBJTakB26RwvEXNzMNm5zOpR8m3XukYahMD3dG4AL9
	 XYF8G9CMC+puk3/XZTAqNsR1smmwQndbF3FYRDJAVlIA1DL6+6wqyGIHQCP6AYeD6M
	 e0RNSa2ubPTQA==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
Subject: [PATCH v4 3/9] soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
Date: Mon,  1 Sep 2025 12:04:15 +0100
Message-ID: <20250901-contempt-smelting-04aa3b08e112@spud>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-rigid-sacrifice-0039c6e6234e@spud>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4881; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=bgb+aKhoXPSoMWSoLjwng00La7ffwhWTF00zqjwBdl8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlba9fO7gh3ddph23c3TfhF/LMFdlOnRJ/9HtMfKXfmQ 6eH/H2ujlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkfzMjw6mlej66P6O5vr59 MUexuur+synHfecu8biXvJNtkdNj3euMDKfzpZj5JictKlt3JN3k4ce8fwk3lDUi2cQtDj+6evp hGhsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_040508_380064_47B255B0 
X-CRM114-Status: GOOD (  20.47  )
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

The control-scb and mss-top-sysreg regions on PolarFire SoC both fulfill
multiple purposes. The former is used for mailbox functions in addition
to the temperature & voltage sensor while the latter is used for clocks,
resets, interrupt muxing and pinctrl.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/Kconfig               | 13 ++++++
 drivers/soc/microchip/Makefile              |  1 +
 drivers/soc/microchip/mpfs-control-scb.c    | 45 +++++++++++++++++++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c | 48 +++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c

diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
index 19f4b576f822b..31d188311e05f 100644
--- a/drivers/soc/microchip/Kconfig
+++ b/drivers/soc/microchip/Kconfig
@@ -9,3 +9,16 @@ config POLARFIRE_SOC_SYS_CTRL
 	  module will be called mpfs_system_controller.
 
 	  If unsure, say N.
+
+config POLARFIRE_SOC_SYSCONS
+	bool "PolarFire SoC (MPFS) syscon drivers"
+	default y
+	depends on ARCH_MICROCHIP
+	select MFD_CORE
+	help
+	  These drivers add support for the syscons on PolarFire SoC (MPFS).
+	  Without these drivers core parts of the kernel such as clocks
+	  and resets will not function correctly.
+
+	  If unsure, and on a PolarFire SoC, say y.
+
diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
index 14489919fe4b3..1a3a1594b089b 100644
--- a/drivers/soc/microchip/Makefile
+++ b/drivers/soc/microchip/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
+obj-$(CONFIG_POLARFIRE_SOC_SYSCONS)	+= mpfs-control-scb.o mpfs-mss-top-sysreg.o
diff --git a/drivers/soc/microchip/mpfs-control-scb.c b/drivers/soc/microchip/mpfs-control-scb.c
new file mode 100644
index 0000000000000..d1a8e79c232e3
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-control-scb.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell mpfs_control_scb_devs[] = {
+	{ .name = "mpfs-tvs", },
+};
+
+static int mpfs_control_scb_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_control_scb_devs,
+			      1, NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_control_scb_of_match[] = {
+	{.compatible = "microchip,mpfs-control-scb", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpfs_control_scb_of_match);
+
+static struct platform_driver mpfs_control_scb_driver = {
+	.driver = {
+		.name = "mpfs-control-scb",
+		.of_match_table = mpfs_control_scb_of_match,
+	},
+	.probe = mpfs_control_scb_probe,
+};
+module_platform_driver(mpfs_control_scb_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("PolarFire SoC control scb driver");
diff --git a/drivers/soc/microchip/mpfs-mss-top-sysreg.c b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
new file mode 100644
index 0000000000000..9b2e7b84cdba2
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-mss-top-sysreg.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/array_size.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell mpfs_mss_top_sysreg_devs[] = {
+	{ .name = "mpfs-reset", },
+};
+
+static int mpfs_mss_top_sysreg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, mpfs_mss_top_sysreg_devs,
+			      1, NULL, 0, NULL);
+	if (ret)
+		return ret;
+
+	if (devm_of_platform_populate(dev))
+		dev_err(dev, "Error populating children\n");
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_mss_top_sysreg_of_match[] = {
+	{.compatible = "microchip,mpfs-mss-top-sysreg", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpfs_mss_top_sysreg_of_match);
+
+static struct platform_driver mpfs_mss_top_sysreg_driver = {
+	.driver = {
+		.name = "mpfs-mss-top-sysreg",
+		.of_match_table = mpfs_mss_top_sysreg_of_match,
+	},
+	.probe = mpfs_mss_top_sysreg_probe,
+};
+module_platform_driver(mpfs_mss_top_sysreg_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("PolarFire SoC mss top sysreg driver");
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
