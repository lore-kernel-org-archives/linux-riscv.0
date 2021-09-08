Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7587FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 377AF60187
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 08:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 377AF60187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PKmHXx/7MnAwsH1Snrd0i2xk+vZToAzeuENrh5cFfd4=; b=wvOhiahcbUSzkZ
	IzFkXeb1i0WHqUOtMMpCyX21i5j6a89c7cWd2X/Gu2uNiPn786Ldj2Ux1jiHRePn6vC38j+qK+B/3
	KqjaFVUXFp2ysYk4A0FKdz9xr5H4qMCQ9ZH4C9tBQgJibw0ti25pZfE7GGQEsDHQWKSqtN157EqNT
	M6N5Vu1tnZ5EcK7Tt02TZWVChVgIuYn2dFh4x3SsBx+sJlQXaU+vGpnZCZUf4ELfqapieLuqvtNYL
	S6mTJcXObJhZ+of5lCf1OYfJbWyKV7HFsj/5HSqdr3q2sHRWWGo6LfPGlBrvR2Qf2GMhk5gdhu5Da
	SbCZo850ONHu/m4Aweeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNspt-0068QM-Ac; Wed, 08 Sep 2021 08:21:37 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNspc-0068MT-CH; Wed, 08 Sep 2021 08:21:22 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxVOY2cjhh5Y0BAA--.6828S2;
 Wed, 08 Sep 2021 16:20:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Shubham Bansal <illusionist.neo@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Zi Shen Lim <zlim.lnx@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 naveen.n.rao@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 bjorn@kernel.org, davem@davemloft.net
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Subject: [RFC PATCH bpf-next] bpf: Make actual max tail call count as
 MAX_TAIL_CALL_CNT
Date: Wed,  8 Sep 2021 16:20:06 +0800
Message-Id: <1631089206-5931-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9CxVOY2cjhh5Y0BAA--.6828S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFyUWF4kuFW8Xr18XF47Arb_yoWfXw48pr
 18JwnakrWvqw15Aa4xJayUWw4UKF4vgFW7KFn8CFWSyanFvr9rWF13Kw15ZFZ0vrW8Jw4r
 XFZ0kr13C3WkXwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07bwc_fUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_012120_830141_D3070D59 
