Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07E0CAC58D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 07:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8D4rEiMr5uWcC14uasjN1yWnrDWRJlSzs0p4Hhrdss=; b=dsUHumxt5z+DDb
	SL50HqtJvMz9S8ZTvnvbRjnxbJUgqlUaSd8UMEWgD8c/niYtcktojH6QN9icH1/jyavOeoy6kT2Dj
	3RXyolSfMka6JS06oC+O1wwKlTs9P/0Xd452S6e5m69Upj2E0Fu5OCMBRtsP5Emf+sGbOcQAhGArS
	Gu/EXZiBotszgTvrUNPOJYAYAQJ1zuvMmM1fLcbk1QrbnUWhVSHzVEAGb9bKxPNaGSaU8by/0obNw
	h94dplf4CyPvNrxUoMubY6V1hYW0fejoWd+Dp/e1rawOTXW8KWpAqBLsJiHdDlV9TXlpGwoM/Cc9P
	04ccK8NNBTYsjuwfW5VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1s-0000000CSx5-1CZG;
	Wed, 10 Sep 2025 07:14:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1E-0000000CRv1-0hfQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=; b=gj/ZCjSTp1D4pW8oX/oe30EMvP
	K9u3ftrGhzAVA4w5mGB94cmYhXe/Y1x5sP61DJO8oDNJ7qXB8Pi53zuxCLEtNe/now3K8G0YfUlSk
	5+hFoeM9oWHMvy8Pn1AxVXbxeq6c1JjFqHN/Nnt5e4cOq3MxzNWO0XvJnC6ocrUajurbGadPig1av
	iv8FRAFR4HBEgkpnwg//pkNl7v5f5dAMnHR2IPLeG+g/HlmFkbr0jEvg8E3lZRSp5dqs464ODipPr
	VEiyaTM7gMBbX8eLAfejUxelWrExudKU9ImhWohhLjS9wq903J5iyM+Q2Pu/KHTFm8nW4+H26jmwR
	fi5wEAXw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF19-00000005kK1-4B4T
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45cb5492350so41903125e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Sep 2025 00:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488402; x=1758093202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=;
        b=M4mL0fMM5peE2AuraRwBMiXP44TS8zwUXNK4vy2V3usacoeiXrgcEp/SjsYrJu71L2
         59J8berMNoE3hV4zfgLskSIMOv3POSFr6rFo3YgD/7ceLfbF8rDFo8WVHDpxWIfod9Cd
         Kqu/o6pLXoTKVXzKpWvZdbl4zteUQ+rqdGUraky9xKw37tD4knCSzCkRM1f/cQGlyiWk
         /1cpoCN8rJ7Intzk/Qij5bAC8HnYFc8AQlEjm7fSKVjjyWoDNU5BIkiX3+R8XxX6Ubwl
         u4iDT0MU/fJGrO1GKDsDGcKGlc1hOicql28ZL0hUQx29H+R+KW/OMeYim8xzCEjhfrLx
         gUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488402; x=1758093202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FElNXvbXkDRRQhtrQxdomLw+BBHH7zVlahtdS+KoDiE=;
        b=J6ZW96aS6ZqohFi8xMWSVTi6g6paXDIlxDnfkvCZriKC+00EQLbK1ahsDbomEo96CL
         0+JrNoQAJwdwMv79445Q9osei0MDyer4De5xisTtm17cFZStG8g4U8ISWi1CDtMJKZnb
         7f7sr4ZnJB5ztExVzc2GrQCYkrn52ZN3fzB9mC4bQZC4/XZYAn6+pF8YWko9yvimuTFE
         x1YVhaRps8z3ek+GWH6FR0DG7biP2tR3FJTvCrcxS/7CyPoqsJ35wqIAsc5u7dqpy+9R
         yHqDsRHO4oEPmg/KX1dmytlJ/Hq1dGJR7zqVKOCLhfdQmegLn1a4Yni82ZFR2NSduh3h
         AOQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVF1FZweFrRsSmYxw8t+4Kz9sgWNugrgppzC9WzAYhStQgc4VNnWgVRJTMpr9hbUuphwA9PVT72FR2FA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAOzhxALt8LkP3F70LDu7FR69+jAoxyiu7JfMS8tOlGB0WXeL
	QY4vjDekRy3sPLSZ2eVrZiR3i9S2NYIzdtgiriGcRep/UB2T2hoCZMP6ivtQ+utdp10=
X-Gm-Gg: ASbGncvPgUMrtnUN2AASdeTxLT8QBuJU2ke8dnG9bWUjgUAxAaSX7VlLPyvYWX/Rlej
	P1anMMsmOtRMimnCHIAdtf9XiQyD0hUCm3Z0g2gLV/+7cfX2Kqi3xkZasE0bqdJRfXnk/j97ptU
	OOUUtnhjD/T6809aOKAqIEikauL0udBne/tjTQte37YHR8Vz5TimF3bx4GzvAAi/VQGhFV+9Aok
	PMqcRgtFBeEA1Ypgi8ClmBb5h4Tp9+/eGt+4WsI27Evong0DSXPmc6n3orL2hYBWYId5F6Dr/t9
	jKdkVvx/WDRhtQiC+DVyVj+1+ONpcFO7Sj39Xy8ommUmozu3OkPIqaZu8FD2upMqTsXfEL4PRNB
	XjMzFc8tdfSABL0nnhcLRU+SVf5s=
