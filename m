Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A7C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQcFVeO648slsoONqZo9PmI/VID7H0OOUXYsEkkYQlk=; b=Hbeo7F3N1myJlu
	4t80Nghphi3N6ze2VMix+WSLyMjbM+LHRCDexvvE6cqX8GTijAI1CztScCw3PtA39sUpoCC57jB74
	iILXxFOSs4QW0Ukb/VzLxRUaQibnKbZ+LRIxZpbo3FrqycSXN6i+QoGAazW0IADoOKAceEY5pvD+B
	D3qPSVzlgRj/I/D86y3oS3hRpoEQkri7Ava9N21QyIAUs4+wC0SyhQT9EU2/s/T4sO7RMpZHB/iid
	OZIrzP4nx5s9a8lkE7IDOXZWXlcmd/W756ts0OmyQrUodBzt7g3oAQQ8H7MCIcf8bC2y4cVRf8bb4
	r0D1SRI6YkEWlw3IoQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4l-0000000F1p4-30wq;
	Wed, 14 May 2025 12:19:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zo-0000000EhBr-3qc6
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:02 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bm9s++xQZUZyxfYID6OTBZXCHHY8y7W2MffQViKq4mg=;
	b=paBgdSFYfK7Y9o9pL9dp6Lh+/FJqZUM+RY14bCqNjjf7Hyp6GlHcgLkD6W8UX69OE3Xchk
	+u0D5op0cT2KyDmfbyW+ttQ+5KM6KcHPnvVsSEv6WBJTZ+DVtRYeJVGgnBfGV8Rk0b3Mh1
	RrTWRdid8lNaSN3dqCNl2ZSO0PO1mjW9xTFIqcomzUfWCae7rYJqcrba//aVukyzDULRLG
	2kbWHTzC5VBjBZFvkdgHkzahC6LAT8nNu6l5tDrhPJwaoQlzqZlpu/ZOGtyaM99sYWqa6r
	GxVMfxFIirq5ELM9bbbWaLYxFgG2ONltn+Fu5psObrRMM60uYWifEQ1sR80vPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bm9s++xQZUZyxfYID6OTBZXCHHY8y7W2MffQViKq4mg=;
	b=brfBO61tAlr4TWR74+1t9HuFTaJnEhHy1EBa5WqxKMd4KVw4DeJbWwqNDs/MidtnwxvetA
	zIV+mc39//S3PzDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
Date: Wed, 14 May 2025 11:38:44 +0200
Message-Id: <07dde8313b787261f07ae25240c97c514cd02d11.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023901_091158_E150373C 
X-CRM114-Status: UNSURE (   6.14  )
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

Use RV_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_branch().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 625d514c4ada..3ba97e79a2a3 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -115,15 +115,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 	return true;
 }
 
-#define branch_imm(opcode) \
-	(((((opcode) >>  8) & 0xf ) <<  1) | \
-	 ((((opcode) >> 25) & 0x3f) <<  5) | \
-	 ((((opcode) >>  7) & 0x1 ) << 11) | \
-	 ((((opcode) >> 31) & 0x1 ) << 12))
-
-#define branch_offset(opcode) \
-	sign_extend32((branch_imm(opcode)), 12)
-
 bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
 	/*
@@ -148,7 +139,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
 
-	offset_tmp = branch_offset(opcode);
+	offset_tmp = RV_EXTRACT_BTYPE_IMM(opcode);
 	switch (RV_EXTRACT_FUNCT3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
