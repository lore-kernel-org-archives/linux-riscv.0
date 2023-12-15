Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B57C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=nBja2yVbXQFNZvw8oVb6iRmkBc48i3gwUjUZJeKZZWc=; b=DRMgwverABxZsJ
	rTEIsyBJBhXzfdarMDT5AqNt3fRmJhs5EGPIDzS/3Qe5PmYjetZaJCsaZRUohvXI32wIdwg6Ki/hf
	b0QO/VJ9nD0UZw9zbLJB5q2Ui2aVy268v8DTFht6zkTjL1gt9kHlBLJTSq98UocQO4Dzfas3roXoa
	d7At7iYxMoJak9SkhZBsdAZFWNMUwx9t9Y+JsWbYQ/LMZW0Jcrhj0HUADzKLfgWRb5n/zqo2hqyWf
	KVnzJDoCm7sLgbVbQCU/1pd+bY5JRA6O3KdJylgH1oqW9XMwbVA8pIPotVxaJvyvNPI2Zq+qQ4FDe
	SmksnYQg9DZk2Cscwh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZP-002dZZ-2H;
	Fri, 15 Dec 2023 09:33:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZM-002dYg-22
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 09:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=z79WJTlUkpGdsrYGZxRofGTWpjl5gntweNg1HQWKrSY=; b=BKTY9C+YqD87P54owc5F7b/Qn0
	UQ7eqYLs8JXjLvGcrgMXgzA1mB5IRjRx7oambwG+fguM5VRL8jgy8NuT/pVOaMbNQ28W9Zsu5gXkv
	GxAlZtOMKilcoqkIzW1weuxThEKpLS2idiB9L7vznPnbIwA3laTCWDkli8FoBfPoV/NLMoR0yRid0
	oXnsQTNdNPK90SrKYQaH1kXrZyqo9Zj8IrtQH2KoOCitrlUzD9Tb6wpg6kkOWUGgdJqarNsDQkrL7
	37FbfJe680BaRWDccu5O5vQRHIK1Bd2TsCV1DKwJ7UDzae8DkOkZQJumJ6D7ZYt0HW05qAWNdOz1H
	yHv/QUfg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rE4ZD-00FSOV-HC; Fri, 15 Dec 2023 09:33:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id CB29B3006DD; Fri, 15 Dec 2023 10:33:11 +0100 (CET)
Message-Id: <20231215092707.451956710@infradead.org>
User-Agent: quilt/0.65
Date: Fri, 15 Dec 2023 10:12:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 davem@davemloft.net,
 dsahern@kernel.org,
 daniel@iogearbox.net,
 andrii@kernel.org,
 martin.lau@linux.dev,
 song@kernel.org,
 yonghong.song@linux.dev,
 john.fastabend@gmail.com,
 kpsingh@kernel.org,
 sdf@google.com,
 haoluo@google.com,
 jolsa@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 samitolvanen@google.com,
 keescook@chromium.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 jpoimboe@kernel.org,
 joao@overdrivepizza.com,
 mark.rutland@arm.com,
 peterz@infradead.org
Subject: [PATCH v3 3/7] x86/cfi,bpf: Fix bpf_callback_t CFI
References: <20231215091216.135791411@infradead.org>
MIME-Version: 1.0
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

Where the main BPF program is expected to match bpf_func_t,
sub-programs are expected to match bpf_callback_t.

This fixes things like:

tools/testing/selftests/bpf/progs/bloom_filter_bench.c:

           bpf_for_each_map_elem(&array_map, bloom_callback, &data, 0);

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/cfi.h    |    2 ++
 arch/x86/kernel/alternative.c |   18 ++++++++++++++++++
 arch/x86/net/bpf_jit_comp.c   |   18 ++++++++++--------
 3 files changed, 30 insertions(+), 8 deletions(-)

--- a/arch/x86/include/asm/cfi.h
+++ b/arch/x86/include/asm/cfi.h
@@ -106,6 +106,7 @@ struct pt_regs;
 enum bug_trap_type handle_cfi_failure(struct pt_regs *regs);
 #define __bpfcall
 extern u32 cfi_bpf_hash;
