Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83947C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Mar 2022 20:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIUQjucV/NE+fIAh50QCQkdU8C+cBiM/z0fN14m8E80=; b=sULqJJKatbLlZy
	ijkkxgeF1EYfAVQbEx8v46iy4ZuLBxgBeFQM5VJ3cVF+rHKyTHsHLvjn+DoJ1X4njKAKB89cKbgHY
	pB4VOKev1G9XKo164mzwLlwuZQZVRMdALE7L683xrPRC4qavEgFn3ganbbswtePal9m2E26V+E6CT
	GutX9w3jCcK6GJAbdW8+C4ItLyCuPFCYTd6A7hp92l2g2bgoMBqKB8guVx9+VI+6kYREG4NuephVd
	ekVf9h8ihVzrtcT1QDMB2YIcVnrzKd/bKMXLdY5qxy8p5lXxkkrCTIo7x0H/tuJKYmdGYi+/cJqJt
	x5vlo4eNsopLtJl9gmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRKMF-001XBI-O4; Mon, 07 Mar 2022 20:53:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRKM6-001X5P-SB
 for linux-riscv@lists.infradead.org; Mon, 07 Mar 2022 20:53:25 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nRKLz-0002DJ-MT; Mon, 07 Mar 2022 21:53:15 +0100
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
Subject: [PATCH v7 02/13] riscv: integrate alternatives better into the main
 architecture
Date: Mon,  7 Mar 2022 21:52:59 +0100
Message-Id: <20220307205310.1905628-3-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307205310.1905628-1-heiko@sntech.de>
References: <20220307205310.1905628-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_125323_011840_2ECF1379 
X-CRM114-Status: GOOD (  17.32  )
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

This mimics how i.e. arm64 handles its alternatives implementation.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas                  | 10 ----------
 arch/riscv/Kconfig.socs                     |  1 -
 arch/riscv/Makefile                         |  2 +-
 arch/riscv/errata/Makefile                  |  1 -
 arch/riscv/include/asm/alternative-macros.h | 22 ---------------------
 arch/riscv/kernel/Makefile                  |  1 +
 arch/riscv/{errata => kernel}/alternative.c |  0
 arch/riscv/kernel/smpboot.c                 |  2 --
 arch/riscv/kernel/traps.c                   |  2 +-
 9 files changed, 3 insertions(+), 38 deletions(-)
 rename arch/riscv/{errata => kernel}/alternative.c (100%)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index b44d6ecdb46e..d18be8ff0245 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -1,17 +1,7 @@
 menu "CPU errata selection"
 
-config RISCV_ERRATA_ALTERNATIVE
-	bool "RISC-V alternative scheme"
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
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6ec44a22278a..3df7f7ed0d81 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -14,7 +14,6 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
-	select RISCV_ERRATA_ALTERNATIVE
 	select ERRATA_SIFIVE
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
index 67406c376389..92da6b3920a3 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
-#ifdef CONFIG_RISCV_ERRATA_ALTERNATIVE
-
 #ifdef __ASSEMBLY__
 
 .macro ALT_ENTRY oldptr newptr vendor_id errata_id new_len
@@ -76,26 +74,6 @@
 
 #endif /* __ASSEMBLY__ */
 
-#else /* !CONFIG_RISCV_ERRATA_ALTERNATIVE*/
-#ifdef __ASSEMBLY__
-
-.macro __ALTERNATIVE_CFG old_c
-	\old_c
-.endm
-
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	__ALTERNATIVE_CFG old_c
-
-#else /* !__ASSEMBLY__ */
-
-#define __ALTERNATIVE_CFG(old_c)  \
-	old_c "\n"
-
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
-	__ALTERNATIVE_CFG(old_c)
-
-#endif /* __ASSEMBLY__ */
-#endif /* CONFIG_RISCV_ERRATA_ALTERNATIVE */
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
