Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914FC3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9taB6X9R9n6IKoIRSmu2UHuMiE1/uzrvz16m3X8E2o8=; b=I7UZ+xu2e8wBaC
	viISvrSuVNLKq42PODX3+azde2JoratXlnyus03egWyKCN9D14gPkxh3o3zC7VeebZH5b4RyAXAmm
	bOye7HbxtAaTV9oKCg/SgZtEYWvEpWjRLGDwiTOC3JmOr1J+oYLAazOvopkkn/N90tL98M8Z0vsy+
	swvKWs56biw7b6anmuAQ6VZUhvknSH0fpbDt7pWUYYoQ69TQj25IuKz0ANyBqCsTE7XyQJ/3qWRl2
	pjBJBx0aXC7SwTYtHD0E7PyXjvA/pjEZzdp3gQuCapoK8dKNqN3/yuHkfKA7SLG8zkzs9QaBXc1nq
	7kZdoPUg1VPDuG5X9D7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbF-0000000Dvkz-46Hp;
	Wed, 07 May 2025 02:33:33 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPV3-0000000DPIv-3RuN
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 21:06:50 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3d8020ba858so32216135ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565609; x=1747170409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=m/5EjYHPS8+LqGOFdtdK6OhcosWqq5+zSTeCbZ8C2ESmu/4qaOP0l2suGBO+cP6njs
         qT/XG8D22Pp0ZULAJdC67rY9nCzxB5/R11++WUf6lnBKdRXlDFaZQJgRjFjHoCSwaxYK
         keBLEp79TaIZ5BjazkhBePaKWbZB7vcosTZXUp/h/3kpdkLlvUs/DROeO2e0FlPsuwr6
         Slo1w5Ci8L06P0bzJSN/ijf9sKzGQLlULVB5/jHP3v0UMpW1O/FY6mc8wS5ZxG9TnhGm
         cHtnxA+vGzWgAnS9iXq+zCeT0m6Fdr79C/YQAGOsUkSz1ol7lQZGpsRXcL/sD4xMPEwK
         QnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565609; x=1747170409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jme2oFU9Z+jcmGst64hAoFvbFfUFjd99f802R0svshY=;
        b=lnTymCRQc3Gsax6svGZ/SPR+f3EdsiWLDWofHIJ/McfOo6YotMkAJigqNRahtv35XI
         kkS6dkwOVxI++gC+1oNqYomsqELQ1mXozgeaAu1DP39iC+e4FqpXnQKuRb9T0hnqlf4W
         d/WhZh0IUH/UgdGJyE82G2pJ7KFSzciHuAl1R4N8+S3OsxGdPIz8EX7GnwdShtXy/NE4
         HrCUVD7+zjeWpJdT/2FvnFIkS0rOESLWZnmEHDJIn+3kU8CETlIk0h0QPtUOgQ0Zx34J
         2MQM/fJpj5pLow7b3itELZiJBYaiFqZ1F39zdSiukDTSnQh8PFVOUOJicUO7QUljA73f
         KHcw==
X-Forwarded-Encrypted: i=1; AJvYcCUTNhY3zO8pydFRGgCMPlUD1R0c3Js6xh663grkhtz7gJvAzh0v+eQct5XRVvj4tjHmwBK7mvXf/0yYaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWQFI8xbh7zvVCMHyGVtUE1mfsaUB9jRYbn3GmcnwZlMCgW+7I
	aOdLtZjnFqgzGLU3mgL25G2u4kVPrPlUIeqsnJJARIfZCCriPwYwI0UqUSX8RFA=
X-Gm-Gg: ASbGncvF17XlX4/Y4mJOBU+xszxxC1tljDos229W0iGoXKRFRqlXWCMVSTdmp2ydR5R
	9Be3TJ6wHgH+LzTOYP63ywjbZWD5BWtJuy2CoY1PWH0WFmEmxQNiDMgDoQTmICeYK1K4WbvFeUs
	OtK2cvJIzFglrvLkzdAtipjECWq+nPmDN7tRQZEw6OeRTtHXX9b6SOq9YjsquZejXxiKUfpobLU
	ifqmE+skfC48SUxFmtKmOCLUqJxM8N99mmq4CTvaUc+i8N8WeUG0NUWeLogZnpMBgyhgV3n+TiF
	EAPLFNh55o1QX81cIUVPEpeNowQNO46ZR7H35ZzGPv3kH0XTUuEfALtQIiNyYtlTc9oF2bTJ4H2
	MA1nmOb1S/c/BEw==
X-Google-Smtp-Source: AGHT+IGYwKA4uXQW3ijIOTs5HDkFa1SjzFI8ZE8DNwl6JYQYd64vEUmEQBbyVONgtUbEbjRZVgQbwg==
X-Received: by 2002:a05:6e02:1c2c:b0:3d8:1d7c:e192 with SMTP id e9e14a558f8ab-3da738f849emr8607825ab.7.1746565607731;
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
Date: Tue,  6 May 2025 16:06:34 -0500
Message-ID: <20250506210638.2800228-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_140649_862099_85314FDC 
X-CRM114-Status: GOOD (  23.26  )
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

Add a new reset_name field to the spacemit_ccu_data structure.  If it is
non-null, the CCU implements a reset controller, and the name will be
used as the name for the auxiliary device that implements it.

Define a new type to hold an auxiliary device as well as the regmap
pointer that will be needed by CCU reset controllers.  Set up code to
initialize and add an auxiliary device for any CCU that implements reset
functionality.

Make it optional for a CCU to implement a clock controller.  This
doesn't apply to any of the existing CCUs but will for some new ones
that will be added soon.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
 include/soc/spacemit/ccu_k1.h | 12 +++++
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 9545cfe60b92b..6b1845e899e5f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
@@ -21,6 +22,7 @@
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
 struct spacemit_ccu_data {
+	const char *reset_name;
 	struct clk_hw **hws;
 	size_t num;
 };
@@ -710,6 +712,7 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
+	/* The PLL CCU implements no resets */
 	.hws	= k1_ccu_pll_hws,
 	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
@@ -751,8 +754,9 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.reset_name	= "mpmu-reset",
+	.hws		= k1_ccu_mpmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -859,8 +863,9 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.reset_name	= "apbc-reset",
+	.hws		= k1_ccu_apbc_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -929,8 +934,9 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.reset_name	= "apmu-reset",
+	.hws		= k1_ccu_apmu_hws,
+	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -941,6 +947,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -981,9 +991,63 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	static u32 next_id;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	adev->id = next_id++;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1012,11 +1076,16 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 
diff --git a/include/soc/spacemit/ccu_k1.h b/include/soc/spacemit/ccu_k1.h
index 7df75043e78af..8b2581fb3055d 100644
--- a/include/soc/spacemit/ccu_k1.h
+++ b/include/soc/spacemit/ccu_k1.h
@@ -2,6 +2,18 @@
 
 /* SpacemiT clock and reset driver definitions for the K1 SoC */
 
+/* Auxiliary device used to represent a CCU reset controller */
+struct spacemit_ccu_adev {
+	struct auxiliary_device adev;
+	struct regmap *regmap;
+};
+
+static inline struct spacemit_ccu_adev *
+to_spacemit_ccu_adev(struct auxiliary_device *adev)
+{
+	return container_of(adev, struct spacemit_ccu_adev, adev);
+}
+
 /* APBS register offset */
 #define APBS_PLL1_SWCR1			0x100
 #define APBS_PLL1_SWCR2			0x104
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
