Return-Path: <SRS0=mVFr=UJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA32BC4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 22:17:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D2821721
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 22:17:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQu6lDok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D2821721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFocH0BBReyo6L6gueSH3bwdeRxYA4YWiZIJIZCpv9A=; b=hQu6lDoksy6SQe
	M9CIOzPg0gsKAIkYgHXjxk1Z9Wj1arA7678dw8izP9ixcL2WYqDA0yBLIdW7wM1dx77lPl2cvENqe
	zwkwO7A1YVw4U484qu9y2rzS22q3AaRTaFMVTfY91CLS8riLqyopBZUUJaOFpL03Ua0givezdx+FS
	YiYzBB0BG12LBtJbbLnm6PV3xcTjA2aB1HJL0nv9hWLMQERKlEBsB2QfW0R8gSkMz5iO4UFb2/bsU
	Q8ydpzNFD+Be85sJlXiDd4QlOJuCqeXel7+V7CUBQ8nckp7WKjg7ivdUaZlHR9u8iPcPryMy63mAZ
	3hKyddl3e3V4mbkeJkXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haSbI-00045k-Oo; Mon, 10 Jun 2019 22:17:12 +0000
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1haSbC-0003uj-M6; Mon, 10 Jun 2019 22:17:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 16/17] riscv: use the correct interrupt levels for M-mode
Date: Tue, 11 Jun 2019 00:16:20 +0200
Message-Id: <20190610221621.10938-17-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610221621.10938-1-hch@lst.de>
References: <20190610221621.10938-1-hch@lst.de>
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
Cc: linux-mm@kvack.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-dev@uclinux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The numerical levels for External/Timer/Software interrupts differ
between S-mode and M-mode.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/irq.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 804ff70bb853..9566aabbe50b 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -14,9 +14,15 @@
 /*
  * Possible interrupt causes:
  */
-#define INTERRUPT_CAUSE_SOFTWARE	IRQ_S_SOFT
-#define INTERRUPT_CAUSE_TIMER		IRQ_S_TIMER
-#define INTERRUPT_CAUSE_EXTERNAL	IRQ_S_EXT
+#ifdef CONFIG_M_MODE
+# define INTERRUPT_CAUSE_SOFTWARE	IRQ_M_SOFT
+# define INTERRUPT_CAUSE_TIMER		IRQ_M_TIMER
+# define INTERRUPT_CAUSE_EXTERNAL	IRQ_M_EXT
+#else
+# define INTERRUPT_CAUSE_SOFTWARE	IRQ_S_SOFT
+# define INTERRUPT_CAUSE_TIMER		IRQ_S_TIMER
+# define INTERRUPT_CAUSE_EXTERNAL	IRQ_S_EXT
+#endif /* CONFIG_M_MODE */
 
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
