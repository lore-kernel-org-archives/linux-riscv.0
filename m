Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965E0C61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoPvp6NrN8eRfEvfa6ahQFBYFCi17L1pp1v61K4H3rw=; b=tGo39j13+4nGGH
	XSGpgKbTbHTuRAnRqz+8rWLqRdyGC0CknxXU/nfeYhEeIIIphcza0Atk9K4EkK8f1THNsCAWQ7494
	coxaG3LVsEb50cHOfzoOigo51un4UP3ekPUEGC64+jdHrls4lHd3g0GcBY37gynwRbILrqbDBoJGx
	4mhLbO09toIlre+UHS/oyffq0cMLtI2Bs832bcQRlm6AxKgUqcFUQF4HGua0A1kdUJjAflwD4MxF+
	og8/ywS0FHzWxEhRQHMY7R8F3xs/0/mOqES5ULllOpT/FVQd5KJRh6wgUNMW0NKAh6V2s3VDFnSpG
	l+DjgCSme3Gi81aKiCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsdo-00000005PTi-1IV9;
	Fri, 28 Aug 2026 09:12:52 +0000
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsdl-00000005PSt-3RbP
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 09:12:51 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgAXHpwAUZFq3NppAA--.5375S3;
	Fri, 28 Aug 2026 17:12:43 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Nam Cao <namcao@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v4 1/2] riscv: probes: reject kprobes inside LR/SC sequences
Date: Fri, 28 Aug 2026 17:12:01 +0800
Message-Id: <20260828091202.1124-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgAXHpwAUZFq3NppAA--.5375S3
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1UAFW8uw4kAw4Dury3Arb_yoWfuF4Upa
	n5Ca45trWkJw4xC34SyF4rZFWSyw1rKw43JrnrWa43Ka10gw1xtFZagw42yFn5CFZY9r1f
	uryFvws8WrWqv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
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
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQENE2qQZqwX+gAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021250_038894_10797ED2 
X-CRM114-Status: GOOD (  22.30  )
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

A breakpoint trap taken in the middle of an LR/SC sequence clears the
load reservation, so an SC following the probed instruction would always
fail and the enclosing retry loop would re-enter the breakpoint,
livelocking the CPU.

Reject probing the LR/SC instructions themselves, and reject probing
any address that lies inside an LR/SC sequence.  A constrained LR/SC
loop (Zalrsc) is at most 16 instructions contained in a 64-byte region.
RISC-V instruction boundaries cannot be recovered by walking backwards
(a 32-bit instruction whose upper halfword looks like a compressed
instruction is ambiguous), so walk forward from the function start, a
known instruction boundary, up to the probe address and reject the probe
if an LR is still outstanding when it is reached.

kallsyms_lookup_size_offset() returns the offset of the probe from the
start of the enclosing symbol, which is used to find the function start.
If the probe address exactly matched a kallsyms symbol, that offset would
be 0 and the forward scan would be skipped, silently missing the LR/SC
sequence.  To avoid this, global labels should not be placed at interior
instructions of an LR/SC sequence.  In practice this is not a
restriction: LR/SC sequences are tight retry loops and generally do not
carry global labels inside them, so the enclosing function start is
resolved correctly and the forward scan proceeds as intended.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
v2: address review comments from Nam Cao:
    - clarify that the 64-byte scan bound still holds with the C extension
    - document that scan_start need not be an instruction boundary
    - reuse the decoded insn for GET_INSN_LENGTH(), drop the (u16 *) cast
v3: rework the scan per Nam Cao's review:
    - walk 16 instructions backwards from the probe instead of scanning
      forward from the function entry, decoding instruction length from
      the low two bits of each instruction
    - drop the kallsyms_lookup_size_offset() dependency
    - dereference the instructions directly since probes always sit on
      the resident kernel text mapping
    - use get_unaligned() for the backward walk, which may cross 2-byte
      instruction boundaries and read a 32-bit instruction from a
      halfword-aligned address
v4: fix two bugs found during review and testing:
    - the backward walk toggled the LR/SC state in the wrong order: for
      "lr; insn; sc; probe" it saw the sc first and then the lr, wrongly
      reporting the probe as inside the sequence
    - the backward walk is fundamentally ambiguous in RISC-V: when walking
      backwards, the halfword at (addr - 2) could be either a 16-bit
      compressed instruction (low bits are opcode) or the upper half of a
      32-bit instruction (low bits are part of the immediate/rd fields),
      and there is no way to distinguish the two, so instruction length
      cannot be determined and boundaries cannot be recovered
    So walk forward instead: use kallsyms_lookup_size_offset() to find
    the function start, a known instruction boundary, then walk forward
    to the probe tracking whether an LR is still outstanding.
---
 arch/riscv/include/asm/insn.h          | 18 +++++++++
 arch/riscv/kernel/probes/decode-insn.c |  2 +
 arch/riscv/kernel/probes/kprobes.c     | 54 ++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8..d7d85b1b84 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -13,9 +13,12 @@
 #define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
 #define RV_INSN_OPCODE_OPOFF	0
 #define RV_INSN_FUNCT12_OPOFF	20
+#define RVG_FUNCT5_MASK		GENMASK(31, 27)
+#define RVG_FUNCT5_OPOFF	27
 
 #define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
 #define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
