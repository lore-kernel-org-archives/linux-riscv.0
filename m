Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFDF8C6379D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A661220872
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v+O1DCXX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="erbEhKUZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A661220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=v+O1DCXXBDyYrRXBxfYTaQ0kP
	aqEgM4MLm+Rsn5ai4DQjkRA5r6JmNnaRHX68VY3eClKKKVIR6CWEA4EV3Q0RVFmSqgRYMzgALjQKs
	rR4t+cnzmvJZhavnMkxuUVb4NbObt5jrImJWDyjmIJC3lve9t8DNZVN9Z3vnmzgOm26/k/KlkD6D8
	JQcqgNa6/J2Hq+GuaAm3YoaeG/Mk0QvLiLyav9dTlLkofkACST5gyLTXgDjWbqqmPTSkExeOHRRF5
	9LLIJ7JXDW+HQmnot03op+VXo58ap5wPHCa9V88MjxgJ0o1QHeN6fHGipMXyoM8lqmh2TFT7erD2f
	bgfMWnM4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJN9-0000df-Rp; Sat, 07 Nov 2020 08:14:56 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJN4-0000PH-PV
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736890; x=1636272890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=erbEhKUZuhNnxcALIHqNYaH8/th/3eoH8yHrE04w8VTjO0lvhyqrQ+ZZ
 XJToDacwc4NumFUN/8D2I10CcfvwFowjPnPOphDns3X1M55b4k53YxsYN
 8diPsts/3W9Vlrtfq8AcdaKqXN9f6v/f+0NaSqjMja4RyGF35MOK4C+Kz
 wu+MU3229MaU8QNYSP1/gC3lfw0V+8T75LfOXbAXQQeNwVkr316RtcyJw
 5oVrKkIWJovZ51zccZoeK7ltKxhQs30PyJnNHhSW/1R4C+ei129VoThpb
 gGvCsRgyp2T5idpc5Tx5s1d3Ou8RXOBrU0a4dUmU1a5PnAGs6m3cXtIiH A==;
IronPort-SDR: tlUJOTIQsk2ctvVEt6JeIDIdd03mT1lgiNSQyVwfsrt6eeVFRPIuY4EyNVIa5ImN0cd6Gkgidv
 Oh1VM7b71nOo3H6z6+i/OWodzo8vInYa9NJVt1RXNcSFDBCJwVI7KSjQLDHm0pPcvw1PT3SGPb
 Uo2AGqeerCQZDoHsTWrae/nxVXomKe0LzdP76FptUAj7rnHX2ge7N+JIvKDGBI/Bx2QLRJbQBR
 tCnF7iBzqcBLDCUrW3qKjK3ywK7Ci8IyCceBI2GkWs4i+Q5boioocIbn69Z5IfbOnkoVVjt2Oy
 eD0=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079286"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:50 +0800
IronPort-SDR: EdElCW05DypQwBmDi7FQNNyp2931mocf9q2HFUeimjn0afwBn3+50dxyALX6peEPiwhXET6kLP
 eId6C5XjIESm/OsMUoiuTHAb74bX7QXwHiDiekcOhRRPpoYULOjezy87icJ5QeNXd+pbiaO6La
 ld6F2TSINypN5tIUeZrD3h2jNLQrzAXHLZDT/IL7WFc/QK0I6D+uuUbTa8/5j50Nc+ubn96EPx
 WxplKbNlQPKlpu+9v7eLwPGDsWQNqf2g0y3KqbDRd/QdxuflloI1cWr7Iwu18Gl/94wXZEytbC
 +JNOP289JrzOF61DSzX/9gHB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:54 -0800
IronPort-SDR: tCjB9lyCTe615202gVJFGQD2Y1XtiyOayZe8caLQvPWA5qCK2cJsOQjBAV+Wsi0GvUv4r7vhmG
 SPV1z3bYORy+DveiSCH9wrzxwQIBzgmN08HeP9OxANTgZQmwqqO53jsrT8+P+dYIvI+SfglE1/
 xD4scmp5HEwA98e3HKCYS5E9BjH3hLhT+KvW4IaAOFJ5ObdvKk1u5QHnov7/bjiKf80JCD+yrd
 ZEMVDU+97kwgqPUh5eDk9o54PFRbXzdnhR4cgHQ6qXMRqnQzIn6N4rxzBABsB3xqoTTDGUpLeM
 tOI=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:48 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 10/32] riscv: Fix sifive serial driver
Date: Sat,  7 Nov 2020 17:13:58 +0900
Message-Id: <20201107081420.60325-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031451_022038_7A32B9B9 
X-CRM114-Status: GOOD (  12.16  )
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
