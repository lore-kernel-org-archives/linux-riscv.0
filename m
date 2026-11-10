Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDCA606A9C1
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pFI/CAHQ;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=h8XofNgK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bDQcZqBbQYYpv/diqYQ6jRSdWSkCSKGhkoIT5NrhLzE=; b=pFI/CAHQxSErybmx9u5DIz3Jm0
	EweDDcSQDOYWkzeWKl4i/WunJidvdL65I511zzhwNZzArVtvAttlD3dzMd28xRLZinxRgkZqeBD/n
	lcB4cY8ebrEKkuHIk9yRtdZOxSlCwpAKXyCPP0FGzREcw5Juwn4oIcMkfgD6NhExOatJ/P8Y90l8A
	P0apu9hoN+t2n/hBaiIW7wD/2M2TpRkDJ6Q+Ipaplv4JJuQ3MRFLOYw2Dizo+e1vXjojWBzmjIS+Z
	CsNHclLCF6uldr4xL1cDxG32EkZsY3NRtAHlSirRbTn2zSW1ahbGGSZNMuhqaTCn5iylkFdjs3irM
	DGvBBa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlsM-000000043Ly-1Jfs;
	Tue, 10 Nov 2026 13:27:02 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlsJ-000000043JG-1MyM
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794317219; x=1825853219;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=976/pIIvfKjoAMoUosVI4Ia7fh2byNHJkUDQvR46D3A=;
  b=h8XofNgK2bPmvJOFObL3qVBVCFhfRs+St7dMkQ5KQOaDuf/KA03IiScT
   WuFfJQesCu584KetnrnTKDtudX/yF7zh00Vs6YjNmKU0x2b+8Ceqfofoo
   Hi02k0Fj/vbArSMsida6HIw5ZzsDTGGmSyicMssDilqPTQskHyBOEIJ7+
   nQJO0UwUu4fa0LQzuetLMNJfHYAoT+6vOfK4HfiRlpg3hUBqgXeDzNXeH
   LfmGqdC9pCD+2tYlNRPMw0P7ebkVGo3xfyrw6DugKTfrM9Y/vmcmwQFAv
   AjlPGVvsJWZBaj08JK6RtL/1rcZL2wB61cDSRZsg09HV7Chf2Ax3wjsuV
   Q==;
X-CSE-ConnectionGUID: g/en1ihqQ4CkgTDQM0eTbg==
X-CSE-MsgGUID: FDUkhLuwQTujzoLiXNc05g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:22:57 +0200
X-CSE-ConnectionGUID: KJnYZVvNRyWH90KQZ/hNEQ==
X-CSE-MsgGUID: MW4k49B2QPmqUJp00v1eSg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces02_data.me-corp.lan with SMTP; 10 Nov 2026 15:31:02 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Nov 2026 15:22:56 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Tue, 10 Nov 2026 15:21:02 +0200
Subject: [PATCH v6 5/6] riscv, bpf: emit LR/SC loops when Zaamo is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-lrsc-only-v6-5-bafc3cc0fcae@mobileye.com>
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
In-Reply-To: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
 Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org, 
 olof@lixom.net, aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052659_868852_872EBFED 
