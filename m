Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4813C624CE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 12:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m/xGQPswzPkCDPeAL0gAdH71PEv4BcUc/1HU2UcEQAc=; b=r3sCRvLwz4Rq9K
	bIGcIgF0ZX39/J1ErBshfv6hmpNdzit8IycqiuRuRuuE9J4j9N4oFstaJDUwOhapEgWTuKBYEAE4u
	aAp13vRBgFbfIOfEK+fFk9l7j4abwX1EUN6cfEBNkKacGuPg6pYnlGyipjxYfYNg/JZDTOs1xOtQ9
	TgW4Z+KXdmD3n+bx6L1BocXQYzpW40mZ4IqInq6dU8V0440jR3pLYWUoza/F1yUgAzVPlht+rHRDT
	JdcUDfHMqa0tr/6Fj31JhyJRTYtz83CKMYeoPGaHsfB+XGCoFm+oPcpa8liHntt9wjSacNKXmtigm
	vWTQPkPdGHgOc0IeoW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NBi-0000000BnaE-34j5;
	Tue, 01 Sep 2026 12:02:02 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NA9-0000000BlGU-3odQ
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 12:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788264020; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=1dN/5IHaSDbgKWn7C0l1t6XTBlAsWfAhnXn6F5BTEbg=;
	b=MYy8vwNoZ8rmhg118KS+4FaMPKdinxQTI2uP1jBL5ISYDNL4tXIZwmPm+V32WDU8Mzx/v0gZeiQMqLoS1LJhR/SKhM19nlubI0v0kasN6tgFHBh/rT9AzYRMvoOWvjflpPb8ydM4LcsZYDAZ2Il8VcHEne/JICMAMHrd+wzROzg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XA8S00n_1788264015;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XA8S00n_1788264015 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 20:00:19 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	memxor@gmail.com,
	bjorn@kernel.org,
	puranjay@kernel.org
Cc: ihor.solodrai@linux.dev,
	eddyz87@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	pulehui@huawei.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	shuah@kernel.org,
	guoren@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] bpf, riscv: Register extable entries at probe insn call sites
Date: Tue,  1 Sep 2026 20:00:13 +0800
Message-ID: <20260901120013.16104-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_050026_358262_F533FCB4 
X-CRM114-Status: GOOD (  12.35  )
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

add_exception_handler() filters insns by matching BPF_MODE() against
the probe mode values. These values occupy unused opcode slots and
collide with legitimate encodings: BPF_PROBE_MEM32SX (0xc0) shares
its mode value with BPF_ATOMIC. Relying on the mode alone therefore
risks registering exception table entries for the wrong instructions,
as would happen for plain atomics without the LDX class check.

Make the decision explicit at the call sites instead: register an
entry only when emitting a probe load, a PROBE_MEM32 store, or a
PROBE_ATOMIC atomic, and drop the fragile mode gate from
add_exception_handler() along with the now unused insn argument. No
functional change intended.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
base-commit: d761934c9483ecde93fe99d8705282f716dfee50

 arch/riscv/net/bpf_jit_comp64.c | 50 ++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index e7378be171a9..726c0169fc60 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -731,9 +731,8 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
 	return true;
 }
 
-/* For accesses to BTF pointers, add an entry to the exception table */
-static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
-				 struct rv_jit_context *ctx)
+/* Add an entry to the exception table for a faulting probe insn */
+static int add_exception_handler(int dst_reg, struct rv_jit_context *ctx)
 {
 	struct exception_table_entry *ex;
 	unsigned long pc;
@@ -744,14 +743,6 @@ static int add_exception_handler(const struct bpf_insn *insn, int dst_reg,
 	    ctx->ex_insn_off <= 0 || ctx->ex_jmp_off <= 0)
 		return 0;
 
-	if (BPF_MODE(insn->code) != BPF_PROBE_MEM &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEMSX &&
-	    BPF_MODE(insn->code) != BPF_PROBE_MEM32 &&
-	    !(BPF_MODE(insn->code) == BPF_PROBE_MEM32SX &&
-	      BPF_CLASS(insn->code) == BPF_LDX) &&
-	    BPF_MODE(insn->code) != BPF_PROBE_ATOMIC)
-		return 0;
-
 	if (WARN_ON_ONCE(ctx->nexentries >= ctx->prog->aux->num_exentries))
 		return -EINVAL;
 
@@ -1360,6 +1351,15 @@ int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *ro_image,
 	return ret < 0 ? ret : size;
 }
 
+/* Probe loads fault on unmapped memory and need an exception table entry */
+static bool insn_is_probe_ldx(const struct bpf_insn *insn)
+{
+	return BPF_MODE(insn->code) == BPF_PROBE_MEM ||
+	       BPF_MODE(insn->code) == BPF_PROBE_MEMSX ||
+	       BPF_MODE(insn->code) == BPF_PROBE_MEM32 ||
+	       BPF_MODE(insn->code) == BPF_PROBE_MEM32SX;
+}
+
 int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 		      bool extra_pass)
 {
@@ -1929,9 +1929,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 		emit_ldx(rd, off, rs, BPF_SIZE(code), sign_ext, ctx);
 
-		ret = add_exception_handler(insn, rd, ctx);
-		if (ret)
-			return ret;
+		if (insn_is_probe_ldx(insn)) {
+			ret = add_exception_handler(rd, ctx);
+			if (ret)
+				return ret;
+		}
 
 		if (BPF_SIZE(code) != BPF_DW && insn_is_zext(&insn[1]))
 			return 1;
@@ -1959,9 +1961,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 		emit_st(rd, off, imm, BPF_SIZE(code), ctx);
 
-		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
-		if (ret)
-			return ret;
+		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
+			ret = add_exception_handler(REG_DONT_CLEAR_MARKER, ctx);
+			if (ret)
+				return ret;
+		}
 		break;
 
 	/* STX: *(size *)(dst + off) = src */
@@ -1981,9 +1985,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 
 		emit_stx(rd, off, rs, BPF_SIZE(code), ctx);
 
-		ret = add_exception_handler(insn, REG_DONT_CLEAR_MARKER, ctx);
-		if (ret)
-			return ret;
+		if (BPF_MODE(insn->code) == BPF_PROBE_MEM32) {
+			ret = add_exception_handler(REG_DONT_CLEAR_MARKER, ctx);
+			if (ret)
+				return ret;
+		}
 		break;
 
 	/* Atomics */
@@ -2001,7 +2007,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			ret = emit_atomic_rmw(rd, rs, insn, ctx);
 
 		/* ret can be 1 (skip-zext); extable entry still needs to be added */
-		if (ret >= 0) {
+		if (ret >= 0 && BPF_MODE(insn->code) == BPF_PROBE_ATOMIC) {
 			/*
 			 * A load-acquire reads into dst_reg, and a read-modify-write
 			 * carrying BPF_FETCH reads the old value into src_reg, or into
@@ -2010,7 +2016,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			 */
 			int load_reg = bpf_atomic_load_reg(insn);
 
-			ret = add_exception_handler(insn, load_reg < 0 ?
+			ret = add_exception_handler(load_reg < 0 ?
 					REG_DONT_CLEAR_MARKER : regmap[load_reg],
 					ctx) ?: ret;
 		}
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
