Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAB9C3ABA5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wwY0BYyCV+W+apZTeUiuZXYrQxcuOm0DMId03StmypE=; b=R7ZFp7gApXkrl4AsMc4+j6MG2L
	ObZdkOcgoYsrKoredjUmNdhz0efR/MihMzwHtTrD9SYCK34g250uvL5gCrvJxk164ElyUax9GJ44t
	nYRPHv1zP3ao3z50ZxnKjah3vXMqkrE0BgwIA7H+U1aIIMr0tSSfM0shOd9jUjElOg97u85qaTRyF
	1vfPkhGPqYTqB1uPW1RFP8Os3c0bsDywiqqSQ17uuZGaTEnMY90qP7eBTyri+caSy5y7oJXcLPObW
	oaZDvjH1oxEVKAgPB8nq/2TWLKyydbbkiF84/b5sSBObmDfBIz2iiLvbfd6Zasu9qgj0LOnjAneMj
	EFq0ENPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlF-0000000BTo5-0Cms;
	Wed, 30 Apr 2025 02:01:21 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vel-0000000BNZX-255r
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:50:36 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-73e0094706bso8121225b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974234; x=1746579034; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SYsvpTSFuwaN3Xhjb+Bga83BKgbo4zszHWjKjZxV+xU=;
        b=cv0SddGkdNPZ97kKYI2khY/aelHQfcKkbuxiWJQdLxJI4N4Q1ucF5b/U69ded2a3d5
         7ed9jGulvF4AKSmiLZNC2OiXXJIBXn8SaCSKZLL1B0VwepmzHoamOJw1IieMbjC/sHTW
         fgf/KWxoF55M4ej96fYOIdi2GlwdpyPsQ82xUhe2FV8nlT32WgsPVKUZa+hozZNr6DxK
         8dBzfKZbWYoyc5LBaL9ztI0WZiFQB1AttVNwMFqkyqsfdrqTLJUP8yRmtYiAj4kKuult
         UrdLZSVQJjjwys2NqVYMEA0/xtleUOMNj/fgMIhyAx5CiLC109hKyey+5UUa3S8NXVGI
         Ak5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974234; x=1746579034;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYsvpTSFuwaN3Xhjb+Bga83BKgbo4zszHWjKjZxV+xU=;
        b=qh7VUc1TEeOYCmTHlUadFiJysYCAY+yTtCoWg7zgBs3Zj+wXfPiZZXhKNdeb3SlTes
         HmozSPTPouqEE9fAdQs54GdgA4s/CLbm6C5/NaWVBdu+kF+a8OseKuTKoG8aO9kTFRM0
         YY1hwZsZvrKO8VMFg1tGk2YHtXcyF669bycoTK+gMvp1L8+SyOWg4QXWONZMfTVmuO1F
         d5QIR0Xob56maODrzZpKLd8pqZgRM7cYruMM6CXfAQDSm8f/471jY+DQSYCi4XglkVJc
         uB95vJxd/Q667BKEe7uYZd7Whu+ALP/o8L22a59LEMX1FjcmdT3nlIefFOP70Dve7mTj
         Sn4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1n+MSW9ZArdo/cjOwJyxAlsU0n6nPs07NiO5y87rAknKwLbO1x4x++DwVJTnGAlNtzXYj1c1dKbQfHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5DXb1SSyt7DavsNiY/+VYL/P1htZPbMaiDuuoFSpHVKKN8rmy
	A8DHt1D5ZO3AG3y15dSp7an/eY89rSM+rFZLX+YLW00AaBHRJrbyp0Q7YAa+P3ezsK7fwA73OGS
	SGJ3Dt3qGfw==
X-Google-Smtp-Source: AGHT+IHDsfr6K/xh6p7tpN54bW5XPrAGmzEBjUpdz1fyQMUjC+FLOSn9Y1qnxExjMJLfqqPWGSuzMoh4lQRVsA==
X-Received: from pfjt22.prod.google.com ([2002:a05:6a00:21d6:b0:73c:28d4:aca4])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e0e:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-74038abfa63mr1850483b3a.21.1745974234407;
 Tue, 29 Apr 2025 17:50:34 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:50:29 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <3fd92afabeb9ed92a513b2c0aac091b69dbb76aa.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 2/8] bpf, riscv64: Introduce emit_load_*() and emit_store_*()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Andrea Parri <parri.andrea@gmail.com>, linux-riscv@lists.infradead.org, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>, 
	Peilin Ye <yepeilin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_175035_538358_AADA43B7 