+extern u32 cfi_bpf_subprog_hash;
 
 static inline int cfi_get_offset(void)
 {
@@ -128,6 +129,7 @@ static inline enum bug_trap_type handle_
 	return BUG_TRAP_TYPE_NONE;
 }
 #define cfi_bpf_hash 0U
+#define cfi_bpf_subprog_hash 0U
 #endif /* CONFIG_CFI_CLANG */
 
 #endif /* _ASM_X86_CFI_H */
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -866,6 +866,23 @@ asm (
 "	.size	cfi_bpf_hash, 4					\n"
 "	.popsection						\n"
 );
+
+/* Must match bpf_callback_t */
+extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
+
+__ADDRESSABLE(__bpf_callback_fn);
+
+/* u32 __ro_after_init cfi_bpf_subprog_hash = __kcfi_typeid___bpf_callback_fn; */
+asm (
+"	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
+"	.type	cfi_bpf_subprog_hash,@object			\n"
+"	.globl	cfi_bpf_subprog_hash				\n"
+"	.p2align	2, 0x0					\n"
+"cfi_bpf_subprog_hash:						\n"
+"	.long	__kcfi_typeid___bpf_callback_fn			\n"
+"	.size	cfi_bpf_subprog_hash, 4				\n"
+"	.popsection						\n"
+);
 #endif
 
 #ifdef CONFIG_FINEIBT
@@ -1181,6 +1198,7 @@ static void __apply_fineibt(s32 *start_r
 		if (builtin) {
 			cfi_seed = get_random_u32();
 			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
+			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
 
 		ret = cfi_rand_preamble(start_cfi, end_cfi);
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -312,12 +312,13 @@ static void pop_callee_regs(u8 **pprog,
  * in arch/x86/kernel/alternative.c
  */
 
-static void emit_fineibt(u8 **pprog)
+static void emit_fineibt(u8 **pprog, bool is_subprog)
 {
+	u32 hash = is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash;
 	u8 *prog = *pprog;
 
 	EMIT_ENDBR();
-	EMIT3_off32(0x41, 0x81, 0xea, cfi_bpf_hash);	/* subl $hash, %r10d	*/
+	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
 	EMIT2(0x74, 0x07);				/* jz.d8 +7		*/
 	EMIT2(0x0f, 0x0b);				/* ud2			*/
 	EMIT1(0x90);					/* nop			*/
@@ -326,11 +327,12 @@ static void emit_fineibt(u8 **pprog)
 	*pprog = prog;
 }
 
-static void emit_kcfi(u8 **pprog)
+static void emit_kcfi(u8 **pprog, bool is_subprog)
 {
+	u32 hash = is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash;
 	u8 *prog = *pprog;
 
-	EMIT1_off32(0xb8, cfi_bpf_hash);		/* movl $hash, %eax	*/
+	EMIT1_off32(0xb8, hash);			/* movl $hash, %eax	*/
 #ifdef CONFIG_CALL_PADDING
 	EMIT1(0x90);
 	EMIT1(0x90);
@@ -349,17 +351,17 @@ static void emit_kcfi(u8 **pprog)
 	*pprog = prog;
 }
 
-static void emit_cfi(u8 **pprog)
+static void emit_cfi(u8 **pprog, bool is_subprog)
 {
 	u8 *prog = *pprog;
 
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
-		emit_fineibt(&prog);
+		emit_fineibt(&prog, is_subprog);
 		break;
 
 	case CFI_KCFI:
-		emit_kcfi(&prog);
+		emit_kcfi(&prog, is_subprog);
 		break;
 
 	default:
@@ -381,7 +383,7 @@ static void emit_prologue(u8 **pprog, u3
 {
 	u8 *prog = *pprog;
 
-	emit_cfi(&prog);
+	emit_cfi(&prog, is_subprog);
 	/* BPF trampoline can be made to work without these nops,
 	 * but let's waste 5 bytes for now and optimize later
 	 */



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
