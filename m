Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55082CCFA00
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Nov 2025 23:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5r7t1J6HhVJXM/rF4uXgokYA9zCHGOwwRtSMXFcnlE=; b=u5MblhZ4lrKBa7
	MypSIrhE9aihgyg7PaOGmRXF4oRrIVCdanWzZtpK1IBwLBLh918+v346SD3An/aijthqaIxs0F30/
	DcSCV0TwDaOImBnG5A58rsV0yajXP87lEl1bnURn1qvnJ+P0v+2toieLcRU7W4VOGbOOHcq2dGk7Y
	AhVXQgrHTddzgz3ZSHW+8WHdqze7zDvkbNbCXCCs46ux8rQk0YPPSIsJYhEv07PJKVgrooO1G+zNY
	/K1diPF0iRatcJAzhFECtq2ddYmZe/aWWXFLpn37mfAveIcaN5gFWuAJFcyrL83ym6g/EBbBn+IbG
	tezzDzf0tgt1OTRt6wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7S-00000008ulg-0jm5;
	Sun, 02 Nov 2025 23:04:18 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFh7O-00000008ukK-0Tx0
	for linux-riscv@lists.infradead.org;
	Sun, 02 Nov 2025 23:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=aWdd3sD4ESHWezzbYg8K/JEm+yaSiqHzT7xdMAjAhkk=; b=mghBgXfrqnLnlmDJdNI3EHVSYH
	CryqKGEVcPOEirDSzBQ50uwuSUu7oQvI6bfb/uiKJQLaKXy3XvG4pPQL+i6lErqFTA/J/hhibZpEp
	TmyqgH1se42inL+kmVK8dSVZGLnofsYH/Bpb3d7w3HspIWgOwFoetGpcBQIxkIgJJhLn9NjM9/Mtu
	UPNVvpCNsTTL9se2bJyom4TZ4CNPKkCFbj/+ZXY+MzaWcuvZrHMkejx9G/FtgBUNeHWg18wXp/aDm
	omuvAsYjknrlKw7NMAsz+QTiVnIUGlDGtw7uzp96RhkpP6rOIKywxaOMCEH59hkh17fFH4r+zKMup
	nrk/DeWg==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vFh7A-00000006eMH-0EqI;
	Mon, 03 Nov 2025 00:04:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS)
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH v5 1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
Date: Mon,  3 Nov 2025 00:01:59 +0100
Message-ID: <20251102230352.914421-2-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251102230352.914421-1-aurelien@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_150414_566647_59E6614A 
X-CRM114-Status: GOOD (  21.33  )
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

This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
chip, which is commonly paired with the SpacemiT K1 SoC.

The SpacemiT P1 support is implemented as a MFD driver, so the access is
done directly through the regmap interface. Reboot or poweroff is
triggered by setting a specific bit in a control register, which is
automatically cleared by the hardware afterwards.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
v5:
 - Change default to "MFD_SPACEMIT_P1"

 drivers/power/reset/Kconfig              |  9 +++
 drivers/power/reset/Makefile             |  1 +
 drivers/power/reset/spacemit-p1-reboot.c | 88 ++++++++++++++++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 drivers/power/reset/spacemit-p1-reboot.c

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 8248895ca9038..f6c1bcbb57def 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -283,6 +283,15 @@ config POWER_RESET_KEYSTONE
 	help
 	  Reboot support for the KEYSTONE SoCs.
 
+config POWER_RESET_SPACEMIT_P1
+	tristate "SpacemiT P1 poweroff and reset driver"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on MFD_SPACEMIT_P1
+	default MFD_SPACEMIT_P1
+	help
+	  This driver supports power-off and reset operations for the SpacemiT
+	  P1 PMIC.
+
 config POWER_RESET_SYSCON
 	bool "Generic SYSCON regmap reset driver"
 	depends on OF
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 51da87e05ce76..0e4ae6f6b5c55 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
 obj-$(CONFIG_POWER_RESET_REGULATOR) += regulator-poweroff.o
 obj-$(CONFIG_POWER_RESET_RESTART) += restart-poweroff.o
+obj-$(CONFIG_POWER_RESET_SPACEMIT_P1) += spacemit-p1-reboot.o
 obj-$(CONFIG_POWER_RESET_ST) += st-poweroff.o
 obj-$(CONFIG_POWER_RESET_TH1520_AON) += th1520-aon-reboot.o
 obj-$(CONFIG_POWER_RESET_TORADEX_EC) += tdx-ec-poweroff.o
diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
new file mode 100644
index 0000000000000..9ec3d1fff8f3d
--- /dev/null
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 by Aurelien Jarno
+ */
+
+#include <linux/bits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reboot.h>
+
+/* Power Control Register 2 */
+#define PWR_CTRL2		0x7e
+#define PWR_CTRL2_SHUTDOWN	BIT(2)	/* Shutdown request */
+#define PWR_CTRL2_RST		BIT(1)	/* Reset request */
+
+static int spacemit_p1_pwroff_handler(struct sys_off_data *data)
+{
+	struct regmap *regmap = data->cb_data;
+	int ret;
+
+	/* Put the PMIC into shutdown state */
+	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_SHUTDOWN);
+	if (ret) {
+		dev_err(data->dev, "shutdown failed: %d\n", ret);
+		return notifier_from_errno(ret);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int spacemit_p1_restart_handler(struct sys_off_data *data)
+{
+	struct regmap *regmap = data->cb_data;
+	int ret;
+
+	/* Put the PMIC into reset state */
+	ret = regmap_set_bits(regmap, PWR_CTRL2, PWR_CTRL2_RST);
+	if (ret) {
+		dev_err(data->dev, "restart failed: %d\n", ret);
+		return notifier_from_errno(ret);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int spacemit_p1_reboot_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	int ret;
+
+	regmap = dev_get_regmap(dev->parent, NULL);
+	if (!regmap)
+		return -ENODEV;
+
+	ret = devm_register_power_off_handler(dev, &spacemit_p1_pwroff_handler,
+					      regmap);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register power off handler\n");
+
+	ret = devm_register_restart_handler(dev, spacemit_p1_restart_handler,
+					    regmap);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register restart handler\n");
+
+	return 0;
+}
+
+static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
+	{ "spacemit-p1-reboot", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
+
+static struct platform_driver spacemit_p1_reboot_driver = {
+	.driver = {
+		.name = "spacemit-p1-reboot",
+	},
+	.probe = spacemit_p1_reboot_probe,
+	.id_table = spacemit_p1_reboot_id_table,
+};
+module_platform_driver(spacemit_p1_reboot_driver);
+
+MODULE_DESCRIPTION("SpacemiT P1 reboot/poweroff driver");
+MODULE_LICENSE("GPL");
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