X-CRM114-Status: GOOD (  30.15  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A kernel built with CONFIG_RISCV_ISA_ZAAMO disabled is meant for a
hart where AMO instructions are emulated by an M-mode trap. The BPF JIT
still encodes amo* instructions for the BPF atomic read-modify-write
operations, so every such operation takes that trap.

Emit an LR/SC loop for BPF_ADD, BPF_AND, BPF_OR, BPF_XOR, their
BPF_FETCH forms and BPF_XCHG when Zaamo is disabled, on RV32 and RV64.
The sequences follow the Zalrsc variants in
arch/riscv/include/asm/atomic.h: a relaxed op discards the old value,
a fetch op uses .aqrl and returns the old value. BPF_CMPXCHG is
unchanged; it already uses amocas with Zacas and an LR/SC loop
otherwise.

The JIT encodes instructions as integers, so no assembler constraint
applies and both paths stay compiled. The choice is a plain
IS_ENABLED() test, the same compile-time decision the rest of the
kernel makes. The hart advertises "a" either way, so a runtime
extension check would not tell the two cases apart.

An arena (BPF_PROBE_ATOMIC) access needs an exception table entry for
each instruction that may fault. The verifier reserves one entry per
atomic instruction, but an LR/SC loop can fault on either the lr or the
sc. Count the extra entries once the instruction offsets converge,
before the image is allocated, and add an entry for the sc that shares
the fixup of the lr, so a fault skips the retry and the result move.

Co-developed-by: Chao-ying Fu <chao-ying.fu@globalfoundries.com>
Signed-off-by: Chao-ying Fu <chao-ying.fu@globalfoundries.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/net/bpf_jit.h        |   1 +
 arch/riscv/net/bpf_jit_comp32.c |  81 ++++++++++++++++++++++++++++--
 arch/riscv/net/bpf_jit_comp64.c | 108 +++++++++++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |  29 +++++++++++
 4 files changed, 213 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
index 419b9d795f2a..8c1301289ea8 100644
--- a/arch/riscv/net/bpf_jit.h
+++ b/arch/riscv/net/bpf_jit.h
@@ -79,6 +79,7 @@ struct rv_jit_context {
 	int nexentries;
 	int ex_insn_off;
 	int ex_jmp_off;
+	int ex_sc_off;		/* sc in an lr/sc pair; 0 if unused */
 	unsigned long flags;
 	int stack_size;
 	int tcc_offset;
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index a9e0bd5cc81d..ea1779a23634 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -874,11 +874,67 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	return 0;
 }
 
-static int emit_bpf_atomic(s8 dst, const s8 *src, const s8 *rs,
-			   struct rv_jit_context *ctx,
-			   const struct bpf_insn *insn)
+/*
+ * Read-modify-write via lr/sc for kernels built without Zaamo. T0 holds
+ * the address. T1/T2 are not BPF registers; the address was copied out of
+ * lo(rd) before this is called, so clobbering T2 is fine.
+ */
+static int emit_bpf_atomic_lrsc(s8 dst, const s8 *rs, s32 imm,
+				struct rv_jit_context *ctx)
+{
+	bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
+	bool xchg = imm == BPF_XCHG;
+	u8 aq = is_fetch ? 1 : 0;
+	u8 rl = is_fetch ? 1 : 0;
+	u8 old = RV_REG_T1;
+	u8 tmp = RV_REG_T2;
+	int lr_off, jmp_off;
+	s32 op = xchg ? BPF_XCHG : imm & ~BPF_FETCH;
+
+	switch (op) {
+	case BPF_ADD:
+	case BPF_AND:
+	case BPF_OR:
+	case BPF_XOR:
+	case BPF_XCHG:
+		break;
+	default:
+		return -1;
+	}
+
+	lr_off = ctx->ninsns;
+	emit(rv_lr_w(old, 0, dst, aq, rl), ctx);
+
+	switch (op) {
+	case BPF_ADD:
+		emit(rv_add(tmp, old, lo(rs)), ctx);
+		break;
+	case BPF_AND:
+		emit(rv_and(tmp, old, lo(rs)), ctx);
+		break;
+	case BPF_OR:
+		emit(rv_or(tmp, old, lo(rs)), ctx);
+		break;
+	case BPF_XOR:
+		emit(rv_xor(tmp, old, lo(rs)), ctx);
+		break;
+	}
+
+	if (xchg)
+		emit(rv_sc_w(tmp, lo(rs), dst, aq, rl), ctx);
+	else
+		emit(rv_sc_w(tmp, tmp, dst, aq, rl), ctx);
+
+	jmp_off = ninsns_rvoff(lr_off - ctx->ninsns);
+	emit(rv_bne(tmp, RV_REG_ZERO, jmp_off >> 1), ctx);
+	if (is_fetch)
+		emit(rv_addi(lo(rs), old, 0), ctx);
+	return 0;
+}
+
+static int emit_bpf_atomic_amo(s8 dst, const s8 *rs, s32 imm,
+			       struct rv_jit_context *ctx)
 {
-	s32 imm = insn->imm;
 	bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
 	s8 fetch_reg = is_fetch ? lo(rs) : RV_REG_ZERO;
 	int aq = is_fetch ? 1 : 0;
@@ -907,6 +963,23 @@ static int emit_bpf_atomic(s8 dst, const s8 *src, const s8 *rs,
 	default:
 		return -1;
 	}
+	return 0;
+}
+
+static int emit_bpf_atomic(s8 dst, const s8 *src, const s8 *rs,
+			   struct rv_jit_context *ctx,
+			   const struct bpf_insn *insn)
+{
+	s32 imm = insn->imm;
+	bool is_fetch = (imm & BPF_FETCH) || (imm == BPF_XCHG);
+	int ret;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO))
+		ret = emit_bpf_atomic_amo(dst, rs, imm, ctx);
+	else
+		ret = emit_bpf_atomic_lrsc(dst, rs, imm, ctx);
+	if (ret)
+		return ret;
 
 	if (is_fetch) {
 		emit(rv_addi(hi(rs), RV_REG_ZERO, 0), ctx);
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 01fe66774f02..94e4ddc6d965 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -573,6 +573,79 @@ static int emit_atomic_ld_st(u8 rd, u8 rs, const struct bpf_insn *insn,
 	return 0;
 }
 
+/*
+ * Read-modify-write via lr/sc for kernels built without Zaamo, matching
+ * the Zalrsc sequences in arch/riscv/include/asm/atomic.h. A relaxed op
+ * discards the old value. A fetch op (including XCHG) uses .aqrl and
+ * writes that value back to val. T2/T3 are not BPF registers; addr may
+ * already be T1.
+ */
+static void emit_atomic_lrsc(u8 addr, u8 val, bool is64, s32 imm,
+			     struct rv_jit_context *ctx)
+{
+	bool fetch = imm & BPF_FETCH;
+	u8 aq = fetch ? 1 : 0;
+	u8 rl = fetch ? 1 : 0;
+	u8 old = RV_REG_T2;
+	u8 tmp = RV_REG_T3;
+	int lr_off, jmp_off;
+	s32 op = imm == BPF_XCHG ? BPF_XCHG : imm & ~BPF_FETCH;
+
+	lr_off = ctx->ninsns;
+	ctx->ex_insn_off = ctx->ninsns;
+	emit(is64 ? rv_lr_d(old, 0, addr, aq, rl) :
+	     rv_lr_w(old, 0, addr, aq, rl), ctx);
+
+	if (op != BPF_XCHG) {
+		if (!is64 && op == BPF_ADD)
+			emit(rv_addw(tmp, old, val), ctx);
+		else if (op == BPF_ADD)
+			emit_add(tmp, old, val, ctx);
+		else if (op == BPF_AND)
+			emit_and(tmp, old, val, ctx);
+		else if (op == BPF_OR)
+			emit_or(tmp, old, val, ctx);
+		else if (op == BPF_XOR)
+			emit_xor(tmp, old, val, ctx);
+
+		ctx->ex_sc_off = ctx->ninsns;
+		emit(is64 ? rv_sc_d(tmp, tmp, addr, aq, rl) :
+		     rv_sc_w(tmp, tmp, addr, aq, rl), ctx);
+	} else {
+		ctx->ex_sc_off = ctx->ninsns;
+		emit(is64 ? rv_sc_d(tmp, val, addr, aq, rl) :
+		     rv_sc_w(tmp, val, addr, aq, rl), ctx);
+	}
+
+	/* Branch offset is relative to this instruction, back to the lr. */
+	jmp_off = ninsns_rvoff(lr_off - ctx->ninsns);
+	emit(rv_bne(tmp, RV_REG_ZERO, jmp_off >> 1), ctx);
+
+	if (fetch) {
+		emit_mv(val, old, ctx);
+		if (!is64)
+			emit_zextw(val, val, ctx);
+	}
+	ctx->ex_jmp_off = ctx->ninsns;
+}
+
+static bool is_atomic_lrsc_op(s32 imm)
+{
+	switch (imm) {
+	case BPF_ADD:
+	case BPF_AND:
+	case BPF_OR:
+	case BPF_XOR:
+	case BPF_ADD | BPF_FETCH:
+	case BPF_AND | BPF_FETCH:
+	case BPF_OR | BPF_FETCH:
+	case BPF_XOR | BPF_FETCH:
+	case BPF_XCHG:
+		return true;
+	}
+	return false;
+}
+
 static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 			   struct rv_jit_context *ctx)
 {
@@ -601,6 +674,12 @@ static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 		rd = RV_REG_T1;
 	}
 
