Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17DCC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AgDyn7EvCUwzhYWbzIXPWdcPoxTfUCYMFfahlJDkwU=; b=TUmwPinBlxL+6o
	GmKy3DKfoEHpu3XInESdjUGsBUbJXCcRNzUTVueBh3qElKZACqfRmqvdiw7guOlIx3AYm5gMYG1/X
	PtInOw9ZQq4P1QDNhfpP1z4DHfa8rnlutFfuxPAksJcdXACBZEIOHGpjBEfnv7D4I/E9zhGAvc0tA
	iQch+s+STL1Av2nr8A3Xp6gZ7K9JrWPa1seF7o70PcnOrSIZEZWqI52rRnBr4+RL4pkFIaJJKMelq
	Ai5dYEcJf89FQCEvlyP4jcLoHOmGh5IMRadIaB+RFkI12Ugg1jDazsMr/aJ/DDTv5d3I67auayC6/
	jjQ5hM+ZTtYLmNE5MkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGT6-007ubI-S9; Sun, 14 Aug 2022 16:28:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGT2-007uXr-SP
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:28:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C44AB80B7C;
	Sun, 14 Aug 2022 16:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6954C433C1;
	Sun, 14 Aug 2022 16:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494476;
	bh=19IgdIE9ZrUrSbXsW+/oPm9vunuXvHYium+mpiIAJ+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kp+q774Bk+2x47kSpziQIKxuvi+yYeH5Odc+/wRjqrZ/v3fsahFdBUj3X7DNpQXK9
	 YAFK2CiwMa000VnIJ2s6vRuoxU4zjXVQgCHjTQMFeG+f3BixlxwU17w+pyvFFK9qSs
	 Fk1Mz0PGFt1Us+1ufb3nKRwVNXVC+Vmid9OwWVmpcfPeNuUVquv/bUBFBD+uECOtBZ
	 x6J5Xuy/7b0ldLUAhtwPR/8obW/VBgXabNMOEH1+UMcvXQzMwH+CTGQ1XCG61V0USU
	 7C2ziY06w71Xytbl7Dk1x/G7XVnei+EzhGdPhAPNunyk55D1brptf5XqkS8Knc8vEe
	 yZp6ww9X9St2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Celeste Liu <coelacanthus@outlook.com>,
	xctan <xc-tan@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	arnd@arndb.de,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 07/19] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Date: Sun, 14 Aug 2022 12:27:26 -0400
Message-Id: <20220814162739.2398217-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162739.2398217-1-sashal@kernel.org>
References: <20220814162739.2398217-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092801_778683_F0229F64 
X-CRM114-Status: GOOD (  11.19  )
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

From: Celeste Liu <coelacanthus@outlook.com>

[ Upstream commit 2139619bcad7ac44cc8f6f749089120594056613 ]

As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
but not read is "Reserved for future use.". For now, they are not valid.
In the current code, -wx is marked as invalid, but -w- is not marked
as invalid.
This patch refines that judgment.

Reported-by: xctan <xc-tan@outlook.com>
Co-developed-by: dram <dramforever@live.com>
Signed-off-by: dram <dramforever@live.com>
Co-developed-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Ruizhe Pan <c141028@gmail.com>
Signed-off-by: Celeste Liu <coelacanthus@outlook.com>
Link: https://lore.kernel.org/r/PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/sys_riscv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 12f8a7fce78b..8a7880b9c433 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,9 +18,8 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
-	if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
-		if (unlikely(!(prot & PROT_READ)))
-			return -EINVAL;
+	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
+		return -EINVAL;
 
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
