Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF8AC27C7C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5XOrYsIltK1sKwQ2T3i1/1UoFNv/8sadn6pC+IPJCg=; b=Xhp/hI6NlAXkZ8
	JLsvEnWcr4y+m4lWDGjwkzx2bcFPf8plCD3O0zrwEenztvUgNEprOKI2OcmRAMscAxtUqM4HyyfQu
	YEyI1ZS4f60fRq7716ttX/ryVfGExYtgFcx6yYn6jLhUyP/kJT3fqlXFfaVRauR/kJ4gzhFSeVEMS
	Xvh0JTXx0GsokhBPzgx1SA0mP5fP1ykMbPupMNFXZ1EVc5aj2xuW0bx6IgtQwi0E0iWfsPViBNT0C
	XINdOj98O2jSKNifXRjAb+TG2jiuqqTnH2rpdAgzz4TIxCkiH9REWraZmJBfMqwF3+z+ouCApKtla
	RmyiiLpQgFNAj8FQrqRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsXq-00AklK-57; Fri, 20 Jan 2023 14:39:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsX1-00AkM5-3W
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674225494; x=1705761494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FCOl+T+5C62VF4k5ASrJAWhazXtjeEzsINHVVaIW+hk=;
  b=THh8voBAZJSmvMrDn7awRHGb2pg9yBfX/4ctG0T3PYfzqE0XWDngyczd
   5ZdkONEsWNZiG/xHEmKXTjT6IOHLnQL9Fg/ykaOWGrI/CyC0Fgdf+F/6x
   8a1Kqwfth2PzAy+J3T1DULSVZeRsZfpN2aGQLLiKfGU3w0gJlijKJprn3
   VxIiP4rXJF1hqYlm9sE42/ChLxB/5pwUmiBjrTiygsPPfr85cuWsl7vdo
   Qg5heFU/LVj74TihbKRAFDzKvFiX4jaDAoaXfecL/7O39yJCm18RAczYu
   UZz+sM3WMxo2sKDMQsEn+CfNfFL+z7Ss8504soq4sbvdJzIv2SAx14Qao
   w==;
X-IronPort-AV: E=Sophos;i="5.97,232,1669100400"; 
   d="scan'208";a="196713305"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jan 2023 07:38:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 07:38:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 20 Jan 2023 07:38:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/7] mailbox: mpfs: ditch a useless busy check
Date: Fri, 20 Jan 2023 14:37:31 +0000
Message-ID: <20230120143734.3438755-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120143734.3438755-1-conor.dooley@microchip.com>
References: <20230120143734.3438755-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_063815_303567_FED86F0D 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

mpfs_mbox_rx_data() already checks if the system controller is busy
before attempting to do anything, so drop the second check before
reading any data.

No functional change intended.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index e0e825bdbad9..0d176aba3462 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -170,12 +170,10 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	if (response->resp_status)
 		return;
 
-	if (!mpfs_mbox_busy(mbox)) {
-		for (i = 0; i < num_words; i++) {
-			response->resp_msg[i] =
-				readl_relaxed(mbox->mbox_base
-					      + mbox->resp_offset + i * 0x4);
-		}
+	for (i = 0; i < num_words; i++) {
+		response->resp_msg[i] =
+			readl_relaxed(mbox->mbox_base
+				      + mbox->resp_offset + i * 0x4);
 	}
 
 	mbox_chan_received_data(chan, response);
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
