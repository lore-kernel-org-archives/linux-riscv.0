Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E61C001B1
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 08:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8dtpDTx8u4wF/CocSqfAQsS5LFB/Xfyjiqx3Htc1uA=; b=fGCpVZXxTLj4GB
	CZFi1et0HkUSPoEy7kmrGICHESgSpTM+tBnX7Sl4TaI2OzP82+Mu1d6Ndd9hRvrsuosZiKoadIy8m
	KWivfZhfWiLMpnCWH9ULTx95iSUMHHVuejxqtA65Z4Y0uDrVo9nhvqK3D3l5Pw6Az2JNiWy/YbvUY
	0djNB0wimpLIn2oZxXlxQOCgeDT1qsfvzTDhlN7J8cJd+haSEDq4UKSD38n5UZEWZ+MX2IjDgK4JU
	HbHf+qifkNEnKRm6vgCr4OLpIhQYQEBInBdREEN57Xi53ZMsKhfK1dZVMbSnFH06OY+yULhmTbmla
	YJppXsfGLR5F6MECnKhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5BS-00HKyX-17;
	Fri, 16 Jun 2023 08:51:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA5BM-00HKtH-2H;
	Fri, 16 Jun 2023 08:51:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 377A16313B;
	Fri, 16 Jun 2023 08:51:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B963C433C9;
	Fri, 16 Jun 2023 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686905508;
	bh=+07oFke3TwadZ0sZEEllL+tiiID3wwgy+CrUkcKlMys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YZTtvWhbmreCzC2jgCquzt+akv8T+7MJ+bE0l+X2tLA+SnHISSyAy2Tvsr5WGGhE9
	 PuxrPjU24hrqUElx9XIEe9OyVQwg8nfQOaWtcLSYFmDhH2hsz+RrgGpGDBvno1MJtS
	 2dr6uCCG1OnS/I52oIBnBqiFHwI2oUJTpHL6w/UriQdmHLxKHJQLhBNcM3/brxCTUA
	 ACvH3XIoNfEusFqphqtAr2BDJawpGKGEbVMGV6vtFFym/zFgSP2FCRRnNSuK6n3h8a
	 Eg2cl4gg22X2neXvj/JGEpds4aDGlaDuDSPceA7hFbFtWVJrgB3b1RFzCh5PamK893
	 93VQ7ENRp/0cg==
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
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
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
Subject: [PATCH v2 05/12] modules, execmem: drop module_alloc
Date: Fri, 16 Jun 2023 11:50:31 +0300
Message-Id: <20230616085038.4121892-6-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230616085038.4121892-1-rppt@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_015148_848173_E07DE77C 
X-CRM114-Status: GOOD (  18.22  )
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

Define default parameters for address range for code allocations using
the current values in module_alloc() and make execmem_text_alloc() use
these defaults when an architecure does not supply its specific
parameters.

With this, execmem_text_alloc() implements memory allocation in a way
compatible with module_alloc() and can be used as a replacement for
module_alloc().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/execmem.h      |  8 ++++++++
 include/linux/moduleloader.h | 12 ------------
 kernel/module/main.c         |  7 -------
 mm/execmem.c                 | 12 ++++++++----
 4 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/include/linux/execmem.h b/include/linux/execmem.h
index 68b2bfc79993..b9a97fcdf3c5 100644
--- a/include/linux/execmem.h
+++ b/include/linux/execmem.h
@@ -4,6 +4,14 @@
 
 #include <linux/types.h>
 
+#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
+		!defined(CONFIG_KASAN_VMALLOC)
+#include <linux/kasan.h>
+#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
+#else
+#define MODULE_ALIGN PAGE_SIZE
+#endif
+
 /**
  * struct execmem_range - definition of a memory range suitable for code and
  *			  related data allocations
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index b3374342f7af..4321682fe849 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -25,10 +25,6 @@ int module_frob_arch_sections(Elf_Ehdr *hdr,
 /* Additional bytes needed by arch in front of individual sections */
 unsigned int arch_mod_section_prepend(struct module *mod, unsigned int section);
 
-/* Allocator used for allocating struct module, core sections and init
-   sections.  Returns NULL on failure. */
-void *module_alloc(unsigned long size);
-
 /* Determines if the section name is an init section (that is only used during
  * module loading).
  */
@@ -113,12 +109,4 @@ void module_arch_cleanup(struct module *mod);
 /* Any cleanup before freeing mod->module_init */
 void module_arch_freeing_init(struct module *mod);
 
-#if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
-		!defined(CONFIG_KASAN_VMALLOC)
-#include <linux/kasan.h>
-#define MODULE_ALIGN (PAGE_SIZE << KASAN_SHADOW_SCALE_SHIFT)
-#else
-#define MODULE_ALIGN PAGE_SIZE
-#endif
-
 #endif
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 43810a3bdb81..b445c5ad863a 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1600,13 +1600,6 @@ static void free_modinfo(struct module *mod)
 	}
 }
 
-void * __weak module_alloc(unsigned long size)
-{
-	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
-			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
-			NUMA_NO_NODE, __builtin_return_address(0));
-}
-
 bool __weak module_init_section(const char *name)
 {
 	return strstarts(name, ".init");
diff --git a/mm/execmem.c b/mm/execmem.c
index 2fe36dcc7bdf..a67acd75ffef 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -59,9 +59,6 @@ void *execmem_text_alloc(size_t size)
 	unsigned long fallback_end = execmem_params.modules.text.fallback_end;
 	bool kasan = execmem_params.modules.flags & EXECMEM_KASAN_SHADOW;
 
-	if (!execmem_params.modules.text.start)
-		return module_alloc(size);
-
 	return execmem_alloc(size, start, end, align, pgprot,
 			     fallback_start, fallback_end, kasan);
 }
@@ -108,8 +105,15 @@ void __init execmem_init(void)
 {
 	struct execmem_params *p = execmem_arch_params();
 
-	if (!p)
+	if (!p) {
+		p = &execmem_params;
+		p->modules.text.start = VMALLOC_START;
+		p->modules.text.end = VMALLOC_END;
+		p->modules.text.pgprot = PAGE_KERNEL_EXEC;
+		p->modules.text.alignment = 1;
+
 		return;
+	}
 
 	if (!execmem_validate_params(p))
 		return;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
