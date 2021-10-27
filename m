Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F512C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1203E6109E
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1203E6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r0wC5UsG5XkXBqMqnd3/TslIQ2u+2DUFMBUVzGiBsY=; b=Z0MmH1BB8w4OxN
	IxClgDFS5GtsBvsfdj8l6G0j9AT7Og0ZKX/N2Na+HPYVE+X0o5Sea39Aep3OtJRQGQ5Pdif9neiJc
	ZtACYj/cSl7Ua6dadEUK1n8mUNfVwvjGRkc0KQbyxX+oQQO7qnH2ANJ1YQI9MYIhCUZ3m95HobHg6
	Qpl6NF0RTEqHjKDETgh28F8RpFs9BBY0Al6Tiuc+5lNskMDajeMZW8PUc+2lkkgkDY3T4alCqrZ9t
	cx8ZvvoVu1LNQvokyCsLBS4Rs9NcclE05O0E14DYs4p30iGM2cD01d+CnG4ie21Vshs6z302I771p
	7kgCkXD6kPguGZ8W86Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqQM-006ElV-Ll; Wed, 27 Oct 2021 21:25:30 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqK5-006B46-9H; Wed, 27 Oct 2021 21:19:03 +0000
Received: by mail-lf1-x12b.google.com with SMTP id j9so8980746lfu.7;
 Wed, 27 Oct 2021 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/EvvYGeTVCQImKsIJ5eG/5fF3PWyG/w2giRYqfawyD8=;
 b=WISWhItqSg2B7RF+VMq4lOAEaPJboj2meAQ+IB5/V1NHbNJFBmj5XS0xlb4zCXSKCT
 6NsXWHZYq9LRGS+jBn6SfWgsJR2EyLsQBWeeDJtEZfPXB1ZJ5N3cxcINwqw5WxZcKDSN
 DIvIUkbk9mQPYxMXhFN2I7TObVzLJ8eVxU8hzEXgYSzj8Cm7i8BXlPfHwlq3yNPgneQb
 CHkJFZxdfY5RLlI3BGfXo88fraOgWdNEzamQkJbIJD18e+/pItOdQTQl7YVu3LpCjfDV
 vOVdkFjMAfH4ytXgGRWsun/uVtAnjn/uKIwgKMmU3X2UQuuCd1+gugzIIN8JE0FZ4XsA
 8FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/EvvYGeTVCQImKsIJ5eG/5fF3PWyG/w2giRYqfawyD8=;
 b=JAbDoqSK+NBzBBrRLlqHAmLBrx7n9Ztop1hVjne5cHzkd2S51No0MWAVoRmbf21cWV
 ZwDVwW9X17spoGd8wDN8b7i3nw+a/SR5vYawQ0BX6AyhAAOj6UKeyGs5ZJ0frC/Rcsim
 OACUeZ2e09ALmB+lmXzibUxNvskjZSzFvfLkz8PXUEvwyUmSIlNulmKnkV2V7SVBLN8S
 HOr4p3HDFsSK1HpMmcWZgl2uYT24ntVHInSbgiGbhK8/Jt200xZRw/SvyQu39eCWWdTV
 ZGqtQFNUSabG3/aTwycYfWDhqz4Z17SYBkvj98Kfp78X/6GaPjUWdCiHvA9DQ1VTQJXo
 SYPg==
X-Gm-Message-State: AOAM531R5ISCslKyMTZpps72kEsNBiumKKMY6e2pmpkr1I9TrOXyMVPV
 +j5KUOR0+HjMWeYHnua0B5Y=
X-Google-Smtp-Source: ABdhPJxRCjxAoGlWdRIW6Oj8xz2ri71YJVQnEgFasE3kMNBOfZWQ65DiEYFCvQ3qjpKPcAaJZhmXrA==
X-Received: by 2002:ac2:4c08:: with SMTP id t8mr95028lfq.281.1635369539813;
 Wed, 27 Oct 2021 14:18:59 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:59 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 36/45] mfd: tps6586x: Use
 devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:06 +0300
Message-Id: <20211027211715.12671-37-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141901_377660_8362B790 
X-CRM114-Status: GOOD (  17.21  )
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

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps6586x.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index c9303d3d6602..9033ed936d1e 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -22,6 +22,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -461,9 +462,10 @@ static const struct regmap_config tps6586x_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct device *tps6586x_dev;
-static void tps6586x_power_off(void)
+static void tps6586x_power_off(void *data)
 {
+	struct device *tps6586x_dev = data;
+
 	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
 		return;
 
@@ -540,6 +542,16 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	if (pdata->pm_off) {
+		ret = devm_register_simple_power_off_handler(&client->dev,
+							     tps6586x_power_off,
+							     &client->dev);
+		if (ret) {
+			dev_err(&client->dev,
+				"failed to register power-off handler: %d\n", ret);
+			return ret;
+		}
+	}
 
 	if (client->irq) {
 		ret = tps6586x_irq_init(tps6586x, client->irq,
@@ -564,11 +576,6 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		goto err_add_devs;
 	}
 
-	if (pdata->pm_off && !pm_power_off) {
-		tps6586x_dev = &client->dev;
-		pm_power_off = tps6586x_power_off;
-	}
-
 	return 0;
 
 err_add_devs:
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
