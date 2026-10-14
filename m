Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E4CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NQPkA+S6gE2FfCxZWHXkcZf+ECGNrtDKprKUsC3IEiU=; b=QL5RGzeXl42kuT
	gMSBvGzQWfRaBuylRc3RCC6s8vY89YPj8q5sn1zxZODbWBZ75oAWI5WFggw9Oepk0vP7ylfLsH5vY
	cRf0BW7b2TeyWvbdZfq30gMwJvF2U1K8Se+WD73ud7+3cE8V8oIH4CgUkDtXacNe+U1tUtEKItaLz
	T0pxNz3BsPDgmNXds0oHeA2yw55j5zwiZQRSa87IVI1pcO8nJW5JUU1vMTL762ltlb68qZsqhaFub
	GW662BJR+pZ78QwaxFojxWrjfX8m8MqTPDITZFzWmigyq3CEcNv3auw6gQjT85eorOlEwRqFbnN7h
	dRAD3pkCbQ1z3pi5GH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXJ-0000000F695-0VeM;
	Wed, 14 Oct 2026 09:44:37 +0000
Received: from azure-sdnproxy.icoremail.net ([52.187.6.220])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXB-0000000F65E-2HPN
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 09:44:31 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgCXKW7vTs9q6aSGAA--.43637S3;
	Wed, 14 Oct 2026 17:44:17 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Subject: [PATCH v5 1/2] riscv: kprobes: reject probes inside LR/SC sequences
Date: Wed, 14 Oct 2026 17:44:14 +0800
Message-Id: <20261014094415.374-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
References: <20260828091202.1124-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgCXKW7vTs9q6aSGAA--.43637S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XF47GrW7WFy7AFW8CF4fGrg_yoW3Jr48pF
	s5Cw15JrWDXFs7CrySyr4kZr4Svan5G3y7KryDZa43KayUKryrtFZ29w42k3Z8CrZY9w1f
	WrWavrZ8u347AaDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4U
	JbIYCTnIWIevJa73UjIFyTuYvjfUnZXrUUUUU
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEAE2rOXakY1wAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_024429_751007_2C23E7DA 
X-CRM114-Status: GOOD (  19.99  )
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

A trap taken in the middle of an LR/SC sequence clears the load
reservation, so an SC following the probed instruction always fails and
the enclosing retry loop re-enters the breakpoint, livelocking the CPU.
Reject probes of the LR/SC instructions themselves and of any address
between them.

arm64's kprobes rejects its equivalent exclusive load/store instructions
and, in arm_kprobe_decode_insn(), walks backward from the probe address
(bounded by the enclosing symbol) to reject any address inside an
exclusive sequence.  RISC-V cannot walk backward because
variable-length instructions make instruction boundaries ambiguous, so
walk forward from the enclosing symbol, a known instruction boundary, up
to the probe address and track whether an LR is still outstanding.

A Zalrsc-constrained LR/SC retry loop holds at most 16 instructions, so
an LR more than MAX_LRSC_GAP instructions ahead of the probe cannot
start a sequence containing it.  Count instructions, not bytes:
compressed instructions would make a byte window ambiguous.

The LR/SC instructions themselves are rejected in
riscv_probe_decode_insn(), and an address inside a sequence is rejected
in arch_check_kprobe().

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
 arch/riscv/include/asm/insn.h          | 33 ++++++++++++++
 arch/riscv/kernel/probes/decode-insn.c |  2 +
 arch/riscv/kernel/probes/kprobes.c     | 63 +++++++++++++++++++++-----
 3 files changed, 86 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index ad348d8b8..46a1666d2 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -141,6 +141,7 @@
 #define RVG_OPCODE_JALR		0x67
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
+#define RVG_OPCODE_AMO		0x2f
 #define RVG_SYSTEM_CSR_OFF	20
 #define RVG_SYSTEM_CSR_MASK	GENMASK(11, 0)
 
@@ -175,6 +176,8 @@
 #define RVG_FUNCT3_BGE		0x5
 #define RVG_FUNCT3_BLTU		0x6
 #define RVG_FUNCT3_BGEU		0x7
+#define RVG_FUNCT3_AMO_W	0x2
+#define RVG_FUNCT3_AMO_D	0x3
 
 /* parts of funct3 code for C extension*/
 #define RVC_FUNCT3_C_BEQZ	0x6
@@ -263,6 +266,36 @@ __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
 __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
 __RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
 