+	/* Without Zaamo, every op except cmpxchg is an lr/sc loop. */
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO) && is_atomic_lrsc_op(imm)) {
+		emit_atomic_lrsc(rd, rs, is64, imm, ctx);
+		return 0;
+	}
+
 	switch (imm) {
 	/* lock *(u32/u64 *)(dst_reg + off16) <op>= src_reg */
 	case BPF_ADD:
@@ -732,8 +811,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 }
 
 /* For accesses to BTF pointers, add an entry to the exception table */
-static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
-				 struct rv_jit_context *ctx)
+static int add_exception_handler_one(const struct bpf_insn *insn, int dst_reg,
+				     struct rv_jit_context *ctx)
 {
 	struct exception_table_entry *ex;
 	unsigned long pc;
@@ -804,6 +883,31 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
 	return 0;
 }
 
+/*
+ * An lr/sc pair faults on either instruction. Both entries share the fixup
+ * that follows the loop, so a probe fault skips the retry and the result move.
+ */
+static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
+				 struct rv_jit_context *ctx)
+{
+	int sc_off = ctx->ex_sc_off;
+	int jmp_off = ctx->ex_jmp_off;
+	int ret;
+
+	ctx->ex_sc_off = 0;
+	/* Offset discovery runs before the image exists. Entries are added later. */
+	if (!ctx->insns)
+		return 0;
+
+	ret = add_exception_handler_one(insn, dst_reg, ctx);
+	if (ret || sc_off <= 0)
+		return ret;
+
+	ctx->ex_insn_off = sc_off;
+	ctx->ex_jmp_off = jmp_off;
+	return add_exception_handler_one(insn, dst_reg, ctx);
+}
+
 static int gen_jump_or_nops(void *target, void *ip, u32 *insns, bool is_call)
 {
 	s64 rvoff;
diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
index cbfcd287ea16..cba0d34c3e6f 100644
--- a/arch/riscv/net/bpf_jit_core.c
+++ b/arch/riscv/net/bpf_jit_core.c
@@ -16,6 +16,34 @@
 /* Number of iterations to try until offsets converge. */
 #define NR_JIT_ITERATIONS	32
 
+/*
+ * The verifier reserves one extable slot per BPF_PROBE_ATOMIC. Without
+ * Zaamo a read-modify-write atomic is an lr/sc loop that can fault on
+ * either instruction, so reserve a second slot for the sc.
+ */
+static void rv_jit_add_lrsc_exentries(struct bpf_prog *prog)
+{
+	const struct bpf_insn *insn = prog->insnsi;
+	int i;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO) || __riscv_xlen != 64)
+		return;
+
+	for (i = 0; i < prog->len; i++, insn++) {
+		if (BPF_CLASS(insn->code) != BPF_STX ||
+		    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC ||
+		    bpf_atomic_is_load_store(insn))
+			continue;
+		if (BPF_SIZE(insn->code) != BPF_W &&
+		    BPF_SIZE(insn->code) != BPF_DW)
+			continue;
+		/* amocas is a single faulting instruction. */
+		if (insn->imm == BPF_CMPXCHG && rv_ext_enabled(ZACAS))
+			continue;
+		prog->aux->num_exentries++;
+	}
+}
+
 static int build_body(struct rv_jit_context *ctx, bool extra_pass, int *offset)
 {
 	const struct bpf_prog *prog = ctx->prog;
@@ -100,6 +128,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		if (ctx->ninsns == prev_ninsns) {
 			if (jit_data->header)
 				break;
+			rv_jit_add_lrsc_exentries(prog);
 			/* obtain the actual image size */
 			extable_size = prog->aux->num_exentries *
 				sizeof(struct exception_table_entry);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
