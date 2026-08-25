Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F3C61DBE
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCyhf+Oil+Efg42yfA1K2MmaWrOd+BwFQs6GOV0E5oM=; b=2+STyeDAK+J/tL
	hxnwWsbwS70PGsir5ORCuWFBEgd6EXHXgWXgdfTfFzMpy/V+A40gbmMeyl2XxLnxmbEvopfub7XsX
	Y7nCX/gqpRs7Fa2L0+0L7afUq5XiTHU7rJFfARqIYIQbeYyzGlM9vupr3h7JISZHdA12hOe/DQErX
	XZt4kQ7N+flU1GJutxKsiN4ZFsCjFcA0KCUd2MZcx3Q89xeDCAXYAb7M3G37MusGOYI9Q04lpnaBB
	RCxORoU+3RB8i55HMrCEzQGkMlCBFgTrmRXko7p52aZABojm/ux4o6X/V5yuLc4UpeflPcA9w5flT
	MA6w1IwqOQIU22+EzFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9I-00000000kp5-3AKZ;
	Tue, 25 Aug 2026 12:21:04 +0000
Received: from azure-sdnproxy.icoremail.net ([40.65.178.148])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq9D-00000000knU-09l1
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 12:21:02 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgB3jaCbiI1q14xgAA--.39139S3;
	Tue, 25 Aug 2026 20:20:47 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v2 1/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Tue, 25 Aug 2026 20:20:19 +0800
Message-Id: <20260825122020.1192-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
References: <20260825122020.1192-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgB3jaCbiI1q14xgAA--.39139S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF45GFWDur1UGFWUtF4kCrg_yoW7JF18pa
	n8C3sxGr4kWFs7Cr9xArs8ur4rtws5Kw43Ka1UKayrKw42gryrX3s3Ka15AF1kJFWFgryx
	K34Y9rykC343A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
	62IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcV
	AFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG
	0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjNV
	yDUUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEKE2qMciwftQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_052059_283627_CBE94D8C 
X-CRM114-Status: GOOD (  12.13  )
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

nop and c.nop have no architectural effect, so allocating an
out-of-line instruction slot and single-stepping through them is
pure overhead. Simulate them directly in the breakpoint handler
by advancing the program counter, following the approach already
used on arm64.

This avoids slot allocation, text patching, IRQ flag save/restore
and the single-step exception for these instructions.

riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
simulation also applies to uprobes placed on nop instructions. This
is relevant for USDT probe sites in user-space binaries, which are
nop/c.nop instructions, the same use case that motivated the arm64
implementation. In kernel text, nops are also found at ftrace
mcount call sites and disabled jump_label sites.

Measured on QEMU (RISC-V virt, emulated), this reduces the per-hit
cost of a kprobe on a nop by roughly 40% compared to single-stepping
through the out-of-line slot.

Compile tested on RISC-V, and verified with the RISC-V kprobes
KUnit test which now covers nop and c.nop.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 arch/riscv/include/asm/insn.h            | 11 +++++++++++
 arch/riscv/kernel/probes/decode-insn.c   |  6 ++++++
 arch/riscv/kernel/probes/simulate-insn.c | 14 ++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  2 ++
 4 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8..5b3944a5fa 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -228,6 +228,15 @@
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
 
+/*
+ * NOP and C.NOP have no variable fields, so all bits must match.
+ * NOP is encoded as ADDI x0, x0, 0 (0x00000013), C.NOP as C.ADDI x0, 0 (0x0001).
+ */
+#define RVG_MATCH_NOP		0x00000013
+#define RVG_MASK_NOP		0xffffffff
+#define RVC_MATCH_C_NOP		0x0001
+#define RVC_MASK_C_NOP		0xffff
+
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
 #define __INSN_OPCODE_MASK	_UL(0x7F)
@@ -262,6 +271,8 @@ __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+__RISCV_INSN_FUNCS(nop, RVG_MASK_NOP, RVG_MATCH_NOP)
+__RISCV_INSN_FUNCS(c_nop, RVC_MASK_C_NOP, RVC_MATCH_C_NOP)
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb..d28408f0b7 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -44,5 +44,11 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_SET_SIMULATE(auipc,		insn);
 	RISCV_INSN_SET_SIMULATE(branch,		insn);
 
+	/* Simulate NOP for better performance */
+	RISCV_INSN_SET_SIMULATE(nop,		insn);
+#ifdef CONFIG_RISCV_ISA_C
+	RISCV_INSN_SET_SIMULATE(c_nop,		insn);
+#endif
+
 	return INSN_GOOD;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index fa581590c1..3b22d3ad53 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -237,3 +237,17 @@ bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *r
 {
 	return simulate_c_bnez_beqz(opcode, addr, regs, false);
 }
+
+bool __kprobes simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 4);
+
+	return true;
+}
+
+bool __kprobes simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	instruction_pointer_set(regs, addr + 2);
+
+	return true;
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 44ebbc444d..7e0936613f 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -29,5 +29,7 @@ bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_nop(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
