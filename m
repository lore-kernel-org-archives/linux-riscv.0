Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E00C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B7B60231
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45B7B60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IymFYd0X5Jf9da5Eu3fShIP6/KdhLSXde7LXGFYUV0E=; b=ZafmtFbypazV/N
	ugA9pk8d10Zo0uOgX/akQiHAwCCLSimr0SH9kLvet/m/kX59twQ0bsllGIbOQ55Gu5+Rpmo2cjiom
	Vz3vqtrpqXSFixQEqUUMLrM30isoSKvdyqMt9YvvXNJksVt/NqIoZRnp55yoSEqFTw6dt8AC4QlmZ
	DnDdjI0Sc/Azb3AElX1tFax3iKmKOn05x7syO1kFICMi19GEQKxQUCQ7fzqIcc1Ug2vpOlyntRPgH
	N46MWLnRJNID5XAQBdHpbRwanCJfSPZOf98h4ZEJCDqItBx/2VfO6fCOFBV8MApmONvWQXoe5VG5b
	Ns5yfn2C0KfR2I+RX5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqPf-006ENl-SK; Wed, 27 Oct 2021 21:24:47 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqK0-006AzU-C1; Wed, 27 Oct 2021 21:18:57 +0000
Received: by mail-lj1-x236.google.com with SMTP id d23so5639595ljj.10;
 Wed, 27 Oct 2021 14:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vtt3o4MswiJ8Uwk5SbVoJldxGf1+YbPRO7EtWlQaYpw=;
 b=h9Sc10ekNHuFL9pzFR5ivr4ubnoV3ErBKpxwq8qtLnmmEwmpDGD4jSeaWauc76yLUe
 mSt4r4zCNyFKj4h5OR8HLlxF7zfIwR2mYZXQxAs/YUFPraXy5oJXAYRRb5XFp5DFvHId
 dp4uwopusQmPxwo8pBprt9hjoN+nwfiSLFgat9Xg5VUZGhfoEbJhN2yWrZJiei/Mb3oo
 mtgvsX4Y0EPIUr2yLJuO6jAqsOYLbfr0p9vS8kzfJK4fcF7aAzjiqNMDP4LlFTOflII0
 /Ozi7fljMZ5bdh0k27GOMuAQZgJbYkevh7WpkJcoo8VpN/Xp7c/9529BJm6xL6ZNrYi/
 VmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vtt3o4MswiJ8Uwk5SbVoJldxGf1+YbPRO7EtWlQaYpw=;
 b=8A/DquOdwIWjboWEPvklU9gD8I4/gyRjVxRiXxJnDj2DS0hzZIdQ3dM6mQjbRt212D
 hMnMWDd33+pJ+CLyz0yEWq4g4nLz3mmd0eMyYzOZZrwdaJq2UKXzwVAEzab0uMtXBGzz
 6yNRkBTf9SPqvprwch4MDQsQoA/BJwuJ+lh2ubLQFbBvG4z0i60+EN74YeEUDVOUYrSC
 U5RGaLKHR92aLTHoX3eJB/VQ1fonNgclZqAdoepU9SgMfjTMyx2vdYjReDgDYGstWKui
 NE+YiN/O0HZRVXEc+RGQZm5mMLZnsngVGxNRWBGDBwlyph68FdQ+7131pdolutvxJ7bi
 Zz5w==
X-Gm-Message-State: AOAM532a48mrzANi1R7Hc5AwVZbEAI+i/nMYlrg5n/h8BkXkP1Zf+E2e
 t19e2zm6yr2jwCsrBS0DB9E=
X-Google-Smtp-Source: ABdhPJyyBz+GAYvcNwhzUHtMKnc91wku7za2iucydPD6HlUd9fBk/92YnwCUeQIBB5tQ4kJ4zljd+g==
X-Received: by 2002:a2e:b804:: with SMTP id u4mr293626ljo.425.1635369534279;
 Wed, 27 Oct 2021 14:18:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:53 -0700 (PDT)
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
Subject: [PATCH v2 33/45] mfd: rk808: Use
 devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:03 +0300
Message-Id: <20211027211715.12671-34-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141856_472087_290B3DB1 
X-CRM114-Status: GOOD (  20.48  )
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
 drivers/mfd/rk808.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/rk808.c b/drivers/mfd/rk808.c
index b181fe401330..3bf369469053 100644
--- a/drivers/mfd/rk808.c
+++ b/drivers/mfd/rk808.c
@@ -18,6 +18,7 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 
 struct rk808_reg_data {
@@ -526,12 +527,11 @@ static const struct regmap_irq_chip rk818_irq_chip = {
 	.init_ack_masked = true,
 };
 
-static struct i2c_client *rk808_i2c_client;
-
-static void rk808_pm_power_off(void)
+static void rk808_pm_power_off(void *data)
 {
 	int ret;
 	unsigned int reg, bit;
+	struct i2c_client *rk808_i2c_client = data;
 	struct rk808 *rk808 = i2c_get_clientdata(rk808_i2c_client);
 
 	switch (rk808->variant) {
@@ -725,8 +725,14 @@ static int rk808_probe(struct i2c_client *client,
 	}
 
 	if (of_property_read_bool(np, "rockchip,system-power-controller")) {
-		rk808_i2c_client = client;
-		pm_power_off = rk808_pm_power_off;
+		ret = devm_register_simple_power_off_handler(&client->dev,
+							     rk808_pm_power_off,
+							     client);
+		if (ret) {
+			dev_err(&client->dev,
+				"failed to register power-off handler %d\n", ret);
+			goto err_irq;
+		}
 	}
 
 	return 0;
@@ -742,13 +748,6 @@ static int rk808_remove(struct i2c_client *client)
 
 	regmap_del_irq_chip(client->irq, rk808->irq_data);
 
-	/**
-	 * pm_power_off may points to a function from another module.
-	 * Check if the pointer is set by us and only then overwrite it.
-	 */
-	if (pm_power_off == rk808_pm_power_off)
-		pm_power_off = NULL;
-
 	return 0;
 }
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
