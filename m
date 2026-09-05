Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F3C79F85
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 06:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kp4sSGyUQGCMmmpIkW2ADwL+22IxYqUgKnDbKlhNjGw=; b=H7puPWXpu22Bml
	GDIWRO/Ni2T4Gk+JEMyZsL770I+lBxT6+WMRC3VdJPzf6cr4odvp6zxglo2IqQ1EEFFd8BxiTYvBe
	5oz4s0/WsdqQGUx0iK0YwD6tv8XruOVTzcXMdOowc2RRlnPIaA2C1hPGiEK/LYSiD105kUeNb1rom
	epJSAFSvDij75PB9hw15xuKljD+P9Ub9Lwrz/tPfLVji+pCZ2kJQjFWeV3dNlLodMLrzOLUrxSzCb
	1jHUXt+8yp4WH5kuIlxnsyzBpEmtX5Rt1r200f+mMW4UwAZ6q4LGrocPkpXew7ZyW7uFYcNnbGRGL
	7nUMWoR+RJFeFa+CxOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kMw-00000003kRB-3F73;
	Sat, 05 Sep 2026 06:59:18 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kMs-00000003kOr-0l7B
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 06:59:16 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hcPL55XBlzKHMT8
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 14:58:05 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 495724058C
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 14:59:02 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgDXvQi0vZtqheFEAw--.38251S4;
	Sat, 05 Sep 2026 14:59:02 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v4 2/3] riscv, bpf: Add BPF stack arguments support for RV64 JIT
Date: Sat,  5 Sep 2026 07:04:08 +0000
Message-Id: <20260905070409.4141522-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905070409.4141522-1-pulehui@huaweicloud.com>
References: <20260905070409.4141522-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDXvQi0vZtqheFEAw--.38251S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtw18Jr17Jry3tF1DGFWkXrb_yoWxZF47p3
	WDGr1SkrWvqw40qFyDtFnrXr15CrsYq3W7KFZ3G3yrJF42qrZ5G3W3K3WayFy5CryrW3Wx
	AFWqkr9xC395t37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMc
	Ij6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_
	Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI
	0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jI
	sjbUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_235914_613405_26D8640E 
X-CRM114-Status: GOOD (  14.15  )
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

From: Feng Jiang <jiangfeng@kylinos.cn>

Implement bpf_jit_supports_stack_args() on RV64 JIT to allow bpf
subprogs and kfuncs to pass and receive more than 5 arguments.

In the riscv abi, the first 8 arguments are passed in registers a0 to
a7, and arguments 9+ reside on the stack. To align bpf stack arguments
with this calling convention and unify bpf2bpf calls with kfuncs, map
the first 3 bpf stack arguments (6th to 8th) directly to a5 to a7, and
store or load the remaining arguments (9th+) at SP or FP. Reserve
outgoing stack space in the prologue accordingly when stack_arg_cnt
exceeds 3.

In addition, update kfunc argument sign extension to handle all 8
register arguments as well as any arguments passed on the stack.

Co-developed-by: Pu Lehui <pulehui@huawei.com>
Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit.h        |  1 +
 arch/riscv/net/bpf_jit_comp64.c | 79 +++++++++++++++++++++++++++++----
 arch/riscv/net/bpf_jit_core.c   |  6 +++
 3 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 419b9d795f2a..039877f286fc 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -82,6 +82,7 @@ struct rv_jit_context {
 	unsigned long flags;
 	int stack_size;
 	int tcc_offset;
+	int stack_arg_sz;
 	u64 arena_vm_start;
 	u64 user_vm_start;
 };
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index aac128b9f0a4..cda99c1f9ffe 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -498,6 +498,18 @@ static void emit_ldx(u8 rd, s16 off, u8 rs, u8 size, bool sign_ext,
 	ctx->ex_jmp_off = ctx->ninsns;
 }
 
