Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DF5C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGAPCkUSN4tdHfaW4tH/9mMzNzVGrrPNtnDx6wInS9A=; b=39pJHQvXMVsjn+
	xWVm1OTBesCbr79uSULg2SsdzEDciabvwv9hoOfjQ6hFwnR57f9v6chvveAN1gjUVwQwl3eliqof3
	5gH7waCEZUhloEp3lIXtzlQch8CzFxrOHJ+n/UtkiYuVOBQYxmKR+mzwNtcvZbxlpMB+Qt49drjk2
	iE9ujtnhTe7gxaFX4nYYp0lFlbRI/eZVqDIQCKrHzjlPq2LAivVdrwhnp9+ELNqWit2KNPkhdioIH
	Jo461kHPRBXIfcu6c1BbR4i5Wvgf8zt6Sdr89+a4UIdmKUn6u+j8ef4P/sDh8mcPUE6LGdv0MbdWt
	NH9zYM1dFPdlDHNCMQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8iq-00EhUY-0a;
	Mon, 18 Sep 2023 07:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8im-00EhR0-2V;
	Mon, 18 Sep 2023 07:31:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44E2A60E15;
	Mon, 18 Sep 2023 07:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68ED7C433C8;
	Mon, 18 Sep 2023 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695022263;
	bh=mbiiTE+Ax/Si/BZxcJVEdVXi15nThNmQlUqiyILb0zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ojfgNgsup07S+iaZErkHdPn6pFXvUxpfd0rqcJ0g/fFjdgDTdp5RCwZChtRwqs+hU
	 358zdLhiRZXyw3aIFuKwPq3ciyzug59B+euqQg31hDJF2IYAsE+6D264chrRpy0JCv
	 lIJDaEg0ezBhP+IOLDXi95uXUolbh37QjiMgyCp6vToq0/niAQX3TSUJ4+A3chXFuR
	 Fz6pQnaNxbhFzVVMJL+/JI6h0Va38Wr9Y8Zzq0rWzkuGOl0+j0c7QpIR3g6g0WJ4vh
	 Na6tomyrzTQLlYxetqXYeBzvBjSJ3J7TMO8PQeFVdg4iyOutejtYTgrDjMGzC7l/J1
	 0uZomhqve3rWw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
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
Subject: [PATCH v3 05/13] modules, execmem: drop module_alloc
Date: Mon, 18 Sep 2023 10:29:47 +0300
Message-Id: <20230918072955.2507221-6-rppt@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230918072955.2507221-1-rppt@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_003104_933486_781FBF5A 
X-CRM114-Status: GOOD (  18.32  )
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
these defaults when an architecture does not supply its specific
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
index 806ad1a0088d..519bdfdca595 100644
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
  * enum execmem_type - types of executable memory ranges
  *
diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index a23718aa2f4d..8c81f389117d 100644
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
@@ -118,12 +114,4 @@ void module_arch_cleanup(struct module *mod);
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
index 4ec982cc943c..c4146bfcd0a7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1601,13 +1601,6 @@ static void free_modinfo(struct module *mod)
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
index a8c2f44d0133..abcbd07e05ac 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -55,9 +55,6 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
 
 void *execmem_text_alloc(enum execmem_type type, size_t size)
 {
-	if (!execmem_params.ranges[type].start)
-		return module_alloc(size);
-
 	return execmem_alloc(size, &execmem_params.ranges[type]);
 }
 
@@ -111,8 +108,15 @@ void __init execmem_init(void)
 {
 	struct execmem_params *p = execmem_arch_params();
 
-	if (!p)
+	if (!p) {
+		p = &execmem_params;
+		p->ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
+		p->ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
+		p->ranges[EXECMEM_DEFAULT].pgprot = PAGE_KERNEL_EXEC;
+		p->ranges[EXECMEM_DEFAULT].alignment = 1;
+
 		return;
+	}
 
 	if (!execmem_validate_params(p))
 		return;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
