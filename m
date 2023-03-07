Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427F4C6FD1E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69Ie05hnkQpLOBMFxOR1SC4xevg1ZxtAf083rBX/ka0=; b=ZJj3IzmdOx8iBF
	xufxd4Q1Ly5WiyLBWyy9RgEu8tS5fQftpau6ZDcyKjrvnwRWl+YuLmhf6vthyBnAorhZ0ChdE2Sp7
	pl/GS95b9znEIEQggSg/ZRl5uLdsc5Hfbt7M1mnOhImNkdY4+LKLwsDSOaYwJHdg5NgB63MlLmODk
	lWOrCyY5ROnFMS24Qb2u5+2PmYCTjjIXB1C8M+QXlCie0wEGLhfaB3DJ+zpiYeEkNUJaFsIiXTDpa
	hz+yX2dsf38bDX3kCJlKSuB64MQnFMBOo1HbBS1GqNRfUDhDUxgy3L/X5esnRMBbgIug82yO/ax9R
	x+aO5HCxqxdzlMJOUy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqY-002MUG-Tb; Tue, 07 Mar 2023 20:23:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqV-002MPS-Vi
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C370B81A13;
	Tue,  7 Mar 2023 20:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C12C4339C;
	Tue,  7 Mar 2023 20:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220618;
	bh=zda+VbG39EuOmqkJEqNyN6EQjdt58w158b+x94tcTtA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rNTBs9H86YYrMsI6GY62OKUY/zA+Y/N4//bAkoDBohiDpxWf3xg5Fvuj3jmSgnsYy
	 847gso8bU/q2cYiZE1keCVkfpHTHzYgfdyc6i3gXwOSHZlJMhBxhvQcmp294dgO1Y9
	 smnUpiczFeYWtJuG2zo+5N/mlJgtdI86csYALnq6rArW+1GY5n3ET2TQkw+GmLp8Rm
	 okAAtihHtRyVci0pm0STHpam0M/ms20FbdLvXCBtfrFYs1tgcDkRljYzMuJg/8ncup
	 2u8Z9OH5FbscqGPaPbNu6lDIodWhb4KXVwMZOJivlCSvi6gM8fYhZneZIrGkPAL9hY
	 /brzgVWQSitJA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 8/8] soc: microchip: mpfs: handle timeouts and failed services differently
Date: Tue,  7 Mar 2023 20:22:58 +0000
Message-Id: <20230307202257.1762151-9-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3200; i=conor.dooley@microchip.com; h=from:subject; bh=pwrSJrBRsgiePyr0G5aY+e8m9Q0BM9VvEVyERBwr1ik=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4V5zm27ymprZ7VAkrUva0X8rPMu97a4F7ucz+T22 /UxbM6+jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykgJeRYfpcZy2PGvs1v1cf urPvW+3Mp3MMjA9oXX7pJvrqyvvgW38Z/pe+cf/f52Ir4R5w0Vrc+t/E/v1Sq/i2zS4umpD0t4r 1CRsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122340_344399_B1549F2B 
X-CRM114-Status: GOOD (  20.34  )
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

The system controller will only deliver an interrupt if a service
succeeds. This leaves us in the unfortunate position with current code
where there is no way to differentiate between a legitimate timeout
where the service has not completed & where it has completed, but
failed.

mbox_send_message() has its own completion, and it will time out of the
system controller does not lower the busy flag. In this case, a timeout
has occurred and the error can be propagated back to the caller.

If the busy flag is lowered, but no interrupt has arrived to trigger the
rx callback, the service can be deemed to have failed. Report -EBADMSG
in this case so that callers can differentiate.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 27 +++++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index e61ba9b7aae3..ceaeebc1fc6b 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -18,7 +18,11 @@
 #include <linux/platform_device.h>
 #include <soc/microchip/mpfs.h>
 
-#define MPFS_SYS_CTRL_TIMEOUT_MS 100
+/*
+ * This timeout must be long, as some services (example: image authentication)
+ * take significant time to complete
+ */
+#define MPFS_SYS_CTRL_TIMEOUT_MS 30000
 
 static DEFINE_MUTEX(transaction_lock);
 
@@ -41,14 +45,26 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	reinit_completion(&sys_controller->c);
 
 	ret = mbox_send_message(sys_controller->chan, msg);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_warn(sys_controller->client.dev, "MPFS sys controller service timeout\n");
 		goto out;
+	}
 
+	/*
+	 * Unfortunately, the system controller will only deliver an interrupt
+	 * if a service succeeds. mbox_send_message() will block until the busy
+	 * flag is gone. If the busy flag is gone but no interrupt has arrived
+	 * to trigger the rx callback then the service can be deemed to have
+	 * failed.
+	 * The caller can then interrogate msg::response::resp_status to
+	 * determine the cause of the failure.
+	 * mbox_send_message() returns positive integers in the success path, so
+	 * ret needs to be cleared if we do get an interrupt.
+	 */
 	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
-		ret = -ETIMEDOUT;
-		dev_warn(sys_controller->client.dev, "MPFS sys controller transaction timeout\n");
+		ret = -EBADMSG;
+		dev_warn(sys_controller->client.dev, "MPFS sys controller service failed\n");
 	} else {
-		/* mbox_send_message() returns positive integers on success */
 		ret = 0;
 	}
 
@@ -107,6 +123,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 	sys_controller->client.dev = dev;
 	sys_controller->client.rx_callback = rx_callback;
 	sys_controller->client.tx_block = 1U;
+	sys_controller->client.tx_tout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 
 	sys_controller->chan = mbox_request_channel(&sys_controller->client, 0);
 	if (IS_ERR(sys_controller->chan)) {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
