Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D98BCD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 15:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7GtTtj3jdiF5uYQR1Ht4cvrBl60Esu2P5INU6k8JGo=; b=tX4VR7522xNcNB
	j21AOifKw0QerQjAex6I9Oi6zGI88QckmGuRL+Lj+SIYKS8CGHlV4skHyqTx9INntZndKVi0s87N6
	jdD7ihqYXuJ90CaXb4hkKl76wyw/797QrELziEUM1VUbiMgujRn7jTyq++ToV36O6jDZPjnNKFhR4
	LEwFWYayl8k7tOx3EUBmExTGGLAtpjJeD3IPpgKGClsNZqOOq/98OLlp2iSBXH6zxf9+QLV/DoWof
	wK2Ul36x0+ljSapWf/hoZJ7OMhzNr8ABCCenGk6TBkAGtnL+fkBn0T5C1lnTeuGoc1V11wTTYKa/N
	sZSZDcMwtuHxy5ok77fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3ad-0000000AfAK-2DFa;
	Sat, 23 Mar 2024 15:47:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro3aZ-0000000Af9S-29Sr
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 15:47:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33e1d327595so2310785f8f.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711208837; x=1711813637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYcdKvrH334e2k0Y2PcCA4T8trIDzqn6L6Ft1Vz/dXg=;
        b=auEAQFxQQWTTvl+aZyOY0uhoD9rcBJgHLabSTmVO0QOj8gPxKa/p315QUxD/48Xpgv
         Bh++OY5fCLCh30p4KqJeqeZZgQRW+H/idDnzz96ohEs+fMRw/0X8iUSQIxqe+O7qAc8f
         LNDjbMtx/hBsCknyKU5cDZuEtL5RDcHbDzg89zahigjY22Swi0Z7P+0uq5Bk/IrB3dOa
         LokthqYvJ2zit8RF2xOuPpoYBE9ksIvcnHmSZPScJ8KtXE4wGrnIO+8+WNRK9dvhDaFx
         Uk4VPbtYYiTQjTNi6liGY/TNlbTi06WEkd9ypfRW93D3o3jokRybOfNBJnGeERv1K+TT
         Jt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711208837; x=1711813637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYcdKvrH334e2k0Y2PcCA4T8trIDzqn6L6Ft1Vz/dXg=;
        b=ALC8RhQqvgbx5KKt4B9gXNrezRvf1q8hxxZ5KvXVTW5CyVR1mEONDs3rIwdDDlsIQd
         KXC4fewzTjKY8ybG1nCg3HqtYPFXHeNj/LghPd3gWqlpBjQAd8P2zqam/VcX6G8xxGrs
         4EKGQgJ3gj10WornwwoKhsb/1fESyWsk+c0Rx2sFqT3C4/ngD+AnZKe0OnX3iCUXkirl
         6UHMtrvUoHm3943FXGXogqb5rZehOcTWkbQ72gxtLprbvwFTnpPKDgQ2NvE0TX8o8y80
         YRp1MT7bt6rf10FQ9IWhOWYQBQccV52FokymlYmwHDV1LHWnqJFU+EpZUKCFnCt5DeHC
         RLIg==
X-Forwarded-Encrypted: i=1; AJvYcCXC0qLlVnWMa+TKeBgaUAjkc7gOK4HXLeOfZ/GVOEL6llM/rUP9NjRqe8ETrCBjjxolhLGCjQXzebHKKt2jnE+CWcwOj01Tks65yGXmVCqs
X-Gm-Message-State: AOJu0YwO09wWBnW+/XgCvAEv0RHWFzAGdSPGcVAE2Sf7MsmgzF0RDkFN
	M/Ahe+7ZqmggiD2gb1qGJz0a10nHVjm3mAsMGDCfv5GrzZFEZI8Y
X-Google-Smtp-Source: AGHT+IGbwZZVJIKX1KxuU36E5zIZfYcNyOZAatMQfr7PoMcqlJAB5lw+1vkR+nKkkVDw8ccVt0RLiA==
X-Received: by 2002:adf:eb88:0:b0:341:c673:f1e8 with SMTP id t8-20020adfeb88000000b00341c673f1e8mr232997wrn.9.1711208837216;
        Sat, 23 Mar 2024 08:47:17 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b004147f7f70c3sm2794298wmq.39.2024.03.23.08.47.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Mar 2024 08:47:16 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 1/2] bpf,riscv: Implement PROBE_MEM32 pseudo instructions
Date: Sat, 23 Mar 2024 15:46:51 +0000
Message-Id: <20240323154652.54572-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240323154652.54572-1-puranjay12@gmail.com>
References: <20240323154652.54572-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_084719_582377_793A866A 
X-CRM114-Status: GOOD (  21.45  )
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

