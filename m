Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF1DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ymu2H2ep18VBtyo1oGUYPR+0iRm4yvkzYA8/r21teU=; b=Td8jRhS7aZ/q8Y
	/KomUr3pJM1gc3vIXZkoVC0fk3K297Kx/maC0uSb+SA0WNySG3hgMgmOKmOawzJNGYkynePXupFnB
	sTDSCgloUttN1DehwrkiudHWvQ8fkLpNjoMVL+nmVUcKWI82JwxQPLExNCkVuFi+7eQWKRhob9jr8
	Cv5dx9FVljQ3ikP1pqiwzAnYV36xduIJ4PGRNXSgGhNkgvX5DxgafnEZAHrOwgXTnm19JlMekgSsF
	wcOluPjWlFl4CTANadOrg/gM/5e0njFXyCIGXbaGNZiWefgyoSM+uru/sihlIYL0/QalQ6l0K0+QB
	hhVpg7gtfVAJZ3DHbrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBsD-0000000FxsA-1zAy;
	Fri, 12 Apr 2024 08:03:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBs5-0000000FxoB-39V5
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 08:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712908972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pz7sr6/1kgAHbwaR8rIkOs2x2hB/0ZeZUDnCetvC4ZQ=;
	b=FZYvn+vL1LN/gCoxD/0mvZ8TSMZzFP1Ne4G3l26pPE7N2L866GQjzTUlCUk7OrOzb6k1gR
	V7xb7As4PoFTqGcaH5HxC5SHPZo2Nb/ks50VMHj8BhtZDPjLOXGzKWc1/rce0HSVBTJZtj
	iFTWuVz17oTXLw7NO9+w/15Yq1dFyOg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-xJMMz7UCOzSlobKpFwgKbw-1; Fri, 12 Apr 2024 04:02:51 -0400
X-MC-Unique: xJMMz7UCOzSlobKpFwgKbw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a4b48d7a19so555449a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 01:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712908970; x=1713513770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pz7sr6/1kgAHbwaR8rIkOs2x2hB/0ZeZUDnCetvC4ZQ=;
        b=GfJCnHQ8wB1oe4+GckTW99/slr0/SLI3y4Y8giMnPvyTP31fNQlxrv2TUwR7PKo7hs
         /RD2GBPvIOfS5GmnUVBFWSJTc2pkDkB6PZ4BeKxlqVqm+voTIqCqzqpDOOX3wqedpjcs
         w47JheNSv3rksFFjXZEO16y97giqooGIk5L50KiU0DQ67glEYFiU/6RstJmnYb8E1u/O
         37yGIStu+Og7t1fgHI+M/kbp+E+iOeNMyCxUewgttUb7i3oBY0sW0UjgKJbruGrsz+6S
         d6Ma89qMcM0TwPe5tSagsJsyayrmEX+dhoOJozKviac4gNCmvN/5fchA9X3Rg2EFfgEJ
         Mpbg==
X-Gm-Message-State: AOJu0YwGTNK/wYorgwZCD42YmKRoU3xMfuecysYSMfkK6kZGv8NFyQ68
	+S3YDe3slbyweaW0HoZUSyL3EYL/RKL8uxRZ9wzBjjE4QWP7+U4VbyaduGTddctJZ/WhT4vkWO4
	0WXo7mM0tJAY3CbMkT137AicW24axHtTCYYSzH9yHBC+Fg3DR543EsomZUnME7ucD1Q==
X-Received: by 2002:a17:90a:4b4e:b0:2a5:6753:98e0 with SMTP id o14-20020a17090a4b4e00b002a5675398e0mr2893967pjl.0.1712908970375;
        Fri, 12 Apr 2024 01:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0opAzUeUMJ2l2tzohRqw1i5Cs00vZK25Zmn1qxqR4RzTaHhyge9+KGBE/PeqC9yl/vyn2GQ==
X-Received: by 2002:a17:90a:4b4e:b0:2a5:6753:98e0 with SMTP id o14-20020a17090a4b4e00b002a5675398e0mr2893945pjl.0.1712908970064;
        Fri, 12 Apr 2024 01:02:50 -0700 (PDT)
