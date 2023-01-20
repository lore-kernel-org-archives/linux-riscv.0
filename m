Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A13C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSarQS/f87cii62U80hE1elGsd/Gykw95KzwHArrXFs=; b=nL6TuSD0FdspEo
	VFmyPCeYnLB+jt603cGYI547DprjcBrUHXge6wBOshSdEC+gOv+Z6TwARk6odjyPtvJM9d9A94Av7
	jK/SlmLxoJMCRifCL8ZpJrtSGdr4QdNlyueOdl02FA4D2POpmcr6GA2tQjbQcXeJp7cFkTFa0IAI8
	6bXKvI0CypyORFChzZMDkQKzWJAhO0UsnUYhyamzGGOKSbAzxkUug8p346zzYpbu8woWfWUGQwh3U
	7GXpA74HCgSyWaee95kkeCm5aVDyN3mMLoVlDGn6XXagqL1sOWtTDdg1Dj/y9zWmiTZr06duG/byG
	qmo76bQLh0NpADXLT+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsZR-00Alq7-Qj; Fri, 20 Jan 2023 14:40:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsXT-00AkZh-Fl
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225523; x=1705761523;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1o9L/4gS6hFw7QhrPiNy1BOlai1A8GCWCQbQw2g35go=;
  b=hP00YmgmCvB+zcbZNgXqxKrCsoI5JSULRlSqneyyodLOjWsOUMU9nmIh
   jP4Ac2cHNnoTD9WvjNSjpvUhCJBjNIbAfRtk8y3QMA9cXsy7nNG2DBXfr
   Fa5bhyUzoqly/0qbtGW62wOhP+pQukS3elrZDi/ie0E3yF6/J/DJ0jIDV
   C9i7LMcK8+YlXYThyZ39jNrSavicBeE756uUn5ubH4Xqs76LcovBT4r/I
   ZL5ahSJrT+CUWmLWInpBS3aibpYvm0F86a2E9WdzjHVt+ZHeFvHp8eMhM
   fN5F7CNVsrj9rqtWQmoYkfIJvgRbDeJDpp0jWnKWeApH2Z88wc2PzQfIJ
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="208646900"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/7] mailbox: mpfs: switch to txdone_poll
Date: Fri, 20 Jan 2023 14:37:30 +0000
Message-ID: <20230120143734.3438755-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063843_690714_9C39BFAF 
X-CRM114-Status: GOOD (  10.15  )
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

The system controller on PolarFire SoC has no interrupt to signify that
the TX has been completed. The interrupt instead signals that a service
requested by the mailbox client has succeeded. If a service fails, there
will be no interrupt delivered.

Switch to polling the busy register to determine whether transmission
has completed.

Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index d37560e91116..e0e825bdbad9 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -79,6 +79,13 @@ static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
 	return status & SCB_STATUS_BUSY_MASK;
 }
 
+static bool mpfs_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+
+	return !mpfs_mbox_busy(mbox);
+}
+
 static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 {
 	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
@@ -183,7 +190,6 @@ static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
 
 	mpfs_mbox_rx_data(chan);
 
-	mbox_chan_txdone(chan, 0);
 	return IRQ_HANDLED;
 }
 
@@ -213,6 +219,7 @@ static const struct mbox_chan_ops mpfs_mbox_ops = {
 	.send_data = mpfs_mbox_send_data,
 	.startup = mpfs_mbox_startup,
 	.shutdown = mpfs_mbox_shutdown,
+	.last_tx_done = mpfs_mbox_last_tx_done,
 };
 
 static int mpfs_mbox_probe(struct platform_device *pdev)
@@ -248,7 +255,8 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 	mbox->controller.num_chans = 1;
 	mbox->controller.chans = mbox->chans;
 	mbox->controller.ops = &mpfs_mbox_ops;
-	mbox->controller.txdone_irq = true;
+	mbox->controller.txdone_poll = true;
+	mbox->controller.txpoll_period = 10u;
 
 	ret = devm_mbox_controller_register(&pdev->dev, &mbox->controller);
 	if (ret) {
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
