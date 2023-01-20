Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E894DC25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FIlNPKpqIFvoF3iNJqLtM4OLSojHj6WAl6g2jAVpb0=; b=U/xa8FG3WbAaBx
	syivDCwmqX6QMV297rpOTcatEvh6jG38Hj/YGIxjPS9Stz4E3/r9LHoZNF8L8a9BEx/OLfHEkMqex
	s3NQuUYRDb2E7SBiNqoSEcv1advis7xdyvqm0jgQjbYQyyd+KGzhOzlq4hSBkpW+Pp35FnzkatfRp
	Y3t2Llxhe/URrYpWbBmeqCsG91/naqqmrIFeD/lCz2NUUhiJhEit72bpz31SNvXQgT7GwVhh7Knud
	vflc1yT/ZzB4nGET+CtSs0rmlAo2yhoSv1rgNoHXYn7bhX58UwLA2+odE8BlP7+gh7Oj4NLGAbN+w
	JfjR7i6wuNVKLHIAzOgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsYe-00AlGb-Vb; Fri, 20 Jan 2023 14:39:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsX9-00AkR5-IW
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225503; x=1705761503;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oYx+ncPt3aXXBAx6eIW+t/dOXcIk5sAoEFiHLkKETcY=;
  b=mYVdSepH5XeEH52pRfYAkOB2yn1/IOSVbVt/HRJkg7kDe0hcaKDvwVJt
   2VC4Lzm3N1NNSwMR0x8fBPFNq/du5Bt0FlEo/3hgwx+8nAiuAprnYxgd4
   VJwktymVQlfquvb1KU3hcD17rs6QZw279PW/QPISFkjCL7U5XNNcO1dO6
   d1jIhbsrEezGyp/zD6T6yKEt4KtpmActvFLMnTjKDapkMqvnnF670xnUO
   +Nesnka5TTZYzDZM6pmwf6Y+1eYdUJPRQtBQOrRk0kD5ZIU8tZfGpauOP
   KByuYMODIkDxH9cVhyruekXKtfZQREG0OBJc8PecAtBvkG3KBG+qIKe7y
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="197471546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:19 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:18 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 7/7] soc: microchip: mpfs: handle timeouts and failed services differently
Date: Fri, 20 Jan 2023 14:37:35 +0000
Message-ID: <20230120143734.3438755-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063823_699270_9F22ECEB 
X-CRM114-Status: GOOD (  14.96  )
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
index da9cfeda6f78..2dd100ab21b1 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -45,14 +45,25 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 	reinit_completion(&sys_controller->c);
 
 	ret = mbox_send_message(sys_controller->chan, msg);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_warn(sys_controller->client.dev,
+			 "MPFS sys controller service timeout\n");
 		goto out;
+	}
 
 	ret = 0; /* mbox_send_message returns positive integers on success */
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
@@ -110,6 +121,7 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
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