X-CRM114-Status: GOOD (  12.67  )
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

From: Andrea Parri <parri.andrea@gmail.com>

We're planning to add support for the load-acquire and store-release
BPF instructions.  Define emit_load_<size>() and emit_store_<size>()
to enable/facilitate the (re)use of their code.

Tested-by: Peilin Ye <yepeilin@google.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
[yepeilin@google.com: cosmetic change to commit title]
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 242 +++++++++++++++++++-------------
 1 file changed, 143 insertions(+), 99 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index ca60db75199d..953b6a20c69f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -473,6 +473,140 @@ static inline void emit_kcfi(u32 hash, struct rv_jit_context *ctx)
 		emit(hash, ctx);
 }
 
+static int emit_load_8(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	int insns_start;
+
+	if (is_12b_int(off)) {
+		insns_start = ctx->ninsns;
+		if (sign_ext)
+			emit(rv_lb(rd, off, rs), ctx);
+		else
+			emit(rv_lbu(rd, off, rs), ctx);
+		return ctx->ninsns - insns_start;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
+	insns_start = ctx->ninsns;
+	if (sign_ext)
+		emit(rv_lb(rd, 0, RV_REG_T1), ctx);
+	else
+		emit(rv_lbu(rd, 0, RV_REG_T1), ctx);
+	return ctx->ninsns - insns_start;
+}
+
+static int emit_load_16(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	int insns_start;
+
+	if (is_12b_int(off)) {
+		insns_start = ctx->ninsns;
+		if (sign_ext)
+			emit(rv_lh(rd, off, rs), ctx);
+		else
+			emit(rv_lhu(rd, off, rs), ctx);
+		return ctx->ninsns - insns_start;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
+	insns_start = ctx->ninsns;
+	if (sign_ext)
+		emit(rv_lh(rd, 0, RV_REG_T1), ctx);
+	else
+		emit(rv_lhu(rd, 0, RV_REG_T1), ctx);
+	return ctx->ninsns - insns_start;
+}
+
+static int emit_load_32(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	int insns_start;
+
+	if (is_12b_int(off)) {
+		insns_start = ctx->ninsns;
+		if (sign_ext)
+			emit(rv_lw(rd, off, rs), ctx);
+		else
+			emit(rv_lwu(rd, off, rs), ctx);
+		return ctx->ninsns - insns_start;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
+	insns_start = ctx->ninsns;
+	if (sign_ext)
+		emit(rv_lw(rd, 0, RV_REG_T1), ctx);
+	else
+		emit(rv_lwu(rd, 0, RV_REG_T1), ctx);
+	return ctx->ninsns - insns_start;
+}
+
+static int emit_load_64(bool sign_ext, u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	int insns_start;
+
+	if (is_12b_int(off)) {
+		insns_start = ctx->ninsns;
+		emit_ld(rd, off, rs, ctx);
+		return ctx->ninsns - insns_start;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
+	insns_start = ctx->ninsns;
+	emit_ld(rd, 0, RV_REG_T1, ctx);
+	return ctx->ninsns - insns_start;
+}
+
+static void emit_store_8(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	if (is_12b_int(off)) {
+		emit(rv_sb(rd, off, rs), ctx);
+		return;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+	emit(rv_sb(RV_REG_T1, 0, rs), ctx);
+}
+
+static void emit_store_16(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	if (is_12b_int(off)) {
+		emit(rv_sh(rd, off, rs), ctx);
+		return;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+	emit(rv_sh(RV_REG_T1, 0, rs), ctx);
+}
+
+static void emit_store_32(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	if (is_12b_int(off)) {
+		emit_sw(rd, off, rs, ctx);
+		return;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+	emit_sw(RV_REG_T1, 0, rs, ctx);
+}
+
+static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
+{
+	if (is_12b_int(off)) {
+		emit_sd(rd, off, rs, ctx);
+		return;
+	}
+
+	emit_imm(RV_REG_T1, off, ctx);
+	emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+	emit_sd(RV_REG_T1, 0, rs, ctx);
+}
+
 static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 			struct rv_jit_context *ctx)
 {
@@ -1650,8 +1784,8 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
 	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
 	{
-		int insn_len, insns_start;
 		bool sign_ext;
+		int insn_len;
 
 		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
 			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
@@ -1663,78 +1797,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
-			if (is_12b_int(off)) {
-				insns_start = ctx->ninsns;
-				if (sign_ext)
-					emit(rv_lb(rd, off, rs), ctx);
-				else
-					emit(rv_lbu(rd, off, rs), ctx);
-				insn_len = ctx->ninsns - insns_start;
-				break;
-			}
-
-			emit_imm(RV_REG_T1, off, ctx);
-			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
-			insns_start = ctx->ninsns;
-			if (sign_ext)
-				emit(rv_lb(rd, 0, RV_REG_T1), ctx);
-			else
-				emit(rv_lbu(rd, 0, RV_REG_T1), ctx);
-			insn_len = ctx->ninsns - insns_start;
+			insn_len = emit_load_8(sign_ext, rd, off, rs, ctx);
 			break;
 		case BPF_H:
-			if (is_12b_int(off)) {
-				insns_start = ctx->ninsns;
-				if (sign_ext)
-					emit(rv_lh(rd, off, rs), ctx);
-				else
-					emit(rv_lhu(rd, off, rs), ctx);
-				insn_len = ctx->ninsns - insns_start;
-				break;
-			}
-
-			emit_imm(RV_REG_T1, off, ctx);
-			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
-			insns_start = ctx->ninsns;
-			if (sign_ext)
-				emit(rv_lh(rd, 0, RV_REG_T1), ctx);
-			else
-				emit(rv_lhu(rd, 0, RV_REG_T1), ctx);
-			insn_len = ctx->ninsns - insns_start;
+			insn_len = emit_load_16(sign_ext, rd, off, rs, ctx);
 			break;
 		case BPF_W:
-			if (is_12b_int(off)) {
-				insns_start = ctx->ninsns;
-				if (sign_ext)
-					emit(rv_lw(rd, off, rs), ctx);
-				else
-					emit(rv_lwu(rd, off, rs), ctx);
-				insn_len = ctx->ninsns - insns_start;
-				break;
-			}
-
-			emit_imm(RV_REG_T1, off, ctx);
-			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
-			insns_start = ctx->ninsns;
-			if (sign_ext)
-				emit(rv_lw(rd, 0, RV_REG_T1), ctx);
-			else
-				emit(rv_lwu(rd, 0, RV_REG_T1), ctx);
-			insn_len = ctx->ninsns - insns_start;
+			insn_len = emit_load_32(sign_ext, rd, off, rs, ctx);
 			break;
 		case BPF_DW:
-			if (is_12b_int(off)) {
-				insns_start = ctx->ninsns;
-				emit_ld(rd, off, rs, ctx);
-				insn_len = ctx->ninsns - insns_start;
-				break;
-			}
-
-			emit_imm(RV_REG_T1, off, ctx);
-			emit_add(RV_REG_T1, RV_REG_T1, rs, ctx);
-			insns_start = ctx->ninsns;
-			emit_ld(rd, 0, RV_REG_T1, ctx);
-			insn_len = ctx->ninsns - insns_start;
+			insn_len = emit_load_64(sign_ext, rd, off, rs, ctx);
 			break;
 		}
 
@@ -1879,44 +1951,16 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 	/* STX: *(size *)(dst + off) = src */
 	case BPF_STX | BPF_MEM | BPF_B:
-		if (is_12b_int(off)) {
-			emit(rv_sb(rd, off, rs), ctx);
-			break;
-		}
-
-		emit_imm(RV_REG_T1, off, ctx);
-		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
-		emit(rv_sb(RV_REG_T1, 0, rs), ctx);
+		emit_store_8(rd, off, rs, ctx);
 		break;
 	case BPF_STX | BPF_MEM | BPF_H:
-		if (is_12b_int(off)) {
-			emit(rv_sh(rd, off, rs), ctx);
-			break;
-		}
-
-		emit_imm(RV_REG_T1, off, ctx);
-		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
-		emit(rv_sh(RV_REG_T1, 0, rs), ctx);
+		emit_store_16(rd, off, rs, ctx);
 		break;
 	case BPF_STX | BPF_MEM | BPF_W:
-		if (is_12b_int(off)) {
-			emit_sw(rd, off, rs, ctx);
-			break;
-		}
-
-		emit_imm(RV_REG_T1, off, ctx);
-		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
-		emit_sw(RV_REG_T1, 0, rs, ctx);
+		emit_store_32(rd, off, rs, ctx);
 		break;
 	case BPF_STX | BPF_MEM | BPF_DW:
-		if (is_12b_int(off)) {
-			emit_sd(rd, off, rs, ctx);
-			break;
-		}
-
-		emit_imm(RV_REG_T1, off, ctx);
-		emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
-		emit_sd(RV_REG_T1, 0, rs, ctx);
+		emit_store_64(rd, off, rs, ctx);
 		break;
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
