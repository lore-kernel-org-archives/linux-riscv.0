Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D769DC43458
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jun 2026 08:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9/cLKErfpqkVy/aGr0SJbzKug0fvwxuIWUCJgU7Oy4=; b=apqMF2+zKM/K1D
	CkxqiWYs2+g9SP/LUfb6yRAVm7BWVILkQ9RiOOQtk1GbCRU/ylTICunKwwx/aC0CgQhQHVRpZGIS1
	wGLXEIT0XKJqr1k7uiL9QjKBw/4mg1ZIcvgrDNrAexfb+UkhHvbEdySuS8c54MVBquoLUSd/3U5BJ
	oDKKbDrKF5eChkBAJc9dzAYgqYOil4hiPaNCogofjHneICyNpteVwBGP+m3MZXq6G02Zoa3JPBtvd
	eBxd7QlKK7fdapUE254O015zlwvLgAKeEiLK60+BLSEaQg/kV7X5ixQ3Uo9jCqejn8ULuC6IvViMv
	gSNuCpAK0qZZJBsWpNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdki3-0000000CykQ-0AHG;
	Sun, 28 Jun 2026 08:17:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdki0-0000000Cyjs-1BA7
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jun 2026 08:17:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c88d1d4543fso1481542a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634663; x=1783239463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVO4nP+vLtDld68tZIROaNQpEMIbIme+fqWpJDy3A7A=;
        b=gSDwyvcCC5kBu4ZloR0nqUF1e7U2JCi1GFyXIVedcCvl7osdh6l6cRaeb9oZiirdmn
         bc/lBiIVsa7sPCwupwYf5ClBtbSYoEX6uHqhWA1rjvegvYii5uKSbrKgvtEJfM45t3sf
         ygBF/8Ut5LvcVoLHpTaZslkowsYnuq9iIEXgp0//Nof4uf/EluDjUu0Np8udvYaN/njx
         ZbeB98otPIMN7fpvjxlgdxEsTIaG4ig5/NEH/2z1wzp8TpmgVlIBc07osq0pcj4JoKpk
         AUjpGptp1BeM3absRhnJAfDXv4v40NZTbxvvLMpb8mG4bzyFfntTCuZ+9oJcPORS9XU+
         pLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634663; x=1783239463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DVO4nP+vLtDld68tZIROaNQpEMIbIme+fqWpJDy3A7A=;
        b=nXMh6dVsNeLiwp4W8pUTsrpnBhp6XFHNwqZcXQ55ZUMC2dZpBfo1MRLoCVwLSdRHrc
         zSlvyHXW/DWE4aouD/aVp6+nmKhECRAcLhoxzQb/5lNjU3bho5QmaTlNygyB7Lu2iPye
         MfcYLXHH7hfSfsyBrAg2MxlWP3SVaZkoAWbc8wDkZtPrV/noM+ahHgP7qBflyEqyEmHD
         +DOG7vfIyjNC3VTwi13Lddjd6rxtvRzbDA30N/EgZeiBsYuIqQsBoe/HUkh7CvBFz+3Q
         /lJoT4zFSpE0e8JQFci/NO6quF5xkIhbbSv4T99pLo6Cq8csexYSkCVPWLnmxrf42Ykr
         0FCA==
X-Forwarded-Encrypted: i=1; AFNElJ85pBGzmoD0/ypOQHHnB7EbdALYQHY0t/u9/DR2TxpmXRvHP9ecdOr63pOCaBNkZjlfeqpgC4+Z9a/iNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOYBJ+Ceu7MhT/KDH1TDSRAGwouMf6TEfrSgwW6OiD7KW6mMSS
	Yzz2rOtICMbcnmMFh+UwiRFV9SCEfW4NvEfj5gZb+jcXHTBYR1MjrP+R