X-CRM114-Status: GOOD (  17.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In the current code, the actual max tail call count is 33 which is greater
than MAX_TAIL_CALL_CNT, this is not consistent with the intended meaning
in the commit 04fd61ab36ec ("bpf: allow bpf programs to tail-call other
bpf programs"):

"The chain of tail calls can form unpredictable dynamic loops therefore
tail_call_cnt is used to limit the number of calls and currently is set
to 32."

Additionally, after commit 874be05f525e ("bpf, tests: Add tail call test
suite"), we can see there exists failed testcase.

On all archs when CONFIG_BPF_JIT_ALWAYS_ON is not set:
 # echo 0 > /proc/sys/net/core/bpf_jit_enable
 # modprobe test_bpf
 # dmesg | grep -w FAIL
 Tail call error path, max count reached jited:0 ret 34 != 33 FAIL

On some archs:
 # echo 1 > /proc/sys/net/core/bpf_jit_enable
 # modprobe test_bpf
 # dmesg | grep -w FAIL
 Tail call error path, max count reached jited:1 ret 34 != 33 FAIL

with this patch, make the actual max tail call count as MAX_TAIL_CALL_CNT,
at the same time, the above failed testcase can be fixed.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

Hi all,

This is a RFC patch, if I am wrong or I missed something,
please let me know, thank you!

 arch/arm/net/bpf_jit_32.c         | 11 ++++++-----
 arch/arm64/net/bpf_jit_comp.c     |  7 ++++---
 arch/mips/net/ebpf_jit.c          |  4 ++--
 arch/powerpc/net/bpf_jit_comp32.c |  4 ++--
 arch/powerpc/net/bpf_jit_comp64.c | 12 ++++++------
 arch/riscv/net/bpf_jit_comp32.c   |  4 ++--
 arch/riscv/net/bpf_jit_comp64.c   |  4 ++--
 arch/sparc/net/bpf_jit_comp_64.c  |  8 ++++----
 kernel/bpf/core.c                 |  4 ++--
 9 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index a951276..39d9ae9 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1180,18 +1180,19 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 
 	/* tmp2[0] = array, tmp2[1] = index */
 
-	/* if (tail_call_cnt > MAX_TAIL_CALL_CNT)
-	 *	goto out;
+	/*
 	 * tail_call_cnt++;
+	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
+	 *	goto out;
 	 */
+	tc = arm_bpf_get_reg64(tcc, tmp, ctx);
+	emit(ARM_ADDS_I(tc[1], tc[1], 1), ctx);
+	emit(ARM_ADC_I(tc[0], tc[0], 0), ctx);
 	lo = (u32)MAX_TAIL_CALL_CNT;
 	hi = (u32)((u64)MAX_TAIL_CALL_CNT >> 32);
-	tc = arm_bpf_get_reg64(tcc, tmp, ctx);
 	emit(ARM_CMP_I(tc[0], hi), ctx);
 	_emit(ARM_COND_EQ, ARM_CMP_I(tc[1], lo), ctx);
 	_emit(ARM_COND_HI, ARM_B(jmp_offset), ctx);
-	emit(ARM_ADDS_I(tc[1], tc[1], 1), ctx);
-	emit(ARM_ADC_I(tc[0], tc[0], 0), ctx);
 	arm_bpf_put_reg64(tcc, tmp, ctx);
 
 	/* prog = array->ptrs[index]
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 41c23f4..5d6c843 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -286,14 +286,15 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 	emit(A64_CMP(0, r3, tmp), ctx);
 	emit(A64_B_(A64_COND_CS, jmp_offset), ctx);
 
-	/* if (tail_call_cnt > MAX_TAIL_CALL_CNT)
-	 *     goto out;
+	/*
 	 * tail_call_cnt++;
+	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
+	 *     goto out;
 	 */
+	emit(A64_ADD_I(1, tcc, tcc, 1), ctx);
 	emit_a64_mov_i64(tmp, MAX_TAIL_CALL_CNT, ctx);
 	emit(A64_CMP(1, tcc, tmp), ctx);
 	emit(A64_B_(A64_COND_HI, jmp_offset), ctx);
-	emit(A64_ADD_I(1, tcc, tcc, 1), ctx);
 
 	/* prog = array->ptrs[index];
 	 * if (prog == NULL)
diff --git a/arch/mips/net/ebpf_jit.c b/arch/mips/net/ebpf_jit.c
index 3a73e93..029fc34 100644
--- a/arch/mips/net/ebpf_jit.c
+++ b/arch/mips/net/ebpf_jit.c
@@ -617,14 +617,14 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, int this_idx)
 	b_off = b_imm(this_idx + 1, ctx);
 	emit_instr(ctx, bne, MIPS_R_AT, MIPS_R_ZERO, b_off);
 	/*
-	 * if (TCC-- < 0)
+	 * if (--TCC < 0)
 	 *     goto out;
 	 */
 	/* Delay slot */
 	tcc_reg = (ctx->flags & EBPF_TCC_IN_V1) ? MIPS_R_V1 : MIPS_R_S4;
 	emit_instr(ctx, daddiu, MIPS_R_T5, tcc_reg, -1);
 	b_off = b_imm(this_idx + 1, ctx);
-	emit_instr(ctx, bltz, tcc_reg, b_off);
+	emit_instr(ctx, bltz, MIPS_R_T5, b_off);
 	/*
 	 * prog = array->ptrs[index];
 	 * if (prog == NULL)
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index beb12cb..b5585ad 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -221,12 +221,12 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	PPC_BCC(COND_GE, out);
 
 	/*
+	 * tail_call_cnt++;
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_CMPLWI(_R0, MAX_TAIL_CALL_CNT));
-	/* tail_call_cnt++; */
 	EMIT(PPC_RAW_ADDIC(_R0, _R0, 1));
+	EMIT(PPC_RAW_CMPLWI(_R0, MAX_TAIL_CALL_CNT));
 	PPC_BCC(COND_GT, out);
 
 	/* prog = array->ptrs[index]; */
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b87a63d..bb15cc4 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -227,6 +227,12 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	PPC_BCC(COND_GE, out);
 
 	/*
+	 * tail_call_cnt++;
+	 */
+	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
+	PPC_BPF_STL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
+
+	/*
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
@@ -234,12 +240,6 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
 	PPC_BCC(COND_GT, out);
 
-	/*
-	 * tail_call_cnt++;
-	 */
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
-	PPC_BPF_STL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
-
 	/* prog = array->ptrs[index]; */
 	EMIT(PPC_RAW_MULI(b2p[TMP_REG_1], b2p_index, 8));
 	EMIT(PPC_RAW_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index e649742..1608d94 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -800,12 +800,12 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 
 	/*
 	 * temp_tcc = tcc - 1;
-	 * if (tcc < 0)
+	 * if (temp_tcc < 0)
 	 *   goto out;
 	 */
 	emit(rv_addi(RV_REG_T1, RV_REG_TCC, -1), ctx);
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
-	emit_bcc(BPF_JSLT, RV_REG_TCC, RV_REG_ZERO, off, ctx);
+	emit_bcc(BPF_JSLT, RV_REG_T1, RV_REG_ZERO, off, ctx);
 
 	/*
 	 * prog = array->ptrs[index];
diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 3af4131..6e9ba83 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -311,12 +311,12 @@ static int emit_bpf_tail_call(int insn, struct rv_jit_context *ctx)
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
 	emit_branch(BPF_JGE, RV_REG_A2, RV_REG_T1, off, ctx);
 
-	/* if (TCC-- < 0)
+	/* if (--TCC < 0)
 	 *     goto out;
 	 */
 	emit_addi(RV_REG_T1, tcc, -1, ctx);
 	off = ninsns_rvoff(tc_ninsn - (ctx->ninsns - start_insn));
-	emit_branch(BPF_JSLT, tcc, RV_REG_ZERO, off, ctx);
+	emit_branch(BPF_JSLT, RV_REG_T1, RV_REG_ZERO, off, ctx);
 
 	/* prog = array->ptrs[index];
 	 * if (!prog)
diff --git a/arch/sparc/net/bpf_jit_comp_64.c b/arch/sparc/net/bpf_jit_comp_64.c
index 9a2f20c..50d914c 100644
--- a/arch/sparc/net/bpf_jit_comp_64.c
+++ b/arch/sparc/net/bpf_jit_comp_64.c
@@ -863,6 +863,10 @@ static void emit_tail_call(struct jit_ctx *ctx)
 	emit_branch(BGEU, ctx->idx, ctx->idx + OFFSET1, ctx);
 	emit_nop(ctx);
 
+	emit_alu_K(ADD, tmp, 1, ctx);
+	off = BPF_TAILCALL_CNT_SP_OFF;
+	emit(ST32 | IMMED | RS1(SP) | S13(off) | RD(tmp), ctx);
+
 	off = BPF_TAILCALL_CNT_SP_OFF;
 	emit(LD32 | IMMED | RS1(SP) | S13(off) | RD(tmp), ctx);
 	emit_cmpi(tmp, MAX_TAIL_CALL_CNT, ctx);
@@ -870,10 +874,6 @@ static void emit_tail_call(struct jit_ctx *ctx)
 	emit_branch(BGU, ctx->idx, ctx->idx + OFFSET2, ctx);
 	emit_nop(ctx);
 
-	emit_alu_K(ADD, tmp, 1, ctx);
-	off = BPF_TAILCALL_CNT_SP_OFF;
-	emit(ST32 | IMMED | RS1(SP) | S13(off) | RD(tmp), ctx);
-
 	emit_alu3_K(SLL, bpf_index, 3, tmp, ctx);
 	emit_alu(ADD, bpf_array, tmp, ctx);
 	off = offsetof(struct bpf_array, ptrs);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 9f4636d..8edb1c3 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -1564,10 +1564,10 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
 
 		if (unlikely(index >= array->map.max_entries))
 			goto out;
-		if (unlikely(tail_call_cnt > MAX_TAIL_CALL_CNT))
-			goto out;
 
 		tail_call_cnt++;
+		if (unlikely(tail_call_cnt > MAX_TAIL_CALL_CNT))
+			goto out;
 
 		prog = READ_ONCE(array->ptrs[index]);
 		if (!prog)
-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
