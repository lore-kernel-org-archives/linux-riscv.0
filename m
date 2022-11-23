Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B176AC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ABCK793+ydsw5t4kVR/stvWpLQPM9aIfv9zBPM1ww4A=; b=woA2+eulnRkQiY
	qqVh67wqeYjSBXkm7Ys3u6f7JlONL/02CvACqWPe/3qFR3kpJB+gluUagbviic4kk+KNIK57YHzbA
	LNts95epd3BBYGbEoT6xTOcpaydNVg4Kt+nQRANJaI9g/lsAGhjBIfc0ikLBhhjPXCnlVBgrFpQY1
	P+13BJn20Bl1w52rwjzxRFul1yvIiSE9aqUgyEL7yRPxwI1ws+D9jHMqmDc2nMjuHWtX1D0M7MPgB
	7CWsNcgDip2Is2xVhcX8eTspwB1xphE1CxFP8p8RAqE4H3BlmpN0gwUJUPM+KZ+lAOeynzRG+Glxz
	qoRej8OfI6ZALy4ZpxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtzi-001MDz-B0; Wed, 23 Nov 2022 17:57:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtze-001MBQ-Qn
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:57:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E31E61E36;
	Wed, 23 Nov 2022 17:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A4FC433C1;
	Wed, 23 Nov 2022 17:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669226225;
	bh=Qtzc1cobsjubwRvtdGwHlSQ/wf5MdQwUif68mEyoqSU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQ4JJSB/XOtyPKOjZ1GrOhpinUo5woM9ghzuWgxkGNn6nquKVhFEH0Oc9zXsyPxyr
	 h461ekvrnW3s/gZKpwj8f2NcWktzAFaauDJMuNt8k+yNB43iy4DoVXt3PodhdqINs0
	 r+du0fRqP/EFf9OUVkSaZDoTn1kOkvNSxpT3BibR0cuS88szRrXi/0Zii5ZewIhRlV
	 UDeIi7A0sQ5bO0UJqSo8GaYLQVmR8J0KwjM6jn0fe3fJwXockgcQJpY1goGijNQvIH
	 JGuHunYoiyohF20Htz04jlP0ax32f0+U5lh005WgSLFlzDW01LzDG5d107DgLd4BZA
	 nVEQmCsXReUrg==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] mailbox: mpfs: read the system controller's status
Date: Wed, 23 Nov 2022 17:56:52 +0000
Message-Id: <20221123175652.327859-3-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123175652.327859-1-conor@kernel.org>
References: <20221123175652.327859-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_095707_032602_516AD44A 
X-CRM114-Status: GOOD (  24.38  )
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

There's an existing, but unused, #define for the mailbox mask - but it
was incorrect. It was doing a GENMASK_ULL(32, 16) which should've just
been a GENMASK(31, 16), so fix that up and start using it.

Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index cfacb3f320a6..853901acaeec 100644
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
@@ -56,7 +56,7 @@
 #define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
 
 #define SCB_STATUS_POS (16)
-#define SCB_STATUS_MASK GENMASK_ULL(SCB_STATUS_POS + SCB_MASK_WIDTH, SCB_STATUS_POS)
+#define SCB_STATUS_MASK GENMASK(SCB_STATUS_POS + SCB_MASK_WIDTH - 1, SCB_STATUS_POS)
 
 struct mpfs_mbox {
 	struct mbox_controller controller;
@@ -130,13 +130,38 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
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
+	response->resp_status = (status & SCB_STATUS_MASK) >> SCB_STATUS_POS;
+	if (response->resp_status)
+		return;
+
 	if (!mpfs_mbox_busy(mbox)) {
 		for (i = 0; i < num_words; i++) {
 			response->resp_msg[i] =
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
