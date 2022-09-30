Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B008FC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 06:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kaoeIEp4XlkPxwflIBIeTLumLJIPOmhJ8Gk/AxptSA0=; b=F/Fft+UdY3Muma
	5/378Smq2CW6pqXli7Ldn8ZJj1pgF37LmCMTbcJErD2Ht43EY+EyzCQvfOaqY34kfx+dPhs8j3i1b
	5Qm1FVNdc92vroADzOmlU6ZwcDD9T/bNglBZ00qWLt6Y+SPpcXid70REORpxSEN9xxT3g2W6gRv4S
	/aKDMs4YMt7ULFGyKO/pK8SUDQHTHx1EIXvxTaaEONObm4SdjZBcJf9Tx44U1GP03TUuffBPaT6Mi
	EhmZuC5Ufy8Q2u78TsUF4B4jBDI/q3fDCfXjW5QSYN6r6q9tswtfGG5EmQorLjIpsrJyP1b3mogTK
	LNkCMGPpRszCQuIDnv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9Cb-007RkK-Ae; Fri, 30 Sep 2022 06:08:49 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9CX-007Ris-M1
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 06:08:47 +0000
X-QQ-mid: bizesmtp63t1664518102tmr9cr2u
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 14:08:20 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: xqT8U4SkSpisYxfmvPHFQNlo5ZeKC1Tln2HnuerfKKt3Hn/Q3fL++1d34I5yT
	2neYj/UYkDe3+jsl1CFbrcbsJSfd6U7l5Zu3XpAoH3aWgUzNpVjR+LV4YoZepA7C7xSTepV
	7fnAAjcNG3OIFxiTM2jzkARckSVHGJ2b2ABGx3W8uYpV3/0HVthsBtly84zIKe1C9b5VxNz
	bVBWGqV+2XqvB6lAQJ0MmKd2+PMH+LpHYfH2KWZko9rRuDtheH3mPH78gOY9TC50Pcgk1x5
	cJ714fr7u1JRHet1EFwkE2YWftbTeb/7nSfjlWAWwgDWOylwfzgELV6vtrxdPWqpTFVF3A2
	47lKLi37FmJ0A++PmW9lp7MI02z6NhV5Y5NBxEpSoacG61etnF8K6skpgsYBUFGYPzaanQj
	dq5QnplZQRc=
X-QQ-GoodBg: 0
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 22/30] pinctrl: Create subdirectory for StarFive drivers
Date: Fri, 30 Sep 2022 14:08:19 +0800
Message-Id: <20220930060819.5320-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_230846_051426_C7A2F07F 
X-CRM114-Status: GOOD (  15.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jianlong Huang <jianlong.huang@starfivetech.com>

Move the StarFive JH7100 pinctrl driver to a new subdirectory
in preparation for adding more StarFive pinctrl drivers. No
functional change.

Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 drivers/pinctrl/Kconfig                       | 18 +-----------------
 drivers/pinctrl/Makefile                      |  2 +-
 drivers/pinctrl/starfive/Kconfig              | 19 +++++++++++++++++++
 drivers/pinctrl/starfive/Makefile             |  3 +++
 .../pinctrl/{ => starfive}/pinctrl-starfive.c |  8 ++++----
 5 files changed, 28 insertions(+), 22 deletions(-)
 create mode 100644 drivers/pinctrl/starfive/Kconfig
 create mode 100644 drivers/pinctrl/starfive/Makefile
 rename drivers/pinctrl/{ => starfive}/pinctrl-starfive.c (99%)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1cf74b0c42e5..5abf1961f4d4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -412,23 +412,6 @@ config PINCTRL_ST
 	select PINCONF
 	select GPIOLIB_IRQCHIP
 
-config PINCTRL_STARFIVE
-	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
-	depends on SOC_STARFIVE || COMPILE_TEST
-	depends on OF
-	default SOC_STARFIVE
-	select GENERIC_PINCTRL_GROUPS
-	select GENERIC_PINMUX_FUNCTIONS
-	select GENERIC_PINCONF
-	select GPIOLIB
-	select GPIOLIB_IRQCHIP
-	select OF_GPIO
-	help
-	  Say yes here to support pin control on the StarFive JH7100 SoC.
-	  This also provides an interface to the GPIO pins not used by other
-	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
-	  and interrupts on input changes.
-
 config PINCTRL_STMFX
 	tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
 	depends on I2C
@@ -526,6 +509,7 @@ source "drivers/pinctrl/renesas/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
 source "drivers/pinctrl/sprd/Kconfig"
+source "drivers/pinctrl/starfive/Kconfig"
 source "drivers/pinctrl/stm32/Kconfig"
 source "drivers/pinctrl/sunplus/Kconfig"
 source "drivers/pinctrl/sunxi/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e76f5cdc64b0..eccd4d568a3d 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -43,7 +43,6 @@ obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
 obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
 obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
-obj-$(CONFIG_PINCTRL_STARFIVE)	+= pinctrl-starfive.o
 obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
 obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
@@ -70,6 +69,7 @@ obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
+obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
new file mode 100644
index 000000000000..ed8c6a920886
--- /dev/null
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config PINCTRL_STARFIVE
+	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
+	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on OF
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select OF_GPIO
+	default SOC_STARFIVE
+	help
+	  Say yes here to support pin control on the StarFive JH7100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
new file mode 100644
index 000000000000..4c96e2f86292
--- /dev/null
+++ b/drivers/pinctrl/starfive/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PINCTRL_STARFIVE)	+= pinctrl-starfive.o
diff --git a/drivers/pinctrl/pinctrl-starfive.c b/drivers/pinctrl/starfive/pinctrl-starfive.c
similarity index 99%
rename from drivers/pinctrl/pinctrl-starfive.c
rename to drivers/pinctrl/starfive/pinctrl-starfive.c
index 3eb40e230d98..74a084740e8c 100644
--- a/drivers/pinctrl/pinctrl-starfive.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive.c
@@ -22,10 +22,10 @@
 
 #include <dt-bindings/pinctrl/pinctrl-starfive.h>
 
-#include "core.h"
-#include "pinctrl-utils.h"
-#include "pinmux.h"
-#include "pinconf.h"
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+#include "../pinconf.h"
 
 #define DRIVER_NAME "pinctrl-starfive"
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
