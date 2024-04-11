Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDC1C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+D/4MiGwkkiyLYery5w3PyLdFWvG+XlHa6U3897We8U=; b=WhuRB0emuUFVrC
	4BAOFbuLsBCDekTZ/rtMu5e1rrW7USjlFUmOi+f7Q67p1UV467PHs102TJhlK+ecul8s8Q4UIa0XK
	jZwUWtrDOPy5wuPcB26oBJGZFNTIVFwOqCQcIytFQMHeZt4vSAN/0Vds75gw87yzBVpYdt6ALHHiK
	r5LAqdROvRjJhVHMtn2jy5FxELEkWi1QHw4UhITJAcWBUX8p/3gB1e6CM02V/BKYmmC3YsOcchECH
	XWzmYDeihBKR8Fa5ZB2Y1evcPQ4u/9LDmMduujB0PKe6rttKnOQqANW81v1hnRImd5CwGg3izrgQm
	StOZ4GbixjmnJBgUbZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwvY-0000000Cvkd-2mL6;
	Thu, 11 Apr 2024 16:05:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwuG-0000000Cv4X-20HL;
	Thu, 11 Apr 2024 16:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=L2IvRt6u6jqo/e5amHBUqWQrOE6g/Jgm0JvMVudiXTE=; b=gvF2f6XzC+crdeVJhugyh9rdox
	zijUxJiP2vPiqNxWHntdYKFAha+bTP2patH9VPSr8UQY4yhZhN3VPM1aTjA4IjZUaLWfM8aU/03jn
	X4CtoaCesnNlxcyE1scGDjwwMenipvDTvAfUF/uG4y3MIeoAcUn37SnemGfiaIFz4b4V2vUPgkPNm
	J9sj6weGhzDcQQoNaasG/5qcKyEb8jSCWiwyht2HLq1JD08qsNEbDxp954Wql6ySVMerRC/cYYJcY
	+T2Ms9V8SZ0HUm8FxID9c8UVPvaKkikcNeDW691y616PNMmtr++SSDZfPNf9nXxuVskHdMDjNq7bi
	H61+NRDg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruwuC-00000008gz9-464T;
	Thu, 11 Apr 2024 16:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8242CE1825;
	Thu, 11 Apr 2024 16:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1811DC113CE;
	Thu, 11 Apr 2024 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712851440;
	bh=dj8Jeem56mTOW4r4fQ6hbW3YTYti2N5hSv58QgNFPjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6ERizPZR76qVXhsBWZGKyAA22R77VnIeczbENKkVs2ThkiNc2s4tsjRC6xm+CXxB
	 jlcF0zveXe/fpGxsCUUGili9t/nI1QFTLlvaSxrnj2aY9IE1K3itlIW53TQGDAxcPH
	 d55OpEkteiNE5H2ZOPbXgXaOw+Yt4EGv+8350H5u47HbBEYjptG2ECa9bqhQvptxMY
	 i9fDA8JAkVwaWYd7dr082MDQYplP2RwcqdCLAnW8A01K9Xwv4bbd4TCMssphDLeqMj
	 jIdvZcHYTNH1/Q7ir9e2JX9svcI/GYtAMORhoGI6ljN8+aBIhzk2YNVgIQ7nWjFkaH
	 CW7NBFCjaYvIQ==
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Nadav Amit <nadav.amit@gmail.com>,
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
Subject: [PATCH v4 13/15] powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropiate
Date: Thu, 11 Apr 2024 19:00:49 +0300
Message-ID: <20240411160051.2093261-14-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_170405_603485_9ADB5958 
X-CRM114-Status: GOOD (  15.88  )
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

There are places where CONFIG_MODULES guards the code that depends on
memory allocation being done with module_alloc().

Replace CONFIG_MODULES with CONFIG_EXECMEM in such places.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/Kconfig                 | 2 +-
 arch/powerpc/include/asm/kasan.h     | 2 +-
 arch/powerpc/kernel/head_8xx.S       | 4 ++--
 arch/powerpc/kernel/head_book3s_32.S | 6 +++---
 arch/powerpc/lib/code-patching.c     | 2 +-
 arch/powerpc/mm/book3s32/mmu.c       | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..2e586733a464 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,7 +285,7 @@ config PPC
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
-	select KASAN_VMALLOC			if KASAN && MODULES
+	select KASAN_VMALLOC			if KASAN && EXECMEM
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 365d2720097c..b5bbb94c51f6 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -19,7 +19,7 @@
 
 #define KASAN_SHADOW_SCALE_SHIFT	3
 
-#if defined(CONFIG_MODULES) && defined(CONFIG_PPC32)
+#if defined(CONFIG_EXECMEM) && defined(CONFIG_PPC32)
 #define KASAN_KERN_START	ALIGN_DOWN(PAGE_OFFSET - SZ_256M, SZ_256M)
 #else
 #define KASAN_KERN_START	PAGE_OFFSET
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 647b0b445e89..edc479a7c2bc 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -199,12 +199,12 @@ instruction_counter:
 	mfspr	r10, SPRN_SRR0	/* Get effective address of fault */
 	INVALIDATE_ADJACENT_PAGES_CPU15(r10, r11)
 	mtspr	SPRN_MD_EPN, r10
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	mfcr	r11
 	compare_to_kernel_boundary r10, r10
 #endif
 	mfspr	r10, SPRN_M_TWB	/* Get level 1 table */
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	blt+	3f
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index c1d89764dd22..57196883a00e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -419,14 +419,14 @@ InstructionTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	rlwinm	r2, r2, 28, 0xfffff000
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	li	r0, 3
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
@@ -442,7 +442,7 @@ InstructionTLBMiss:
 	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-#ifdef CONFIG_MODULES
+#ifdef CONFIG_EXECMEM
 	rlwimi	r2, r0, 0, 31, 31	/* userspace ? -> PP lsb */
 #endif
 	ori	r1, r1, 0xe06		/* clear out reserved bits */
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..7af791446ddf 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -225,7 +225,7 @@ void __init poking_init(void)
 
 static unsigned long get_patch_pfn(void *addr)
 {
-	if (IS_ENABLED(CONFIG_MODULES) && is_vmalloc_or_module_addr(addr))
+	if (IS_ENABLED(CONFIG_EXECMEM) && is_vmalloc_or_module_addr(addr))
 		return vmalloc_to_pfn(addr);
 	else
 		return __pa_symbol(addr) >> PAGE_SHIFT;
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 100f999871bc..625fe7d08e06 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -184,7 +184,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 
 static bool is_module_segment(unsigned long addr)
 {
-	if (!IS_ENABLED(CONFIG_MODULES))
+	if (!IS_ENABLED(CONFIG_EXECMEM))
 		return false;
 	if (addr < ALIGN_DOWN(MODULES_VADDR, SZ_256M))
 		return false;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
