Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A76C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGc/7VClPsE+ljGwKvuYleZQEHliSfa2faU7Ye6petw=; b=Mi9szc4nGR9Q5U
	54K+pPdC1qCpAWIvJhahZhwwuqS98kpXBXHwTdM5L3OwML2RUE7YzNejAzwPAwjbn46FCj9IyoeHa
	ERYWkTWsh4UMWqKQ3eAWbadzDCP23+OWZ46mswsdGnqLmWlwu7xPyqaTr3evEdniIsN8jRjspXoeg
	VUAsJmpRVgutfV3OvnaNAMPSlTpIZBR0Vb/GiKzjVVGfOXEkb5E4zdINgcrWNGscRzzIUzREAUyQZ
	CMVtG5Htjnt8UEDJvgzXGFWsX5qPb+oXSGTMu3oCW6d5Ej9Knyq7qgi8UbZ3ncD+F8LbYUHxV4Ak4
	KgTM0leKsMn9/k6angDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2Y-00000000zgY-2kG3;
	Wed, 01 Jul 2026 08:11:26 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weq2U-00000000zey-0pJS
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 08:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=85
	WdK5a0G3ftqPEwXololIbO2+LxNvhlBoJUoxbyghk=; b=gfbxho+iXxFhoVVxGm
	7ndkwX7JnUoLBNEGS/Y25+xx5mF/bxjdrm2q0wnE3kQMv6X92YM0hBQqf3DrMDCL
	XTYcDDJHtJDHcV73Gve1k3MGRm+ET9b+nwEcztChd9gFcdvJUpJ8uybQPXpDvrP9
	YC6YbY2aTIQp4myhaIFKfnrvA=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHa+Z5y0Rqn4gyFA--.16458S3;
	Wed, 01 Jul 2026 16:10:35 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v6 1/2] riscv: probes: simulate c.jal instruction
Date: Wed,  1 Jul 2026 08:10:32 +0000
Message-ID: <20260701081033.49871-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701081033.49871-1-xiaofengmian@163.com>
References: <20260701081033.49871-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBHa+Z5y0Rqn4gyFA--.16458S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWruF47Xw17tF1fZFyfXrb_yoW5ZrW5pF
	s0k3Zxtrs8uF4kCr9xJrn3ur48Kws5K3ya9a1xta1Fgw4agryfZwn2qanxJFsrtrySgryx
	G3s0qrykA3y3A37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piF4EtUUUUU=
X-Originating-IP: [39.144.122.37]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5Ru8v2pEy3vHkwAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_011122_563293_18D9EEA8 
X-CRM114-Status: GOOD (  10.98  )
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

Although c.jal is RV32-only, the function compiles unconditionally.
On RV64, riscv_insn_is_c_jal() always returns 0, so the simulation
code is never invoked and the small overhead in kernel size is
acceptable.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
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
