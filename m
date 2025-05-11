Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF6BC3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNNPMlrB9cmQlIbbjomyGLv27BTzJYvoCoTY0r/guLE=; b=VLr6+3GL/VO5uh
	a4Rc6ROIibSmXOVEFFqfSQsGJGqJRrtgF0TYUyHffEQVTEYI9N+z1W1ro0jsuGQ7Bt3r/jXI/2du5
	cctsRFrWph2q0V91xSHZ1oKLANFVLh5oUiqIZ8awHjNRbJpvgD1ViDri9dex2pXWMoCd+gqvarMfv
	4PDBmze/Pjne5rrlQx2tYeXwM5Y2w3DIspdHe1G0W9Wq9/4HVpJoptM1VAifcvSkXjc1zvQP2ffqk
	uAA3tz91x0A3Fok135OEA864grYSBqGIBT+dXdskqAlw3TmoAjlhVdHCJ7W3Jq+dcFmVGItbtPwGB
	+BuywLtm0wbrY2oHp13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3t-00000007sDN-1A1X;
	Sun, 11 May 2025 21:18:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3o-00000007s7d-0Ru9
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwAuKW9kYlwuhZ5fc51sK5eAF9d1ZLTlSnKrLdUvZZk=;
	b=LVjSERZIAXGi22PyvdSZ4AXHI3XMv7ggJRB2peVblR9jQ1xAMGR752ODWGl1DkIseOHZke
	1DmjgWIITxKkjtOUc+21cTY9nlTU1YXpHYvjeBJBmZohCwfY2pgTwitBcwNss0WBkfZvbI
	maV6N7U1dRuaBW0g9gxv3lZz1Y6e5FZtAwLqpI/6r5/thQLh1q1jFpdTRbop8E5/6vs8jz
	7T4g/2A2x/reCHXOgWP+iZz9z2YA0BRcJqmp061s+VSIvTYX2+zyBY+5nd29T6p9coqRiP
	3ev+MQqT1IgkY/vfRpWOSFxgdS0SikmH75qNGcTBtJoR+/m73oF1P9n2iny3jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bwAuKW9kYlwuhZ5fc51sK5eAF9d1ZLTlSnKrLdUvZZk=;
	b=X6YpUcismhvYvjjnS46wn+ipr1NoAFmJQmte/QBn4TYKLoWWOX/I47cAm9Z2ka2mwX5zVf
	/FKEZDpSjaB8ZJBQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Date: Sun, 11 May 2025 23:17:53 +0200
Message-Id: <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141812_300281_0587B54A 
X-CRM114-Status: UNSURE (   8.63  )
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

Similar to other instruction-processing macros/functions, branch_rs2_idx
should be in insn.h.

Move it into insn.h as RV_EXTRACT_RS2_REG. This new name matches the style
in insn.h.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/insn.h            | 5 +++++
 arch/riscv/kernel/probes/simulate-insn.c | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..debac13a3476 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -64,6 +64,7 @@
 #define RVG_RS2_OPOFF		20
 #define RVG_RD_OPOFF		7
 #define RVG_RS1_MASK		GENMASK(4, 0)
+#define RVG_RS2_MASK		GENMASK(4, 0)
 #define RVG_RD_MASK		GENMASK(4, 0)
 
 /* The bit field of immediate value in RVC J instruction */
@@ -295,6 +296,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
 
+#define RV_EXTRACT_RS2_REG(x) \
+	({typeof(x) x_ = (x); \
+	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
+
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ = (x); \
 	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 6c166029079c..77be381bb8b4 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -121,9 +121,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 #define branch_rs1_idx(opcode) \
 	(((opcode) >> 15) & 0x1f)
 
-#define branch_rs2_idx(opcode) \
-	(((opcode) >> 20) & 0x1f)
-
 #define branch_funct3(opcode) \
 	(((opcode) >> 12) & 0x7)
 
@@ -157,7 +154,7 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 	unsigned long rs2_val;
 
 	if (!rv_insn_reg_get_val(regs, branch_rs1_idx(opcode), &rs1_val) ||
-	    !rv_insn_reg_get_val(regs, branch_rs2_idx(opcode), &rs2_val))
+	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
 		return false;
 
 	offset_tmp = branch_offset(opcode);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
