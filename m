Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE01C3ABD3
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKMJVeQYccwbTqLecnQEGW470k5eGJ6pkbJaB1uETzI=; b=F4ODbFn/mlExGh
	ohIru4zPgIFkH8GYaxyZiiJM7tQOjU9ybvxSnpT5aLwR+/Dtgv/izCC2CTipPt6cdiGJDeo4fJEKZ
	EsW8GXVFriZMdMCRRjW5VNUo+dWyBxXFPREO2rfXlRJ78Ao4/p+Ntc0itVUPvnk3tMOKXZoOrJkvI
	7HzsMqjBSlIrq7kHEG8KQc6GejdDq9K13w+CYeA5ujxSPVTcUuS9lHlZCPpSWPb4+01q1nYsIIZ2D
	oXaJuu6lZscyG1uc41XyTFy5ngBgDhDtZjlkWhpxHpeZiiAr+5QOnVKo/C1A4x0zSBW4sr9PjJb1/
	gljtieQTbbdi6D966YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3w-00000007sHK-3pHt;
	Sun, 11 May 2025 21:18:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3q-00000007s9K-1uEO
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:15 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7nRg54MLFX0wtJKb5RifAgoyTmks+tvfzWz8EaXC+I=;
	b=tPRJhrehBPcmassI4U6hQ+6Hdpv9rxGcGNrQJirTHwzDfsrdCwUgu1sjMtAwWAWj967XL3
	NPJkg9F2+CbJLbRnlWVKQf3SFVdTZSNsOl71R4G5wGIJXdIZAbtbDto+lvdGpmDcoHIp3F
	j/nDpgmezlvFIWck+//t/Sg03WFdmMdpsdfW5nHJOim7NGw7lYCsozyN6cUc+0wOxtyao+
	MVHoFIPLkXd8XadAu5jVxP1Ikf/NDgJUV4p639ybA5iup8oGq/tGt0EVMEpFSEnM7Yc2bN
	n++vMbSHO8/XbKN/vq+fmiS9rp45cVkLp5kjXs2pzE2ZYjmaT1LdKCaBpFrE8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E7nRg54MLFX0wtJKb5RifAgoyTmks+tvfzWz8EaXC+I=;
	b=eyG41UCA5GOgr6jB0HFIk7/4ZIzC8VjG+m2YtoWBEGjkRvhqXmWnPrPkGsG39JCdE9XsZX
	cTwKh1rcOE1ZuFBA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
Date: Sun, 11 May 2025 23:18:00 +0200
Message-Id: <fc9a3dc0a7365800edf8c300b73d6f82ef761ff0.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141814_691004_1A51E90F 
X-CRM114-Status: UNSURE (   7.55  )
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

Use RVC_EXTRACT_BTYPE_IMM, instead of reimplementing it in
simulate_c_bnez_beqz().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index f5d64613dab5..e670e55954d2 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -232,16 +232,10 @@ static bool __kprobes simulate_c_bnez_beqz(u32 opcode, unsigned long addr, struc
 	if (!rv_insn_reg_get_val(regs, rs1, &rs1_val))
 		return false;
 
-	if ((rs1_val != 0 && is_bnez) || (rs1_val == 0 && !is_bnez)) {
-		offset =  ((opcode >> 3)  & 0x3) << 1;
-		offset |= ((opcode >> 10) & 0x3) << 3;
-		offset |= ((opcode >> 2)  & 0x1) << 5;
-		offset |= ((opcode >> 5)  & 0x3) << 6;
-		offset |= ((opcode >> 12) & 0x1) << 8;
-		offset = sign_extend32(offset, 8);
-	} else {
+	if ((rs1_val != 0 && is_bnez) || (rs1_val == 0 && !is_bnez))
+		offset = RVC_EXTRACT_BTYPE_IMM(opcode);
+	else
 		offset = 2;
-	}
 
 	instruction_pointer_set(regs, addr + offset);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
