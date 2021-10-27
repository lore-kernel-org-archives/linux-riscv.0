Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAB4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CB6610CA
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23CB6610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TufUrwTq3Xesz/sP+gpENt3CorSGQiwGTzIlOcmqRBg=; b=MPD9xh8+VZ3PYg
	ysBOZ3SBW0hVgz4N8Vjs1U70nEjtwQ5x+rEniTaYcV+ihJm7jcPa+/L/nwO3wTFiDKi370SJsKahI
	hj2nvZ7gIRsStNTqCyqtSoILsIUda1lqq9yPbSpYosCGhoMPn7RBi6rgMHxFfhUlh/5NwiPhQRUun
	NW1kc0n9pJcZa5aJBffCdxvp9hYtFJCAfSzdm7oYV5nyqrC5VXuReJWXt4Odzx7L2fL+N3blmZaMD
	5UfqYOv6xbtK7krPWuBFNKzVZ+3uuIp1H/fd7oq5Hh/Y+kOh3qs96LjxGuZt0Ub/3cBt3mZvDTB7p
	94PRqompO3loaAvAXkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqPE-006E9L-CR; Wed, 27 Oct 2021 21:24:20 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJw-006Aws-5L; Wed, 27 Oct 2021 21:18:54 +0000
Received: by mail-lf1-x136.google.com with SMTP id f3so807154lfu.12;
 Wed, 27 Oct 2021 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
 b=RZvyurGZNweTiQS39Ean2OjgLccYrK032pC/dpD5TIetEdWActoZDZ0pbxUwZ65EB3
 f6HHqHOjaIJRkLRbNXFH+a9dD2g5xu+MxS8srOD+UoT89FXGbOpnIpBzsogwI4SrHnvI
 Xp4OXB4rFx2UJNCOe+1ontZRmKhqDl18fc0h55fLU7qhbVovqyZfQtN1oE2ZBblN4A6p
 LG+FlNBhlZ+ejJ/tR/o9Ca2I3+iU/ni7hPa9YCzdcCgi2bkMHewfSz0zfMDsoGnOZiG5
 WYH0N8y7+ABYK8jopd3eQsXttqeRRQN+xpWJ5QIjK2cUfd8tbZPE8negDAsL0a+gaJ2V
 fJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
 b=Hjz/t4vSG6B2H++0jJ3Yb7W24fxul2UaJ+Z7Y3q84edf1v+LY9xQbjYzlpECuhIFtG
 FnMvf3n4SHhnPB8HQJ3BrnBiQsm2LFU1ZPLbv+OMyQ+TEX3QviBt2McW424xPoXRTqRL
 Bou4HeFebME0d/yswd9t4nQNFfedp48Y1AXNVll1veXjocDmdKT24CD4tmTcOcgZbtJW
 5tCmBgQkdcXaF2AdtIGbvY6cuvkGoLoK/ymqjo8Q51aJFRAqUk5zyNcdaWRMiZwWoImM
 irJ9KkAkx27A0+XcOIuIsI07NcIit4rt13Un/Arl/0kW9bHrgB54itR9nPFFVnpcbJPm
 a8Pg==
X-Gm-Message-State: AOAM531aOWTIvwdKBpf+JGlfU5y2epZKd76DORsG3+sAMjUS+79HiQIn
 yLuB6yNUVC2kZVoRqf0k1+w=
X-Google-Smtp-Source: ABdhPJyooWx5IN/z+hq1uWs5thGA811Cpi77JA6dUlt/XGnE5KIxJDhql9o1FzopBJlB1UrwswiMLg==
X-Received: by 2002:a05:6512:3f04:: with SMTP id
 y4mr131405lfa.180.1635369530580; 
 Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
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
Subject: [PATCH v2 31/45] mfd: axp20x: Use register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:01 +0300
Message-Id: <20211027211715.12671-32-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141852_325214_57E6E0EC 
X-CRM114-Status: GOOD (  18.82  )
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

Use register_simple_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/axp20x.c       | 22 +++++++++++-----------
 include/linux/mfd/axp20x.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8161a5dc68e8..db31fdb169e4 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -823,9 +824,10 @@ static const struct mfd_cell axp813_cells[] = {
 	},
 };
 
-static struct axp20x_dev *axp20x_pm_power_off;
-static void axp20x_power_off(void)
+static void axp20x_power_off(void *data)
 {
+	struct axp20x_dev *axp20x_pm_power_off = data;
+
 	if (axp20x_pm_power_off->variant == AXP288_ID)
 		return;
 
@@ -1000,10 +1002,12 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
 		return ret;
 	}
 
-	if (!pm_power_off) {
-		axp20x_pm_power_off = axp20x;
-		pm_power_off = axp20x_power_off;
-	}
+	axp20x->power_handler =
+		register_simple_power_off_handler(axp20x_power_off, axp20x);
+
+	if (IS_ERR(axp20x->power_handler))
+		dev_err(axp20x->dev, "failed to register power-off handler: %pe",
+			axp20x->power_handler);
 
 	dev_info(axp20x->dev, "AXP20X driver loaded\n");
 
@@ -1013,11 +1017,7 @@ EXPORT_SYMBOL(axp20x_device_probe);
 
 void axp20x_device_remove(struct axp20x_dev *axp20x)
 {
-	if (axp20x == axp20x_pm_power_off) {
-		axp20x_pm_power_off = NULL;
-		pm_power_off = NULL;
-	}
-
+	unregister_simple_power_off_handler(axp20x->power_handler);
 	mfd_remove_devices(axp20x->dev);
 	regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
 }
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 9ab0e2fca7ea..49319a0ac369 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -643,6 +643,7 @@ struct axp20x_dev {
 	const struct mfd_cell           *cells;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct power_handler		*power_handler;
 };
 
 /* generic helper function for reading 9-16 bit wide regs */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
