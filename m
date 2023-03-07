Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2282C6FA99
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 20:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gYmWVIaOrwoVNPGAXuhKcMuivxOyR1e4JXjCEV0fHA=; b=l0w4w3n95t2HRS
	WYTZnvkxW9MoApyg9RGmflst5jrdbyWJu33R/OdvRPxn/znPxLIFp2xL61X0dnRW8c52zKj0OaEH7
	UwQZSAG8OQvoiDrELbtSGv/U4o2BFWLdp8gps3UypjYhh3VXYjffy+G/o0CQQ1TFJBFLsWTKMKFFh
	z1MwZ9OUEOlbFOORYVI//H8WnTo/lCGB1DBErBf7Hta2fgWWFSGHYZ8rd+q6OXoe12oUEgE1a2xlX
	sk/bWjcg5d8yDgVxDl8uzwXL+gOa8XC0rhU99FtiHvwGpnspkqdz2zugg6UqMtddgkb3XycpAODVu
	FNh2JmlfR0fnpFCaEEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqX-002MTD-IR; Tue, 07 Mar 2023 20:23:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdqV-002MQY-1h
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 20:23:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B4F8FB81A1D;
	Tue,  7 Mar 2023 20:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1252FC433EF;
	Tue,  7 Mar 2023 20:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678220616;
	bh=Hyj1AzwSvpLlh1c+5n8He7fqMvxbQ+81FBS9Lk+fweU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPzHXOuv7fRzzZAIoUsTGBHAIQ+kSCElxymLxPu3KJJQFNFj82hJ+TYhuGIuXD9SU
	 5jvKSpZiiM7iokRN/p15cNZ5Y1R05X/yXWYbdEvptAkHN5EP8931cZnErgzj4OA9G7
	 Lv2qZ7Ypn+ZVkwh/kpAy9lTEk3yYqLAph4r0mHH+icyhcyOwGzrRWwJU9dcsWaNNdC
	 WH1MYjzvL7pb39MXGy8dHxZ8PTlLSFPRGPGTxbG8YOtTXyLsZiX8/n7zb1VYerk1b/
	 FwfMBTwbUOH+WsKVtcIGg5qVxBJYVebxSfIxTgvaKluWdhva5CvdN3OPSTNs+uDmYe
	 i09pITodsp17Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] soc: microchip: mpfs: simplify error handling in mpfs_blocking_transaction()
Date: Tue,  7 Mar 2023 20:22:57 +0000
Message-Id: <20230307202257.1762151-8-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=conor.dooley@microchip.com; h=from:subject; bh=TiTo00L6NEuRkl9W6QwqcYPRUYBdT9OXo1cRIbTtbsQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnsc4W3n14zrYEnhHdHxbpXh8XmqTFZx2T1bdjlEeM57 zj7Ab3QjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykdRsjw2JPr/llRYzH+bbz 5hX98zlQnnWbfefuAytTfq6ZyVP8MpCRYf+rqHO7WuoyNql/u3MxxbOc0/Xaasmgd4xLfA1/9M9 IZQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_122339_262717_C8427F4F 
X-CRM114-Status: GOOD (  14.00  )
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

The error handling has a kinda weird nested-if setup that is not really
adding anything. Switch it to more of an early return arrangement as a
predatory step for adding different handing for timeouts and failed
services.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 27 ++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 738ecd624d64..e61ba9b7aae3 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -32,28 +32,27 @@ struct mpfs_sys_controller {
 int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct mpfs_mss_msg *msg)
 {
 	unsigned long timeout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
-	int ret, err;
+	int ret;
 
-	err = mutex_lock_interruptible(&transaction_lock);
-	if (err)
-		return err;
+	ret = mutex_lock_interruptible(&transaction_lock);
+	if (ret)
+		return ret;
 
 	reinit_completion(&sys_controller->c);
 
 	ret = mbox_send_message(sys_controller->chan, msg);
-	if (ret >= 0) {
-		if (wait_for_completion_timeout(&sys_controller->c, timeout)) {
-			ret = 0;
-		} else {
-			ret = -ETIMEDOUT;
-			dev_warn(sys_controller->client.dev,
-				 "MPFS sys controller transaction timeout\n");
-		}
+	if (ret < 0)
+		goto out;
+
+	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
+		ret = -ETIMEDOUT;
+		dev_warn(sys_controller->client.dev, "MPFS sys controller transaction timeout\n");
 	} else {
-		dev_err(sys_controller->client.dev,
-			"mpfs sys controller transaction returned %d\n", ret);
+		/* mbox_send_message() returns positive integers on success */
+		ret = 0;
 	}
 
+out:
 	mutex_unlock(&transaction_lock);
 
 	return ret;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
