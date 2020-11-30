Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEDA3C71155
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF33207F7
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 23:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL7pskiK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KqKHoxSN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF33207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=hL7pskiKnzafVvmJHEDtWBWBI
	qqa1L+PFE/V56ZguUMFYE61MghrzzIRyd6YWnu40kZ2mSMnuS7uoWPNyXQtSXdw10iykW7y2tR2f/
	mzSRKMCA30KdHZQqxN8wPL0zLrOgX5fJ3kRinsvygSJg/AHS1tcew77UdHKZj2FfwTnJx7BwKHUp3
	beUTeY1nnfyi5tLkaqpvqq0q7Tx+zSLP14ohpg4kw4G3XUFhMJPwTnwTlvHrDMOafUx1mbIJXxlz9
	ecEAH3fSVnE2uZ141M54HP7UU2IqkJ8STJQWhiydaLcDCE7AiYVfT/Dxv8ydzvg7UokxQuOUqsLp+
	OO07/dBkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsuT-0003Cp-W3; Mon, 30 Nov 2020 23:48:46 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsuP-0003AB-09
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 23:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606780121; x=1638316121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=KqKHoxSNLPXJb+YS4jehYb0Jx1VmlF3rZG3kBiVqoJMfpd6Y2DLaYF3A
 BPKyPIK3ZstMLJebTvD4A4n73naWVT502s218nu5R2kei3xkw9+wRYmrN
 ifr8yw4DQ/nwdjan/nE28hjfQYiLsswpfPtJdzd/TZJGaYmD8D+zwE5W0
 Ed+ad7hH78ZFb0fFx8W6BTQ5svGwt6/3jEz+H3Xqp2pQh0yOGSSqigeFs
 56y+ti7BblVFwCXpAWyqv2Q2A33cwNsYkTe0EYMujmIm4ryr+PafMjEOr
 zGdyzn1wAft8D3i0NHpSw5hrzdPg5c7D+kn8m2xjBYmG+jGcO/dMp+jTD w==;
IronPort-SDR: /5kjBcgahWw/f+uDhxb12SyuIldiArVPJn/GY/UjKB8xrwwHN47qaQLQFuZ2kSeW1LbTTpQRCi
 p9xyJxfkRvijjWqw6Anh6ZgWKe1kCViHVrrzWpRUpC3gEry0fIYwFqM7VElf6S00HI71hw8GCv
 fnLXOYMEAZcj0BCgQoKokdGv7ynq6L15RuMj1YNRpEXuJz9+O1kUmTOBOs+TvImbz6jb2NzDvL
 Igo/mI2BzNcrCAaVsyFTCVyJUEARBd6IVe6eUq9mPhCR3fhQPbhRg2PRF4pzwJF8bffrWuVAfK
 0EA=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="155058244"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 07:48:39 +0800
IronPort-SDR: fHbTiu8V1E2/N/WWKvgpmpGiAnYAwfZCMEt9HJuxC/fIYhg/HQtABTUNBO7sFBPob+XC9NdCLm
 3+tW7qeiJxtJ2JdJDNzU5e1VD5bPHoYK8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 15:34:15 -0800
IronPort-SDR: hvlVHOz/0iZEszrhwcyWuIEJSllGkMd+V3vEMq+WXKp89gnOJeJho2LaYZJzaROy55xSqC/Skl
 V4t6JqLqXw9g==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip01.wdc.com with ESMTP; 30 Nov 2020 15:48:37 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 02/21] riscv: Fix sifive serial driver
Date: Tue,  1 Dec 2020 08:48:10 +0900
Message-Id: <20201130234829.118298-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201130234829.118298-1-damien.lemoal@wdc.com>
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_184841_158481_24E0D3D7 
X-CRM114-Status: GOOD (  14.39  )
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
