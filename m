Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93277C3ABCC
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7KINgbf3T8kvSbd43OsL9lq8dl9B9Z8ccxoKg3acds=; b=IwNdnW8Jz3w2Ve
	0El00/LbPS49CKN60PIo0P2ZRIHMaMHi3xWg7dTjOkTj0dh2ERImgB5e3jr4p+fFRiFiTjF7bM7vl
	r7fZy0ORWJ4nafACpOEkDEXsFiaTOTSJpZIG2VvqOIKe6KhMGqeTgDJD/Xb2KhhKela1PqVWF+ysE
	xK/MrPfkYvKC5wSHw0vocf+cmXSMD0cEKrGtOdcEvVynnY94rCGqlS3+r97iABDiL5If+evh/QTgJ
	1nvhaIzaTbdh8WkR0lamararkhzP9QqXr1B0EpDQvj1tmTSJx3aTjh5svOoTbF0sjj01D5WbEof0+
	D6A3EU4QsZ4b3ZeVwt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3u-00000007sEZ-2r0g;
	Sun, 11 May 2025 21:18:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3p-00000007s8Z-0r8y
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:14 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1LlZOoLaS1B4vzBVZP0EbbDkdO6N0U0HywBnUrr4mA=;
	b=K9edcgy2AqS6myyr8osxsH/m4ft3ZfK51MHm6QBJV7NqlDms9fM2z2UCCcKLKCI0+/4wRR
	KL8TlSzPZlrkJlvVqo52dKnNGx2VoRI4l6t/43jUe4PWqq/WIHt6tsA1dQe6ZDW4Zy4IW4
	f7WnEsCZjeb808ODmTUKjUBkHV56wf/HFLSwoQu0qS0ufGAMWp6bdRLliKeZe3tT30Bi8n
	bOaFEeqq/QWWn+aUNqNwwJCrXg4AbOuzVVxBW9kBVg8r2J4WrZnU+UtjS52tigmxAO+eNH
	MmWz9p9MlswKCwLm+wsklKs3bGBO5+4WpaXWp9K/7RMh41qMsnMeoEnUVVEdMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1LlZOoLaS1B4vzBVZP0EbbDkdO6N0U0HywBnUrr4mA=;
	b=0wQUYP/7DRKfmnvIEK+XjjotpML9prs2X8tQzmteXC1Zehb0qD1MQQ1oCeUaej5Q2mw4fV
	HhSaAfV28a873fAQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 06/11] riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
Date: Sun, 11 May 2025 23:17:58 +0200
Message-Id: <64739c38b3b22633cf76b392720028821f4c5a74.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141813_409513_5AD9C052 
X-CRM114-Status: UNSURE (   5.72  )
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

Use RVC_EXTRACT_JTYPE_IMM, instead of reimplementing it in simulate_c_j().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 3ba97e79a2a3..5defbde4dd50 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -170,24 +170,9 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 
 bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 *  15    13 12                            2 1      0
-	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
-	 *     3                   11                    2
-	 */
-
-	s32 offset;
-
-	offset  = ((opcode >> 3)  & 0x7) << 1;
-	offset |= ((opcode >> 11) & 0x1) << 4;
-	offset |= ((opcode >> 2)  & 0x1) << 5;
-	offset |= ((opcode >> 7)  & 0x1) << 6;
-	offset |= ((opcode >> 6)  & 0x1) << 7;
-	offset |= ((opcode >> 9)  & 0x3) << 8;
-	offset |= ((opcode >> 8)  & 0x1) << 10;
-	offset |= ((opcode >> 12) & 0x1) << 11;
+	s32 offset = RVC_EXTRACT_JTYPE_IMM(opcode);
 
-	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
+	instruction_pointer_set(regs, addr + offset);
 
 	return true;
 }
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
