Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EECCC61CE8
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 20:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnbFocBD3pvGhrI1UYdWVnpTDt0a/PQoyTccXIjuZgY=; b=skAt7TcR/rGHEe
	G/rAH/pxXAn2IYKm0YkfSTm043dT7aRpHFcFbE3hZu2gis4huTV+v2aa678MsV05JxY8pQvdpNJ1u
	xElT8Aonr2FpOd7ERiVTfwxWdEnp+KyZRIKAnK57jgbveVMGTCOq5rQ5ZVsCjYsX57DJ1U3L5Ml9n
	wVTkWkfzBEOD/cKHERtKLn5fO8/Y5lgmx2mrM3SH/yOxvWDYy4tf0vWQfviKzD9V85mc7HHh2IbXK
	/4A+oNFwtvE8zWf811Bi1sRv1dhs+N/YOANdb6XI+gQuNL3/6ZSsGLuEcOxxs3EMe/jvPmg0wrouc
	CX1B9TaNPD3VJ1oeqraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzvn-000000022y7-2b3D;
	Sat, 07 Jun 2025 20:14:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpE-000000021Ux-0MY4;
	Sat, 07 Jun 2025 20:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83C24614B3;
	Sat,  7 Jun 2025 20:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0353C4CEF7;
	Sat,  7 Jun 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326851;
	bh=1/FX0gdNnrILQ8ZGkWaTdKqNzEwmy3fTfx34tGwHQsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ARR+iKGrG+gAid+aDf6WQrQsQFpDxmsrmuoXyxau9e/Yt42BjtKcN1ST4zDXz2XsB
	 sXWsh2italtMvrkfA7Aw9KhOC7ceGu5ulDfHXBs2S9VScYnFqNDmIFZTg3tzdkb9BX
	 r6CuvNJgZfTcsPqiJZrueYI08M04Y03dPIUEqPvpkYNgxjTnu/RYNLewzPfrMi8pZB
	 /hzgAURQQ8GA3rbrGzQl3BWr4uDcAzrxu84F3hAOiJM6xseNbi1f6BAE9z14ArgoOp
	 34rkuBw8bcsaG7YiEiuDnbMwSYwe0c4Qmr9xWGuPJHTXIgH9klSsIbNJCCtzOkiDsv
	 TzdI7DNVBiIkg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 06/12] lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
Date: Sat,  7 Jun 2025 13:04:48 -0700
Message-ID: <20250607200454.73587-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
References: <20250607200454.73587-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

From: Eric Biggers <ebiggers@google.com>

