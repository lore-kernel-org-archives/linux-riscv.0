Return-Path: <SRS0=w10S=N2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220FCC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41BB600CD
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Sep 2021 00:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D41BB600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1S279RAJMNYWle9nsgn1EUdXZhmwQvgqCeQnJuIW15k=; b=Uh3MSx5gYNlGRHy7WJgdVQMAG1
	CRP/GWVvxIvcpQ6Kd8c+VA22qq04tHbvXI9iSVF1RfXwZZIPLw3krrwMYjJQCCUqlPEFyPGNhS4Hl
	QrEe7wzxS132NpTyjWPeXqIbsR6HnsEKxDrsELWi0nBVj2CqizdNTPCpaDf54AaFc0HXA8rjwfDU2
	8OruBTcYRX1gCD/BCjmNbHYisO1voBT6u6xg0n08nBGZB+Xyr7YqBjWAOUxmBKt9Cgmb4uG+QcQdy
	Df3mPxBwRxVDmjjURSVqNFz9OzyJkNkiGigk/BYGjYSc6H3LrhVEBK1P6YAELUqLxnldi4U1+m8gk
	E/diwYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMJC9-00DDFm-F3; Sat, 04 Sep 2021 00:06:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMJBw-00DDCj-Og
 for linux-riscv@lists.infradead.org; Sat, 04 Sep 2021 00:05:54 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 p69-20020a254248000000b00598282d96ceso980637yba.3
 for <linux-riscv@lists.infradead.org>; Fri, 03 Sep 2021 17:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=CmiOovZTt1y4cIWEfI47PRt3/MlHznjnR9cha/mAR4c=;
 b=YwL/ZRmVL05ExLE8Uye2bq5sdTwSfXVFJvEJM3RSL7OVnlT4viA1ZPsdqJbNE+RcMg
 UgbROXkOc+awabmhS8Dhd/IfE5Ni+56xWlHUf4Eqgphst0spjSiEsxqxlBXxV6m2Ah+P
 LaZabo3SchFKsQZrmYELQEAmKQVR0XJQMx1Y7YMcU2RCpessU4+lEZPRoEI+GypG8SfW
 PwCI/fte/EJW9+wuc09PN7EbczrDfoIoDp+TcylGNLZ3K+R7g3WutymywjInJTwNdUKp
 tOKHhoauY9ddyjAT4cxP8s+rsbMV7xjnf5qPR1oJUosL0E12HM383vRUS7Me6ht+ZctT
 ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=CmiOovZTt1y4cIWEfI47PRt3/MlHznjnR9cha/mAR4c=;
 b=rWhAoq9XBeIDtl72vLNdhoRkKShl6fmSYJYwOdJC+mv1Z9pxs9He62qtewDWfVDPSJ
 UbejiYrDt7+9vDWmSj+5Jigy1JyeDrGAjvDqMGDWcoGHcp6g32beRoKpzFHaYndcPyjR
 pG5zuihDvh0A4ilnOVyxgHtLfIxoDL9470HlxVLWPq/fgP0IxyyJbXq5n/OCJGMy6dSX
 o/CtEO3FjYhgOYQnTKTyyB9nmBii10SiMW3eITI+ZN0pbTSG+dYcHIeXYYsVH/+73lfs
 UPDnvPgjoxS8sjeMp/W9TRgnPgSat5kcWNpV5F0TX1yUxc/jmiOeumL7DLMzveaJLmAK
 89sQ==
X-Gm-Message-State: AOAM531i3pwPw0i3vLDHarLSqIjH88hctXjqQcJkW5k/M1S+vlKrQ+e3
 iXdgBaXhkRM9mjgGVCV2bRYTnRbe42QL7Aw=
X-Google-Smtp-Source: ABdhPJxmH19nPmNYfApQCzFJa101DpD5Gzo0XYSrXU/wL13p/J/9TjYYqd+ffs7ankEM4mjnReGAXwID7O4vqfQ=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:b45b:ca56:952a:2176])
 (user=saravanak job=sendgmr) by 2002:a25:b9cf:: with SMTP id
 y15mr2035451ybj.110.1630713949404; Fri, 03 Sep 2021 17:05:49 -0700 (PDT)
Date: Fri,  3 Sep 2021 17:05:41 -0700
In-Reply-To: <20210904000543.2019010-1-saravanak@google.com>
Message-Id: <20210904000543.2019010-2-saravanak@google.com>
Mime-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for probing
 simple bus only devices
From: Saravana Kannan <saravanak@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>
Cc: Saravana Kannan <saravanak@google.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_170552_847106_1B586365 
X-CRM114-Status: GOOD (  18.81  )
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

However, there are instances of devices that are not simple buses (they
get probed by their specific drivers) that also list the "simple-bus"
(or other bus only compatible strings) in their compatible property to
automatically populate their child devices. We still want these devices
to get probed by their specific drivers. So, we make sure this driver
only probes devices that are only buses.

[1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
Signed-off-by: Saravana Kannan <saravanak@google.com>
Tested-by: Saravana Kannan <saravanak@google.com>
---
 drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 01a3d0cd08ed..3e086a9f34cb 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -13,11 +13,26 @@
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
+	match = of_match_device(dev->driver->of_match_table, dev);
+
+	/*
+	 * These are transparent bus devices (not simple-pm-bus matches) that
+	 * have their child nodes populated automatically.  So, don't need to
+	 * do anything more.
+	 */
+	if (match && match->data) {
+		if (of_property_match_string(np, "compatible", match->compatible) == 0)
+			return 0;
+		else
+			return -ENODEV;
+	}
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
@@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 static int simple_pm_bus_remove(struct platform_device *pdev)
 {
+	const void *data = of_device_get_match_data(&pdev->dev);
+
+	if (data)
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
2.33.0.153.gba50c8fa24-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
