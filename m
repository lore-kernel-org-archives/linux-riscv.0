Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1973AC19F53
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7NdJWabbYXxDwSQyEuiO2Vr2MOPkd87xsg68l97kfQ=; b=E6VhzVDienDlvr
	88WO5EGaCc3FPGJd6QetHrlUScLT+HLT6pF9Gn0isiRyMLDkvOQA3YYS6Yx6xqse4au64ZXphQV50
	jGhHudVHxfu4K2UT1pRUqvvBY+JWEqA9b4vk/+nDFxFsGHXugwGlWq7UIg5qYnDrVPnurLJXm8ApI
	iY87BwOEbsJftsM06eB6yejBA73mI2TTqH1m1V+hXXu3p+f/qPJU4UKEsO3SgnyEnMa+liC+d/NxR
	Bo7v/TH5qDmJbo+mV3s0WQFHz08tXF3MsIcAYJPwScvse1G1t6UsgaRUy1BHcsg//72cEZfcxn69d
	q/8/oHCeXN1l/88Hb0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GyM-0000000BfGv-3fw2;
	Fri, 26 Apr 2024 08:30:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Gy0-0000000BexI-0CXa;
	Fri, 26 Apr 2024 08:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D14762002;
	Fri, 26 Apr 2024 08:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542DDC4AF07;
	Fri, 26 Apr 2024 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714120198;
	bh=3M2ZG/VEWUi/tLsKuWV23dNNSZ6f7DkD53R0UR9I374=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FxtLE7FDecUHDXtLc4lOQtpBLWDxwjYFEEqYIkPR0QwLBDoD0zZ8t9vMwtiNZytp+
	 ABQ7RDoHM2Wc8RbUl8TpphzmEPE3zGDm9H3NJtnVJldRKMdfi/pFNBIoxoDEyAWloM
	 qKk5ZdZFe/QBUMzCeM17G3JEc1Q4ge5Z39+eSmY1YmeSj+KnOWOdkwt7Vg0syHyV2v
	 MWiu4EM+A60684+xjiReNXSAogLjTsxd0SEDmFZ/ASqSKiS3Ag5ts/MGVnz++OOj4B
	 XyuNjsYN43GEx4Pus1MPQkKPSwr0XVDkAZGhn7sXt+cl6vvS3YrJ7KQi2FaOLbqO+3
	 OD3ZnzghTMFZg==
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
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
Subject: [PATCH v6 04/16] sparc: simplify module_alloc()
Date: Fri, 26 Apr 2024 11:28:42 +0300
Message-ID: <20240426082854.7355-5-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426082854.7355-1-rppt@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_013000_253398_DC4E5618 
X-CRM114-Status: GOOD (  12.46  )
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
