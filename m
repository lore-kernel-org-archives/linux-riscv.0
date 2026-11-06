Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DF606D81D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NN1cAJ6h;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Rfj5wSUY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7lrh41LJpkfFZ8aSp5bhwRp7ZET+Q79xvUI5KKg/VB4=; b=NN1cAJ6hT3ejK7oj9ybHMjmdNz
	vLXWf1HesnzM/K9/ZyplsR6GpfRxlmfIMe0hHHSM2iM6fGnBQvlQeBwKpY1R9qiJKNA1xCspcMayG
	eHKhZvgyLc0eSrpSX7xGj2v4BMPixFn55pHFGuzQSdElvcQzLliOLfMvRsa3M850e8zvgaZAVBj2K
	PLEIU2u+GjklR+BFJLqA9U2JzH4ah8Y1Jhf9KXaz+AQgw4y/u6XsaGJefYoidK/JYm/lgQrWgne9T
	JpghIsTqtVNIAAHqAyEckK2DSVitMWdB1nSoPYVOakJajo+vkIX0DJhuzrBPLbHuVGv0RSQFM6s/P
	EQ9nwZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOU4-0000000DMuR-2zMe;
	Fri, 06 Nov 2026 18:16:16 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOTz-0000000DMqz-3q7v
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 18:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793988970; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z6xIF9DHq6VFbu+5doxEig+9nQ+rB8oTNPXSiectAtI=;
	b=Rfj5wSUYS27Pwbkr9EXiQNhmZZwYLt/DPkI+gYy7phy0J+TOMUjnMcjVFfTnaiDhgEIcDKjoPEG8d/4MKGCkKWRFaG2PXIf/BI94GphFZJoPccyNzWw1/ReBZOBdElQ/ZCG7HxWcYCfzpspaVk3eSUvmfcUie4+B4lE49E2tuq4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XECMC2K_1793988968;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XECMC2K_1793988968 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 07 Nov 2026 02:16:09 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org,
	alexei.starovoitov@gmail.com
Cc: eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	luke.r.nels@gmail.com,
	xi.wang@gmail.com,
	shuah@kernel.org,
	rgbi3307@gmail.com,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 bpf-next 1/3] riscv: bpf: Add BPF private stack support
Date: Sat,  7 Nov 2026 02:15:56 +0800
Message-ID: <20261106181558.1564-2-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106181558.1564-1-cp0613@linux.alibaba.com>
References: <20261106181558.1564-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_101612_441625_CFD06D2D 
X-CRM114-Status: GOOD (  23.24  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A program on a private stack keeps its BPF frames in a per-CPU area of
its own rather than on the kernel stack of whichever context entered it.
bpf_enable_priv_stack() grants that mode only once the JIT reports
bpf_jit_supports_private_stack(), which riscv64 did not: programs there
always ran on the kernel stack, and a struct_ops program that requires
one was rejected with -EACCES.

Allocate a per-CPU area of the verifier calculated depth plus a 16 byte
guard region at each end, and point BPF_REG_FP (S5) at the top of it
while leaving SP on the kernel stack. Every BPF stack access already
goes through S5, and S5 is callee-saved with each subprog deriving its
own, so nothing else in the JIT has to know about the private stack.

The outgoing stack argument area stays in the kernel frame: callers
write it relative to SP, callees relative to RV_REG_FP, which the
prologue sets to the caller's SP.

The per-CPU lookup is emitted after the tail call entry point: a program
using a private stack can still be entered as a tail call target, and
RV_TAILCALL_OFFSET is a constant added to the target's bpf_func, so what
is in front of it must be the same size in every program.

The base is materialized with absolute moves, as on arm64, x86-64 and
powerpc64: the vmalloc'd per-CPU area is beyond an auipc pair from the
JIT region, and riscv64 has no register holding the per-CPU offset, so
the address of __per_cpu_offset is loaded too. emit_imm() is a choice
there, not a requirement; emit_addr() as used by
insn_is_mov_percpu_addr() would need an extra_pass argument and an error
return in bpf_jit_build_prologue(), touching bpf_jit_comp32.c too. Both
constants are fixed before the offset convergence loop, so the prologue
length is stable across passes.

The guard value follows arm64, x86-64 and powerpc64, and the 16 byte
two-copy region at each end follows arm64 and powerpc64, since x86-64
uses an 8 byte guard with a single copy. A jited program has them
checked when it is freed, reporting the first corrupted CPU only;
failure paths release the area unchecked since the image never ran,
which also clears priv_stack_ptr for the later bpf_jit_free().

RV32 does not declare support and keeps the existing kernel stack
behaviour.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        |  2 +
 arch/riscv/net/bpf_jit_comp64.c | 42 +++++++++++++++--
 arch/riscv/net/bpf_jit_core.c   | 82 +++++++++++++++++++++++++++++----
 3 files changed, 114 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 21a190a6a6d9..dbe1ac8cd0de 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -14,6 +14,8 @@
 
 #define RV_MAX_REG_ARGS		8
 #define RV_EXTRA_STK_ARGS	(RV_MAX_REG_ARGS - MAX_BPF_FUNC_REG_ARGS)
+#define PRIV_STACK_GUARD_SZ	16
+#define PRIV_STACK_GUARD_VAL	0xEB9F12345678eb9fULL
 
 /* verify runtime detection extension status */
 #define rv_ext_enabled(ext) \
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 371405598faa..a7a7d2f9da85 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -2134,12 +2134,34 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	return 0;
 }
 
