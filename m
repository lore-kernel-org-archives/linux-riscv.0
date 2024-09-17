Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1A2C35FFF
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bFmrixWolhXRnMCcF/McilxdYudWBhc6DO8vEPRZjGo=; b=Vl/Y8wtHgdXtAF
	RrzZLtR4R4ROuBFrNghdZ5e88EKJfuIGfpytjsF188Qz9t8vjyQKvfngEB5JjIXaS70p2X2K3CHHq
	2Zttqeaxqoa9BrL0mu4WaUzj7tyitm7PC38VPXv18HQo2Sc9gvEDZoBlAM6UX1KHE53w6zVfYp3Fz
	5PvyBf0oSymVfRXFqmhqP5ExuxIQFLCPm09QIGwStH8veQE1HtSfSke3wWzz4UAPYvgL0aavPGxlM
	Oid9wgArG0EGxCgsYQ3or9J4Moz9zcs5V8s5utr2FfCKz/xlfXkRPQpq6ue08T+iIy5M5AejEvBEj
	nZ+obWhfg5YASpRtoZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYUw-00000006Fjc-0tFK;
	Tue, 17 Sep 2024 13:44:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYUv-00000006FjD-15Ff
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Sep 2024 13:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vPT1/BO+U9Phv5a4Mw+G6VxVGbtaN7AKxVNuXrAVhRI=; b=KldsTzIdyNgzlL6BI8GkWzD2JM
	gjWonhomDyuEFRgGnHlRcsZPZ+vkYTs324LWfcH6GSTD3pQ9RIXwVufqkl93EJdKqdi8ktlCjvxZ8
	GJk4OJF+XrA/sW93vgOcqCm2NYJA35vCrgEq9duyxfBroEf6/TavBBEp30alMnZbbFWPr2U87tEsl
	VTV8yDGjC4plUQ7N2VK6uT3yIN7tOUPe6NP1M1MpCUv7nabZuf1HfhMIrlkKohU2DzVOktv58lylx
	f75THXW6S0F2M4vz2M1S/+uncb4RU6rxPOtLCWWc6B8WWzhVRFAKcdaMu4Sxyhf6X6co48yyClPwg
	e9zz6cnQ==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqYUr-00000003CDA-1RIw
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vPT1/BO+U9Phv5a4Mw+G6VxVGbtaN7AKxVNuXrAVhRI=; b=cO9PkAkTgHhCseu84EvUpDu4Sh
	HUcTYeSfDshELiR/LnkopNz36MH4w7NAc6EPNZuktjEi4ctH021XTWbj1QpLHT6t0Ey6WVpK3AH9l
	4irjcf2cOAB/9dBukzr4NCxSSxW5y8xdtjXWVN8Z/QRYqj13wOfEPw/LDGHgGEdAKB6eTAcBcb0cp
	vUhdCOWjdNtjW0HSi8cWCyhAnrOqYNjZgTHJKkJ9qJQOxcmehAvxYUnWlP9tCFUt5d2WRxtq8wNZo
	ErFVUC3w1/6LuYik9vR+N7yZj4DWdF1QQ32A6B59hUIAerAqI2jdg47KYuxVMIyhDRedtg4tMNeoW
	ZXqpFSug==;
Received: from [83.68.141.146] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sqXws-00BR17-JL; Tue, 17 Sep 2024 14:08:54 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1sqXws-000000004rV-0lGX;
	Tue, 17 Sep 2024 14:08:54 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 3/3] riscv: add trap and emulation for RDCYCLE
Date: Tue, 17 Sep 2024 14:08:53 +0100
Message-Id: <20240917130853.18657-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
References: <20240917130853.18657-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_144402_181664_4AC346B9 
X-CRM114-Status: GOOD (  11.25  )
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

Add a trap for RDCYCLE and emulate it as RDTIME instruciton.

This is an initial PoC and should probably be made more generic
way of trapping and dealing with bad instructions

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/traps.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 1c3fab272fd1..51ea28ebf54d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -167,6 +167,35 @@ DO_ERROR_INFO(do_trap_insn_misaligned,
 DO_ERROR_INFO(do_trap_insn_fault,
 	SIGSEGV, SEGV_ACCERR, "instruction access fault");
 
+#define is_system(__i) (((__i) & 0x7f) == RVG_OPCODE_SYSTEM)
+
+static bool riscv_try_csr_fixup_user(struct pt_regs *regs, u32 insn)
+{
+	/* expecting a 4 byte CSR instruction (*/
+	if (unlikely(GET_INSN_LENGTH(insn) != 4))
+		return false;
+
+	if (is_system(insn)) {
+		u32 csr = insn >> RVG_SYSTEM_CSR_OFF;
+		u32 rd = (insn >> RVG_RD_OPOFF) & RVG_RD_MASK;
+		u32 rs = (insn >> RVG_RS1_OPOFF) & RVG_RS1_MASK;
+		u32 funct3 = (insn >> RV_INSN_FUNCT3_OPOFF) & 0x7;
+
+		if (rs == 0 && funct3 == 2 && csr == CSR_CYCLE) {
+			u64 val = csr_read(CSR_TIME);
+			/* we've got a RDCCLYE, emulated it with CSR_TIME */
+
+			printk_ratelimited("PID %d: process using RDCYCLE, emulating with RDTIME\n", current->pid);
+
+			regs_set_register(regs, rd*sizeof(unsigned long), val);
+			regs->epc += 4;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
 	bool handled;
@@ -186,6 +215,8 @@ asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *re
 		}
 
 		handled = riscv_v_first_use_handler(regs, insn);
+		if (!handle)
+			handled = riscv_try_csr_fixup_user(regs, insn);
 
 		local_irq_disable();
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
