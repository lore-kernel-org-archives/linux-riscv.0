Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B702EC46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 13:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5XOrYsIltK1sKwQ2T3i1/1UoFNv/8sadn6pC+IPJCg=; b=K+679C9SfuMKAO
	9e2U+RS3tWDRIc/EP3zSXmGwzfoiqgIp3ECMEkfdG9QjeFFKFx5gwzcgExf7Szyl2wU1R1NqJl5KI
	UgGe8WGT3E6y7ZdX9wxcKHyj2iHgTGH3ZgOVvWGDiKl6QXob6khD2YNNnmRQGgSCM4cizTYJ+4VaG
	H/A0oPbtZCilnLj5w32lY1GAWClJJpbg0YTHWCukxBhASZCf6bIeoqi19U1ML1r+VnXTEqe9rVm1B
	txQjp3bI+43nPRNFniXAjqVnwnwt2tbXUHu95DuiSmTmV9QiKlEX+/sgXH3WOf3GPFY09ChEU3BI0
	6HqJlJRaUYMY4LQhbQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQe-00BewP-D3; Wed, 11 Jan 2023 13:46:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbQa-00Bera-NV
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 13:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673444764; x=1704980764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FCOl+T+5C62VF4k5ASrJAWhazXtjeEzsINHVVaIW+hk=;
  b=SbY4ZurLO4zbPdedNmdvBCcVsPyGoqrsZR9NnL3XbEXEiUc3sQ/n8YP7
   0fdc8VgZUlAPwcUQDygLnRKkcfJkvhq9pBK4W92O7h85sDj1B+jDlcMFd
   jwT4er7YKLaRAVAn7BNwS0WRbfboyl4J+Vho0+7/0rx9SthO0Br9XXWyw
   mMOuyAIS5GalzKQFDt9TVTieA8TvVOBuk0rq78G0TMtP7Lv6h/sNxeTqM
   21LA146/DJIdPzWp1/aKJIEVnHRK0Le2/03eUGJdpzn6qEB26IlBymlkJ
   IlIdGE9jd7lRMxweSdvsvKzlq9dMTGSOu00rpt2i7XeiZQRcXA98/24/X
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="131834650"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 06:45:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 06:45:52 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 06:45:51 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 3/7] mailbox: mpfs: ditch a useless busy check
Date: Wed, 11 Jan 2023 13:45:09 +0000
Message-ID: <20230111134513.2495510-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111134513.2495510-1-conor.dooley@microchip.com>
References: <20230111134513.2495510-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_054604_846792_006D8AA8 
X-CRM114-Status: GOOD (  10.13  )
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
