Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B81CC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mz86w6qHZcS66eMo6MfPxqQlOHtrNvUlgJ0lkqqdirw=; b=ZU8kUeAq4lez1x
	PF37SmOSkSspN3xr3n88Ekv9lW6coJV300Wbgw++Axig3tiz2xNzCdr1OEENAxMbL5cBqMjXmwd5m
	RggSgw6byAwLWWKYd6BFKMcngikWsdbbJ+/3dqnKrf+kVnllCGVVJkc6eoEFqVXub7urQN8eoGHAX
	ZUJPUC2h8alK3VodtckrOcIJrA5c0KGF/5LT3wTjggsjD+kjyBjz+kzcaC2ZyhIhiz4UPAK+OcwnA
	L5gjRv29uCUv6Ez52NHt4voFg8LumMZUQZ945E7HRwWimuqhJ9zcALRsiTgCSB6fqpF300MYkYOks
	9GUWMm25+J8d3hizXqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7kb-00000007HQM-1ydE;
	Tue, 12 Mar 2024 19:25:25 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7kY-00000007HPX-45zu
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:25:24 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5a1aa46c975so129234eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710271521; x=1710876321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XTNA6eQOgVZeDaw5GSB+YIN/6xC4LtEXiiAUCgqLZn8=;
        b=fhDwdI6oQ0OVq5ddepIzllN9UhdVhvtegdusmVP+nSTrkQh8tAwXIc/uOcMLv8pdk6
         /4YVOj97MS38avh863X4swJZEMGeGaE011jQ+4WLH/KmJWkak2mRa2//S2ZBvUA2k4p+
         a2G1UEl3BJkTKPRAH5kgF4ifX2k6BoC/6fT9+fLYn7DTHZ2FVfiltXb0DJ63OwrdOqbN
         UybxuyS2jIV9C8chJU5QUzCtqYPAyomnvoGnb1y4xeOt5GyF7t4n/gb+ZjWMfCvDrXIO
         GmqyIgonBQyFfQ8oom4ppU+wGwawuu04Z6NM3tCs8ho3ydEKK3gSZTXoP9jjF9Ojd3qf
         /ZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710271521; x=1710876321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTNA6eQOgVZeDaw5GSB+YIN/6xC4LtEXiiAUCgqLZn8=;
        b=pjm/p0m4E6JjNUwazP7ZtNMRK5/G0jnlPZXWWnZf1r4RcF9pqp2rIoUl9jVER4Bzri
         Zmq1EpWOJ/X4lrnv4IRRF5KCH0NNwdtiQOmUpCw6eNOEfAt1N3q+HdMjf1J++VpNA8fB
         KOErT2DHMGMNox+QUe/fFwBqQikx5FPFJ+H2XBH31bFWfqQNIMdgSjTUKGMAuLaj4Y3P
         kGG6uzMfRMnd+65+ozb4iJw4zQ8GfDchReB7Gi2CxdROeufG/RZI0lSroxxqe/xD/taY
         GJ+TUf2A6bhglqRTMsVAv8UO4tqhqS/JR+epRMQTnYouA7H5w1/Qsc4dg7G+5h2VzaFH
         EUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgpw8cHZBNXlOvNLIyaPgmZ3uiyS/0qobPFKhsqiI+zWOGD3dJIXntddhpT0SYMxlQf3LkSizfAErwJEEjimhLY5cDxt/B7QJCT9omt+1V
X-Gm-Message-State: AOJu0YxqIxvH0y5QG+LqLIC6TyJh7kjLtj42LFmp9lYBXSkq2FrVUrXf
	TiZgFUfS30PmMsdcvL3Z2NH/oxHtx6qlZjO+4JNaHqHtIicXFWgRrZ4j/XYvefQ=
X-Google-Smtp-Source: AGHT+IFiOD7raCGAFJ0jxa2JFYqQhVuwra5l6CJlnVTYYffky42xgWMsOYtz4U8W+MEtKqq5d39gvw==
X-Received: by 2002:a05:6358:720e:b0:17e:4fc7:d95 with SMTP id h14-20020a056358720e00b0017e4fc70d95mr1605796rwa.17.1710271521355;
        Tue, 12 Mar 2024 12:25:21 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id p1-20020a63c141000000b005dc389409c1sm6331177pgi.93.2024.03.12.12.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:25:20 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] clocksource/drivers/timer-sun4i: Partially convert to a platform driver
Date: Tue, 12 Mar 2024 12:25:06 -0700
Message-ID: <20240312192519.1602493-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_122523_095620_5B5A39F5 
X-CRM114-Status: GOOD (  15.35  )
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

Commit 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a
platform driver") broke the MMIO timer on the Allwinner D1 SoC because
the IRQ domain is no longer available when timer_probe() is called:

  [    0.000000] irq: no irq domain found for interrupt-controller@10000000 !
  [    0.000000] Failed to map interrupt for /soc/timer@2050000
  [    0.000000] Failed to initialize '/soc/timer@2050000': -22

Fix this by wrapping the timer initialization in a platform driver.
builtin_platform_driver_probe() must be used because the driver uses
timer_of_init(), which is marked as __init. Only convert the sun8i
variants of the hardware, because some older SoCs still need the timer
probed early for sched_clock().

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/clocksource/timer-sun4i.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
index 7bdcc60ad43c..728dac2baa84 100644
--- a/drivers/clocksource/timer-sun4i.c
+++ b/drivers/clocksource/timer-sun4i.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
 #include "timer-of.h"
 
@@ -218,9 +219,24 @@ static int __init sun4i_timer_init(struct device_node *node)
 }
 TIMER_OF_DECLARE(sun4i, "allwinner,sun4i-a10-timer",
 		       sun4i_timer_init);
-TIMER_OF_DECLARE(sun8i_a23, "allwinner,sun8i-a23-timer",
-		 sun4i_timer_init);
-TIMER_OF_DECLARE(sun8i_v3s, "allwinner,sun8i-v3s-timer",
-		 sun4i_timer_init);
 TIMER_OF_DECLARE(suniv, "allwinner,suniv-f1c100s-timer",
 		       sun4i_timer_init);
+
+static int __init sun4i_timer_probe(struct platform_device *pdev)
+{
+	return sun4i_timer_init(dev_of_node(&pdev->dev));
+}
+
+static const struct of_device_id sun4i_timer_of_match[] = {
+	{ .compatible = "allwinner,sun8i-a23-timer" },
+	{ .compatible = "allwinner,sun8i-v3s-timer" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver sun4i_timer_driver = {
+	.driver	= {
+		.name		= "sun4i-timer",
+		.of_match_table	= sun4i_timer_of_match,
+	},
+};
+builtin_platform_driver_probe(sun4i_timer_driver, sun4i_timer_probe);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