X-Gm-Gg: AfdE7cnzMmubLSgCiqLISffKThq38jzJT9YuLFn2aN5OLv7r0iZcqbfaedZNsV48cBW
	s9pIydTkh/mOW2wYS1EOPS5BQ5wTB2RrNymQuRxX8aNSOiss/aAoq9N6wzd6K7A5dxOe/PR35Aa
	CHDGrM6vlm9TWa9/hgxDMCI7I8iQqQNvI/P0InbnmUy8jcNTTqVl99NsWr+Y+IzdCxeOk6EhRWX
	8q/fkA2VpLVCeprASRa5sGEeWBS8yBhLU4EshlRNWzeJ1h4aKXvqA/EGHPjg0/7FkvKcJPptwWA
	jZoyXm1fa6eK5mcuFQ5exzWlLTOwou7Wa3tys7zbU/RamhJILo0LWqfjGxbHOKrqsVV8OwbZ5Nm
	OlcN3vO4+BDIZ0Et5g7E8+YH4ls+tagGrVkUtJzjkmp5d6NSfR/IV5a5xH0vRhuhGW8sy9kM8u+
	jBQxRQZK1ONu3ev0+N7KeM9DfWsbCjs4mpCmn/vlRp70rbUS3a8pQY1Ms=
X-Received: by 2002:a05:6a21:78d:b0:3b4:b259:74e3 with SMTP id adf61e73a8af0-3bd10b3f84cmr21941039637.31.1782634663201;
        Sun, 28 Jun 2026 01:17:43 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm6020434a12.31.2026.06.28.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:17:42 -0700 (PDT)
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
	shuah@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v2 2/3] riscv, bpf: Add support for BPF exceptions
Date: Sun, 28 Jun 2026 13:47:09 +0530
Message-ID: <20260628081710.113333-3-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081710.113333-1-varunrmallya@gmail.com>
References: <20260628081710.113333-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_011744_332355_1DE332C4 
X-CRM114-Status: GOOD (  20.01  )
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

Add the JIT support required for BPF exceptions (bpf_throw()) on riscv64.

Two kinds of program need special prologue/epilogue handling:

  - A program acting as an exception boundary must save the full set of
    riscv callee-saved GP registers (ra, s0-s11), not just the ones it
    happens to clobber, so that the exception callback can restore the
    state that was live at the boundary. ra and fp are stored first so
    the saved ra/fp pair forms a valid stackframe record for the
    unwinder.

  - The exception callback (exception_cb) does not allocate its own
    frame. It reuses the boundary program's frame, whose frame pointer
    is passed in a2, by setting SP = FP - stack_adjust. This lines the
    epilogue's loads up with the registers the boundary saved, so both
    paths restore the same order.

Wire up bpf_jit_support to be true only when CONFIG_FRAME_POINTER is
enabled.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
Reviewed-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 115 ++++++++++++++++++++++++++++----
 1 file changed, 102 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c03c1de16b79..c6e2f852e854 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -56,6 +56,30 @@ static const int pt_regmap[] = {
 	[RV_REG_T0] = offsetof(struct pt_regs, t0),
 };
 
+/*
+ * Full set of RISC-V callee-saved GP registers (ra, s0-s11) saved by a program
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
 	RV_CTX_F_SEEN_TAIL_CALL =	0,
 	RV_CTX_F_SEEN_CALL =		RV_REG_RA,
@@ -231,6 +255,22 @@ static void emit_imm(u8 rd, s64 val, struct rv_jit_context *ctx)
 static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 {
 	int stack_adjust = ctx->stack_size, store_offset = stack_adjust - 8;
+	struct bpf_prog_aux *aux = ctx->prog->aux;
+	int i;
+
+	if (aux->exception_boundary || aux->exception_cb) {
+		/*
+		 * An exception boundary saved the full callee-saved register
+		 * set and the exception callback restores it from the boundary's
+		 * frame. Both restore the same fixed set, in the same order it
+		 * was stored by bpf_jit_build_prologue().
+		 */
+		for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+			emit_ld(rv_exception_csave_regs[i], store_offset, RV_REG_SP, ctx);
+			store_offset -= 8;
+		}
+		goto epilogue_tail;
+	}
 
 	if (seen_reg(RV_REG_RA, ctx)) {
 		emit_ld(RV_REG_RA, store_offset, RV_REG_SP, ctx);
@@ -267,6 +307,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 		store_offset -= 8;
 	}
 
