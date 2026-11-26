Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37AE606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4wiMOEV4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgkUswGy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=plmblIZfRHtJyUN4i8n0Gl12/KW4HuAuaFt7wrsRKys=; b=4wiMOEV4JNi7BQAZLMOC5T2yfm
	pPSJZI4a01DMB1qT0wSL4M69PinKot2iY9Xy8L4Gli3UTnD+SzP065xe9joNX+cwF3+GAOSxyrKR0
	qKgPUcXTXRxss7kVioJygQviG5vOv+Wpg6cHis8D4pRHrIaE8HQrqTQ7r5mzBAc7tq9XzIOLOiZ4W
	0+Xxe1l8YyIlwWTifInPvkBN1FmMCle27ZgddjmD59UhXNh4zy6xp/eKpzE0q3uCs4mJA2btUhu8X
	QbkkRGovT6ziN65SaAcuh4EQM+FElOpQtqNVpvTGL0ux2AkWgF/k2mJLtDdnr0bo2OB3b/zDOgHe+
	YTvBLQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwq-0000000E98z-3M1b;
	Thu, 26 Nov 2026 18:11:59 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwo-0000000E976-3EvZ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:55 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b244fb7fffso7847647c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716714; x=1796321514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=QgkUswGy8ByJhPReV3SzhGtAZpS+xTixB3/xh84BNZIpF9SjNTCeL+Qa20vWwR4ENJ
         o3mkfsjyOwkbih1654/yDl8Ez/G9IrboE3McKCyFHqgK9+LIftt1TESl21wyJRvQ0q3j
         3YiFcPfDSs/rxO+rXTDmDyHMrfgzKwQXZZxOdK+TaqD7FqsXbxBvuWiSlbpe4Zg2kQud
         8+Wx8uGny7+asZZ/Y6Z9kqjGsn1BeovBILp2zVmXR/fhUG6xZoa6RYEKtfdLy1GyPFiQ
         fUoOqaILON8+wr/1s/iFULDD4D5/6kVbmbHbpUFHLZ7Pe+fzowOqy/9Hlm65EwlKlMj4
         lqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716714; x=1796321514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohcenfLUMndMbNU9mTZepLoct+4NVwlucM8NCOZrsDE=;
        b=VMNXHv80gcuOV4mBlk9Enh+IQEIMIHMc/NOHzmwO/Uy2a6gSUsumX7cfkuCIfmHvp7
         SG7tnjvq7MwN1ekPP9OEyDy5UKo1yuRzaWcRhb7fjChJfmw0VL8kJ0Kpy+K4O1bsaVKy
         JHGnACPQfIMIBYAQBdNCRyGcNP8Vigsr5A4WZFuloVKR1ae9YuDqTai9KqPpbi80eXjB
         vmELbp+tIaXPDIoUwXoIYuOC9nop/RGr2GJNuxUz2CSyTYp8XLDlAGDz7T6KQaVPoJDT
         ahdV/vsLVjY83Ii4JcEYYjNI59bombKZbFJ18xbhAFbybcV3V8zgXEYbjg7COzi7Iq81
         lCdA==
X-Forwarded-Encrypted: i=1; AL+hErFzWpS7dB0g3mc0c4dNlQY2hCt4gbfJfxxF1QxiZ19P3ZtK4EGjumG9FvcWqWms44FX+pkzd6PS1mhB9Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+xCKflNGo4p7rtkJw/MzSfMb/zGMRwhp5NpT5Y6NpcfIO2Go7S
	a37TRfIAERvE8APfkvxF9/4GWOYQIsBMkWk028mdF3LGE0Y5fl8ao+mG
X-Gm-Gg: AZFdTZfpU+BlaX6fC34bIsB7jccS+FF+WUNB1o7R1hC5TUNVoI6I+aO7//tEGwdq0q6
	OwPXG5BVY/HjSJb0GeU+JtkMy/L/QEPvhp7L5zgqWMM7qsvlAKE/tm8t+35FMTeLGbpJc4Fwh+Q
	5dSeIEz2vS5pH2Vm0tCGdV/s4YqkZoGIwG5eFTODVPQFPPiuxXNpbVgONKPngBTMG/Mx/Vl649G
	ZA01vSpow8bmAJN5neu3D3vjwFcRq/66J1MjDS2XyyrDiSvHeGfckD4+73INKBOYUK3rP6nCoeN
	gY3vBrA/y/dl45DOi2be7ZSczyC6jenaSjAM4RoSpyWrjmgzwK3ncxfHyroGQ4kzZRhPsJemqPZ
	uDLx6Tbsj0rzmom75SV8eyL/KyphGEVgUJ83rIqs9PmXOBjut3GoM9asbKt7mZnW2O46QduJ0eb
	iqsN7c7MIDBS7nuRu0yznVaEay7cWT8svTujalCqx+QYEDZf/FwniSk7PtNqStE3+GxhuUnwGdJ
	8jFMqiK1S5EvCaHpskp3tpMtiRC8z2lNiJ13oJe27d1Zn/pbM+XobrUVb5U7FzTfUT92w6OrvLc
	nsOB1wfn/TxspIMpBXzGqFTPKz4myXDulN4WW/hL+kY1LJWaZEZg1u5GrxlT0Wa3DXhtBhIyoBc
	WuHBvMnyK2qKIVDynRRPDAv4=
