Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710DEE7718D
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 00:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R0WPv0hXg0NDwbvAjgtAFHO8f0YJdjDMQ4+flsF4Aw8=; b=mA8wMH5kr3Ulit
	4t8jAuu5dXXYfLvkONvgW30Wt552ry8Tot5lpuP1NWgJVwutCnvEktQsFNw+Zobj0ty7HolQuja/t
	xM2hJ3NlsxDVlVsMP7MxP7PFxbx/mDO3rsQ78t0m351jVc9OXQgNSgc+K93VrJllGFY3mKPXEw1ey
	tJ2heAZdb0CF7q6OFYbQ1wwB2hkP3jOta8oqiHerV0tpYjanSIzgrQPioJslhrYfzW1Qasb1TbvT1
	3eA3Or5kGv+rUfbsZRPa1DNZyrSzABgEgelHasN6zSmZefpjPOW5DGrXqTzPUEQqFhruy/KhLNGb0
	aeMS2JUD47riNJIV88BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9Wj-00000007ZtT-0EfN;
	Sun, 22 Dec 2024 00:08:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9Wg-00000007Zt2-0wEP
	for linux-riscv@lists.infradead.org;
	Sun, 22 Dec 2024 00:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55FC35C044E;
	Sun, 22 Dec 2024 00:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF4FC4CECE;
	Sun, 22 Dec 2024 00:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734826131;
	bh=RwpQxzUx7RABG1xbrUAZH59uwhOac87f2TorUPeKLEg=;
	h=From:To:Cc:Subject:Date:From;
	b=iKQzd9jhO43DC2AqJorSIO4Upy5lJ8guuei3VqhaWDpZbdv6ykkASzE5nlovthawC
	 2cMT3hRTVK50nW9JXrzsNHnqsi7OkBmImLIczMFESsF/eHmiR1VFrZRLgreJHGdPLr
	 AL7MgYaak6IR/g44CQIQKRQYJZCBr6ZiNQC0/UuJScvq8ePqeYX81Ug3vmigWRnL+L
	 ze7NR2jdnKKKHC+NjgfyRdAnIsZxjVi/CryerTMm21yDYYCbl8jWFdGxe+Cx58X2Mr
	 axNsCz/ZRi0CMUK085zhjlCJ1YHjv96bI2vOlPtaXn4Wh74SjJkV2odj8oHPITc0yG
	 7/mpFO62rpwBw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] riscv: migrate to the generic rule for built-in DTB
Date: Sun, 22 Dec 2024 09:08:25 +0900
Message-ID: <20241222000836.2578171-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_160855_064905_C6E760CF 
X-CRM114-Status: GOOD (  11.28  )
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

Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
DTBs") introduced generic support for built-in DTBs.

Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.

To keep consistency across architectures, this commit also renames
CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

 arch/riscv/Kbuild                              | 1 -
 arch/riscv/Kconfig                             | 3 ++-
 arch/riscv/boot/dts/Makefile                   | 2 --
 arch/riscv/configs/nommu_k210_defconfig        | 2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index 2c585f7a0b6e..126fb738fc44 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-y += kernel/ mm/ net/
-obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-$(CONFIG_CRYPTO) += crypto/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..5f5774892a6e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1267,13 +1267,14 @@ config RISCV_ISA_FALLBACK
 config BUILTIN_DTB
 	bool "Built-in device tree"
 	depends on OF && NONPORTABLE
+	select GENERIC_BUILTIN_DTB
 	help
 	  Build a device tree into the Linux image.
 	  This option should be selected if no bootloader is being used.
 	  If unsure, say N.
 
 
-config BUILTIN_DTB_SOURCE
+config BUILTIN_DTB_NAME
 	string "Built-in device tree source"
 	depends on BUILTIN_DTB
 	help
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fdae05bbf556..b09678f9badc 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -7,5 +7,3 @@ subdir-y += sifive
 subdir-y += sophgo
 subdir-y += starfive
 subdir-y += thead
-
-obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 87ff5a1233af..ee18d1e333f2 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -35,7 +35,7 @@ CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_BUILTIN_DTB=y
-CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
+CONFIG_BUILTIN_DTB_NAME="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 95cbd574f291..e770d81b738e 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -27,7 +27,7 @@ CONFIG_NR_CPUS=2
 CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_BUILTIN_DTB=y
-CONFIG_BUILTIN_DTB_SOURCE="canaan/k210_generic"
+CONFIG_BUILTIN_DTB_NAME="canaan/k210_generic"
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
 # CONFIG_GCC_PLUGINS is not set
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
