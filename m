Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49841C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoqbtXwhE4MjjNal5Mt0UdR5Gp0rH80XXiCinAUlS1o=; b=YtGZ5Ux66JFzpq
	z7S1T7qjLpXBzHoKvWjKB1XeEcri12A+ptaJLuiabArpZhXfroT9DZWSfUfxfZ9AmP8tJ2Hkd48J9
	v0T+1mPH4M0/6Yxp1YFkFMqtSt6fueyGJpeigYMjU3Vrn8XGo/yRkL8ZcObDmmzqwodIbvUxQVIU5
	6qJ+mYy9psUa3+6FEqEcivelbNEkvqi31PkqIi8oeZa5F4npg/3tN8jZzM4HDPYEs0TG/znsNgTOO
	dSv3iGhPzPoBEHikyJr1tf05WN6e5VI/JY70wq4Z3MHFYmyKk5SwBjejKyiabKgjvQLPceRvfO7T0
	Qw1Ho8UMfVEHrjXziyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mY5-001q4w-1N;
	Wed, 22 Nov 2023 12:41:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mY3-001q4g-2q
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 Nov 2023 12:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vZFD+CZhZ5/s+IhNoZs04yZO6ujN0gvtdoUyhzS1YLA=; b=pCObuymMRo2FhAIMtEx+vZ0GNP
	MDWcFft7pgFB9wq42UxzyziZsDkXq3sNFolqF/K2h/FCht5VrAPK5TbRLSDBic37QSYmi8YAW422c
	2RFsLNDszOUp68E9dYgaIwqSQMdfroCLISVhtW4JFvy6MJTXe8s+gNHL4F2Dh0TvilE5P/QPIkw19
	BDaukh00GAqCeKHAN8MgH28TdWkAEkJXn+K0DjbVwSsoXLG6ApQ+5dsgfNFWZtmYRmGQXxUsu3Fl7
	lzflQjNhsuQXgE7NWap3CLcq/FI8Nf/VK1dEF1xxjPURrfhgQ3fYCu9tJzjmyAT22ZBrMzHk7a/Bv
	auc4vcEw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mXv-00CJGw-1w;
	Wed, 22 Nov 2023 12:41:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 515E03006F6; Wed, 22 Nov 2023 13:41:34 +0100 (CET)
Date: Wed, 22 Nov 2023 13:41:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	davem@davemloft.net, dsahern@kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com,
	jolsa@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	samitolvanen@google.com, keescook@chromium.org, nathan@kernel.org,
	ndesaulniers@google.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	llvm@lists.linux.dev, jpoimboe@kernel.org, joao@overdrivepizza.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231122124134.GP4779@noisy.programming.kicks-ass.net>
References: <20231120144642.591358648@infradead.org>
 <20231120154948.708762225@infradead.org>
 <20231122021817.ggym3biyfeksiplo@macbook-pro-49.dhcp.thefacebook.com>
 <20231122111517.GR8262@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122111517.GR8262@noisy.programming.kicks-ass.net>
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

On Wed, Nov 22, 2023 at 12:15:17PM +0100, Peter Zijlstra wrote:

> Ah, so normally the __cfi_foo symbol would catch those, lemme see what I
> can do here.

I have the below delta (untested etc..), does that look about right?

---
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -845,19 +845,24 @@ enum cfi_mode cfi_mode __ro_after_init =
 #ifdef CONFIG_CFI_CLANG
 struct bpf_insn;
 
-extern unsigned int bpf_func_proto(const void *ctx,
-				   const struct bpf_insn *insn);
+/* Must match bpf_func_t / DEFINE_BPF_PROG_RUN() */
+extern unsigned int __bpf_prog_runX(const void *ctx,
+				    const struct bpf_insn *insn);
 
-__ADDRESSABLE(bpf_func_proto);
+/* 
+ * Force a reference to the external symbol so the compiler generates
+ * __kcfi_typid.
+ */
+__ADDRESSABLE(__bpf_prog_runX);
 