X-Received: by 2002:a05:7022:f111:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b55688ee19mr25310636c88.18.1795716714042;
        Thu, 26 Nov 2026 10:11:54 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:53 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 8/9] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu, 26 Nov 2026 18:11:00 +0000
Message-ID: <20261126181101.3715754-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101154_828795_9484555A 
X-CRM114-Status: GOOD (  18.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver currently only supports board-level initialization via
goldfish_timer_init() on m68k virt.

Register a platform driver matching "google,goldfish-rtc" so device
tree platforms can also probe the timer. Since DT platforms typically
expose a single goldfish-rtc device that cannot be bound by both
drivers at once, depend on M68K || RTC_DRV_GOLDFISH=n in Kconfig to
avoid conflicting with rtc-goldfish whether built-in or as a module.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..852fb1f2d8d2 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || RTC_DRV_GOLDFISH=n
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index f5019a6bb340..b4b0388c01f9 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -5,6 +5,8 @@
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/goldfish.h>
@@ -102,15 +104,11 @@ static irqreturn_t goldfish_timer_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-int __init goldfish_timer_init(int irq, void __iomem *base)
+static int goldfish_timer_common_init(struct goldfish_timer *timerdrv,
+				      int irq, void __iomem *base)
 {
-	struct goldfish_timer *timerdrv;
 	int ret;
 
-	timerdrv = kzalloc_obj(*timerdrv);
-	if (!timerdrv)
-		return -ENOMEM;
-
 	timerdrv->base = base;
 	raw_spin_lock_init(&timerdrv->lock);
 
@@ -125,18 +123,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.set_next_event		= goldfish_timer_next_event,
 	};
 
-	timerdrv->res = (struct resource){
-		.name  = "goldfish_timer",
-		.start = (unsigned long)base,
-		.end   = (unsigned long)base + 0xfff,
-	};
-
-	ret = request_resource(&iomem_resource, &timerdrv->res);
-	if (ret) {
-		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
-		goto err_free;
-	}
-
 	timerdrv->cs = (struct clocksource){
 		.name		= "goldfish_timer",
 		.rating		= 400,
@@ -148,26 +134,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer clocksource\n");
-		goto err_release_res;
+		return ret;
 	}
 
 	ret = request_irq(irq, goldfish_timer_irq, IRQF_TIMER,
 			  "goldfish_timer", timerdrv);
 	if (ret) {
 		pr_err("Couldn't register goldfish-timer interrupt\n");
-		goto err_unregister_cs;
+		clocksource_unregister(&timerdrv->cs);
+		return ret;
 	}
 
 	clockevents_config_and_register(&timerdrv->ced, NSEC_PER_SEC,
 					1, 0xffffffff);
 
 	return 0;
+}
+
+int __init goldfish_timer_init(int irq, void __iomem *base)
+{
+	struct goldfish_timer *timerdrv;
+	int ret;
+
+	timerdrv = kzalloc_obj(*timerdrv);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	timerdrv->res = (struct resource){
+		.name  = "goldfish_timer",
+		.start = (unsigned long)base,
+		.end   = (unsigned long)base + 0xfff,
+	};
+
+	ret = request_resource(&iomem_resource, &timerdrv->res);
+	if (ret) {
+		pr_err("Cannot allocate '%s' resource\n", timerdrv->res.name);
+		goto err_free;
+	}
+
+	ret = goldfish_timer_common_init(timerdrv, irq, base);
+	if (ret)
+		goto err_release_res;
+
+	return 0;
 
-err_unregister_cs:
-	clocksource_unregister(&timerdrv->cs);
 err_release_res:
 	release_resource(&timerdrv->res);
 err_free:
 	kfree(timerdrv);
 	return ret;
 }
+
+static int goldfish_timer_probe(struct platform_device *pdev)
+{
+	struct goldfish_timer *timerdrv;
+	void __iomem *base;
+	int irq;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	timerdrv = devm_kzalloc(&pdev->dev, sizeof(*timerdrv), GFP_KERNEL);
+	if (!timerdrv)
+		return -ENOMEM;
+
+	return goldfish_timer_common_init(timerdrv, irq, base);
+}
+
+static const struct of_device_id goldfish_timer_of_match[] = {
+	{ .compatible = "google,goldfish-rtc", },
+	{},
+};
+
+static struct platform_driver goldfish_timer_driver = {
+	.probe = goldfish_timer_probe,
+	.driver = {
+		.name = "goldfish_timer",
+		.of_match_table = goldfish_timer_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(goldfish_timer_driver);
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
