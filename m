Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891DBC10F16
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wbtPP6mF+syqR4f4BaDiuUJUUxii1jCWwuW+RF00lY=; b=WGAI1o+lBIrZ+G
	LOeRcq/MMjyI1X6k4iTwBmMXw2y+Z9TciP+sPkWSwhTruaKVkjt+HhPgZxaO7ldMFKUdMZgZQMzJN
	9R+o5fqizOeEAzktsHZYNDnJnA4HlUQzPZUkIkQ8OmTCK/xTDypMkc4wVGUTm6pr0lVgI9lRtXOvF
	CZGxqqElGH875xitxHfnNnWwH5aQfy98SSt3OFuTY7k1H0vnfvQyoRdEjAuJNRKdcsVJpnGGt7mIF
	p93fXAkO46NdEIeaIW6fHKnuejpK/JMR8migQhS20lftuwUUmZ81a9z7igTaXJAh4+SZyc6DQyV2/
	g7Wth7Z8RQS68oI3HkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypMt-0000000Ck6d-2TFx;
	Mon, 22 Apr 2024 08:49:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypMN-0000000Cjgk-3dId;
	Mon, 22 Apr 2024 08:49:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DE03ECE0AB9;
	Mon, 22 Apr 2024 08:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4061CC4AF0E;
	Mon, 22 Apr 2024 08:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713775749;
	bh=rAIWAHsYUw427kTFrCCQC+4mkWqWWUZB9Zh1fdelySY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dn71W4OKd+E1jU8AOQO3vEqkED6NiiJx01MbqH7O6BhJ6ul5CWzoHVwmfA1PUzgIK
	 SSKpbfA2M/8pGqRyM5fdHCHVDbKkL2Cjtrmo11M6nhzExDz2TxeHXHEzkpf40NxY4P
	 dYjsztuczcVmu9C1LsjYL3hbvTcfrQxixUL5HNhC/T+qB7NtRwxqLdJdbRINKIBbE4
	 N1G6niXAZn35JtrVFjaECk4Sp6vRe+YX08Eg45GrlnXbyrNv0dojoYMa1K1yT8TkP6
	 3cbk92qOHGiqlX2X86q18VjvsOa3FtgB9mlTJMEv1W9hFwmHPX5ikgDEmFooBfN/WN
	 XY3RRXrhX0gxw==
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
Subject: [PATCH v5 09/15] riscv: extend execmem_params for generated code allocations
Date: Mon, 22 Apr 2024 11:47:17 +0300
Message-ID: <20240422084717.3602332-9-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240422084717.3602332-1-rppt@kernel.org>
References: <20240422084717.3602332-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_014912_914657_D635C83D 
X-CRM114-Status: GOOD (  13.41  )
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

The memory allocations for kprobes and BPF on RISC-V are not placed in
the modules area and these custom allocations are implemented with
overrides of alloc_insn_page() and  bpf_jit_alloc_exec().

Slightly reorder execmem_params initialization to support both 32 and 64
bit variants, define EXECMEM_KPROBES and EXECMEM_BPF ranges in
riscv::execmem_params and drop overrides of alloc_insn_page() and
bpf_jit_alloc_exec().

Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/module.c         | 28 +++++++++++++++++++++++++---
 arch/riscv/kernel/probes/kprobes.c | 10 ----------
 arch/riscv/net/bpf_jit_core.c      | 13 -------------
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 182904127ba0..2ecbacbc9993 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -906,19 +906,41 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	return 0;
 }
 
-#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
+#ifdef CONFIG_MMU
 static struct execmem_info execmem_info __ro_after_init;
 
 struct execmem_info __init *execmem_arch_setup(void)
 {
+	unsigned long start, end;
+
+	if (IS_ENABLED(CONFIG_64BIT)) {
+		start = MODULES_VADDR;
+		end = MODULES_END;
+	} else {
+		start = VMALLOC_START;
+		end = VMALLOC_END;
+	}
+
 	execmem_info = (struct execmem_info){
 		.ranges = {
 			[EXECMEM_DEFAULT] = {
-				.start	= MODULES_VADDR,
-				.end	= MODULES_END,
+				.start	= start,
+				.end	= end,
 				.pgprot	= PAGE_KERNEL,
 				.alignment = 1,
 			},
+			[EXECMEM_KPROBES] = {
+				.start	= VMALLOC_START,
+				.end	= VMALLOC_END,
+				.pgprot	= PAGE_KERNEL_READ_EXEC,
+				.alignment = 1,
+			},
+			[EXECMEM_BPF] = {
+				.start	= BPF_JIT_REGION_START,
+				.end	= BPF_JIT_REGION_END,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = PAGE_SIZE,
+			},
 		},
 	};
 
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 2f08c14a933d..e64f2f3064eb 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -104,16 +104,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	return 0;
 }
 
-#ifdef CONFIG_MMU
-void *alloc_insn_page(void)
-{
-	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
-				     GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
-				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				     __builtin_return_address(0));
-}
-#endif
-
 /* install breakpoint in text */
 void __kprobes arch_arm_kprobe(struct kprobe *p)
 {
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 6b3acac30c06..e238fdbd5dbc 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -219,19 +219,6 @@ u64 bpf_jit_alloc_exec_limit(void)
 	return BPF_JIT_REGION_SIZE;
 }
 
-void *bpf_jit_alloc_exec(unsigned long size)
-{
-	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
-				    BPF_JIT_REGION_END, GFP_KERNEL,
-				    PAGE_KERNEL, 0, NUMA_NO_NODE,
-				    __builtin_return_address(0));
-}
-
-void bpf_jit_free_exec(void *addr)
-{
-	return vfree(addr);
-}
-
 void *bpf_arch_text_copy(void *dst, void *src, size_t len)
 {
 	int ret;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