X-Google-Smtp-Source: AGHT+IHoepCvPrqffYJQ5UIHKGGHBJc1+/54cYHurrsaTibZhp2uHZLzVTLLB5uNCtxFJZunElj+PQ==
X-Received: by 2002:a05:600c:3b83:b0:45d:e326:96fb with SMTP id 5b1f17b1804b1-45de3269948mr124468195e9.30.1757488401630;
        Wed, 10 Sep 2025 00:13:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:49 +0200
Subject: [PATCH v2 13/15] gpio: sodaville: use new generic GPIO chip API
MIME-Version: 1.0
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-13-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7/h5cgPamRvVF+jLNZTPGYwaS32CB4zOrlr7VxAAzjc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTv0yIdz4ll8MitMXBu+6Mc5Otn99oRiDLNN
 Q5yVNcT/N+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cvWgD/4nU8cNVwDl8vk77Q2iyfBijC7A0S12Lla0fUkfGEnyo2aFOkDa7ATtYhvRNDLkgVycGJQ
 AMlaMmKhqg69nCQIHG2IWk40qU4Oof5Bul9lC2RZTsD1rfsccSrVwmUELFjq5ZskpBqtECS42jL
 yraGmhE2TWx5P/GUJxcWPh2owipXA58iir3CMe0xeUaHb4LnDJFCOzf1CAsm83Ay86MNZ5pdEOZ
 lZB3lP7Sv+MDBsn1PIOqFTqhbSUBRUsPSo1k4D13xXHxH+vGLn48ITJkRXUgxJc46q1QZpwIV4W
 x5AzzuRWYJbC+OojV9EKyzxSbTlSr6QemQs1JwukmYlRRv6qJDZ0tG1SoTzf6LsncxZH8ekwHu8
 UTttxkGTzZkQR4PQRWJfqJmDGA+1kJ5/CGDmv2Rm+mw5YTZiZcyvhe72yrVKPHGLAEuVKYgx3hY
 xkqhi3k+mbU5JcW9CB2+XAYfVfCckl0dDQBIXOiOIj6749sikgNH1PI25wigIkqo0Vlg4fVty5L
 hoZS5819zALkHM3NZdAfqgCCcrE3gDfevReAnBMTqeMlyy2Qk+wVmA4qaKXbqDs8n93hX0UgAW5
 4KlBoNsyGTJD9tc6nDzGA9kufi8QQ4TAZAX+u1yBdK2oB2/PCEME4LnoxufI6mKGjMdaqQVCH9c
 Mo4LZ6+Z65z3wag==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_081325_157489_25DE4B0B 
X-CRM114-Status: GOOD (  14.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sodaville.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index abd13c79ace09db228e975f93c92e727d3864ef8..37c1338377295fa2995bac98f1ae2db892209602 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -9,6 +9,7 @@
 
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -39,7 +40,7 @@ struct sdv_gpio_chip_data {
 	void __iomem *gpio_pub_base;
 	struct irq_domain *id;
 	struct irq_chip_generic *gc;
-	struct gpio_chip chip;
+	struct gpio_generic_chip gen_gc;
 };
 
 static int sdv_gpio_pub_set_type(struct irq_data *d, unsigned int type)
@@ -180,6 +181,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 static int sdv_gpio_probe(struct pci_dev *pdev,
 					const struct pci_device_id *pci_id)
 {
+	struct gpio_generic_chip_config config;
 	struct sdv_gpio_chip_data *sd;
 	int ret;
 	u32 mux_val;
@@ -206,15 +208,21 @@ static int sdv_gpio_probe(struct pci_dev *pdev,
 	if (!ret)
 		writel(mux_val, sd->gpio_pub_base + GPMUXCTL);
 
-	ret = bgpio_init(&sd->chip, &pdev->dev, 4,
-			sd->gpio_pub_base + GPINR, sd->gpio_pub_base + GPOUTR,
-			NULL, sd->gpio_pub_base + GPOER, NULL, 0);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = sd->gpio_pub_base + GPINR,
+		.set = sd->gpio_pub_base + GPOUTR,
+		.dirout = sd->gpio_pub_base + GPOER,
+	};
+
+	ret = gpio_generic_chip_init(&sd->gen_gc, &config);
 	if (ret)
 		return ret;
 
-	sd->chip.ngpio = SDV_NUM_PUB_GPIOS;
+	sd->gen_gc.gc.ngpio = SDV_NUM_PUB_GPIOS;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, &sd->chip, sd);
+	ret = devm_gpiochip_add_data(&pdev->dev, &sd->gen_gc.gc, sd);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "gpiochip_add() failed.\n");
 		return ret;

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
