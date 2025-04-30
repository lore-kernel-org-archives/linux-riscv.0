Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A62C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 00:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LpwWR+RKrLqD5ats51sXVGAkmDE1rU9KFaeWVDaU354=; b=TKb6Oe052P4NTpExTionFv6hnv
	oSWN/itrmxzCx2jUyiPWZ7OHS6lokKi9lTyn5Rp9zN+2IwIkgwe2f89+Sgm/vmLyCla/eT3/CHzkS
	2OcF/bnLImAgWUQM12xQlu1FowfVHgnhxA34y3Ug7CWhTz24NyOYL/rMN6UdJpCxL1i430f+Tk+f9
	HIce26RQu0Oro6U2KfNr9AKWgEvDifLPUcQ6VG35KVOjZ1kxnCJrmmkry1Pf6EoaJ7Mm5Q7drB7r3
	WsfeUvG4jXpKiH8pTOJIRSRdEtshx17kpryI32lOL8FJ/bwCrWnoIGq7dPxp36/Uk3FUTYo6gtQ6u
	Vjr7zdyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vf5-0000000BNf4-3EfP;
	Wed, 30 Apr 2025 00:50:55 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vf3-0000000BNe1-1Q8u
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:50:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso7502892a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974252; x=1746579052; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qCSPF9Frgb/+2+wOixYxGK5ULBPAm5cfOGeKd85/fA=;
        b=S+GJqi2mgbLMHsJf54YFeE0e0PoTcflawZkbkuHHsxZpVAqy0IYstjQyp72felEJTz
         oJ1baq0YuIU1K7M5p12LxtXBQWZF61UEyOEkxl5UwOAK+vMY15GtSe03puUqDbdZSzxu
         uCiu+rpa0P7e413RWhuVGCai58CrSTV1NRNh7wb46khq6noZRmMjsXK1ve3/3W1nP2X5
         ORkhioVjUSvvogVacLVgukaHHSTsfVxCU1C9SdviX+l71O38EBtePGsNTafbMNKAqfhZ
         5yMHCkvq0zqUKKeOqLkoVJuhIPDVkDDI2tw52D1nlObh3QlVsI/SLGOAPI69ECSPQRg3
         S95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974252; x=1746579052;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qCSPF9Frgb/+2+wOixYxGK5ULBPAm5cfOGeKd85/fA=;
        b=HyuDDIJ6SM2b26zvSqXU9pKMkUk/Y0CR0eRkOddOHGFabBEJCCq1YrCsDpLrG9cGzy
         eWM5JR5oF6wVZQ9JiNHCrzvmosgFbkJkdFxGY8r41hfD0Qoke+v3eae2ev9OZavAjEO4
         gksDXzhy4GzDYkwefXoVqMN7v0kp2PBp7N729M2wzQnaHMwhRTUFgWhsocFU7W7H6gHv
         I8pi61QYw8mVy6/M3GFxV1DrzSmfQUBLLG0lo7duyRuoiwvxo4ynGmGCBD2XpEoHOXCS
         SFkftGi/JsOlZy7DHnhTTf8HqxGCqKsYzrMj/CmRrU326rvOQ1WP0uJfjZRigYEw11GP
         5vXA==
X-Forwarded-Encrypted: i=1; AJvYcCV6o775FkSLHgUHNFv/jbzFBMade5a42nijLAnPZQt7eNE11n2UJR/u6coAUhv7O7h6V2D3kCakR7L05w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOcLdLLm3p+RBSPRupgz0f40gEDfMUqbwJ2Whny0AhQZ68R5jq
	iV5fLJbjlyGUMeg/XLDI0aZPqOkM9i+c7xY5nSRL9RBpKq4docV4+2PTN+hpcJstkpgz7uHDIgs
	EJiOWIjesvw==
