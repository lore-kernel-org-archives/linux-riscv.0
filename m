Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713E2C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1zzwx5lFb4zCBAA/SZyxcsNzdYJTeHHaAOORqmZlFE=; b=l8mUQL1F/VU7qY
	CLZx0+zzU1cHkphdVFmiwxRFh9E+BPNoMa1ihRDiuhnGpyKPFEk9U91Cb2CTPtIiaci8VzvBaZrAr
	Dz21HSKYtbZEHkuKzBcKRjoOWRKEHpZjUcscYyr8mInrqjnIf5bZiHbgJNr3g4rS/rCcG1L04psJb
	dKNDrxB5rv00ESOFPCLurq2C83elOOcbzGR32Anc8rj80M0ir7LlDUogtEKhZvlkcQ+QwcpOdRein
	x/Frza4R57rsPRYYYetumjc1NHzGxXRNhUE80udD+9m2UXM2KQu5XvP1NlkcRKueCfqPQDeIHlaWV
	bd3d8d2Dl/ez0vWoEzLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4V-0000000F1Sc-32mO;
	Wed, 14 May 2025 12:18:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zm-0000000EhAe-2Bzs
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:38:59 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmkEGbAndeVtTbYn7tYJisQDekeRo3+P4y3HvGXWKIM=;
	b=oEsrci97PKBvmdtdmHuqf7heP96ZSnfAv/FhNq1ZSZ2osSholKRJ8B67leodBEv54EP68f
	BmXPWDhMs6q8tsxFsdp8WQCqkYsqYXnQMrTEXjnGMyixJ7kOCVSW28fFHdCH1TOFjaGw3g
	EHE1/F/MskzjUlf+A/14eV5gY0bvk+37yRtG6r69mt+h1ry6IY9epMmyvKWkZkm5D58CpG
	WIGqAKasps2aPe8I6N4MqCgDmegA2NxysGtaeg+lKRUFMG25ZAUHv+VKh36oFcjgDubwWc
	ubW2J0fhDN2fGqdytLHnTUL2M9zcSLIjHWJfnLBMXgeIritrmluIrWwu7ROJbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DmkEGbAndeVtTbYn7tYJisQDekeRo3+P4y3HvGXWKIM=;
	b=H6se27k+mkC0UIQE18mLREaCc8vwNjoFyKRTm+Xxq25ozHqVReL/PM+l6y23QlAm+S4Kd/
	JFWvwQErrw9+kCBg==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 02/11] riscv: kprobes: Move branch_funct3 to insn.h
Date: Wed, 14 May 2025 11:38:41 +0200
Message-Id: <200c29a26338f19d09963fa02562787e8cfa06f2.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023858_701570_1353E9AB 
X-CRM114-Status: UNSURE (   8.56  )
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

Similar to other instruction-processing macros/functions, branch_funct3
should be in insn.h.

Move it into insn.h as RV_EXTRACT_FUNCT3. This new name matches the style
in insn.h.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 4 ++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 4a26cef3b5c0..ca9628c61885 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -447,6 +447,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 #define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
 #define RVC_X(X, s, mask)	RV_X_mask(X, s, mask)
 
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X_mask(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPOFF)); })
+
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 77be381bb8b4..d5f74fadbc3a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 #define branch_rs1_idx(opcode) \
 	(((opcode) >> 15) & 0x1f)
 
-#define branch_funct3(opcode) \
-	(((opcode) >> 12) & 0x7)
-
 #define branch_imm(opcode) \
 	(((((opcode) >>  8) & 0xf ) <<  1) | \
 	 ((((opcode) >> 25) & 0x3f) <<  5) | \
@@ -158,7 +155,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 		return false;
 
 	offset_tmp = branch_offset(opcode);
-	switch (branch_funct3(opcode)) {
+	switch (RV_EXTRACT_FUNCT3(opcode)) {
 	case RVG_FUNCT3_BEQ:
 		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
 		break;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
