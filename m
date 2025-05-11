Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441F7C3ABD2
	for <linux-riscv@archiver.kernel.org>; Sun, 11 May 2025 21:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxUX5OYrBn9D+2YtFU4VoaccHMiykHddJeyk1xILeaM=; b=s8Jmovn1CEmihB
	0Y1Y8fTSRfoLP+lZT9LI9fa6umn3w/7EQkj980N7YdtZyntPZxACxx4+RyPSFFPZThkuKBFz9vLDh
	aCKjm5fknlyoXFrBDI+jjXdf8/aWOlWQNNj+AmhkOVEnCTmAyEXKXSXp5oLw6JuWYJIoKQd5f22kM
	A+v1N7Isrw54XVurzdsgizegd+eZrPA0oz7Y4jE1JZCQ2w+AdvvoEuWEKqosyPMztHiw9kXuEFRgE
	kyo2KLviK7kS+83Gh3pZaU5AbAW2AxxZKFha0ov297JL6sbYJqwpowh+uusdMpTrfeZwKfrDfndiu
	z87gKlT2R/QeeWoC3nMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3z-00000007sKt-0Mrg;
	Sun, 11 May 2025 21:18:23 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEE3r-00000007sAF-1o43
	for linux-riscv@lists.infradead.org;
	Sun, 11 May 2025 21:18:16 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746998293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YuprVJ8dctdiMrh0XyEl1XTvNDpL+VEXZc49r4qPy8=;
	b=HjhXIJUWdi8O9Rjb+lJg29OUgeDPdJWXzI99fJq+fOrfdfQZaoT8hiYI7HgVH1BUjrGhVY
	lkbKGy7kzWhUgHyru7UkTQu3Rrb8qiYZB8hojXg2zpn8QYX7lJec0W1/mzLJn/6fKMFmxP
	zAVtCRhVBjFS/5MfUhTwaiOb5JBhyvb0nboHu3fzUmK02yS9RqgolSjiJgngFwElWaJm7C
	koHdoTUQx5pWd1wblFNiEPYj2MoHIwTFUzeMKKXPRefoGui8iWMapD/iZm5XJ5Tt0pcmB9
	MYybPxNM5F8F38d1qCQBQslYe+mtijglSRdfN21Cz3fkRVDRSG5YxG4zruq5Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746998293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YuprVJ8dctdiMrh0XyEl1XTvNDpL+VEXZc49r4qPy8=;
	b=8dMpZIAPEiO5C/lMba+ZSdSkzzwVmpOhUMWmswW2C1y6tXcJkn3B5wZmKEQ6W8VA2tm2bk
	CsxYeXtYrUpJJGBA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 11/11] riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
Date: Sun, 11 May 2025 23:18:03 +0200
Message-Id: <2a2d138d1a5c011a00ba2a9eb84d5226304d7b48.1746997351.git.namcao@linutronix.de>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
References: <cover.1746997351.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_141815_624504_740A92FA 
X-CRM114-Status: UNSURE (   7.23  )
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

Use RV_EXTRACT_ITYPE_IMM, instead of re-implementing it in simulate_jalr().

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/probes/simulate-insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 2b3cd69d6f8e..fa581590c1f8 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -64,7 +64,7 @@ bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *reg
 	 */
 	bool ret;
 	unsigned long base_addr;
-	u32 imm = (opcode >> 20) & 0xfff;
+	u32 imm = RV_EXTRACT_ITYPE_IMM(opcode);
 	u32 rd_index = RV_EXTRACT_RD_REG(opcode);
 	u32 rs1_index = RV_EXTRACT_RS1_REG(opcode);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