X-Google-Smtp-Source: AGHT+IFsw7eIyMliPO+8jBXEus0UKFZjxJ91uLNaK+HuNCRnt938p3RW1qX7JnPDQCyzC4NYFHtPjV7M8h5pbQ==
X-Received: from pjbpb5.prod.google.com ([2002:a17:90b:3c05:b0:2ea:3a1b:f493])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2708:b0:305:2d68:8d57 with SMTP id 98e67ed59e1d1-30a343e8580mr924628a91.5.1745974252306;
 Tue, 29 Apr 2025 17:50:52 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:50:47 +0000
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1745970908.git.yepeilin@google.com>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <248aa4b0ef7e439e0446d25732af7246d119c6a9.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 3/8] bpf, riscv64: Support load-acquire and
 store-release instructions
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
X-CRM114-CacheID: sfid-20250429_175053_388111_E27D5B78 
X-CRM114-Status: GOOD (  14.68  )
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

Support BPF load-acquire (BPF_LOAD_ACQ) and store-release
(BPF_STORE_REL) instructions in the riscv64 JIT compiler.  For example,
consider the following 64-bit load-acquire (assuming little-endian):

  db 10 00 00 00 01 00 00  r1 = load_acquire((u64 *)(r1 + 0x0))
  95 00 00 00 00 00 00 00  exit

  opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
  imm (0x00000100): BPF_LOAD_ACQ

The JIT compiler will emit an LD instruction followed by a FENCE R,RW
instruction for the above, e.g.:

  ld x7,0(x6)
  fence r,rw

Similarly, consider the following 16-bit store-release:

  cb 21 00 00 10 01 00 00  store_release((u16 *)(r1 + 0x0), w2)
  95 00 00 00 00 00 00 00  exit

  opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
  imm (0x00000110): BPF_STORE_REL

A FENCE RW,W instruction followed by an SH instruction will be emitted,
e.g.:

  fence rw,w
  sh x2,0(x4)

8-bit and 16-bit load-acquires are zero-extending (cf., LBU, LHU).  The
verifier always rejects misaligned load-acquires/store-releases (even if
BPF_F_ANY_ALIGNMENT is set), so the emitted load and store instructions
are guaranteed to be single-copy atomic.

Introduce primitives to emit the relevant (and the most common/used in
the kernel) fences, i.e. fences with R -> RW, RW -> W and RW -> RW.

Rename emit_atomic() to emit_atomic_rmw() to make it clear that it only
handles RMW atomics, and replace its is64 parameter to allow to perform
the required checks on the opsize (BPF_SIZE(code)).

Tested-by: Peilin Ye <yepeilin@google.com>
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
[yepeilin@google.com: whitespace changes; cosmetic changes to commit
                      title and message]
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/riscv/net/bpf_jit.h        | 15 +++++++
 arch/riscv/net/bpf_jit_comp64.c | 77 ++++++++++++++++++++++++++++++---
 2 files changed, 85 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 1d1c78d4cff1..e7b032dfd17f 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -608,6 +608,21 @@ static inline u32 rv_fence(u8 pred, u8 succ)
 	return rv_i_insn(imm11_0, 0, 0, 0, 0xf);
 }
 
+static inline void emit_fence_r_rw(struct rv_jit_context *ctx)
+{
+	emit(rv_fence(0x2, 0x3), ctx);
+}
+
+static inline void emit_fence_rw_w(struct rv_jit_context *ctx)
+{
+	emit(rv_fence(0x3, 0x1), ctx);
+}
+
+static inline void emit_fence_rw_rw(struct rv_jit_context *ctx)
+{
+	emit(rv_fence(0x3, 0x3), ctx);
+}
+
 static inline u32 rv_nop(void)
 {
 	return rv_i_insn(0, 0, 0, 0, 0x13);
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 953b6a20c69f..b71a9c88fb4f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -607,11 +607,65 @@ static void emit_store_64(u8 rd, s32 off, u8 rs, struct rv_jit_context *ctx)
 	emit_sd(RV_REG_T1, 0, rs, ctx);
 }
 
