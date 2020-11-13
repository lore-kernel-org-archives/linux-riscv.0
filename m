Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA808C5519F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 02:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8A2B21D46
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 02:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nCNLGimH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L7o8rnKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8A2B21D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=st0XpjZrFfdtsFF3FsgA5tYSIeJqduzCdEWlkRZgQqE=; b=nCNLGimHpnSUa6kYpCGwdNHl34
	TzuWbdvygroJfDZlV7sj2g0JTUnOKu9L6MyVXTcCA0gvO3keiwrvXwr0WF48iSjZsEToudnK52oWM
	JJyDHMcNyjVkJQMwpBS/1J35OsitJmRNk4SF5N60f41CenUD/sVR/SQjkXAKbEU3WbSWRdPk5hQyo
	zI774zy+kXlSP2Mt8MZcWM1ytKG24RcyPgB60oMurzncMasywbHyoucOxQoCrYYFO0zeq/apYMAIq
	FSXRAavZjczRKV9geU/epqt5pYIyhmIJ15fzA/p6W2u7oDqwSVyRC5YQeUIFVm2OZjQKxnyjTYwqF
	TRFCWqpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdOue-0001ke-1S; Fri, 13 Nov 2020 02:34:08 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdOua-0001jw-W3
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 02:34:06 +0000
Received: by mail-pg1-x543.google.com with SMTP id e21so5861105pgr.11
 for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2020 18:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejXfZ1mmSlVkQ2SZPpazp5/sRAvJ9j7gM/7PmisIs44=;
 b=L7o8rnKl1i3/GnXdAdJsZ0BuC8Dna41VHg392jjZJ/9ysLWdVQ11ctb51lczabtxvF
 3Q8nAeGzDBssZhIIECvAvBrPY7pDCXBilvYYueknPN3rD969H525/eidIBpwcXVias0D
 5E0f6fXlB6u1SBR3RpdpY330IKkJIiyQ2JjU7jTH75wwIvZwo7USJFdIcLZi0UkqT5xY
 pS4gZWM2IYV11CL82MiujdwhU310DuOX1sXuRX7npwFD7LdRgJJiC37h1vl7zC4vSe/3
 jGr7wMBgiv92ZU8QrzO0wGOQ1n4p2TnFfUqgswkywyas18zNpIjnoH1UasXfGlE/NPtm
 kVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejXfZ1mmSlVkQ2SZPpazp5/sRAvJ9j7gM/7PmisIs44=;
 b=r6/e2Cw0dtYMRXBhdUNmGi3dZuGXVKcxY4XQSgx2evpWkNfRAmhS2vx6BgNLjsu3bg
 oaiG0SAc0BPQlGS8XpP2rvv2jUJenRaTw+22iY3Hem2aEkRGWgoXhVxm3vvTtlZ3tOkc
 7leWHDlaMrKQeIoFcMt19s/Gj8ZGB4K+XsA0OYi9QeU7ysNDbSwzbJjmVhNkwlV/zdOe
 5/f98AKSQRwdWu+R8LGOgg3xx5mQHLLb/wMfTqpRc3fnzEdEx2LxVAeehRCWJH1l9pWV
 vWoMS53M1lB/tjQH4tK3KEn/58NR8Z9rEuidBe5e2jfAoJKHOmL/RGvRfXNqFx03bISM
 W8ng==
X-Gm-Message-State: AOAM5318JwPf0e5KWKiLcmIukJBsnF4JUgGnzcgZtfbLnoT7EpwO3bP2
 vJACVeRhrWul+4ri2Qt/BfWyYpucGU5n1c5Q
X-Google-Smtp-Source: ABdhPJy7ett4bGSjt7SpZThhU12xUM8cvoPkfFBbEY47GmSwkAbDvZianrCuK2vKnIeT0YKcNJaSTg==
X-Received: by 2002:a17:90b:150c:: with SMTP id
 le12mr303788pjb.139.1605234841458; 
 Thu, 12 Nov 2020 18:34:01 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id mm23sm8476315pjb.31.2020.11.12.18.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 18:34:00 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, andy.shevchenko@gmail.com,
 yash.shah@sifive.com
Subject: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree data
Date: Fri, 13 Nov 2020 10:33:55 +0800
Message-Id: <20201113023355.43406-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_213405_064076_E1C3CA17 
X-CRM114-Status: GOOD (  13.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
need to add more macros for different platforms. This patch is tested in
SiFive Unleashed board and SiFive Unmatched board.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/gpio/gpio-sifive.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..630bddec48e5 100644
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
@@ -144,8 +143,12 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 					     unsigned int *parent,
 					     unsigned int *parent_type)
 {
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
+
 	*parent_type = IRQ_TYPE_NONE;
-	*parent = child + SIFIVE_GPIO_IRQ_OFFSET;
+	*parent = irqd_to_hwirq(d);
+
 	return 0;
 }
 
@@ -165,7 +168,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
 	struct sifive_gpio *chip;
-	int ret, ngpio;
+	int ret, ngpio, i;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
@@ -200,6 +203,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	for (i = 0; i < ngpio; i++)
+		chip->irq_number[i] = platform_get_irq(pdev, i);
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
