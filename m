Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6A8C74A44
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c6tBKt1zu1ySsn3GaeeYzGuGUu/VT9Q3tnRdvD8/Dps=; b=epkDIMFoHvi3rX
	LnAyNi717BHGGh9ssau68MFH0DsbPTm1MKBS9hdM5R/IN/iQHgJqhq+A/Y1TngzDG4FEhPGAUtYVv
	Nguq1BS1P8ZXDmtF1v0cVjM9HwOj4c5AKYgMok8i3AbTKFlM/UI6l9UrHxRDatZTD9ftFAUvDOzJO
	X/GHrZ2WRBVFhRVjL8rRWZw8vnJvwi+TqaoyySaFspN73za3hNm6+VZHBpgAkRyd4wS5N8t498Gg/
	S48aBM9O/OH0omtoABYofwckELqvjir85Z16oKqpiwKWXmjibhU09tvY+ii80FPnXn7Y399K6VuOA
	B289kJEOJElFHiLJ/oaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqO-002MNr-T8; Tue, 07 Mar 2023 20:23:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqM-002MMa-4S
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA4E0B81A1F;
	Tue,  7 Mar 2023 20:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EA2C4339E;
	Tue,  7 Mar 2023 20:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220607;
	bh=sx9Ska8GnWbf3HJSlVgv4lIynyLqn9kogPDu8a552jI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HATc+3nZBgpYA7WxgcsLrrwNmWlMvHUUg0l8blmDSDPZMlvnW+Td0ZVFQJk+Bj0k8
	 AhHpJZw7SDYavoRNPxGJEiXx+j2kTT3jMLN3kz1APKIcIwmEQ9lwbmmckGaJ9NnXk7
	 ABwuO8G502gOeWuFDtWt12zFs0qMFc+HVEaQ107uRW1AOzg4IF5t3+gL/iVvi+yZ3N
	 N9UOknTK1+HpIcBick8jlK4gP49QeYT5vE28RkRbNYrhtLTw8iMQzhgebFwB+EX8W1
	 8HTVZbDsAX1Y1SsBd9CSIL1lQ2eab++Y404P4Sy8rHmwYRYL4bRWx0dvr7YVOcGsQT
	 a8I8o8pzvnZLg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/8] mailbox: mpfs: switch to txdone_poll
Date: Tue,  7 Mar 2023 20:22:52 +0000
Message-Id: <20230307202257.1762151-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089; i=conor.dooley@microchip.com; h=from:subject; bh=pqrvE31Z8S43X6j0wjeGX8SFR94cn2rhVr8RYJQR2+M=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4W2PxUvdBePK1wZ+ubiL2b7mqTsytN3p0iYqvNO9 Nx92Seoo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOZO4PhD5/qMzbTpXzH10w1 ratfY/Lr+atDlznLH8XkX5vhMSH/XibDH/5tjKUzDJ6e4N7QmMFyxMvcIC/sVNUxj1Mrei6kqGi ZcwMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122330_480118_7C4F6647 
X-CRM114-Status: GOOD (  13.54  )
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

From: Conor Dooley <conor.dooley@microchip.com>

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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
