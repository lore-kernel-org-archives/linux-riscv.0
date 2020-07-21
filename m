Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C5AC433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 02:53:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9699C207DD
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 02:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+ma0pne";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.washington.edu header.i=@cs.washington.edu header.b="gRsu9i6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9699C207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.washington.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ua8bMfs6iPSuJeqAvS2rZ3VYDb+5SqmzZeK6eLx/gVU=; b=E+ma0pne5FkhUFjnnaerUvi3i
	uAz1QiPw5J8OpTxWVFRqK8gNJlJaFcOR1DdbP0YMmVNvOYioqd8gyFJv8KYAaJUPdivBYAvnF1Xlk
	An2j4iyzwzXlOjbc+/DP+xBK1HQwZJdYT+sdf2v/UCo15c3z6Agv5NvCKrdYkVuJeQTxI28RICKCS
	Zkk/0Go6AuvdilwhKirUG5o+0IpKjoupyPvZ+U1pt21Ed6RhcYhGY5w0rTYW1QjmqpKa26ObzkHNR
	MGcOP6s7ujIqd241KiMPMLt+VyAzT0x3ayVxUvXls/q6VzSkM05i0g56CydFt0TzC657rw9bHwAFv
	uP8iJDOKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxiOn-0005te-0b; Tue, 21 Jul 2020 02:52:57 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxiOj-0005q7-8s
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 02:52:54 +0000
Received: by mail-pg1-x541.google.com with SMTP id e8so11257113pgc.5
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 19:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs.washington.edu; s=goo201206;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZLQrY/UxqOtjwjwh/fxvAJLrfWIZm1b3xNWosA3saFY=;
 b=gRsu9i6MV4eWpF19q01vv2BC0F3TlknCkO9P0X8iCUUE48ncCkyH2TORh8i6O2HHgL
 tR4jT7e84z2ZbKs4m1KV4MsIxSSFHOf3myiJlh2YPg4E9QZsvSLpY4yQNyw6A8oQsH0N
 lg79Ek8LMaooCc29SJQgT780v3nihRW+3kG4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZLQrY/UxqOtjwjwh/fxvAJLrfWIZm1b3xNWosA3saFY=;
 b=pifW/kb7d2kPXUhf8gwATXrH434aQs/4Z5jRQz9q8nCnduaiaaO06lN0gC0rDCnem3
 tXAHnjiqd09w+oHW1ToQoEvCW9zvaNvM8MTUdgMJU/t4W0RO+EAZtoGDQktLgS1brI9C
 N3eH3NPyfK6tZL5oVMBSlW8qZnAKmZrHL66hbQNQv3wbd5EEGGVjGO26pT/SpZWmectL
 VQ1RkzYyB7bsCefUb57hOK6QD+2YAq49/2rmDltl4v4+mrhtEZhvkWbghVnwDSWq9phi
 LxceDZKNq0HklkiHDwlXvUyZtg+L/g6vn54yDeIhNSUm7vZwdO2KkR2sxqsCK7VTqekI
 e+0w==
X-Gm-Message-State: AOAM5306fLL80BHDJcxqZqTFKw0KXEAqJB+4xuYVaTOxYe/N7UrNc8hE
 cC9UYKkW1Ypf0F0hVagws5OxJw==
X-Google-Smtp-Source: ABdhPJyE3L+cDNdzoHQhi+HQkOXnzOIkbXcyhyTdH5bf+s90354rPpV94ZUn2mHfYv5TWCEwNPntog==
X-Received: by 2002:a62:be04:: with SMTP id l4mr22143227pff.323.1595299965619; 
 Mon, 20 Jul 2020 19:52:45 -0700 (PDT)
Received: from localhost.localdomain (c-73-53-94-119.hsd1.wa.comcast.net.
 [73.53.94.119])
 by smtp.gmail.com with ESMTPSA id m16sm18769753pfd.101.2020.07.20.19.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 19:52:45 -0700 (PDT)
From: Luke Nelson <lukenels@cs.washington.edu>
X-Google-Original-From: Luke Nelson <luke.r.nels@gmail.com>
To: bpf@vger.kernel.org
Subject: [PATCH bpf-next v1 1/3] bpf,
 riscv: Modify JIT ctx to support compressed instructions
