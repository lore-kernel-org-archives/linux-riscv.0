Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912D7C3DA64
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rxb6P9bniuqAdyOtJaqZylvciMnU1o4oBPBRXpgEm5k=; b=P/uVFKQaSMvf5G
	C/B0DOl94QrWXtjSoyocltV4XYxwoTjHzTkKAMb1+KXogfpNKXKetBgq7Wp9fTSPzWOQ/L6O31ru6
	srXX5qr+ZyXoRCH6kA/+KqFKXBCwtQOQyznVzJ+lHVn+EsUntAQYFyXvsVwdySxX6a2SGscK8E98p
	7CSVNfwrCFrOy3UsxhAVu/dMV9v767CNV8SPhWkg6Y0IgNahtH9/Jacz3tkjsDgFBTybzGTe5iGq9
	MTcpBWYkuR3WCuwk/EBgrf56zva+trd6ulyFrcfhEW1/XF75ogxz0kVuoxQD3WvvZMbVWvy+L0+qL
	u/fGXwv6nm5CV6imwRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrO-00000005Qfu-0JNa;
	Sat, 20 Jul 2024 17:27:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrI-00000005QaW-0fUU
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:27:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 34B6D61168;
	Sat, 20 Jul 2024 17:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84504C4AF0A;
	Sat, 20 Jul 2024 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496419;
	bh=Xt3rus8MTwutIvQ5H763TfjQNRRFpnqcC5IzkxuWKNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QihgeSnvf2PG6PDvXw42EUn9W2Oi9atxy4Nf7WqIlvZyRTC4qpgDd43bxadaHLI8o
	 G7TVwBqzG9gC9FOAqBErLA9cR1tph4INUWAYs/GaWoQuthn76MwevRLw+oBVXpxsYw
	 QI8kpRYJGwRWvkACHfZtzQ5N7F9OMML+EPWNft5t3UUI9MSAaWT9SLH6EcfTXgX2jn
	 eTqRuMFQtySTtIJP/MeDVsb6yVHCFN6iTkA5CWHMn01XwPx6IA1DAjrZFPRwvVd+ct
	 gfkP4W7c3SC+BZ+aASXMRVuewUoo2jvRede2Xbp+Q3R2VxVuw8qaED7MjWaDz1pip3
	 YBG1UIfA5btfQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] riscv: errata: sifive: remove NOMMU handling
Date: Sun, 21 Jul 2024 01:12:30 +0800
Message-ID: <20240720171232.1753-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102700_302805_71ACFEEC 
X-CRM114-Status: UNSURE (   6.62  )
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

Since NOMMU is now properly handling in generic do_traps() which will
call do_trap_unknown() for instruciton page fault for NOMMU.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/sifive/errata_cip_453.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata_cip_453.S b/arch/riscv/errata/sifive/errata_cip_453.S
index b1f7b636fe9a..6f004a1610f6 100644
--- a/arch/riscv/errata/sifive/errata_cip_453.S
+++ b/arch/riscv/errata/sifive/errata_cip_453.S
@@ -23,11 +23,7 @@
 
 SYM_FUNC_START(sifive_cip_453_page_fault_trp)
 	ADD_SIGN_EXT a0, t0, t1
-#ifdef CONFIG_MMU
 	la t0, do_page_fault
-#else
-	la t0, do_trap_unknown
-#endif
 	jr t0
 SYM_FUNC_END(sifive_cip_453_page_fault_trp)
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
