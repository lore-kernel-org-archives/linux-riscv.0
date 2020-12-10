Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5BEC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF9123A1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF9123A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+X6Y1Ttt7A2GIyuQD8gKoA8q1kmY9sfyCg0+FcD9pI0=; b=MXB1yvxscw5Jjp1YTgEdkKduS
	lXVrP+zCICMO2dgJ+sguoJK/S7hlzcJsb7fKuOKoCE7qkchjSTr9J0uu0MEfX2I23haw5oOpHSLgc
	BvDIJSO6DvCLqYBTMcI+30AB6eFQrGGK8ijaWUTVMOBcLTV+RUibRBERu2gX7J0LOT7GvBxJhIoR1
	j53wh4IImUIAofyRtInkcmKTrVBFP8HYc+2wSKsFnadjIdb23lIBDiZXtDxqQRGNzWVIdJZZq/Rxq
	qzV+UgFT9J1fJ4UYFlaSaigl3rJDPDjt5pufFTpE1W3iH7CC/DcsB4oNA662KO6Hf91NyMat2z0ie
	zexv0qJ0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCoW-0004Xz-PW; Thu, 10 Dec 2020 03:40:20 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCoU-0004Wg-7h
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571618; x=1639107618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2U65G64UeShjGJVOnYVAq9kfdKwB51xvYK09lHldEg=;
 b=IaUqT51xS3bxqcgbTPqDn6Fc3z6xPYHFzyfure28/MFoGqvDmz1mpoJh
 +NAjMaQxt9P8T6f9MlOpNBb77us+52b4w1EC3rWmBk11gzjNPGgMsnm9Z
 YumMcsTNCmNgFaLhSW82E7GCz/7Td370AEkbZhMgLefsvG2axYvHaXCZ7
 wKYDcqJtBwtNJoytiCQSz8orprJUHLdoVcODx/ZyUQFozj3ZdWjBUs/rv
 EvD/lEBKOLPrmSW51D3GBk9uRDj6jlEWXmIz7quPAT4fVP7DfQckCNMxF
 eXyg9WKNd5FE1CMzotylelCmhqxJzS84UI9byGiBqD+hpoqR0WszWrdEO g==;
IronPort-SDR: clYzLT/eDCA+BlX3iwAAzQSqwGEAiEZsi7ozmD5kPH9Nd1tcu7ip9bHmqCPur3vWhTtbnzRIxq
 NcSyyE4w/j3llTqJmZypz3EU3Vv3z1Io3f+6aMrXGH2irVChYxZXTGKrAsE7DSW9njkhaUK+oz
 0J7Qbs+5s1t5Dj08lMdNPn77c42jALs7zgGvol7yTlk8NzHtzYxgh1qyyDcN943mkddQYGSXMu
 eWOX6qnDU9xpvV/SclzURNT8dHT3VfRENOnuAC+vo5IA17kvvUQKQrHWgDPzCuUfK/ljNSVdd8
 HGU=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813105"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:17 +0800
IronPort-SDR: 7MmpaWVDt09ViL5MPswkznCSSLIAi5cQ42DJyJMT6PG2L+lIGNj4m0X/ZYPkKa1ex/68n3pJTN
 kMrg2UX6HBL5ItJZpaSkXuIggtM9W91co=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:13 -0800
IronPort-SDR: XxOPwkiQzXQt2vNqM9234LBWN3pWe2e5lq0AG9XMnlSwKVWdN0LOK2v3aC+jzH7/9NGYbvct7e
 /0v0UqUcg3uQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:15 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 02/22] riscv: Fix sifive serial driver
Date: Thu, 10 Dec 2020 12:39:43 +0900
Message-Id: <20201210034003.222297-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224018_478136_A13B36A2 
X-CRM114-Status: GOOD (  12.03  )
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
