Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3672C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:48:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52D9E61949
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 13:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52D9E61949
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Cc:To:Subject:From:References:In-Reply-To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k63axTCTMABJ3kq069zocsYHWJEqZNTDRY+tjAvpjEA=; b=KvOiW8hBFX71KsUV4ng2Kf6tvL
	T/TMA2hk1T46Ule9ZtJWa1UFUd5asmxCkvoG7gBpsxsrF+a6IQjsrL2SNKP3HyiiKEgyGtn7QrWSp
	TyJXWfoldEoY+xwyvWguSaB2GDOo+xrmM53FMqDd9Mq/Ak1wf00lyk76yQYPRSNgNfTFXc4UrTreQ
	HvwlbFyckdBVIeRkrJ9GP6sHbBONpZkdwuQ4yBexnifc2jobSoVmmHLFPxx7IrE76Pme+4GR4PHNM
	6wzFNU80PcoOdn4wmAVdzaUnh+orwSmgFMMNyPwW6Yx8UB9yIoqmvaurqu5207J36YDwQSLcBlNBa
	mDdk5U9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPmpU-003eiy-LC; Fri, 26 Mar 2021 13:48:48 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPmlo-003dAW-B4; Fri, 26 Mar 2021 13:45:02 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWY5C3mz9v03L;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4mW1M94fWAEi; Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWY4Gn8z9v03B;
 Fri, 26 Mar 2021 14:44:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E7728B8C7;
 Fri, 26 Mar 2021 14:44:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lzygznqtzRZ7; Fri, 26 Mar 2021 14:44:58 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C1488B8C9;
 Fri, 26 Mar 2021 14:44:58 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9B96867611; Fri, 26 Mar 2021 13:44:58 +0000 (UTC)
Message-Id: <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org
Date: Fri, 26 Mar 2021 13:44:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_134500_677811_985290AE 
X-CRM114-Status: GOOD (  13.45  )
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
 arch/riscv/Kconfig        | 44 +--------------------------------------
 arch/riscv/kernel/setup.c |  5 ++---
 2 files changed, 3 insertions(+), 46 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 87d7b52f278f..3dbd50bed037 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -39,6 +39,7 @@ config RISCV
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
+	select GENERIC_CMDLINE
 	select GENERIC_EARLY_IOREMAP
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO
 	select GENERIC_IOREMAP
@@ -390,49 +391,6 @@ endmenu
 
 menu "Boot options"
 
-config CMDLINE
-	string "Built-in kernel command line"
-	help
-	  For most platforms, the arguments for the kernel's command line
-	  are provided at run-time, during boot. However, there are cases
-	  where either no arguments are being provided or the provided
-	  arguments are insufficient or even invalid.
-
-	  When that occurs, it is possible to define a built-in command
-	  line here and choose how the kernel should use it later on.
-
-choice
-	prompt "Built-in command line usage" if CMDLINE != ""
-	default CMDLINE_FALLBACK
-	help
-	  Choose how the kernel will handle the provided built-in command
-	  line.
-
-config CMDLINE_FALLBACK
-	bool "Use bootloader kernel arguments if available"
-	help
-	  Use the built-in command line as fallback in case we get nothing
-	  during boot. This is the default behaviour.
-
-config CMDLINE_EXTEND
-	bool "Extend bootloader kernel arguments"
-	help
-	  The command-line arguments provided during boot will be
-	  appended to the built-in command line. This is useful in
-	  cases where the provided arguments are insufficient and
-	  you don't want to or cannot modify them.
-
-
-config CMDLINE_FORCE
-	bool "Always use the default kernel command string"
-	help
-	  Always use the built-in command line, even if we get one during
-	  boot. This is useful in case you need to override the provided
-	  command line on systems where you don't have or want control
-	  over it.
-
-endchoice
-
 config EFI_STUB
 	bool
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f8f15332caa2..e7c91ee478d1 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
 #include <linux/efi.h>
+#include <linux/cmdline.h>
 
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
@@ -228,10 +229,8 @@ static void __init parse_dtb(void)
 	}
 
 	pr_err("No DTB passed to the kernel\n");
-#ifdef CONFIG_CMDLINE_FORCE
-	strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	cmdline_build(boot_command_line, NULL, COMMAND_LINE_SIZE);
 	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
-#endif
 }
 
 void __init setup_arch(char **cmdline_p)
-- 
2.25.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
