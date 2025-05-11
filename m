Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B433C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1fVy4RH0VB8Mykq1/5WosAj2Oc+KfhPKG+xjr6ajqI=; b=mAso+nVlJ1/rz6
	sOPXZFoR07DXpIJVcBUOXTdDDnRAhAE3DX6zmEflZ9EYsKpZ7RiX8mPvnackrJdVP46wy/mURS1w8
	QuClG7SV2caDF6iLG9BUuvZs314lumSZvnDKL9MlXrYkx9LWCfFAUNFv7vzoAM+V6n/V+vn1gwmBt
	q+USZEYDaYGhbK5KNz0jSH0Px1x2707LVKmb6b13kfLEw1hw9M6cWEn3DWohH56lU0kYe6w7CgD+w
	x75tW9H5gMeZcq5/6mrP4YtiJju4SrXRRvKYIhR2+feoPWZbXDypSKH3YcBQ6MpO+mdh5E1t2eXC6
	pGQZ+3PdnOIv5ueI0erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3y-00000007sJp-1TP7;
	Sun, 11 May 2025 21:18:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3q-00000007s9U-2BKU
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:16 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofRlSkfoMczDkVEQIfQIC8RlTmO5xBys4uCekN9vBRo=;
	b=Q9/Tx3hJUILpIEp06fQma9qN1+iMs9Sa/7Z5shRXrMIKOQzz0bV39ArEZo+onXxGUfvtvN
	EuNmPLT04T/FhYA1EHyX/IvK4Fl3l9cZ5Za9ZSc1ii8WrLfW2Mi9cJ4w46x9gVF5TtJ0yL
	5wVL/NO4dSK8iQo8JT0N43ykYoE5lpBls/CymSXANfFz/l9jh/wLOAQN7xsjOZ8a9x8je1
	IwEnKjgoN8V+iTdjBa32loLmQUOgITR2yMS2EEKoaqbO0+Q/KACE1l6YiHxsEX79vaJyL9
	1S0bPNscwlqxKW2Xy9HRQbtPC8yNDfvoNYaHdBqmQz6Tszj3wZyy7cRJXrv2tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ofRlSkfoMczDkVEQIfQIC8RlTmO5xBys4uCekN9vBRo=;
	b=pHSxmLgtOBB4FsYEQvh1sDzt8EOQL/+YXiOKHnUtIun3i12yJ03x1iQQOpECZF8Iih4Blp
	LIj42Ii3e28q8vDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 09/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
Date: Sun, 11 May 2025 23:18:01 +0200
Message-Id: <710026e5113b9929fd9fca2cdd5d5cd86aa6b447.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141814_758763_708B2FAA 
X-CRM114-Status: UNSURE (   6.32  )
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
