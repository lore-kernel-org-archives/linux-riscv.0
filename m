Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1406EC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 13:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFi6cyAMPgOHux+l41VjE9yUk160Z/yicpP051QW1Yw=; b=TpkZvSyj4PDH4B
	nnTZ0TIl+X4m98CEmO6/pFWzg2tnbSJ9HHeM+WYJL5hS+2fgcZJWza1a1eetB0sWBqj3OKVhWi5x4
	F1HqJ6yYJeTeUk+g0jMGC0t7DNEZm9kEkfKk+xuuJes5s7+Z4Gfkl8RfU/MoyzuSqjghGzsVujDGS
	+oWsTomNlrqJX7ZWi8P8WrYchrfNeAJyaK0G4NpJY4a1lOWmO9q6dYzIjjbzK1U+bhs2gYuQtFGYH
	SRGEGpPO/CkbGNgiCyzatIXaR+JDOzixoW7GYkkQxuGsznfpp09CuTB1OGSOshm/BcnUQtTxKQTBH
	8qLlcglCHVQG924jZSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0PV-00DLKR-Mb; Tue, 28 Feb 2023 13:52:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX0PT-00DLIp-2i
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 13:52:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0EA061059;
	Tue, 28 Feb 2023 13:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3263C4339B;
	Tue, 28 Feb 2023 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677592370;
	bh=sUmjqdECpzhBzLfzvtQfNGKN7mDNJWpISMfwa2tW33U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Boyhyv71FzWm40DrM+Drdf72LjQFrF8AHpWmkg5DOe9wjg6w+XJdL/M9yJ/fIvYrH
	 Po6NftZvGdme/ZlecbcNrBfx0klhFEcwZ06OJYzJNppwaap9/rEj+KA4n+KD78eCnp
	 d9KS8dGiWMkM/WGE9yO5CyrQH+H9VzPXuDzFzb18BC0C8Xpf8nZ2+hZeJ1zSIkmIqS
	 99Owj8rS1vjZJn/XGaZgAebaYTR61DeKsel6vXO7AWDquYQ1DyZHjeDgsr31tVo94b
	 lbTB2jyn2+RCN9nQb5kJ0YvmIhyVsil9h1mKkzoQroWo8WLvjGItnNlLFRHXiuPd+m
	 fVjKuCUH/UF7Q==
From: Greg Ungerer <gerg@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Greg Ungerer <gerg@kernel.org>
Subject: [PATCH 2/2] riscv: support the elf-fdpic binfmt loader
Date: Tue, 28 Feb 2023 23:51:26 +1000
Message-Id: <20230228135126.1686427-3-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228135126.1686427-1-gerg@kernel.org>
References: <20230228135126.1686427-1-gerg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_055251_224853_653D703B 
X-CRM114-Status: GOOD (  16.81  )
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

Add support for enabling and using the binfmt_elf_fdpic program loader
on RISC-V platorms. The most important change is to setup registers
during program load to pass the mapping addresses to the new process.

One of the interresting features of the elf-fdpic loader is that it
also allows appropriately compiled ELF format binaries to be loaded on
nommu systems. Appropriate being those compiled with -pie.

Signed-off-by: Greg Ungerer <gerg@kernel.org>
---
 arch/riscv/include/asm/elf.h         | 11 ++++++++++-
 arch/riscv/include/asm/mmu.h         |  4 ++++
 arch/riscv/include/uapi/asm/ptrace.h |  5 +++++
 fs/Kconfig.binfmt                    |  2 +-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index e7acffdf21d26..95747b35d3262 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -40,6 +40,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define compat_elf_check_arch	compat_elf_check_arch
 
 #define CORE_DUMP_USE_REGSET
+#define ELF_FDPIC_CORE_EFLAGS	0
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
 
 /*
@@ -67,6 +68,13 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define ELF_HWCAP	(elf_hwcap)
 extern unsigned long elf_hwcap;
 
+#define ELF_FDPIC_PLAT_INIT(_r, _exec_map_addr, _interp_map_addr, dynamic_addr) \
+	do { \
+		(_r)->a1 = _exec_map_addr; \
+		(_r)->a2 = _interp_map_addr; \
+		(_r)->a3 = dynamic_addr; \
+	} while (0)
+
 /*
  * This yields a string that ld.so will use to load implementation
  * specific libraries for optimization.  This is more specific in
@@ -76,7 +84,6 @@ extern unsigned long elf_hwcap;
 
 #define COMPAT_ELF_PLATFORM	(NULL)
 
-#ifdef CONFIG_MMU
 #define ARCH_DLINFO						\
 do {								\
 	/*							\
@@ -104,6 +111,8 @@ do {								\
 	NEW_AUX_ENT(AT_L3_CACHEGEOMETRY,			\
 		get_cache_geometry(3, CACHE_TYPE_UNIFIED));	\
 } while (0)
+
+#ifdef CONFIG_MMU
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
 extern int arch_setup_additional_pages(struct linux_binprm *bprm,
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 5ff1f19fd45c2..af3fc3fb4d1ad 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -22,6 +22,10 @@ typedef struct {
 	/* A local tlb flush is needed before user execution can resume. */
 	cpumask_t tlb_stale_mask;
 #endif
+#ifdef CONFIG_BINFMT_ELF_FDPIC
+	unsigned long exec_fdpic_loadmap;
+	unsigned long interp_fdpic_loadmap;
+#endif
 } mm_context_t;
 
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c9..93a690509b133 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -10,6 +10,11 @@
 
 #include <linux/types.h>
 
+#define PTRACE_GETFDPIC		31
+
+#define PTRACE_GETFDPIC_EXEC	0
+#define PTRACE_GETFDPIC_INTERP	1
+
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
  *
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 93539aac0e5b2..f5693164ca9a3 100644
--- a/fs/Kconfig.binfmt
+++ b/fs/Kconfig.binfmt
@@ -58,7 +58,7 @@ config ARCH_USE_GNU_PROPERTY
 config BINFMT_ELF_FDPIC
 	bool "Kernel support for FDPIC ELF binaries"
 	default y if !BINFMT_ELF
-	depends on ARM || ((M68K || SUPERH || XTENSA) && !MMU)
+	depends on ARM || ((M68K || RISCV || SUPERH || XTENSA) && !MMU)
 	select ELFCORE
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
