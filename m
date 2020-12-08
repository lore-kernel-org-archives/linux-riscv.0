Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CECC433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E6C23A69
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:34:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E6C23A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xjmTXat3tuzmc+QOwSjuEPmAKfJSPQSgev697492wUw=; b=jU2ghUxEbj0R0Up2ARXgj6lDV
	9Ko9R8s7vyxnaS2qvK1VcdVjwvMUgyhXR7xeOEw6Twi9+hvHOMD5JF0wo6GAkkyFSfCietuJe7M0T
	+Wlmc4+thgoNnn+/HK5esuIPmh2sr3W+zntaSCEd6coclrPSAqpG1FBc3b+Pq7qd/xLozxKuAnoO3
	qmE3CVc6fZIJmJ7LhWVI16K+QGZkmm35yaj3Kh7Ysb6x551fZ2NKR915bKSnIWUlDP/elYMKvlL16
	xYw6hOOZ9MLskEtu29kXTVXcXcYgz1bmv8/or5dnkrWcUq8iYi4GYZWwu4KS0APKA9lVtfiHmm15N
	w3jVfpzFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXVh-0000AX-1Y; Tue, 08 Dec 2020 07:34:09 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXVe-00007t-DG
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607412846; x=1638948846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ah0+1mEnJdX05Q2mVPorPQhcLW5wBEGXXNi04bnk03g=;
 b=U/2j4N57hDfyNxNu9LX8UQa1f3I6rNQy/z1m1lU7emx5xNZsGEfEftfi
 GhwYK1vDr4/Xyq/0oRet8o73dwwUovY+sIuqdgPgj+W8nKTxS1dhTAA7k
 dvbp4EUgHVYXYfIYVhMy41ywfVDR9AVdAy/D/5VVbud1isEWe79n/E8B5
 /NGSpMDJszAeRS1PoX5Kt/CwkJPpsjU7mCh+/WFPchdi2IXcBqdptHc1r
 1HELPd5/5+N2Mp3Tje0M6jpvUybt8rlXzX65mhjnqUQrN0lyJCvwIVBkJ
 U1JNLARlWcwtOWMWigDNCiy5q5nD9J0xYO1LylRLT8Zw7sb55i++msOfT Q==;
IronPort-SDR: NBPbe/XOkXMnke/kBu1QMyAoyt5DsPMv3xgDCzi3n32ZQ7Y8H6XYdDhbCaRDKd/Ua08XBYbDLI
 6ngUZc6o+q9Cu1f6AY/Di+NOyXlM2PCUxeQtMRNgsgtUixTsba/ggfILD82eE5mvfcQwHtIUpX
 8knrKH4HpqFGAxw+TLgpJLx4J8c5wZ516k/ncVw5xQ1dmBJBQmjo877/D8VvQ/nxHpOWgCHwfn
 vmJ+SpMUSlon5BWwCsIBdTj2Ma9x0mJ6kKmcnNb9IhOZiO8jkfxoRRk8vfNeIjArXQjgJK7pNN
 JHQ=
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; d="scan'208";a="154714882"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Dec 2020 15:34:04 +0800
IronPort-SDR: HbAE7fZL8sLK7crSv7TlcdtBlj+K6mC5PGSpeBWuuGyrsc4G+FAJT7LlXjz/Rzm1pKtO/0ulY2
 G2FQ0+7RwnTyosvHHrMG8z+thQwQLxLVg=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:19:31 -0800
IronPort-SDR: tfRYJrKm89mRd2QjHO/mOmexsW7M0LEZHE5kTlIbGsdDzjkchyCeZWx/YgHIYXFKPepbarIsUz
 KMMkLGiPeYxA==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Dec 2020 23:34:03 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v5 02/21] riscv: Fix sifive serial driver
Date: Tue,  8 Dec 2020 16:33:36 +0900
Message-Id: <20201208073355.40828-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201208073355.40828-1-damien.lemoal@wdc.com>
References: <20201208073355.40828-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_023406_613119_6CBB5158 
X-CRM114-Status: GOOD (  12.13  )
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
