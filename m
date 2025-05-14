Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EDBC3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUiiDxx2BuA2U/bYeYiIrQLnD1DsupQpWDSQutEXZZ4=; b=VQfLR0S9hHPo4w
	m2aZ/F5AeYybTPmW1G1SQl1E7aIHp7WkjuL0YhZqAHNhQjHdpptx9jVx6+XgGt66GUIzEXhoV9cIP
	WNA0esWsdtB7WtoM/F9QCNN6bBK6MIHtuj/LBZ1Ed6BavSs9BzC+tYEl3pLKwxmeiKMhDHcJEQaf1
	8NHYk8wvQqvij6bJrEK2TuQRQbyfWMdUxCpyJz/R50AXG7YzhBLSnEM5GT42CncpZX1bkY4vcU3SB
	vjEj9MBoLtzpdaUbLssbuEdJLSiX0vJfjldCEeKalMh2FOoDw3IwoKUOo6BUR9vPuEK5JD9BhRQcS
	cQq0NfpJpBPTT0LoLdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4k-0000000F1m1-0gOU;
	Wed, 14 May 2025 12:19:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zo-0000000EhBQ-07SN
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:01 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu9ObJyfNpp1PZ2rXY3qx0bjof6NU76pzsErYsbGgBo=;
	b=Cab2874fldAN3ra0e1pMc6uH6YhYOkMAwYo3z/w2R7k0yplAtAXUAhc4YNrXPeNZoWCdLX
	c6jmzzsfirM6B3JYyTGZ/FFoj6mEsr1NBtksf/c6UlQ6A555CEB7P0FLMTrepais4ab5ne
	QD3zkkzV8pCP1Z0DbxvF3tMzIFxXS0ktb1EDDAjp7fSkM2H4Jr6pYh+errNwMjrtcDy+ZE
	aL6WqarJ4PRZBDfJhCmzQtbnHNQp8blqUujp2kU0ZJD1CZVmfjd60CIupWxnPDAktMV3O5
	UEd4rDGA7xYVW7JGfZYu5oYI2EyQ+ZamCr9el4ijL15kGK7U41sW7bync4oNlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yu9ObJyfNpp1PZ2rXY3qx0bjof6NU76pzsErYsbGgBo=;
	b=k6wzvEbyUSNIta1mdsVubFmN6ByhJLT6afy2aP4N7pZC4OgPjMw3BoN9QYDvmgBNtAvDAk
	ymX7B3MGb46v0ZDw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
Date: Wed, 14 May 2025 11:38:43 +0200
Message-Id: <b441038c991da11a7a48ea7140ab00e3bb119387.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023900_202680_488E0F2B 
X-CRM114-Status: UNSURE (   6.52  )
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

Use RV_EXTRACT_RS1_REG instead of reimplementing its code.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index b76a691d0d9a..625d514c4ada 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -66,7 +66,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	unsigned long base_addr;
 	u32 imm = (opcode >> 20) & 0xfff;
 	u32 rd_index = (opcode >> 7) & 0x1f;
-	u32 rs1_index = (opcode >> 15) & 0x1f;
+	u32 rs1_index = RV_EXTRACT_RS1_REG(opcode);
 
 	ret = rv_insn_reg_get_val(regs, rs1_index, &base_addr);
 	if (!ret)
@@ -115,9 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 	return true;
 }
 
-#define branch_rs1_idx(opcode) \
-	(((opcode) >> 15) & 0x1f)
-
 #define branch_imm(opcode) \
 	(((((opcode) >>  8) & 0xf ) <<  1) | \
 	 ((((opcode) >> 25) & 0x3f) <<  5) | \
@@ -147,7 +144,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 	unsigned long rs1_val;
 	unsigned long rs2_val;
 
-	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
+	if (!rv_insn_reg_get_val(regs, RV_EXTRACT_RS1_REG(opcode), &rs1_val) ||
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