Add support for [LDX | STX | ST], PROBE_MEM32, [B | H | W | DW]
instructions.  They are similar to PROBE_MEM instructions with the
following differences:
- PROBE_MEM32 supports store.
- PROBE_MEM32 relies on the verifier to clear upper 32-bit of the
  src/dst register
- PROBE_MEM32 adds 64-bit kern_vm_start address (which is stored in S11
  in the prologue). Due to bpf_arena constructions such S11 + reg +
  off16 access is guaranteed to be within arena virtual range, so no
  address check at run-time.
- S11 is a free callee-saved register, so it is used to store kern_vm_start
- PROBE_MEM32 allows STX and ST. If they fault the store is a nop. When
  LDX faults the destination register is zeroed.

To support these on riscv, we do tmp = S11 + src/dst reg and then use
tmp2 as the new src/dst register. This allows us to reuse most of the
code for normal [LDX | STX | ST].

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/net/bpf_jit.h        |   1 +
 arch/riscv/net/bpf_jit_comp64.c | 193 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |   2 +
 3 files changed, 193 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index f4b6b3b9edda..8a47da08dd9c 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -81,6 +81,7 @@ struct rv_jit_context {
 	int nexentries;
 	unsigned long flags;
 	int stack_size;
+	u64 arena_vm_start;
 };
 
 /* Convert from ninsns to bytes. */
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index aac190085472..f51b832eafb6 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -255,6 +255,10 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 		emit_ld(RV_REG_S6, store_offset, RV_REG_SP, ctx);
 		store_offset -= 8;
 	}
+	if (ctx->arena_vm_start) {
+		emit_ld(RV_REG_S11, store_offset, RV_REG_SP, ctx);
+		store_offset -= 8;
+	}
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -548,6 +552,7 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
 #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
+#define DONT_CLEAR		16	/* RV_REG_A6 unused in BPF */
 
 bool ex_handler_bpf(const struct exception_table_entry *ex,
 		    struct pt_regs *regs)
@@ -555,7 +560,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 	off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
 	int regs_offset = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
 
-	*(unsigned long *)((void *)regs + pt_regmap[regs_offset]) = 0;
+	if (regs_offset != DONT_CLEAR)
+		*(unsigned long *)((void *)regs + pt_regmap[regs_offset]) = 0;
 	regs->epc = (unsigned long)&ex->fixup - offset;
 
 	return true;
@@ -572,7 +578,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	off_t fixup_offset;
 
 	if (!ctx->insns || !ctx->ro_insns || !ctx->prog->aux->extable ||
-	    (BPF_MODE(insn->code) != BPF_PROBE_MEM && BPF_MODE(insn->code) != BPF_PROBE_MEMSX))
+	    (BPF_MODE(insn->code) != BPF_PROBE_MEM && BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
+	     BPF_MODE(insn->code) != BPF_PROBE_MEM32))
 		return 0;
 
 	if (WARN_ON_ONCE(ctx->nexentries >= ctx->prog->aux->num_exentries))
