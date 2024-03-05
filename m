Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F1C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 20:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M16v9w1rsgolBZFatr+9PSSyHRvIjrHNwzLr1UJvlqw=; b=MOqQCSmlwBKUIV
	RKr8UZVnRwsdw2kVDs3xTTN1WuU4WIXyZr/X3CXj//Eg6viKAukvA8OwZJ27YHfyF2OcfzuKlQSHe
	xlXnjgMLvdLOZ8MzWwO+Cry6tklKyPymEsMwPrTNIDUUcMCl7UR4wRBwhZDLdDhX09AYS2idmwI3z
	z91sU3fItejwNJl20gEa9PllEzdmLC4ihBD+Fv+7nG3qAoGYEkC0MA9aNMcz5GQLlkQ/motrwR+f5
	1cfAPuKK0Nfk6w0xAAWtAbPV4fcm3qP6r9IhAD7WPfcRPeG2OUOY5M0S4tlO0ySoc8zWMDsw3IS+D
	EYMwK/nQCe1Ljfm04lTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0h-0000000F7eC-2xZF;
	Tue, 05 Mar 2024 20:03:35 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhb0Z-0000000F7Wf-01Nl
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 20:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709668999; bh=AR+FBWrcsSxuq/q16g4TwIGEvVWNZKJ7JXfI2Q9ft4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nu5Hr8VWA0brpWsv9/s8qTo2eQoEeCGiW9hsFIircJqdOnAo/Ekf+9DcvcIH27NFH
	 3A6lpHNEQWC+q0fEm8c/xSuMg2FhpjKa/2fGLVK0tPEMGDCoa/gUD6nP8BcdN+sfdv
	 96p6/1yM1oLQ9OSvcy4InFo1IvfIIhpi+CFVRCuM=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id C898283; Wed, 06 Mar 2024 04:03:08 +0800
X-QQ-mid: xmsmtpt1709668997tl1xc2byb
Message-ID: <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
X-QQ-XMAILINFO: OPD0LeIz4IX26zc/TQ4DiiqLclvJ8BmP5wWWby0cJGzzMTPPXwPvuE34R57O1f
	 c4+rOOF8+VwXm3S5K40wIl/tgkpsBAAxOHgU/tBuAgwzpT66ZFPLXasE0yw4fRefV+uxhsdyg6v5
	 cekZ6BG5PDSrDMfx0E5boHd++PCWmlSvwTiEDiXamyDaO7dZz84WRArvuwgxp15RNrNSfSZL9fPV
	 B/Spo1baoKh60IN8z61+WYYi1hRWWBKDEcw+V1QbESsvb5u/wSaxtjxXLDGOb5EF7zqPphtRjDMs
	 Q2ArdMUE/ualR7oxMoDJnsIFBgjV3VPcWB5ne5CAFaTQ6n6dsJcPKuN3ofmF81jOCPSvyWIV2Dt7
	 waHIVQkg2Cb3RfN3TjqgGbgzD5K+oQB9h4+GwUeINu7YzCEHjmgRQaTQGQTfmWAEY14SYNvKnLQO
	 yNIp3eVua78j6+x0QvfKcPTgKsIOWloqb/R6LW39wi7g22ttMqR6zvp8JySRDQs2/czXyXQG/WT6
	 RDJy7NecakGAVFV/hKO4iX84aBCHFzKmI9MIw+TVDunojJTmEeEfosLhXQ27o5gllXO7clMBr7ui
	 eHvaNJXyxpoNngSD+eSCPJvdqyIiSrHQegS5Q02Nb/7/QT2tWlwgzoE3486FzTBnHkrVW84MWs+n
	 zhOkYbAH2zECYCOH4wcu2nAlfKlIggI4WumyYwZoHhA8u48V2kcDrJzJoKPoYuM4T50fiiOl5xBV
	 nxZUP4fKh0SjVp7zVhDj6x9coch48MzbsxBzQE5N4JpztuZ5Xfx8jnuK4QsNROPe6QCKm1ksL6K8
	 4jCIj3v0pzMG6EwYPx8yBfK2mcjA0gV5mSXrOlq5LI+LppnNn4z7kJlGRr/Fn/+pq2RoJt2btq2D
	 +/Rupv1UlrUaN31G71jiO/v0bWeGGJpNiDz9K/sFStncQJR8f2WP8lMoTv1EyxqcZlabDUpinsii
	 O479JgqyjeH6Q0RsYP7HrHAR8jzEMaqWj32km0nTwJUug/vEuUuSCUtiidhYhkveQjghCL4JWadH
	 2VURYI64aEfzvf8E3CXHc3ecxYYW7LZNQMxYEPoLcGWnXPEorfhUYe/Z146JifYXdAvMV4xrxKcI
	 sgHxznX/s1VZDEcJnCEIp/uNgKKw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
