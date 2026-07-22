Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB35CC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVWrLroQO9eJ3Qk3IFH5xjKnQYzQGyMY9LKbTvv5sEs=; b=a4mxt2ZXnPkMtm
	jmuneep7UzzFGOzMB1d/zOjjSbdNfTCahfaC0ERGEgyee1QggQz8t+46FSKYGI8o0MpnY8jJ4UQaG
	QReoY/p8/P+TqYUTWNmF9+4buCxRRT2L4cT7R8q5GNSx7fHgFjdNyxUGW8V4OH4hfGrnvvKJFdwte
	bA7NQ8NHH97IUG0YGI8OBLC45/UGjOEIigCc7fr/bw+VNd8nqANmTWm62JNqRr9CprH2qnXruI4gj
	VwP27a//Z5NLbbRZzw4CY7lZnIeQadDcgvLuuSkZ4ALe+y8uMqkI43DQ8KndnCAcDV7AjzhmIp5xt
	mpMcINvzWzpm6KxQmGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXW3-0000000ByRk-2L3D;
	Wed, 22 Jul 2026 14:01:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXW1-0000000ByP2-0FWP
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:01:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8486ac3f347so5173054b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728900; x=1785333700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJghvyp9lx2AAiAnzR9hFK8qyEideu4pePevOLlB6CQ=;
        b=bSpyijzyrJVG2tA0hs3BWEzduSVJ1wGfu45xT/tCt04dF5NQ9VNKCPP+Xh0ZZwzXi8
         FqgPpijMHltskq4IDSZn0TULOxCXwPcb4KOOxBdtek0SQ7WLdKtm0Dypr9KmrvdtQskM
         P4a7YEWIykrLq1D+8h+HdU154gz23OEHT/PQ2J1nVah5AHWHUJ4y+moIYvnBLPFk+aen
         KyUB7R7ZYvOooy7xn7Vqvou5pe596qxI/IH9Nnoh1gAOF7nvmXK0p7N5fGjtpbLSbpiS
         hFgjZ3oJvQj17adaoPYdaX+9zApYzGQCgWGSc/Iam26n6jeiJBEx1wp/ENZ/DqdXebLL
         vDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728900; x=1785333700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hJghvyp9lx2AAiAnzR9hFK8qyEideu4pePevOLlB6CQ=;
        b=cPMxnukSMrooSVxAF5su+87jbt6cOt3Ce8/LC118NATdJvlxlx4JktG4oc3AXKtCDm
         couhFUreiOi4Xly58e+FRQgyN2iwXUhO5Lk2vvrA9EYCZd5vXlIEpzgTJrMAlDdi0swV
         yeWXvt0fUcQGxi5MxGC0leFFd0JSgTOok3Et4GntEAsSlpbyUvOBMX4kIdwz79eWcjI9
         MGv/G+sLH1Vjfay+idDYtmi8bY4L4Jh8TELxkUa1WJHNkmc1qbDI4eCtBZXfY/Kk8++H
         ffree6ev5x1NDQmHU37CCoBnyWSMSTnQ8TgecX5AaU94TclO7m9EBxAHtgxLKSQJ7biK
         9beA==
X-Forwarded-Encrypted: i=1; AHgh+RpvnpjuLx/6HiI+CtIljj4aLPpmpkL/RctOwbWgsAu0vrURP7sdm+608WiXBc5STW4qKUPZICE4ynQqpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIfWDT8Cx/6V7351R/Yr9fcMndoYpraU6wKCYDw2v7lJr8msBi
	iDKjz7YtC2Ik283tO/IbS09T4b4ThB7Obwl2WENJBdki49enuUuQ0QYv
X-Gm-Gg: AR+sD10wpsVhAdnE/zmK0Qhnt+BgpOWNEZ2F3BW4rftL/mmOf+dy0eSXuEKaf68C0MX
	B+t4SsSeoOEuyoz8SsqDZAtcxbHvrNb7FRfa1CYj3Ui8QpAv2JSUkz4/KMxxmuClxry1zi38LMu
	48xpg62WLng2sUWcFFHJ0Vc8ww8VfOJPEvrNKs0flwBDSZN3FKa8lI9sPZNvL2SwOTHlG1IGwz2
	Vq8tWL3yj1vf0Qw08+BIQMHd/SY1NeEcmWMtZjL2tw8Z1l9nBMWe4Rou37miFsdePMDMLgk8CGk
	yIOSEyLRw3orh0KlRVqlJXjyPr1FcZLfQDnFYTVFR/9ZEx9o8pEex11EXQQ0wCN5I5thYmFEkVK
	OGUq+ytpMzm6dURH/k6mcvnzulvuEipVr3WuNcdkokAFFh0jM4A2pg4/yuXPpLsWNYCuSiYyO07
	1bQQBaTdVQtaPaQrzbIZ2vaTPY43Knq4xWPNz4X/gluWfvyLY=
X-Received: by 2002:a05:6a21:6004:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3c42921e111mr4368025637.6.1784728898850;
        Wed, 22 Jul 2026 07:01:38 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:37 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 5/6] riscv, bpf: Add support for BPF exceptions
Date: Wed, 22 Jul 2026 19:30:12 +0530
Message-ID: <20260722140015.1982158-6-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070141_111429_C5CCEA5D 
X-CRM114-Status: GOOD (  19.92  )
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

Add the JIT support required for BPF exceptions on riscv64.

