Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE1C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5892qKSkw38IkFCHjVdwXsVkT9Kr/wxGOUXuiHfAUlo=; b=rgES0LY7I7PGe+
	SBD8QDbyLDd3hn3zySiu6SS80sK/s5dgkB/5s3VlakbxOvloexeaxBtT2FL1HWt9O5CrG68LvF8e8
	oC3MtrSkUsvRvhZkKfiHjq4ha/bRYhR5gmQgzTQqimEDeXzqQ529teB+/+klxa3rNC1jjD4Qidocb
	v2TPL5ey2/c7X82sjXlu5fMxrONrHUdqGCJXddX3ZEuL9VVqqxN61R7kWWI5tXkkddCl1+6pkSAME
	KKbIUplYdvl0n+PtTUavLRcRyOnRgeboDr2+pLZSmR/TbJrPJauXXv+3U0sR4hFHPseHJxFc4lQzz
	wkCjYw9Aw0Y1QWWcv/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeF5b-0098o4-Vl; Fri, 30 Sep 2022 12:25:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeF5X-0098jP-JR
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 12:25:58 +0000
X-QQ-mid: bizesmtp71t1664540601timrcnbn
Received: from ubuntu.localdomain ( [113.72.146.201])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Sep 2022 20:23:20 +0800 (CST)
X-QQ-SSF: 01000000000000305000000A0000000
X-QQ-FEAT: dS+JUNSIibdYmLj5t1I9ugN+S0ksnIEycmIIAPYyEFfZJVg9V/kdWfTdMQPEk
	fjiuX7Oae/U06nm1p3ELka+dZsKdTvpPxceFNxZs2W5d9q7tN+Mlh/tTsnCLp+g6MD8EPCS
	/Omd+8wurSlmyVZfI2W/RsS4n2SttiwKTr4ZAKOIT9PVufqV9TzIFqghUyiauNZC9Ivg2gS
	eYUqfNTfp36XhmArpqvagc+H+BPz+pO2/qJ/vSyY+mlbNx2FTcSMVqpeA7+yi8QJ5ISZxqT
	wVnKrNoH4hnS19Rz8hErC91RmQbG1g+8wjDRa2yNP2JEJ6cXnZdrQjOle67cSq7QT7C55Mw
	60KgXmT3qTPNobR9taWYEIhn5WBP7AMaxciOBVayF+QGM0k/4WYweBP1+XhVPm20wpK3aHZ
	eXD32uXPZCs=
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
Subject: [PATCH v1 30/30] RISC-V: Add StarFive JH7100 and JH7110 SoC Kconfig options
Date: Fri, 30 Sep 2022 20:23:18 +0800
Message-Id: <20220930122318.9244-1-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_052555_984556_D37EF611 
X-CRM114-Status: GOOD (  13.80  )
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

Add Kconfig options to select the specified StarFive SoC. Select
necessary Kconfig options required by the specified SoC for booting.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 arch/riscv/Kconfig.socs               | 27 ++++++++++++++++++++++++++-
 arch/riscv/boot/dts/starfive/Makefile |  4 ++--
 drivers/clk/starfive/Kconfig          | 14 ++++++--------
 drivers/pinctrl/starfive/Kconfig      |  6 ++----
 drivers/reset/Kconfig                 |  1 -
 5 files changed, 36 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 10f68a4359f9..321c448e7b6f 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,10 +22,35 @@ config SOC_STARFIVE
 	bool "StarFive SoCs"
 	select PINCTRL
 	select RESET_CONTROLLER
+	select RESET_STARFIVE
+	help
+	  This enables support for StarFive SoC platform hardware.
+
+if SOC_STARFIVE
+
+config SOC_JH7100
+	bool "StarFive JH7100 SoC support"
+	depends on SOC_STARFIVE
 	select SIFIVE_L2
 	select SIFIVE_PLIC
+	select CLK_STARFIVE_JH7100
+	select PINCTRL_STARFIVE_JH7100
+	default SOC_STARFIVE
 	help
