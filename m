Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15B6C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4YJrWjbG0PMI696cQu7nMUm65zd3tXmJKdIZo7xnk0=; b=AgCZDVfP59W0xv
	AKEIIxNv/3O+YMXApwcTb5XVPEOJn1xiqWImNk5SF6LvYJ1XTyh6CsZqj8/E1UZidiYQRJgno4AYD
	ivfiHhlnLSXna4NXk58heFscsgvuyepk7LtmLUSZlsw2SwdPFjhg63ouTsBKtoFaoiErt9/AN/qDS
	pI8B5wtDYT2ZMArcGckURnBRDn1psPkeYgmM8dxS2kilMZ35JJSz33GzoIqxw4K7ywfgIx6BriQTR
	y6iq4u8yq27VvW4VoAy1mCLvwnEMrnq3UPiGsIm4E+EBokUCrCLEjHAHRsSpjul7ZgPwStu45xMjI
	PkFJgTchpYi5eVy1pnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB4t-0000000F22J-3NzL;
	Wed, 14 May 2025 12:19:15 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8Zp-0000000EhCK-3zu7
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 09:39:03 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HYROmeEdoYy7d9D9b1rSDF4X+kejBdVkRgxHg9uSSE=;
	b=LKdT+UaQjok9K6cAoxFHq6JRad8HL1SbzGffapUhJsnl8z+Em7APOJY4S+AkH+X91D1dxy
	Rq4TLIEg2F1RUqQsM57Ec/b/66Et+22IQbsnh38K9xOVL84IfQlbH5wX6Sl6i5/mkLoD5+
	bObKa4ajpzqdkFLB8XgUPMu/ksRGdfD/EagieB+UwzpWHPmFxgNjtMH50aiAd/DIGZ30E7
	DIQguFjxXjNsInTL5mhwZgndzfR5culv1aL+0fYvcfqOMAy0NPJ9cvCG2MFKcPVf+0A6lC
	3llx8TKhrVVh8Huvoq3dPyikRIXwJKwAkAbG/c0KkyoMKBrOMVJgOtRYJftP0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747215540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HYROmeEdoYy7d9D9b1rSDF4X+kejBdVkRgxHg9uSSE=;
	b=hID/EosP3UGjeC7eJHpk72qwU2yauIAJ3UY6yDJrd2Uu1+uiSQ55L/DOi6MrmptEZGkHJZ
	3S3Z06bMPsP23RAA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 10/11] riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
Date: Wed, 14 May 2025 11:38:49 +0200
Message-Id: <8f0defce9f1f23f1b44bb9750ed083cfc124213c.1747215274.git.namcao@linutronix.de>
In-Reply-To: <cover.1747215274.git.namcao@linutronix.de>
References: <cover.1747215274.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_023902_151083_55E09510 
X-CRM114-Status: UNSURE (   7.02  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
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
