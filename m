Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEB8C388F7
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:59:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765CD2068E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ho/eVgqK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T52XGD4j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765CD2068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CksupjZ2mifFFGU6nnot/MMotnB0hj9wAIHEjXMWWWk=; b=Ho/eVgqK9jjvZI+IifCL9HloKN
	5SJJPyJf+n7XZJhQpTZYzYNCtWiKQ+qdjHwQE3dbcVwL09lYYjdSCBGkfhSUYAqC4HKMXiISvgKQX
	cOd6c9TghmS5aSfhtLtQn5PpMZzkGa2iNBlKhdHQ8SVCgmI8Rjlw790M5lKMevLvCwcIwHj+cRyh/
	CHDSUs7pCymu5K09G/Ghy2zT8GVJ0yFanYnFKGfX4zGkGYW82B3jVHmYvZ/W/wpMLYnWFpQO3khD0
	5kpAvyT5rOUrYdi8NyQFSu7olseSowyd/9szuGB+qQqUNZoKcFSbz6n6gCxTtVs+XJM0J0AV3pRG1
	ZDNQykRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1karxs-0004nx-54; Fri, 06 Nov 2020 02:59:00 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1karxp-0004n7-QX
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 02:58:58 +0000
Received: by mail-pl1-x644.google.com with SMTP id 1so1662ple.2
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 18:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/IwG69As01vkurELrZjlxWULg4rCN71pSp13igOTSw=;
 b=T52XGD4jcHFlhP+uETcaw0rLP1WvsLZjzmde/uvRYkqmrtH3+csM7TI0/Rc41bCfZk
 meaef3wIrDALcLoMbLyoDDRoHcpOnCEqCBtbzewQw/BEJ0uKOOSmOGm4gfHQhT+Z8UgM
 C5O6MjYFqkO0ce3BrmsaeiMcDlozTpp+O88gqTdt9VuUlcJe5v5XvcmiaTmtzw8/Szii
 XfVIjf0M4P6+pc6Q8hi1GzixCmx/4tqYEUVyyQGwt+2FH93WEJo8wPhDpF0HaXTS/lvi
 V8NJlAxSwzWMmDCdIi/BdqMsSCXBw0q/L8jiIyP/a9LU31muy94+r4Wftca/gCHuZoNr
 aEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j/IwG69As01vkurELrZjlxWULg4rCN71pSp13igOTSw=;
 b=t9oBHVJ/+fHZVOFwZ6akJ8NxW2m39MybJoIKjDDHjnSCwM//Ph+e2XaWwe8KGP7rNH
 +6iwARmmvZRG2rciDbdpi3S2XeOMThQvaxlRmk/nPc5pvw8V11MZ9pxBzqZMKZIdgDMw
 QD3K1eFle3DtMRFYx+Fc9453Qq8lk6qEGEOnUcpqEomN4N/9F2/xwTtIchYmT+fO239G
 Xnd31GN286/oK6AcXYV6BUkvZMVF2i0FtKJS/QixAutS3RZAM8xw0FKk0slAOtZkGWFk
 H2XD/quHnEYkDooACXSnKM67VQXCVIv9fMe0euWnTigRlkVfzQHC/vT7K/80WPe+jd4B
 ws8A==
X-Gm-Message-State: AOAM532xKgP+anvUX1kYXITsjNMteHySvd1/2BtbKnVQykeXlSXT4A5I
 JsIPMXVQnLBaq9/XZjQxfMmBdw==
X-Google-Smtp-Source: ABdhPJyoYAkt/8qlfuBZLghCFj4//jXpw3xyNocSLEbNZeaxlBGfZhaYfNSnJsqDrZIyrPaxxlWHIQ==
X-Received: by 2002:a17:902:b203:b029:d2:1fde:d452 with SMTP id
 t3-20020a170902b203b02900d21fded452mr5110470plr.36.1604631534085; 
 Thu, 05 Nov 2020 18:58:54 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c11sm3822572pgl.20.2020.11.05.18.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 18:58:53 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device tree
 data
Date: Fri,  6 Nov 2020 10:58:49 +0800
Message-Id: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_215857_890820_ECF5771B 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
need to add more macros for different platforms. This patch is tested in
SiFive Unleashed board and SiFive Unmatched board.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Yash Shah <yash.shah@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..e8cd8741dbae 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -29,7 +29,6 @@
 #define SIFIVE_GPIO_OUTPUT_XOR	0x40
 
 #define SIFIVE_GPIO_MAX		32
-#define SIFIVE_GPIO_IRQ_OFFSET	7
 
 struct sifive_gpio {
 	void __iomem		*base;
@@ -37,7 +36,7 @@ struct sifive_gpio {
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
-	unsigned int		irq_parent[SIFIVE_GPIO_MAX];
+	unsigned int		irq_number[SIFIVE_GPIO_MAX];
 };
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
@@ -144,8 +143,10 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					     unsigned int *parent,
 					     unsigned int *parent_type)
 {
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
+	*parent = d->hwirq;
 	*parent_type = IRQ_TYPE_NONE;
-	*parent = child + SIFIVE_GPIO_IRQ_OFFSET;
 	return 0;
 }
 
@@ -165,7 +166,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio;
+	int ret, ngpio, i;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -200,6 +201,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	for (i = 0; i < ngpio; i++)
+		chip->irq_number[i] = irq_of_parse_and_map(node, i);
+
 	ret = bgpio_init(&chip->gc, dev, 4,
 			 chip->base + SIFIVE_GPIO_INPUT_VAL,
 			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
