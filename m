Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7415EC54E41
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a2WXiPfvgFF8b1ovm4AzoXLPeZqX1IL/MA5iltXYsvc=; b=vCxaZoYXWt/Dj5
	8Pj2gAHrV6f5e8BR53gsyOsBZSBL7IRlv1jGH0gt/vUnvKqHriH7xY9RqozWvZWC7MemJ/JIzlOk1
	6arWb2Tw2hf6F4CQVmHuWSzLU+ET2X631KNqM1WyAkvntY1SJ0joHtpbe4BXToSKIQNKSXgH4Xezq
	qx3pPs/u7NBPb865BgY5/3OqjoUFPzAXaF4jJXVxx+WGZp27PJ03M8tt10bNkZg7474QVisGEfzOO
	4kLT7XHP1uV2Yy6xUXJaJtHJKmMoWV6wecnbo4jGywPixBBKTvQ7szh/Zv3XZMYp2nSIS/hWRJzPP
	50VEji1P9nM8fS+gymGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFon-00000008aB4-3AO9;
	Wed, 28 Feb 2024 09:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFom-00000008aAs-3RlG
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Feb 2024 09:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Date:Subject:Cc:To:From:Message-ID:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OJERieRX8TNnv9pPvsXYVZQyy3A2qdrTGojUlwVAUuY=; b=h41kuLngiWceKzaNzm24RtHtOB
	mGtDPiR469y0LKvpDUQAhwYUUYpt4NZciU/bCcdxWeeTgEnaIaOr18NM6TdDIYirLI8n0qDicqXoy
	fEbFyvWTKxTugPNWxUFFRVJS0XnRTGi/Z5EwE0Tasfsz+gh9A7K5uQfDnMt0d7FHGy/YXMUw2POSC
	6koX7MhbYMqJaiXJhegEwzYPVu18jJMSmpYNPMIdvBow09+dLAfbyfzJteZnbpsaTZfP8+Xmj7JQI
	aYdIHVpE0oe522tqcG9bFzaTX3eUpz9mC8B1b0dXH4Vuk8SIjPjAf+Tx5IsFRJB9YvfFcDLsSuCiE
	k246Tesw==;
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfFoe-00000002EQV-22N7
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 09:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709110874; bh=OJERieRX8TNnv9pPvsXYVZQyy3A2qdrTGojUlwVAUuY=;
	h=From:To:Cc:Subject:Date;
	b=F34rfpxM5rpFIg8T7kuqpN5WinucmKLAJshXqFvOunH3qU+ty1f2sXcM7LrE+o28a
	 vOg/CoQralxDSyGw9ilO/kNYOu9ChL/UPwLk2qVckZEnaf2eJ3Kbje7tJWC1HKA2jR
	 QzLrk0e/fdVBlLnfmIHJez/mMxkhxQOd7La9Thu0=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id D8722820; Wed, 28 Feb 2024 16:54:07 +0800