+static void emit_priv_stack_frame(struct rv_jit_context *ctx)
+{
+	u64 fp = (__force u64)ctx->prog->aux->priv_stack_ptr + PRIV_STACK_GUARD_SZ;
+
+	fp += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
+	emit_imm(RV_REG_S5, fp, ctx);
+#ifdef CONFIG_SMP
+	emit_lw(RV_REG_T1, offsetof(struct thread_info, cpu), RV_REG_TP, ctx);
+	emit_imm(RV_REG_T2, (u64)__per_cpu_offset, ctx);
+	emit_sh3add(RV_REG_T1, RV_REG_T1, RV_REG_T2, ctx);
+	emit_ld(RV_REG_T1, 0, RV_REG_T1, ctx);
+	emit_add(RV_REG_S5, RV_REG_S5, RV_REG_T1, ctx);
+#endif
+}
+
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
+	bool priv_stack = ctx->prog->aux->priv_stack_ptr;
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust = ctx->stack_arg_sz;
 
-	bpf_stack_adjust += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
-	if (bpf_stack_adjust)
+	/*
+	 * With a private stack only the outgoing stack argument area is left in
+	 * this frame. It has to stay: the caller writes it relative to SP while
+	 * the callee reads it relative to RV_REG_FP, the caller's SP set below.
+	 */
+	if (!priv_stack)
+		bpf_stack_adjust += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
+	if (bpf_stack_adjust || priv_stack)
 		mark_fp(ctx);
 
 	if (seen_reg(RV_REG_RA, ctx))
@@ -2217,7 +2239,16 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
-	if (bpf_stack_adjust)
+	/*
+	 * Point BPF_REG_FP at the top of this CPU's private stack. A program
+	 * with one can still be entered as a tail call target, at
+	 * RV_TAILCALL_OFFSET, so this has to come after that entry point; the
+	 * offset is a constant added to the target's bpf_func, so everything in
+	 * front of it must also be the same size in every program.
+	 */
+	if (priv_stack)
+		emit_priv_stack_frame(ctx);
+	else if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
 
 	ctx->stack_size = stack_adjust;
@@ -2320,3 +2351,8 @@ bool bpf_jit_supports_hmul(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_private_stack(void)
+{
+	return true;
+}
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index f2497ec7d378..138e9fa90963 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -9,6 +9,7 @@
 #include <linux/bpf.h>
 #include <linux/filter.h>
 #include <linux/memory.h>
+#include <linux/percpu.h>
 #include <asm/text-patching.h>
 #include <asm/cfi.h>
 #include "bpf_jit.h"
@@ -44,6 +45,60 @@ bool bpf_jit_needs_zext(void)
 	return true;
 }
 