Move the mips-optimized CRC code from arch/mips/lib/crc* into its new
location in lib/crc/mips/, and wire it up in the new way.  This new way
of organizing the CRC code eliminates the need to artificially split the
code for each CRC variant into separate arch and generic modules,
enabling better inlining and dead code elimination.  For more details,
see "lib/crc: prepare for arch-optimized code in subdirs of lib/crc/".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/Kconfig                             |  1 -
 arch/mips/lib/Makefile                        |  2 --
 lib/crc/Kconfig                               |  1 +
 .../lib/crc32-mips.c => lib/crc/mips/crc32.h  | 33 ++++---------------
 4 files changed, 7 insertions(+), 30 deletions(-)
 rename arch/mips/lib/crc32-mips.c => lib/crc/mips/crc32.h (82%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1e48184ecf1ec..934eb961bd0dd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2022,11 +2022,10 @@ config CPU_MIPSR5
 	select MIPS_SPRAM
 
 config CPU_MIPSR6
 	bool
 	default y if CPU_MIPS32_R6 || CPU_MIPS64_R6
-	select ARCH_HAS_CRC32
 	select CPU_HAS_RIXI
 	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select HAVE_ARCH_BITREVERSE
 	select MIPS_ASID_BITS_VARIABLE
 	select MIPS_SPRAM
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9d75845ef78e1..8c40ffb09c420 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -14,9 +14,7 @@ obj-$(CONFIG_PCI)	+= iomap-pci.o
 lib-$(CONFIG_GENERIC_CSUM)	:= $(filter-out csum_partial.o, $(lib-y))
 
 obj-$(CONFIG_CPU_GENERIC_DUMP_TLB) += dump_tlb.o
 obj-$(CONFIG_CPU_R3000)		+= r3k_dump_tlb.o
 
-obj-$(CONFIG_CRC32_ARCH)	+= crc32-mips.o
-
 # libgcc-style stuff needed in the kernel
 obj-y += bswapsi.o bswapdi.o multi3.o
diff --git a/lib/crc/Kconfig b/lib/crc/Kconfig
index c1629f07768f9..3f534fbfba951 100644
--- a/lib/crc/Kconfig
+++ b/lib/crc/Kconfig
@@ -67,10 +67,11 @@ config CRC32_ARCH
 	bool
 	depends on CRC32 && CRC_OPTIMIZATIONS
 	default y if ARM && KERNEL_MODE_NEON
 	default y if ARM64
 	default y if LOONGARCH
+	default y if MIPS && CPU_MIPSR6
 
 config CRC64
 	tristate
 	help
 	  The CRC64 library functions.  Select this if your module uses any of
diff --git a/arch/mips/lib/crc32-mips.c b/lib/crc/mips/crc32.h
similarity index 82%
rename from arch/mips/lib/crc32-mips.c
rename to lib/crc/mips/crc32.h
index 45e4d2c9fbf54..11cb272c63a69 100644
--- a/arch/mips/lib/crc32-mips.c
+++ b/lib/crc/mips/crc32.h
@@ -7,14 +7,10 @@
  * Copyright (C) 2014 Linaro Ltd <yazen.ghannam@linaro.org>
  * Copyright (C) 2018 MIPS Tech, LLC
  */
 
 #include <linux/cpufeature.h>
-#include <linux/crc32.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
 #include <asm/mipsregs.h>
 #include <linux/unaligned.h>
 
 #ifndef TOOLCHAIN_SUPPORTS_CRC
 #define _ASM_SET_CRC(OP, SZ, TYPE)					  \
@@ -62,11 +58,11 @@ do {							\
 #define CRC32C(crc, value, size) \
 	_CRC32(crc, value, size, crc32c)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
-u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
 
 	if (IS_ENABLED(CONFIG_64BIT)) {
@@ -104,13 +100,12 @@ u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 		CRC32(crc, value, b);
 	}
 
 	return crc;
 }
-EXPORT_SYMBOL(crc32_le_arch);
 
-u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
+static inline u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32c_base(crc, p, len);
 
 	if (IS_ENABLED(CONFIG_64BIT)) {
@@ -147,37 +142,21 @@ u32 crc32c_arch(u32 crc, const u8 *p, size_t len)
 
 		CRC32C(crc, value, b);
 	}
 	return crc;
 }
-EXPORT_SYMBOL(crc32c_arch);
 
-u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
-{
-	return crc32_be_base(crc, p, len);
-}
-EXPORT_SYMBOL(crc32_be_arch);
+#define crc32_be_arch crc32_be_base /* not implemented on this arch */
 
-static int __init crc32_mips_init(void)
+#define crc32_mod_init_arch crc32_mod_init_arch
+static inline void crc32_mod_init_arch(void)
 {
 	if (cpu_have_feature(cpu_feature(MIPS_CRC32)))
 		static_branch_enable(&have_crc32);
-	return 0;
 }
-subsys_initcall(crc32_mips_init);
 
-static void __exit crc32_mips_exit(void)
-{
-}
-module_exit(crc32_mips_exit);
-
-u32 crc32_optimizations(void)
+static inline u32 crc32_optimizations_arch(void)
 {
 	if (static_key_enabled(&have_crc32))
 		return CRC32_LE_OPTIMIZATION | CRC32C_OPTIMIZATION;
 	return 0;
 }
-EXPORT_SYMBOL(crc32_optimizations);
-
-MODULE_AUTHOR("Marcin Nowakowski <marcin.nowakowski@mips.com");
-MODULE_DESCRIPTION("CRC32 and CRC32C using optional MIPS instructions");
-MODULE_LICENSE("GPL v2");
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
