Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897B8C4453C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMgRCs8/V1zvUXbWeCNeBT1mNfVWV+ouAMgGDsK4Tew=; b=CFjha7eSDYOFtQ
	4QZB1R1AFFtWiVIP+ywZo2shhfqpLBMPw77rE+kRyAtvXEhaca6avBQgAGe3jgIqQVU6kgS6VcjWE
	5eqAPs6IQ2e4CNcWr8PX/i1dj5EAeiaynVwzM8+dEd7LzA+p+vE23PTGs5YMYJipxBeW/CFjsCNfe
	DuKyyuspz0/ezSgV3GYG/wboJoTH0c2OicWMzjsbCA/0cqJPpGXr8v2CyTr0t/q7/MzGdmOnt2AXp
	5pTbOY97YoUaJCbR1hLwSsCFngGaD+wKMfEpALC99i5aDzSQUmMjgnFZ4XqtXf1XOEkqIDr5ncfjg
	q7jh/7L8eFuwDG2WfRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVr-0000000ByJD-1KDm;
	Wed, 22 Jul 2026 14:01:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVo-0000000ByH8-3Hya
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:01:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so2859738a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728888; x=1785333688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH52Aw5C7E2f+s1RWscjl9uFLtr6OIWxpcyJYXQFaUM=;
        b=LPrlg7xsk36gX4BptTH5Yn3FpgqbDfABkR6Xd5S3xFshSoW8DQ/+uxk2aQ4xb23eTX
         wlOuyEZ0NzgjrlCFVxYuy2BFOqTdYpofyzzOKMWOiPs1sROXkniPXioyOlsl+IJDxhCH
         5gn+w2nh2hyeSSChxsAShXih3Xgg1TfNZIBCNvzc+tMiYLkb+JpgB7GRWLDEKKG2PHRn
         Hm86kQwcduIWgMEHD3kgnBnoP0rH45VAF5avplRc/GPB0+eTODyemOtB5DO/L/539R8Q
         drBI9KbgKfhbDB8jf+mgwriwqTGDM2PVTWu8T8la2tv1z9/5BMOk6Q+3kJxKAGzGcqFd
         jM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728888; x=1785333688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH52Aw5C7E2f+s1RWscjl9uFLtr6OIWxpcyJYXQFaUM=;
        b=intqG0mhFdOgsIe86bI8ItTCA6Lgi/F4TWU08F9LPRpCMAuSdbH06X8DGHEC18+odQ
         wKqgQ3/+L5vcyj8194qIXpY7r5qitYW6ecfFr/G3r6gY4Gl1KdTmHvWzsA2qJB02rPCZ
         4dtXER1fqllpUPEJyFiZCGAK5pd3SnYwTyiNvrsesQ15GU4StEF9wuYMtnbAtNjPobx1
         Z/o/OyEVj2injmjD7Dk9YIrUWdkVOuTJ8IBkcMEmrXanWKyA76wYUS6GpVY8yUnvcq4r
         Kxst9sk1NzQ9h5XYdKiQPkS5CZgj6GSxuVAwFBO9F3JRkEymrb1lEuteSzvfPgoNtqgA
         S9xA==
X-Forwarded-Encrypted: i=1; AHgh+RqVh7ySyvfgaEgpRKDhLNZ4icWXUZCflgGc8g0lL4vFoNo2+S7qhR+3yHjwpoeW08ixcO59K6gdSQOCLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDwvILdMhOUdDEgG0T3VKK+SSmGwXhd/Ocs0N/AQpMa74WLnhT
	mSF04kjVnuvMrEd3CTBRR4mk65Pri32MvWe9jKbqPWNS2DEK9D46emLo
X-Gm-Gg: AR+sD11socf6QJL+YRhsXcCFIRx3QgU3gIolLB7If+ZoH33teDexQC7JuNpqamQmknE
	u6dBcZBN/6nS4aMDwR7IG9fgVRDTlsXU4ldji7KcGuZD0QkZ9uzr5Zpacjr+Bf1GCxjEE1lE3I7
	SMurvn/kSlFN4zqt+ZT27Q76VxuCHyIGixCfAFw8VgSDEAhKq+jdIDXi35vOfJr2WW7lpyh89te
	joNYB8USkHK7tbroTivoFpOsZdM/E/1t3KZWO9ZAVLg6ynPAsC530/onEaOUBqnDqxSN8y3V4Ok
	p2smpUMoFk6aGIBKelT2+kHwzAxVnVcX3PeReJJqJlUUt94JMpwABKiE+dpVPukz9NYg84KiA2B
	c4Xk47iR2tXNjOkEZ5nrSMMs1Z9EaVCmUPHzyd2UteUlb0TtI2tqqGBVCKcY7U4dU1sTAmHs6Go
	9R2k3pBvKg+HmbY7iTy2r62wd6gR/vdQgShtMYlcIjSqX8zJg=
X-Received: by 2002:a05:6a20:9397:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c3ada17f25mr23594749637.42.1784728884846;
        Wed, 22 Jul 2026 07:01:24 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:01:23 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 4/6] riscv, bpf: Split prologue and epilogue into helper functions
