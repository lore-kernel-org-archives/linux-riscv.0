Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EF4C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751AA2073F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="trHUOTAn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751AA2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yUjb3LzGeH8jghaA+faZYsegl6M/KtNwkuD+kFxvvg=; b=trHUOTAncXhU+o
	YLby8do749oPgW313IH2TT+bVbrNS6oXVYP/boqX1wiq7vBY9cGkFoA+WzYatcfs80LvP119F1J2j
	da7uZbG9gHjYrOYtuzXaT5B9Vxm+SL5BlEec8sIuXnPzxT1lQGtJkJ0BI+Al6ndWyQrTiGBWr/hzm
	o4CgNLyt8wqLdc6pXx2ByTxcVB5MD9wuUwdI1emulIogLnmbxhzcfhNQuKTOHoD6ZJnCGAUbUBdFk
	cTWdYIHMGMLDJqTcm0+jqPUyTC+HLC1n4X09xSapB//uiH12QV34Dz9+TQA15ZtDU75FkmvtTwH3D
	Disu5TR5MlfQFoFQGtVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKD-000145-DX; Thu, 11 Apr 2019 11:57:01 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYKB-000115-L5; Thu, 11 Apr 2019 11:57:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 5/9] riscv: simplify stack pointer setup in head.S
Date: Thu, 11 Apr 2019 13:56:19 +0200
Message-Id: <20190411115623.5749-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411115623.5749-1-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

We don't need THREAD_SIZE in asm-offsets.c as we can just calculate
the value of init_thread_union + THREAD_SIZE using cpp, just like
we do a few lines above.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/asm-offsets.c | 3 ---
 arch/riscv/kernel/head.S        | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index dac98348c6a3..578bb5efc085 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -312,9 +312,6 @@ void asm_offsets(void)
 		- offsetof(struct task_struct, thread.fstate.f[0])
 	);
 
-	/* The assembler needs access to THREAD_SIZE as well. */
-	DEFINE(ASM_THREAD_SIZE, THREAD_SIZE);
-
 	/*
 	 * We allocate a pt_regs on the stack when entering the kernel.  This
 	 * ensures the alignment is sane.
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..9344d9ceda24 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -68,10 +68,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	sw zero, TASK_TI_CPU(tp)
-
-	la sp, init_thread_union
-	li a0, ASM_THREAD_SIZE
-	add sp, sp, a0
+	la sp, init_thread_union + THREAD_SIZE
 
 	/* Start the kernel */
 	mv a0, s0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