X-QQ-mid: xmsmtpt1709110447t2alhx9za
Message-ID: <tencent_88FEE0A2C5E0852436A2F1A1087E6803380A@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5+DdQxOt7EblMGQYPjfWa7qBxdA9axrezMMfQnz09MBeCkgeptN
	 juxzBBrmwXkR+fTdxjyixdPFQ7e2+HvZENJn2O5o48CSwHT9PpAJMgzJLa2XcJFQWrSXvgMBrDLr
	 qPkyzwbGhowYlM5MYTw0V0wIYBgvL/KtFlIrdJ2UNfoKEujhrv37N8TXxvRgPfF8UUqz69WAsnjR
	 ykQY9yAQ02kbyPDeYfYNupxd1G4X0U2Ov3ZTovTaGqDzhJuUsjyt+wWLTfA+P0e37PZc4Xl4hK7m
	 z2YtSpJ/YJHyArBYr2/25l5o9dfZW6TS3L7SrrlOCY75R/8PkkiVy25JYUqw7Hk18zzqGPYlcQDk
	 ARf5mjWKer5ALTTQbQWYALlHMLEji6psiVYzDY72Ra/dX4RHq3ZAyfuOmPoqeWumW3mWGmDIamsf
	 +lsltrC5vw/5kqgFCtvtfBfnbd0YWxLkqf0ppnEDx60TZ0igo9qpKatwv0UB+npfOnAO0tHXVZOx
	 N+6E7OwGimKXM/mjPjqUsg3bp+Kjkr7ppqoMWPWOvHtnpl8i8C5S7Ckp+BIfmCDNIvvi4p2Fgutd
	 hGql7p0D4BQXU13YsHCZa3fu2sl/dAJ6WIgK+dfYuYKRijIOC5Yba+UNpsx/kbFR0nLbAC08g+Ps
	 6b2DjOYuZboFLBlhh4FXGOfqgYZIr2/vKUgo/M8SSlgISLa6kW7sxgK7naMUTrhVTdcEEd0Dg5Be
	 NrgAQZdCDvf2bdufRB3e0c41nLKTdZbZCzbbkBK8OuwC0fqbCbOxdHtRqyX7DGRz8uu9wMdackNp
	 QjeGVcFLF8TWP5zT6ZCknr15oSNJPzEPUKvP0VgZHHq4KI6nXXrVCQJgjC3ebx85Vhc41uvwnGYe
	 nvlu0FOB2y39G1f/PREijNSVlLD7eV9h56JoG0+J6Q8k6IaawX/5vcVd4+38+GTcRnXjmTPQ/sYk
	 1hzed3cA3DcRPZAv8C3E8jD6MLJ9xF9CbwBHCsEupVice/uOadSay41srGnvETYnUaq6M6QF//U4
	 9hXQ0C6Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] riscv: dts: Move BUILTIN_DTB_SOURCE to common Kconfig
Date: Wed, 28 Feb 2024 16:52:54 +0800
X-OQ-MSGID: <20240228085255.201092-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_090131_142404_359DC592 
X-CRM114-Status: GOOD (  20.46  )
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

