Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA4FC07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9czEt+r+Ix19eDgyTBtTphJbDlzRBmIwRGnU2y8yrig=; b=fC2c4WCoXp0JPr
	fbu4PIoue8JVMN1cd8XDvMSNBkIZMnbZaS6laDBowpERAqxOYxKStTR/Xa29ms5kW4Bg+J6X27fe+
	mR69qt4B9Y/LSGdRcnDJkh4k1k5PFjROEWCobfFpH7YUqQ/s5du2TIF+oZsynj0+Lq3QEpLXE9zrW
	x/cWPYOZsmApuWhsjQBv8yMMcR/fyipbQ/r3jwvCr2W6ADLhGCzJuqxuYIaBVgpQ6y2wLSdDDkzVM
	q1M1BlF8+tvUBtuzYmYSEV8vt2Vr3jQ0H4SXh1YBbFp28IdHYtddIWGPZlq0TIGVMQJzELQ/oc9kD
	70bnuTA07UPbcP57XPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrv-005Qhu-1H; Fri, 23 Sep 2022 18:57:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrk-005QWA-EK
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E49FB8239A;
	Fri, 23 Sep 2022 18:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30993C433D6;
	Fri, 23 Sep 2022 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959453;
	bh=TWiGG1Qa7DV/XSTVgM1dJgAbBrL+Z5YQu7ItwpJiOF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNqXKXpQj0YSCZYKKunqOsNJzIFFdstrfxZIxK1AxwrcS9m4LBnjHr+w8GiceQBkQ
	 EJeXO9mF9OAcuAzyPo9w3iNlIQwY1Blcm/HOrUHujaqOP/2a+AlUqYiIH6V4bMtFw4
	 BPMKeeAMShiUJ3kscHOHH+ZID/lSnYPocDnxFwQvauWTL3C0AgQkZaYuqFr2o1yn/v
	 r4+LJ+5jwKiugs0ApMWs+FcfCzND+6nV22+FHbLGw/BU8Ay0OM8nhO+K+BUndjh64n
	 2mzUcjrL4+leUhs5HOEKnCC2aHG/jGGlNYGEkP35sN5pD71GL+BURRYjZaSrdeoW4D
	 0cyqcEJ8oGa7g==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 11/27] riscv: replace SOC_SIFIVE with ARCH_SIFIVE
Date: Fri, 23 Sep 2022 19:55:50 +0100
Message-Id: <20220923185605.1900083-12-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115736_661492_26EE087C 
X-CRM114-Status: GOOD (  11.74  )
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

Per discussion at LPC, the SoC/platform Kconfig symbols in RISC-V land
are to be converted to ARCH_FOO from SOC_FOO so that the symbols are
consistent between the "incumbents" & those coming from ARM64 etc.

Predictably, SOC_SIFIVE becomes ARCH_SIFIVE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs             | 2 +-
 arch/riscv/boot/dts/sifive/Makefile | 2 +-
 arch/riscv/configs/defconfig        | 2 +-
 arch/riscv/configs/rv32_defconfig   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 910697baf097..3604b90251b4 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -6,7 +6,7 @@ config ARCH_MICROCHIP
 	help
 	  This enables support for Microchip SoC FPGAs.
 
-config SOC_SIFIVE
+config ARCH_SIFIVE
 	bool "SiFive SoCs"
 	select SERIAL_SIFIVE if TTY
 	select SERIAL_SIFIVE_CONSOLE if TTY
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
index d90e4eb0ade8..b1c2d563a0e6 100644
--- a/arch/riscv/boot/dts/sifive/Makefile
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb \
+dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00.dtb \
 			    hifive-unmatched-a00.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 971986be875f..bfb6f6f57ae2 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,7 +26,7 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP_POLARFIRE=y
-CONFIG_SOC_SIFIVE=y
+CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_STARFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 38760e4296cf..4badab395546 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -16,7 +16,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
-CONFIG_SOC_SIFIVE=y
+CONFIG_ARCH_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_NONPORTABLE=y
 CONFIG_ARCH_RV32I=y
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
