Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD812C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D9C60E8C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:06:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77D9C60E8C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRlWKvft9ItYceiXV3RTT9qEbuHNwPSxUB0gPTIsJbQ=; b=lFgVpXkpzt+VGu
	9OVc/Jzt+A24IIfPcedRaFY7YyDxVLu/UCVamOq4UjRAMsVbwR/DKo9zskGggz7TEq9FgLmomqJoE
	E92tt7QVZG7lw3K4lGYFB81gTjwGoEnLX1G7Cq0PzDFo2SNXz9gndBdpaQDP/9UHFxqVH8becbNmz
	jzxm0c4YPEnymbKTW84CZMyd9S163FkYxi3vwxbs4LWpU9IVFZltjjlBz6t30Ut1PJ+h5czTdWoSA
	l6taahfTTA2Y6fNiI7cttVeqToS56Ic9GK1lPCh7Pxx67sy5yL3aKP+l+B6xpf3AF2ykLLdukMUFs
	9ZTMS0uhpwK12BEzTIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6usC-004mSV-6i; Fri, 23 Jul 2021 13:05:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6us9-004mRO-VU
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 13:05:51 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 60443C0007;
 Fri, 23 Jul 2021 13:05:45 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 4/5] riscv: Simplify BUILTIN_DTB device tree mapping handling
Date: Fri, 23 Jul 2021 15:01:27 +0200
Message-Id: <20210723130128.47664-5-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723130128.47664-1-alex@ghiti.fr>
References: <20210723130128.47664-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_060550_190166_58611CDC 
X-CRM114-Status: GOOD (  10.02  )
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

__PAGETABLE_PMD_FOLDED defines a 2-level page table that is only used in
32-bit kernel, so there is no need to check for CONFIG_64BIT in #ifndef
__PAGETABLE_PMD_FOLDED and vice-versa.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 6b29c5791555..1b30ad7e3ebc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -614,18 +614,14 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
 #else /* CONFIG_BUILTIN_DTB */
-#ifdef CONFIG_64BIT
 	/*
 	 * __va can't be used since it would return a linear mapping address
 	 * whereas dtb_early_va will be used before setup_vm_final installs
 	 * the linear mapping.
 	 */
 	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
-#else
-	dtb_early_va = __va(dtb_pa);
-#endif /* CONFIG_64BIT */
 #endif /* CONFIG_BUILTIN_DTB */
-#else
+#else /* __PAGETABLE_PMD_FOLDED */
 #ifndef CONFIG_BUILTIN_DTB
 	/* Create two consecutive PGD mappings for FDT early scan */
 	pa = dtb_pa & ~(PGDIR_SIZE - 1);
@@ -635,13 +631,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
 	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
 #else /* CONFIG_BUILTIN_DTB */
-#ifdef CONFIG_64BIT
-	dtb_early_va = kernel_mapping_pa_to_va(XIP_FIXUP(dtb_pa));
-#else
 	dtb_early_va = __va(dtb_pa);
-#endif /* CONFIG_64BIT */
 #endif /* CONFIG_BUILTIN_DTB */
-#endif
+#endif /* __PAGETABLE_PMD_FOLDED */
 	dtb_early_pa = dtb_pa;
 
 	/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
