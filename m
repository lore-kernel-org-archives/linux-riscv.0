Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA12C44500
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 13:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGuxGaP43zeJbfBk0lQ2oqptF7EBLAiJL6FOBxgln8Q=; b=qZpiFoHzq6VibG
	vew7etzWubneVZecck4IvmGZCb99gw0r9ENdfTugQOKSmo/0u1GynEG7cT6coI0IvPFF+N/KUoBT6
	QulIMxaoD81nMiFa9aAKtiUxHyJnT9NxlPm9rt85GmNz7gazCEWe4KK3K6Z5+fmQe+q6zOzYrx8xh
	HvwfZH3eBtLeGrUU2M9uTw/fh6PVdaLBx+HyRa19VmtVIsRkYsQULZgiSlMmeP2Y2jrXzF7Ii0quP
	NqFcKW0vMSDN/U0YdMc2BKac0fFvGlq4+JiMMq6CdL7idDlm//rhjadBWJDFgoIzlDZzaJrXxSPqa
	SGfKm3ga990uUGYxbpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTo-0000000Ens3-1h19;
	Mon, 29 Jun 2026 13:56:56 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weCTj-0000000Enn7-1Vo6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 13:56:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gpnqQ5nVWzYQv0Q
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:55:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id EDCC140942
	for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 21:56:37 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgCXBfOUeUJqDlQCAQ--.44260S7;
	Mon, 29 Jun 2026 21:56:37 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v4 5/6] riscv, bpf: Mixing bpf2bpf and tailcalls
Date: Mon, 29 Jun 2026 14:00:47 +0000
Message-Id: <20260629140048.733346-6-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629140048.733346-1-pulehui@huaweicloud.com>
References: <20260629140048.733346-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: Syh0CgCXBfOUeUJqDlQCAQ--.44260S7
X-Coremail-Antispam: 1UD129KBjvJXoW3KF48XF1kZF1DKrW3CF4DJwb_yoWkWw4xp3
	4kKw4SkFW0qa15AFZrGF1DX3WYkw4vvFnIkryfK393Aa1qq3s5G3WxKa1YvFy5CryrZw1x
	Xr4qywnIga17J3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_065651_756839_E255ED40 
X-CRM114-Status: GOOD (  22.25  )
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

From: Pu Lehui <pulehui@huawei.com>

In the current RV64 JIT, if we just don't initialize the TCC in subprog,
the TCC can be propagated from the parent process to the subprocess, but
the updated TCC of the parent process cannot be restored when the
subprocess exits. Since the RV64 TCC is initialized before saving the
callee saved registers into the stack, we cannot use the callee saved
register to pass the TCC, otherwise the original value of the callee
saved register will be destroyed. So we implemented mixing bpf2bpf and
tailcalls similar to x86_64, i.e. using a non-callee saved register to
transfer the TCC between functions, and saving that register to the
stack to protect the TCC value. As for the tailcall hierarchy issue,
inspired by the s390's low-overhead approach, we store TCC from
RV_REG_TCC back to stack after calling bpf2bpf call or calling orig bpf
func in bpf trampoline.

Tests test_bpf.ko and test_verifier have passed, as well as the relative
testcases of test_progs*.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        |   1 +
 arch/riscv/net/bpf_jit_comp64.c | 106 +++++++++++++++-----------------
 2 files changed, 52 insertions(+), 55 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index da0271790244..419b9d795f2a 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -81,6 +81,7 @@ struct rv_jit_context {
 	int ex_jmp_off;
 	unsigned long flags;
 	int stack_size;
+	int tcc_offset;
 	u64 arena_vm_start;
 	u64 user_vm_start;
 };
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c239696cca64..384b490c4857 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -25,7 +25,6 @@
 #define RV_TAILCALL_OFFSET ((RV_KCFI_NINSNS + RV_FENTRY_NINSNS + 1) * 4)
 
 #define RV_REG_TCC RV_REG_A6
-#define RV_REG_TCC_SAVED RV_REG_S6 /* Store A6 in S6 if program do calls */
 #define RV_REG_ARENA RV_REG_S7 /* For storing arena_vm_start */
 
 static const int regmap[] = {
@@ -59,14 +58,12 @@ static const int pt_regmap[] = {
 };
 
 enum {
-	RV_CTX_F_SEEN_TAIL_CALL =	0,
 	RV_CTX_F_SEEN_CALL =		RV_REG_RA,
 	RV_CTX_F_SEEN_S1 =		RV_REG_S1,
 	RV_CTX_F_SEEN_S2 =		RV_REG_S2,
 	RV_CTX_F_SEEN_S3 =		RV_REG_S3,
 	RV_CTX_F_SEEN_S4 =		RV_REG_S4,
 	RV_CTX_F_SEEN_S5 =		RV_REG_S5,
-	RV_CTX_F_SEEN_S6 =		RV_REG_S6,
 };
 
 static u8 bpf_to_rv_reg(int bpf_reg, struct rv_jit_context *ctx)
@@ -79,7 +76,6 @@ static u8 bpf_to_rv_reg(int bpf_reg, struct rv_jit_context *ctx)
 	case RV_CTX_F_SEEN_S3:
 	case RV_CTX_F_SEEN_S4:
 	case RV_CTX_F_SEEN_S5:
-	case RV_CTX_F_SEEN_S6:
 		__set_bit(reg, &ctx->flags);
 	}
 	return reg;
