Return-Path: <SRS0=P6b6=UX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4A8C48BE3
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 05:44:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA0A2089F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2019 05:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZsOuuqZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA0A2089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZFocH0BBReyo6L6gueSH3bwdeRxYA4YWiZIJIZCpv9A=; b=tZsOuuqZDYQgrt
	j0PkrhFZMAJtewmerO/CW1UDRqVxcnp2rbGafhXuvW/UHv32oRfDp4u8DvpXeQkrPkgYZjrk6JoIQ
	OT6L4OnT1Y+48EUoHZ94cw44g3sFqXemTRZ3vwgDreLswWqbkc6npfvqGBysm3xkvFSlaQgsJ83zh
	DviDMC13d2J1umhoitaLCh8ciBG+I2Z7DnbdyqdIW1qCymHTDGFlPz/p5TiS+q7/mJn5DQc9w5G7N
	rXoSCWhRYoS5OdzFBEPbyyla1q8OMUyrmYrGmhXVCsYM8qonBCMcX+8e8itsp7rUD3uayNY4Sfi3w
	HZtst128uVR45+FPP7qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfHlw-0006x6-J9; Mon, 24 Jun 2019 05:44:08 +0000
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfHlu-0006sF-4K; Mon, 24 Jun 2019 05:44:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 15/17] riscv: use the correct interrupt levels for M-mode
Date: Mon, 24 Jun 2019 07:43:09 +0200
Message-Id: <20190624054311.30256-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624054311.30256-1-hch@lst.de>
References: <20190624054311.30256-1-hch@lst.de>
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
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
