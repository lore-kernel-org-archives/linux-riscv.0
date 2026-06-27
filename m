Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB7DC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CaA589pQBMLBq/vQplpLl/tS/UtKvQqCE7n9+ntYU7A=; b=LAr/Med0HaR7oS
	M0SNJmroTUfvGindmkbjKDNzIkH+z17z/vA3DLQxuoP4f4DAkHHr3w93RLhc4FYvawA+JtPxYUsl7
	sWKde5y0FTywfATOuRWSRaMeD77NC1A8Z/N5QOy+0bXXN3pJRDGabrYx9Ts0y5lFCOCddF3MrbUVR
	SH39bsF2rf5/wP/D9j0lMHyYcOW3uuu/j+Te2L1a/3mYuOf83iiESescN2GiQtbaTOb/c4YJY5X0r
	grubdQSmM6cR14RqWtzfc2pjS9p1Wa4NaT/VMq9l+ZEBNazYEs6SPmpfJRtHBhD+XqENIGh1bxWoW
	EiYBfvQcZoIQFSkbdDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSOm-0000000CT0w-16xh;
	Sat, 27 Jun 2026 12:44:40 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSOi-0000000CSze-1WA7
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 12:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=9N
	Pwjzyw//D9hiJ4LlUok61A8B2lmF7uqFK7lKeDoPQ=; b=lC48wW8jbVL680kBcn
	CWD4HwM0xs0TMt0xIT+AB6G+U9Bezyx30hzc0AiOpAsdkv5RN27KGd6kRkt5KP6m
	JG941+Hy4tSU9/cPNKX3f4n2IdmM+0gz7D+CQPmCrvLZD68jYQSc9rw/4RDq2N1C
	PeZa6GFNHlrLzVFwvXh3c5YvM=
Received: from Ubuntu.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA3tZWCxT9qPI8rEA--.42746S2;
	Sat, 27 Jun 2026 20:43:47 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	thecharlesjenkins@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v5] riscv: probes: simulate c.jal instruction
Date: Sat, 27 Jun 2026 12:43:45 +0000
Message-ID: <20260627124345.39726-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgA3tZWCxT9qPI8rEA--.42746S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWrAF1fCryUAr4kXr4fKrg_yoW5uFy5pF
	s8Canrtrs8W3Wkur9xJrn3ur48Kws5K3y3ua1xta1Fgr4agryfXwnaqanxAF4DtrySgryx
	G34YqrykA343JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRqXH_UUUUU=
X-Originating-IP: [39.172.233.103]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAQP7-mo-xYP+2AAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_054436_920628_86750DB1 
X-CRM114-Status: UNSURE (   8.21  )
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

Add simulate_c_jal() which saves the return address to RA and
sets the program counter to the target offset, reusing
simulate_c_j for the common jump logic.

Since c.jal is RV32-only, guard the implementation with

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
#if __riscv_xlen == 32.
---
v4: use regs->ra directly; reorder SET_SIMULATE (per Nam Cao's review)
v5: add #if __riscv_xlen == 32 guard (per Charlie Li's review); removed test case (already provided by Nam Cao)

 arch/riscv/kernel/probes/decode-insn.c   | 4 +++-
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++++++++
 arch/riscv/kernel/probes/simulate-insn.h | 3 +++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bf..9eb7ead60 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -29,12 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
 #ifdef CONFIG_RISCV_ISA_C
-	RISCV_INSN_REJECTED(c_jal,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
 	RISCV_INSN_SET_SIMULATE(c_j,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
+#if __riscv_xlen == 32
+	RISCV_INSN_SET_SIMULATE(c_jal,		insn);
+#endif
 	RISCV_INSN_SET_SIMULATE(c_beqz,		insn);
 	RISCV_INSN_SET_SIMULATE(c_bnez,		insn);
 #endif
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index fa581590c..907598b61 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -163,6 +163,15 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
 	return true;
 }
 
+#if __riscv_xlen == 32
+bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	regs->ra = addr + 2;
+
+	return simulate_c_j(opcode, addr, regs);
+}
+#endif
+
 static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
 					 bool is_jalr)
 {
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 44ebbc444..6b3b510b5 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -25,6 +25,9 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
+#if __riscv_xlen == 32
+bool simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
+#endif
 bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
