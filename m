Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B06C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viu4mrBC6DCVDJ6YHi7wQJr5eDWydcK53sd61PYHXAI=; b=lsGGNSIigQlxis
	WWF04t9iEtwc3WMIAr6qTm2ACAteaIkMJwg/tRpCsrxRr2HRzptjB58ispimusRHQHeEoyipWFgyQ
	VYfTbcROvS8bWKViRyrkLuhP/bwWcSvnZCibwJ090qCehqwB3AJp7KJ1Ap0FQIypuVl9Sa9VW78fN
	RSd/cVUWhTQACGtOv96d3yb+qMmoeUAr3wh0cWZhEAcphajUDL2fqPJm2Gf8OT4LVhH+leyjQZcKR
	N8QspK+dru5jOdvxb/8GgMpy5A1JYe1mr16u6NAJfvLbHBrcyWFQrkyLBdYxfqfJoGhkwaAiwttpX
	uRjSj8BYXedFirQyqbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3q-00000007sA2-1naN;
	Sun, 11 May 2025 21:18:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3n-00000007s7e-48ye
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:13 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxxjh0b5jumKoKypnaWi9zZMzSNoHhSBLqb0wOUfsZM=;
	b=mmcyJI9Fd+mOyzbsckx1w2mioDoRsrF0PpkrTiXA1dRBc1zyMH1djc/h3AysVv49tHMDzT
	PaK1pjydlNl1t7xHQkeeoo2vR0nKlZInRO5rD5b33axd07HPRoR9BA+ljCior3p+0kOiWU
	Wcz5RrMe8CrUKFk2sp80jZuj7dnXUTCYd7NIIE5239Mk0EW3mKw8ntMj3O+fu4qkevAx10
	rZx7TLvpfK0Ls7l1yQzHpoDhltfhcwcmpJKUKJSmlj/ByAWlfDSuYgrVneKSoTVIM7knnt
	v1eu5v5GSu6Jd+hCVDDfCfUffuK8bN7oDHnWAJqAKHBTQA2l8s8c95wsjuVs1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cxxjh0b5jumKoKypnaWi9zZMzSNoHhSBLqb0wOUfsZM=;
	b=Pl7w8vkujNyPkohfv2Sf83rZWH+JUDJYZ4cpoMV2OdNODA9n5AWEoHqsC2+kKfzlEmcOFL
	zfhC4y5wi1huzYAw==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 02/11] riscv: kprobes: Move branch_funct3 to insn.h
Date: Sun, 11 May 2025 23:17:54 +0200
Message-Id: <71c57502962d8b2663fd2fb74738374e1ead740d.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141812_162882_D9D03800 
X-CRM114-Status: UNSURE (   8.06  )
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 4 ++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index debac13a3476..80901b36fd22 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -292,6 +292,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
 #define RVC_X(X, s, mask) RV_X(X, s, mask)
 
+#define RV_EXTRACT_FUNCT3(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RV_INSN_FUNCT3_OPOFF, RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPOFF)); })
+
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
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
