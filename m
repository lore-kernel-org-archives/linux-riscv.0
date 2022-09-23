Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405D5C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29I8RPjfh9Bvc54XKyJSt9OQILiehe8BTxN40LcGQsw=; b=0ULb3nHKD6mTLI
	3e559iZPu4tTVEw+9IsKS/N0Xlo7OdvDOQ/r7vFzdBx5PQfiLTvZgqYNI2EAoT7/Bh0sJvTrgzeYD
	f1AC6+AUQ9GVVdz5Td44BwuiyYFA41LZCGlARPm3YoanVNKG/JKJJ3RZkW6neiiUIIWbzW4aFcS2r
	iJiYVRDqG3eXAtZLcX2HP5V2NSkCQmqDpJ0pKC5f/TBOwCIovoAOoEsG6LkV5i/gvPfky8hA+Wt8R
	67y7cRd7hIzCll0MICa/y+smvWR6UmY5lZyVffCavXC5P2OfwR2jFp1NrZTtdwghiyL/NSw1Qz7WD
	BsqUUGlS03B5fzS9j2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsp-005Rbt-Gf; Fri, 23 Sep 2022 18:58:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obns6-005Qtk-3x
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:58:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8A3EFB8239A;
	Fri, 23 Sep 2022 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6F6C433C1;
	Fri, 23 Sep 2022 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959475;
	bh=IH7zIfNclx9MgvR1ZtxZDowKrzrI8T8UFwjxeHvSQ4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dhn3yWpjGulwKCXrKg/3LST2Srb5M9UGWa7Yyv4bUk8BgpD12baf70loDsRKoW+lC
	 23D5h0lrfj5RA7vwBtp1eICliwObb8xCUkoyGI3DCf7g0EdRfXlYSeQJ+BTcCBDVUm
	 5mneOZOPpqvIyz14djPq20QxtlcEQI1yn2e3btuLiXpyT8c6VGm4gIWOcLBINZdJlt
	 5BMLkutDLZB/q3YxLKe/4tKI0j6ioxtDndkz4qTQkfHeOfANjDbru4bs8KYMMP1r0z
	 2AcsABRpcQFVTUapgiEwm21BDX52+ExsVHzndj4amj7wRa6fJz+bMcA5m6aBB9nngz
	 vvtoN7cQgOCtQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 21/27] riscv: convert SOC_CANAAN to ARCH_CANAAN
Date: Fri, 23 Sep 2022 19:56:00 +0100
Message-Id: <20220923185605.1900083-22-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115758_515989_FA4B867E 
X-CRM114-Status: GOOD (  12.23  )
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

As per the discussions at LPC, the SOC_ symbols in Kconfig.socs are to
be converted to ARCH_ for consistency between "incumbent" and incoming
vendors who have a legacy in other architectures. SOC_CANAAN therefore
becomes ARCH_CANAAN.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs                        | 16 ++++++++--------
 arch/riscv/Makefile                            |  2 +-
 arch/riscv/boot/dts/Makefile                   |  2 +-
 arch/riscv/boot/dts/canaan/Makefile            | 14 +++++++-------
 arch/riscv/configs/nommu_k210_defconfig        |  2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 9a216deb5c9c..f195cae638c0 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -36,7 +36,7 @@ config ARCH_VIRT
 	help
 	  This enables support for QEMU Virt Machine.
 
-config SOC_CANAAN
+config ARCH_CANAAN
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU
 	select CLINT_TIMER if RISCV_M_MODE
@@ -50,11 +50,11 @@ config SOC_CANAAN
 	help
 	  This enables support for Canaan Kendryte K210 SoC platform hardware.
 
-if SOC_CANAAN
+if ARCH_CANAAN
 
-config SOC_CANAAN_K210_DTB_BUILTIN
+config ARCH_CANAAN_K210_DTB_BUILTIN
 	bool "Builtin device tree for the Canaan Kendryte K210"
-	depends on SOC_CANAAN
+	depends on ARCH_CANAAN
 	default y
 	select OF
 	select BUILTIN_DTB
@@ -63,16 +63,16 @@ config SOC_CANAAN_K210_DTB_BUILTIN
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say Y.
 
-config SOC_CANAAN_K210_DTB_SOURCE
+config ARCH_CANAAN_K210_DTB_SOURCE
 	string "Source file for the Canaan Kendryte K210 builtin DTB"
-	depends on SOC_CANAAN
-	depends on SOC_CANAAN_K210_DTB_BUILTIN
+	depends on ARCH_CANAAN
+	depends on ARCH_CANAAN_K210_DTB_BUILTIN
 	default "k210_generic"
 	help
 	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
 	  for the DTS file that will be used to produce the DTB linked into the
 	  kernel.
 
-endif # SOC_CANAAN
+endif # ARCH_CANAAN
 
 endmenu # "SoC selection"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index e013df8e7b8b..e4d448da2a18 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -131,7 +131,7 @@ endif
 endif
 
 ifneq ($(CONFIG_XIP_KERNEL),y)
-ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)
+ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
 KBUILD_IMAGE := $(boot)/loader.bin
 else
 KBUILD_IMAGE := $(boot)/Image.gz
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ff174996cdfd..fc791600e347 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
 subdir-y += starfive
-subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
+subdir-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index befe4eb7527b..520623264c87 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
-dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
-dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_ARCH_CANAAN) += sipeed_maixduino.dtb
 
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
+obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_ARCH_CANAAN_K210_DTB_SOURCE))
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 96fe8def644c..f14fe314e2d2 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -27,7 +27,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 379740654373..15ec3bac4745 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -19,7 +19,7 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
-CONFIG_SOC_CANAAN=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_NONPORTABLE=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