Two kinds of programs need special prologue/epilogue handling:

  - A program acting as an exception boundary must save the full set of
    riscv callee-saved GP registers (ra, s0-s11), not just the ones it
    clobbers, so that the exception callback can restore the
    state that was live at the boundary. ra and fp are stored first so
    the saved ra/fp pair forms a valid stackframe record for the
    unwinder.

  - exception_cb does not allocate its own frame. It reuses the boundary
    program's frame, whose frame pointer is passed in a2, by setting
    SP = FP - stack_adjust. This lines the epilogue's loads up with
    the registers the boundary saved, so both paths restore the same
    order.

Both cases are implemented as prologue/epilogue helpers next to the
normal-path ones, selected with a plain if/else in
bpf_jit_build_prologue() and __build_epilogue().

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 112 +++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index b804382075c4..e0c2f73bc646 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -56,6 +56,29 @@ static const int pt_regmap[] = {
 	[RV_REG_T0] = offsetof(struct pt_regs, t0),
 };
 
+/* Full set of RISC-V callee-saved GP registers (ra, s0-s11) saved by a program
+ * acting as an exception boundary, in the order they are stored on the stack.
+ * RA and FP come first so the saved ra/fp pair forms a valid stackframe record
+ * at [FP-8]/[FP-16] for the unwinder. The exception callback reuses the
+ * boundary program's frame and restores this same set in its epilogue, so both
+ * paths must agree on the contents and ordering of this list.
+ */
+static const int rv_exception_csave_regs[] = {
+	RV_REG_RA,
+	RV_REG_FP,
+	RV_REG_S1,
+	RV_REG_S2,
+	RV_REG_S3,
+	RV_REG_S4,
+	RV_REG_S5,
+	RV_REG_S6,
+	RV_REG_S7,
+	RV_REG_S8,
+	RV_REG_S9,
+	RV_REG_S10,
+	RV_REG_S11,
+};
+
 enum {
 	RV_CTX_F_SEEN_CALL =		RV_REG_RA,
 	RV_CTX_F_SEEN_S1 =		RV_REG_S1,
@@ -312,11 +335,67 @@ static void emit_normal_restore(struct rv_jit_context *ctx, int stack_adjust)
 	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
 }
 
+static bool is_exception_prog(const struct bpf_prog *prog)
+{
+	return prog->aux->exception_boundary || prog->aux->exception_cb;
+}
+
+static void emit_exception_boundary_prologue(struct rv_jit_context *ctx,
+					     int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	int i;
+
+	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+	for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+		emit_sd(RV_REG_SP, store_offset, rv_exception_csave_regs[i], ctx);
+		store_offset -= 8;
+	}
+
+	/* store TCC from RV_REG_TCC to stack */
+	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
+	ctx->tcc_offset = store_offset;
+
+	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+}
+
+/* reuses the boundary program's frame, whose frame pointer
+ * is passed in a2 (since it's the third argument from bpf_throw()).
+ * Setting SP = FP - stack_adjust lines the epilogue's loads up with
+ * the registers the boundary saved.
+ */
+static void emit_exception_cb_prologue(struct rv_jit_context *ctx,
+				       int stack_adjust)
+{
+	emit_mv(RV_REG_FP, RV_REG_A2, ctx);
+	emit_addi(RV_REG_SP, RV_REG_FP, -stack_adjust, ctx);
+	ctx->tcc_offset = stack_adjust - 8 - ARRAY_SIZE(rv_exception_csave_regs) * 8;
+}
+
+/* Used by both the boundary program and the exception callback alike, since the
+ * callback runs on the boundary's frame.
+ */
+static void emit_exception_restore(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+		emit_ld(rv_exception_csave_regs[i], store_offset, RV_REG_SP, ctx);
+		store_offset -= 8;
+	}
+	/* restore TCC from stack to RV_REG_TCC */
+	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+}
+
 static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 {
 	int stack_adjust = ctx->stack_size;
 
-	emit_normal_restore(ctx, stack_adjust);
+	if (is_exception_prog(ctx->prog))
+		emit_exception_restore(ctx, stack_adjust);
+	else
+		emit_normal_restore(ctx, stack_adjust);
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -2086,6 +2165,15 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	return 0;
 }
 
+static int exception_stack_adjust(void)
+{
+	int stack_adjust = 0;
+
+	stack_adjust += 8; /* RV_REG_TCC */
+	stack_adjust += ARRAY_SIZE(rv_exception_csave_regs) * 8;
+	return round_up(stack_adjust, STACK_ALIGN);
+}
+
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust, bpf_stack_adjust;
@@ -2106,8 +2194,17 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (!is_subprog)
 		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
 
-	stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
-	emit_normal_prologue(ctx, stack_adjust);
+	if (is_exception_prog(ctx->prog)) {
+		stack_adjust = exception_stack_adjust() + bpf_stack_adjust;
+
+		if (ctx->prog->aux->exception_cb)
+			emit_exception_cb_prologue(ctx, stack_adjust);
+		else
+			emit_exception_boundary_prologue(ctx, stack_adjust);
+	} else {
+		stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
+		emit_normal_prologue(ctx, stack_adjust);
+	}
 
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
@@ -2183,3 +2280,12 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_exceptions(void)
+{
+	/* bpf_throw() unwinds by walking the frame-pointer chain from inside
+	 * the kernel back into the BPF frames (see arch_bpf_stack_walk()), so
+	 * exceptions require the frame-pointer unwinder to be enabled.
+	 */
+	return IS_ENABLED(CONFIG_FRAME_POINTER);
+}
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
