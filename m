Return-Path: <SRS0=cYQk=TU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E82DC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 06:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4425820851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 May 2019 06:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nxP8B2r3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4425820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Psc4M8vSdxIHuwHwsWwhVzbJkRtE0nzFLLEgfWXx4GU=; b=nxP8B2r33GpKyw
	6cgjt8MptazKB/psmHP8PADhL6qUWkzVK9V5D+cov1rPZ0k1leoTWORisIa5cuoJ9BqWX7gFu3kKl
	wsdPOkyUC3CzvG7SzhNeIQUvXH06ZczU1cpCXfK3ul6z5ryNCpVqpxN8BngPDl+xfj6WEmHl4JlHV
	ziTpvpzPgXkYQb3v89dq7FsgMZatn7SpyXcOhvX3twRHSH2DPrwp6u2KQn7kQOWf91Oe1/RUoJzoA
	/GfFuygoSZZd5uk+cDlOQppkYed94OUrkX04dtJevw5Fdrtn7IrEryuCN/WEetwnbFxBxR5q7vIpA
	p/bV/jDsAOTk4oCP3UWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSbsL-0006Ay-A0; Mon, 20 May 2019 06:34:21 +0000
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSbsI-0006An-Sa
 for linux-riscv@lists.infradead.org; Mon, 20 May 2019 06:34:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: remove free_initrd_mem
Date: Mon, 20 May 2019 08:33:26 +0200
Message-Id: <20190520063326.26083-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V free_initrd_mem is identical to the default one, except
that it doesn't poison the freed memory.  Remove it so that the
default implementations gets used instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8bf6f9c2d48c..b2341979d3eb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -92,11 +92,6 @@ static void __init setup_initrd(void)
 	initrd_start = 0;
 	initrd_end = 0;
 }
-
-void __init free_initrd_mem(unsigned long start, unsigned long end)
-{
-	free_reserved_area((void *)start, (void *)end, -1, "initrd");
-}
 #endif /* CONFIG_BLK_DEV_INITRD */
 
 void __init setup_bootmem(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