+static u32 priv_stack_size(struct bpf_prog *prog)
+{
+	return round_up(prog->aux->stack_depth, STACK_ALIGN) +
+	       2 * PRIV_STACK_GUARD_SZ;
+}
+
+static int alloc_priv_stack(struct bpf_prog *prog)
+{
+	u32 size = priv_stack_size(prog);
+	u32 end = (size - PRIV_STACK_GUARD_SZ) / sizeof(u64);
+	void __percpu *ptr;
+	int cpu, i;
+
+	ptr = __alloc_percpu_gfp(size, STACK_ALIGN, GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		u64 *stack = per_cpu_ptr(ptr, cpu);
+
+		for (i = 0; i < PRIV_STACK_GUARD_SZ / sizeof(u64); i++) {
+			stack[i] = PRIV_STACK_GUARD_VAL;
+			stack[end + i] = PRIV_STACK_GUARD_VAL;
+		}
+	}
+	prog->aux->priv_stack_ptr = ptr;
+	return 0;
+}
+
+static void priv_stack_check_guard(struct bpf_prog *prog)
+{
+	u32 end = (priv_stack_size(prog) - PRIV_STACK_GUARD_SZ) / sizeof(u64);
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		u64 *stack = per_cpu_ptr(prog->aux->priv_stack_ptr, cpu);
+
+		if (stack[0] != PRIV_STACK_GUARD_VAL ||
+		    stack[1] != PRIV_STACK_GUARD_VAL ||
+		    stack[end] != PRIV_STACK_GUARD_VAL ||
+		    stack[end + 1] != PRIV_STACK_GUARD_VAL) {
+			pr_err("bpf-jit: private stack overflow/underflow guard of prog %s corrupted on CPU %d\n",
+			       bpf_jit_get_prog_name(prog), cpu);
+			return;
+		}
+	}
+}
+
+static void free_priv_stack(struct bpf_prog *prog)
+{
+	free_percpu(prog->aux->priv_stack_ptr);
+	prog->aux->priv_stack_ptr = NULL;
+}
+
 struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_prog *prog)
 {
 	unsigned int prog_size = 0, extable_size = 0;
@@ -84,12 +139,15 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 			    round_up((stack_arg_cnt - RV_EXTRA_STK_ARGS) * 8, STACK_ALIGN) : 0;
 
 	ctx->prog = prog;
+	if (prog->aux->jits_use_priv_stack && alloc_priv_stack(prog))
+		goto out_free_hdr;
+
 	ctx->offset = kvzalloc_objs(int, prog->len);
 	if (!ctx->offset)
-		goto out_offset;
+		goto out_free_hdr;
 
 	if (build_body(ctx, extra_pass, NULL))
-		goto out_offset;
+		goto out_free_hdr;
 
 	for (i = 0; i < prog->len; i++) {
 		prev_ninsns += 32;
@@ -104,7 +162,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		ctx->prologue_len = ctx->ninsns;
 
 		if (build_body(ctx, extra_pass, ctx->offset))
-			goto out_offset;
+			goto out_free_hdr;
 
 		ctx->epilogue_offset = ctx->ninsns;
 		bpf_jit_build_epilogue(ctx);
@@ -124,7 +182,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 							  bpf_fill_ill_insns,
 							  bpf_prog_was_classic(prog));
 			if (!jit_data->ro_header)
-				goto out_offset;
+				goto out_free_hdr;
 
 			/*
 			 * Use the image(RW) for writing the JITed instructions. But also save
@@ -190,10 +248,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 			ctx->offset[i] = ctx->offset[i - 1];
 		ctx->offset[0] = ninsns_rvoff(ctx->prologue_len);
 		bpf_prog_update_insn_ptrs(prog, ctx->offset, jit_data->ro_image);
-out_offset:
-		kvfree(ctx->offset);
-		kfree(jit_data);
-		prog->aux->jit_data = NULL;
+		goto out_free_ctx;
 	}
 
 	return prog;
@@ -209,7 +264,12 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 				   sizeof(jit_data->header->size));
 		bpf_jit_binary_pack_free(jit_data->ro_header, jit_data->header);
 	}
-	goto out_offset;
+	free_priv_stack(prog);
+out_free_ctx:
+	kvfree(ctx->offset);
+	kfree(jit_data);
+	prog->aux->jit_data = NULL;
+	return prog;
 }
 
 u64 bpf_jit_alloc_exec_limit(void)
@@ -261,6 +321,10 @@ void bpf_jit_free(struct bpf_prog *prog)
 		prog->bpf_func = (void *)prog->bpf_func - cfi_get_offset();
 		hdr = bpf_jit_binary_pack_hdr(prog);
 		bpf_jit_binary_pack_free(hdr, NULL);
+		if (prog->aux->priv_stack_ptr) {
+			priv_stack_check_guard(prog);
+			free_priv_stack(prog);
+		}
 		WARN_ON_ONCE(!bpf_prog_kallsyms_verify_off(prog));
 	}
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
