Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF19C56201
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FAF2151B
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CIIVUHfH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="VyXmBrJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FAF2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b7qJktOOg8Ri/o2fYtG9VRNkKOFkLnpnGy8tzI5li4Q=; b=CIIVUHfHcltNe9Q4VZqy8fKB6
	t5Yy2HEcCUIz+elvm/pB9ALjZW2JshEsdqrHPqv43Ueik8dFSHtopS5Qr2Il3z50JthgH/UgYlU17
	d8Bb6MGVwMUfRiQAUlK3RlBpXpnb0a4NoebU1CMB8Njq2+oT26WDr2UERkuAnhqzIOUirDfR+/sn8
	IrsSEBl3B4OzrVcUcOa7K9lz0/6gaJttPc+jJxUkr2rR5R0hL4S4QJvHKgsQViZjlulbGLhY/pJos
	NZYYbDtlG1yC09LLpjlgR4dcdGu3b5Co/S+VquFqcHN9MgTxTsUhCJ7tGQG5Yf2U4/254s/MO2L/x
	8PfGZd7Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJN8-0000cM-8s; Sat, 07 Nov 2020 08:14:54 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJN2-0000PH-8H
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736888; x=1636272888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bzB7t56mVd9ZzoA3Nl5yo11GGSsnbn0Toc+QuUpGUBE=;
 b=VyXmBrJkBLE8H0K4SmFB0PmmietLpx07apdLZxwmutG2LWRDngk9RX+j
 2LetgOnB8/J84iioK9NAi76f6HHG6+ygBxtrgI/vV7TCunStPjqC6p0sV
 iF/hTELG0CJtrrsuglbji0fs9ls3+A5I5srJWC463VDMNp9h8uqtfP7lN
 gm6SiueHMMVueKT+9s+rbqWO9+vzcZhwykBmFmpHzPC/57wiHPcBfgO7r
 lERicQ9uQpQNOVqb1AuPcI928OCoVWTduIWBPTQj22wTymash1f5UqLZ/
 +k3eeGfN1WTQ3vGlPCEsvyK59PfqGqX1OhOkr6kq/v9ik70fYaobXRm2Y g==;
IronPort-SDR: sH1cobmd75B94dnUFkB1OJt8srlPMjXsmvM0o7GC0KfqBpHggNo3fvDHd9CjM+ZmUh2lMT1zJb
 cDo//q1VgY8UUA0dA6T3foJY8CNWMamVieBf6P4qhKcw8Yy3qFpJWI+I0JXzBAyZ2TqnLqim6Z
 8jQkOEAUrc9LQIxGpmGsviz1+3LHwNrNNYDpXhq8bQWeCr066iq4a/Am9waHRcz/bi1sC8zQ8A
 hrKPGwAsNJ0YHGlf4GkN0r3P8p1zRluunrIjdKXyULFNKqTo8PKSoCqtuWqpLNXQTD+lTWPZCr
 4Dk=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079282"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:47 +0800
IronPort-SDR: fTasL4sDwtUqM7na83F5eU4GzLYE91FGi6USV5OQymU1tUYV1pR2QvPsy9ZSZiB/9sCZk7brYl
 xybdmOAqMlTuvPz22FDkzZBJa4fZXEbxl2vCZlr6srG6AKptc9UxisLTSV8zvr4lrRdCWY/r0X
 lpcw0umcAG7squmfZ93n7o2uxxjg5NkDJP3JWuXBwBPi7wuiiuRYhUZ2NPsbZpgkp1wb4V4WJr
 G+UTnIFAeX0V1CbAsYcJtvRjHZeFYNOB69oU4YB1pxJWl1hzj7hwqLgXpABF7Gsy8mmA9LQQCx
 s0/HNMMd6RpeP97wLdcGp1kv
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:52 -0800
IronPort-SDR: B0Mfujx6UxJh3cJWVh4zNTPfCD5sD9aEoBo4eyW2xNfgr34VaQ5gkGoFqmf+P7pvJpzQzfYCkt
 UuKEt7LhYCIlvZTWCxOgx0ATflrP+6cTrv/tlkSOAtdqHaP7ofdeAFq4fWIyY9lPVOdT4LEcHE
 ZD7Lyu1Vj0LqoYB5mXvedUwpL+ZgnAIa7ecZwl0rikOIwXwhQjeUnJ5IiLAarLSHNERvOuKdwI
 90nGHP04/rx0PDIZHjR1Zv+LrvNLgMqgoox+UBMnA50cZf2AumzqZuYGOpETAyMAlRNLeRiSV1
 +14=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:46 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 09/32] riscv: Fix SiFive gpio probe
Date: Sat,  7 Nov 2020 17:13:57 +0900
Message-Id: <20201107081420.60325-10-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031448_473245_B10BC37C 
X-CRM114-Status: GOOD (  13.41  )
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

Fix the check on the number of IRQs to allow up to the maximum (32)
instead of only the maximum minus one.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/gpio/gpio-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..d5eb9ca11901 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -183,7 +183,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->regs);
 
 	ngpio = of_irq_count(node);
-	if (ngpio >= SIFIVE_GPIO_MAX) {
+	if (ngpio > SIFIVE_GPIO_MAX) {
 		dev_err(dev, "Too many GPIO interrupts (max=%d)\n",
 			SIFIVE_GPIO_MAX);
 		return -ENXIO;
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
