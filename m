Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 16:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJYPGyQfjviXt38zCBgWqZ5mw6xRLu7y42DqfSLnTt0=; b=TkiJKa7Z1DScqa
	bMvkwa6hMVB92j9PfnIBt/HTa8idoOjGbX+qsQkBweAaHqW0nSOYepxwR+RWKS2/hu50xvmkIAlUI
	fu7R5xR7v42jFQgXzBz1Aqzf2o9XL6tasg5jY4XiF00uvcAppih+/ZR1eXTdS8c34gsaDMAbIg7tc
	0G55jXG3CIV/nBDzzPBwVq7ZDr3Ssm/tMtPTel31UXmvCqh+aGt6AyuWzlPhAc3+Uw8SVG7GBGaB3
	Q7HK014CrNwYQ5Y89ejrWDMg8Pj0CWXdJRBi8yxx5jR5AoNUK66pHJM4z/ea88sorW92VPMHXN+1p
	omdebS1KZpejlDiWMxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOSk-008bgl-O0; Tue, 25 Jan 2022 16:14:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOHx-008XwD-7D
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 16:03:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D743261730;
 Tue, 25 Jan 2022 16:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75246C340E0;
 Tue, 25 Jan 2022 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643126598;
 bh=KHKViS+ZOMcXA32XNvw1CZnIuutNB5Xs6JKM3HBXQfI=;
 h=From:To:Cc:Subject:Date:From;
 b=hYM1D5+uPzvDjlfDRdH4f3pp48z93xP+lQQiLcp5LxIr24/ysoaQzRTJ6Buw8OdjZ
 Dof/Z0dUBMVgcCOQebSZE1MmT1z0Z6Ta9EyDfH32tRo4/m8AC1KnpjwQkzQr5toEro
 UnLN2SQ/uKQTEOgD2z3IEwUXyfDZyQCUHAjpw8Ax6dvkQTFDI5UF0E7HOp10RrqsbY
 5WqYEURdPCuJT34B3A+fKODtI2Ng1vr6gfKSdkUctMOuvKtnQxHdl1Gps6lkUNeJMz
 WWJnPCBFe3jzG5vRMiPKKeYjitGF9pE9zmekMDbdNo83H6LyNbonlwnTK43eeANvoK
 bBccW2HwkjjvA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH] riscv: mm: remove the BUG_ON check of mapping the last 4K
 bytes of memory
Date: Tue, 25 Jan 2022 23:55:42 +0800
Message-Id: <20220125155542.3753-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_080321_349618_C0710399 
X-CRM114-Status: GOOD (  10.22  )
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

remove the BUG_ON check of mapping the last 4K bytes of the addressable
memory since "this is true for every kernel actually" as pointed out
by Alexandre.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cf4d018b7d66..8347d0fda8cd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -811,14 +811,6 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
 	BUG_ON((kernel_map.phys_addr % PMD_SIZE) != 0);
 
-#ifdef CONFIG_64BIT
-	/*
-	 * The last 4K bytes of the addressable memory can not be mapped because
-	 * of IS_ERR_VALUE macro.
-	 */
-	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
-#endif
-
 	pt_ops_set_early();
 
 	/* Setup early PGD for fixmap */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
