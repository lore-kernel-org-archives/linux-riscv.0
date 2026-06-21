Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B522DCD98F0
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jun 2026 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06gK4cenekL/RLKeetzIZkCdqpxetjjTkXe/NGNV0Jo=; b=CqI8/+3bTj/fFN
	GKktAfT5zmAb0aI7kj8lBOeF7U69qgRXvYKeXfhZDglip6PiDyRKo3vMC/SWsHOhX0PDG9MGYOxMe
	1aGZHgXGuRVr532jA4u4LNL8lmVh3XPGo5U9hoJuoy1t7x+qy2lqyRL1dckrzTWWw52kPQeuf/Ja8
	1+uxzROrdqAmGRNcX0HeImMswSnKhcbSPVAkLBOe8+MouDFf3szkucR8LJ22yV3aSCJVewpauQ7R6
	Ps7ugOdy8NYBfZ5iLUM02Y2Osy7WUvy4T+YtvjE/SJttjihAd4gSTN5hoJVd/XmlG1FKForfSdZl/
	u2EyQlL//DkCWb8k2JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOY-00000003zuX-1Unx;
	Sun, 21 Jun 2026 14:43:34 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbJOV-00000003ztt-2VrJ
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jun 2026 14:43:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8456005a6c4so813200b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782053011; x=1782657811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L1IGDwSo3IngnCe3HqBNRffP7FgjigbpkTmExCV6uk=;
        b=XBHwcW8CKYNXGegHxpbN7FE3R1c6Oqypo9GToT8ILhFbw6n0AiJlMxaqSsg8olKSoB
         9ouIPiOxtPzdtvW0mvD2rVt59yYrLH7S85bLl/R618ZaizzQB54G76SHjAOle3p9q9KH
         ViJjNWKJxTugp67hhmrEF1xxfosDNqHMjX5U3i4IkzL60h6vpSwGbti6PMBgQUTRfk1C
         ctgZ5WFFQMWIn4jRc55Ypo3MyMvcZS/EX4nNf1rOltCMCs+gvLgQuRDutj4iouesJQxj
         TsguoCBdydxHOabtpCbNbF4ftaCeLu87Gp7NTklbtCuAATF9lMSsf5L5yJJBNGI0E79J
         uB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782053011; x=1782657811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L1IGDwSo3IngnCe3HqBNRffP7FgjigbpkTmExCV6uk=;
        b=SWAGRW4uda8fXbyizU+1YXJc81SA4WB0ALHXuUOO5UnZ4O1/uW8ZyS98+WT8CU5sYb
         LT4YuSXD6K3BgE2zuLt2lbb+6zZGazp+QCrU4B01E5CA6rfYorr2JhkGsGH9juVLmOD0
         wIf9Gm/HAMgQr5BY+5wEivwpcMDOpMzzgx+avJDQJ5Wjw1S67a71hJat/cLekXwcomxx
         9vyu0uZysun1ckIDNJaf74SRzXm8rFG/slBN5Vh7MDt9+Yz0Epl+VrhMeby7YI8h1HAm
         eNYqOvoEH56nfU+9ma1wGYnYfjGv+WDTZn+cAr4U3aJSiAuM/6M9fP92UyOQCYHGXac4
         eDwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRMm00rWGQUaoxLx67M7m88VmKLKYmYacxYSPcBaFYeqeDxtypsuTgk+P9koW/8QAVnkUb/WuC9Bf+8A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8K6/mXhzRzB2OxdD7zb6GltwY35Sy5mfZPexqMmKN8jaPo5x1
	6eem7EMeE/+5McLgNXu5l8FU4uoLos1VEXhzqLMORCdfYzeaZh8AzLJP
X-Gm-Gg: AfdE7ck687E9HRr3t72weA3X2u7mMqzkmAMvD8STEzSM+jBGk3JLT2TPpdmSPYFZmG3
	Rcah8IWxGQKGmUy9rUEgObbxJwBc13QkKpi2SDlciEohKO2JHjbDJ/Bl7tyKG0UxkYPIQZhfWhA
	Jt8snK+XoXLEU3xejlvJXc4ifkBqxstHP0AH20jiQI/tZDJNW86/bTKkCNe01YEFZ1y4hxRDc45
	fDq5dO1uOYMauXarmoGksUqmWaQnLXeZNL9AZf3JeUK4giNZaHsZODkBLiWFCCLkqoOb28DiDP3
	ry2oU5kL8zeWmryZldLnjGvnXb1Q/PQBtJ2vh1gq6I1UCgxlCrItPMjTRZoWWMBJQtHNEKYEP26
	jVvBPRAN2/I6cG8tm+0FGsgyzpWpq9URWtzDD/FTJkEvMOsROoE5UCYPCa3r9IlyvGKnqNCAzRB
	FnsDqqszC8ueAMqg6+tbMErd5P3ia5
X-Received: by 2002:a05:6a00:b42:b0:845:313c:d6c2 with SMTP id d2e1a72fcca58-8455089ecc1mr11704474b3a.31.1782053010671;
        Sun, 21 Jun 2026 07:43:30 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7687csm4963254b3a.35.2026.06.21.07.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:43:30 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Date: Sun, 21 Jun 2026 20:12:58 +0530
Message-ID: <20260621144259.288135-3-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621144259.288135-1-varunrmallya@gmail.com>
References: <20260621144259.288135-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_074331_644973_5E551FF7 
X-CRM114-Status: GOOD (  18.73  )
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
---
 arch/riscv/net/bpf_jit_comp64.c | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index c03c1de16b79..eafac0655dab 100644
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
+		/* emit kcfi type preamble immediately before the first insn */
+		emit_kcfi(is_subprog ? cfi_bpf_subprog_hash : cfi_bpf_hash, ctx);
+
+		/* nops reserved for auipc+jalr pair */
+		for (i = 0; i < RV_FENTRY_NINSNS; i++)
+			emit(rv_nop(), ctx);
+
+		/* First instruction is always setting the tail-call-counter
+		 * (TCC) register. This instruction is skipped for tail calls.
+		 * Force using a 4-byte (non-compressed) instruction.
+		 */
+		emit(rv_addi(RV_REG_TCC, RV_REG_ZERO, MAX_TAIL_CALL_CNT), ctx);
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
@@ -2082,6 +2173,7 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
+tail_setup:
 	if (bpf_stack_adjust)
 		emit_addi(RV_REG_S5, RV_REG_SP, bpf_stack_adjust, ctx);
 
@@ -2157,3 +2249,13 @@ bool bpf_jit_supports_fsession(void)
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
