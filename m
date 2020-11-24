Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA5BC8300B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B271020857
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WXtCTjAd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="iVzlIGxE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B271020857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=WXtCTjAdWpFtYnj6YRkWPPPeB
	ulBdlw8/pnuSgQ6GrNqw5i0eAvPJ8P6gFNd+eHrtUTI4obyBXlPUmmb+x8S0KiQGPTOJDOR7033Jx
	mxH2G38WFIJBCaZkASt9uGPE/JSKLdvKHYq4IxDPG3gWtj9e7ReenG2MK6PpXCvw573biJomhsBlu
	4z2DHfJhb5/6YB9dhl8Gx5x5uJ54lDectHBtvOWCH/aogYguZYvxv3xpn6I6uwKOUS0lVFGi5Qv2c
	TE+sQWt72u4ky0pYK7XtGz4DObsCHNOQAmlRnvTwSGv5qHXpzAdcuCnMR6DMxL4BLmGrnGOXLa0OZ
	ItwZOpztA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5F-0007PT-2P; Tue, 24 Nov 2020 04:37:41 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ5A-0007Nj-70
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192656; x=1637728656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=iVzlIGxE3gGCCct84m/tOu/PE9WbbLEWTobfUn1YUXxU505iyZAZZlzh
 MVmSGkzoOHT2LL55sCkAFXK8glr+9f0KZ9w8Ef/6L/H4And0TyN9hVQ7K
 q61kNGVGDPIWh7UdOVnluVr5B2LQES8xAffE8qZc9RIE7IJle5yoRtiII
 v+fuXsWaojxIszSesgOcWeNCut/EMIbF6yytDUK2qug0yjwsmvCGs9oAS
 v11kvxPBzejVfvzew0eULsDJdDokvlWOt+Vs5wEuWrr/L8cQF8D0NwiMI
 C0sCR2TdBr8xJeerc6WgsmDK+uCwwiaPvBIigwu7+wjns3fY7r4sP+3C9 Q==;
IronPort-SDR: ueL1UGTfStEKvXOtvJr4I+jVUVmgH8wEolegxqlgJXlvVIlpbgNMUZNAhRKNSlz5bLSvpQMj6U
 3q/dS3epdl3RdiZ/VeusHo0QKjaYYWVijzuOTPiPPtP46LHoZH6H5iRPwM3av1H185h6PscM9H
 N9bR/Pd7y7KW5CqiImulvrsc1Ca0WJQJnPPKUZHwlF4rb8IH5kDTxlVo6aIQeK8bYPUEPpJgfS
 mbTiOqnok532O2U99WEr8M1bf0Yc9q+4Eo1n5nSG2R5O4keho4zPVuPJbo+9eqpO+HeKig7dX9
 PIQ=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768570"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:35 +0800
IronPort-SDR: KPMO+D4zNzDPuafhqRcz7BCUudPcdsV+qIFQNzvs85tq7pSLRoZFnQR/hrNCRFNo2xy+7MCVCP
 l3/qGJrYejJpUdcQCBwSl1DxS5Ig3HFVg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:21:59 -0800
IronPort-SDR: 5mthMKwGuxuDh6aVUWhJyePDMo4o4xfFoEKtf+jrB75v3fZ5wZFNkyVrWe4TljFiJKs3lAeCXj
 nj0fFfzhElLQ==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:33 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 02/21] riscv: Fix sifive serial driver
Date: Tue, 24 Nov 2020 13:37:09 +0900
Message-Id: <20201124043728.199852-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233736_424549_6148953C 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Setup the port uartclk in sifive_serial_probe() so that the base baud
rate is correctly printed during device probe instead of always showing
"0".  I.e. the probe message is changed from

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 0) is a SiFive UART v0

to the correct:

38000000.serial: ttySIF0 at MMIO 0x38000000 (irq = 1,
base_baud = 115200) is a SiFive UART v0

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/tty/serial/sifive.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4..214bf3086c68 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -999,6 +999,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	/* Set up clock divider */
 	ssp->clkin_rate = clk_get_rate(ssp->clk);
 	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	ssp->port.uartclk = ssp->baud_rate * 16;
 	__ssp_update_div(ssp);
 
 	platform_set_drvdata(pdev, ssp);
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