@@ -94,7 +90,6 @@ static bool seen_reg(int reg, struct rv_jit_context *ctx)
 	case RV_CTX_F_SEEN_S3:
 	case RV_CTX_F_SEEN_S4:
 	case RV_CTX_F_SEEN_S5:
-	case RV_CTX_F_SEEN_S6:
 		return test_bit(reg, &ctx->flags);
 	}
 	return false;
@@ -110,32 +105,6 @@ static void mark_call(struct rv_jit_context *ctx)
 	__set_bit(RV_CTX_F_SEEN_CALL, &ctx->flags);
 }
 
-static bool seen_call(struct rv_jit_context *ctx)
-{
-	return test_bit(RV_CTX_F_SEEN_CALL, &ctx->flags);
-}
-
-static void mark_tail_call(struct rv_jit_context *ctx)
-{
-	__set_bit(RV_CTX_F_SEEN_TAIL_CALL, &ctx->flags);
-}
-
-static bool seen_tail_call(struct rv_jit_context *ctx)
-{
-	return test_bit(RV_CTX_F_SEEN_TAIL_CALL, &ctx->flags);
-}
-
-static u8 rv_tail_call_reg(struct rv_jit_context *ctx)
-{
-	mark_tail_call(ctx);
-
-	if (seen_call(ctx)) {
-		__set_bit(RV_CTX_F_SEEN_S6, &ctx->flags);
-		return RV_REG_S6;
-	}
-	return RV_REG_A6;
-}
-
 static bool is_32b_int(s64 val)
 {
 	return -(1L << 31) <= val && val < (1L << 31);
@@ -260,10 +229,6 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 		emit_ld(RV_REG_S5, store_offset, RV_REG_SP, ctx);
 		store_offset -= 8;
 	}
-	if (seen_reg(RV_REG_S6, ctx)) {
-		emit_ld(RV_REG_S6, store_offset, RV_REG_SP, ctx);
-		store_offset -= 8;
-	}
 	if (ctx->arena_vm_start) {
 		emit_ld(RV_REG_ARENA, store_offset, RV_REG_SP, ctx);
 		store_offset -= 8;
@@ -355,7 +320,6 @@ static void emit_branch(u8 cond, u8 rd, u8 rs, int rvoff,
 static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 {
 	int tc_ninsn, off, start_insn = ctx->ninsns;
-	u8 tcc = rv_tail_call_reg(ctx);
 
 	/* a0: &ctx
 	 * a1: &array
@@ -378,7 +342,8 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	/* if (--TCC < 0)
 	 *     goto out;
 	 */
-	emit_addi(RV_REG_TCC, tcc, -1, ctx);
+	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+	emit_addi(RV_REG_TCC, RV_REG_TCC, -1, ctx);
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JSLT, RV_REG_TCC, RV_REG_ZERO, off, ctx);
 
@@ -394,6 +359,9 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JEQ, RV_REG_T2, RV_REG_ZERO, off, ctx);
 
+	/* store updated TCC back to stack */
+	emit_sd(RV_REG_SP, ctx->tcc_offset, RV_REG_TCC, ctx);
+
 	/* goto *(prog->bpf_func + RV_TAILCALL_OFFSET); */
 	off = offsetof(struct bpf_prog, bpf_func);
 	if (is_12b_check(off, insn))
@@ -1028,7 +996,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	int i, ret, offset;
 	int *branches_off = NULL;
 	int stack_size = 0, nr_arg_slots = 0;
-	int retval_off, args_off, func_meta_off, ip_off, run_ctx_off, sreg_off, stk_arg_off;
+	int retval_off, args_off, func_meta_off, ip_off;
+	int run_ctx_off, sreg_off, stk_arg_off, tcc_off;
 	int cookie_off, cookie_cnt;
 	struct bpf_tramp_nodes *fentry = &tnodes[BPF_TRAMP_FENTRY];
 	struct bpf_tramp_nodes *fexit = &tnodes[BPF_TRAMP_FEXIT];
@@ -1079,6 +1048,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	 *
 	 * FP - sreg_off    [ callee saved reg	]
 	 *
+	 * FP - tcc_off     [ tail call count	] BPF_TRAMP_F_TAIL_CALL_CTX
+	 *
 	 *		    [ pads              ] pads for 16 bytes alignment
 	 *
 	 *		    [ stack_argN        ]
@@ -1126,6 +1097,11 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	stack_size += 8;
 	sreg_off = stack_size;
 
+	if (flags & BPF_TRAMP_F_TAIL_CALL_CTX) {
+		stack_size += 8;
+		tcc_off = stack_size;
+	}
+
 	if ((flags & BPF_TRAMP_F_CALL_ORIG) && (nr_arg_slots - RV_MAX_REG_ARGS > 0))
 		stack_size += (nr_arg_slots - RV_MAX_REG_ARGS) * 8;
 
@@ -1160,6 +1136,10 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		emit_addi(RV_REG_FP, RV_REG_SP, stack_size, ctx);
 	}
 