+/*
+ * LR/SC are identified by the AMO opcode plus the funct3 width field
+ * (.w/.d) and the funct5 field (funct7[6:2]) distinguishing LR from SC.
+ * The aq/rl bits (funct7[1:0]) are ignored.  For LR the rs2 field must
+ * encode x0.
+ */
+#define RVG_AMO_FUNCT5_LR	0x02
+#define RVG_AMO_FUNCT5_SC	0x03
+
+static __always_inline bool riscv_insn_is_lr(u32 code)
+{
+	u32 funct5 = (code >> 27) & 0x1f;
+	u32 funct3 = (code >> 12) & 0x7;
+
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_AMO &&
+	       funct5 == RVG_AMO_FUNCT5_LR &&
+	       (funct3 == RVG_FUNCT3_AMO_W || funct3 == RVG_FUNCT3_AMO_D) &&
+	       !(code & GENMASK(24, 20));
+}
+
+static __always_inline bool riscv_insn_is_sc(u32 code)
+{
+	u32 funct5 = (code >> 27) & 0x1f;
+	u32 funct3 = (code >> 12) & 0x7;
+
+	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_AMO &&
+	       funct5 == RVG_AMO_FUNCT5_SC &&
+	       (funct3 == RVG_FUNCT3_AMO_W || funct3 == RVG_FUNCT3_AMO_D);
+}
+
 /* special case to catch _any_ system instruction */
 static __always_inline bool riscv_insn_is_system(u32 code)
 {
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 433d9035b..e6a889467 100644
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
index a76eab297..8f20f1535 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -7,11 +7,13 @@
 #include <linux/slab.h>
 #include <linux/stop_machine.h>
 #include <linux/vmalloc.h>
+#include <linux/unaligned.h>
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
 #include <asm/sections.h>
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/text-patching.h>
 
 #include "decode-insn.h"
@@ -49,35 +51,72 @@ static void __kprobes arch_simulate_insn(struct kprobe *p, struct pt_regs *regs)
 	post_kprobe_handler(p, kcb, regs);
 }
 
-static bool __kprobes arch_check_kprobe(unsigned long addr)
+/*
+ * A trap taken in the middle of an LR/SC sequence clears the load
+ * reservation, so an SC following the probed instruction would always
+ * fail and the enclosing retry loop would re-enter the breakpoint.
+ * Reject probes inside such a sequence.
+ *
+ * RISC-V instruction boundaries cannot be recovered by walking
+ * backwards - a 32-bit instruction whose upper halfword looks like a
+ * compressed instruction is ambiguous - so walk forward from the
+ * enclosing symbol, a known instruction boundary, up to the probe address
+ * and track whether an LR is still outstanding.  A Zalrsc-constrained
+ * LR/SC retry loop holds at most 16 instructions, so an LR more than
+ * that many instructions ahead of the probe cannot start a sequence
+ * containing it.  Count instructions, not bytes: compressed
+ * instructions would make a byte window ambiguous.
+ */
+#define MAX_LRSC_GAP	16
+
+/*
+ * Verify that @addr points at the start of an instruction and is not
+ * inside an LR/SC sequence.  Returns 0 on success, -EILSEQ if @addr is
+ * not an instruction boundary, or -EINVAL if the probe would land
+ * inside an LR/SC sequence.
+ */
+static int __kprobes arch_check_kprobe(unsigned long addr)
 {
-	unsigned long tmp, offset;
+	unsigned long pc, offset;
+	int outstanding_lr = -1;
 
-	/* start iterating at the closest preceding symbol */
 	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
-		return false;
+		return -EILSEQ;
 
-	tmp = addr - offset;
+	/* pc starts at the closest preceding symbol, a known instruction boundary */
+	pc = addr - offset;
 
-	while (tmp <= addr) {
-		if (tmp == addr)
-			return true;
+	while (pc < addr) {
+		u32 insn = get_unaligned((u32 *)pc);
+		unsigned int len = GET_INSN_LENGTH(insn);
 
-		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+		if (riscv_insn_is_lr(insn))
+			outstanding_lr = 0;
+		else if (riscv_insn_is_sc(insn))
+			outstanding_lr = -1;
+		else if (outstanding_lr >= 0 && ++outstanding_lr > MAX_LRSC_GAP)
+			outstanding_lr = -1;
+
+		pc += len;
 	}
 
-	return false;
+	if (pc != addr)
+		return -EILSEQ;
+
+	return outstanding_lr >= 0 ? -EINVAL : 0;
 }
 
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
 	u16 *insn = (u16 *)p->addr;
+	int ret;
 
 	if ((unsigned long)insn & 0x1)
 		return -EILSEQ;
 
-	if (!arch_check_kprobe((unsigned long)p->addr))
-		return -EILSEQ;
+	ret = arch_check_kprobe((unsigned long)p->addr);
+	if (ret)
+		return ret;
 
 	/* copy instruction */
 	p->opcode = (kprobe_opcode_t)(*insn++);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
