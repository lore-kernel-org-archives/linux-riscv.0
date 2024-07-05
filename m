Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97053C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LyzSbiZNoKlXidl7kW72TGKdaAfY6tILJp/M0p5G1rg=; b=1ygLwJF2Hfrs+k
	sr3DjJCpS4g34w04p7TFK94X2eySKrFgbfOxZl2aSzu2655hwK9RJQ5tJZjVWH0+HuYmHaumuQ5HU
	483TdnlahsZyrLg5tyF4z+rM7FsLag43h+683e2vpwL93Etg0NRjHRBE4a68pUW3mv5tApsrpC28B
	0gPoK9lFZS3MIs+B2DLL/2N3/YqRto30gESmCGYiPuA81E9dbMpByy18NnAOrkbtPaqjKoirua7Bs
	SekB/89caW1hW7Oyaf4MU8YbrlHsJQx4nTn28Q6cE/bp7M7VezCA/EmErwd1n0tuTcOn92zMdbwy9
	/PKuimAvD6ObEzExhlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPj7u-0000000G55h-17nc;
	Fri, 05 Jul 2024 13:37:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPj7r-0000000G54a-02f8
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 13:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74028CE3D92;
	Fri,  5 Jul 2024 13:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8882BC116B1;
	Fri,  5 Jul 2024 13:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720186640;
	bh=bW7SJuoSHC50Ot48nvepYpmST048P10fAOtJVbkOwyc=;
	h=From:To:Cc:Subject:Date:From;
	b=TNsXabrs0ShnwnZTHeRTublv86zHKP2tctDSOXhpV5JHiYkfIquIjJJ/uSOabXsgH
	 r6WWm4zWABnBro+nEL26vAVfoCEFaZyxrKMUyPVy9hgb0aspNOX2ObU5ElrfF5EZ/H
	 kvDmCeaZZH+RpayjjJS3YJIYxosHkWP1ybEuR76B5oY8GDd/KSlLxe44r1Zbc5OT1Y
	 bGKaMlmQtjuBNPU6Jm0MBfQYf+qzOkJwrRBcczWWAB/61gWLNSB0aEk/3R2KVc8+Qi
	 LB7aHVmDqL3urthn8xe+JHynjTsUMmdYia8B+PMtuvrp+5dZJ155uGDlKm7IAOF5im
	 15i4Yan94IOBA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: select ARCH_USE_SYM_ANNOTATIONS
Date: Fri,  5 Jul 2024 21:23:08 +0800
Message-ID: <20240705132308.1469-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_063723_242268_BCAAE39E 
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

After commit 76329c693924 ("riscv: Use SYM_*() assembly macros instead
of deprecated ones"), riscv has been to the new style SYM_ assembler
annotations. So select ARCH_USE_SYM_ANNOTATIONS to ensure the
deprecated macros such as ENTRY(), END(), WEAK() and so on are not
available and we don't regress.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..c51b32a8ddff 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -62,6 +62,7 @@ config RISCV
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_SYM_ANNOTATIONS
 	select ARCH_USES_CFI_TRAPS if CFI_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