+epilogue_tail:
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
 	if (!is_tail_call)
@@ -2002,11 +2043,61 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 {
 	int i, stack_adjust = 0, store_offset, bpf_stack_adjust;
+	struct bpf_prog_aux *aux = ctx->prog->aux;
 
 	bpf_stack_adjust = round_up(ctx->prog->aux->stack_depth, STACK_ALIGN);
 	if (bpf_stack_adjust)
 		mark_fp(ctx);
 
+	/* emit kcfi type preamble immediately before the first insn */
+	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
+
+	/* nops reserved for auipc+jalr pair */
+	for (i = 0; i < RV_FENTRY_NINSNS; i++)
+		emit(rv_nop(), ctx);
+
+	/* First instruction is always setting the tail-call-counter
+	 * (TCC) register. This instruction is skipped for tail calls.
+	 * Force using a 4-byte (non-compressed) instruction.
+	 */
+	emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
+
+	if (aux->exception_boundary || aux->exception_cb) {
+		/*
+		 * A program acting as an exception boundary saves the full set
+		 * of riscv callee saved registers (ra, s0-s11).
+		 */
+		stack_adjust = round_up(ARRAY_SIZE(rv_exception_csave_regs) * 8,
+					STACK_ALIGN);
+		stack_adjust += bpf_stack_adjust;
+		store_offset = stack_adjust - 8;
+
+		if (!aux->exception_cb && aux->exception_boundary) {
+			/*
+			 * Boundary program: allocate the frame and save the
+			 * full callee-saved set, capturing the caller's values.
+			 */
+			emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
+			for (i = 0; i < ARRAY_SIZE(rv_exception_csave_regs); i++) {
+				emit_sd(RV_REG_SP, store_offset,
+					rv_exception_csave_regs[i], ctx);
+				store_offset -= 8;
+			}
+			emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
+		} else {
+			/*
+			 * Exception callback, reuse the boundary program's
+			 * frame, whose frame pointer is passed in a2. Setting
+			 * SP = FP - stack_adjust lines the epilogue's loads up
+			 * with the registers the boundary saved.
+			 */
+			emit_mv(RV_REG_FP, RV_REG_A2, ctx);
+			emit_addi(RV_REG_SP, RV_REG_FP, -stack_adjust, ctx);
+		}
+
+		goto tail_setup;
+	}
+
 	if (seen_reg(RV_REG_RA, ctx))
 		stack_adjust += 8;
 	stack_adjust += 8; /* RV_REG_FP */
@@ -2030,19 +2121,6 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	store_offset = stack_adjust - 8;
 
-	/* emit kcfi type preamble immediately before the  first insn */
-	emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
-
-	/* nops reserved for auipc+jalr pair */
-	for (i = 0; i < RV_FENTRY_NINSNS; i++)
-		emit(rv_nop(), ctx);
-
-	/* First instruction is always setting the tail-call-counter
-	 * (TCC) register. This instruction is skipped for tail calls.
-	 * Force using a 4-byte (non-compressed) instruction.
-	 */
-	emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
-
 	emit_addi(RV_REG_SP, RV_REG_SP, -stack_adjust, ctx);
 
 	if (seen_reg(RV_REG_RA, ctx)) {
@@ -2082,6 +2160,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
+tail_setup:
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
 
@@ -2157,3 +2236,13 @@ bool bpf_jit_supports_fsession(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_exceptions(void)
+{
+	/*
+	 * bpf_throw() unwinds by walking the frame-pointer chain from inside
+	 * the kernel back into the BPF frames (see arch_bpf_stack_walk()), so
+	 * exceptions require the frame-pointer unwinder to be enabled.
+	 */
+	return IS_ENABLED(CONFIG_FRAME_POINTER);
+}
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
