Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73D0C5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NeRdLyyVtJt38E3ACyNUnHMgjppnKPeGGoOZRvoTFb4=; b=HzVuQxHgKPLq69
	j4dsl+SFl2rWWnSGHw5+7hoLBAkLyl+ZTb3lMPJVvKBr1gkpMWMVDmdQnYgUTU+dHxtmBEkRT3qqU
	AcnCoGUYo6rbBCriBv1sA0ui2JV4oTedx5Ji9ESES/ADKBr9oRSNguDO4w9Dt12zcxG39XMrfQIsi
	F6INxF9i2Fuz+W34qTqzxzBk1B3uWxtMJA//qIsyvfuGBJgfspH4LVa4anGGj1aaN+mN+Rb3RqTtZ
	4t/1KfYbLNYZuYRwoVvpAO1NkTQvOof3VTLg3ZJEDUKf5Po3AoptICQkhEk33CIhNUaxyyWuTYQIw
	ikVSWaE4l06E3Yg8ESVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxjLn-0000000ETgd-45sP;
	Sat, 22 Aug 2026 10:53:23 +0000
Received: from azure-sdnproxy.icoremail.net ([4.193.249.245])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxjLj-0000000ETgB-3ZfE
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 10:53:22 +0000
Received: from E0002472LT.eswin.cn (unknown [10.100.72.7])
	by app2 (Coremail) with SMTP id TQJkCgC3vZuQf4lq57dUAA--.43440S2;
	Sat, 22 Aug 2026 18:53:05 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	yuanxiaofeng@eswincomputing.com
Subject: [PATCH v2] riscv: probes: reject kprobes inside LR/SC sequences
Date: Sat, 22 Aug 2026 18:53:03 +0800
Message-Id: <20260822105303.2043-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgC3vZuQf4lq57dUAA--.43440S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFy8KF48WrWkuFyfJw1DZFb_yoWxtF4xpa
	n5Ca4YqrZ5Ja1xC3ySyF4kZw4Syw1rKw47GrnFvF43Ka109w1rta90gw43AF1kuFZY9r1f
	CryrZrs8W342v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv
	67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
	9x0JUSNtxUUUUU=
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEHE2qIfiEEawAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_035320_084969_DB58B573 
X-CRM114-Status: GOOD (  17.23  )
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
any address that lies inside an LR/SC sequence by scanning back up to
the Zalrsc constrained-loop limit of 64 bytes.

Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
---
v2: address review comments from Nam Cao:
  - clarify that the 64-byte scan bound still holds with the C extension
  - document that scan_start need not be an instruction boundary
  - reuse the decoded insn for GET_INSN_LENGTH(), drop the (u16 *) cast

 arch/riscv/include/asm/insn.h          | 18 ++++++++
 arch/riscv/kernel/probes/decode-insn.c |  2 +
 arch/riscv/kernel/probes/kprobes.c     | 59 ++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

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
index 9e2afabf94..f4345365c1 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -13,6 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/text-patching.h>
+#include <asm/insn.h>
 
 #include "decode-insn.h"
 
@@ -69,6 +70,61 @@ static bool __kprobes arch_check_kprobe(unsigned long addr)
 	return false;
 }
 
+/*
+ * A trap taken in the middle of an LR/SC sequence clears the load
+ * reservation, so an SC following the probed instruction would always
+ * fail and the enclosing retry loop would re-enter the breakpoint.
+ * Reject probes inside such a sequence.
+ *
+ * A constrained LR/SC loop (Zalrsc) must be contained within a 64-byte
+ * contiguous region of memory and comprise at most 16 instructions.
+ * Both bounds hold regardless of the C extension, so scanning back
+ * 64 bytes from the probed instruction always covers the enclosing
+ * sequence.
+ */
+#define MAX_ATOMIC_CONTEXT_SIZE	64
+
+static bool __kprobes riscv_probe_insn_in_atomic(unsigned long addr)
+{
+	unsigned long tmp, offset, scan_start;
+	bool in_atomic = false;
+
+	if (!kallsyms_lookup_size_offset(addr, NULL, &offset))
+		return false;
+
+	tmp = addr - offset;				/* function entry */
+
+	if (offset > MAX_ATOMIC_CONTEXT_SIZE)
+		scan_start = addr - MAX_ATOMIC_CONTEXT_SIZE;
+	else
+		scan_start = tmp;
+
+	/*
+	 * scan_start is not necessarily an instruction boundary, so walk
+	 * forward from the function entry to the first instruction start
+	 * at or after scan_start.  Losing at most one instruction of
+	 * coverage this way still leaves a window wide enough to contain
+	 * any constrained LR/SC loop.
+	 */
+	while (tmp < scan_start)
+		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+
+	/* scan the window, tracking whether an LR is still outstanding */
+	while (tmp < addr) {
+		u32 insn = *(u32 *)tmp;
+
+		if (GET_INSN_LENGTH(insn) == 4) {
+			if (riscv_insn_is_lr(insn))
+				in_atomic = true;
+			else if (riscv_insn_is_sc(insn))
+				in_atomic = false;
+		}
+		tmp += GET_INSN_LENGTH(insn);
+	}
+
+	return in_atomic;
+}
+
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
 	u16 *insn = (u16 *)p->addr;
@@ -79,6 +135,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
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
