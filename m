Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D96C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 17:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFdwkaMgj48HthGxfjVQOBu4oOvDDlOvgwMvA6TV2go=; b=p6JzcybZlDJdi4
	dTBjkXIc3KlPYRHMBeqKUc3T4EhtuMXb7U9kATIubPmLD1J+mpxCtWm2BvsGElvvTqoqmgvHcfO00
	PdTn5YAFQ1+vi9H0YbOvAKGz0scipHqBXeEvCAvpUmthEVCtNhxB+j+kt4S7osuC/FgKKagy8Zt7Z
	pCosgHDJ3D8qphyQ6Ei1/d+xbyD63Jy2y55YLtggA7nYh1ml/BN209OaRzotXgsHylv7Ayypiwql9
	iabVjjbhUrHa62J+Se5UyOX6WZs6lsoqTyRy3ODKhpHxhiERe80WPaKxckMWvACT88kCjoMwMGymH
	E8S2eddaFuD4B7/bD0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5f-0000000FgaJ-0tu2;
	Fri, 21 Mar 2025 17:23:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvg5c-0000000FgYV-2sdp
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 17:23:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 586F0A4948B;
	Fri, 21 Mar 2025 17:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1037FC4CEEA;
	Fri, 21 Mar 2025 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742577803;
	bh=WTEV9gRBKTjHQJkhZElP9ikmzKR8yONY4yniwIxKgNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p1Buswq5DhOIdrnEyWcXLn9CagCPIQfFlOA8jrDcvw+iicGJTsFFqhaprIRCIzYWL
	 kh6c/B9Jgu7gzxQQUHVn/WGerWtB6DzyORXMuJ6IeLE8m0ESV1lStCENl2C5Kv0Ayc
	 PFjC2Hh5Xn+VmMm/UxwJqnCKBqGcGTJ9Xqq4j7s1bMfB8/YEFK3P5ivQ9KdqnuT8rl
	 b7sfYg+270yPfW0Z7y7Kp6HJrexI2iRdYG4acbmBCAmJKUW09Yt8INgEh6RJCY8g8r
	 yADPu7JbYboS18qXfg/frk0YWbsfI7TY25GJ+enoZXflpBrW0gfdYnwe6elQtXU6qH
	 8tc1A0ZFLSHvA==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/9] soc: microchip: add mfd drivers for two syscon regions on PolarFire SoC
Date: Fri, 21 Mar 2025 17:22:36 +0000
Message-ID: <20250321-hardener-bottom-e13a3105aaef@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
References: <20250321-cuddly-hazily-d0ab1e1747b5@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4873; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=wFvCfzqrnwlJetwR40UL5D4KBYCx4X8HvHOOg2irsFA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOl3F0SuFHikOTODIVVufdL/k1/8X/048ufdRR/uqdcW+ s1YJBw1raOUhUGMg0FWTJEl8XZfi9T6Py47nHvewsxhZQIZwsDFKQATqTjA8Ffqk5NV2N8f36KM L2z7qRLDXXrR2Ccn+HbJ/3UPH5+QvnGR4b/7XpELrjIrD03xtQmYMY9rc0rfHCnDyVfWHxJYbzv 78FUOAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_102324_858079_D64F26EE 
X-CRM114-Status: GOOD (  20.32  )
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
