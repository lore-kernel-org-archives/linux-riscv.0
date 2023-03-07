Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF4CC678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFdxDKpNHuc2J4hhQXBBsaejK9lXgHNht7sOD5xW2x0=; b=DqXl/CniVTyAMm
	uqAWH3HuX97m+WOeC3T7ivJmkEtiT8L75a/bvBhw+d692J3egBPEQCp/+G6Dw3Rg8SGyrhgCiR6dy
	MvaJ/Ep73WUlBDZ8g+zJkbvgRXql5cH9tkqCbrtfY4xVxNpGR6KTnuCGyx+bQBveht/YF5lvGNKf2
	tg0O46g9GXjksIZ/iWmYUiBPsC4+nwI8A9BAWtNay8w5DGu0t5kPAIOHy6DABx4pSOchc3I3PgFKc
	puC6uY8oSUA5Si0Uo9WHxS34up2qLKJ75zhd7qOAn4ylsBK5fUnm5IPqVOFqUJfU2CgmvavoHM2Fo
	lw2oMgByG4E7PS+OdzZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqT-002MPf-1c; Tue, 07 Mar 2023 20:23:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqP-002MNn-If
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4497CB819C2;
	Tue,  7 Mar 2023 20:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B422EC433D2;
	Tue,  7 Mar 2023 20:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220611;
	bh=5GC6Xd8kpVJdJrXJgNpGEg8xE8m+vrwYddohfQEV6Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s8ZS4K0ejWbpsXZLRFRCKxmQ4WAZftHhv/K8zgGPeaJuMpuztgTiJw8nyaN7wEbo9
	 b8yi6Noir/ArspesdwUwYwnwsn0iNEnipMHaiY7aYiZWl6SaDcRUpAsttm+sDldcTJ
	 7gxhAcL/IdcAepI7KG0cweAjz+G419EuPn8veTX5/nv4WKQ9Pz01IELiovaFxvc6gz
	 1ZC13+KdGdRfChpLFuaGmcoIVMdcnPug/1cGh1pEaTGMkHNw5t/diZz3/NxmuWiYx4
	 LE7kJ1HK6LPgFb9tEwR8oVzzLmz0zko9yE+ilV60x9Hy4G5xUSrCHogoFoVCVAJkwb
	 ZdygT8mW5720w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] mailbox: mpfs: check the service status in .tx_done()
Date: Tue,  7 Mar 2023 20:22:54 +0000
Message-Id: <20230307202257.1762151-5-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3704; i=conor.dooley@microchip.com; h=from:subject; bh=qPU3Aj/HVaUNRSs2BviPXZLOR6A20/dd47WYx9ii+Hk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4WsnV7lmz3Z8qttYi3bP3XuCReyg5iXFPH9tbb74 BNjwmjUUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInMDGRk+HpWR2X74pMnHu5d dSd6XrZM2Pn3dw7kWy5l6OaYqjjfdTfDP4u6W+tETlXGL+TTa3rusV+7xc0hZ93cBd9/ZHjtXB/ 6mB0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122333_934376_C0CF3F5E 
X-CRM114-Status: GOOD (  24.08  )
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

Services are supposed to generate an interrupt once completed, whether
or not they have do so successfully. What appears to be a bug in the
system controller means that interrupts are only generated for
*successful* services.

Currently, the status of a service is only checked in the
mpfs_mbox_rx_data() once an interrupt is received. As it turns out, this
is not really helpful where the potentially buggy behaviour is present,
as we'll only see the status for successes where it is moot anyway.

Jassi suggested moving the check to the .tx_done() callback instead.
This makes sense, as the busy bit that tx_done() is polling will be
lowered on completion, regardless of whether the service passed or
failed.
That allows us to check the status bits for all services, whether they
generate an interrupt or not & pass something more informative than
-EBADMSG back to the drivers implementing individual services.

Suggested-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d176aba3462..162df49654fb 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -82,8 +82,22 @@ static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
 static bool mpfs_mbox_last_tx_done(struct mbox_chan *chan)
 {
 	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+	struct mpfs_mss_response *response = mbox->response;
+	u32 val;
+
+	if (mpfs_mbox_busy(mbox))
+		return false;
+
+	/*
+	 * The service status is stored in bits 31:16 of the SERVICES_SR
+	 * register & is only valid when the system controller is not busy.
+	 * Failed services are intended to generated interrupts, but in reality
+	 * this does not happen, so the status must be checked here.
+	 */
+	val = readl_relaxed(mbox->ctrl_base + SERVICES_SR_OFFSET);
+	response->resp_status = (val & SCB_STATUS_MASK) >> SCB_STATUS_POS;
 
-	return !mpfs_mbox_busy(mbox);
+	return true;
 }
 
 static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -138,7 +152,7 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
 	struct mpfs_mss_response *response = mbox->response;
 	u16 num_words = ALIGN((response->resp_size), (4)) / 4U;
-	u32 i, status;
+	u32 i;
 
 	if (!response->resp_msg) {
 		dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
@@ -146,8 +160,6 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	}
 
 	/*
-	 * The status is stored in bits 31:16 of the SERVICES_SR register.
-	 * It is only valid when BUSY == 0.
 	 * We should *never* get an interrupt while the controller is
 	 * still in the busy state. If we do, something has gone badly
 	 * wrong & the content of the mailbox would not be valid.
@@ -158,18 +170,6 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 		return;
 	}
 
-	status = readl_relaxed(mbox->ctrl_base + SERVICES_SR_OFFSET);
-
-	/*
-	 * If the status of the individual servers is non-zero, the service has
-	 * failed. The contents of the mailbox at this point are not be valid,
-	 * so don't bother reading them. Set the status so that the driver
-	 * implementing the service can handle the result.
-	 */
-	response->resp_status = (status & SCB_STATUS_MASK) >> SCB_STATUS_POS;
-	if (response->resp_status)
-		return;
-
 	for (i = 0; i < num_words; i++) {
 		response->resp_msg[i] =
 			readl_relaxed(mbox->mbox_base
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
