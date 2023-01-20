Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921CFC25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXQ4ZCG5cBYFDbbQ00BlZ8cC6Gl3V64BImC5oJ7GlJ4=; b=g30sF8jqWx3Rex
	3ZOHCixMUmqoGsBKxAUHfQZ9kI8IqMZ+oMUh1+AzePbccaP7pm8wqXXlYKcToyfohjAvRpI6vq3ba
	eEVHj38pj3OchUE6T9P8srSb0a2GFlRb961bbfhJd4ZGnXsfMSuZWCjEHMnC8MFJCNSZZwsN4xkOz
	KcVBq9bleK05keNYv0E+0XUR3cKVwXYMO7F+LJkh7//vAGFoyGjzJgrC42Fe6utdzbYy83NbuByyI
	TG/7xugFqeqYOQsUoQOQorOgwTRMXUe+pMNXX4jjonrj9CsVQZgI/FymBCMR+AQXVKKiAv54RHGsN
	NwJwPFqEtZmk8rBIA5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsYE-00Al0b-Ot; Fri, 20 Jan 2023 14:39:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsX3-00AkM5-WA
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225497; x=1705761497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vswoNz7W4YNtXxpN9gjNGU8G3StYy1AGUcDydMeUCxM=;
  b=C1mX0euObCmwYB4eYxDx6IFS7iBAkXFXjznBuyU51gzX1tEDf4lcnlns
   bO2GXW3QDTjkrwKuhYtupdfCTD1CwY5NZoHq/01gLerqegc17e6QuS5Bj
   M7XhBbn5ccBGnG7s1RKhq4VZA/lpjwUJzHmFOlmhE591VJmx5AKPi+1Wv
   wAp8pzyqZMR9PYLS0FstK+HyTe0OUrz7tpq/ueNQN6xdf4+LDp/iaIxIu
   KQISz0Wox380baUB2P+k3xnWPIEZ6Hmkg+8p0VWTS8rvAnT/XU4TRzerJ
   C78Fg1dZj6isLUy6ur0PrP1eSv5lcH9OODSN8z90m8GoijXTmfl8aW2Zi
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="196713315"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:16 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/7] soc: microchip: mpfs: use a consistent completion timeout
Date: Fri, 20 Jan 2023 14:37:33 +0000
Message-ID: <20230120143734.3438755-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063818_175904_B8A784F1 
X-CRM114-Status: GOOD (  10.97  )
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

Completion timeouts use jiffies, so passing a number directly will
produce inconsistent timeouts depending on config. Define the timeout in
ms and convert it to jiffies instead.

Since a define is being created where one previously did not exist,
pick a suitable timeout duration. Most services will complete nearly
immediately, but those relating to image verification and re-programming
the FPGA take significant amounts of time. 30 seconds is a suitable
timeout for those situations, although most services will complete in
under 100 ms.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index 12039cb38b33..e76a5e38f655 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -11,12 +11,19 @@
 #include <linux/slab.h>
 #include <linux/kref.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 #include <linux/interrupt.h>
 #include <linux/of_platform.h>
 #include <linux/mailbox_client.h>
 #include <linux/platform_device.h>
 #include <soc/microchip/mpfs.h>
 
+/*
+ * This timeout must be long, as some services (example: image authentication)
+ * take many seconds to complete
+ */
+#define MPFS_SYS_CTRL_TIMEOUT_MS 30000
+
 static DEFINE_MUTEX(transaction_lock);
 
 struct mpfs_sys_controller {
@@ -28,6 +35,7 @@ struct mpfs_sys_controller {
 
 int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct mpfs_mss_msg *msg)
 {
+	unsigned long timeout = msecs_to_jiffies(MPFS_SYS_CTRL_TIMEOUT_MS);
 	int ret, err;
 
 	err = mutex_lock_interruptible(&transaction_lock);
@@ -38,7 +46,7 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, struct
 
 	ret = mbox_send_message(sys_controller->chan, msg);
 	if (ret >= 0) {
-		if (wait_for_completion_timeout(&sys_controller->c, HZ)) {
+		if (wait_for_completion_timeout(&sys_controller->c, timeout)) {
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
