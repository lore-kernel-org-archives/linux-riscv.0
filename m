Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2326EC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1BF22D6F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1BF22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SdECECkEwc2TD5tymtiEBhrnUsitFmz9wTDpDGLmhdI=; b=KLK5n06hQ9jNoQuAypWxbOFhg
	lr2j9ZaPI9vR6lHUjljO/xeuVeAuwY5uLp+tIFnvgY/LkdCUt4qxiUMiF4rOgLnfI2/q0l435244h
	FZJTNUpMYIRz/V6MKmso0jvTYLwi5nLDqppM1j3WwZZoJcGdfJCpQ0jXcL7Wl5yD688czMtPIau0K
	KJx+w9Rp1VNIEkh2ZvtQ5b4y2RHj1xC0tem3jdhjaDrzfGmSq+4NKdD/nopYrVe93kAuv5VNMfQz1
	Pk2QJK2JiHUHzZg4lRjUrUZqXOnIy5By4YQiUYY1UvnTTkkS6MWuv6QPr35YDSYRphRh1wWNVlU6X
	BJjV91xbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSg-0002Uk-9V; Sun, 13 Dec 2020 08:10:34 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSX-0002SW-Uk
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847026; x=1639383026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AeXALpcFI2zXhzG/wZi1dKZAPJWbKG/DcS+NIXfB8/U=;
 b=cth9kCyMO/V0d0jOZ60OIpQFy7EAV8+qXRGvdxaszHOacw2eDZ38gmwA
 2bsDd6i3cPxCezmPuL+/EKlU5y3XcrQUSjodSow2aefSvQKuI2dIaOSlO
 3eHZ7vjyZJgf7lmBTBiAoz+TaKOO8Z8O1bAufmZmfud6MonlReIqOn8Yl
 xLuz6y6hEdH9Kf7DVnxeaQQNWDfU/9SkigqyRE9C0O+Ru55Pnk6JuVWSI
 lHUS5mlxXxVWCbpW3vHzQYCLLk5gSuSr9ZfoFEteI43pYLjaCQlRP5RvG
 72wq5Gq/cYas5qUjD9v8v2hBckn/fFcaS3DXht8vByO/tZGH8YmQrZ8yP Q==;
IronPort-SDR: yuaajnX2M0to7FAxbIZnQH3QXUCXfduKDpFybKqBbXxB2erBrJpl7xJE3Um7qEV6IJGkcn1Vg1
 I2Xa2drRdMLehbnNy3VTn3TCN2gMX12tXxnIrbKCXTlfiTWdAxjWRO3xZVe8kzRUDleQe1USuy
 uO8cPSV9Ow/dqYIQByRs+//KIEBjM3j7DZnp2XZknPJsdrAyeLFt6zXKyWuvIIkeSCy9SBdIfT
 yRA1lPhT41Hn7rzojMzcggebKlcqQuIa0Jy9jNUzuGe3FVy4vS94wGyIyz25kbwi8TCO2uaJPX
 1oA=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235142"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:25 +0800
IronPort-SDR: NszWZki9DlyZODCd1WfivfH6KkzQ/qlhSPdv4cP2XcfQ4fRzQK7pnAe7DTEScSyHEXu4TOtIRS
 Q8l6wQlQkNkqKK0RqsWZ0o0CBy4PNeQP+m4qDhcExLqDe/bX766A/NJlgIgODFEx5Obf3fBVqv
 4nlccBIfofDyheYWddVlstfdpNhq4UXFOKWSWZQ2eFjf2JMIoOzOisr/5FAeABL5Dnqj6I6crJ
 aI4hw47UhGs7RG8ffEPMsfI8p96ACBvtwAZe2ngg02ZGNtVEyx9bjnbIuvz2IpEUhBNbwDCnO1
 DiYlP4iTNOgJmJzmYlUDJTIo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:13 -0800
IronPort-SDR: wEKjSUXxUeuWWffbNyplSQMPzKvNIVkiXiYpz7jctDt7DMQH8StyK7A1Jp8QcEBGqe1u1i33Ak
 4wrRdUN0HuVmFki8qmY0HWFRXBl8LdHxZ1+g2G06aYBbqmUN2QeRVaMCtjZenshm8pgTsKz/gq
 qYDxfYbuFP8HMLJOWG1qem1eDHt/h4zzn4ZPuVn1WS/rpxHgWaYByA1HKILr9SZMY6gnxuibvH
 RezyDUq5pwKEymYwWhzEM2+iyupcSBesu29nFb7Y6zX1UZBKaXFhiZTLKSW+xej/z887Er9chC
 Dkk=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:24 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 02/22] riscv: Fix sifive serial driver
Date: Sun, 13 Dec 2020 17:09:56 +0900
Message-Id: <20201213081016.179192-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031027_888248_AD3DC2E8 
X-CRM114-Status: GOOD (  13.13  )
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
