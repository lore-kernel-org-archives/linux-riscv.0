Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F18DC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 15:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YDWDdTHvDSi++e6k6F8nVlkSjbVDgpX01d4JQP/sYI=; b=zFP0FighAxUcwb
	WEY7jwDsr1cqYDwO23PFJqHdncbzr/lb2yoENcXxAOaXMrR2CCPG32VW6Rg1u63c2RRd53UJPOPNk
	WyYKL2NL7f/xK4xloY3GqHolRUy80VIKYIV4HXbjbbW6fBeSqORvvgoDYEQ5igGlPa6n6oklMcQHs
	lXeBJJ5sz6pvkwqD/x8DD0KbZDjGuRY63xfanC1Ko0xA29ksSVE5jKj82YN/VimT01hNMf3sShGr2
	ic17P8oZrJpUhjR3HMb4wHqCrSUOD/TI31shsMTC1TCUM4m5lUEaLEk1Jwkr3memJVrolg84FcjtZ
	8ck5xzG1nF2wyRjpydLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romf0-00000000c9u-2EGc;
	Mon, 25 Mar 2024 15:54:54 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romex-00000000c5B-2Ti6
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 15:54:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4148a581d3fso5164015e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382083; x=1711986883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FUtYpUxOhtP4H/jzdFEV01nhdy7Ccfnq+VwWvofKAI=;
        b=lUBhHat91IKWHxlH1mBqmGIFTo0grwN9Lud3PjvZsWVzFl9W9d4sFSCY/i351qiAwV
         BskC1ko4zHGzrZvhAzrMSAUga6ZA5qn04qZLwlV8hxEcW6zg46RAyhRvXVTDqhbwjt7C
         p2WMRt3gVjLxy3DdsUi/MNi9P7rEqV4t7ZBpVvHe/LlbxLwLtAztguMDWW/EUmwf4j4S
         64jq7n2ssE5RTNL7T8+fboM1e3qpcCyYsm4GT54MEl0HxFXm3tPdb5TEIKvZgCN7fkj1
         uFq9NEcXXDsgslz0zT6Ov0b8W4xAzIwlZC7LAUP8uJzSR58/intIs5D5iYsOmKIa1WUQ
         Z88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382083; x=1711986883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FUtYpUxOhtP4H/jzdFEV01nhdy7Ccfnq+VwWvofKAI=;
        b=EzR5+5ZibLTFAfzQ1ycYn8Q5NGcRQuhgC348ZhSPXleOA0GLxegYZd9n8X05cmcIOM
         Oy4lLpr1V4DRv/YQ0ZlF2+PCLhvckLvub0VBtX2agSNE+qxKb9hCQWon9sIfORm6V6FF
         czpLtYk1Q+ObgaxxA2QFOgrDtl+JFSr4vZBcTVhK+cgXtATIsqKZHozklrMZyVbZLEFU
         Nzt2/Er2B2TqvPn3JzQS+H5/g4F5GYsupmAEH12o5y79mTtl4pdbU5opl/pU0AjXVW2J
         +BreXMP+GjwiYDdvE74w9b4HkmV6mBiJUvxCCG/n8+yZrg5y+1zyILRjBg3Uv8sNrq8U
         f3+g==
X-Forwarded-Encrypted: i=1; AJvYcCXjXZ57vTjhhaxla7H8wlg3EE/xt5T5fbtGizKQEh00jrmkTm8lsJce3NvIXXDUBhhYAev4aTYbcCpNOAINwnVFQnBM24lJX9DWz8pzJ9lJ
X-Gm-Message-State: AOJu0YyrIXUK6t1QSgOn18yQIqlzKw3y3tugO4L4OPM86C/hrbJYBES8
	rGxnmZLNWCObGzmW7cjtY7HZ8lHjVRARewiOCN3/OAHC/QIoXYKe
