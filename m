Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D681C369C2
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Apr 2025 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DP6qsZnEI3UeZyxU+Dai5k3o09+41YYwc6wPmKq14s=; b=2DFasQpL/JtvdH
	BKSmYaomC10UKG5tjIG8EXjiM/ROZHeLAG3k4byoYUNfAV/WZpdt/BFor3WjcWfS6ndyWiYvGlnJM
	5GAnrhRrKDw4pTL2KHlb2eM9OrI8j2wetSttLp+kjDJsLo+cOjvoIu0KgO/BgDGFkfwXdiJXzFytv
	uYRWVwbF3D+9K5blaSpq++p8XNzj/TEmY7umlBYxqBB9dEzOYeE3juqCoxlaFjEsQhzd7CsXVKl0/
	yZBYW9XOpmoyH9fz/9Hh/jbouQ4+XSMJSfSM5johJnuCxd6qwhC0OXOGp/AL573oGUwovMJ0RNac3
	h9f0vdwGQIG2rCBJsFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Ojg-00000002IKW-3XDB;
	Sun, 20 Apr 2025 07:05:04 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Oje-00000002IJs-3JpZ
	for linux-riscv@lists.infradead.org;
	Sun, 20 Apr 2025 07:05:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-736c277331eso3654768b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Apr 2025 00:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132702; x=1745737502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=hFw7N+LqTo774tup1merPel4NcdBEaQoBKI17uJXV/GfokZ9KBUTEQgrkHChX4Kuhn
         nkBWc9zWPErdlvyb9A+5MgVlwbXOPuxfqcbhlJuDy6xzmU+OLqRJgjW8axUOwRSnnKUS
         spZMbbxNWeJ+o7zBPcHxxBSVQmFV6FXOT8QyYId9QFLETHnTslE2eKibzB+VrF4+jkiI
         JlMQALG9Hc5hbE+AgLUUD+juYHoeVNJSBMNgTk9QygWgtU8OtT/iLkphK1nPp80P3nQ+
         a7VlBfDXu+8b+bXxyGoLYGH6CR42ZtoqvMuTVZzsbVIo3kTXHRW6LZfRpDmbufddAwAx
         4pdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132702; x=1745737502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmeaXxUVGYcoGAVjJ4OOwtWzTNoCxB6YzSoPVdDhvp8=;
        b=gKO+t9i7a8nIoUuEC6VLOHvAOpQrDe/be3A86GDVQi1VIVT5CFJNEFrDulO1EdylC9
         HcdthM6sgeMmEEFQbSAMTOzO4MhpU6pocvToRlT2mgaNMTp8Js6eDW6T0+tTH5B7zI77
         VB4OQceuKdX1/ZvD+QSTuuPtwjgijH9nSR12sIq/SVh4zr2FR7G+xs2J32iuiJUbZS3Q
         /9IObYF1suI9XJgpZU9FUImtK7TI1GQi5TJUIXwVtjXxrChpyqSBUoO3MbmxQCS3E2J7
         8tYLus5UJEL/dzrGzaP7TvJQe1tNqqmuXo3QX/6ebOIjqDQenha5YUU8C3TU7JEUl2tP
         zmVg==
X-Forwarded-Encrypted: i=1; AJvYcCU1B+VRdrOp6x4fZeCQkCdDlKxMHgtjxVlDyUx3+CaltS3OlVxUZextlcvyQCo1QQe03NNijan8Jct+kg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4SOocbbw4RxyouMhakMl4KHBEu12KE3cvy/DGzhNiz0SW1rRS
	rP5T2CDOds+Nu253b7TvPndlm6uQ5VJcRxWml46VGWH2s6p0K6nFEJ3hrBNTq4U=
X-Gm-Gg: ASbGncs93pvMDbYFjgcYq+BZyS/v7tUYc61wVorcGVthdtn/Wrtv2J3oRgoHSZwhqK7
	pSP6eyOqIit1OFauoQw1gAlnlQqYKteuM0t0bWUE4wHfONrVBP3eNXIBu5PhHLZDOz8B/H/UD/H
	UrXudwNxOUPkDyUXfebYzrPiftzjx3vZNzTq/1peODttn+tLK3oBfpgU7vJhGmC0bNWbi6/JWLS
	ZZvDNG9myWxLnra0RvuRRM5fhwPz3Gqi20dAU7ZXsX5Q7x4SG2P07/ayh3rPE0sAQyfSwocv4e5
	GIUh2hx6VXTyK8BJZXYHWFd801ZZYQ==
X-Google-Smtp-Source: AGHT+IFx8mnkCm3C+pdkB4oHWAvoXoy60Ij5qZBakPGfhlMZ/vRsdrSNmQaXTxpzNl9oHvgKDHi1sg==
X-Received: by 2002:a05:6a21:920d:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-203cc5ce2bdmr11487230637.5.1745132701993;
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:01 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 2/6] pwm: pxa: add optional reset control
Date: Sun, 20 Apr 2025 15:02:47 +0800
Message-ID: <20250420070251.378950-3-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_000502_832089_5E44E58D 
X-CRM114-Status: GOOD (  12.16  )
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

Support optional reset control for the PWM PXA driver.

During the probe, it acquires the reset controller using
devm_reset_control_get_optional_exclusive_deasserted() to get and deassert
the reset controller to enable the PWM channel.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change

drivers/pwm/pwm-pxa.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index 430bd6a709e9..dd9c6af0f672 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -25,6 +25,7 @@
 #include <linux/io.h>
 #include <linux/pwm.h>
 #include <linux/of.h>
+#include <linux/reset.h>
 
 #include <asm/div64.h>
 
@@ -49,10 +50,10 @@ MODULE_DEVICE_TABLE(platform, pwm_id_table);
 #define PWMDCR_FD	(1 << 10)
 
 struct pxa_pwm_chip {
-	struct device	*dev;
-
-	struct clk	*clk;
-	void __iomem	*mmio_base;
+	struct device		*dev;
+	struct clk		*clk;
+	void __iomem		*mmio_base;
+	struct reset_control	*reset;
 };
 
 static inline struct pxa_pwm_chip *to_pxa_pwm_chip(struct pwm_chip *chip)
@@ -179,6 +180,11 @@ static int pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->clk))
 		return PTR_ERR(pc->clk);
 
+	pc->reset = devm_reset_control_get_optional_exclusive_deasserted(
+			&pdev->dev, NULL);
+	if (IS_ERR(pc->reset))
+		return PTR_ERR(pc->reset);
+
 	chip->ops = &pxa_pwm_ops;
 
 	if (IS_ENABLED(CONFIG_OF))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
