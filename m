Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7409BC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:22:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F05E60FD7
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 15:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F05E60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c93MGgTyo3nxu+fAkHo1/AQIZEi9XkwWg/KL2Px61AE=; b=FC2YJKGi0suO2XoGud7W4iFr/f
	s7kK/bKtkGtpGxeI+FdxCJcAZCnWheMBqtJTkXCREE8V7Kcg+Iuv+fyZNv7+kuzxZjvHaXU1Y7E1o
	eTVqvIHNm1o80pdg3YZ5JlR8yjra+tsS1pt8SJepNwM5lMCy3O5P6nd9Netez9kMgn7rds1Szrl3U
	00DoDfnmq6h+7/oBKWxiJ1NsaIJNRDlKRfnOLI5OUSTtUr+WM0CnM/GxNYxsKZ4HKJTf30RIRGv1y
	3MQSiAURwLWbAHNSo4069ZvThkzNDfHNuV5o/FiwRJmQ8TN2nMT6dNU217BhUdAQ61DTD1s3WsTxR
	GK6FWrgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSLcd-00DFXF-KA; Fri, 02 Apr 2021 15:22:07 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSLYt-00DCRb-BX; Fri, 02 Apr 2021 15:18:18 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFx03zqz9v2m3;
 Fri,  2 Apr 2021 17:18:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id A8kam4b7TJbi; Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFw53rLz9v2ls;
 Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C7E18BB7F;
 Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H5LeedaB8gob; Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 25D4A8BB79;
 Fri,  2 Apr 2021 17:18:14 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0385767989; Fri,  2 Apr 2021 15:18:13 +0000 (UTC)
Message-Id: <9b4899b0abc156eb207b19fe0b24dd5bf0355b99.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 12/20] nios2: Convert to GENERIC_CMDLINE
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
Date: Fri,  2 Apr 2021 15:18:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_161815_579061_30E83CC9 
X-CRM114-Status: GOOD (  13.59  )
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
v4: Added missing selection of CONFIG_GENERIC_CMDLINE in Kconfig
---
 arch/nios2/Kconfig        | 25 ++-----------------------
 arch/nios2/kernel/setup.c | 13 ++++---------
 2 files changed, 6 insertions(+), 32 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index c24955c81c92..6018f3d626f8 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -10,6 +10,7 @@ config NIOS2
 	select COMMON_CLK
 	select TIMER_OF
 	select GENERIC_ATOMIC64
+	select GENERIC_CMDLINE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
@@ -90,31 +91,9 @@ config NIOS2_ALIGNMENT_TRAP
 
 comment "Boot options"
 
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-	default y
-
-config CMDLINE
-	string "Default kernel command string"
-	default ""
-	depends on CMDLINE_BOOL
-	help
-	  On some platforms, there is currently no way for the boot loader to
-	  pass arguments to the kernel. For these platforms, you can supply
-	  some command-line options at build time by entering them here.  In
-	  other cases you can specify kernel args so that you don't have
-	  to set them up in board prom initialization routines.
-
-config CMDLINE_FORCE
-	bool "Force default kernel command string"
-	depends on CMDLINE_BOOL
-	help
-	  Set this to have arguments from the default kernel command string
-	  override those passed by the boot loader.
-
 config NIOS2_CMDLINE_IGNORE_DTB
 	bool "Ignore kernel command string from DTB"
-	depends on CMDLINE_BOOL
+	depends on CMDLINE != ""
 	depends on !CMDLINE_FORCE
 	default y
 	help
diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
index d2f21957e99c..5b38d3d0ad64 100644
--- a/arch/nios2/kernel/setup.c
+++ b/arch/nios2/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/initrd.h>
 #include <linux/of_fdt.h>
 #include <linux/screen_info.h>
+#include <linux/cmdline.h>
 
 #include <asm/mmu_context.h>
 #include <asm/sections.h>
@@ -108,7 +109,7 @@ asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
 				       unsigned r7)
 {
 	unsigned dtb_passed = 0;
-	char cmdline_passed[COMMAND_LINE_SIZE] __maybe_unused = { 0, };
+	char cmdline_passed[COMMAND_LINE_SIZE] = { 0, };
 
 #if defined(CONFIG_NIOS2_PASS_CMDLINE)
 	if (r4 == 0x534f494e) { /* r4 is magic NIOS */
@@ -127,14 +128,8 @@ asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
 
 	early_init_devtree((void *)dtb_passed);
 
-#ifndef CONFIG_CMDLINE_FORCE
-	if (cmdline_passed[0])
-		strlcpy(boot_command_line, cmdline_passed, COMMAND_LINE_SIZE);
-#ifdef CONFIG_NIOS2_CMDLINE_IGNORE_DTB
-	else
-		strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
-#endif
-#endif
+	if (cmdline_passed[0] || IS_ENABLED(CONFIG_NIOS2_CMDLINE_IGNORE_DTB))
+		cmdline_build(boot_command_line, cmdline_passed);
 
 	parse_early_param();
 }
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
