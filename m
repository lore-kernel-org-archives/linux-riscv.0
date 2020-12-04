Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467E0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B9A22A99
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 12:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B9A22A99
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wu9p9F5OKTEMCayMM3vvWU5ItKEbqAt935EMEObkOOU=; b=28dgU/1mZ0v3vqzH5vI8LTgsz
	cSPsTL9Gzt2A9PN4mnQiYXETuwoCiG/PqDXISBbPE0ibfZfACrygiaxF3YSApD/vas4ySZnIueikc
	tZzzR/Dpj2NNMAGVJDVSH058TZjuyV5578R+ZC+EAQTfKkW3LJdETjqttu44thrIGGQVFEkBTy9Q7
	r2WZWPDWLYxZig7KOQPsqkGlINVkVVtWF3i5RDKEw5BoOIeh3ouOKVXPxZ9mW8Fld8KTSMLv05Szz
	/4dbfaXGOpY71nQdObL43sa/bdoxO6UpgIvwTi/pWlF7XJ3qbSiAWloCpFGn37wsNvL5Aci2dUjBD
	UukU4N7mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klAIb-0000Ot-DZ; Fri, 04 Dec 2020 12:34:57 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klAIY-0000O6-Ad
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 12:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607085294; x=1638621294;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZYRrAJmxsOLG1C4vggyXLYq/gsMVkhtO66yVO0ElffY=;
 b=XZvW75Ly584nKD2iQqishkrvWyJNw0P4l1S2/yYCHCBuDMHaNUePzBV+
 sUH4qa4S0s4oG96zfxoHSH1sa9aK96IEzhd4yN7VeKj6fvS+xcZMEYFHS
 BvmdULqOuiEN9g3WVbvRdWandIi+Vd/Au70APDkjn5hiRRpKAGbj+NYtk
 6Fxdc4hqnhZh8WxjxtDjuHdmjFNCc31HMMCxOQ7ZjKz2hWD7GUBZuj9oY
 4tNhPzFaklNiBc+SxOGvzqKWQ89ITnE1g3T0XBKJsTFkdtEKUPwl1aqfx
 BaNTp8h+0eQJR46qq7wZ4Dn1KJQ2NXz2ltycXuu6Uwq9JByCxDDOH4BGL A==;
IronPort-SDR: 4AgOSzrzKBHkNPgP4TDvpq/4MMDbEvMfa3ctVdWJtakul0osZdMjb+zVwKWIiNNrFbzI9gkAJO
 umP64wCuPfZhOB2sNZepGIbCzxP58WCy7dbGMgkm/JngK3qXPhHfyrO55PDJ4dkIBCzN81YoW7
 46nx8e5US0pZVDZPISgMh6coklxQGZeV0eJqPHEggAC5GvRAFeTXvEbjNiW3dz8IKvAVs60Bto
 Ke54RAUK0aF0JW3Zf6qVFSN7JCR/QuMSQD1LCVct8xbGMpYICNdIBxb9KiHnmmzCyG8URFuzfj
 k1c=
X-IronPort-AV: E=Sophos;i="5.78,392,1599548400"; d="scan'208";a="36120031"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Dec 2020 05:34:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 4 Dec 2020 05:34:52 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 4 Dec 2020 05:34:48 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH 3/7] net: macb: unprepare clocks in case of failure
Date: Fri, 4 Dec 2020 14:34:17 +0200
Message-ID: <1607085261-25255-4-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_073454_534553_B17C296C 
X-CRM114-Status: GOOD (  12.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, yash.shah@sifive.com,
 linux-riscv@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Unprepare clocks in case of any failure in fu540_c000_clk_init().

Fixes: c218ad559020 ("macb: Add support for SiFive FU540-C000")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index b23e986ac6dc..29d144690b3b 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4406,8 +4406,10 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 		return err;
 
 	mgmt = devm_kzalloc(&pdev->dev, sizeof(*mgmt), GFP_KERNEL);
-	if (!mgmt)
-		return -ENOMEM;
+	if (!mgmt) {
+		err = -ENOMEM;
+		goto err_disable_clocks;
+	}
 
 	init.name = "sifive-gemgxl-mgmt";
 	init.ops = &fu540_c000_ops;
@@ -4418,16 +4420,29 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 	mgmt->hw.init = &init;
 
 	*tx_clk = devm_clk_register(&pdev->dev, &mgmt->hw);
-	if (IS_ERR(*tx_clk))
-		return PTR_ERR(*tx_clk);
+	if (IS_ERR(*tx_clk)) {
+		err = PTR_ERR(*tx_clk);
+		goto err_disable_clocks;
+	}
 
 	err = clk_prepare_enable(*tx_clk);
-	if (err)
+	if (err) {
 		dev_err(&pdev->dev, "failed to enable tx_clk (%u)\n", err);
-	else
+		goto err_disable_clocks;
+	} else {
 		dev_info(&pdev->dev, "Registered clk switch '%s'\n", init.name);
+	}
 
 	return 0;
+
+err_disable_clocks:
+	clk_disable_unprepare(*tx_clk);
+	clk_disable_unprepare(*hclk);
+	clk_disable_unprepare(*pclk);
+	clk_disable_unprepare(*rx_clk);
+	clk_disable_unprepare(*tsu_clk);
+
+	return err;
 }
 
 static int fu540_c000_init(struct platform_device *pdev)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
