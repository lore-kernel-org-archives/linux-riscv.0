Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2413BC4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3302339D
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 12:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3302339D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3dK8OwXSN9WMPfBJ984I+dr04XLMdlZoTI3WZIze9+M=; b=q2Cx3agO9iQpZEhTtq9o3TTUi
	f9fef+kaX8u09CE/dXf9u2fk/8w3qhK1FpFnp/lSBxpIT6sx3ZAX1xGYPSOeaEucECiofNgTF3i1L
	GV0m3uGoi5KJunhgnLdy70aODUXQ5HTlMGoFOEemzkT1ohL8tfDoK+msUYkLu63CCWC+9I5BpvkKI
	z/XrmaEbgsXmUO6PsGkpo8kmo30zEXi3r/1QKz/U+Q7Jf8yfe2HR5JPmq8JM2Uglt9aXweGeqUYJz
	yvjGv+UCnoU4rOZgHr+OpRZPkOeNpz5cBOwt1X5zFHQMzMAzmP1zM6AvX2t4hwxVNUxQw0MukTGBl
	cWfnqQUpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmFRC-000060-N5; Mon, 07 Dec 2020 12:16:18 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmFRA-00005B-Og
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607343376; x=1638879376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TJec6laP3U2dQpM29pTaje0RjHN/42bGkpbwVNqFEHE=;
 b=vM8OcrXZV+BkTemxSmXrW3slyMgJta+LOOrryCQRA0n4WzsbAj8Yjhue
 /kMysBEvEengaiEd/vtQSXHqgv/GvP7w3IqG42m3y5p9glww93LTCT8Tz
 28cxMlOjuW5vPpj/Tpoy4z6vVPbNyybRaii6JvS6Euhr2eFk2W4A77X42
 vLI39NuIDETAb8LnjFS9PXrJ/ezNFaztgljpiUGajTl063XcLoREjdNsp
 u/JDR3dy3TdO3jY6OBUHq5aRXuISJbQpE2LWtkOOnHts7C7zdcC4gzS3K
 z3aqx/6vmO0V06uLlEL1vcc4GxYndHpyQ/9NHE1Qy8vq9RTdDs15vCIog Q==;
IronPort-SDR: G3xpn1h0+A4rL9uuIK8v9diM/D/BJQWjlAyN+8NgcvJC4w+ywqBGCRHufMiyB/2Aauxh/yUpIR
 n0j6/khuLgBSKcb0bL2cvmcwM6Jek14caEp2I3OwxpelBv/IuPB6LLbR9GeBOBED6drom7Iaea
 BriKCeKLI7oqLVX4t6u0iwqqGVV/Ml2UIAMn0FwR9TmxZmSij4YVmgYVdXe9w7qAkYlm8tkzan
 pxve9DTxV8kmE8KeWixVOd6miH1PaTUpr7FlIP2q4nrUKF6KLMDRWCH/QMCwrGPwQ+V4e9eUyX
 84w=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="106497470"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 05:16:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 05:16:14 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Mon, 7 Dec 2020 05:16:08 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <robh+dt@kernel.org>,
 <nicolas.ferre@microchip.com>, <linux@armlinux.org.uk>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>
Subject: [PATCH v2 4/8] net: macb: unprepare clocks in case of failure
Date: Mon, 7 Dec 2020 14:15:29 +0200
Message-ID: <1607343333-26552-5-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
References: <1607343333-26552-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_071616_952232_FC711C40 
X-CRM114-Status: GOOD (  12.98  )
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
 drivers/net/ethernet/cadence/macb_main.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6b8e1109dfd3..deb232801edb 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4413,8 +4413,10 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 		return err;
 
 	mgmt = devm_kzalloc(&pdev->dev, sizeof(*mgmt), GFP_KERNEL);
-	if (!mgmt)
-		return -ENOMEM;
+	if (!mgmt) {
+		err = -ENOMEM;
+		goto err_disable_clks;
+	}
 
 	init.name = "sifive-gemgxl-mgmt";
 	init.ops = &fu540_c000_ops;
@@ -4425,16 +4427,26 @@ static int fu540_c000_clk_init(struct platform_device *pdev, struct clk **pclk,
 	mgmt->hw.init = &init;
 
 	*tx_clk = devm_clk_register(&pdev->dev, &mgmt->hw);
-	if (IS_ERR(*tx_clk))
-		return PTR_ERR(*tx_clk);
+	if (IS_ERR(*tx_clk)) {
+		err = PTR_ERR(*tx_clk);
+		goto err_disable_clks;
+	}
 
 	err = clk_prepare_enable(*tx_clk);
-	if (err)
+	if (err) {
 		dev_err(&pdev->dev, "failed to enable tx_clk (%u)\n", err);
-	else
+		*tx_clk = NULL;
+		goto err_disable_clks;
+	} else {
 		dev_info(&pdev->dev, "Registered clk switch '%s'\n", init.name);
+	}
 
 	return 0;
+
+err_disable_clks:
+	macb_clks_disable(*pclk, *hclk, *tx_clk, *rx_clk, *tsu_clk);
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
