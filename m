Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D0AEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pd0632m4Ztd/0iYenEd4hfBuwnTlr7OtD6TA3+GiLwY=; b=oogIMEnzBD0ZNq
	ui0zltX4aiEpRqhES4i3Tsv8+RL/+3EJVx0JHfoFVbedBrrFN4F/5tNerZV1s1vi+6FCI8X6qwnUP
	V4dTktsphDjKCH2sRrPZSTxLNZjLhXEOqfMudh0T6540Pc0BTA374K83XOFKUgSMirwx2pYoDaXHw
	OnIt9/clIMWnXmK+qfu9vPijj0+fCuxdblhHHcclgW/2eXArhBkPbz6P8Nmx5gOhv82Z0q971d07C
	nWASBP40YKDV5CYSJhmE+4/fKfyqONeG0+1JFCJ4mRQ/8XQ6sCWuP5G6ZEjVAOzXYUI7NGBIeEk/h
	UQzdcR4RtHqvY7kQ9h1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD6t-00ExO0-0e;
	Tue, 11 Jul 2023 13:08:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJD6q-00ExND-1I
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:08:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B058B614C8;
	Tue, 11 Jul 2023 13:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFD1C433C8;
	Tue, 11 Jul 2023 13:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689080931;
	bh=YRG1SatEXSQvibLkPPPJGs1s5S3gHEmvd7gZSzwoAnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m8vIO/3oz0iV+JgNzmjwzr+CqcICYWIe7Rog2iDkpGmFwZJYExFefwtunqZdT6VMl
	 EQnVR6hgqYxvFUCn1yz1VxthdhaUjLWAQNQknByoD2ylRfeXIGTkinPU7DRPpEARDZ
	 7wX0sSRV4gsPE+0pjG7tc7lPTroIyaiNr9krJQaOVEEiaUTnd9kPtjM1i7eDyrWveS
	 QtdstMrnsA2dPoXWxPs7dLSeHSQaNy11g5joZAo4bkYF0MURxHjYoP8QJ1BL2CHNxl
	 dRj4mzhN1/YDtHZnmVaI3l9GfljurrccBjsCIrXpFRYcC9/hqYTui5DrmkZ/0JYoKJ
	 JsEwgA/i1IYjg==
From: Greg Ungerer <gerg@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	viro@zeniv.linux.org.uk,
	ebiederm@xmission.com,
	keescook@chromium.org,
	brauner@kernel.org,
	Greg Ungerer <gerg@kernel.org>
Subject: [PATCH v2 2/2] riscv: support the elf-fdpic binfmt loader
Date: Tue, 11 Jul 2023 23:07:54 +1000
Message-Id: <20230711130754.481209-3-gerg@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230711130754.481209-1-gerg@kernel.org>
References: <20230711130754.481209-1-gerg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_060852_526859_0B1DD265 
X-CRM114-Status: GOOD (  16.46  )
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
on RISC-V platforms. The most important change is to setup registers
during program load to pass the mapping addresses to the new process.

One of the interesting features of the elf-fdpic loader is that it
also allows appropriately compiled ELF format binaries to be loaded on
nommu systems. Appropriate being those compiled with -pie.

Signed-off-by: Greg Ungerer <gerg@kernel.org>
---
v1->v2: rebase onto linux-6.5-rc1
        increment PTRACE_GETFDPIC value to keep it unique

 arch/riscv/include/asm/elf.h         | 11 ++++++++++-
 arch/riscv/include/asm/mmu.h         |  4 ++++
 arch/riscv/include/uapi/asm/ptrace.h |  5 +++++
 fs/Kconfig.binfmt                    |  2 +-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index c24280774caf..c33fe923ef6d 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -41,6 +41,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define compat_elf_check_arch	compat_elf_check_arch
 
 #define CORE_DUMP_USE_REGSET
+#define ELF_FDPIC_CORE_EFLAGS	0
 #define ELF_EXEC_PAGESIZE	(PAGE_SIZE)
 
 /*
@@ -69,6 +70,13 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define ELF_HWCAP	riscv_get_elf_hwcap()
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
@@ -78,7 +86,6 @@ extern unsigned long elf_hwcap;
 
 #define COMPAT_ELF_PLATFORM	(NULL)
 
-#ifdef CONFIG_MMU
 #define ARCH_DLINFO						\
 do {								\
 	/*							\
@@ -115,6 +122,8 @@ do {								\
 	else							 \
 		NEW_AUX_ENT(AT_IGNORE, 0);			 \
 } while (0)
+
+#ifdef CONFIG_MMU
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
 extern int arch_setup_additional_pages(struct linux_binprm *bprm,
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index 0099dc116168..355504b37f8e 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -20,6 +20,10 @@ typedef struct {
 	/* A local icache flush is needed before user execution can resume. */
 	cpumask_t icache_stale_mask;
 #endif
+#ifdef CONFIG_BINFMT_ELF_FDPIC
+	unsigned long exec_fdpic_loadmap;
+	unsigned long interp_fdpic_loadmap;
+#endif
 } mm_context_t;
 
 void __init create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa,
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index e17c550986a6..30f6d6537adc 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -10,6 +10,11 @@
 
 #include <linux/types.h>
 
+#define PTRACE_GETFDPIC		33
+
+#define PTRACE_GETFDPIC_EXEC	0
+#define PTRACE_GETFDPIC_INTERP	1
+
 /*
  * User-mode register state for core dumps, ptrace, sigcontext
  *
diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
index 93539aac0e5b..f5693164ca9a 100644
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