@@ -622,6 +629,9 @@ static int add_exception_handler(const struct bpf_insn *insn,
 
 	ex->insn = ins_offset;
 
+	if (BPF_CLASS(insn->code) != BPF_LDX)
+		dst_reg = DONT_CLEAR;
+
 	ex->fixup = FIELD_PREP(BPF_FIXUP_OFFSET_MASK, fixup_offset) |
 		FIELD_PREP(BPF_FIXUP_REG_MASK, dst_reg);
 	ex->type = EX_TYPE_BPF;
@@ -1063,7 +1073,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		    BPF_CLASS(insn->code) == BPF_JMP;
 	int s, e, rvoff, ret, i = insn - ctx->prog->insnsi;
 	struct bpf_prog_aux *aux = ctx->prog->aux;
-	u8 rd = -1, rs = -1, code = insn->code;
+	u8 rd = -1, rs = -1, code = insn->code, reg_arena_vm_start = RV_REG_S11;
 	s16 off = insn->off;
 	s32 imm = insn->imm;
 
@@ -1523,6 +1533,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + S11 + off)*/
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
 	{
 		int insn_len, insns_start;
 		bool sign_ext;
@@ -1530,6 +1545,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		sign_ext = BPF_MODE(insn->code) == BPF_MEMSX ||
 			   BPF_MODE(insn->code) == BPF_PROBE_MEMSX;
 
+		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
+			emit_add(RV_REG_T2, rs, reg_arena_vm_start, ctx);
+			rs = RV_REG_T2;
+		}
+
 		switch (BPF_SIZE(code)) {
 		case BPF_B:
 			if (is_12b_int(off)) {
@@ -1666,6 +1686,87 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		emit_sd(RV_REG_T2, 0, RV_REG_T1, ctx);
 		break;
 
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_ST | BPF_PROBE_MEM32 | BPF_DW:
+	{
+		int insn_len, insns_start;
+
+		emit_add(RV_REG_T3, rd, reg_arena_vm_start, ctx);
+		rd = RV_REG_T3;
+
+		/* Load imm to a register then store it */
+		emit_imm(RV_REG_T1, imm, ctx);
+
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit(rv_sb(rd, off, RV_REG_T1), ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T2, off, ctx);
+			emit_add(RV_REG_T2, RV_REG_T2, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit(rv_sb(RV_REG_T2, 0, RV_REG_T1), ctx);
+			insn_len = ctx->ninsns - insns_start;
+
+			break;
+
+		case BPF_H:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit(rv_sh(rd, off, RV_REG_T1), ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T2, off, ctx);
+			emit_add(RV_REG_T2, RV_REG_T2, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit(rv_sh(RV_REG_T2, 0, RV_REG_T1), ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		case BPF_W:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit_sw(rd, off, RV_REG_T1, ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T2, off, ctx);
+			emit_add(RV_REG_T2, RV_REG_T2, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit_sw(RV_REG_T2, 0, RV_REG_T1, ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		case BPF_DW:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit_sd(rd, off, RV_REG_T1, ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T2, off, ctx);
+			emit_add(RV_REG_T2, RV_REG_T2, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit_sd(RV_REG_T2, 0, RV_REG_T1, ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		}
+
+		ret = add_exception_handler(insn, ctx, rd, insn_len);
+		if (ret)
+			return ret;
+
+		break;
+	}
+
 	/* STX: *(size *)(dst + off) = src */
 	case BPF_STX | BPF_MEM | BPF_B:
 		if (is_12b_int(off)) {
@@ -1712,6 +1813,83 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		emit_atomic(rd, rs, off, imm,
 			    BPF_SIZE(code) == BPF_DW, ctx);
 		break;
+
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_STX | BPF_PROBE_MEM32 | BPF_DW:
+	{
+		int insn_len, insns_start;
+
+		emit_add(RV_REG_T2, rd, reg_arena_vm_start, ctx);
+		rd = RV_REG_T2;
+
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit(rv_sb(rd, off, rs), ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T1, off, ctx);
+			emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit(rv_sb(RV_REG_T1, 0, rs), ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		case BPF_H:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit(rv_sh(rd, off, rs), ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T1, off, ctx);
+			emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit(rv_sh(RV_REG_T1, 0, rs), ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		case BPF_W:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit_sw(rd, off, rs, ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T1, off, ctx);
+			emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit_sw(RV_REG_T1, 0, rs, ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		case BPF_DW:
+			if (is_12b_int(off)) {
+				insns_start = ctx->ninsns;
+				emit_sd(rd, off, rs, ctx);
+				insn_len = ctx->ninsns - insns_start;
+				break;
+			}
+
+			emit_imm(RV_REG_T1, off, ctx);
+			emit_add(RV_REG_T1, RV_REG_T1, rd, ctx);
+			insns_start = ctx->ninsns;
+			emit_sd(RV_REG_T1, 0, rs, ctx);
+			insn_len = ctx->ninsns - insns_start;
+			break;
+		}
+
+		ret = add_exception_handler(insn, ctx, rd, insn_len);
+		if (ret)
+			return ret;
+
+		break;
+	}
+
 	default:
 		pr_err("bpf-jit: unknown opcode %02x\n", code);
 		return -EINVAL;
@@ -1743,6 +1921,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		stack_adjust += 8;
 	if (seen_reg(RV_REG_S6, ctx))
 		stack_adjust += 8;
+	if (ctx->arena_vm_start)
+		stack_adjust += 8;
 
 	stack_adjust = round_up(stack_adjust, 16);
 	stack_adjust += bpf_stack_adjust;
@@ -1794,6 +1974,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		emit_sd(RV_REG_SP, store_offset, RV_REG_S6, ctx);
 		store_offset -= 8;
 	}
+	if (ctx->arena_vm_start) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S11, ctx);
+		store_offset -= 8;
+	}
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
@@ -1807,6 +1991,9 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		emit_mv(RV_REG_TCC_SAVED, RV_REG_TCC, ctx);
 
 	ctx->stack_size = stack_adjust;
+
+	if (ctx->arena_vm_start)
+		emit_imm(RV_REG_S11, ctx->arena_vm_start, ctx);
 }
 
 void bpf_jit_build_epilogue(struct rv_jit_context *ctx)
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 6b3acac30c06..9b6696b1290a 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -50,6 +50,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 	int pass = 0, prev_ninsns = 0, i;
 	struct rv_jit_data *jit_data;
 	struct rv_jit_context *ctx;
+	u64 arena_vm_start;
 
 	if (!prog->jit_requested)
 		return orig_prog;
@@ -80,6 +81,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 		goto skip_init_ctx;
 	}
 
+	ctx->arena_vm_start = bpf_arena_get_kern_vm_start(prog->aux->arena);
 	ctx->prog = prog;
 	ctx->offset = kcalloc(prog->len, sizeof(int), GFP_KERNEL);
 	if (!ctx->offset) {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
