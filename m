Return-Path: <SRS0=8Mks=WS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F791C3A5A2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3480923401
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2019 06:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L80DPNzK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3480923401
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4Et63ing9nPvY5S/VsMogEljt7qFK5LefiHZzZpenc=; b=L80DPNzK0BIFNB
	W9123ig4cpeAYe2baJ7vAj4/jumbQYuPtKuDzp6RGNNS/3oupw78xdMGmDpAi39c+fgrcgRvqSWgx
	BZ/qhCC2+H1L5JGalNQctoVlKNZbsPDlnyF+82ukczf+SSHmGqBTQfTiu6gMpCrHy07c3DhIqHEsB
	ounT2Pc6ok3RDwAsCxCYeTuLgA9Lzf3CVZz0biOsLrDOqBY8ieXgAYLhI5EUqGUywwITkni31hgX4
	T0nxNlRpCJZeD/hNp/+4NSV5SfvJr3WcySXM5Q3dpUYGQEe6LeSPCzT4o4qrEwFHhKrMwlRJQM11Y
	Y13u78aQS4JrEiX80vcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0h1R-00006m-BU; Thu, 22 Aug 2019 06:56:37 +0000
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0h1I-0008Ov-9f; Thu, 22 Aug 2019 06:56:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 6/8] riscv: use get_cpu and put_cpu in sys_riscv_flush_icache
Date: Thu, 22 Aug 2019 15:56:10 +0900
Message-Id: <20190822065612.28634-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190822065612.28634-1-hch@lst.de>
References: <20190822065612.28634-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Use get_cpu/put_cpu instead of opencoding them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/cacheflush.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index dacf72f94d12..9180b2e93058 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,11 +19,9 @@ void flush_icache_all(void)
 
 static void flush_icache_mm(bool local)
 {
-	unsigned int cpu;
+	unsigned int cpu = get_cpu();
 	cpumask_t others, hmask;
 
-	preempt_disable();
-
 	/*
 	 * Mark the I$ for all harts not concurrently executing as needing a
 	 * flush for this MM.
@@ -32,7 +30,6 @@ static void flush_icache_mm(bool local)
 		       cpu_possible_mask, mm_cpumask(current->mm));
 
 	/* Flush this hart's I$ now, and mark it as flushed. */
-	cpu = smp_processor_id();
 	local_flush_icache_all();
 
 	/*
@@ -55,7 +52,7 @@ static void flush_icache_mm(bool local)
 		smp_mb();
 	}
 
-	preempt_enable();
+	put_cpu();
 }
 #else
 #define flush_icache_mm(local)	flush_icache_all()
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
