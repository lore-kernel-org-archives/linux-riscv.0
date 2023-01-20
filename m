Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5F5C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOvgvIf3QQYbIW+aXJR/ZH3gnzeUlS4KzvDGUXQYeqA=; b=laMeUg/Tj/fu3Z
	ZHUYK2Qj1+XCacT9qZx3qLiRf1J+eMEwrvME0P7ItOF7AI79OxgrMp80bocev8R4OMul9UFv8NlFY
	I86c+0OyzfkIP3GsmBHKBdeEl335Sv53raCIId7xpqFyVrgIb39k3dQv4Uf97cP5gYzFu21oS6Nvr
	1Ol0X7oGcj1mvANWKZoAM6tKP3kOdFCA2itGZudr1KPXB0asWE0JqnFluT0rarIYZauMoBVk0sORy
	yziHumcEnxqOj2b9ZtyI85D/FymiXvKlS3dX5R+DWQGLHDtL+XrpQfxA6wNMobBxx5fo8j2Lh5ulp
	gTyBeRX+prhQXoaoMBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsZU-00Alsp-Q7; Fri, 20 Jan 2023 14:40:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsXk-00Akil-Vx
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225540; x=1705761540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ETrCqr1esSdpLl/whNaGbQbj8ly4dFAvvv640kfUFd4=;
  b=Cxq8Ki7dgAf79FImNhm5wn+TRcVNdxvFXvYMRUMnk97Zo+A1TUKJKmYF
   gi5BWDnkaPSl5p9NWo90LtwOwh/I+dGhSSC4gCWZkkXhAB0D5mq0ihIKg
   rLqWk+YINikoNVe5n1nIZFUVyOC9K5z6gGcs8GYxpJ9nC5wXg8r5HHEea
   KFoUKfRyU+2qElTVTbUP6I3CFTyW5jgMETybvv1j9fRSy/kHD5bvQsrke
   Pd3DVt536K52TdFWcL0H3Fukwxl95bSRTGd7yHoNG31b5vQYUdJ4kBsFi
   Gx95R/ZCep5eK/HZwmlrydc85CJw24gbmnu4qyzEFZ2yZwYOcEq+4VERo
   g==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="208646938"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/7] soc: microchip: mpfs: simplify error handling in mpfs_blocking_transaction()
Date: Fri, 20 Jan 2023 14:37:34 +0000
Message-ID: <20230120143734.3438755-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063901_118772_9D18F284 
X-CRM114-Status: GOOD (  11.45  )
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
index e76a5e38f655..da9cfeda6f78 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -36,28 +36,26 @@ struct mpfs_sys_controller {
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
+	ret = 0; /* mbox_send_message returns positive integers on success */
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
