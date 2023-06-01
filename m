Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408AFC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8v55sNHrRZcrStzOQl1PwgHqutShlYNKESKEyUtGhX0=; b=ezM+0yIr48H7Mo
	a6j4wEF9yYInBpNyX6iqLR5yNlEodAeSQtDjQVEXGovnt0kL5e7lNbNNO2kS9UOZp94RnRffOT7V6
	svBOsb38CEOoubiU/QmII19X2pgnqSwWl2BDgUD9VCwzIBVOhntFdFsBNDLq8UlFVfBZrV67cbCPC
	kfaE/DEjImQ4CTNTYryP07fw+sP3G06I/l3N9RULEUmZL1d5MoPI2MBbT22heSao/0OHiJnEX087w
	RzFJC33OdIRdrovQ1fWh2fXKEU7UXCRSFpM3XLVENhWD/NJfWV4h4c5TbGBSbwKGUGOHDBjAesBpl
	5KJSJiycwhzk+dpYvXTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fK6-002sbh-1q;
	Thu, 01 Jun 2023 10:14:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fK1-002sVq-02;
	Thu, 01 Jun 2023 10:14:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D0CE63EA6;
	Thu,  1 Jun 2023 10:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71499C4339B;
	Thu,  1 Jun 2023 10:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614459;
	bh=pTt6oea7dl0OK8cq7WwHFZhtWWFAemGTmvVp6aKQFQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uD6/N81ikOPiRJAEV5qGhLjfWCawk0yMnp6Xt8fYx/PrTJkuDN66o3QZ5/QyahqEi
	 eEz3p9HhuIbubjxt94fZnmeMfIMlPtSuJAOfKCpVVmKDOUgkw+ZxlAzPGWu9ElDJox
	 8//FTUGz/X60PWEvHsAHESQPPehoEt7bviFexeZ2+2LRDfSYeGeeu1DFsnURPYhCb8
	 VA1UxImPpBwTmBGD+s3/pviyix4aZfXJhpSs4E0hU7dMP1uoMuAjAMHYvMlR6NxLUs
	 Woe4ghZDems2+gtF6bA6JpPo4jOZtr6deA+75+7bfQpGOZ/ORmQU/6FoNPAMN6dlf9
	 dqaesbQEJi8Eg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 07/13] x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
Date: Thu,  1 Jun 2023 13:12:51 +0300
Message-Id: <20230601101257.530867-8-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_031421_172971_64A7483D 
X-CRM114-Status: GOOD (  22.68  )
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

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Dynamic ftrace must allocate memory for code and this was impossible
without CONFIG_MODULES.

With jitalloc separated from the modules code, the jit_text_alloc() is
available regardless of CONFIG_MODULE.

Move jitalloc initialization to x86/mm/init.c so that it won't get
compiled away when CONFIG_MODULE=n and enable dynamic ftrace
unconditionally.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/x86/Kconfig         |  1 +
 arch/x86/kernel/ftrace.c |  9 --------
 arch/x86/kernel/module.c | 44 --------------------------------------
 arch/x86/mm/init.c       | 46 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 47 insertions(+), 53 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 53bab123a8ee..fac4add6ce16 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -35,6 +35,7 @@ config X86_64
 	select SWIOTLB
 	select ARCH_HAS_ELFCORE_COMPAT
 	select ZONE_DMA32
+	select JIT_ALLOC if DYNAMIC_FTRACE
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 157c8a799704..aa99536b824c 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -261,7 +261,6 @@ void arch_ftrace_update_code(int command)
 /* Currently only x86_64 supports dynamic trampolines */
 #ifdef CONFIG_X86_64
 
