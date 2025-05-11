Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663ACC3ABCB
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYPnVr6gLMrYrvJ+FeHDYb9nXxER0vY4976plFjH1XA=; b=bTJytzMTFa4+/H
	tVd+UQuUW5FbCyqa83UJLAgqL5l2x4UlTCoi4Z9W2W+wfWXC+HjZznuwSEXuYgHjKfLf1hMBjQVnx
	hyFs4+OorulZcSwfHj5cxWCw8ERzYNQ8NkQY9y0a/uGaMw5DSy/DvwxR/WBh4bJmj8RiLJXZ8RfWE
	/4CsN0dWxYHaI/RhpIZ43wol4Mzw0ms7gUg728F/5SM7zFyywpBOg/X1Vp0Y4qfg/N5FizG0AVkIa
	0AUqHY/aJKZi3UgtB8RqNI8KEAe03JRYZdsJfXWTtOA4F5l+H1uggHW6U7vJnVVP6fRm5kBVWU8g4
	HKykCBjs7NDjfkcuN3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3t-00000007sDt-438H;
	Sun, 11 May 2025 21:18:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3o-00000007s7s-0i1o
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+ZSGPGR1f44374iB4VtgRiL39ZDvHo9xWVozgwsi6A=;
	b=C8n56BwQkdOcM2T/ujlGMwbhhVjja4cdRNIJfbUNpfxyeTVhV7ZOg/LkrrEziEznjuPdbn
	mZV43gA1D/Y7+oVN6nsJcBm57XJDOWzYKBYrUbRI5ncqZj/AHnzr3S636va3MvkvgsGoqx
	wbBxy4dksn8Qe/gRhd5C8EBcUJergrCEVn6wxcQrsoCD59GkVIEMR/MMzJNZItYrOatuug
	zD//vHfFb7mHmEFpcuT2HhVt82IuKYKZ/220+lKpx+8u1c8Wh74JjRD3/TAU0DN40XokFW
	tkXIJX7gNN7sk6ULQhUhJrMluereYg4fQl/SLdiffvaP5mwzSAES5r7uhc4Vjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+ZSGPGR1f44374iB4VtgRiL39ZDvHo9xWVozgwsi6A=;
	b=Wx2X3fXdRGH2Qz8zFXmmXNC9GnAg+b6EZ282vCoOxESZxHB5AyUlLSjYaK3HbaG+UQG/mU
	5lKB7hbXt9P0KxCQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 04/11] riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
Date: Sun, 11 May 2025 23:17:56 +0200
Message-Id: <0b74924c188537b7834c9aa98aeab7c4d76dee0b.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141812_361117_C172F27D 
X-CRM114-Status: UNSURE (   6.24  )
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
