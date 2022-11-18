Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6588C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 22:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bumb88ZnHfhCLYI5fhNozzCG1Evo8Yeg3rnHpF0PT5w=; b=g3wzM3p1nPo45E
	9v7pXmXN63RbHzp0CPhtayxawlDBI0YqHGXCKpIvMNXN3vnWn1yqCVlLwXpt4HTZkgYqu8BQhUhsO
	YFwarv8Xsc8XBWxlDQ0pfojgmzTF0+bm+zjmFRD5vuo1pxYs8bzAZavnA2wUZfXiVmr84mU4NJz9x
	bHAV8TazrAIYW0LKj+MS/M6UzOym0jA56V0IHBi+kPce3dpm3aFwYhf4w13Kt6iYVAcoB6Jt6wCw9
	OBe07qgH5rMvaS3njWi7rwarqd1PJ81lYvmD65PTUWkobURLxmTXbBj1qAMk4AC0izAsz065a83nm
	+R7KdiaePxPBFgBiE2lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jY-008kl5-EO; Fri, 18 Nov 2022 22:21:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9jT-008kin-Rr
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 22:21:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0ECD1B82563;
	Fri, 18 Nov 2022 22:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF7CC433C1;
	Fri, 18 Nov 2022 22:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668810069;
	bh=K4TWLp30MXq/vlUO4bYw+Yxu6jQkHHR0g0VL9tJJy0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aHlBYrVzekL56zjVEHQIDbk21QpS5JB4djm47cUUTIl9N3czKaqcJCOvQ371Efp7X
	 bgEg21np2uyEsEIkbB/bOUB1AKsw3qRwD+WlYzSuULyunEDetNHGpgT4TDLoguKwgo
	 7Od7J0jF97Jqk3sQtrikDjxMUZic+fpnByt5H1C7bg15QvTMr1txfzVNqeBYg6LGJ5
	 P/noDLVDp84yQ9rHJdJz2LqpPVKJN9r4r1hd1RJ+jlw74jjgg6qZ8HA4W5fGPUFYpJ
	 1Nde3oLOLxmIUyn7Ne8u1Ay2F8rG0S5Zf0zQcohRJaYsBk8uGktrrbtNG1FChQNU91
	 deNda9hb8pYZQ==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mailbox: mpfs: read the system controller's status
Date: Fri, 18 Nov 2022 22:20:44 +0000
Message-Id: <20221118222043.1214776-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118222043.1214776-1-conor@kernel.org>
References: <20221118222043.1214776-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_142112_240510_C09DFCB0 
X-CRM114-Status: GOOD (  22.40  )
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

Some services explicitly return an error code in their response, but
others rely on the system controller to set a status in its status
register. The meaning of the bits varies based on what service is
requested, so pass it back up to the driver that requested the service
in the first place. The field in the message struct already existed, but
was unused until now.

If the system controller is busy, in which case we should never actually
be in the interrupt handler, or if the service fails the mailbox itself
should not be read. Callers should check the status before operating on
the response.

Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index cfacb3f320a6..6b99abac0b11 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -2,7 +2,7 @@
 /*
  * Microchip PolarFire SoC (MPFS) system controller/mailbox controller driver
  *
- * Copyright (c) 2020 Microchip Corporation. All rights reserved.
+ * Copyright (c) 2020-2022 Microchip Corporation. All rights reserved.
  *
  * Author: Conor Dooley <conor.dooley@microchip.com>
  *
@@ -23,6 +23,8 @@
 #define MAILBOX_REG_OFFSET		0x800u
 #define MSS_SYS_MAILBOX_DATA_OFFSET	0u
 #define SCB_MASK_WIDTH			16u
+#define SCB_STATUS_SHIFT		16u
+#define SCB_STATUS_MASK			GENMASK(31, SCB_STATUS_SHIFT)
 
 /* SCBCTRL service control register */
 
@@ -130,13 +132,38 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
 	struct mpfs_mss_response *response = mbox->response;
 	u16 num_words = ALIGN((response->resp_size), (4)) / 4U;
-	u32 i;
+	u32 i, status;
 
 	if (!response->resp_msg) {
 		dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
 		return;
 	}
 
+	/*
+	 * The status is stored in bits 31:16 of the SERVICES_SR register.
+	 * It is only valid when BUSY == 0.
+	 * We should *never* get an interrupt while the controller is
+	 * still in the busy state. If we do, something has gone badly
+	 * wrong & the content of the mailbox would not be valid.
+	 */
+	if (mpfs_mbox_busy(mbox)) {
+		dev_err(mbox->dev, "got an interrupt but system controller is busy\n");
+		response->resp_status = 0xDEAD;
+		return;
+	}
+
+	status = readl_relaxed(mbox->ctrl_base + SERVICES_SR_OFFSET);
+
+	/*
+	 * If the status of the individual servers is non-zero, the service has
+	 * failed. The contents of the mailbox at this point are not be valid,
+	 * so don't bother reading them. Set the status so that the driver
+	 * implementing the service can handle the result.
+	 */
+	response->resp_status = (status & SCB_STATUS_MASK) >> SCB_STATUS_SHIFT;
+	if (response->resp_status)
+		return;
+
 	if (!mpfs_mbox_busy(mbox)) {
 		for (i = 0; i < num_words; i++) {
 			response->resp_msg[i] =
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