Date: Wed, 22 Jul 2026 19:30:11 +0530
Message-ID: <20260722140015.1982158-5-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070128_831524_056576D4 
X-CRM114-Status: GOOD (  15.64  )
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

Split bpf_jit_build_prologue() and __build_epilogue() into helpers.
normal_stack_adjust() computes the frame size for the callee-saved
registers a program actually clobbers, emit_normal_prologue() allocates
the frame and spills those registers, and emit_normal_restore() reloads
them.

The kcfi preamble, fentry nops and tail-call-counter setup are hoisted
before the frame-size computation and they do not depend on it and the
emitted instruction sequence is unchanged.

No functional change.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 152 ++++++++++++++++++--------------
 1 file changed, 87 insertions(+), 65 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index ad089a9a4ea9..b804382075c4 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -198,9 +198,84 @@ static void emit_imm(u8 rd, s64 val, struct rv_jit_context *ctx)
 		emit_addi(rd, rd, lower, ctx);
 }
 
-static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
+/* Stack space for the callee-saved registers a normal program spills,
+ * excluding the BPF stack itself.
+ */
+static int normal_stack_adjust(struct rv_jit_context *ctx)
 {
-	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
+	int stack_adjust = 0;
+
+	if (seen_reg(RV_REG_RA, ctx))
+		stack_adjust += 8;
+	stack_adjust += 8; /* RV_REG_FP */
+	if (seen_reg(RV_REG_S1, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S2, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S3, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S4, ctx))
+		stack_adjust += 8;
+	if (seen_reg(RV_REG_S5, ctx))
+		stack_adjust += 8;
+	if (ctx->arena_vm_start)
+		stack_adjust += 8;
+	stack_adjust += 8; /* RV_REG_TCC */
+
+	return round_up(stack_adjust, STACK_ALIGN);
+}
+
+/* Allocate the frame and save the callee-saved registers the program
+ * actually clobbers, then point FP at the frame top.
+ */
+static void emit_normal_prologue(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
+	/* tailcall starts here, emit insn before it must be fixed */
+
+	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+
+	if (seen_reg(RV_REG_RA, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
+		store_offset -= 8;
+	}
+	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
+	store_offset -= 8;
+	if (seen_reg(RV_REG_S1, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S2, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S3, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S4, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
+		store_offset -= 8;
+	}
+	if (seen_reg(RV_REG_S5, ctx)) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
+		store_offset -= 8;
+	}
+	if (ctx->arena_vm_start) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
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
+static void emit_normal_restore(struct rv_jit_context *ctx, int stack_adjust)
+{
+	int store_offset = stack_adjust - 8;
 
 	if (seen_reg(RV_REG_RA, ctx)) {
 		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
@@ -235,6 +310,13 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 
 	/* restore TCC from stack to RV_REG_TCC */
 	emit_ld(RV_REG_TCC, ctx->tcc_offset, RV_REG_SP, ctx);
+}
+
+static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
+{
+	int stack_adjust = ctx->stack_size;
+
+	emit_normal_restore(ctx, stack_adjust);
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -2006,34 +2088,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
-	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	int i, stack_adjust, bpf_stack_adjust;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
-	if (seen_reg(RV_REG_RA, ctx))
-		stack_adjust += 8;
-	stack_adjust += 8; /* RV_REG_FP */
-	if (seen_reg(RV_REG_S1, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S2, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S3, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S4, ctx))
-		stack_adjust += 8;
-	if (seen_reg(RV_REG_S5, ctx))
-		stack_adjust += 8;
-	if (ctx->arena_vm_start)
-		stack_adjust += 8;
-	stack_adjust += 8; /* RV_REG_TCC */
-
-	stack_adjust = round_up(stack_adjust, STACK_ALIGN);
-	stack_adjust += bpf_stack_adjust;
-
-	store_offset = stack_adjust - 8;
-
 	/* emit kcfi type preamble immediately before the  first insn */
 	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
 
@@ -2046,46 +2106,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 	if (!is_subprog)
 		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
 
-	/* tailcall starts here, emit insn before it must be fixed */
-
-	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
-
-	if (seen_reg(RV_REG_RA, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_RA, ctx);
-		store_offset -= 8;
-	}
-	emit_sd(RV_REG_SP, store_offset, RV_REG_FP, ctx);
-	store_offset -= 8;
-	if (seen_reg(RV_REG_S1, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S1, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S2, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S2, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S3, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S3, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S4, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S4, ctx);
-		store_offset -= 8;
-	}
-	if (seen_reg(RV_REG_S5, ctx)) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_S5, ctx);
-		store_offset -= 8;
-	}
-	if (ctx->arena_vm_start) {
-		emit_sd(RV_REG_SP, store_offset, RV_REG_ARENA, ctx);
-		store_offset -= 8;
-	}
-
-	/* store TCC from RV_REG_TCC to stack */
-	emit_sd(RV_REG_SP, store_offset, RV_REG_TCC, ctx);
-	ctx->tcc_offset = store_offset;
-
-	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+	stack_adjust = normal_stack_adjust(ctx) + bpf_stack_adjust;
+	emit_normal_prologue(ctx, stack_adjust);
 
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