+#define RV_ENCODE_FUNCT5(f_)	(RVG_FUNCT5_##f_ << RVG_FUNCT5_OPOFF)
 
 /* The bit field of immediate value in I-type instruction */
 #define RV_I_IMM_SIGN_OPOFF	31
@@ -137,6 +140,7 @@
 /* parts of opcode for RVG*/
 #define RVG_OPCODE_FENCE	0x0f
 #define RVG_OPCODE_AUIPC	0x17
+#define RVG_OPCODE_LRSC		0x2f
 #define RVG_OPCODE_BRANCH	0x63
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
@@ -176,6 +180,9 @@
 #define RVG_FUNCT3_BLTU		0x6
 #define RVG_FUNCT3_BGEU		0x7
 
+#define RVG_FUNCT5_LR		0x02
+#define RVG_FUNCT5_SC		0x03
+
 /* parts of funct3 code for C extension*/
 #define RVC_FUNCT3_C_BEQZ	0x6
 #define RVC_FUNCT3_C_BNEZ	0x7
@@ -200,6 +207,8 @@
 #define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
 #define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
 #define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
+#define RVG_MATCH_LR		(RV_ENCODE_FUNCT5(LR) | RVG_OPCODE_LRSC)
+#define RVG_MATCH_SC		(RV_ENCODE_FUNCT5(SC) | RVG_OPCODE_LRSC)
 #define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
 #define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
 #define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
@@ -227,6 +236,8 @@
 #define RVC_MASK_C_EBREAK	0xffff
 #define RVG_MASK_EBREAK		0xffffffff
 #define RVG_MASK_SRET		0xffffffff
+#define RVG_MASK_LR		(RVG_FUNCT5_MASK | GENMASK(14, 14) | RV_INSN_OPCODE_MASK)
+#define RVG_MASK_SC		(RVG_FUNCT5_MASK | GENMASK(14, 14) | RV_INSN_OPCODE_MASK)
 
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
@@ -262,6 +273,13 @@ __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
 __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
+/*
+ * LR/SC (Zalrsc, opcode 0x2f).  funct3 selects the operand size: 000 (W)
+ * and 011 (D) on RV64; bit 14 is clear for both, so it is used to match
+ * either size.  The .aq/.rl bits (26:25) and rd are ignored.
+ */
+__RISCV_INSN_FUNCS(lr, RVG_MASK_LR, RVG_MATCH_LR)
+__RISCV_INSN_FUNCS(sc, RVG_MASK_SC, RVG_MATCH_SC)
 
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb..eae393ef58 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -23,6 +23,8 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 */
 	RISCV_INSN_REJECTED(system,		insn);
 	RISCV_INSN_REJECTED(fence,		insn);
+	RISCV_INSN_REJECTED(lr,			insn);
+	RISCV_INSN_REJECTED(sc,			insn);
 
 	/*
 	 * Simulate instructions list:
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 9e2afabf94..f858426cd3 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -9,10 +9,12 @@
 #include <linux/vmalloc.h>
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/unaligned.h>
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/text-patching.h>
+#include <asm/insn.h>
 
 #include "decode-insn.h"
 
@@ -69,6 +71,55 @@ static bool __kprobes arch_check_kprobe(unsigned long addr)
 	return false;
 }
 
+/*
+ * A trap taken in the middle of an LR/SC sequence clears the load
+ * reservation, so an SC following the probed instruction would always
+ * fail and the enclosing retry loop would re-enter the breakpoint.
+ * Reject probes inside such a sequence.
+ *
+ * A constrained LR/SC loop (Zalrsc) is at most 16 instructions and
+ * must be contained in a 64-byte contiguous region of memory, so only
+ * instructions within that window preceding the probe can open a
+ * sequence containing it.  RISC-V instruction boundaries cannot be
+ * recovered by walking backwards - a 32-bit instruction whose upper
+ * halfword looks like a compressed instruction is ambiguous - so walk
+ * forward from the function start, a known instruction boundary, up to
+ * the probe address and track whether an LR is still outstanding.
+ */
+#define MAX_ATOMIC_CONTEXT_SIZE	64
+
+static bool __kprobes riscv_probe_insn_in_atomic(unsigned long addr)
+{
+	unsigned long start, offset, pc;
+	bool in_atomic = false;
+
+	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
+		return false;
+
+	start = addr - offset;
+	pc = start;
+
+	while (pc < addr) {
+		u16 halfword = *(u16 *)pc;
+		unsigned int len = (halfword & 0x3) == 0x3 ? 4 : 2;
+
+		if (addr - pc <= MAX_ATOMIC_CONTEXT_SIZE) {
+			if (len == 4) {
+				u32 insn = get_unaligned((u32 *)pc);
+
+				if (riscv_insn_is_lr(insn))
+					in_atomic = true;
+				else if (riscv_insn_is_sc(insn))
+					in_atomic = false;
+			}
+		}
+
+		pc += len;
+	}
+
+	return in_atomic;
+}
+
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
 	u16 *insn = (u16 *)p->addr;
@@ -79,6 +130,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 	if (!arch_check_kprobe((unsigned long)p->addr))
 		return -EILSEQ;
 
+	if (riscv_probe_insn_in_atomic((unsigned long)p->addr))
+		return -EINVAL;
+
 	/* copy instruction */
 	p->opcode = (kprobe_opcode_t)(*insn++);
 	if (GET_INSN_LENGTH(p->opcode) == 4)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
