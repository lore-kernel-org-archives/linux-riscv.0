Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0102C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jFoS1EHJEVohIxWZIzdjrhMff4/KhjS5dPcabEWA5Y=; b=K7/OcrvSgMM9nZ
	HdjGM6toheDFN3T0wfCjL/tOHefpUaKSxtNqbskYujmvYyzKXHSHwvQfuFMGo0pU5MH/AMoZml/tm
	M+BVtfTbHE/tBSLzVJ+X0Y4Gg96p+z4AiDE6AaoVkkZ5lohc6y3b7EXxGdaMKzl+SfKlwBDWtYy+F
	tUKgMgVvILmQbMeLrsuxsO8j63yUnjtdfvUJxe+lL4GFtGlmpQMRQugTcJJ0CbXhL/orV4Lxu5fyA
	7mCe7pqdT4AdcDKsWjpb9hsrnHgeRVkKH9NvR3YgQpUjf+gZRxP/GxCsjvnlNzQyrCP+AoCHy3eF/
	nyjqaQ1wqJ+aNI0WuA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB51-0000000F2By-1bD7;
	Wed, 14 May 2025 12:19:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zq-0000000EhDE-2HrU
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K31BZ+j3XRd8vHo0dCxUnqdgWHJZ/Z7V6F2CPRYuCbE=;
	b=DRvvYk6c/U8XNuYzayAq7PxEtAYweKvWNdyc99uyL2joXAAABOHAdOI3pRm5eOFVFVEgUR
	MBSQGF63KB8eFq01XLppGYCSkBPzzqfCj+cW6DoMORslUFgaGCoun0dZ6MMqp4s2fTCfGi
	lZCbLz9fvn6wBNTCo8nwHe5CHpIqtBhqnzndo3heuQ7DiKYXdXaC/PWgqAKODAodptbU0C
	g/kf5t8cStoeBHG6ACz6Xt69cz0H86uA+sXA97VNFmDztTp39TzoxT+8w+f+HLpWzlftAl
	+Gt4CkXT6orIZ+ShHxBVnoNb9hp7K1SRA+DZpQaLSWVaflO9dCtalG4FghwZlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K31BZ+j3XRd8vHo0dCxUnqdgWHJZ/Z7V6F2CPRYuCbE=;
	b=d38MzEbN7AJxqLXq5RdEhXH154Ne6BMPE07o2CY8WmsywLpE0O7fi9iezjGRtFewNvDqXO
	26244oroFV8C+HAw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
Date: Wed, 14 May 2025 11:38:50 +0200
Message-Id: <8ae34e966c312ae5cf6c09a35ddc290cce942208.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023902_719259_42412CB7 
X-CRM114-Status: UNSURE (   7.41  )
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

Use RV_EXTRACT_ITYPE_IMM, instead of re-implementing it in simulate_jalr().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 2b3cd69d6f8e..fa581590c1f8 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -64,7 +64,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	 */
 	bool ret;
 	unsigned long base_addr;
-	u32 imm = (opcode >> 20) & 0xfff;
+	u32 imm = RV_EXTRACT_ITYPE_IMM(opcode);
 	u32 rd_index = RV_EXTRACT_RD_REG(opcode);
 	u32 rs1_index = RV_EXTRACT_RS1_REG(opcode);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