-	  This enables support for StarFive SoC platform hardware.
+	  This enables support for StarFive JH7100 SoC.
+
+config SOC_JH7110
+	bool "StarFive JH7110 SoC support"
+	depends on SOC_STARFIVE
+	select SIFIVE_L2
+	select SIFIVE_PLIC
+	select CLK_STARFIVE_JH7110_SYS
+	select PINCTRL_STARFIVE_JH7110
+	default SOC_STARFIVE
+	help
+	  This enables support for StarFive JH7110 SoC.
+
+endif
 
 config SOC_VIRT
 	bool "QEMU Virt Machine"
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index e1237dbc6aac..a6ecd3c2ec7d 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
-dtb-$(CONFIG_SOC_STARFIVE) += jh7110-starfive-visionfive-v2.dtb
+dtb-$(CONFIG_SOC_JH7100) += jh7100-beaglev-starlight.dtb
+dtb-$(CONFIG_SOC_JH7110) += jh7110-starfive-visionfive-v2.dtb
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 42aad3b553cb..d0490e9f42db 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -5,36 +5,34 @@ config CLK_STARFIVE
 
 config CLK_STARFIVE_JH7100
 	bool "StarFive JH7100 clock support"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7100 || COMPILE_TEST
 	select CLK_STARFIVE
-	default SOC_STARFIVE
 	help
 	  Say yes here to support the clock controller on the StarFive JH7100
 	  SoC.
 
 config CLK_STARFIVE_JH7100_AUDIO
 	tristate "StarFive JH7100 audio clock support"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7100 || COMPILE_TEST
 	select CLK_STARFIVE
-	default m if SOC_STARFIVE
+	default m if SOC_JH7100
 	help
 	  Say Y or M here to support the audio clocks on the StarFive JH7100
 	  SoC.
 
 config CLK_STARFIVE_JH7110_SYS
 	bool "StarFive JH7110 system clock support"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7110 || COMPILE_TEST
 	select CLK_STARFIVE
-	default SOC_STARFIVE
 	help
 	  Say yes here to support the system clock controller on the
 	  StarFive JH7110 SoC.
 
 config CLK_STARFIVE_JH7110_AON
 	tristate "StarFive JH7110 always-on clock support"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7110 || COMPILE_TEST
 	select CLK_STARFIVE
-	default m if SOC_STARFIVE
+	default m if SOC_JH7110
 	help
 	  Say yes here to support the always-on clock controller on the
 	  StarFive JH7110 SoC.
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index fde39f4a7922..d09bdf6d3029 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -2,7 +2,7 @@
 
 config PINCTRL_STARFIVE_JH7100
 	tristate "Pinctrl and GPIO driver for the StarFive JH7100 SoC"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7100 || COMPILE_TEST
 	depends on OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
@@ -10,7 +10,6 @@ config PINCTRL_STARFIVE_JH7100
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
-	default SOC_STARFIVE
 	help
 	  Say yes here to support pin control on the StarFive JH7100 SoC.
 	  This also provides an interface to the GPIO pins not used by other
@@ -28,10 +27,9 @@ config PINCTRL_STARFIVE
 
 config PINCTRL_STARFIVE_JH7110
 	bool "Pinctrl and GPIO driver for the StarFive JH7110 SoC"
-	depends on SOC_STARFIVE || COMPILE_TEST
+	depends on SOC_JH7110 || COMPILE_TEST
 	depends on OF
 	select PINCTRL_STARFIVE
-	default SOC_STARFIVE
 	help
 	  Say yes here to support pin control on the StarFive JH7110 SoC.
 	  This also provides an interface to the GPIO pins not used by other
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 8121de5ecc3c..c001879bd890 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -228,7 +228,6 @@ config RESET_SOCFPGA
 config RESET_STARFIVE
 	bool "StarFive SoC Reset Driver"
 	depends on SOC_STARFIVE || COMPILE_TEST
-	default SOC_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive SoCs.
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
