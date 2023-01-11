Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33788C54EBC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvr+Nbin1rcqH9KszwgFrXPntzBvP8TOlRUNUTMJYUQ=; b=U/Mr81AmJgObue
	rgfto+dZRuJwlvrBXAxBL0dM0sFB3qXCWRaJAAW+ZMZLHWqM/lf5NQeEfmCtkxM9mcJWIS3Re9wwf
	fGJKr7OsnJ/4gQenyXaqZj/ckLNuwo8rPcgwwjURVPk1w1cJ6WhIyxNoLzOaj//LS+XldAGYUscI1
	bCj5IC4kEN/Tw6ftN5IPHFNBWajUBP55Q6bFfbO7Y1pyH31yKvGXy8q9iLZJrlsSNpLs1vW6QbOLb
	kRPdmYLPGly926gWc4VBbujWoi/mmqaqEpVRXMN3ndEztbZDy9dXgBiG3S7XxLe6BjkvhPDrn5lSq
	WLNe9hrkeNL/nqFGRtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQh-00BeyR-En; Wed, 11 Jan 2023 13:46:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQc-00Bera-2r
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444766; x=1704980766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dqNf1ACM7VOxiqPM+Nc/J8oy1t3x6F1UdtTIb0rpr7I=;
  b=HsBK4H+lV8KXwBFy01ER/um9sBONdC890Z+wWNMHvnTkggwsxn5R04fY
   NTe7eclokUQPFCLH1IjuMMBILfe7LfGINaK2CliihwosBi86vmUT1Kqq/
   alRYco5Ny+V9l9Z4O84vVAO1vVx3/sXH3fjDVxQqgBux7dTUW/RW6oFva
   TEtAJk35xJaHJicFSJaUT4l4mymUOQEtbeEEUoSs4BFKrgEcvKgWzLtbQ
   BGgOUodsfSEmhbQ+z5+0Ab69lL3J7I49Fr5641OzqQUNPXNlAMoM5Ip2Q
   c1wX7how6tHuSNxJWz9c4qqhXQ1D5v4tGMZazKu9YXJv9tf6+Fzp//xTM
   g==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="131834669"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 6/7] soc: microchip: mpfs: simplify error handling in mpfs_blocking_transaction()
Date: Wed, 11 Jan 2023 13:45:12 +0000
Message-ID: <20230111134513.2495510-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054606_222437_47E2D4B7 
X-CRM114-Status: GOOD (  11.89  )
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

The error handling has a kinda weird nested-if setup that is not really
adding anything. Switch it to more of an early return arrangement as a
predatory step for adding different handing for timeouts and failed
services.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 28 ++++++++++-----------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 738ecd624d64..4aadd05769d2 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -32,28 +32,26 @@ struct mpfs_sys_controller {
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
-	} else {
-		dev_err(sys_controller->client.dev,
-			"mpfs sys controller transaction returned %d\n", ret);
+	if (ret < 0)
+		goto out;
+
+	ret = 0; /* mbox_send_message returns postitive integers on success */
+	if (!wait_for_completion_timeout(&sys_controller->c, timeout)) {
+		ret = -ETIMEDOUT;
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller transaction timeout\n");
 	}
 
+out:
 	mutex_unlock(&transaction_lock);
 
 	return ret;
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
