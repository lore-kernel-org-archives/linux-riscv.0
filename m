Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A38CD4F26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NSS4NGMGiRrG7BitxyhSTIBiVLEMBfhT4aTFej4LcTc=; b=Tkyxcov4lXYcCQ
	hAPMJy2kLYvVMqPKucdzo6Zx5jHcEkGxeDut/lgUlwAp6Q9ceoMBEDnEeYiPQOIkBt4wqE+p6Bl+1
	QgEWpg4UI9pqUydfpxq7VyEPipoHU/NpZb63P0vNbhxxoyKRo8xasZ3pYGumb5IwNr1ryshnZqNKd
	Cy6s9b5Zsd2bRZtrCKxFBw2FAApEadUbNSWKEWrm2jU9rCUYY9ZplE+ysOmaX6zohu4nsTLlNYY3y
	n9EzW6UH3HwVFi5CS3v+7ilW0uNGRWsaVAzOuv3Ntu6MeDUxGWC8fyXp1SXqNK8oFz6nOPcCpUM2F
	m8mwQGNdT2IQNHZGs88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczy5-0000000AawP-2Ske;
	Fri, 26 Jun 2026 06:23:13 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczy2-0000000Aavv-402r
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 06:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=yV
	A60Gi+Hb8I9CMBlciW8Y2F1ZaKORfpN4/wVcmh+wk=; b=arbBpPA0mfVgli/iU5
	7bvMnrzMH8/68VWXiG9nFt6tcE32zuWEe20ZMAss+7WASKN7MnQiSzO7OheA+2yV
	20Lwjt1EEHnl2z60MG/A6prhJlVuet2+8MZb4GMZCs9wi1CeIIBq5u5JdJW6ncVE
	RTJtLWXxL6J92gI5TxYXyetDo=
Received: from Ubuntu.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCnDy2mGj5qJK5xDg--.41368S2;
	Fri, 26 Jun 2026 14:22:31 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	namcao@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH v3] riscv: probes: simulate c.jal instruction
Date: Fri, 26 Jun 2026 06:22:28 +0000
Message-ID: <20260626062228.54873-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCnDy2mGj5qJK5xDg--.41368S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFW5tFWDXryDXF4UXw1rCrg_yoW5Ary5pF
	s0k3Zxtrs8uFWkCr9xJrs3ur48Kws5K3ya9a18ta1Fgr1agryfZwn2ganxAFsrtrySgr97
	G39IqrykA343JrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR3EfUUUUUU=
X-Originating-IP: [39.144.122.76]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5QfZ3Go+GqepDwAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_232311_333116_AF9DAF96 
X-CRM114-Status: UNSURE (   8.29  )
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
v2: reuse simulate_c_j() for common jump logic (per Nam Cao's review) (resend: v2 had wrong diff)

 arch/riscv/kernel/probes/decode-insn.c   | 2 +-
 arch/riscv/kernel/probes/simulate-insn.c | 8 ++++++++
 arch/riscv/kernel/probes/simulate-insn.h | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

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
index fa581590c..6d7a5f949 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -163,6 +163,14 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
 	return true;
 }
 
+bool __kprobes simulate_c_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	if (!rv_insn_reg_set_val(regs, 1, addr + 2))
+		return false;
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
