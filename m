Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C28BC624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 08:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxxxSYIAg20Ve4SzsWJk8mfhwd8AAKUHb7kEZKoG/0M=; b=XAhNYG+QZH0ILJ
	eit1OgPbF4DhsUmGpuuWEdvkct3Oge62OCMVi/ehG8PSKMrcsP0OgRDHi6/pSlrYJkt5JHDI23d2I
	el11ORGiofl1ARykSg2f8v0n8B0N6Ip8Cbp31AwMoDN32YtR8A8Q1BX5NRp7btZzzO8IadNJUhetR
	3mX9WEHz4bVfpqR6adWInRW1KbCcjcct8ghxpdlPMA+fRxa46lC6I2uNj0LH4qh7ucrQPTTqE5ox4
	XIXVnCBWGHPmosY9k1wTknR8q67Q535pM5To2HDWdBeTHHES/KyUvkJSlHuUadwhaA1JPdXerZe2N
	lRTdZEyo/M07fqI8v7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2m9x-00000003t0I-0Sff;
	Sat, 05 Sep 2026 08:54:01 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2m9s-00000003syz-2ocH
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 08:53:59 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hcRtl6sm1zYQv1D
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:53:03 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 0136640561
	for <linux-riscv@lists.infradead.org>; Sat,  5 Sep 2026 16:53:50 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP1 (Coremail) with UTF8SMTPA id cCh0CgBnTwqc2JtqP8lOAw--.13006S3;
	Sat, 05 Sep 2026 16:53:49 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng Jiang <jiangfeng@kylinos.cn>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Pu Lehui <pulehui@huawei.com>
Subject: [PATCH bpf-next v5 1/3] riscv, bpf: Remap BPF_REG_0 and RV_REG_TCC
Date: Sat,  5 Sep 2026 08:58:55 +0000
Message-Id: <20260905085857.14143-2-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905085857.14143-1-pulehui@huaweicloud.com>
References: <20260905085857.14143-1-pulehui@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBnTwqc2JtqP8lOAw--.13006S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JF1ftr48Zr4rXry3KF47XFb_yoW7WFyfp3
	4UW3srJa4kta13W347GF1UXw4fJrnYq39rCr1xKayayF1DtryrXa1kKr45try5JrsYkw4r
	AF1v9wsY9a1UJrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGw
	A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	W8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUIw0e
	DUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_015357_075016_C011B7A3 
X-CRM114-Status: GOOD (  10.19  )
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

From: Pu Lehui <pulehui@huawei.com>

To prepare for supporting bpf stack arguments and unifying the calling
convention between bpf2bpf calls and kfunc calls, remap BPF_REG_0 to t6
and RV_REG_TCC to t5.

In the riscv abi, a0-a7 are designated for function argument passing.
Freeing a5 and a6 allows bpf2bpf calls to pass extra arguments (6th to
8th) via a5-a7 consistently with kfuncs.

Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 arch/riscv/net/bpf_jit_comp64.c                        | 10 +++++-----
 arch/riscv/net/bpf_timed_may_goto.S                    |  8 ++++----
 .../testing/selftests/bpf/progs/verifier_jit_inline.c  |  2 +-
 tools/testing/selftests/bpf/progs/verifier_ldsx.c      |  6 +++---
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index e7378be171a9..fc1c8c5480b6 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -23,11 +23,11 @@
 /* fentry and TCC init insns will be skipped on tailcall */
 #define RV_TAILCALL_OFFSET ((RV_FENTRY_NINSNS + 1) * 4)
 
-#define RV_REG_TCC RV_REG_A6
+#define RV_REG_TCC RV_REG_T5
 #define RV_REG_ARENA RV_REG_S7 /* For storing arena_vm_start */
 
 static const int regmap[] = {
-	[BPF_REG_0] =	RV_REG_A5,
+	[BPF_REG_0] =	RV_REG_T6,
 	[BPF_REG_1] =	RV_REG_A0,
 	[BPF_REG_2] =	RV_REG_A1,
 	[BPF_REG_3] =	RV_REG_A2,
@@ -47,13 +47,13 @@ static const int pt_regmap[] = {
 	[RV_REG_A2] = offsetof(struct pt_regs, a2),
 	[RV_REG_A3] = offsetof(struct pt_regs, a3),
 	[RV_REG_A4] = offsetof(struct pt_regs, a4),
-	[RV_REG_A5] = offsetof(struct pt_regs, a5),
 	[RV_REG_S1] = offsetof(struct pt_regs, s1),
 	[RV_REG_S2] = offsetof(struct pt_regs, s2),
 	[RV_REG_S3] = offsetof(struct pt_regs, s3),
 	[RV_REG_S4] = offsetof(struct pt_regs, s4),
 	[RV_REG_S5] = offsetof(struct pt_regs, s5),
 	[RV_REG_T0] = offsetof(struct pt_regs, t0),
+	[RV_REG_T6] = offsetof(struct pt_regs, t6),
 };
 
 enum {
@@ -239,7 +239,7 @@ static void __build_epilogue(bool is_tail_call, struct rv_jit_context *ctx)
 	emit_addi(RV_REG_SP, RV_REG_SP, stack_adjust, ctx);
 	/* Set return value. */
 	if (!is_tail_call)
-		emit_addiw(RV_REG_A0, RV_REG_A5, 0, ctx);
+		emit_addiw(RV_REG_A0, regmap[BPF_REG_0], 0, ctx);
 	emit_jalr(RV_REG_ZERO, is_tail_call ? RV_REG_T3 : RV_REG_RA,
 		  is_tail_call ? RV_TAILCALL_OFFSET : 0, ctx);
 }
@@ -1075,7 +1075,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 
 	save_ret = flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET);
 	if (save_ret)
