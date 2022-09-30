Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C648C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 06:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CATEX+PktvFJhhBLY0csI/YmrZs93DS8FSHmDsENBHI=; b=5AKq1d1gLkAp8/
	a+3w8ddm2DsHrCku0XAzLRfW2i0w0o0crdF1p/yXGk0RHQcQhbnOV9Y7i+mytxfC4+eCnDL+bovZc
	RRf6hVIT4DrGAM108qFRX+lG4Pf/M4Ebzx0pX0+AkZYkzf97I/sdhbR9gUxqn0t61lgAWOzocr8Oh
	uy3lGJ5JSD73EWetgUlZrMXBEinBZ8Id1gH1ER1Kdpn+M3Y3MGZ2euWa4TxLFioqC3vCKSHBL3Dkg
	ITCO/AiZY9jbItl5aSHAgWH5EVn1xhdbzibg8LdZ+VZ7VQ0YKan54S4fYiO5suzDaBvI+7PwMDpOH
	gXH2/4bdPrqBd4kj+ivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9IC-007Sqy-R3; Fri, 30 Sep 2022 06:14:36 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9I8-007SnV-2J
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 06:14:35 +0000
X-QQ-mid: bizesmtp84t1664518447t5nbwklp
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 14:14:05 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: /6HprbRdZNmmKnhc/OIjuYalvxt80YyvkW0RSScpmHj1x5NDZp5mG4ufRVjgT
	CKfOfzBYh1Sqhw2AKMFwo3AMv5GTNHjJigy3k+T0i9oiEMxCHv0ZQtMRONsYfG/5G9BHPb3
	LBIAVIjpLZmdlHKQ+gtZIBi7igNP3IniMCCtDgWd48Nd9cIvMzUicmUxP2fbEI+QGluQwMQ
	98yRPgv1VyAcU/LEjXPwJFupP11fCHy7qE0vqnCKxC+ekwiLGiVEqoIXTPj32EiePYUo676
	OsG1Sz4FU/OHnUuQxARyjadHZiaD7XaY/qam8SafNQuyA3mtId5hF3/Vg3NiO0WiJmq8v8u
	c/Pot5NamA5fW2+HdE3zhFE0xAg+xqS8ri4P3FaQA0H5Lmi3shprZeQ7nJi03oRHbFlPbZv
	iISNL3Oy7pg=
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
Subject: [PATCH v1 23/30] pinctrl: starfive: Rename "pinctrl-starfive" to "pinctrl-starfive-jh7100"
Date: Fri, 30 Sep 2022 14:14:04 +0800
Message-Id: <20220930061404.5418-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_231432_454455_EEBD49EA 
X-CRM114-Status: GOOD (  11.51  )
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

Add the SoC name to make it more clear. Also the next generation StarFive
SoCs will use "pinctrl-starfive" as the core of StarFive pinctrl driver.
No functional change.

Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml           | 2 +-
 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts   | 2 +-
 drivers/pinctrl/starfive/Kconfig                            | 2 +-
 drivers/pinctrl/starfive/Makefile                           | 2 +-
 .../{pinctrl-starfive.c => pinctrl-starfive-jh7100.c}       | 2 +-
 .../{pinctrl-starfive.h => pinctrl-starfive-jh7100.h}       | 6 +++---
 6 files changed, 8 insertions(+), 8 deletions(-)
 rename drivers/pinctrl/starfive/{pinctrl-starfive.c => pinctrl-starfive-jh7100.c} (99%)
 rename include/dt-bindings/pinctrl/{pinctrl-starfive.h => pinctrl-starfive-jh7100.h} (98%)

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
index 92963604422f..a6140dddd39a 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
@@ -165,7 +165,7 @@ examples:
   - |
     #include <dt-bindings/clock/starfive-jh7100.h>
     #include <dt-bindings/reset/starfive-jh7100.h>
-    #include <dt-bindings/pinctrl/pinctrl-starfive.h>
+    #include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
 
     soc {
         #address-cells = <2>;
diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
index c9af67f7a0d2..f7a230110512 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -8,7 +8,7 @@
 #include "jh7100.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
-#include <dt-bindings/pinctrl/pinctrl-starfive.h>
+#include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
 
 / {
 	model = "BeagleV Starlight Beta";
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ed8c6a920886..5cedb546f93d 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config PINCTRL_STARFIVE
+config PINCTRL_STARFIVE_JH7100
 	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
 	depends on SOC_STARFIVE || COMPILE_TEST
 	depends on OF
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 4c96e2f86292..0293f26a0a99 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_PINCTRL_STARFIVE)	+= pinctrl-starfive.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
similarity index 99%
rename from drivers/pinctrl/starfive/pinctrl-starfive.c
rename to drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 74a084740e8c..5b544fb7f3d8 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -20,7 +20,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
-#include <dt-bindings/pinctrl/pinctrl-starfive.h>
+#include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
 
 #include "../core.h"
 #include "../pinctrl-utils.h"
diff --git a/include/dt-bindings/pinctrl/pinctrl-starfive.h b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
similarity index 98%
rename from include/dt-bindings/pinctrl/pinctrl-starfive.h
rename to include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
index de4f75c2c9e8..a200f546d078 100644
--- a/include/dt-bindings/pinctrl/pinctrl-starfive.h
+++ b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7100.h
@@ -3,8 +3,8 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
-#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_H__
-#define __DT_BINDINGS_PINCTRL_STARFIVE_H__
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH7100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JH7100_H__
 
 #define PAD_GPIO_OFFSET		0
 #define PAD_FUNC_SHARE_OFFSET	64
@@ -272,4 +272,4 @@
 
 #define GPI_NONE				0xff
 
-#endif /* __DT_BINDINGS_PINCTRL_STARFIVE_H__ */
+#endif /* __DT_BINDINGS_PINCTRL_STARFIVE_JH7100_H__ */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