-/* u32 __ro_after_init cfi_bpf_hash = __kcfi_typeid_bpf_func_proto */
+/* u32 __ro_after_init cfi_bpf_hash = __kcfi_typeid___bpf_prog_runX */
 asm (
 "	.pushsection	.data..ro_after_init,\"aw\",@progbits	\n"
 "	.type	cfi_bpf_hash,@object				\n"
 "	.globl	cfi_bpf_hash					\n"
 "	.p2align	2, 0x0					\n"
 "cfi_bpf_hash:							\n"
-"	.long	__kcfi_typeid_bpf_func_proto			\n"
+"	.long	__kcfi_typeid___bpf_prog_runX			\n"
 "	.size	cfi_bpf_hash, 4					\n"
 "	.popsection						\n"
 );
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -308,15 +308,20 @@ static void pop_callee_regs(u8 **pprog,
 	*pprog = prog;
 }
 
+/*
+ * Emit the various CFI preambles, see the large comment about FineIBT
+ * in arch/x86/kernel/alternative.c
+ */
+
 static int emit_fineibt(u8 **pprog)
 {
 	u8 *prog = *pprog;
 
 	EMIT_ENDBR();
-	EMIT3_off32(0x41, 0x81, 0xea, cfi_bpf_hash);
-	EMIT2(0x74, 0x07);
-	EMIT2(0x0f, 0x0b);
-	EMIT1(0x90);
+	EMIT3_off32(0x41, 0x81, 0xea, cfi_bpf_hash);	/* subl $hash, %r10d	*/
+	EMIT2(0x74, 0x07);				/* jz.d8 +7		*/
+	EMIT2(0x0f, 0x0b);				/* ud2			*/
+	EMIT1(0x90);					/* nop			*/
 	EMIT_ENDBR_POISON();
 
 	*pprog = prog;
@@ -328,7 +333,7 @@ static int emit_kcfi(u8 **pprog)
 	u8 *prog = *pprog;
 	int offset = 5;
 
-	EMIT1_off32(0xb8, cfi_bpf_hash);
+	EMIT1_off32(0xb8, cfi_bpf_hash);		/* movl $hash, %eax	*/
 #ifdef CONFIG_CALL_PADDING
 	EMIT1(0x90);
 	EMIT1(0x90);
@@ -3009,6 +3014,10 @@ struct bpf_prog *bpf_int_jit_compile(str
 			jit_data->header = header;
 			jit_data->rw_header = rw_header;
 		}
+		/*
+		 * ctx.prog_offset is used when CFI preambles put code *before*
+		 * the function. See emit_cfi().
+		 */
 		prog->bpf_func = (void *)image + ctx.prog_offset;
 		prog->jited = 1;
 		prog->jited_len = proglen - ctx.prog_offset; // XXX?
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1431,6 +1431,9 @@ struct bpf_prog_aux {
 	struct bpf_kfunc_desc_tab *kfunc_tab;
 	struct bpf_kfunc_btf_tab *kfunc_btf_tab;
 	u32 size_poke_tab;
+#ifdef CONFIG_FINEIBT
+	struct bpf_ksym ksym_prefix;
+#endif
 	struct bpf_ksym ksym;
 	const struct bpf_prog_ops *ops;
 	struct bpf_map **used_maps;
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -683,6 +683,23 @@ void bpf_prog_kallsyms_add(struct bpf_pr
 	fp->aux->ksym.prog = true;
 
 	bpf_ksym_add(&fp->aux->ksym);
+
+#ifdef CONFIG_FINEIBT
+	/*
+	 * When FineIBT, code in the __cfi_foo() symbols can get executed
+	 * and hence unwinder needs help.
+	 */
+	if (cfi_mode != CFI_FINEIBT)
+		return;
+
+	snprintf(fp->aux->ksym_prefix.name, KSYM_NAME_LEN,
+		 "__cfi_%s", fp->aux->ksym.name);
+
+	prog->aux->ksym_prefix.start = (unsigned long) prog->bpf_func - 16;
+	prog->aux->ksym_prefix.end   = (unsigned long) prog->bpf_func;
+
+	bpf_ksym_add(&fp->aux->ksym_prefix);
+#endif
 }
 
 void bpf_prog_kallsyms_del(struct bpf_prog *fp)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