-		stack_size += 16; /* Save both A5 (BPF R0) and A0 */
+		stack_size += 16; /* Save both RV_REG_T6 (BPF R0) and RV_REG_A0 */
 	retval_off = stack_size;
 
 	stack_size += nr_arg_slots * 8;
diff --git a/arch/riscv/net/bpf_timed_may_goto.S b/arch/riscv/net/bpf_timed_may_goto.S
index 02c637d87420..fcf850f244c9 100644
--- a/arch/riscv/net/bpf_timed_may_goto.S
+++ b/arch/riscv/net/bpf_timed_may_goto.S
@@ -10,7 +10,7 @@
  *	- output: updated count in BPF_REG_AX (t0)
  *
  * Calls bpf_check_timed_may_goto(ptr) with the standard RISC-V ABI, where
- * ptr = BPF_REG_FP (s5) + BPF_REG_AX (t0). BPF R0-R5 (a5, a0-a4) are saved
+ * ptr = BPF_REG_FP (s5) + BPF_REG_AX (t0). BPF R0-R5 (t6, a0-a4) are saved
  * across the call; BPF_REG_FP (s5) is callee-saved and needs no saving.
  */
 
@@ -20,8 +20,8 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	REG_S	s0, 6*SZREG(sp)
 	addi	s0, sp, 8*SZREG
 
-	/* Save BPF registers R0-R5 (a5, a0-a4) */
-	REG_S	a5, 5*SZREG(sp)
+	/* Save BPF registers R0-R5 (t6, a0-a4) */
+	REG_S	t6, 5*SZREG(sp)
 	REG_S	a0, 4*SZREG(sp)
 	REG_S	a1, 3*SZREG(sp)
 	REG_S	a2, 2*SZREG(sp)
@@ -38,7 +38,7 @@ SYM_FUNC_START(arch_bpf_timed_may_goto)
 	REG_L	a2, 2*SZREG(sp)
 	REG_L	a1, 3*SZREG(sp)
 	REG_L	a0, 4*SZREG(sp)
-	REG_L	a5, 5*SZREG(sp)
+	REG_L	t6, 5*SZREG(sp)
 
 	REG_L	s0, 6*SZREG(sp)
 	REG_L	ra, 7*SZREG(sp)
diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 02e562f56f9d..5b92da2ab75c 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -11,7 +11,7 @@ __jited("	addq	%gs:{{.*}}, %rax")
 __arch_arm64
 __jited("	mrs	x8, SP_EL0")
 __arch_riscv64
-__jited("	mv	a5, tp")
+__jited("	mv	t6, tp")
 __arch_loongarch
 __jited("	move	$a5, $tp")
 int inline_bpf_get_current_task(void)
diff --git a/tools/testing/selftests/bpf/progs/verifier_ldsx.c b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
index 7e25e1b8cd0b..49e8cd4bb4f9 100644
--- a/tools/testing/selftests/bpf/progs/verifier_ldsx.c
+++ b/tools/testing/selftests/bpf/progs/verifier_ldsx.c
@@ -289,11 +289,11 @@ __jited("ldrsh	x22, [x11, #0x18]")
 __jited("add	x11, x0, x28")
 __jited("ldrsb	x22, [x11, #0x20]")
 __arch_riscv64
-__jited("add	t2, a5, s7")
+__jited("add	t2, t6, s7")
 __jited("lw	s3, 0x10(t2)")
-__jited("add	t2, a5, s7")
+__jited("add	t2, t6, s7")
 __jited("lh	s3, 0x18(t2)")
-__jited("add	t2, a5, s7")
+__jited("add	t2, t6, s7")
 __jited("lb	s3, 0x20(t2)")
 __jited("add	t2, a0, s7")
 __jited("lw	s4, 0x10(t2)")
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
