Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A61C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB21123B85
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB21123B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+X6Y1Ttt7A2GIyuQD8gKoA8q1kmY9sfyCg0+FcD9pI0=; b=rx+htEPgXEUlxf1zsJvy/h3S9
	Da7vrX6EXfw00qs4zrPt9PWOTFNhyE6WQNna9Bid8bCpZJi0taGSJ7ZI9wMGcMD0RRvfegrkALETf
	Kuacdp3fuMzK/Rq21CNxJlrY1bkErNe+FOuEDm2Qyq0ocqACHSLfwArRObKOkaFjww0ykFXsqXM/P
	nxmSay9H6IdAq1jsjEy1En7HYjXCOJgmT/QxcIBsAxl4ydRxlkEnw9vXGTd2ox4LgXI/KYpOOAoAS
	0l2mnD/7KujttiWo/juc4tKtQZySvSqWK56VqrP09oT8n1wx3f6py8v8BqfIVPo+heCqD+8LIBXHx
	Yku8ybVWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMXY-0000NH-U4; Thu, 10 Dec 2020 14:03:28 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXT-0000JJ-77
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609295; x=1639145295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y2U65G64UeShjGJVOnYVAq9kfdKwB51xvYK09lHldEg=;
 b=B5Kqa+ARLa21XMbyO6ci3M6D+8qjNuF+NtCFi8TZUR/UomDVqzRz2Rb9
 hBWGtHugsH73AfFIjn6DBbUVjW9LadcnbPFwUt1NhRYcVdSMWHZbBdi+D
 KtyD5wo3LnJUPniCZ4b1TlFaAth4x9Y59rUmbUsmna4ERgZmEuaDhUD8Q
 UqrnglxdtNLFpnS+sjh6N1LJQevnMeAdOK81c4dcaj/WbrHFXUwVXEO8b
 AqzKWBBXbMb5cGDqn3y+bZRdCl67016AapzsrehNAeoXpbiHO4tf+TSJE
 Soiaf29ZbJOG03LUBPn4y+M0FF3U+pZq5nV1elrQezhRtTVnYFCBjzDjr A==;
IronPort-SDR: +bpPe9J8LWVxe6ymHA9/yhEIMM19psb2D+ewa9svm+UVTXsqQJn0KEiH1fjiTxjWPuQ+PXrkrA
 NEVA1945m9+pX+AvWCFTH8VOE55VZRGbyoNJk01VHqnWE/vi0ujS9unDSqXEaOMEd4hGw8vx12
 0G063fCLqkhh7O71AaaMGS3Po+344JgpkvZjpue6/8XaOuXi6TI9xn06OMgRGwFPHzLHqIRqM3
 7nQ8/aeE93BZhvU4EYaGJWUroIrufzaj1AZv5eAU4fEAeqDxF5uo82pG5jFq1t/9FbbV6CFjYv
 /9k=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584809"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:14 +0800
IronPort-SDR: Di5fiF/9RUcXZ5lKGboLBrDKqy6Zh7cD09rNBPnCpSMWVt2LtSnU1k4iRfyKYqq/1eiOJr23/c
 YinPpNiBL5caxQHFuzK1W2aDKueE6sg1M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:14 -0800
IronPort-SDR: 3KOYBEqWDjPYS5ulc0RGyfISjQ9CYfVrRXXiXGVJHAw2GqQkAugmAXJu4WfLgIZgsT3p+pOtki
 mDXwzJ1AcNGg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:21 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 02/22] riscv: Fix sifive serial driver
Date: Thu, 10 Dec 2020 23:02:53 +0900
Message-Id: <20201210140313.258739-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090323_471582_E5DD99F3 
X-CRM114-Status: GOOD (  11.92  )
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
