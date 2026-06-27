Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF2BC43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 00:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZ+VstixXjWDW2+M3zz+tPHJCPkis0uKtqDu3uaPca4=; b=DtwudLGuJxeV9v
	K1L9O0n9Jv5pUVrVbcNMEJepM9K5g3oP9jpTM1PHjY+6njm0r9lujbYA7yM0WFkecilFWzs1n0RsZ
	Z2xXC0jA3+jb7VYkKPZgg3MUMRf0YZqv/PU7WXlb0oQroiQjNO1sdIYsVhcTXMal/WkOaDt5+WCFn
	XXfYrOdXuK5Ap8LM4orrb6q9dNuwzN1oVjkFnhl2MNstWrEKR3jpceKU0ll4WuXVq/bcgeZfjPFSM
	pbhiU1Ab+camdjnV2XgODPba9KtfnTn4Uv1ojgLCDuj0JwQMsQEcpqzzHsMmamwVo/HynEI4Vtubg
	k5/hiA9+/krowapsprFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdGmk-0000000C1be-0Xlx;
	Sat, 27 Jun 2026 00:20:38 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdGmf-0000000C1ax-0abZ
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jun 2026 00:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Tn
	A4ihTrDROD54RVB9mH38VT+Ri0iYlMKaJEV3IHp6U=; b=PgE3rZjc8fyl1dgCZs
	3EvP5M0nhbbPRCA137AKJ/gCBd2zWXKUFZ8utqO5OFSfEfKHoy2/6+yUprOzkWfL
	UzXXDjxDzbsMwDRcHcqwdkCNIFT2KlnfuuMx+WLqOal6Hj2YXug71NuPEwTy/FvK
	8lXavFdkKfEAGvw1BIxE/vT1c=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wA3nZYbFz9q1ZEhGA--.37801S2;
	Sat, 27 Jun 2026 08:19:40 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v4] riscv: probes: simulate c.jal instruction
Date: Sat, 27 Jun 2026 00:19:39 +0000
Message-ID: <20260627001939.3847-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wA3nZYbFz9q1ZEhGA--.37801S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5XF1fKF4rKr4fZr47Jwb_yoW5CF4xpF
	Z0k3Zrtrs8uF4kCr9xJrn3ur48Gws5K39I9a1xta1rKr1agryfXwn2ganxJFsrtrySgryx
	Gas0qrykA343JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRsqX9UUUUU=
X-Originating-IP: [39.172.233.103]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAh03Omo-Fx1ROgAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_172033_740372_E2F02F2A 
X-CRM114-Status: UNSURE (   8.13  )
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

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v3: fixed diff (v2 had wrong diff)
v4: use regs->ra directly; move SET_SIMULATE to group with others (per Nam Cao's review)

 arch/riscv/kernel/probes/decode-insn.c   | 2 +-
 arch/riscv/kernel/probes/simulate-insn.c | 7 +++++++
 arch/riscv/kernel/probes/simulate-insn.h | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bf..433d9035b 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -29,12 +29,12 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
 #ifdef CONFIG_RISCV_ISA_C
-	RISCV_INSN_REJECTED(c_jal,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
 	RISCV_INSN_SET_SIMULATE(c_j,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
+	RISCV_INSN_SET_SIMULATE(c_jal,		insn);
 	RISCV_INSN_SET_SIMULATE(c_beqz,		insn);
 	RISCV_INSN_SET_SIMULATE(c_bnez,		insn);
 #endif
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index fa581590c..f8a2f6857 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -163,6 +163,13 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
 	return true;
 }
 
+bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	regs->ra = addr + 2;
+
+	return simulate_c_j(opcode, addr, regs);
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
