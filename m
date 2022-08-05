Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F662C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Y+xRJL/aULPqLCfJdcBx7mLSwqWpE35GgS5fu9IE7c=; b=ViQIQTCi1qzgSL
	wgCifXKFWRb2X5OR3VOEtlEplbJu/GaWwxiqsUAD8/tAdoD6dp/S3Ckfq9H1L4wKZMG17cHOJJiRE
	jwKbue+1TmxBl5PHl9TQenF1ixhFODmh3X0MOj/Fl6MAFVz+LNPqtMx/fMtx4JUZXZf1g+lROv3rV
	qvazjby3xeK0BsKSD/eQSsDNHNN+SlUfAJl0t7LJVb5Nrc5TG4l8kR0qcBgPbk3ngoCC/y8Udgjm3
	wP8K7PbU7mDwwlICz0u2nVDh0H6bL+eVPFUXzF+UeX8WXb4xTfW4eGYnPC2OjqHdrAbrcRVrUtuqR
	cZTCTRcizrjYfXLgUKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwss-00FBmy-Vb; Fri, 05 Aug 2022 12:56:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJwrv-00FB2N-TE
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 12:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659704159; x=1691240159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Da38opBG4z00BHfm6TpkELk32vGWak8dTjFHtQbetBk=;
  b=f7/cPtd23sMjMHZps8oq5yWPk2r7wY+PfdR2kBWydgWFbgtkcy6E822Y
   FZxfYOLZXmT7BhAcKSQOaCo5UPaBzJqeWAA93Sr4A4urCmOqsm1QozCFG
   c+t2Sva/oXddqcXIMXs47Jw2HC8bci4Oz31ysGg4BV0hfta+L7B2+I9lR
   n1nlbLi5aqboUToqD8MlJjbMdsDKxeUcv5+rJJspUtbJKQUBnNSNYSpts
   ENrB03EfqQM3ro85h6gEaAX7zE/5E6V/wUqey7tEiychXKG9Y5SI7ln/k
   sKxW/VJPQopgNkjkEJ/yV8D1D/N40J0GgnRAUY0XNjLv0HIb1TPDm0cA3
   g==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="175226502"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 05:55:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 05:55:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 5 Aug 2022 05:55:54 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 2/3] mailbox: mpfs: fix handling of the reg property
Date: Fri, 5 Aug 2022 13:56:18 +0100
Message-ID: <20220805125618.733628-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805125618.733628-1-conor.dooley@microchip.com>
References: <20220805125618.733628-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_055600_074843_8F4EF1F8 
X-CRM114-Status: GOOD (  13.88  )
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

The "data" region of the PolarFire SoC's system controller mailbox is
not one continuous register space - the system controller's QSPI sits
between the control and data registers. Split the "data" reg into two
parts: "data" & "control". Optionally get the "data" register address
from the 3rd reg property in the devicetree & fall back to using the
old base + MAILBOX_REG_OFFSET that the current code uses.

Fixes: 83d7b1560810 ("mbox: add polarfire soc system controller mailbox")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 4e34854d1238..e432a8f0d148 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -62,6 +62,7 @@ struct mpfs_mbox {
 	struct mbox_controller controller;
 	struct device *dev;
 	int irq;
+	void __iomem *ctrl_base;
 	void __iomem *mbox_base;
 	void __iomem *int_reg;
 	struct mbox_chan chans[1];
@@ -73,7 +74,7 @@ static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
 {
 	u32 status;
 
-	status = readl_relaxed(mbox->mbox_base + SERVICES_SR_OFFSET);
+	status = readl_relaxed(mbox->ctrl_base + SERVICES_SR_OFFSET);
 
 	return status & SCB_STATUS_BUSY_MASK;
 }
@@ -99,14 +100,13 @@ static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 
 		for (index = 0; index < (msg->cmd_data_size / 4); index++)
 			writel_relaxed(word_buf[index],
-				       mbox->mbox_base + MAILBOX_REG_OFFSET + index * 0x4);
+				       mbox->mbox_base + index * 0x4);
 		if (extra_bits) {
 			u8 i;
 			u8 byte_off = ALIGN_DOWN(msg->cmd_data_size, 4);
 			u8 *byte_buf = msg->cmd_data + byte_off;
 
-			val = readl_relaxed(mbox->mbox_base +
-					    MAILBOX_REG_OFFSET + index * 0x4);
+			val = readl_relaxed(mbox->mbox_base + index * 0x4);
 
 			for (i = 0u; i < extra_bits; i++) {
 				val &= ~(0xffu << (i * 8u));
@@ -114,14 +114,14 @@ static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
 			}
 
 			writel_relaxed(val,
-				       mbox->mbox_base + MAILBOX_REG_OFFSET + index * 0x4);
+				       mbox->mbox_base + index * 0x4);
 		}
 	}
 
 	opt_sel = ((msg->mbox_offset << 7u) | (msg->cmd_opcode & 0x7fu));
 	tx_trigger = (opt_sel << SCB_CTRL_POS) & SCB_CTRL_MASK;
 	tx_trigger |= SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK;
-	writel_relaxed(tx_trigger, mbox->mbox_base + SERVICES_CR_OFFSET);
+	writel_relaxed(tx_trigger, mbox->ctrl_base + SERVICES_CR_OFFSET);
 
 	return 0;
 }
@@ -141,7 +141,7 @@ static void mpfs_mbox_rx_data(struct mbox_chan *chan)
 	if (!mpfs_mbox_busy(mbox)) {
 		for (i = 0; i < num_words; i++) {
 			response->resp_msg[i] =
-				readl_relaxed(mbox->mbox_base + MAILBOX_REG_OFFSET
+				readl_relaxed(mbox->mbox_base
 					      + mbox->resp_offset + i * 0x4);
 		}
 	}
@@ -200,14 +200,18 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	mbox->mbox_base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
-	if (IS_ERR(mbox->mbox_base))
-		return PTR_ERR(mbox->mbox_base);
+	mbox->ctrl_base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
+	if (IS_ERR(mbox->ctrl_base))
+		return PTR_ERR(mbox->ctrl_base);
 
 	mbox->int_reg = devm_platform_get_and_ioremap_resource(pdev, 1, &regs);
 	if (IS_ERR(mbox->int_reg))
 		return PTR_ERR(mbox->int_reg);
 
+	mbox->mbox_base = devm_platform_get_and_ioremap_resource(pdev, 2, &regs);
+	if (IS_ERR(mbox->mbox_base)) // account for the old dt-binding w/ 2 regs
+		mbox->mbox_base = mbox->ctrl_base + MAILBOX_REG_OFFSET;
+
 	mbox->irq = platform_get_irq(pdev, 0);
 	if (mbox->irq < 0)
 		return mbox->irq;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
