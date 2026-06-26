Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15277CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 06:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kVFlC6tVIlD7fpjU/EvoAJNj66uUaYpVP8xlYdhSJOg=; b=lm3S9D7wFOP3xS
	d9lDscGgGVi7MmgNRpAK1gLoJ/UQjOARM3t/dAf2BxO68mbT4EPqoAUhTlPo4Vci9CzxK8ga9ygqY
	4AyFmFFV5yMMWmfIH3toi+SzgUb4TNk3UlLMEGdAgAEOvqJrTd4tPUSgp2ToQRTtCIUkMX0HNrAZ4
	YuDYlI+GeLu3yM+Fg6lfe7uc9iuLMjTiyhky71gNJ4/WHD/vsWQECSHc1y2G1YLZOBhm1zeuMTsz4
	Fu5bWb9nOgepNpFmWmlrJR49rkMMJKpX2b4vwBMmIgSiP/Xsr7O3LKgHVhbRB7bsDsTOKmC4aAcF2
	NgKTSQQd30whZz5GHKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczvI-0000000Aacs-0WDm;
	Fri, 26 Jun 2026 06:20:20 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczvF-0000000AacL-1Eth
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 06:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8p
	1KDQ89NdWumWfJ3UrU24W9R4cOLUaORtj/tnkGZgM=; b=guEAkaz2zyYDOCJ8ZY
	O2taDr9Rl/KtxBRpaZYTqP21B1YoBIjHsJ2OPP+//jwCUKDbbRvrxz7iCmZZGsWs
	4WVMDMQYsCQOoV3ruv08rncj8usA3zi7wr8J2BpcQS8glGElmHeE+AbPdurUHdIs
	KVtX/G83msDz9jGbdRATzfs2k=
Received: from Ubuntu.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgC33VbyGT5qR1ZxDg--.41605S2;
	Fri, 26 Jun 2026 14:19:31 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v2] riscv: probes: simulate c.jal instruction
Date: Fri, 26 Jun 2026 06:19:29 +0000
Message-ID: <20260626061929.54768-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgC33VbyGT5qR1ZxDg--.41605S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5tFWDXryDXF4UXw1rCrg_yoW5Aw1rpF
	s0k3Zxtrs8WFWkCr9xJrs3ur48Kws5K3ya9a1xta1Fgr4agryfZwn2ganxJFsrtrySgryx
	G3sIqrykAa43JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsmitUUUUU=
X-Originating-IP: [39.144.122.76]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5hStsGo+GfSofAAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_232017_848708_6A01E436 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

The c.jal instruction is currently marked REJECTED in kprobes
instruction decoding, but it should be SIMULATED like other
compressed jump instructions.

Add simulate_c_jal() which saves the return address to x1 (ra)
and sets the program counter to the target offset, reusing
simulate_c_j for the common jump logic.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: reuse simulate_c_j() for common jump logic (per Nam Cao's review)

 arch/riscv/kernel/probes/decode-insn.c   |  2 +-
 arch/riscv/kernel/probes/simulate-insn.c | 16 ++++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bf..8506470e9 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -29,7 +29,7 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
 #ifdef CONFIG_RISCV_ISA_C
-	RISCV_INSN_REJECTED(c_jal,		insn);
+	RISCV_INSN_SET_SIMULATE(c_jal,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
 	RISCV_INSN_SET_SIMULATE(c_j,		insn);
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index fa581590c..9bf22b868 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -163,6 +163,22 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
 	return true;
 }
 
+bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	bool ret;
+	s32 imm;
+
+	ret = rv_insn_reg_set_val(regs, 1, addr + 2);
+	if (!ret)
+		return ret;
+
+	imm = RVC_EXTRACT_JTYPE_IMM(opcode);
+
+	instruction_pointer_set(regs, addr + imm);
+
+	return ret;
+}
+
 static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
 					 bool is_jalr)
 {
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 44ebbc444..b89e1bb01 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -25,6 +25,7 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
