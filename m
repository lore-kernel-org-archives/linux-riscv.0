Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7333AC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 10:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxHuV+CUgK8YDts1Wovwg/OfDQbH94VtuGQE3trRenw=; b=KuLgiH0rgVqs84
	w7YggTUeMrEOQ15+QDADyCtJ1K2lRGbj3OLNQ2/keoByjiInozcIk+rjqtV/U/q2uIV50BkiPpNLg
	FYsJ8pM092qB4A/NyOw5B1jnXyr+/zeDF/WG1cVyAsyFAqugj3uVOVq7m//V/jrocNapxzN3Kc256
	GGpOd7MBoQATaViNN4V+uaywI/l1l4wzSw/+6zbGihN6/U+i7O3GaL0otwjlmOa/ml0qBEDlOW8hg
	MJ/WGkKNYVhjX8O69XUqxFAKtcP6u4EBBKmZD/1/Lq9wBpOkdfOF9avjvLH6e/eTdnK3CORW2yDK6
	I1vhEi+EZ/eK8G4rrDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fKz-002tVD-21;
	Thu, 01 Jun 2023 10:15:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fKt-002tNn-0N;
	Thu, 01 Jun 2023 10:15:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2B4564322;
	Thu,  1 Jun 2023 10:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881EDC433A8;
	Thu,  1 Jun 2023 10:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685614514;
	bh=KP9HX6DBOdeXbh1b+aKLs5zgkX2POLO57m2Kdhv+uBE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpK9bveSqvpewvjbyZorKqSi3Q/F2n/LjJbM2xuj27cyV2j16y21onV4vnPjeZgTl
	 zE9e28Ev7BFmducrk1/4dDKq3oOIJdBaX0QRyCLXbMWkq7hyE5K3/dP7zLmKJI/u+J
	 lhU+vPxA/p2Jf8kS/aFYDSo6FeVktlpcm+nCEuVDQIry8EXyK9YUnYblgPqXCgLqeR
	 2j1GLCveGyj3OVEyE2BDq2GHbbfSv+yRuLfu/Nry87svP0BgLxAfXOGT4DOJSO+sz1
	 hW3iK555Pl8OaMr8Z+t77LXxqmLIyxUXr+Y3h+YIQv8TpNf780OllbwDGe20NNxSf6
	 l3zqIrjNIFEhQ==
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
Subject: [PATCH 13/13] x86/jitalloc: make memory allocated for code ROX
Date: Thu,  1 Jun 2023 13:12:57 +0300
Message-Id: <20230601101257.530867-14-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230601101257.530867-1-rppt@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_031515_252199_7E9C915B 
X-CRM114-Status: GOOD (  18.85  )
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

When STRICT_KERNEL_RWX or STRICT_MODULE_RWX is enabled, force text
allocations to use KERNEL_PAGE_ROX.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/Kconfig             |  3 +++
 arch/x86/Kconfig         |  1 +
 arch/x86/kernel/ftrace.c |  3 ---
 arch/x86/mm/init.c       |  6 ++++++
 include/linux/jitalloc.h |  2 ++
 mm/jitalloc.c            | 21 +++++++++++++++++++++
 6 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 479a7b8be191..e7c4b01307d7 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1307,6 +1307,9 @@ config STRICT_MODULE_RWX
 	  and non-text memory will be made non-executable. This provides
 	  protection against certain security exploits (e.g. writing to text)
 
+config ARCH_HAS_TEXT_POKE
+	def_bool n
+
 # select if the architecture provides an asm/dma-direct.h header
 config ARCH_HAS_PHYS_TO_DMA
 	bool
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fac4add6ce16..e1a512f557de 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -96,6 +96,7 @@ config X86
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
+	select ARCH_HAS_TEXT_POKE
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index d50595f2c1a6..bd4dd8974ee6 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -313,7 +313,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	unsigned long call_offset;
 	unsigned long jmp_offset;
 	unsigned long offset;
-	unsigned long npages;
 	unsigned long size;
 	unsigned long *ptr;
 	void *trampoline;
@@ -350,7 +349,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 		return 0;
 
 	*tramp_size = size + RET_SIZE + sizeof(void *);
-	npages = DIV_ROUND_UP(*tramp_size, PAGE_SIZE);
 
 	/* Copy ftrace_caller onto the trampoline memory */
 	ret = text_poke_copy(trampoline, (void *)start_offset, size);
@@ -416,7 +414,6 @@ create_trampoline(struct ftrace_ops *ops, unsigned int *tramp_size)
 	/* ALLOC_TRAMP flags lets us know we created it */
 	ops->flags |= FTRACE_OPS_FL_ALLOC_TRAMP;
 
-	set_memory_rox((unsigned long)trampoline, npages);
 	return (unsigned long)trampoline;
 fail:
 	tramp_free(trampoline);
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index ffaf9a3840ce..c314738991fa 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -1127,6 +1127,12 @@ struct jit_alloc_params *jit_alloc_arch_params(void)
 	jit_alloc_params.text.start = MODULES_VADDR + get_jit_load_offset();
 	jit_alloc_params.text.end = MODULES_END;
 
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
+	    IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+		jit_alloc_params.text.pgprot = PAGE_KERNEL_ROX;
+		jit_alloc_params.flags |= JIT_ALLOC_USE_TEXT_POKE;
+	}
+
 	return &jit_alloc_params;
 }
 #endif /* CONFIG_JIT_ALLOC */
diff --git a/include/linux/jitalloc.h b/include/linux/jitalloc.h
index 0ba5ef785a85..0e29e87acefe 100644
--- a/include/linux/jitalloc.h
+++ b/include/linux/jitalloc.h
@@ -15,9 +15,11 @@
 /**
  * enum jit_alloc_flags - options for executable memory allocations
  * @JIT_ALLOC_KASAN_SHADOW:	allocate kasan shadow
+ * @JIT_ALLOC_USE_TEXT_POKE:	use text poking APIs to update memory
  */
 enum jit_alloc_flags {
 	JIT_ALLOC_KASAN_SHADOW	= (1 << 0),
+	JIT_ALLOC_USE_TEXT_POKE	= (1 << 1),
 };
 
 /**
diff --git a/mm/jitalloc.c b/mm/jitalloc.c
index a8ae64364d56..15d1067faf3f 100644
--- a/mm/jitalloc.c
+++ b/mm/jitalloc.c
@@ -7,6 +7,26 @@
 
 static struct jit_alloc_params jit_alloc_params;
 
+#ifdef CONFIG_ARCH_HAS_TEXT_POKE
+#include <asm/text-patching.h>
+
+static inline void jit_text_poke_copy(void *dst, const void *src, size_t len)
+{
+	if (jit_alloc_params.flags & JIT_ALLOC_USE_TEXT_POKE)
+		text_poke_copy(dst, src, len);
+	else
+		memcpy(dst, src, len);
+}
+
+static inline void jit_text_poke_set(void *addr, int c, size_t len)
+{
+	if (jit_alloc_params.flags & JIT_ALLOC_USE_TEXT_POKE)
+		text_poke_set(addr, c, len);
+	else
+		memset(addr, c, len);
+}
+
+#else
 static inline void jit_text_poke_copy(void *dst, const void *src, size_t len)
 {
 	memcpy(dst, src, len);
@@ -16,6 +36,7 @@ static inline void jit_text_poke_set(void *addr, int c, size_t len)
 {
 	memset(addr, c, len);
 }
+#endif
 
 static void *jit_alloc(size_t len, unsigned int alignment, pgprot_t pgprot,
 		       unsigned long start, unsigned long end,
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
