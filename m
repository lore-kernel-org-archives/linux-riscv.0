Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5BEC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 12:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zu66PIUZRENfWCAVV5Nl/Bsflmh0zEYPDP9g16t4xVU=; b=P9avkV6udX1lnw
	H10lg2Gpl8KyR+Zg9I74lrF7Ai8ov0dboqBP5cUFgKm94GB7+PnkKtBWb+AteMFZNWv2nNLPkt87J
	D3ADO59Na2goRi/G61CAcvoP4615t6LuJYn5v6/Vvv1UcBOLb1AA5/xtbA/KeQft/6V5hR+zpsPWs
	2U1D49l3irEA3rjz2TC1cUSHgSSUIt2GOTuKN/Ff21Q528y7DUlVakRA8clzpSDNG855AlBcXr+xU
	jfhdBkuCue/IS/nzVxscmJzSKink4we3gYrgeYyvIHFpgncxp8HRLqEiiSMGeSyZegtfIoTCCMF0B
	UEeDQO8E8Al/+5vxMgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Px1-00000002f40-1KIM;
	Mon, 29 Apr 2024 12:17:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PwY-00000002eg1-3gtH;
	Mon, 29 Apr 2024 12:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CF0860CEC;
	Mon, 29 Apr 2024 12:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE43C4AF1C;
	Mon, 29 Apr 2024 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714393033;
	bh=Q5aCDGAMhe9LWjmBOe0KfqvsLthVcLCeaQ3ItO7ykso=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DFlLUXKOGW1bA9nT5em+gyu9NCPRcUND9+V0H60SUspwoRFLXFQitEQVYTPWgn1M9
	 z4gEdgmIOodHo5MssVhusRrGON/21XKdAobI8Xl76jIzIjGZ2nuBUJfu7xJYYKxN6v
	 mqSCyhRtiPek7zSthB0V2kCkon2yq5wwYoKlvUuJyYdHWXbatxvOoIjhTRzCeWYglH
	 QCcr2CU57MgnBVNzvmHRWGSC1sILdAjbcoinGJRtM59eQsergOHEcZKSSzUxlIdf1P
	 viEhJNzAUN7etXMkoohraK1IxkhWxZdNrHYfsyJuMrZF0sTHEDTRg7teof836jRKrJ
	 VY3god5uR3bLQ==
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
Subject: [PATCH v7 03/16] nios2: define virtual address space for modules
Date: Mon, 29 Apr 2024 15:16:07 +0300
Message-ID: <20240429121620.1186447-4-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429121620.1186447-1-rppt@kernel.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_051715_211514_8837C362 
X-CRM114-Status: GOOD (  13.20  )
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

nios2 uses kmalloc() to implement module_alloc() because CALL26/PCREL26
cannot reach all of vmalloc address space.

Define module space as 32MiB below the kernel base and switch nios2 to
use vmalloc for module allocations.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/nios2/include/asm/pgtable.h |  5 ++++-
 arch/nios2/kernel/module.c       | 19 ++++---------------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index d052dfcbe8d3..eab87c6beacb 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -25,7 +25,10 @@
 #include <asm-generic/pgtable-nopmd.h>
 
 #define VMALLOC_START		CONFIG_NIOS2_KERNEL_MMU_REGION_BASE
-#define VMALLOC_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
+#define VMALLOC_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M - 1)
+
+#define MODULES_VADDR		(CONFIG_NIOS2_KERNEL_REGION_BASE - SZ_32M)
+#define MODULES_END		(CONFIG_NIOS2_KERNEL_REGION_BASE - 1)
 
 struct mm_struct;
 
diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
index 76e0a42d6e36..9c97b7513853 100644
--- a/arch/nios2/kernel/module.c
+++ b/arch/nios2/kernel/module.c
@@ -21,23 +21,12 @@
 
 #include <asm/cacheflush.h>
 
-/*
- * Modules should NOT be allocated with kmalloc for (obvious) reasons.
- * But we do it for now to avoid relocation issues. CALL26/PCREL26 cannot reach
- * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc returns
- * addresses in 0xc0000000)
- */
 void *module_alloc(unsigned long size)
 {
-	if (size == 0)
-		return NULL;
-	return kmalloc(size, GFP_KERNEL);
-}
-
-/* Free memory returned from module_alloc */
-void module_memfree(void *module_region)
-{
-	kfree(module_region);
+	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
+				    GFP_KERNEL, PAGE_KERNEL_EXEC,
+				    VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+				    __builtin_return_address(0));
 }
 
 int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
