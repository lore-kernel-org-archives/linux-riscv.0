Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2392C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Dec 2021 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CP0QEKyuU0yuMkJI/LN2u6+jffmJw43111wQvp+QlFA=; b=vct+//7ugFW4rh
	TVWdOwi0YWYOp4qq0AYRaZ+3k5TKU987pinu8UiiJNyr/hA/HlgcIq0+RvHoiwWZy2hlbw9rLrbqO
	ncew8mG/cTNzXbt7FScNFyyK+OhOq2fd/G3c6wbCCnatjt2STKv9zFyvYhXkvJJG8k7rXEMOu/Xfj
	f9sJ2Qn1EtyGWOkLMS6XCQPRZjmSxcn6ypZz/GkIGLA8j7S6CBp2rN1pXqFVx6FGPo8ev/fQtRjkn
	DoycJe5MTb1l2MXS2SREgqcJ+hgMCFUMc/8p1Rb1a4/fuufyTDic5Clghnb4B6WH8unWhCJIN94Hh
	CwNpXPuW4puaK0ufjefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoMa-00CqyP-OE; Thu, 02 Dec 2021 15:51:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoFY-00CotW-AL
 for linux-riscv@lists.infradead.org; Thu, 02 Dec 2021 15:43:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DC4A62692;
 Thu,  2 Dec 2021 15:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00AFC00446;
 Thu,  2 Dec 2021 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638459834;
 bh=BDRSNL9BJAP1UjvZCjvjufVD+ftasp+KJrQWz/J5q1w=;
 h=From:To:Cc:Subject:Date:From;
 b=cA+D8334NBV6lGyNqEo8UikXSUjyLMlNO3yixR3uWqsVcYSemQyRvSHXUrGkXLd4N
 v/VP1T7ZxJeaoQ4twH5/pby+NC6qLcMx5VmIGNM2hxa9sLyM4FbkJDTxtB2NAIeYeg
 6nGzpN0MroGLquFPPY3pdOqtXGA2RZWbn7OOMKIVExewxUeig19Sguy/IJzzIzpxpr
 +pU3ux2BWzL4cu2Z6gGDGnnrcR30OE25891kmczOJ5m/Ot45SfC1MkTBDDZWxpiNUN
 VW+5bsVCYjGdrNMuDEqfPRz4lQjj1tV3MizJ90njnCPeIiE75cdIWswhr8XYLmJBP6
 18sQ1mMeiYyJw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: fix wrong phys_ram_base value for RV64
Date: Thu,  2 Dec 2021 23:36:41 +0800
Message-Id: <20211202153641.1961-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_074356_454652_FAB1526E 
X-CRM114-Status: GOOD (  13.25  )
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

Currently, if 64BIT and !XIP_KERNEL, the phys_ram_base is always 0,
no matter the real start of dram reported by memblock is. The original
patch[1] is correct, I believe it's not corrected merged due to lots
of #ifdef in arch/riscv/mm/init.c, I plan to send a clean up series
soon.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007650.html

Fixes: 6d7f91d914bc ("riscv: Get rid of CONFIG_PHYS_RAM_BASE in kernel physical address conversion")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 24b2b8044602..3c0649dba4ff 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -187,10 +187,10 @@ static void __init setup_bootmem(void)
 
 
 	phys_ram_end = memblock_end_of_DRAM();
-#ifndef CONFIG_64BIT
 #ifndef CONFIG_XIP_KERNEL
 	phys_ram_base = memblock_start_of_DRAM();
 #endif
+#ifndef CONFIG_64BIT
 	/*
 	 * memblock allocator is not aware of the fact that last 4K bytes of
 	 * the addressable memory can not be mapped because of IS_ERR_VALUE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
