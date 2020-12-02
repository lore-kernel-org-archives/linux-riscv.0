Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0741BC64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95257221E9
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95257221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=kFgRO0+4eTvj3KI5OloljIv5b
	o4uij1WchZ/TEWFv6/hoJhR6dpnKbPe1CrgF8hi5wpgKGvOdlB009tt6ySkaqkobr6YzK+4FL236W
	jJRAnxcb2WKMAA+0KGUihis3jNTiXIJaP7Qv1Xn5b08+qyvy30knj9aYr+3/Ddx6kUGnGOxeO87yg
	6mYmKPN1rSRIGIoiSME/OYrW16bcVhh1DnKd6LF8BvhRJgBFxtMJ0ho+TQvhVoevtn+e9LhthU6sm
	KcDCjXLQd8jPGyccgEiK8PvJj6tMeUyuBWojCoBp5InId5gAycSHJX9s3MQECqIn3e75CaMhws/+v
	u8dFidzGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIlm-0000py-E3; Wed, 02 Dec 2020 03:25:30 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIli-0000nN-7u
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879525; x=1638415525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=YVKgLKatzeLwX7ekpUa5+VIuaP5zbVJZ54AoFyt+U/8YITYg0Q1DHkOm
 iZV9ehIjOfja289PNY0vju05BfYBgIJ9pSKLG5RT9nHdu88aPgWcYTXhQ
 gpQZiJm6TBrsRk3YQc/NvZqTcvBkwsf3xt2VlKn+262etLo8wY+EdiUVQ
 6AQohi0ywaZf+/PaVnWE8cgoa/uy4cI4+bBFdM2beY+g8vndt7kENBbgG
 BqCdvTlR8NErYgJGA23r0m7LVV8ysoSFruKFD+7+orvYZnHq4XKodEkFQ
 FHYPH4/geEKi7qfQ+QbAN8WZQym5BtLVtnBz9V86wkmGDhaRWLEEBCz+f Q==;
IronPort-SDR: qGJ6tFPSrpCJMM85gy308FC+clqyreDMa+Zsp8m5lWqveBIGw3c7EHgoFlxqShrzex9X1YQAVM
 JVLK+y+wzXAOIV1xfZmXZtsObZipO+/Nqkt8Bk0dWOC9zr/EI6Ih1rnXkJsYmHmMKtULCvw6sO
 LJLdSnizZ0nv3z72xwNGSB/uMM1SAFrAPcLkUEBOcoW9ZVuUkaojM+0mI4k4tABgvLyhHQ1JFG
 IAtJ7a2XYL9yi+942OV2aQ6AG8AIa4yGOHkdf+euWgKa1tpkEno8C4FuaQzLQaMuXKqEH1+tSX
 +yk=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922336"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:09 +0800
IronPort-SDR: 0Q5fAtKj6Fvp2BqQIhf6QwqogWW4YPe/5scXtk7waKTwJp6oI0ASo/L7dwvPmvmbOxbz7UPR8V
 iELiHhd3yqGJstMcbNMLF9RqPG50XVfiU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:10:44 -0800
IronPort-SDR: I3OdHxgW/Xufe4ntS3IGjb42XrHqe7fTZCUvf9jnVp0cV0J/Ml8XfguuInQs0UVSdL3HyeINPn
 VQSmItbPyScA==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:08 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 02/21] riscv: Fix sifive serial driver
Date: Wed,  2 Dec 2020 12:24:41 +0900
Message-Id: <20201202032500.206346-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222526_506175_E021BD2F 
X-CRM114-Status: GOOD (  12.24  )
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