-static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
-			struct rv_jit_context *ctx)
+static int emit_atomic_ld_st(u8 rd, u8 rs, s16 off, s32 imm, u8 code, struct rv_jit_context *ctx)
+{
+	switch (imm) {
+	/* dst_reg = load_acquire(src_reg + off16) */
+	case BPF_LOAD_ACQ:
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit_load_8(false, rd, off, rs, ctx);
+			break;
+		case BPF_H:
+			emit_load_16(false, rd, off, rs, ctx);
+			break;
+		case BPF_W:
+			emit_load_32(false, rd, off, rs, ctx);
+			break;
+		case BPF_DW:
+			emit_load_64(false, rd, off, rs, ctx);
+			break;
+		}
+		emit_fence_r_rw(ctx);
+		break;
+	/* store_release(dst_reg + off16, src_reg) */
+	case BPF_STORE_REL:
+		emit_fence_rw_w(ctx);
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit_store_8(rd, off, rs, ctx);
+			break;
+		case BPF_H:
+			emit_store_16(rd, off, rs, ctx);
+			break;
+		case BPF_W:
+			emit_store_32(rd, off, rs, ctx);
+			break;
+		case BPF_DW:
+			emit_store_64(rd, off, rs, ctx);
+			break;
+		}
+		break;
+	default:
+		pr_err_once("bpf-jit: invalid atomic load/store opcode %02x\n", imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int emit_atomic_rmw(u8 rd, u8 rs, s16 off, s32 imm, u8 code,
+			   struct rv_jit_context *ctx)
 {
 	u8 r0;
 	int jmp_offset;
+	bool is64;
+
+	if (BPF_SIZE(code) != BPF_W && BPF_SIZE(code) != BPF_DW) {
+		pr_err_once("bpf-jit: 1- and 2-byte RMW atomics are not supported\n");
+		return -EINVAL;
+	}
+	is64 = BPF_SIZE(code) == BPF_DW;
 
 	if (off) {
 		if (is_12b_int(off)) {
@@ -688,9 +742,14 @@ static void emit_atomic(u8 rd, u8 rs, s16 off, s32 imm, bool is64,
 		     rv_sc_w(RV_REG_T3, rs, rd, 0, 1), ctx);
 		jmp_offset = ninsns_rvoff(-6);
 		emit(rv_bne(RV_REG_T3, 0, jmp_offset >> 1), ctx);
-		emit(rv_fence(0x3, 0x3), ctx);
+		emit_fence_rw_rw(ctx);
 		break;
+	default:
+		pr_err_once("bpf-jit: invalid atomic RMW opcode %02x\n", imm);
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
@@ -1259,7 +1318,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 {
 	bool is64 = BPF_CLASS(insn->code) == BPF_ALU64 ||
 		    BPF_CLASS(insn->code) == BPF_JMP;
-	int s, e, rvoff, ret, i = insn - ctx->prog->insnsi;
+	int s, e, rvoff, ret = 0, i = insn - ctx->prog->insnsi;
 	struct bpf_prog_aux *aux = ctx->prog->aux;
 	u8 rd = -1, rs = -1, code = insn->code;
 	s16 off = insn->off;
@@ -1962,10 +2021,14 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 	case BPF_STX | BPF_MEM | BPF_DW:
 		emit_store_64(rd, off, rs, ctx);
 		break;
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		emit_atomic(rd, rs, off, imm,
-			    BPF_SIZE(code) == BPF_DW, ctx);
+		if (bpf_atomic_is_load_store(insn))
+			ret = emit_atomic_ld_st(rd, rs, off, imm, code, ctx);
+		else
+			ret = emit_atomic_rmw(rd, rs, off, imm, code, ctx);
 		break;
 
 	case BPF_STX | BPF_PROBE_MEM32 | BPF_B:
@@ -2050,7 +2113,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		return -EINVAL;
 	}
 
-	return 0;
+	return ret;
 }
 
 void bpf_jit_build_prologue(struct rv_jit_context *ctx, bool is_subprog)
-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
