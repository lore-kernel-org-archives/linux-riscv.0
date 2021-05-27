Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2379C4707F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 07:23:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED82613D4
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 07:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED82613D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxZB4plakHVgks3UJFcTi5gvVRDwQi49gC27Rr/ZpT8=; b=MCokl3psK/vwr4
	lbYqWkiaXJObyWbG7zv2F3EjH8F7t+ME7kkX+DlFkNyijHSC9eAMB3CQqMQ4ItGmvWdUvV/JVMUU2
	NveAAf1HJiXFovyYQS6GGZIPI5g0Yg/zCwMrqEiV0C8fVfLTfyA1mWV7y7PKtzVNUVmLsmWWI7C3l
	MrqelNAn8pD8tpWSsLVzkxHiIppE8zHYgBJs2F30PTrzYypBe7AZro4Bqz5C0MneMIt1W/ygoQlMg
	QaMmWXWjJQkqQ+5XeH5CTD8P1AF2q89NgZXsnwoAX9uRL2+GIalBGYMEBZSqxIAMfmUBDnKZ+g7SS
	vXb9rHGzYFYa++O7N79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAMi-003Kdp-IG; Thu, 27 May 2021 07:23:36 +0000
Received: from [2001:4bb8:190:7543:4a62:72ba:8559:b110] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAMg-003KcN-Dn; Thu, 27 May 2021 07:23:34 +0000
From: Christoph Hellwig <hch@lst.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: remove Albert Ou from MAINTAINERS
Date: Thu, 27 May 2021 09:23:32 +0200
Message-Id: <20210527072332.2572948-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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

Abert was added as part of the initial RISC-V merge, but has never
taken part in actual maintainership.  Remove the name to stop bloating
patch Cc lists.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94224222c6ff..85b70d5e3961 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15739,7 +15739,6 @@ F:	drivers/mtd/nand/raw/r852.h
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-M:	Albert Ou <aou@eecs.berkeley.edu>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
 P:	Documentation/riscv/patch-acceptance.rst
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