Date: Wed,  6 Mar 2024 04:03:00 +0800
X-OQ-MSGID: <20240305200302.1093082-5-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_120327_586807_F9040A02 
X-CRM114-Status: GOOD (  12.98  )
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

Since we have Canaan Kendryte K230 with MMU now. The use of SOC_CANAAN
is no longer only referred to K210. Split them and add _K210 suffix
to the name for old SOC_CANAAN. And allows ARCH_CANAAN to be selected
for other Canaan SoCs.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/Kconfig.socs                        | 8 +++++---
 arch/riscv/Makefile                            | 2 +-
 arch/riscv/configs/nommu_k210_defconfig        | 3 ++-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 3 ++-
 drivers/clk/Kconfig                            | 4 ++--
 drivers/pinctrl/Kconfig                        | 4 ++--
 drivers/reset/Kconfig                          | 4 ++--
 drivers/soc/Makefile                           | 2 +-
 drivers/soc/canaan/Kconfig                     | 4 ++--
 9 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 623de5f8a208..5710aee456ac 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -72,11 +72,13 @@ config SOC_VIRT
 	  This enables support for QEMU Virt Machine.
 
 config ARCH_CANAAN
-	def_bool SOC_CANAAN
+	bool "Canaan Kendryte SoC"
+	help
+	  This enables support for Canaan Kendryte SoC platform hardware.
 
-config SOC_CANAAN
+config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
-	depends on !MMU
+	depends on !MMU && ARCH_CANAAN
 	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 252d63942f34..fa6c389c3986 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -154,7 +154,7 @@ vdso-install-y			+= arch/riscv/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT)	+= arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg:../compat_vdso/compat_vdso.so
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN_K210),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 ifeq ($(CONFIG_EFI_ZBOOT),)
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 7e75200543f4..2552e78074a3 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -27,7 +27,8 @@ CONFIG_EXPERT=y
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
+CONFIG_SOC_CANAAN_K210=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 0ba353e9ca71..8f67fb830585 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -19,7 +19,8 @@ CONFIG_EXPERT=y
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
+CONFIG_SOC_CANAAN_K210=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 50af5fc7f570..7517a0dfd15c 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -451,8 +451,8 @@ config COMMON_CLK_FIXED_MMIO
 
 config COMMON_CLK_K210
 	bool "Clock driver for the Canaan Kendryte K210 SoC"
-	depends on OF && RISCV && SOC_CANAAN
-	default SOC_CANAAN
+	depends on OF && RISCV && SOC_CANAAN_K210
+	default SOC_CANAAN_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC clocks.
 
diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 8163a5983166..837b3bac8aac 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -217,13 +217,13 @@ config PINCTRL_INGENIC
 
 config PINCTRL_K210
 	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select OF_GPIO
 	select REGMAP_MMIO
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	help
 	  Add support for the Canaan Kendryte K210 RISC-V SOC Field
 	  Programmable IO Array (FPIOA) controller.
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..6499da7ecc3b 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -94,9 +94,9 @@ config RESET_INTEL_GW
 
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
-	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	depends on (SOC_CANAAN_K210 || COMPILE_TEST) && OF
 	select MFD_SYSCON
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
 	  Say Y if you want to control reset signals provided by this
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index ba8f5b5460e1..fb2bd31387d0 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -7,7 +7,7 @@ obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
 obj-y				+= bcm/
-obj-$(CONFIG_SOC_CANAAN)	+= canaan/
+obj-$(CONFIG_ARCH_CANAAN)	+= canaan/
 obj-$(CONFIG_ARCH_DOVE)		+= dove/
 obj-$(CONFIG_MACH_DOVE)		+= dove/
 obj-y				+= fsl/
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 43ced2bf8444..3121d351fea6 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -2,9 +2,9 @@
 
 config SOC_K210_SYSCTL
 	bool "Canaan Kendryte K210 SoC system controller"
-	depends on RISCV && SOC_CANAAN && OF
+	depends on RISCV && SOC_CANAAN_K210 && OF
 	depends on COMMON_CLK_K210
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	select PM
 	select MFD_SYSCON
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
