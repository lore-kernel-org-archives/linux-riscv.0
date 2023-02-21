Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CD5C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 02:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVthyxljcGcOnEdILXVuRXrusAQyZEPlJdVR6R4qfJQ=; b=2ohdrL5jeS9D9r
	jZEiTGldpjz/MAmCMT+UOfzBLffSRKXH9NgUE2bmG2AxiDmCifw7mj2TrvzvEze1pyRhdQ7y1Uawx
	J923b5gyWx7glgutmrvwjnHZ/nnDIXa982u6Zfh1sN7UzVHg1VJ2ou8qSG/JTf9Kc3N9uiSZqjq1Q
	PpKLhD56I9aANCOmbMOhYZ/b0bMKC2T5RBtQ3S7j4K7zJ4N78CRzDWNcoDRWZoQY7sT1T7jIp2HQZ
	LzrM2zLWfD2ET8i+d1ypH6w/JkaCwSmjMqBNiSvjrjHPXbxXGS/NfXjBudaqoYdoaO82txhO9SCKk
	zLXj7ElWwyalC+oSbM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIgW-006L6B-Tk; Tue, 21 Feb 2023 02:47:16 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIgU-006L0Z-4q
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 02:47:15 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 6E27B24E31C;
	Tue, 21 Feb 2023 10:46:55 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 10:46:55 +0800
Received: from localhost.localdomain (183.27.98.67) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Feb
 2023 10:46:54 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v4 04/19] reset: Create subdirectory for StarFive drivers
Date: Tue, 21 Feb 2023 10:46:30 +0800
Message-ID: <20230221024645.127922-5-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221024645.127922-1-hal.feng@starfivetech.com>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_184714_477581_833F9402 
X-CRM114-Status: GOOD (  16.57  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

This moves the StarFive JH7100 reset driver to a new subdirectory in
preparation for adding more StarFive reset drivers.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                                          | 2 +-
 drivers/reset/Kconfig                                | 8 +-------
 drivers/reset/Makefile                               | 2 +-
 drivers/reset/starfive/Kconfig                       | 8 ++++++++
 drivers/reset/starfive/Makefile                      | 2 ++
 drivers/reset/{ => starfive}/reset-starfive-jh7100.c | 0
 6 files changed, 13 insertions(+), 9 deletions(-)
 create mode 100644 drivers/reset/starfive/Kconfig
 create mode 100644 drivers/reset/starfive/Makefile
 rename drivers/reset/{ => starfive}/reset-starfive-jh7100.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b3246ca0f48..7026d96b7802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19930,7 +19930,7 @@ STARFIVE JH7100 RESET CONTROLLER DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
-F:	drivers/reset/reset-starfive-jh7100.c
+F:	drivers/reset/starfive/reset-starfive-jh7100.c
 F:	include/dt-bindings/reset/starfive-jh7100.h
 
 STATIC BRANCH/CALL
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 2a52c990d4fe..6aa8f243b30c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -232,13 +232,6 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_STARFIVE_JH7100
-	bool "StarFive JH7100 Reset Driver"
-	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
-	help
-	  This enables the reset controller driver for the StarFive JH7100 SoC.
-
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
 	default ARCH_SUNPLUS
@@ -320,6 +313,7 @@ config RESET_ZYNQ
 	help
 	  This enables the reset controller driver for Xilinx Zynq SoCs.
 
+source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/tegra/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e7e5fd633a8..fee17a0e3a16 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
 obj-y += hisilicon/
+obj-$(CONFIG_SOC_STARFIVE) += starfive/
 obj-$(CONFIG_ARCH_STI) += sti/
 obj-$(CONFIG_ARCH_TEGRA) += tegra/
 obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
@@ -30,7 +31,6 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
new file mode 100644
index 000000000000..cddebdba7177
--- /dev/null
+++ b/drivers/reset/starfive/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config RESET_STARFIVE_JH7100
+	bool "StarFive JH7100 Reset Driver"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	default SOC_STARFIVE
+	help
+	  This enables the reset controller driver for the StarFive JH7100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
new file mode 100644
index 000000000000..670d049423f5
--- /dev/null
+++ b/drivers/reset/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
similarity index 100%
rename from drivers/reset/reset-starfive-jh7100.c
rename to drivers/reset/starfive/reset-starfive-jh7100.c
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
