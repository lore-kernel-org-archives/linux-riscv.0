Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F0CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 00:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhOvwQ7rVNvFZs1tuDO0KhUMUSSvO3GlTkTPt1i8qlI=; b=Ov6QfXc4W43GqA
	R/aZqX7uUYYWHnptQ7U+x9xQBeWDSo+OL9J0RawaIgtVFostwvHIdOLfG31orMqk/rXqTYBpoVbA2
	RyOLfEF82On0wigKsguLssEynujmKlo+P1EFReBP45hWQ1sjpVdxVRI1DrSiW242VUWMiWwii6eTs
	OswxA/IzHTHI1+ufZD+Ayhz0/d0YQ9ko86JOVyeqvkI0zfBdMu4tfSFgq7skFH1oiZU00afZUmmHl
	y2nuT8hQilf2lLuW2T3guh6+sqxHWSfdzB5qPJYTIxG83vktEzCy2a7aPoRV0fiSS+pMrbh4/OJlX
	u+VmCrbUS8+XevfXG7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXB13-00F9gW-4C; Thu, 24 Mar 2022 00:07:49 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXB0s-00F9b6-EU
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 00:07:41 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nXB0l-00055s-M9; Thu, 24 Mar 2022 01:07:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, mick@ics.forth.gr, allen.baum@esperantotech.com,
 jscheid@ventanamicro.com, rtrauben@gmail.com, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v8 02/14] riscv: integrate alternatives better into the main
 architecture
Date: Thu, 24 Mar 2022 01:06:58 +0100
Message-Id: <20220324000710.575331-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324000710.575331-1-heiko@sntech.de>
References: <20220324000710.575331-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_170738_679399_040B7855 
X-CRM114-Status: GOOD (  16.72  )
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

Right now the alternatives need to be explicitly enabled and
erratas are limited to SiFive ones.

Over time with more SoCs and additional RiscV extensions, many more
erratas or other patch-worthy features will emerge, so it doesn't
really make sense to have the core alternatives able to get
deactivated.

So make it part of the core RiscV kernel and drop the main
RISCV_ERRATA_ALTERNATIVES config symbol.

This mimics how other architectures like for example arm64 handle
their alternatives implementation.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas                  | 12 +-----------
 arch/riscv/Kconfig.socs                     |  1 -
 arch/riscv/Makefile                         |  2 +-
 arch/riscv/errata/Makefile                  |  1 -
 arch/riscv/include/asm/alternative-macros.h | 15 ++++++++-------
 arch/riscv/kernel/Makefile                  |  1 +
 arch/riscv/{errata => kernel}/alternative.c |  0
 arch/riscv/kernel/smpboot.c                 |  2 --
 arch/riscv/kernel/traps.c                   |  2 +-
 9 files changed, 12 insertions(+), 24 deletions(-)
 rename arch/riscv/{errata => kernel}/alternative.c (100%)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 0aacd7052585..15cdeeb4151f 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -1,18 +1,8 @@
 menu "CPU errata selection"
 
-config RISCV_ERRATA_ALTERNATIVE
-	bool "RISC-V alternative scheme"
-	depends on !XIP_KERNEL
-	default y
-	help
-	  This Kconfig allows the kernel to automatically patch the
-	  errata required by the execution platform at run time. The
-	  code patching is performed once in the boot stages. It means
-	  that the overhead from this mechanism is just taken once.
-
 config ERRATA_SIFIVE
 	bool "SiFive errata"
-	depends on RISCV_ERRATA_ALTERNATIVE
+	depends on !XIP_KERNEL
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index c112ab2a9052..236d7d46a6f1 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -14,7 +14,6 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
-	select RISCV_ERRATA_ALTERNATIVE if !XIP_KERNEL
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
 	  This enables support for SiFive SoC platform hardware.
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..a7ed47ce9311 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -103,7 +103,7 @@ endif
 
 head-y := arch/riscv/kernel/head.o
 
-core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
+core-y += arch/riscv/errata/
 core-$(CONFIG_KVM) += arch/riscv/kvm/
 
 libs-y += arch/riscv/lib/
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index b8f8740a3e44..0ca1c5281a2d 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1,2 +1 @@
-obj-y	+= alternative.o
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 67406c376389..e33d4bc54019 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
-#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
+#ifndef CONFIG_XIP_KERNEL
 
 #ifdef __ASSEMBLY__
 
@@ -76,26 +76,27 @@
 
 #endif /* __ASSEMBLY__ */
 
-#else /* !CONFIG_RISCV_ERRATA_ALTERNATIVE*/
+#else /* CONFIG_XIP_KERNEL */
 #ifdef __ASSEMBLY__
 
 .macro __ALTERNATIVE_CFG old_c
-	\old_c
+       \old_c
 .endm
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	__ALTERNATIVE_CFG old_c
+       __ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
 #define __ALTERNATIVE_CFG(old_c)  \
-	old_c "\n"
+       old_c "\n"
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	__ALTERNATIVE_CFG(old_c)
+       __ALTERNATIVE_CFG(old_c)
 
 #endif /* __ASSEMBLY__ */
-#endif /* CONFIG_RISCV_ERRATA_ALTERNATIVE */
+#endif /* CONFIG_XIP_KERNEL */
+
 /*
  * Usage:
  *   ALTERNATIVE(old_content, new_content, vendor_id, errata_id, CONFIG_k)
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ffc87e76b1dd..b02142517f7f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -18,6 +18,7 @@ extra-y += head.o
 extra-y += vmlinux.lds
 
 obj-y	+= soc.o
+obj-y	+= alternative.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/kernel/alternative.c
similarity index 100%
rename from arch/riscv/errata/alternative.c
rename to arch/riscv/kernel/alternative.c
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 622f226454d5..a6d13dca1403 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -41,9 +41,7 @@ static DECLARE_COMPLETION(cpu_running);
 void __init smp_prepare_boot_cpu(void)
 {
 	init_cpu_topology();
-#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
 	apply_boot_alternatives();
-#endif
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index fe92e119e6a3..9984c8622c3b 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -86,7 +86,7 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 	}
 }
 
-#if defined (CONFIG_XIP_KERNEL) && defined (CONFIG_RISCV_ERRATA_ALTERNATIVE)
+#if defined (CONFIG_XIP_KERNEL)
 #define __trap_section		__section(".xip.traps")
 #else
 #define __trap_section
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
