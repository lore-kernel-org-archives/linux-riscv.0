Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2376C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f39+qnj6OkHAsM+YZgNAtnpeQQybeWlBaPe5JrV8VE=; b=RbcR/IByU6E1dF
	uPvi0yzEveT5EW6cRR+L1OF7Et1vUSbbnT612hJVNNmEzj7rGJvFOzeFnhXhngpPf2r3fnX7cCBet
	/wdjgW1wwK8UqdyQyLmuPlszh3aRo3LOMU7QAIkznjS5Iv+KGzMCqWMiqutP6qCQPGmBIb9cVIoPx
	houB8H0RIa7KAUSTxDh9//B/UvATIiPC+KIehsmcYTiuFQaUXonnwLX5r+A44da9dgG8dwRb3oy2b
	fNLvdQlpMxZDK4PR2S0NGIzFlrO61ZUCFAP4jbSIwm56z9P4x+lqixvbDOBltHkS4qS31BYtNdCmX
	5Rl0sNsV4XPmSQy8ig8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQa-00Betl-D2; Wed, 11 Jan 2023 13:46:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQU-00BerD-FI
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444758; x=1704980758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M0K6BPFNHtGJsQXxOTjDHE/+MPRCH1csScxb1OhpftI=;
  b=IY+z7nnF75FxHIjyUCWASBE/iT77zAxfQ0+7+RFL/5igR8V1dMYlB7/e
   nXgokxFI3ZEMwwhGHnWtKo6QWffS1+uj76NYfJ3tutXMvvK6xisYHXGY1
   iZLIR/lgcm7wnFfbhNdY7slRIngY3zI3xpqV2ebzQj3WpzokZa/VrDgZr
   Mfsvpqa7+qAaztSIkuwXyB988BAJQnULiNXdneMAEAfXH63eTHDRa2Kue
   80Z6MteiZYicH3rBRV4C8E+d4iX0NwfNNQwiHJe6FFz+VqfVwzOClVVuN
   1c5tRlVDhnaVagmeiBpnUQdF+ih9SjiMw9QZ6FFvmTw/4rTLONSCTLGXB
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="207325811"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 7/7] soc: microchip: mpfs: handle timeouts and failed services differently
Date: Wed, 11 Jan 2023 13:45:13 +0000
Message-ID: <20230111134513.2495510-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054558_564752_56DDC7F3 
X-CRM114-Status: GOOD (  15.78  )
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

The system controller will only deliver an interrupt if a service
succeeds. This leaves us in the unfortunate position with current code
where there is no way to differentiate between a legitimate timeout
where the service has not completed & where it has completed, but
failed.

mbox_send_message() has its own completion, and it will time out of the
system controller does not lower the busy flag. In this case, a timeout
has occurred and the error can be propagated back to the caller.

If the busy flag is lowered, but no interrupt has arrived to trigger the
rx callback, the service can be deemed to have failed. Report EBADMSG in
this case so that callers can differentiate.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 4aadd05769d2..75422db75fe5 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -41,14 +41,25 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	reinit_completion(&sys_controller->c);
 
 	ret = mbox_send_message(sys_controller->chan, msg);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller service timeout\n");
 		goto out;
+	}
 
 	ret = 0; /* mbox_send_message returns postitive integers on success */
+
+	/*
+	 * Unfortunately, the system controller will only deliver an interrupt
+	 * if a service succeeds. mbox_send_message() will block until the busy
+	 * flag is gone. If the busy flag is gone but no interrupt has arrived
+	 * to trigger the rx callback then the service can be deemed to have
+	 * failed.
+	 */
 	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
-		ret = -ETIMEDOUT;
+		ret = -EBADMSG;
 		dev_warn(sys_controller->client.dev,
-			 "MPFS sys controller transaction timeout\n");
+			 "MPFS sys controller service failed\n");
 	}
 
 out:
@@ -106,6 +117,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	sys_controller->client.dev = dev;
 	sys_controller->client.rx_callback = rx_callback;
 	sys_controller->client.tx_block = 1U;
+	sys_controller->client.tx_tout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 
 	sys_controller->chan = mbox_request_channel(&sys_controller->client, 0);
 	if (IS_ERR(sys_controller->chan)) {
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
