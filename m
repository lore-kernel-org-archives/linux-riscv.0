Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F50AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A55613C8
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 00:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57A55613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=in0VBeZtduzDay6V9nBgfG8zAvSOeEuC9Js7vY6n+pw=; b=lxw21vbz7InD8GBNDQYvcad1lT
	nh9l5aTaEAatc2O4EsR+aPNkYO6uXmkdp+jQBn0z+RP0c07eg65M89cL0jO1RG7D7c9/XMasCtSuN
	0Ip8KZoV516YfKBlnqIRU8JhVnvBuGosST+RmqEC9uWlgyceJkMhpKZRmnYeJhjbjnxv+W8XaQ5n9
	V5QkdWrnTMMiuMJOCk22drC0OIHWonfAchlyypqRIR5EZV1z3cgOPoxkjmbXucykaU7YEXoBwWvuN
	5HL5F/OHL/yBHmpN2JzI2V8DszsDFhqP0LP38s2M+LR5CGuhdR2iEtnSGDMkgojOcCf2qHIpxSWAF
	ONk26W4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVNAR-009SXg-Hp; Wed, 29 Sep 2021 00:09:47 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVN8R-009Rv7-FS
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 00:07:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 t7-20020a258387000000b005b6d7220c79so442880ybk.16
 for <linux-riscv@lists.infradead.org>; Tue, 28 Sep 2021 17:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=z1hBUYCayRXYRV1aBawCwI0ZIv5Q/7fBQjmnWUJmax8=;
 b=OCTtfUW5Npi/dJF4mW3n2SkJDP9rlPZGGl3YJShJKkmbrIGTpbtm+FRSRh59L+okrW
 +Sw89Nrsu7F20rC9Ug1X3rBcXEdArcyk+yz9F7j3EkrBMy/TUFV4KbCTCOu33ARr7dLu
 BHtO+dcRUGo9HjZaTk3UKE0V2TKE9DUaf0Sqr2uoLhavLrbrF2O6yojifKpdtVO8SYHH
 E7cCWqIByvVl+HGLhSwj2XRerUrrllX8R6o49LdMM1Stq6wLp0HSJCkG0SQrbCu16oPL
 Tg59QYvArInNUx7dnNGHxcTCW2lhVC7TxzMfSHxkbtS3e6c2/nU/9yIfgIpObvQUSt3D
 NLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=z1hBUYCayRXYRV1aBawCwI0ZIv5Q/7fBQjmnWUJmax8=;
 b=vxhfRpcZAra6EUTBF+xQhC8sdLrlxWQhKiLV4vu0Zxlv2JX04Y51weuT2UWnLVGXoW
 sp/XAZdNcYgfJeRVhBqBRCShIckfwZjT886EEWynPnYQpawZMrLsoW3tRqm/gNpv20zy
 bLHCDYz9WMvrnOhGAsp/lyPPk6ffQNZPYg0QTJ0uoz/DYpfD925PEk0yFxHUwuLYoCxq
 B6HX4eOaMUu86oCox0CRHLVvVr4jBTgKAFM/e31+QnZJhKSeNf3cnBAEUqCcLWihh/LU
 qARpninxJMNPkigTRgg9+PpQkl7u403cb2xG8ev/mXwTLctsGYzCk9ZyLqICI281svm6
 gcCw==
X-Gm-Message-State: AOAM533XQYP5F3sQCNdYUdnBgL4Q8iZ96MWIWQDWLtlYvjAMpsvETkv8
 q0yc5YZpGRtCz9GkKlJd4Gew2BLoukJEN8o=
X-Google-Smtp-Source: ABdhPJzRrBTTHFIUolV1HI4zYSv3r1hQit3Ioobw+9iFo7JuoZ1s/FWEsVYnyLcKndbaY2HiicWHeMpImyPd9NU=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:5241:a7e9:90c9:9c91])
 (user=saravanak job=sendgmr) by 2002:a25:8885:: with SMTP id
 d5mr9515658ybl.14.1632874061568; Tue, 28 Sep 2021 17:07:41 -0700 (PDT)
Date: Tue, 28 Sep 2021 17:07:33 -0700
In-Reply-To: <20210929000735.585237-1-saravanak@google.com>
Message-Id: <20210929000735.585237-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for probing
 simple bus only devices
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_170743_605452_9DD2D5CC 
X-CRM114-Status: GOOD (  24.93  )
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

fw_devlink could end up creating device links for bus only devices.
However, bus only devices don't get probed and can block probe() or
sync_state() [1] call backs of other devices. To avoid this, probe these
devices using the simple-pm-bus driver.

However, there are instances of devices that are not simple buses (they get
probed by their specific drivers) that also list the "simple-bus" (or other
bus only compatible strings) in their compatible property to automatically
populate their child devices. We still want these devices to get probed by
their specific drivers. So, we make sure this driver only probes devices
that are only buses.

[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 01a3d0cd08ed..6b8d6257ed8a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -13,11 +13,36 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
-	const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
-	struct device_node *np = pdev->dev.of_node;
+	const struct device *dev = &pdev->dev;
+	const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
+	struct device_node *np = dev->of_node;
+	const struct of_device_id *match;
+
+	/*
+	 * Allow user to use driver_override to bind this driver to a
+	 * transparent bus device which has a different compatible string
+	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
+	 * of the simple-pm-bus tasks for these devices, so return early.
+	 */
+	if (pdev->driver_override)
+		return 0;
+
+	match = of_match_device(dev->driver->of_match_table, dev);
+	/*
+	 * These are transparent bus devices (not simple-pm-bus matches) that
+	 * have their child nodes populated automatically.  So, don't need to
+	 * do anything more. We only match with the device if this driver is
+	 * the most specific match because we don't want to incorrectly bind to
+	 * a device that has a more specific driver.
+	 */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
@@ -31,14 +56,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
+	const void *data = of_device_get_match_data(&pdev->dev);
+
+	if (pdev->driver_override || data)
+		return 0;
+
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+#define ONLY_BUS	((void *) 1) /* Match if the device is only a bus. */
+
 static const struct of_device_id simple_pm_bus_of_match[] = {
 	{ .compatible = "simple-pm-bus", },
+	{ .compatible = "simple-bus",	.data = ONLY_BUS },
+	{ .compatible = "simple-mfd",	.data = ONLY_BUS },
+	{ .compatible = "isa",		.data = ONLY_BUS },
+	{ .compatible = "arm,amba-bus",	.data = ONLY_BUS },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
-- 
2.33.0.685.g46640cef36-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
