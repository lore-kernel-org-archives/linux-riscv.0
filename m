Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE3BC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oZnAaNsv8aPMKfBpr7gp7gLVi0OHzXZohWdz4/7zkk=; b=JzB4Udsm8MUqw3
	sgGuS/dIO85sSRQfqo0D2/W6Xne4SaPpmRXuwFtyobbKO10AaopsuUShLP3N8I8hjIH34NewFiVJL
	9oxGsUsTWZ6GQ3koq3nULWFoNfdJt81/jPRnZSE/dJCf4JhhofTwVQra1oJGZUBwTkIXYlICD1y4e
	SaOOkkKxupZYFs/v8/bQSGGj8bRxmdaK0FReJK8a1z7ppbJQBplskkLU06Cv73tVkZ5uVbyNjtWLJ
	qhixwgF1DDSKXAHQgI+eIKTmJrHU2VK83rN8VKKgy0tsDRsymmqPw2jnvnUuruYpMDtZSngo8aK4p
	xdFkknu6TSorLR0IUjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0H14-0000000BhBX-0qis;
	Fri, 26 Apr 2024 08:33:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0GzI-0000000Bfze-18R6;
	Fri, 26 Apr 2024 08:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B96FCE1BD8;
	Fri, 26 Apr 2024 08:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D06EC32782;
	Fri, 26 Apr 2024 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714120276;
	bh=QWGTfmxM6u4L/G8sJRSYS9LtFcq3UHArwE9pGA7ZHH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SmvyMUmeeEFrWhUbUHKYn4DMMnLUUa1g4+adu28RzctMKycdCQJleanPBw3qpvC6e
	 AXnB3fL3Y+frY4KjxDxYGEctRsFjDHtgJpKUgakhljuTLQyByVrPoqm8yiw/ese+Sw
	 3AINiEao90grvB42lX+M49xK2vOiscW+CXPmMzHjO1X9apGHPz/G5s/ugtCXfPjwN9
	 214UPXOSJDw2q4YRsmzMcVl4U8SiTEGKs66FQ/JJXbBMCpYr8IcUINJH7HXTRFtQYE
	 XiSs76Z4km7d/H9zgVIB5QWLIoEWTs/cZi94+ScfkrPABGeDB46pF5CGfvdU8JqSEh
	 +esHXQ/w0RQ+A==
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
Subject: [PATCH v6 11/16] powerpc: extend execmem_params for kprobes allocations
Date: Fri, 26 Apr 2024 11:28:49 +0300
Message-ID: <20240426082854.7355-12-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426082854.7355-1-rppt@kernel.org>
References: <20240426082854.7355-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_013120_756977_220F9240 
X-CRM114-Status: GOOD (  14.48  )
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

powerpc overrides kprobes::alloc_insn_page() to remove writable
permissions when STRICT_MODULE_RWX is on.

Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
generic kprobes::alloc_insn_page() with the desired permissions.

As powerpc uses breakpoint instructions to inject kprobes, it does not
need to constrain kprobe allocations to the modules area and can use the
entire vmalloc address space.

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/powerpc/kernel/kprobes.c | 20 --------------------
 arch/powerpc/kernel/module.c  |  7 +++++++
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 9fcd01bb2ce6..14c5ddec3056 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -126,26 +126,6 @@ kprobe_opcode_t *arch_adjust_kprobe_addr(unsigned long addr, unsigned long offse
 	return (kprobe_opcode_t *)(addr + offset);
 }
 
-void *alloc_insn_page(void)
-{
-	void *page;
-
-	page = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
-	if (!page)
-		return NULL;
-
-	if (strict_module_rwx_enabled()) {
-		int err = set_memory_rox((unsigned long)page, 1);
-
-		if (err)
-			goto error;
-	}
-	return page;
-error:
-	execmem_free(page);
-	return NULL;
-}
-
 int arch_prepare_kprobe(struct kprobe *p)
 {
 	int ret = 0;
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index ac80559015a3..2a23cf7e141b 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -94,6 +94,7 @@ static struct execmem_info execmem_info __ro_after_init;
 
 struct execmem_info __init *execmem_arch_setup(void)
 {
+	pgprot_t kprobes_prot = strict_module_rwx_enabled() ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
 	pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
 	unsigned long fallback_start = 0, fallback_end = 0;
 	unsigned long start, end;
@@ -132,6 +133,12 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.fallback_start	= fallback_start,
 				.fallback_end	= fallback_end,
 			},
+			[EXECMEM_KPROBES] = {
+				.start	= VMALLOC_START,
+				.end	= VMALLOC_END,
+				.pgprot	= kprobes_prot,
+				.alignment = 1,
+			},
 			[EXECMEM_MODULE_DATA] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
