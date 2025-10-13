Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47092CCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mvUIft5MXYtwVqMtTjf8fa4h3A0/0uWWC+M+QJHwnE=; b=43WcElAiiiTB5R
	dlt+6I+ZEz71xZJyffYVh+97dTOzptKA7XH66dgojZC3Y9fllnAlcrgrxxMrt8JUCrxfNJbvHFF0V
	hJJO6ruPIsJZso8x7FLxfr1CPSu0RngULTAEb6NMTpSFkrD1uaSL88anQt13oat/krX7l+pBy0kHh
	3+vVsh9v/+Z++mhtA/kOiCLviA77OBh1HNuzGw12JhSlrLZJvnq32pFE6gpwSNuha2QhC1lqnshym
	yVIU7/hA/EeWyw4jf8bZkkS6mUyQcPwP0ph0Svi52UgP4kdnMmYXM0gh77hZAXxHallh8g3g14fyn
	jFtzXkiRT9Ipqaj2CmUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeI-0000000E4nt-1Vx5;
	Mon, 13 Oct 2025 17:47:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeF-0000000E4mA-21e1
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32FD845130;
	Mon, 13 Oct 2025 17:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8AAC116C6;
	Mon, 13 Oct 2025 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377671;
	bh=LLvPaeaDgbN1v+SEvOddhb8/ImHBKYgsCBzaGq5fKtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h0JwQ+84uewBHrXs9AI4/ypHaJbeDEwnizotdzk6OnMnmWjSUbqGFwXpaFFCk1gcC
	 epFf6J+sEHv7nRQq/UOVQ5jFQ1tL3s6xsuBDRUYBd2B3MYB0o4EQc/OacNOucI6pec
	 ZYzWmzpIF3Ki/UfgczQTzZw3BUFLMz7IEZgeTuj+IR1cONMdbS6O/n15Yf1Z6TgHeg
	 b9I0ahl7f96w1wjyx5y0ydM14P2y728ChzZbmFLRwAL5WvBtxsknBHMLLXKkyoUquq
	 Ku7T/19s9Lga9cxD4mio/+zlvtYgBmToCiyHPlVnN48P0hotYCsqE4SPABBtXBOedF
	 3SxLHe774FEnA==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/9] soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
Date: Mon, 13 Oct 2025 18:45:34 +0100
Message-ID: <20251013-patient-matrimony-6162c8f92e2e@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4873; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Lcc0lHBfQVQLXEUPw6TwgGGxT3tWaxaoKaJLIXpLxZk=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrfYHrq+Tdn3saNaw9g6fxLxbz3ZPiGgM1VZb0tN5T mql2NTIjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzE/CnDP60js/m5VB3yCm7I /dz79ablA8ZN5/K13l8qXZTD96ykSI2RYbccs9Ir4d0l3/ImnN7ok8HifMQkaeWuyxanpTZKBef 4MAIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_104751_564501_2B84B431 
X-CRM114-Status: GOOD (  19.53  )
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
index 19f4b576f822..31d188311e05 100644
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
index 14489919fe4b..1a3a1594b089 100644
--- a/drivers/soc/microchip/Makefile
+++ b/drivers/soc/microchip/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
+obj-$(CONFIG_POLARFIRE_SOC_SYSCONS)	+= mpfs-control-scb.o mpfs-mss-top-sysreg.o
diff --git a/drivers/soc/microchip/mpfs-control-scb.c b/drivers/soc/microchip/mpfs-control-scb.c
new file mode 100644
index 000000000000..d1a8e79c232e
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
index 000000000000..9b2e7b84cdba
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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