Received: from Samantha.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090abf0900b002a610ef880bsm2601514pjs.6.2024.04.12.01.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 01:02:49 -0700 (PDT)
From: wefu@redhat.com
To: jszhang@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH 1/5] drivers/rtc/rtc-xgene: Add prescaler support in APM X-Gene RTC driver
Date: Fri, 12 Apr 2024 16:01:43 +0800
Message-ID: <20240412080238.134191-2-wefu@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240412080238.134191-1-wefu@redhat.com>
References: <20240412080238.134191-1-wefu@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_010254_101809_A53AE091 
X-CRM114-Status: GOOD (  16.01  )
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

From: Wei Fu <wefu@redhat.com>

This patch add Counter Prescaler support in APM X-Gene RTC driver by
getting prescaler (Optional) property value from dtb.

Signed-off-by: Wei Fu <wefu@redhat.com>
---
 drivers/rtc/Kconfig     | 10 ++++++++++
 drivers/rtc/rtc-xgene.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index c63e32d012f2..3a89f1e6095d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1888,6 +1888,16 @@ config RTC_DRV_XGENE
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-xgene".
 
+config RTC_DRV_XGENE_PRESCALER
+	bool "Pre-scaler Counter support for APM X-Gene RTC driver"
+	depends on RTC_DRV_XGENE
+	depends on ARCH_THEAD
+	default y
+	help
+	  Say Y here if your Soc has Pre-scaler Counter support on rtc-xgene.
+
+	  This hardware support can only be found in DW_apb_rtc after v2.06a.
+
 config RTC_DRV_PIC32
 	tristate "Microchip PIC32 RTC"
 	depends on MACH_PIC32
diff --git a/drivers/rtc/rtc-xgene.c b/drivers/rtc/rtc-xgene.c
index f78efc9760c0..4d6f1629b973 100644
--- a/drivers/rtc/rtc-xgene.c
+++ b/drivers/rtc/rtc-xgene.c
@@ -26,11 +26,13 @@
 #define  RTC_CCR_MASK		BIT(1)
 #define  RTC_CCR_EN		BIT(2)
 #define  RTC_CCR_WEN		BIT(3)
+#define  RTC_CCR_PSCLR_EN	BIT(4)
 #define RTC_STAT		0x10
 #define  RTC_STAT_BIT		BIT(0)
 #define RTC_RSTAT		0x14
 #define RTC_EOI			0x18
 #define RTC_VER			0x1C
+#define RTC_CPSR		0x20
 
 struct xgene_rtc_dev {
 	struct rtc_device *rtc;
@@ -40,6 +42,33 @@ struct xgene_rtc_dev {
 	unsigned int irq_enabled;
 };
 
+static void xgene_rtc_set_prescaler(struct device *dev)
+{
+#ifdef CONFIG_RTC_DRV_XGENE_PRESCALER
+	u32 ccr;
+	u32 prescaler;
+	struct xgene_rtc_dev *pdata = dev_get_drvdata(dev);
+
+	if (device_property_read_u32(dev, "prescaler", &prescaler)) {
+		dev_warn(dev, "Missing the pre-scaler config for RTC.\n");
+		dev_warn(dev, "The current pre-scaler config is 0x%x.\n",
+			 readl(pdata->csr_base + RTC_CPSR));
+		return;
+	}
+
+	/* The clock source on some platform to RTC is NOT 1HZ,
+	 * so we need to prescale the clock to make the input clock become 1HZ,
+	 * like (clock_source/prescaler) = 1HZ
+	 */
+	writel(prescaler, pdata->csr_base + RTC_CPSR);
+
+	/* enable RTC Prescaler feature in CCR register */
+	ccr = readl(pdata->csr_base + RTC_CCR);
+	ccr |= RTC_CCR_PSCLR_EN;
+	writel(ccr, pdata->csr_base + RTC_CCR);
+#endif /* CONFIG_RTC_DRV_XGENE_PRESCALER */
+}
+
 static int xgene_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
 	struct xgene_rtc_dev *pdata = dev_get_drvdata(dev);
@@ -174,6 +203,8 @@ static int xgene_rtc_probe(struct platform_device *pdev)
 	/* Turn on the clock and the crystal */
 	writel(RTC_CCR_EN, pdata->csr_base + RTC_CCR);
 
+	xgene_rtc_set_prescaler(&pdev->dev);
+
 	ret = device_init_wakeup(&pdev->dev, 1);
 	if (ret) {
 		clk_disable_unprepare(pdata->clk);
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
