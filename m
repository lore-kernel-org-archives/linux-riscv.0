Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41DDC3ABD2
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V91KUPkU52Mp27SXCXw0ZEWmCTQFNmKkJuT1LGchbjY=; b=jFCzX0s7XHx5R2
	gU9QqwfoXII8oFrv94+UoKiiZlODbrwBvnqa4aUNYU2UPoFzFFR9QlpjKLFKFpr3P5pVk/Mu9dkw8
	U7yoaYIJhPs+8UyeQ/etzbcsBx1W560jESX8LEOfEmFRoZvM2bzZQxlgFyZMyJfs1xyimhHzxW37z
	idz/2ge12BgAqWTUfEDUKphHSVIYUz95etxUPkRA9nhBXtsjIFWliUbXHPy8Mf7VnnUvMeowPXPIe
	NjyS2+B6EMeIQw2nJd2jbEdFlKOZsCdeRrt8AA2a6P5CcdwV0tx7IOXfjJ1lkUaV8N7w2FNSKS1MZ
	1nChQ6VZFHNoeNslsP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3v-00000007sFQ-250P;
	Sun, 11 May 2025 21:18:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3p-00000007s8d-1Nng
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuh4owOv0RzlQSco6IKhRzdD1qqjlGpYcTbO1rvk8z0=;
	b=gKj7ol7G2ufttDRdEfBOlzR3Rgz1xvGVIjLBseZ8MKCYDjyL29s3FhWiq5ZyWEU8q9QpOg
	Y+PPVAI7xdcATY6Y2kW8eviGXhW18HY45XTqPQ5gQaL6bcAvo/jn4JghhBtBZih6ibRg2s
	fCAPTQuNypEHo4lia8iI1tdWBc+eAmH+l2cwYmx3UMallu16o8AJQZPWAZ2fKNjzvV7oy6
	d7zZvgCcDiz8MjuLkoZRL/+CwEhOC7daHUJyvR8DjSPDKLW8Z7PWOY/d5goHB2LHo1iyJB
	lXCpy1++IesTGCOOu39OaPD7GW7aWtA4fmOEFqkawGvzqAoX35jKL7n5jLz3Cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kuh4owOv0RzlQSco6IKhRzdD1qqjlGpYcTbO1rvk8z0=;
	b=5BgFKKgsItCzaNlFc0kSoIIaSJmfKjK/9eYHN8xJmdDWDIkWrrKfDCtkvb5A+j1yMGPp8W
	cuhkpD6qJgoMxeBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 05/11] riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
Date: Sun, 11 May 2025 23:17:57 +0200
Message-Id: <1510a1a9674e84c9ba9a5a57e21d0f2aed3a3f48.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141813_523027_3CC67920 
X-CRM114-Status: UNSURE (   5.96  )
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
