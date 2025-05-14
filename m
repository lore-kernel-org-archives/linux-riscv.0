Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE181C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ9xvLrUyUCe+5jGgPjgiOPjgz755ofijAnvVpX9FNc=; b=okprwoqAtz0Obl
	/Wm7bk5+IlP777UPPci19+xekb4rj3hRYRuSc6FKiZ1obGQz9pMSKp81J2d8GaOdrfJ3bL9wA6v2I
	5BpihgfFbbXAgaGxLRPN2zgy0bSnrVcZjpunwx7Ip7tEUoVjnBPKSdD1xKsASFL9MaY9QAXoIzqV/
	Sq/4r5X9jBHCXYavdMOFF8gdsXnb5JU68frkHH6Y/JAOLu2XcOXJ4PDxjQm4BhMPwCBF2sN1Hiy1m
	xkDeaTBE4v0sMMs8ZG7lSFbBEV6/QmuQpez70KCwczCwIVY+ILSxjGaSXRX2CzevLshGEDPEInHHx
	nul1kKJdKiIixa6dVRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4s-0000000F1zO-12L6;
	Wed, 14 May 2025 12:19:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zp-0000000EhCJ-3v7D
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDp33p40Fs1LitBtjBZir0UwSJ9OxuzJPP9MYbv6Fc8=;
	b=LkcgnH8cWHAmLFA4pMJkssj8pMMZACHqx4p5AjiUS9IiINzmH8+09AS29UnKZRbq8iimyf
	oLDu32l7xViCJAkc60RGG1AGbO9ZHNO1n/81dDv+zyG27Q+PBFQg/gMN8/yMgxw366JvKc
	xxOEImHJBw5E5upnU4Qss6zpAlwQE6lLmSU7HDaa3Zbq3u8F63b3B27Zf0DcYv69ayzpf3
	TR+jkjUF5xYJacdAtdNnlhoPcwa+AE891+ObrkmY7jJlTFmpG2qHpsMFghnVvROTKU+Qvm
	tW/VJ9whm2/0nKS+Z4zd5mv/rgv3TFrhkKivi98FM+zHbdSBrvPNf/+tqm7TCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDp33p40Fs1LitBtjBZir0UwSJ9OxuzJPP9MYbv6Fc8=;
	b=rXSEls3Ngno0szaoJwN4237PfBnnJgQ6yeAC/E36Vrahzxi+Wfsg2+hMkDXSqHjx4CT2RC
	sTsJhDPy3O+VVNDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
Date: Wed, 14 May 2025 11:38:48 +0200
Message-Id: <b31e5b41df5839a76103348e54dc034c8a43447a.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023902_114788_4E7083F5 
X-CRM114-Status: UNSURE (   6.61  )
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

Use RV_EXTRACT_RD_REG, instead of reimplementing its code.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index e670e55954d2..1717df780409 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -42,7 +42,7 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs
 	 */
 	bool ret;
 	s32 imm;
-	u32 index = (opcode >> 7) & 0x1f;
+	u32 index = RV_EXTRACT_RD_REG(opcode);
 
 	ret = rv_insn_reg_set_val(regs, index, addr + 4);
 	if (!ret)
@@ -65,7 +65,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	bool ret;
 	unsigned long base_addr;
 	u32 imm = (opcode >> 20) & 0xfff;
-	u32 rd_index = (opcode >> 7) & 0x1f;
+	u32 rd_index = RV_EXTRACT_RD_REG(opcode);
 	u32 rs1_index = RV_EXTRACT_RS1_REG(opcode);
 
 	ret = rv_insn_reg_get_val(regs, rs1_index, &base_addr);
@@ -81,9 +81,6 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	return ret;
 }
 
-#define auipc_rd_idx(opcode) \
-	((opcode >> 7) & 0x1f)
-
 #define auipc_imm(opcode) \
 	((((opcode) >> 12) & 0xfffff) << 12)
 
@@ -104,7 +101,7 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 	 *        20       5     7
 	 */
 
-	u32 rd_idx = auipc_rd_idx(opcode);
+	u32 rd_idx = RV_EXTRACT_RD_REG(opcode);
 	unsigned long rd_val = addr + auipc_offset(opcode);
 
 	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