-#ifdef CONFIG_MODULES
 /* Module allocation simplifies allocating memory for code */
 static inline void *alloc_tramp(unsigned long size)
 {
@@ -271,14 +270,6 @@ static inline void tramp_free(void *tramp)
 {
 	jit_free(tramp);
 }
-#else
-/* Trampolines can only be created if modules are supported */
-static inline void *alloc_tramp(unsigned long size)
-{
-	return NULL;
-}
-static inline void tramp_free(void *tramp) { }
-#endif
 
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index cacca613b8bd..94a00dc103cd 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -19,7 +19,6 @@
 #include <linux/jump_label.h>
 #include <linux/random.h>
 #include <linux/memory.h>
-#include <linux/jitalloc.h>
 
 #include <asm/text-patching.h>
 #include <asm/page.h>
@@ -37,49 +36,6 @@ do {							\
 } while (0)
 #endif
 
-#ifdef CONFIG_RANDOMIZE_BASE
-static unsigned long module_load_offset;
-
-/* Mutex protects the module_load_offset. */
-static DEFINE_MUTEX(module_kaslr_mutex);
-
-static unsigned long int get_module_load_offset(void)
-{
-	if (kaslr_enabled()) {
-		mutex_lock(&module_kaslr_mutex);
-		/*
-		 * Calculate the module_load_offset the first time this
-		 * code is called. Once calculated it stays the same until
-		 * reboot.
-		 */
-		if (module_load_offset == 0)
-			module_load_offset =
-				get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
-		mutex_unlock(&module_kaslr_mutex);
-	}
-	return module_load_offset;
-}
-#else
-static unsigned long int get_module_load_offset(void)
-{
-	return 0;
-}
-#endif
-
-static struct jit_alloc_params jit_alloc_params = {
-	.alignment	= JIT_ALLOC_ALIGN,
-	.flags		= JIT_ALLOC_KASAN_SHADOW,
-};
-
-struct jit_alloc_params *jit_alloc_arch_params(void)
-{
-	jit_alloc_params.text.pgprot = PAGE_KERNEL;
-	jit_alloc_params.text.start = MODULES_VADDR + get_module_load_offset();
-	jit_alloc_params.text.end = MODULES_END;
-
-	return &jit_alloc_params;
-}
-
 #ifdef CONFIG_X86_32
 int apply_relocate(Elf32_Shdr *sechdrs,
 		   const char *strtab,
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 3cdac0f0055d..ffaf9a3840ce 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -7,6 +7,7 @@
 #include <linux/swapops.h>
 #include <linux/kmemleak.h>
 #include <linux/sched/task.h>
+#include <linux/jitalloc.h>
 
 #include <asm/set_memory.h>
 #include <asm/e820/api.h>
@@ -1084,3 +1085,48 @@ unsigned long arch_max_swapfile_size(void)
 	return pages;
 }
 #endif
+
+#ifdef CONFIG_JIT_ALLOC
+#ifdef CONFIG_RANDOMIZE_BASE
+static unsigned long jit_load_offset;
+
+/* Mutex protects the jit_load_offset. */
+static DEFINE_MUTEX(jit_kaslr_mutex);
+
+static unsigned long int get_jit_load_offset(void)
+{
+	if (kaslr_enabled()) {
+		mutex_lock(&jit_kaslr_mutex);
+		/*
+		 * Calculate the jit_load_offset the first time this
+		 * code is called. Once calculated it stays the same until
+		 * reboot.
+		 */
+		if (jit_load_offset == 0)
+			jit_load_offset =
+				get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
+		mutex_unlock(&jit_kaslr_mutex);
+	}
+	return jit_load_offset;
+}
+#else
+static unsigned long int get_jit_load_offset(void)
+{
+	return 0;
+}
+#endif
+
+static struct jit_alloc_params jit_alloc_params = {
+	.alignment	= JIT_ALLOC_ALIGN,
+	.flags		= JIT_ALLOC_KASAN_SHADOW,
+};
+
+struct jit_alloc_params *jit_alloc_arch_params(void)
+{
+	jit_alloc_params.text.pgprot = PAGE_KERNEL;
+	jit_alloc_params.text.start = MODULES_VADDR + get_jit_load_offset();
+	jit_alloc_params.text.end = MODULES_END;
+
+	return &jit_alloc_params;
+}
+#endif /* CONFIG_JIT_ALLOC */
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