Date: Mon, 20 Jul 2020 19:52:38 -0700
Message-Id: <20200721025241.8077-2-luke.r.nels@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200721025241.8077-1-luke.r.nels@gmail.com>
References: <20200721025241.8077-1-luke.r.nels@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_225253_374157_57B5E5B8 
X-CRM114-Status: GOOD (  19.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 linux-riscv@lists.infradead.org, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch makes the necessary changes to struct rv_jit_context and to
bpf_int_jit_compile to support compressed riscv (RVC) instructions in
the BPF JIT.

It changes the JIT image to be u16 instead of u32, since RVC instructions
are 2 bytes as opposed to 4.

It also changes ctx->offset and ctx->ninsns to refer to 2-byte
instructions rather than 4-byte ones. The riscv PC is required to be
16-bit aligned with or without RVC, so this is sufficient to refer to
any valid riscv offset.

The code for computing jump offsets in bytes is updated accordingly,
and factored into a new "ninsns_rvoff" function to simplify the code.

Signed-off-by: Luke Nelson <luke.r.nels@gmail.com>
---
 arch/riscv/net/bpf_jit.h        | 31 ++++++++++++++++++++++++++++---
 arch/riscv/net/bpf_jit_comp32.c | 14 +++++++-------
 arch/riscv/net/bpf_jit_comp64.c | 12 ++++++------
 arch/riscv/net/bpf_jit_core.c   |  6 +++---
 4 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 20e235d06f66..e90d336a9e5f 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -13,6 +13,11 @@
 #include <linux/filter.h>
 #include <asm/cacheflush.h>
 
+static inline bool rvc_enabled(void)
+{
+	return IS_ENABLED(CONFIG_RISCV_ISA_C);
+}
+
 enum {
 	RV_REG_ZERO =	0,	/* The constant value 0 */
 	RV_REG_RA =	1,	/* Return address */
@@ -50,7 +55,7 @@ enum {
 
 struct rv_jit_context {
 	struct bpf_prog *prog;
-	u32 *insns;		/* RV insns */
+	u16 *insns;		/* RV insns */
 	int ninsns;
 	int epilogue_offset;
 	int *offset;		/* BPF to RV */
@@ -58,6 +63,12 @@ struct rv_jit_context {
 	int stack_size;
 };
 
+/* Convert from ninsns to bytes. */
+static inline int ninsns_rvoff(int ninsns)
+{
+	return ninsns << 1;
+}
+
 struct rv_jit_data {
 	struct bpf_binary_header *header;
 	u8 *image;
@@ -74,8 +85,22 @@ static inline void bpf_flush_icache(void *start, void *end)
 	flush_icache_range((unsigned long)start, (unsigned long)end);
 }
 
+/* Emit a 4-byte riscv instruction. */
 static inline void emit(const u32 insn, struct rv_jit_context *ctx)
 {
+	if (ctx->insns) {
+		ctx->insns[ctx->ninsns] = insn;
+		ctx->insns[ctx->ninsns + 1] = (insn >> 16);
+	}
+
+	ctx->ninsns += 2;
+}
+
+/* Emit a 2-byte riscv compressed instruction. */
+static inline void emitc(const u16 insn, struct rv_jit_context *ctx)
+{
+	BUILD_BUG_ON(!rvc_enabled());
+
 	if (ctx->insns)
 		ctx->insns[ctx->ninsns] = insn;
 
@@ -86,7 +111,7 @@ static inline int epilogue_offset(struct rv_jit_context *ctx)
 {
 	int to = ctx->epilogue_offset, from = ctx->ninsns;
 
-	return (to - from) << 2;
+	return ninsns_rvoff(to - from);
 }
 
 /* Return -1 or inverted cond. */
@@ -149,7 +174,7 @@ static inline int rv_offset(int insn, int off, struct rv_jit_context *ctx)
 	off++; /* BPF branch is from PC+1, RV is from PC */
 	from = (insn > 0) ? ctx->offset[insn - 1] : 0;
 	to = (insn + off > 0) ? ctx->offset[insn + off - 1] : 0;
-	return (to - from) << 2;
+	return ninsns_rvoff(to - from);
 }
 
 /* Instruction formats. */
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index b198eaa74456..bc5f2204693f 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -644,7 +644,7 @@ static int emit_branch_r64(const s8 *src1, const s8 *src2, s32 rvoff,
 
 	e = ctx->ninsns;
 	/* Adjust for extra insns. */
-	rvoff -= (e - s) << 2;
+	rvoff -= ninsns_rvoff(e - s);
 	emit_jump_and_link(RV_REG_ZERO, rvoff, true, ctx);
 	return 0;
 }
@@ -713,7 +713,7 @@ static int emit_bcc(u8 op, u8 rd, u8 rs, int rvoff, struct rv_jit_context *ctx)
 	if (far) {
 		e = ctx->ninsns;
 		/* Adjust for extra insns. */
-		rvoff -= (e - s) << 2;
+		rvoff -= ninsns_rvoff(e - s);
 		emit_jump_and_link(RV_REG_ZERO, rvoff, true, ctx);
 	}
 	return 0;
@@ -731,7 +731,7 @@ static int emit_branch_r32(const s8 *src1, const s8 *src2, s32 rvoff,
 
 	e = ctx->ninsns;
 	/* Adjust for extra insns. */
-	rvoff -= (e - s) << 2;
+	rvoff -= ninsns_rvoff(e - s);
 
 	if (emit_bcc(op, lo(rs1), lo(rs2), rvoff, ctx))
 		return -1;
@@ -795,7 +795,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	 * if (index >= max_entries)
 	 *   goto out;
 	 */
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_bcc(BPF_JGE, lo(idx_reg), RV_REG_T1, off, ctx);
 
 	/*
@@ -804,7 +804,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	 *   goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, RV_REG_TCC, -1), ctx);
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_bcc(BPF_JSLT, RV_REG_TCC, RV_REG_ZERO, off, ctx);
 
 	/*
@@ -818,7 +818,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	if (is_12b_check(off, insn))
 		return -1;
 	emit(rv_lw(RV_REG_T0, off, RV_REG_T0), ctx);
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_bcc(BPF_JEQ, RV_REG_T0, RV_REG_ZERO, off, ctx);
 
 	/*
@@ -1214,7 +1214,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 			e = ctx->ninsns;
-			rvoff -= (e - s) << 2;
+			rvoff -= ninsns_rvoff(e - s);
 		}
 
 		if (is64)
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 6cfd164cbe88..55861269da2a 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -304,14 +304,14 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	if (is_12b_check(off, insn))
 		return -1;
 	emit(rv_lwu(RV_REG_T1, off, RV_REG_A1), ctx);
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JGE, RV_REG_A2, RV_REG_T1, off, ctx);
 
 	/* if (TCC-- < 0)
 	 *     goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, tcc, -1), ctx);
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JSLT, tcc, RV_REG_ZERO, off, ctx);
 
 	/* prog = array->ptrs[index];
@@ -324,7 +324,7 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	if (is_12b_check(off, insn))
 		return -1;
 	emit(rv_ld(RV_REG_T2, off, RV_REG_T2), ctx);
-	off = (tc_ninsn - (ctx->ninsns - start_insn)) << 2;
+	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JEQ, RV_REG_T2, RV_REG_ZERO, off, ctx);
 
 	/* goto *(prog->bpf_func + 4); */
@@ -757,7 +757,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			e = ctx->ninsns;
 
 			/* Adjust for extra insns */
-			rvoff -= (e - s) << 2;
+			rvoff -= ninsns_rvoff(e - s);
 		}
 
 		if (BPF_OP(code) == BPF_JSET) {
@@ -810,7 +810,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		e = ctx->ninsns;
 
 		/* Adjust for extra insns */
-		rvoff -= (e - s) << 2;
+		rvoff -= ninsns_rvoff(e - s);
 		emit_branch(BPF_OP(code), rd, rs, rvoff, ctx);
 		break;
 
@@ -831,7 +831,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		if (!is64 && imm < 0)
 			emit(rv_addiw(RV_REG_T1, RV_REG_T1, 0), ctx);
 		e = ctx->ninsns;
-		rvoff -= (e - s) << 2;
+		rvoff -= ninsns_rvoff(e - s);
 		emit_branch(BPF_JNE, RV_REG_T1, RV_REG_ZERO, rvoff, ctx);
 		break;
 
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 709b94ece3ed..3630d447352c 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -73,7 +73,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 
 	if (ctx->offset) {
 		extra_pass = true;
-		image_size = sizeof(u32) * ctx->ninsns;
+		image_size = sizeof(*ctx->insns) * ctx->ninsns;
 		goto skip_init_ctx;
 	}
 
@@ -103,7 +103,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 			if (jit_data->header)
 				break;
 
-			image_size = sizeof(u32) * ctx->ninsns;
+			image_size = sizeof(*ctx->insns) * ctx->ninsns;
 			jit_data->header =
 				bpf_jit_binary_alloc(image_size,
 						     &jit_data->image,
@@ -114,7 +114,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 				goto out_offset;
 			}
 
-			ctx->insns = (u32 *)jit_data->image;
+			ctx->insns = (u16 *)jit_data->image;
 			/*
 			 * Now, when the image is allocated, the image can
 			 * potentially shrink more (auipc/jalr -> jal).
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
