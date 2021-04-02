Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FA5C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:21:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A2F60FD7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A2F60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhexX7+7t4TvH9BktltG3vjb2jeso5vWJUsUrE6U1H0=; b=NCLn5DjsmtAKAdOqYecNyA4RUV
	9EXiupSj2Z9yGZk5BqKYph+PHXVJxlKImnSQ+IIJyQlldMBbn1sIYxhYNk/RHrned25Du60F4J5Up
	rWuHo/AJnpQXb6Km4zi9FQ04QuyJJZr+u88+NGIKFHm6YZejPrEqSCSABbKO0Bt5Ay/DUi/1VKAW1
	RUYm9I2jSNio3pIIuQIK8gDEvznGl1kKIED6LMnmafDhBMHh2T1B0ah15EBckIXeenb+wUWFrkU7O
	EGKBn3sRtX8PyOwPjjBUHUk+UHZv2IYGyV4rdfo6SjKngxoOu0SxyvFCz7tp/lodyRQEPOczaotJf
	Xc97tu9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLbX-00DEIv-Ii; Fri, 02 Apr 2021 15:20:59 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYs-00DCRT-4u; Fri, 02 Apr 2021 15:18:17 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFv5gXmz9v2lw;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZVGa-EQtaQRr; Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFv4Sv5z9v2ls;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83CBF8BB7C;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ePI0pVGy8P5x; Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FEB68BB79;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F0BE667989; Fri,  2 Apr 2021 15:18:12 +0000 (UTC)
Message-Id: <c73e170d5fbcc3ac5d7bc98a1e0bfa0b899b185e.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 11/20] microblaze: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
Date: Fri,  2 Apr 2021 15:18:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161815_494231_C4F73420 
X-CRM114-Status: GOOD (  10.71  )
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

This converts the architecture to GENERIC_CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/microblaze/Kconfig               | 24 +-----------------------
 arch/microblaze/configs/mmu_defconfig |  2 +-
 arch/microblaze/kernel/head.S         |  4 ++--
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 0660f47012bc..1242f34bc2a2 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -15,6 +15,7 @@ config MICROBLAZE
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
 	select GENERIC_ATOMIC64
+	select GENERIC_CMDLINE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_PROBE
@@ -93,29 +94,6 @@ source "kernel/Kconfig.hz"
 config MMU
 	def_bool y
 
-comment "Boot options"
-
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-
-config CMDLINE
-	string "Default kernel command string"
-	depends on CMDLINE_BOOL
-	default "console=ttyUL0,115200"
-	help
-	  On some architectures there is currently no way for the boot loader
-	  to pass arguments to the kernel. For these architectures, you should
-	  supply some command-line options at build time by entering them
-	  here.
-
-config CMDLINE_FORCE
-	bool "Force default kernel command string"
-	depends on CMDLINE_BOOL
-	default n
-	help
-	  Set this to have arguments from the default kernel command string
-	  override those passed by the boot loader.
-
 endmenu
 
 menu "Kernel features"
diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index 51337fffb947..b4d2219d0a8f 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -16,7 +16,7 @@ CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
 CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
 CONFIG_XILINX_MICROBLAZE0_USE_FPU=2
 CONFIG_HZ_100=y
-CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyUL0,115200"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_HIGHMEM=y
 CONFIG_PCI_XILINX=y
diff --git a/arch/microblaze/kernel/head.S b/arch/microblaze/kernel/head.S
index ec2fcb545e64..605b18c86ac8 100644
--- a/arch/microblaze/kernel/head.S
+++ b/arch/microblaze/kernel/head.S
@@ -105,7 +105,7 @@ _copy_fdt:
 	addik	r3, r3, -4 /* descrement loop */
 no_fdt_arg:
 
-#ifndef CONFIG_CMDLINE_BOOL
+#if CONFIG_CMDLINE == ""
 /*
  * handling command line
  * copy command line directly to cmd_line placed in data section.
@@ -126,7 +126,7 @@ _copy_command_line:
 	addik	r5, r4, 0		/* add new space for command line */
 	tovirt(r5,r5)
 skip:
-#endif /* CONFIG_CMDLINE_BOOL */
+#endif /* CONFIG_CMDLINE */
 
 #ifdef NOT_COMPILE
 /* save bram context */
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
