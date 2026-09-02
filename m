Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28E9C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Z/LT8bnvHgj5vLVqlZ2LblUiJz73M50ibjmId9cODg=; b=obdoQ8jSccP22F
	x21FfKL+idXzHDKwJZQLFCIICYUpMh31Ke5nMt5dqC9SQBxGrDWIKznpf3j953AxSA1wFQoP4Mt/1
	Te7tafRhczVq9w1R8UTZ7t0x7GmywvxU48xcjOftaghOF7u0JwL11hEogu4GuQNVDsSCefvYawsgs
	OANvGzzDyiDSwUUZzcEpmsF6RabfNHWyaZmyTG3ldTeLqamUaeHu/OG0TxG5vBk+5ivuY3PniSt6d
	gPYYTu7T5+us8yeOuoOC7CkTvc46YBGoMNov8LIOWBpdinKfdqWvPnX5mPUhPRNFZs9uJUz9sMTdB
	fdrsOTmzQ5SpZDvsL6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1Q-0000000E2N3-0UCY;
	Wed, 02 Sep 2026 08:08:40 +0000
Received: from zg8tmja2lje4os43os4xodqa.icoremail.net ([206.189.79.184])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1g1N-0000000E2M9-3aYV
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:08:39 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgCXKW5z2ZdqoZ96AA--.27641S3;
	Wed, 02 Sep 2026 16:08:31 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v3 1/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Wed,  2 Sep 2026 16:08:16 +0800
Message-Id: <20260902080817.681-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
References: <20260902080817.681-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXKW5z2ZdqoZ96AA--.27641S3
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr43AryxXrWUGFW8tr17GFg_yoW7Ww1kpa
	n8C3ZxGrWkWFs7Cr9xArn8ur4rtws5Kw43Ka17ta15K3y7WryrZ3s3Kw43AF1DJryFgryx
	KryYvrykC343A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAVWUtw
	CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
	1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU
	emhwUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgESE2qW-qNgkgAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010837_929686_3DCA2CD1 
X-CRM114-Status: GOOD (  13.94  )
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

A kprobe or uprobe placed on a nop currently replays the instruction
out-of-line: the breakpoint trap runs the probe handler and redirects
execution to a copy of the instruction sitting in an XOL slot, and a
second breakpoint appended after the copy traps again to finish the
hit.  That costs an extra exception round-trip per hit; for uprobes
the slot runs in user mode, so the re-trap is a full
kernel<->userspace round-trip.

nop and c.nop have no architectural effect, so the replay can be
replaced by simply advancing the program counter when handling the
initial breakpoint, completing every hit within a single trap.
arm64 does the same in its probe-decode path, which is also shared
between kprobes and uprobes; see commit ac4ad5c09b34 ("arm64: insn:
Simulate nop instruction for better uprobe performance").

riscv_probe_decode_insn() is shared by kprobes and uprobes, so the
simulation applies to both.  It primarily matters for uprobes on
USDT probe sites: under the SystemTap SDT ABI (sys/sdt.h, parsed by
libbpf), the recorded probe location is by construction a plain nop
or c.nop, the same case that motivated the arm64 series.

Measured on QEMU (RISC-V virt, emulated): for a uprobe on a USDT
style nop site the per-hit cost drops by roughly 80 percent; for a
kprobe on a nop by roughly 40 percent.  On real arm64 hardware the
referenced commit measured ~2x.

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
