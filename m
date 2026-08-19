Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8D4C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 10:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pb20t49n5FO2aAGnhzCHCAneZ/kEf3U5ztQw4e89c1Q=; b=i7EzeGNBLSxTnF
	jZUf5VwamUfxeHnHy1eqZS296rMZJsz3FLhCVt6selV9DhDmFzbM7pXd0zYRrXYRKK2er6lcvUkBe
	wzmlDV+V24sUuUREUnBiXtWayB3Xe1e60oIr24UyqeN7XjRL70bNqEz5dFhvdE4lZqiAfdt+nCfzx
	vN2Hyfy5dxhLn08M8PPwQ6T2vtTPOAqHJxxeCIDihs6KJGvUHbRUsDuMTm6iIo/11DYV9u/2Uo8Os
	TqZYjbCti3agaZEvSeo6SJ0NbdJhsc8CO6i/PuVJGlF8zJ6LJiiRIjtmpMGwYJ7K5tH4XjZ6nWxHc
	53X04uD/SYvCxrAnqGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdY5-00000009YXU-43io;
	Wed, 19 Aug 2026 10:29:34 +0000
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdY2-00000009YVU-2EoB
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 10:29:32 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app1 (Coremail) with SMTP id TAJkCgAHmW2DhYVqOElMAA--.31878S2;
	Wed, 19 Aug 2026 18:29:24 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yuanxiaofeng@eswincomputing.com
Subject: [PATCH] riscv: probes: reject kprobes inside LR/SC sequences
Date: Wed, 19 Aug 2026 18:29:22 +0800
Message-Id: <20260819102922.1747-1-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: TAJkCgAHmW2DhYVqOElMAA--.31878S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFy8KF48WrWkuFyfJw1DZFb_yoWxWw43pa
	n5CFyYqrZ8Ja1xC3ySyFs8Zw4Fyw1rKw47Gr17ZF43Ka18uw1rJa90gw43Ar1kuFZ09r1x
	CryrZrs8W39rZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvS14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7VUbhvttUUUUU==
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAQEEE2qEiSsaSwABsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_032930_806283_73153E5A 
X-CRM114-Status: GOOD (  15.97  )
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
 arch/riscv/include/asm/insn.h          | 18 +++++++++
 arch/riscv/kernel/probes/decode-insn.c |  2 +
 arch/riscv/kernel/probes/kprobes.c     | 51 ++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

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
index 9e2afabf94..e10c40b103 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -13,6 +13,7 @@
 #include <asm/cacheflush.h>
 #include <asm/bug.h>
 #include <asm/text-patching.h>
+#include <asm/insn.h>
 
 #include "decode-insn.h"
 
@@ -69,6 +70,53 @@ static bool __kprobes arch_check_kprobe(unsigned long addr)
 	return false;
 }
 
+/*
+ * A trap taken in the middle of an LR/SC sequence clears the load
+ * reservation, so an SC following the probed instruction would always
+ * fail and the enclosing retry loop would re-enter the breakpoint.
+ * Reject probes inside such a sequence.
+ *
+ * A constrained LR/SC loop (Zalrsc) is limited to 16 instructions placed
+ * sequentially in memory (64 bytes in the base ISA), so scanning back
+ * that far covers every possible enclosing sequence.
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
+	/* advance to the scan window, keeping instruction alignment */
+	while (tmp < scan_start)
+		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+
+	/* scan the window, tracking whether an LR is still outstanding */
+	while (tmp < addr) {
+		if (GET_INSN_LENGTH(*(u16 *)tmp) == 4) {
+			u32 insn = *(u32 *)tmp;
+
+			if (riscv_insn_is_lr(insn))
+				in_atomic = true;
+			else if (riscv_insn_is_sc(insn))
+				in_atomic = false;
+		}
+		tmp += GET_INSN_LENGTH(*(u16 *)tmp);
+	}
+
+	return in_atomic;
+}
+
 int __kprobes arch_prepare_kprobe(struct kprobe *p)
 {
 	u16 *insn = (u16 *)p->addr;
@@ -79,6 +127,9 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
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
