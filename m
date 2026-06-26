Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96087CDE008
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3byjTDmBW9L2vX5tHeOmIwu5Hy7s2/ewkuLdW8k8eh4=; b=I5wnQmIB25h1u+
	F5KG/gMjXDOGs2k+kpR2LkSeBcT+B5vHSB8GFfkp1e5EalDlsXu7wcwgl1OXdJXmJZmeEDrMqsSoU
	PVwnimBnWb4Tq6HcKWQJ2PVeANdDPTVc/q4VEr2luFyB4CdJmbUgZUl2jrfekILVrtJNBi88awGAl
	XmoxVB6qJSimexKjGCYXdS70rPqIwz/hnB+ipweB88/nTNmrwKaGoVRKNoF+4ktOwkQf82DVjWqfi
	i+FceJtBRBDL2ddB/kEXVsbWRpcMchuOZKtjxLlyTFvnMXP/55NRsfD64/tfNaxQKI8vGBrpMh9SZ
	YxezXN9SNemEJRo5u2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcuaI-0000000A2lb-2uZ7;
	Fri, 26 Jun 2026 00:38:18 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcuaF-0000000A2ku-3Xrm
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 00:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fh
	MsE8p2jCW4RlLJRbmQMBJQkSynZgS27q7zCiyCi7E=; b=S1DIjrloG4wcapJ/Ck
	S8XF5Hi2d0fEDbQtGcN/nvgGhDFs28m9MRj9uQi8WHVAw+LP4fZiOUa+xXWarR0d
	GvtysxvlojFPmMKvGZ0HAJj8D/rx18fGeRuQy6SQC/a7TGUsyWB4OuAPL993kdvc
	MvnobBdQFcTjIBy/nK7LpJOhU=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCHL9rQyT1qSV_8Fw--.51376S2;
	Fri, 26 Jun 2026 08:37:37 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH] riscv: probes: simulate c.jal instruction
Date: Fri, 26 Jun 2026 00:37:35 +0000
Message-ID: <20260626003735.9066-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wCHL9rQyT1qSV_8Fw--.51376S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5tw15WF1DZFWkJw1DZFb_yoW5Aw13pF
	Z0k3Zxtrs8WF4kCr9xJrs5ur48Kws5K3ya9F4xtayFgr4agryfZwn2ga13AFsxtrySgryx
	G3sIqrykZa43JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRLjjgUUUUU=
X-Originating-IP: [39.144.122.76]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5RGQk2o9ydEw7QAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_173816_444736_11A37378 
X-CRM114-Status: GOOD (  10.13  )
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
and sets the program counter to the target offset, matching
the behavior of c.j (which is already simulated) plus the
link register write that distinguishes c.jal from c.j.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
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
