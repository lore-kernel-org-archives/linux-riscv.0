Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E172C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Zcpn4qJr5shWEQDmYlfwMTTHXYlsACJKaQLlvaSxhc=; b=zGfjcccvNtCrWq
	qDGzuw7tSjJv0fApLQOuHLTF+MnjIm4Hva8XdmtwaTAOpxHgXCYKgBElfWdiMMCh1TXVouZbomg76
	Ag7aW6Q+GrcW1961FSLE7/LIl5PxPU3lZehNCxZb361d9jaFLSibwPwYGDOWzm3g/IofnoVP4nXwt
	PBHW7ELqDluZ6Bo385eJXqiK2jH4dSxMWDNbAyHzqOGVgH+d9IordHxES9KMlp+jVYmNUkXclC3v5
	o3luq5UlFjh6P+tpVrqzbQ/14qEnF7VZ6uGf+I+pCalVewzGwUNISFWhMWqmliyfFwP0OXmxjBr/R
	ndgPkYmcruVGgIZO3AFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4q-0000000F1wx-3g5A;
	Wed, 14 May 2025 12:19:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zp-0000000EhC7-1NzA
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXzuHHlv6vCMZTxsn57Dyo4HmF+FRIx0y/mPLwDhWDc=;
	b=NG6681rr3N6qsdJvQl8R0k8Cxji29Zvu6cMLF5+HemAByizo6iFP5p59IsPg1tjnQf2Byy
	dI8m3wTM8iYbHKpssw/5neDMZIdXZI7MJHrqACe1HVGqgp91t82yLKc0smlZW6Ax+STRo9
	cy5XAwokypHhHeokqY8A+xAqNYjtZ43TU3qcVG0a/B9YkOe2ULwaJJlso0lPeUkcdvfRL0
	ZlWiWSXu/pL5tLR4gqSVjU8WPupjBW5K+10WAtBW/cudGQmAtpk6+XFe9tS0gvqmbOleo3
	VNiwCg6NE92RjR5MJfUbx8XrdRClmOs3JAkf6VJEaMLwiBSy98h1H7doLwpXhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KXzuHHlv6vCMZTxsn57Dyo4HmF+FRIx0y/mPLwDhWDc=;
	b=CkBVkwXfZ408sLldQe42mDAtMW4btZ/H0/yh2VHbMOiRmnwGu5fCKGBwrjvcTpGgbk08RO
	+xRPFdd4M8pZfHCA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 08/11] riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
Date: Wed, 14 May 2025 11:38:47 +0200
Message-Id: <8a8ed970f279fa5f24c90d840c2130e37bc6d16e.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023901_504848_848A055E 
X-CRM114-Status: UNSURE (   7.73  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
