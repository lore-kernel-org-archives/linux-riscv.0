Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D438D4923C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+GLMp4E87b2x5txJ68XYin/c0J3rnoE22XIKeg0lnhw=; b=xhg3fcAH6TcaAw
	WW66EQhODexxcPuSamEl2CDQ0zHAyKWI0NQxXbSKGIBYo1oUgfNui/JSqxiePmilWXGhzAEGrNKqe
	T4RXkkKuBclhqbHktn2fA7TXOH3FKteVtKtgZuKjEZbgzinhzWItieGjhrcki0SSZziwXJnb+YCwd
	0RQYQaD8k/2r+nZpYYqoRH83oSgmXqYaPAGmeUyYXKV2inl2XRTbpsDN9iBeOV9h/j2Oc8J3xC4EG
	6ijx7PbTTDw7+b6wOaFlSIodvrAvCfYp+hdJ4B68ybIZ7vJQHE89VPfenmC0sLtAVOVigOIORy8wb
	f1HCcaTRX8e5sNHzFV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD45F-00000009ylh-3C4o;
	Mon, 18 Nov 2024 15:54:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD45D-00000009yl6-2LkM
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 15:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731945276; x=1763481276;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EkXsvnXYvHDBrDyWxzREH6UlYXBi0F9oMvLf4SjdGAI=;
  b=fkg73wdeLW2/wFgkW/uHJDCvszWdlTT2fuajk0TiBfyIZttEQjF4duW/
   0yxAL0UEcd+SMVVS8ix6gsVgNMvkzh5IlcapUGPmqMNyufjTTS7Xa/SIF
   zFkVKCi6Wmmx0/l7Jj6vTRliN5AoXLEHXMomRWqcD5agKrgLH3TqoSOXk
   QSz0Z/clkRCBKgx2C3LDZoQn3ZYULqgFQfomAwxo/93lFH3i5/+RO4VCM
   Tt4WovIdP8sKwWUAjM7986ejEslsXQ0vPpWUnkB2hhMgQVOvp5OClVCB0
   nC3la6xmcl5bjxAGrRDHQrcOGeQJ6QHZrjzXYfo9O0SvsfGWZHzwrT322
   g==;
X-CSE-ConnectionGUID: qvuwS+dsTduap8NKwvql5Q==
X-CSE-MsgGUID: yVFQ8QXBQTGLlWUbI6XDRg==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="34460916"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 08:54:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 08:54:22 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 08:54:21 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] firmware: microchip: fix UL_IAP lock check in mpfs_auto_update_state()
Date: Mon, 18 Nov 2024 15:53:54 +0000
Message-ID: <20241118155354.697411-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_075435_663982_E4323E95 
X-CRM114-Status: GOOD (  12.45  )
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

To verify that Auto Update is possible, the mpfs_auto_update_state()
function performs a "Query Security Service Request" to the system
controller.

Previously, the check was performed on the first element of the
response message, which was accessed using a 32-bit pointer. This
caused the bitwise operation to reference incorrect data, as the
response should be inspected at the byte level. Fixed this by casting
the response to a  u8 * pointer, ensuring the check correctly inspects
the appropriate byte of the response message.

Additionally, rename "UL_Auto Update" to "UL_IAP" to match the
PolarFire Family System Services User Guide.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 0f7ec8848202..df1d69bdc1d7 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -402,10 +402,10 @@ static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
 		return -EIO;
 
 	/*
-	 * Bit 5 of byte 1 is "UL_Auto Update" & if it is set, Auto Update is
+	 * Bit 5 of byte 1 is "UL_IAP" & if it is set, Auto Update is
 	 * not possible.
 	 */
-	if (response_msg[1] & AUTO_UPDATE_FEATURE_ENABLED)
+	if ((((u8 *)response_msg)[1] & AUTO_UPDATE_FEATURE_ENABLED))
 		return -EPERM;
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
