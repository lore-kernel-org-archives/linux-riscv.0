Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551EFC3ABCC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGMPQOKLM38JNI5/ZCTp3CAv4th4wnaYgOST12Gk+lQ=; b=4upLIAM3qPu8IE
	G5++mBfYwKzbp9kgPBUeZGTJUCKT8wcI+WhFeJAF5j2TRpEJf8WKKDXuNy+BJwXsj7eJkIeSP7ZLd
	57V/WMdMhrqcNUaNS+0bufCsmJBJWqagLd108aEPuTwr2QgiH0gYRJqKWgDFU20ij6EmWecNup/gV
	86bYKqKweCommuX/X9NLFr1XJ0+HUHOACuSERhUg5J0c8gsobHMIFc/kBban3tsr1hbXvaeIUmOOH
	2bkNNVI+tG99bj/bHNJjSWzqu9bLUtIq0Nr7TaYWUFU0XRlddQ0sAnwIpWsJJ9TL8hjGkbLAPEw3F
	FGa4XqsOI4CT0UylSXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3r-00000007sBQ-1whC;
	Sun, 11 May 2025 21:18:15 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3n-00000007s7f-498l
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:13 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsddRiOpi8XPygRa69KJPJp3ShvkCz7BnK7OzU9yZH0=;
	b=VOmvd4EkuOEEmkpZTBoebEM+0zppjg1sQy6OS4LIJ94ImG1Mhzv0n1cs+fMPsOM8OSLuRx
	SxkR0vxY6z9x6hh7BVIJwrNq2SbnNvJWpu3LpBndS36oCTzlek94Ao+J3MrpGwRNYqhPxd
	60W+RSTl8Kg+fgSps9gWUTv9QrIT44cn91//RkZsXR67Le0sebQQFZpv3US5WrWeIF0rnW
	jp9YbpLhDjvtPQXZqFdUra2Mb+ekO8eulfSxeekeDqOZ1MxVVEwptIyKEAiIPPGH58rzzM
	Gphc3KIE3LFzJM3/FT8AWsTKlTuqKH+7LlJqCmRGsI1X6qAIp+pUcJGsyCnTaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsddRiOpi8XPygRa69KJPJp3ShvkCz7BnK7OzU9yZH0=;
	b=uOOI5eogQWrO2bwxjPHhV6QHYKorOMnN8McHcLSSYB1FBZWgQ7nYW1RiHrEJZWwb6yqBjB
	GFIkJxMH3UyP5dDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 03/11] riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
Date: Sun, 11 May 2025 23:17:55 +0200
Message-Id: <10dd59c17c7c6f4700d92f988292ee3bdcaad71b.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141812_162661_174C01F9 
X-CRM114-Status: UNSURE (   6.23  )
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

Use RV_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_jal().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index d5f74fadbc3a..b76a691d0d9a 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -41,19 +41,16 @@ bool __kprobes simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs
 	 *     1         10          1           8       5    JAL/J
 	 */
 	bool ret;
-	u32 imm;
+	s32 imm;
 	u32 index = (opcode >> 7) & 0x1f;
 
 	ret = rv_insn_reg_set_val(regs, index, addr + 4);
 	if (!ret)
 		return ret;
 
-	imm  = ((opcode >> 21) & 0x3ff) << 1;
-	imm |= ((opcode >> 20) & 0x1)   << 11;
-	imm |= ((opcode >> 12) & 0xff)  << 12;
-	imm |= ((opcode >> 31) & 0x1)   << 20;
+	imm = RV_EXTRACT_JTYPE_IMM(opcode);
 
-	instruction_pointer_set(regs, addr + sign_extend32((imm), 20));
+	instruction_pointer_set(regs, addr + imm);
 
 	return ret;
 }
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
