Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CC0C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6495C60231
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6495C60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyQFE4W5P8ua9ESff5RMMUN9Gu3V2X7U0GwgJ/wIJ30=; b=ETNRWBYlqwHexh
	ZPaDF0kh9d91VVGx6QeIEUloV6RlYVKFpdS8F2P0fG2P33wl+tDifeQwCHi4SPurvzzAojTeg6Nlv
	0wRsknGMc6jPhXpx8GrnCENmoOmq4yVmWe3x5xll1Az8//t14FMJ35OMhRsdyey6kUMd8kky/kf9J
	mMoaMQD/6EcDXW0T96HqYmfpS2yUIbGYBhDQMRsiUbo5Suw2Jw/W+xKqfU10aH+CiHHEIJaQ0oaZl
	47vQ5d0vHkRkuMWO9yAE6mCS2y3TSz2h+AJvrAcWu0qnaLbkwBg9C/Pp1ugcT+d9Ry/PCzOHwz34p
	iSbT9Us9Fu2EPyxOPjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqPU-006EHY-Hw; Wed, 27 Oct 2021 21:24:36 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJy-006AyJ-2g; Wed, 27 Oct 2021 21:18:55 +0000
Received: by mail-lf1-x12c.google.com with SMTP id u11so9042217lfs.1;
 Wed, 27 Oct 2021 14:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3tizDJEeWC2iLbZdJm6My4oRtC+CKaYmiKRSIM6veO0=;
 b=P2SMTBdUazDV2Wnt33aO9FM2Ioz84SezmWonZoC9di4gBNxmpSDTZT6tEbAs+vJh3H
 Fl3mZiziafsNnSwbT1iMyr0r9bKbxSiHP3xJiOBIo4ewxSS3FiLigSFoEgJOcOsMECFU
 Ealy6ndYpUfciCkbDSvwvbDJBaKQyOcr0jiZpeL2e0iKkV4AQLDVCHRPOCPCDpkazzgq
 BERHUZw176GWVNNNOqpmpYaLAn7f4joDeIeKRo11vDGHWht2ujkzv0CrGvSNdzJe9tR3
 GFiFAzCfeg61A5JBu27BdMdrz99RW2oVhEudj/a2XZux9KH22qJjawF87cCiFM6fKipn
 F+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3tizDJEeWC2iLbZdJm6My4oRtC+CKaYmiKRSIM6veO0=;
 b=hl0JtVN7jiTbTy7Yos95F0WbjSUpgTUgPJXb5RyvL0dR3yktnUd9BtVhYjAQKi1DAO
 +T+QTJYBarWqfk6bpTsD9G31LjC1FdsnS9OLU5ezLJpp1MXAe72La6whQUO/3kdQG1S+
 Gd2oeflFmoZjLJObv6OlZKfgvp6y/CsEr7zi+kcJhjzksnQvnqHMQA+H6cCSoOs5tZNU
 32d5mZWgkbQHF2y8FSg02DvDgGM/0ajKK5q05gnyB0ADO2YGSBwct2byk5ZpbTWoNqrq
 k1tf/IPj3nEEf8xIrsFIkMtCT10QrW9PRBEegvEkNWMGxnsbT5EgDeZaQum94352/tMz
 65JQ==
X-Gm-Message-State: AOAM532j8K0n/dYTaoBUsDqvl/0UHEYZ04KM/VSZUFXZmuIY2epm53JZ
 LbPt+CWrm/u6IVVVhhz0M2I=
X-Google-Smtp-Source: ABdhPJw7dGE4iKe+cyeyTSJFUn+l5q/Abxrr3B6KYrOVBl1p66aP04j6vH2fcBbUhHRs8nFJgDlWqw==
X-Received: by 2002:a05:6512:1095:: with SMTP id
 j21mr134174lfg.274.1635369532441; 
 Wed, 27 Oct 2021 14:18:52 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:52 -0700 (PDT)
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
Subject: [PATCH v2 32/45] mfd: retu: Use
 devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:02 +0300
Message-Id: <20211027211715.12671-33-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141854_235938_BB21F8A8 
X-CRM114-Status: GOOD (  19.69  )
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
 drivers/mfd/retu-mfd.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index c748fd29a220..d18f05c1f095 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/retu.h>
@@ -81,9 +82,6 @@ static struct regmap_irq_chip retu_irq_chip = {
 	.ack_base	= RETU_REG_IDR,
 };
 
-/* Retu device registered for the power off. */
-static struct retu_dev *retu_pm_power_off;
-
 static const struct resource tahvo_usb_res[] = {
 	{
 		.name	= "tahvo-usb",
@@ -165,12 +163,12 @@ int retu_write(struct retu_dev *rdev, u8 reg, u16 data)
 }
 EXPORT_SYMBOL_GPL(retu_write);
 
-static void retu_power_off(void)
+static void retu_power_off(void *data)
 {
-	struct retu_dev *rdev = retu_pm_power_off;
+	struct retu_dev *rdev = data;
 	int reg;
 
-	mutex_lock(&retu_pm_power_off->mutex);
+	mutex_lock(&rdev->mutex);
 
 	/* Ignore power button state */
 	regmap_read(rdev->regmap, RETU_REG_CC1, &reg);
@@ -183,7 +181,7 @@ static void retu_power_off(void)
 	for (;;)
 		cpu_relax();
 
-	mutex_unlock(&retu_pm_power_off->mutex);
+	mutex_unlock(&rdev->mutex);
 }
 
 static int retu_regmap_read(void *context, const void *reg, size_t reg_size,
@@ -261,6 +259,17 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		 (ret & RETU_REG_ASICR_VILMA) ? rdat->companion_name : "",
 		 (ret >> 4) & 0x7, ret & 0xf);
 
+	if (i2c->addr == 1) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     retu_power_off,
+							     rdev);
+		if (ret) {
+			dev_err(rdev->dev,
+				"could not register power-off handler: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* Mask all interrupts. */
 	ret = retu_write(rdev, rdat->irq_chip->mask_base, 0xffff);
 	if (ret < 0)
@@ -279,10 +288,6 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		return ret;
 	}
 
-	if (i2c->addr == 1 && !pm_power_off) {
-		retu_pm_power_off = rdev;
-		pm_power_off	  = retu_power_off;
-	}
 
 	return 0;
 }
@@ -291,10 +296,6 @@ static int retu_remove(struct i2c_client *i2c)
 {
 	struct retu_dev *rdev = i2c_get_clientdata(i2c);
 
-	if (retu_pm_power_off == rdev) {
-		pm_power_off	  = NULL;
-		retu_pm_power_off = NULL;
-	}
 	mfd_remove_devices(rdev->dev);
 	regmap_del_irq_chip(i2c->irq, rdev->irq_data);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
