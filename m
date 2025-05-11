Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F55C3ABC3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUj0lYiCuX3LX2wmhjvnnhS+NdE80MBohCPde8sgQeg=; b=Ys0MihxPenqDuB
	goLSKeRNT5GOX5wP4H3bpA9YWTGGXT0refSBBCZRlKKzIHoI+PqL4Qcjt00sFMubhsaiM8upVTsUu
	F5xZINLz1GfJw4te+P3Y85/FQjW4JSPyDj3giS3+/wUJicUFwqYcASE5j674q7fWosSIjzsjKNAOR
	B4jtc5RKnDVTEXPVdoXaBoG43tQ9LegMOeMGCb7y6CixF19KfsR8xQy7nZ2jsmhamMfnGUCSzSBao
	ojHYLjrMNBDDEmctU3Oys2bEy49CFvUnYhOM2PuS1YEfreba7iTOdLxVohmwaj6yHGBdYN/DFjjBx
	HmAskweIC+k6RL5qWKjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3w-00000007sGN-0utP;
	Sun, 11 May 2025 21:18:20 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3q-00000007s9J-1Skc
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:15 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQXO+2w86UaaANetpNDoYy9jOymgZL7O24AgGpF2SFk=;
	b=bX57btfVcuydNfuyd0bS+isHMlT5cqHTKRypA/k7l6x9dBqH4eyrM+w8WqsWco0GoWhFWl
	6MBeEp1zYVc1uVqVwOdW6W/FGwbnJm8VmGiYlZZdGE4C12IQwoSv9TEm5qCFrQoV/9lVqD
	tRu/bpF1TcE/S40evqg6EkhdkiwCgUlAhS0R2m7w5r7flhrtJYxiQCzwe2/szgT1TcB76L
	1dXNoWb4BtSnkVHbd/hvQmITA57EYdFJB5mU9AGnjp6Zx8o6VI9VdjeHtGh2sfFn/J2aDb
	e152pyFc774gu/ziSSMSYrNPOoXQLTDwUZQNW99qnCXD2rsWFc0GeUw6siJkgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQXO+2w86UaaANetpNDoYy9jOymgZL7O24AgGpF2SFk=;
	b=ikqp5HGKRJ5owMaPvaVESfntKsc2pbQcG1oKyxOIFpFdkz94WXYMcmFsiSvUDgsDVl2CWd
	wxjnnjxrIBz+8zDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 07/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
Date: Sun, 11 May 2025 23:17:59 +0200
Message-Id: <0c07ff8c9c61511e30200aa997d93612676d1a07.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141814_536051_6117C773 
X-CRM114-Status: UNSURE (   7.51  )
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

Use RVC_EXTRACT_C2_RS1_REG, instead of reimplementing it in
simulate_c_jr_jalr().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 5defbde4dd50..f5d64613dab5 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -188,7 +188,7 @@ static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct
 
 	unsigned long jump_addr;
 
-	u32 rs1 = (opcode >> 7) & 0x1f;
+	u32 rs1 = RVC_EXTRACT_C2_RS1_REG(opcode);
 
 	if (rs1 == 0) /* C.JR is only valid when rs1 != x0 */
 		return false;
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
