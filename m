Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B15C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sf+up4wlumpaCUD1RG5rlDBrezUMZtDwXQNfqBEh2Go=; b=riwzwDa05EAeqc
	5eCPnCttdCUMoQNxPN17YORewLzEyhv7tth+hnAg093u59Os4Yhp31jwzD2bvuJACsL4nLam9ICRq
	NhUAiKaqsq060m6KmndrQUqKWQI6Y0NBRnQg6/ryncdPwtQbpxdGVmIgav9JC6dpObqoTQV4XRpuI
	5+/p9mqO/Ks0tS4tgHhX06/+ODdwLw098pNnxt8ESxFB5p+RhdshT9Ykks0wn75a2IQmJZc+rg5GU
	DMx1hqQ1ridOXvd8w6UsGtG+rV9/7lwegvAFzohERlog0qsd4biTSSbMX4KiLNTZQksqyIszQ/C34
	e4m8kWahixl+AkMA0ECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdJc-00000009Uvb-2oOn;
	Wed, 19 Aug 2026 10:14:36 +0000
Received: from azure-sdnproxy.icoremail.net ([13.75.44.102])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdJY-00000009Ut9-3Cv4
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 10:14:34 +0000
Received: from E0002472LT.eswin.cn (unknown [10.12.96.78])
	by app2 (Coremail) with SMTP id TQJkCgDX3Zv7gYVqyyRMAA--.32000S3;
	Wed, 19 Aug 2026 18:14:22 +0800 (CST)
From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Nam Cao <namcaov@gmail.com>,
	linux-riscv@lists.infradead.org,
	yuanxiaofeng@eswincomputing.com
Subject: [PATCH 1/2] riscv: kprobes: simulate nop and c.nop instructions
Date: Wed, 19 Aug 2026 18:14:18 +0800
Message-Id: <20260819101419.1367-2-yuanxiaofeng@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260819101419.1367-1-yuanxiaofeng@eswincomputing.com>
References: <20260819101419.1367-1-yuanxiaofeng@eswincomputing.com>
MIME-Version: 1.0
X-CM-TRANSID: TQJkCgDX3Zv7gYVqyyRMAA--.32000S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4rury3Xr4xZw4fZFW3trb_yoWrCFWkpa
	n0k3sxGrZ5WFs7Cr9xArs8ur4rJws5Kw4aka12ga1rKw42gryrJ3saga13Ar1kJFWFqryx
	K34YvrykC343A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CM-SenderInfo: h1xd05xldrwv1qj6v25zlqu0xpsx3x1qjou0bp/1tbiAgEEE2qEiaAYqAACsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031432_963544_2ECBA884 
X-CRM114-Status: GOOD (  10.79  )
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