X-Google-Smtp-Source: AGHT+IG7y+4ODxGwWW7ShCCyZe4LCwOFMZkR6n1OOPWCh0MucONbz8B20vTCaxqqur4xeJwhk7JCNw==
X-Received: by 2002:a05:600c:3ca7:b0:414:d95:cc47 with SMTP id bg39-20020a05600c3ca700b004140d95cc47mr5709242wmb.30.1711382083302;
        Mon, 25 Mar 2024 08:54:43 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a05600c310400b0041462294fe3sm8754094wmo.42.2024.03.25.08.54.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:54:42 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 1/2] bpf,riscv: Implement PROBE_MEM32 pseudo instructions
Date: Mon, 25 Mar 2024 15:54:33 +0000
Message-Id: <20240325155434.65589-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325155434.65589-1-puranjay12@gmail.com>
References: <20240325155434.65589-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_085451_668985_15280B93 
X-CRM114-Status: GOOD (  21.74  )
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
- PROBE_MEM32 adds 64-bit kern_vm_start address (which is stored in S7
  in the prologue). Due to bpf_arena constructions such S7 + reg +
  off16 access is guaranteed to be within arena virtual range, so no
  address check at run-time.
- S7 is a free callee-saved register, so it is used to store kern_vm_start
- PROBE_MEM32 allows STX and ST. If they fault the store is a nop. When
  LDX faults the destination register is zeroed.

To support these on riscv, we do tmp = S7 + src/dst reg and then use
tmp2 as the new src/dst register. This allows us to reuse most of the
code for normal [LDX | STX | ST].

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/net/bpf_jit.h        |   1 +
 arch/riscv/net/bpf_jit_comp64.c | 193 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |   1 +
 3 files changed, 192 insertions(+), 3 deletions(-)

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
index 1adf2f39ce59..0c0588e327af 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -255,6 +255,10 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 		emit_ld(RV_REG_S6, store_offset, RV_REG_SP, ctx);
 		store_offset -= 8;
 	}
+	if (ctx->arena_vm_start) {
+		emit_ld(RV_REG_S7, store_offset, RV_REG_SP, ctx);
+		store_offset -= 8;
+	}
 
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
@@ -548,6 +552,7 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
 #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
+#define DONT_CLEAR		17	/* RV_REG_A7 unused in pt_regmap */
 
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
+	u8 rd = -1, rs = -1, code = insn->code, reg_arena_vm_start = RV_REG_S7;
 	s16 off = insn->off;
 	s32 imm = insn->imm;
 
@@ -1539,6 +1549,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_B:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_H:
 	case BPF_LDX | BPF_PROBE_MEMSX | BPF_W:
+	/* LDX | PROBE_MEM32: dst = *(unsigned size *)(src + S7 + off)*/
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_B:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_H:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_W:
+	case BPF_LDX | BPF_PROBE_MEM32 | BPF_DW:
 	{
 		int insn_len, insns_start;
 		bool sign_ext;
@@ -1546,6 +1561,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
@@ -1682,6 +1702,87 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
@@ -1728,6 +1829,83 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
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
@@ -1759,6 +1937,8 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		stack_adjust += 8;
 	if (seen_reg(RV_REG_S6, ctx))
 		stack_adjust += 8;
+	if (ctx->arena_vm_start)
+		stack_adjust += 8;
 
 	stack_adjust = round_up(stack_adjust, 16);
 	stack_adjust += bpf_stack_adjust;
@@ -1810,6 +1990,10 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		emit_sd(RV_REG_SP, store_offset, RV_REG_S6, ctx);
 		store_offset -= 8;
 	}
+	if (ctx->arena_vm_start) {
+		emit_sd(RV_REG_SP, store_offset, RV_REG_S7, ctx);
+		store_offset -= 8;
+	}
 
 	emit_addi(RV_REG_FP, RV_REG_SP, stack_adjust, ctx);
 
@@ -1823,6 +2007,9 @@ void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
 		emit_mv(RV_REG_TCC_SAVED, RV_REG_TCC, ctx);
 
 	ctx->stack_size = stack_adjust;
+
+	if (ctx->arena_vm_start)
+		emit_imm(RV_REG_S7, ctx->arena_vm_start, ctx);
 }
 
 void bpf_jit_build_epilogue(struct rv_jit_context *ctx)
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index 6b3acac30c06..9ab739b9f9a2 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -80,6 +80,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
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
