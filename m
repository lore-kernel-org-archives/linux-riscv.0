Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F7CC4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 14:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MJZXOXgZCZqLvObt6xe3SKujvfyTxad3ayv4T4DA9s=; b=njiXcPCVLIb2ge
	e64YE6XJZTCGWWZ3CGcNopjyIww5lSlPq6DFGlSoUHobWj4xAtOkijNpfjVDPUmCihDg1elyXR9cr
	YisDuFLqM/34Ftq3Mh9i2tUwZqV3WBWNdfO4vpb62wio39L64AMZkaRRHe26lUkbJJZJZYsqGa8Jp
	yRkXWjEdbI+5KoIYsPet34Rz74WUuVwSzH8KvAmLwpUcbfEdpXFLzclAOlhtadPbYwoPKdv+sr9+v
	j1FukiTf7O39MwmJQ5BL65DwZnhCXkj221FZZZ37ywadKloE9wOWd/IYXtqFn62w0yK2Zub13G6Bc
	VqceUY3pI9k/vrMNT1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cpi-00000004SM6-47d0;
	Sun, 05 May 2024 14:27:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3cpa-00000004SEK-3gZr;
	Sun, 05 May 2024 14:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D59160C85;
	Sun,  5 May 2024 14:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AFF0C4AF18;
	Sun,  5 May 2024 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714919229;
	bh=S2WO9rrdnIu5PceUjVXVwYLrUCttkXy1oVefr4+OvH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9J6N0yZo/WUWpqhiJ/VyRoz69PO3DWhKmxX4w/INOl9LHYWHgQFa9/OwlRwWcTnT
	 9U0e2wSypq0tIwNxA98Zo0poMoKrSMYSxWK8XwyvukXM8PePB1nHZoNsiCakJePlAp
	 e4+4+nyN4nTWsi6slAh+/wYcojeSzZsESNPdzXG4AKCWhIBdxvZfv+BQsMNWBtlJi1
	 bmj/+kEB8uLuitBKHKy0PNR/PODXSzhhHz3l62d9vL9nUt/6xnKh8KQ6/qDpsblRUc
	 ZzSKpK8jNbiMYadUMJGe6vv80DbiKnzlWwOwB2ATSsuVJVRI4xUHgEKguamYUfA+/U
	 NBfZ3QPtHC0Mw==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Liviu Dudau <liviu@dudau.co.uk>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>,
	Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org,
	linux-arch@vger.kernel.org,
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
Subject: [PATCH v8 04/17] sparc: simplify module_alloc()
Date: Sun,  5 May 2024 17:25:47 +0300
Message-ID: <20240505142600.2322517-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240505142600.2322517-1-rppt@kernel.org>
References: <20240505142600.2322517-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_072711_291090_6F8825F2 
X-CRM114-Status: GOOD (  12.29  )
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

Define MODULES_VADDR and MODULES_END as VMALLOC_START and VMALLOC_END
for 32-bit and reduce module_alloc() to

	__vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, ...)

as with the new defines the allocations becomes identical for both 32
and 64 bits.

While on it, drop unused include of <linux/jump_label.h>

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/include/asm/pgtable_32.h |  2 ++
 arch/sparc/kernel/module.c          | 25 +------------------------
 2 files changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 9e85d57ac3f2..62bcafe38b1f 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -432,6 +432,8 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 #define VMALLOC_START           _AC(0xfe600000,UL)
 #define VMALLOC_END             _AC(0xffc00000,UL)
+#define MODULES_VADDR           VMALLOC_START
+#define MODULES_END             VMALLOC_END
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
index 66c45a2764bc..d37adb2a0b54 100644
--- a/arch/sparc/kernel/module.c
+++ b/arch/sparc/kernel/module.c
@@ -21,35 +21,12 @@
 
 #include "entry.h"
 
-#ifdef CONFIG_SPARC64
-
-#include <linux/jump_label.h>
-
-static void *module_map(unsigned long size)
+void *module_alloc(unsigned long size)
 {
-	if (PAGE_ALIGN(size) > MODULES_LEN)
-		return NULL;
 	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
 				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
 				__builtin_return_address(0));
 }
-#else
-static void *module_map(unsigned long size)
-{
-	return vmalloc(size);
-}
-#endif /* CONFIG_SPARC64 */
-
-void *module_alloc(unsigned long size)
-{
-	void *ret;
-
-	ret = module_map(size);
-	if (ret)
-		memset(ret, 0, size);
-
-	return ret;
-}
 
 /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