+static void emit_stack_arg_ldx(u8 rd, s16 off, struct rv_jit_context *ctx)
+{
+	int idx = off / 8 - 1;
+
+	if (idx < 3) {
+		emit_mv(rd, RV_REG_A5 + idx, ctx);
+		return;
+	}
+
+	emit_ldx_insn(rd, (idx - 3) * 8, RV_REG_FP, BPF_DW, false, ctx);
+}
+
 static void emit_st(u8 rd, s16 off, s32 imm, u8 size, struct rv_jit_context *ctx)
 {
 	emit_imm(RV_REG_T1, imm, ctx);
@@ -515,6 +527,19 @@ static void emit_st(u8 rd, s16 off, s32 imm, u8 size, struct rv_jit_context *ctx
 	ctx->ex_jmp_off = ctx->ninsns;
 }
 
+static void emit_stack_arg_st(s16 off, s32 imm, struct rv_jit_context *ctx)
+{
+	int idx = -off / 8 - 1;
+
+	emit_imm(RV_REG_T1, imm, ctx);
+	if (idx < 3) {
+		emit_mv(RV_REG_A5 + idx, RV_REG_T1, ctx);
+		return;
+	}
+
+	emit_stx_insn(RV_REG_SP, (idx - 3) * 8, RV_REG_T1, BPF_DW, ctx);
+}
+
 static void emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
 {
 	if (is_12b_int(off)) {
@@ -531,6 +556,18 @@ static void emit_stx(u8 rd, s16 off, u8 rs, u8 size, struct rv_jit_context *ctx)
 	ctx->ex_jmp_off = ctx->ninsns;
 }
 
+static void emit_stack_arg_stx(s16 off, u8 rs, struct rv_jit_context *ctx)
+{
+	int idx = -off / 8 - 1;
+
+	if (idx < 3) {
+		emit_mv(RV_REG_A5 + idx, rs, ctx);
+		return;
+	}
+
+	emit_stx_insn(RV_REG_SP, (idx - 3) * 8, rs, BPF_DW, ctx);
+}
+
 static int emit_atomic_ld_st(u8 rd, u8 rs, const struct bpf_insn *insn,
 			     struct rv_jit_context *ctx)
 {
@@ -1824,11 +1861,21 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 				return -EINVAL;
 
 			for (idx = 0; idx < fm->nr_args; idx++) {
-				u8 reg = bpf_to_rv_reg(BPF_REG_1 + idx, ctx);
 				bool sign = fm->arg_flags[idx] & BTF_FMODEL_SIGNED_ARG;
-
-				if (sign_extend(reg, reg, fm->arg_size[idx], sign, ctx))
-					return -EINVAL;
+				u8 arg_sz = fm->arg_size[idx];
+
+				if (arg_sz == 8 || (arg_sz != 4 && !sign))
+					continue;
+
+				if (idx < RV_MAX_REG_ARGS) {
+					if (sign_extend(RV_REG_A0 + idx, RV_REG_A0 + idx, arg_sz, sign, ctx))
+						return -EINVAL;
+				} else {
+					emit_ld(RV_REG_T1, (idx - RV_MAX_REG_ARGS) * 8, RV_REG_SP, ctx);
+					if (sign_extend(RV_REG_T1, RV_REG_T1, arg_sz, sign, ctx))
+						return -EINVAL;
+					emit_sd(RV_REG_SP, (idx - RV_MAX_REG_ARGS) * 8, RV_REG_T1, ctx);
+				}
 			}
 		}
 
@@ -1927,7 +1974,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			rs = RV_REG_T2;
 		}
 
-		emit_ldx(rd, off, rs, BPF_SIZE(code), sign_ext, ctx);
+		if (is_stack_arg_ldx(insn))
+			emit_stack_arg_ldx(rd, off, ctx);
+		else
+			emit_ldx(rd, off, rs, BPF_SIZE(code), sign_ext, ctx);
 
 		ret = add_exception_handler(insn, rd, ctx);
 		if (ret)
@@ -1957,7 +2007,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			rd = RV_REG_T3;
 		}
 
-		emit_st(rd, off, imm, BPF_SIZE(code), ctx);
+		if (is_stack_arg_st(insn))
+			emit_stack_arg_st(off, imm, ctx);
+		else
+			emit_st(rd, off, imm, BPF_SIZE(code), ctx);
 
 		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
 		if (ret)
@@ -1979,7 +2032,10 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			rd = RV_REG_T2;
 		}
 
-		emit_stx(rd, off, rs, BPF_SIZE(code), ctx);
+		if (is_stack_arg_stx(insn))
+			emit_stack_arg_stx(off, rs, ctx);
+		else
+			emit_stx(rd, off, rs, BPF_SIZE(code), ctx);
 
 		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
 		if (ret)
@@ -2029,9 +2085,9 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
-	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	int i, stack_adjust = 0, store_offset, bpf_stack_adjust = ctx->stack_arg_sz;
 
-	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
+	bpf_stack_adjust += round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
@@ -2190,3 +2246,8 @@ bool bpf_jit_supports_timed_may_goto(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_stack_args(void)
+{
+	return true;
+}
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index cbfcd287ea16..ed48005568c8 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -48,6 +48,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	int pass = 0, prev_ninsns = 0, i;
 	struct rv_jit_data *jit_data;
 	struct rv_jit_context *ctx;
+	u16 stack_arg_cnt;
 
 	if (!prog->jit_requested)
 		return prog;
@@ -71,6 +72,11 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 
 	ctx->arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
 	ctx->user_vm_start = bpf_arena_get_user_vm_start(prog->aux->arena);
+
+	stack_arg_cnt = bpf_out_stack_arg_cnt(env, prog);
+	/* First 3 stack args in regs, rest on stack */
+	ctx->stack_arg_sz = stack_arg_cnt > 3 ? round_up((stack_arg_cnt - 3) * 8, STACK_ALIGN) : 0;
+
 	ctx->prog = prog;
 	ctx->offset = kvzalloc_objs(int, prog->len);
 	if (!ctx->offset)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
