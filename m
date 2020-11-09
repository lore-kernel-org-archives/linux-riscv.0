Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6854AC5517A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 07:57:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F9D2084C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 07:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ynKS3CrY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NAR6Lz7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0F9D2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8a2orJZHlXzLCcz0cp5r8ldBhFQjtWVjcnBWqKoHzS0=; b=ynKS3CrYVcLgt5cGD5KGwbfhZ7
	O6UC/HjaYJazHkq8PmbVkuR9C8x+9aJDlMInjrWvDi2ig+d87/Smm/r59Zbv9hM2f6fVxrACj1bv3
	x/ShEwOEXWl7+bznMQTm5W8rfYnEY5b2aCrMKKnQgalM3E3VCEpXhJW8B39Dla0wf61ToGGCxbxTE
	Y2zizIYhzRHfqji8/8LYH30EuhdrfEjIDY0ZMFbIgEEJUrUlBSdcdcNzfVDxtNVuMSbUPvU9wc9SP
	290q0vECm9Xne69VMgkxTyG2obe6C2vbnPdOae8pfLoL8Kt0WmYPqBMH2Y1eGMvb2TIF5FjvhN5nT
	jzmxqN3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc23A-0003OP-BQ; Mon, 09 Nov 2020 07:57:16 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc237-0003Nn-DY
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 07:57:14 +0000
Received: by mail-pg1-x543.google.com with SMTP id h6so6455314pgk.4
 for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2020 23:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JARJXkPhEWiu33v+1+8vkMu7S2fskALhXSmZ9yD+t4Q=;
 b=NAR6Lz7KspbsdLjr2mz5CiAQvEj/XR53nA53DrfaXq/8K0YC6ElWYDZMNOSTmQhKMa
 ujwxCsBuW4gZ1VJDt8So8X50nUD6IKGvMik9lDTrScFdRe8EtCTMmehfnCcMVMpZq/63
 HM/6oZfkNEV6bBbgtsKiDfln4ISKgl75q8r+0Ct8mP4INNnKRra+KFysabiYNJKpnWpS
 7LpB77esSljYXinMtXI9HzNChW+Gu5jIA6m2qOq9ZC3f6W0FtiOMPCXs0fhZLKXMfML8
 eQQTDqyjNlSFW+RmfaEvgO68HdN5oEnYkKrSSouuMYX2LwDgVhNpyMASPTIQzEX00+cn
 njbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JARJXkPhEWiu33v+1+8vkMu7S2fskALhXSmZ9yD+t4Q=;
 b=PPR+p5iJgrUErTBLvIQ8Z8r7NxIKpuLVrQOSJ9k4WZ+QoYgg3LqAskeksREBlr+n+o
 LTSfTwn+r+qqmxZHyh9nwhOrlhVtYcjEg4jJUyTaUCWxtPP43xKfWTnbRDeoGqahNpDo
 5WQ0zP8ogTCb/0axC9MDHtw8PzMmFxRTwdh3eBJg/vA8RJamKBR0+wKQaBEhnPjZrwmr
 4KgEx0vxA20y6Y3R0xN+ZkXMbJHH9fIv3i29/xIw+/XEjhsbFRI6x/GCt513fBMdm4ju
 nh354MKfl+gVedkx7nxCx+7IqABLyHyhwwmOMVpdc65I6ezm1O/06CymNnz0rJUF4IOl
 qTyA==
X-Gm-Message-State: AOAM530KRx4D+Vgyel+ZgfukLhP7WKBXAruD0BSqiLagIa9vUwkIrRGa
 PK0d4TCYzM4Gv2uxSpYiHbsYgw==
X-Google-Smtp-Source: ABdhPJws5nG0ASg3JRadKHXCeozCXgSCoG2pnJp2fXYELbGioewsCzstSatDc/0St7K0W/r0YcYA5w==
X-Received: by 2002:aa7:9308:0:b029:18b:3a1b:f46a with SMTP id
 8-20020aa793080000b029018b3a1bf46amr12783803pfj.64.1604908630838; 
 Sun, 08 Nov 2020 23:57:10 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a184sm10117433pfa.86.2020.11.08.23.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 23:57:10 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, andy.shevchenko@gmail.com,
 yash.shah@sifive.com
Subject: [PATCH] gpio: sifive: To get gpio irq offset from device tree data
Date: Mon,  9 Nov 2020 15:57:02 +0800
Message-Id: <20201109075702.21370-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_025713_497317_69DA0BBF 
X-CRM114-Status: GOOD (  13.56  )
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
 drivers/gpio/gpio-sifive.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index c54dd08f2cbf..bfb915bf5d78 100644
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
+	*parent = irqd_to_hwirq(d);
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
