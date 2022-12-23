Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FE6C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 22:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW3PcsIq6fW7QtD5jtpZDNx+TgIQtyVezqDTfQIvkbc=; b=4+MN+SUusH/Og/
	Hn1gv7Z/GJdY3BuRXXtQsv7RkekKIqq4EqLjz70KHZ/0BcTM5RO43U26ny4fuvwOMb/wvJPB3VeTM
	Jf/qbrFR7Zv1M25boHR0kaddAn0a/J96dpF4XnHLUlOUTj2sGP7127aHc/7ikt6SYiChAoS5l+icx
	REU3y4B9pCiW7fbcW3Dn5hPbaI3q71bijWMggQOF7H936qaZKefDW0f5UIMQr7Bu9NNgQN5KM1zCO
	RXgNnExB+qu+Ok1TPuB+grLSmALFkUL3SBwYYGALVI10Zn9vng9XLRJVUDN7qYp+G5InYr4sXe35z
	mcb9yuhUbi4ruGJVzr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qLm-00CfiE-Vu; Fri, 23 Dec 2022 22:17:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8qLc-00Cfb5-1k
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 22:17:01 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p8qIb-0002Hc-72; Fri, 23 Dec 2022 23:13:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	emil.renner.berthing@canonical.com,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 08/12] RISC-V: kprobes: use central defined funct3 constants
Date: Fri, 23 Dec 2022 23:13:28 +0100
Message-Id: <20221223221332.4127602-9-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221223221332.4127602-1-heiko@sntech.de>
References: <20221223221332.4127602-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_141700_629223_881BC54D 
X-CRM114-Status: UNSURE (   8.32  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

Don't redefine values that are already available in the central header
asm/insn.h . Use the values from there instead.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/probes/simulate-insn.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index d73e96f6ed7c..330afe9331a8 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -136,13 +136,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 #define branch_offset(opcode) \
 	sign_extend32((branch_imm(opcode)), 12)
 
-#define BRANCH_BEQ	0x0
-#define BRANCH_BNE	0x1
-#define BRANCH_BLT	0x4
-#define BRANCH_BGE	0x5
-#define BRANCH_BLTU	0x6
-#define BRANCH_BGEU	0x7
-
 bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
 	/*
@@ -169,22 +162,22 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 
 	offset_tmp = branch_offset(opcode);
 	switch (branch_funct3(opcode)) {
-	case BRANCH_BEQ:
+	case RVG_FUNCT3_BEQ:
 		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
 		break;
-	case BRANCH_BNE:
+	case RVG_FUNCT3_BNE:
 		offset = (rs1_val != rs2_val) ? offset_tmp : 4;
 		break;
-	case BRANCH_BLT:
+	case RVG_FUNCT3_BLT:
 		offset = ((long)rs1_val < (long)rs2_val) ? offset_tmp : 4;
 		break;
-	case BRANCH_BGE:
+	case RVG_FUNCT3_BGE:
 		offset = ((long)rs1_val >= (long)rs2_val) ? offset_tmp : 4;
 		break;
-	case BRANCH_BLTU:
+	case RVG_FUNCT3_BLTU:
 		offset = (rs1_val < rs2_val) ? offset_tmp : 4;
 		break;
-	case BRANCH_BGEU:
+	case RVG_FUNCT3_BGEU:
 		offset = (rs1_val >= rs2_val) ? offset_tmp : 4;
 		break;
 	default:
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
