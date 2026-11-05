Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC63606D813
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMBFp22i;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aVcz9+/5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDIfbi72
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UpdvtWp4C+szIg851mQUf3UnId6np1hW2PUex/zmv7M=; b=rMBFp22itSIFeypkfNv0YMIa0C
	27cfylLLWds8JJKocFzTWSeXWn/Gl3NS4zdQ25de4GEyLCfDlWxYwTc7Uw7vVzcS4QaiaqH/r+FKs
	iQkmavVv8NS+Iz4VFFlN0/m+ELvyelz8ZedMJ4cI8Cf6lHbvnbwGCaluQZ+yB4aHowWowH00zo8QD
	2vvDWSgCRx73du0/AHHYEyD3RhsxC+z5MYkfGq33kba6zbPewi060DZ9Bel14xzMGKJHfmXJK1KNk
	yzTWEypkUSwe47iAnbLlFiarm/McOHxFtwIRZHVyRXXpJLiQ1RYRGxMALlPIKlacU7zhqjhCpAo0c
	d6mR2uUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AN-00000009ZN9-3k7Q;
	Thu, 05 Nov 2026 16:18:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AJ-00000009ZJf-2qo1
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Nov 2026 16:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=; b=aVcz9+/5JqZs/rTlcaExBr5nsd
	3ZoiY2gXi+KUuPPHDirHzfX2BfDGnw2hMs5ZTp7n5fO3x6Cux47sLq+hudOUAuBY6b+Oyk6JqlSi3
	uAJuS7TQHFs3Mn+bEanUUKxg4ZIaPi+iRIas/PmJoAmjN6+axtQto9VWk+pGeA/kuOCSxdvTFuMPL
	hf1zQilvCY/Us26b0fMDVDryX4+ssZeOweYy9NdL/I7Zh9kvFrag3c/j86mXqfjv4rTkM1Ypd4edD
	pItdvkHkBsd5m0BmBpeSvEGPdzsAGErHvnf94OHxVxMePurPHeRPK/YbQsrbFphq1RzOWeJLfUU30
	dpagvYiw==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0AH-00000003EuA-0DNJ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso1087234a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895490; x=1794500290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=oDIfbi72YrsyVUzloJsfVeUVbCHPrx3+nMknE7G+n24+/BIzMKUVzIyED69DxhB4YC
         YZpfQm284HG/s1jcuBdKfJJdylTH+nJeJOt2LIPFlB92j+ZoOI0A7lO4NBrcZ7A4A8mJ
         JhHXomRC8OCOyVaJN9qW5KO8tPdkdgFR2eec4hIics5WJ8NzHApPn4gZxQSgvA6elh4J
         +Vw9y3FpR4LSGoL8hNFehFS0PIj06NBiNIoKf1oZ34io9DySDQhVUveFY2BOhofGtv2r
         hNQgpe9wwfRIhl4SM2OuoyVI+zDX+u95AWMJODLoUUssISD1w22n2pFi80cYCOgfWS7i
         z4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895490; x=1794500290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6xbLk8s6rCDjjBqfhBuH/lvaFd3o0UZuWtoGiq0X/8=;
        b=ObAIJt31eHNOyZm6VEmV5Tf6aYxlxMUNuc39G3DNqjJ+7w73FUELXpVSboCmb7VHft
         Z//uNG0AtvGHFEXC3gFJCk4RExk+RrJ3t2rBy0qDzPnQnfpvITNZXiKJvZg7JL2Pss9X
         FWmPqFEFIgDG6g5l7lPA9QCnAoCz9CoUFZ9l6pwyH5gpszZXCli6AyZlHdpfFpqGfygn
         +Mn/aLkGoPVKq2GyLU6WcGb2clJe5mUuX1m0U4K/RYxk3l6GuDgxOUiPfnnpNlOaIOrp
         g7FGyl0BahQ6jkmHSXNBKwt5BIPM3NuSXbXQxsZ6VhWW6aaH5bArtpGbjTr8ueGfe2Fu
         Qq/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDrxYqL4zd8h61dTCDwnLuw2v7Noal/3WAZQLsyd6Fn+oVi6LvcRdFS8Uo3fCG0w9u0uLlr1iHwEWN8A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9LoULVhqG1HZRVsg+wGiGKnXxk0ETL7lFCf+Z6ILsZEH0/MJ/3
	h4guYcCWRwOpkUPwQoFCbN5UxcyqbFcHn9xdwgLd8uTRiW2wXnRsimNw
X-Gm-Gg: AYBFou0/4AGMB5pRhQZ7avUyilCJScdBd7tk1Rx7F0UCfcX9wqTTDmUhijPRvXZtx1l
	WGUGHpRQHGcpdi8H1arIsh7D4owm8+l4k49cFx1ZKbLD3Vik1gTt4jFeG36SUFRefV+SRG3X3ZO
	2YehNzqZbMrhzmG6OgRap/CD5CkWDQcvSmYZ36f9CPMBcjPFFmzroMp5jOP302pwklM1/3SYzNK
	G9O7v4cWoktGariUwl7sMG5ymjl/oMZQHDNSxl35W4NCYo56A4tTI8gxxzRILmQwdLaTeXmtd/y
	S4XyZEEmnYRGWXofy9k6x9zStsQ363HC+QFGGVky21K6ugTnYidIdPyt56AfvinZuiNir8mwmf9
	wdO2HtyScWEpoLmJnZ8gX8MyInm5edvityT3RNVW1qrmy7VUbqUBtgeCKhRanCvLJW5njABBcJt
	kiXivgyxt+TN7156G+0AL0ube2p3DNwaka/3dWDnis5cNgHGCr6fORCA8IfHZqw9AyS6jR2Io0/
	SpFBOrW7YwxkajBA9A93WNOjIQzYFg3FvoGPij2/4viq0pTbMzPCnsl78g+nAuvnAyWtYKNSsyV
	qs+sgeDppUjbFW9Rkp4E2TI36Nud4HDbN5C1zda0ZdGF20OAMaqyZlDeoklTHTCb9wfdaNBdlGm
	tbP7xw5smXs85oT/mTpZtPks=
X-Received: by 2002:a17:90b:3b46:b0:3ad:d4aa:8559 with SMTP id 98e67ed59e1d1-3ae896f8266mr15023561a91.17.1793895490199;
        Thu, 05 Nov 2026 08:18:10 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:09 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 7/8] clocksource/drivers/timer-goldfish: Add device tree probing support
Date: Thu,  5 Nov 2026 16:17:01 +0000
Message-ID: <20261105161702.3515900-8-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_161813_044018_31B730B7 
X-CRM114-Status: GOOD (  19.66  )
X-Spam-Score: -0.2 (/)
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
drivers at once, depend on M68K || !RTC_DRV_GOLDFISH in Kconfig to
avoid conflicting with rtc-goldfish.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/Kconfig          |  5 +-
 drivers/clocksource/timer-goldfish.c | 93 +++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index da83483296d5..3a94feb377a5 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -760,8 +760,9 @@ config MICROCHIP_PIT64B
 
 config GOLDFISH_TIMER
 	bool "Clocksource using goldfish-rtc"
-	depends on M68K || COMPILE_TEST
-	depends on RTC_DRV_GOLDFISH
+	depends on M68K || OF || COMPILE_TEST
+	depends on M68K || !RTC_DRV_GOLDFISH
+	depends on HAS_IOMEM
 	help
 	  Support for the timer/counter of goldfish-rtc
 
diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 208b80c46193..563390012b89 100644
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
 
@@ -123,18 +121,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
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
@@ -146,26 +132,89 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
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
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