+	/* store tail call count */
+	if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
+		emit_sd(RV_REG_FP, -tcc_off, RV_REG_TCC, ctx);
+
 	/* callee saved register S1 to pass start time */
 	emit_sd(RV_REG_FP, -sreg_off, RV_REG_S1, ctx);
 
@@ -1218,9 +1198,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		orig_call += RV_FENTRY_NINSNS * 4;
 		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
 		restore_stack_args(nr_arg_slots - RV_MAX_REG_ARGS, args_off, stk_arg_off, ctx);
+		/* restore TCC to RV_REG_TCC before calling the orig bpf func */
+		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
+			emit_ld(RV_REG_TCC, -tcc_off, RV_REG_FP, ctx);
 		ret = emit_call((const u64)orig_call, true, ctx);
 		if (ret)
 			goto out;
+		/* store updated TCC back to stack after calling the orig bpf func */
+		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
+			emit_sd(RV_REG_FP, -tcc_off, RV_REG_TCC, ctx);
 		emit_sd(RV_REG_FP, -retval_off, RV_REG_A0, ctx);
 		emit_sd(RV_REG_FP, -(retval_off - 8), regmap[BPF_REG_0], ctx);
 		im->ip_after_call = ctx->ro_insns + ctx->ninsns;
@@ -1254,6 +1240,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		ret = emit_call((const u64)__bpf_tramp_exit, true, ctx);
 		if (ret)
 			goto out;
+	} else if (flags & BPF_TRAMP_F_TAIL_CALL_CTX) {
+		/* restore TCC to RV_REG_TCC before calling the orig bpf func */
+		emit_ld(RV_REG_TCC, -tcc_off, RV_REG_FP, ctx);
 	}
 
 	if (flags & BPF_TRAMP_F_RESTORE_REGS)
@@ -1837,10 +1826,18 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			}
 		}
 
+		/* restore TCC to RV_REG_TCC before bpf2bpf call */
+		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
+			emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+
 		ret = emit_call(addr, fixed_addr, ctx);
 		if (ret)
 			return ret;
 
+		/* store updated TCC back to stack after bpf2bpf call */
+		if (aux->tail_call_reachable && insn->src_reg == BPF_PSEUDO_CALL)
+			emit_sd(RV_REG_SP, ctx->tcc_offset, RV_REG_TCC, ctx);
+
 		if (insn->src_reg != BPF_PSEUDO_CALL)
 			emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_A0, ctx);
 		break;
@@ -2002,6 +1999,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	bool tail_call_reachable = ctx->prog->aux->tail_call_reachable;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
@@ -2020,10 +2018,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		stack_adjust += 8;
 	if (seen_reg(RV_REG_S5, ctx))
 		stack_adjust += 8;
-	if (seen_reg(RV_REG_S6, ctx))
-		stack_adjust += 8;
 	if (ctx->arena_vm_start)
 		stack_adjust += 8;
+	if (tail_call_reachable)
+		stack_adjust += 8;
 
 	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
 	stack_adjust += bpf_stack_adjust;
@@ -2037,11 +2035,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	for (i = 0; i < RV_FENTRY_NINSNS; i++)
 		emit(rv_nop(), ctx);
 
-	/* First instruction is always setting the tail-call-counter
-	 * (TCC) register. This instruction is skipped for tail calls.
-	 * Force using a 4-byte (non-compressed) instruction.
-	 */
-	emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
+	if (!is_subprog)
+		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
+
+	/* tailcall start here, emit insn before it must be fixed */
 
 	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
 
@@ -2071,26 +2068,20 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
 		store_offset -= 8;
 	}
-	if (seen_reg(RV_REG_S6, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S6, ctx);
-		store_offset -= 8;
-	}
 	if (ctx->arena_vm_start) {
 		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
 		store_offset -= 8;
 	}
+	if (tail_call_reachable) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
+		ctx->tcc_offset = store_offset;
+	}
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
 
-	/* Program contains calls and tail calls, so RV_REG_TCC need
-	 * to be saved across calls.
-	 */
-	if (seen_tail_call(ctx) && seen_call(ctx))
-		emit_mv(RV_REG_TCC_SAVED, RV_REG_TCC, ctx);
-
 	ctx->stack_size = stack_adjust;
 
 	if (ctx->arena_vm_start)
@@ -2157,3 +2148,8 @@ bool bpf_jit_supports_fsession(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_subprog_tailcalls(void)
+{
+	return true;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