The BUILTIN_DTB_SOURCE was only configured for K210 before. Since
SOC_BUILTIN_DTB_DECLARE was removed at commit d5805af9fe9f ("riscv: Fix
builtin DTB handling") from patch [1], the kernel cannot choose one of the
dtbs from then on and always take the first one dtb to use. Then, another
commit 0ddd7eaffa64 ("riscv: Fix BUILTIN_DTB for sifive and microchip soc")
from patch [2] supports BUILTIN_DTB_SOURCE for other SoCs. However, this
feature will only work if the Kconfig we use links the dtb we expected in
the first place as mentioned in the thread [3]. Thus, a config
BUILTIN_DTB_SOURCE is needed for all SoCs to choose one dtb to use.

For some considerations, this patch also removes default y if XIP_KERNEL
for BUILTIN_DTB, as this requires setting a proper dtb to use on the
BUILTIN_DTB_SOURCE, else the kernel with XIP but does not set
BUILTIN_DTB_SOURCE or unselect BUILTIN_DTB will not boot.

Also, this patch removes the default dtb string for k210 from Kconfig to
nommu_k210_defconfig and nommu_k210_sdcard_defconfig to avoid complex
Kconfig settings for other SoCs in the future.

[1] https://lore.kernel.org/linux-riscv/20201208073355.40828-5-damien.lemoal@wdc.com/
[2] https://lore.kernel.org/linux-riscv/20210604120639.1447869-1-alex@ghiti.fr/
[3] https://lore.kernel.org/linux-riscv/CAK7LNATt_56mO2Le4v4EnPnAfd3gC8S_Sm5-GCsfa=qXy=8Lrg@mail.gmail.com/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- some fixes on format and grammar
- v2: https://lore.kernel.org/linux-riscv/tencent_61DFA8E0B13696A3256E538C4BC856633406@qq.com/

Changes since v1:
- remove default y for BULTIN_DTB in any cases
- remove default DTB_SOURCE for k210 and moved to its defconfig file
- remove building dtb object file for other SoCs
- reword help message to say N if unsure for BUILTIN_DTB_SOURCE
- reword commit message
- v1: https://lore.kernel.org/linux-riscv/tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com/

---
 arch/riscv/Kconfig                            | 14 +++++++-
 arch/riscv/Kconfig.socs                       | 32 -------------------
 arch/riscv/boot/dts/Makefile                  |  2 +-
 arch/riscv/boot/dts/canaan/Makefile           |  2 --
 arch/riscv/boot/dts/microchip/Makefile        |  1 -
 arch/riscv/boot/dts/sifive/Makefile           |  1 -
 arch/riscv/configs/nommu_k210_defconfig       |  2 ++
 .../riscv/configs/nommu_k210_sdcard_defconfig |  2 ++
 8 files changed, 18 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 85c899d0133a..3d6d93d71257 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1000,7 +1000,19 @@ config RISCV_ISA_FALLBACK
 config BUILTIN_DTB
 	bool "Built-in device tree"
 	depends on OF && NONPORTABLE
-	default y if XIP_KERNEL
+	help
+	  Build a device tree into the Linux image.
+	  This option should be selected if no bootloader is being used.
+	  If unsure, say N.
+
+
+config BUILTIN_DTB_SOURCE
+	string "Built-in device tree source"
+	depends on BUILTIN_DTB
+	help
+	  DTS file path (without suffix, relative to arch/riscv/boot/dts)
+	  for the DTS file that will be used to produce the DTB linked into the
+	  kernel.
 
 endmenu # "Boot options"
 
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index e08e91c49abe..623de5f8a208 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -84,36 +84,4 @@ config SOC_CANAAN
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-if ARCH_CANAAN
-
-config ARCH_CANAAN_K210_DTB_BUILTIN
-	def_bool SOC_CANAAN_K210_DTB_BUILTIN
-
-config SOC_CANAAN_K210_DTB_BUILTIN
-	bool "Builtin device tree for the Canaan Kendryte K210"
-	depends on ARCH_CANAAN
-	default y
-	select OF
-	select BUILTIN_DTB
-	help
-	  Build a device tree for the Kendryte K210 into the Linux image.
-	  This option should be selected if no bootloader is being used.
-	  If unsure, say Y.
-
-config ARCH_CANAAN_K210_DTB_SOURCE
-	string
-	default SOC_CANAAN_K210_DTB_SOURCE
-
-config SOC_CANAAN_K210_DTB_SOURCE
-	string "Source file for the Canaan Kendryte K210 builtin DTB"
-	depends on ARCH_CANAAN
-	depends on ARCH_CANAAN_K210_DTB_BUILTIN
-	default "k210_generic"
-	help
-	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
-	  for the DTS file that will be used to produce the DTB linked into the
-	  kernel.
-
-endif # ARCH_CANAAN
-
 endmenu # "SoC selection"
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 72030fd727af..fdae05bbf556 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -8,4 +8,4 @@ subdir-y += sophgo
 subdir-y += starfive
 subdir-y += thead
 
-obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
+obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index 520623264c87..987d1f0c41f0 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -5,5 +5,3 @@ dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_bit.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_dock.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_go.dtb
 dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maixduino.dtb
-
-obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 45adc4926e79..e177815bf1a2 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -4,4 +4,3 @@ dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
-obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
index 6a5fbd4ed96a..495bf760a909 100644
--- a/arch/riscv/boot/dts/sifive/Makefile
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00.dtb \
 			     hifive-unmatched-a00.dtb
-obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 146c46d0525b..7e75200543f4 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -33,6 +33,8 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
 CONFIG_CMDLINE_FORCE=y
+CONFIG_BUILTIN_DTB=y
+CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 95d8d1808f19..0ba353e9ca71 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -25,6 +25,8 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
 CONFIG_CMDLINE_FORCE=y
+CONFIG_BUILTIN_DTB=y
+CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
