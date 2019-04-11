Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11AB9C10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F44217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EhqUF8xY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F44217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPxqDbpYXY5cKJ9iZDuG1Y3Bge0nZQ1CxVtuyZfRnug=; b=EhqUF8xYbN7hbk
	R58ytaDBLEbSSi6tlvan8GhWccF3CWZgZAjSQzs0nVvYNdsh1CFaI/bOunqYq+TTYpf8oBYOoWo2m
	ex1FbLxgHy95olqJkK8UvKlHrJjC8Bbld4tQLRrV6WMz2VqsDMf5X/1GwvuqW9Z2Q3RbLj2qVxbh5
	KcqR+0zSAj07w7jKAOZVWP0oz6fRzIIfUjOdfMYNZyPevoSkTRCY4mpH0/GGJKb+j4PCn7GfAC2q+
	7/JgISVyXNAU5i7WnwdUMHN+0UZ5+oq/Ir8vB0mZ6ZctqRXQ4euUcszgdD2QuIWi1XrWyujF5ldyU
	py3xVmmCCe6pD07Zkdmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKL-0001CP-PP; Thu, 11 Apr 2019 11:57:09 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYKI-000190-LG; Thu, 11 Apr 2019 11:57:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 8/9] riscv: print the unexpected interrupt cause
Date: Thu, 11 Apr 2019 13:56:22 +0200
Message-Id: <20190411115623.5749-9-hch@lst.de>
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

This has been helpful when debugging my pending nommu port.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/irq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 48e6b7db83a1..b10af8ccd656 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -54,7 +54,8 @@ asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
 		handle_arch_irq(regs);
 		break;
 	default:
-		panic("unexpected interrupt cause");
+		pr_alert("unexpected interrupt cause 0x%lx", regs->xcause);
+		BUG();
 	}
 	irq_exit();
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
