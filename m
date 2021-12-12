Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302CAC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbPV4kaCH/YjLJCIH3yaKc0zdMfAQ/NMA7mXQgFJ8Ng=; b=CBTJl8Q5GgJm+U
	awM4lcn36zBAv6HsilYPDojx8+CoM1w7I7fU8UzHMl0b8aKMoxA9vx1vIS4utYx5CH9YEvdui/SzO
	H+k0KeRGijxf57hQW8zcdLXOL4ilCXqcK+dCHM86S94Uau31w7ur04Oe1l7U2l++mgG3Se77ytbfj
	JHecZQ5aLqqOWWVA+bGA8nMo+7Vbx+lKasja7TcqmfNM7XAJlZu1/LXd2XIKQVq4WzHDscCKTRTnK
	JId3I/b47Gn1zqNlXLxT3FQWyG9ZRXES/Tw2x0dElCWN3Jgf1CZlfZZCkxBfod8RgTd1y1upD/k1i
	i7j1DwucrtLW2a4gPToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW2D-007HCG-3o; Sun, 12 Dec 2021 21:05:29 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW12-007GJS-N9
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:04:18 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 13so21025692ljj.11
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rkacp5n+z0D4++qm+Vz/WWDd0s3O3Dw6o+6i9hrIfWs=;
 b=e0sgLnYGWIpOhM1Tq0k5rzmw3sXPnMSv9iU+hJCVf1d2qA5Nwls6W/GgRoNwqoAvw1
 tXT4+RbqrP9lew0eQNLLVzr4Tn+/KG9vRK/h96X4lUdOVI3M30MHlygIEFiy7aG9PDpO
 FDB2lByxNjeAeQWlHhuXbfsu9GBOqKvBNAwh3U2Q+VQHIS07A052FUQ8qjiIdASg5Qw+
 bnUyYW2iPbQO/bwcFcC3Y3ZipEfgzZ9AKMiF5jIjxgBowJhAar6aptmeM5855rWbA81O
 OPgm6OMSIQk0izvbI4XDkhUGKMOQBJnNhuVLas8oeZvdOzzR4Cqk4Od9cWRX0+RaAnjM
 j/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rkacp5n+z0D4++qm+Vz/WWDd0s3O3Dw6o+6i9hrIfWs=;
 b=1ZheaFsUX+ELTSrnZJlBQ1lSQulLPDVEh2WSn0Be/hDZNT9inGyBThC3/voV+wTBUR
 XPv9E86SYfaeI41U9BIqd0O71Tqy2tkpy67iPi4Iy/RRnSCXczq/D/AJwjdHl4ye8jTI
 UE1LMIPKf5Fc0FjRW9RIm0RTMsH6mbHyLJI0toYhtTgNyXOdvdcPR+4RGcOSTOdgGE+n
 1U0t6CgNbpKTk0+X8ko1R8Fp7BCVBc0IZd/Uz0I/BD2RxCEd3E4zLp0ycRlIGj41XW3s
 YH09HN3TD6vSdb9n//rnEipCupUpKTn2DB/Xc6GLj1BweWMEdmhiIKmupEZxWzsBuWdL
 6JOQ==
X-Gm-Message-State: AOAM530CJ0Pbq5OV9lZvhJo/oUMlXfly/YY/rcxWQpXtq5TVwaHDF958
 ni8RIu7lfQP/QUuHsOzTb+U=
X-Google-Smtp-Source: ABdhPJxKA9uwDzy9sxWunFq5w+Qai9KQ5v2gbDC4ae5Qa508HXOmLzyx/bTP66jD881V2IynnIuisQ==
X-Received: by 2002:a2e:a305:: with SMTP id l5mr26154909lje.73.1639343054860; 
 Sun, 12 Dec 2021 13:04:14 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:14 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 20/21] regulator: pfuze100: Use
 devm_register_sys_off_handler()
Date: Mon, 13 Dec 2021 00:03:08 +0300
Message-Id: <20211212210309.9851-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130416_796647_CE7E824C 
X-CRM114-Status: GOOD (  17.98  )
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

Use devm_register_sys_off_handler() that replaces global
pm_power_off_prepare variable and allows to register multiple
power-off handlers.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/pfuze100-regulator.c | 38 ++++++++++----------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index d60d7d1b7fa2..2eca8d43a097 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -10,6 +10,7 @@
 #include <linux/of_device.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/pfuze100.h>
@@ -76,6 +77,7 @@ struct pfuze_chip {
 	struct pfuze_regulator regulator_descs[PFUZE100_MAX_REGULATOR];
 	struct regulator_dev *regulators[PFUZE100_MAX_REGULATOR];
 	struct pfuze_regulator *pfuze_regulators;
+	struct sys_off_handler sys_off;
 };
 
 static const int pfuze100_swbst[] = {
@@ -569,10 +571,10 @@ static inline struct device_node *match_of_node(int index)
 	return pfuze_matches[index].of_node;
 }
 
-static struct pfuze_chip *syspm_pfuze_chip;
-
-static void pfuze_power_off_prepare(void)
+static void pfuze_power_off_prepare(struct power_off_prep_data *data)
 {
+	struct pfuze_chip *syspm_pfuze_chip = data->cb_data;
+
 	dev_info(syspm_pfuze_chip->dev, "Configure standby mode for power off");
 
 	/* Switch from default mode: APS/APS to APS/Off */
@@ -611,24 +613,23 @@ static void pfuze_power_off_prepare(void)
 
 static int pfuze_power_off_prepare_init(struct pfuze_chip *pfuze_chip)
 {
+	int err;
+
 	if (pfuze_chip->chip_id != PFUZE100) {
 		dev_warn(pfuze_chip->dev, "Requested pm_power_off_prepare handler for not supported chip\n");
 		return -ENODEV;
 	}
 
-	if (pm_power_off_prepare) {
-		dev_warn(pfuze_chip->dev, "pm_power_off_prepare is already registered.\n");
-		return -EBUSY;
-	}
+	pfuze_chip->sys_off.power_off_prepare_cb = pfuze_power_off_prepare;
+	pfuze_chip->sys_off.cb_data = pfuze_chip;
 
-	if (syspm_pfuze_chip) {
-		dev_warn(pfuze_chip->dev, "syspm_pfuze_chip is already set.\n");
-		return -EBUSY;
+	err = devm_register_sys_off_handler(pfuze_chip->dev, &pfuze_chip->sys_off);
+	if (err) {
+		dev_err(pfuze_chip->dev,
+			"failed to register sys-off handler: %d\n", err);
+		return err;
 	}
 
-	syspm_pfuze_chip = pfuze_chip;
-	pm_power_off_prepare = pfuze_power_off_prepare;
-
 	return 0;
 }
 
@@ -837,23 +838,12 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int pfuze100_regulator_remove(struct i2c_client *client)
-{
-	if (syspm_pfuze_chip) {
-		syspm_pfuze_chip = NULL;
-		pm_power_off_prepare = NULL;
-	}
-
-	return 0;
-}
-
 static struct i2c_driver pfuze_driver = {
 	.driver = {
 		.name = "pfuze100-regulator",
 		.of_match_table = pfuze_dt_ids,
 	},
 	.probe = pfuze100_regulator_probe,
-	.remove = pfuze100_regulator_remove,
 };
 module_i2c_driver(pfuze_driver);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
