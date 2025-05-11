Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E642C3ABCC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZgwmd4Fw/eDqHOpbD2oxWa8LqfoiRzw/DsWBtcXqdQ=; b=DVUdA8/G8K9XOc
	HBX0qaX6nfUnFzQbKk6EJ67Xq9fKard2QPxmgD3nG5ggXO9HGxFEUU8IzuslD+MZxjIJam7XzjL2/
	paf6wWpX7L/ldlEC5477ytbsxGL2/wL/dHjSPe5bbkXORVtpVSZjn0ejBJ5CvbEeNffCoJY1vt2ga
	V7ZXaBD8LB067XOjfeFuX/y4YCtwh+32hwvx38EWLT56t+WeDDetp2FYsu3J1OazCRhN1M4TwLk97
	11cEDVGWw8AQIf1oqMhF0jyDJHgXP7qJhoAPdxY71YzdaVwzeoVzim+rOMxXK2VaUQI13av62O5yQ
	XAmCr9vNvWQyXdB0T38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3x-00000007sI6-2KYl;
	Sun, 11 May 2025 21:18:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3q-00000007s9O-1jSg
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:16 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4YToDIER8H6nwFDI0QIaa0HWbI2B/uQuBCnhyXETH8=;
	b=iv0xgamOdlWgoRLYIquiePlF1sRtPhuhM8ks2maPBrgysF+5o7bViA516VlTG5u7f29QLl
	QWpKziOIyYHPU1V8iu/XCSmwd9lYAY6zvJ8VX6VAdMIlcRwXvJjR1Ycgb/IB/FfOme0aVu
	SWnHiJp6xBg4s9qrzXyyC+IuN3HMKUP/h6mfnbe9okvVPo01X/0A3raLzLAYOjn7zWTdWP
	DXkvQ1fWUIn6aCtWI+EKEb1KCkhnPEy/FKfTcUud+htZEyF2OVg9EDWPUBhLPGMOpVZo5O
	jRahUpdr/Dm7/FW6QkzWTr0XVRBuzj0Y6iL65LBQVjtE/qHy9Vz1htqUO9jkdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4YToDIER8H6nwFDI0QIaa0HWbI2B/uQuBCnhyXETH8=;
	b=wEzs5iLYHFw2oTfS/sZ/KT/gPE2ygLqG1lQ6V3ParOCPIp9HVi3ZN0sjeUa+BLCtapVBub
	Z4E+KEN1lp+JtlDA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
Date: Sun, 11 May 2025 23:18:02 +0200
Message-Id: <e1e26af7130aa39ce4c8c99e50038273fa32a1ee.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141814_663053_C5A16D4B 
X-CRM114-Status: UNSURE (   6.84  )
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

Use RV_EXTRACT_UTYPE_IMM, instead of reimplementing it in simulate_auipc().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 1717df780409..2b3cd69d6f8e 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -81,17 +81,6 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	return ret;
 }
 
-#define auipc_imm(opcode) \
-	((((opcode) >> 12) & 0xfffff) << 12)
-
-#if __riscv_xlen == 64
-#define auipc_offset(opcode)	sign_extend64(auipc_imm(opcode), 31)
-#elif __riscv_xlen == 32
-#define auipc_offset(opcode)	auipc_imm(opcode)
-#else
-#error "Unexpected __riscv_xlen"
-#endif
-
 bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
 	/*
@@ -102,7 +91,7 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
 	 */
 
 	u32 rd_idx = RV_EXTRACT_RD_REG(opcode);
-	unsigned long rd_val = addr + auipc_offset(opcode);
+	unsigned long rd_val = addr + (s32)RV_EXTRACT_UTYPE_IMM(opcode);
 
 	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
 		return false;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
