Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0E3C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CE160231
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 04CE160231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CDTKWrzy0GuZiTFbcXHZpROv+k/8VKkrLGYerqlEqKU=; b=kGW7MUUyoOZRma
	OHC7HsvRKNpigLeYAyY5lBrr/030XE2dkKkXd5yWXIIGmNZ6K2JZeqZbQd6z8DmfzFeaJ4dF0HDpD
	d1A36DbewN0+CVMqIokYGqSdj1RPVf4rvHnIthnmFlDFHVQ+BuG+oNWbbe07H4DH6T5W/YjTHeJt8
	QRW5XRsGwRhACwPJOZLXZLhNq4i2GLSn+E+lOl+Z6Jb7jZaaTdaaqD+gVvnMKlp1Cdy713BYFBbzQ
	kD5zMid10YTGAP4qC1rBmDs1PBeq9ne5kzyrc0l2qdgbO7rZVHY6DMUfSCNC54jaM7bhU1nq8wFtd
	MNp9ZKRt31FGGcAuN+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqR8-006FAR-VO; Wed, 27 Oct 2021 21:26:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqKC-006BA9-NR; Wed, 27 Oct 2021 21:19:10 +0000
Received: by mail-lj1-x229.google.com with SMTP id n7so6992282ljp.5;
 Wed, 27 Oct 2021 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IyeKRcg+jY+d7mV074g++I9amtFxwmtCwLh3hlXwjuE=;
 b=QnkHqeqzRHJ5AsPp67EWmABUOzsGTZSEBDGiay4nrsnQYbRzqAwsk2Smx/z5LQ/pzF
 rdPrmuGWIQsGZY0bghrDq1od6/1Zl94Y7Qb1GFsmOOrt3AmEW7aEpgHOlwWIuWg9pF6h
 Oq2ibAnCelRGtOXc03WYR55PI40ZligMz8SFKQbuKJzels1J9jjvQqZYNvv/xzelX9Df
 3ooSIaYPCZ69IQLFRxzA4xs/vR6PqnP/beBugw1fOkkPovapvfxOsncNdJLVW4zeoK8b
 skyzHaRP9ZlGt9pP4tePYITTWnPX31LYoVXuqb9igbxjWGO6dkZHNW0xRIrqWzuV8p7l
 c4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IyeKRcg+jY+d7mV074g++I9amtFxwmtCwLh3hlXwjuE=;
 b=Y6js7MsH6DoIRHN2qG12031xVaXhO5WmmsvgscWq2VH2+z9Itwxt5BEIs+HSoiDFp4
 aOt8IdBbaOJZvR+cQtDSjlB+zeyMipkPu5VnbXFScS1sr2PmpFxqhn+RoR8WtS93MHXA
 EeQSzyCV2pENCyKTuTmQo78vWZQyJETSKs+MwQ78jZi5RaE07isw6BThlrVjWzX1SiBy
 BQrO2j5xx+4pttK+D15lPGWOOdoGzVN8Vmcb1KFACg84TVuEj47ggWCET2egJ/gAUEVt
 QfN3oNeescUuGHkUnN92tC9Ei6Lb9pMaPU3Pf8fwZUcAR5jVSXNII0tbD2nvzlHiU8Ou
 8kDg==
X-Gm-Message-State: AOAM533JWPO9/hJlSl6LbE2O0KtDoeJUhtt6nSpp/xkFwyBQNjWOVgSk
 WDQ+CRlCKXU4zomUArURmWg=
X-Google-Smtp-Source: ABdhPJy4ahVYxTGf2Y3bPKsNGZG7BdaFjyQVV1JaKCPUvFr94r9L7duD8TnIWNPTqCXGHbJewLuL1g==
X-Received: by 2002:a05:651c:1256:: with SMTP id
 h22mr358353ljh.348.1635369547137; 
 Wed, 27 Oct 2021 14:19:07 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:06 -0700 (PDT)
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
Subject: [PATCH v2 40/45] mfd: twl4030: Use
 devm_register_trivial_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:10 +0300
Message-Id: <20211027211715.12671-41-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141908_835376_8F4F7E7C 
X-CRM114-Status: GOOD (  18.47  )
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

Use devm_register_trivial_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/twl4030-power.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index 6b36932263ba..72df4735d628 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -29,6 +29,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/reboot.h>
 
 #include <asm/mach-types.h>
 
@@ -923,7 +924,7 @@ static int twl4030_power_probe(struct platform_device *pdev)
 	}
 
 	/* Board has to be wired properly to use this feature */
-	if (twl4030_power_use_poweroff(pdata, node) && !pm_power_off) {
+	if (twl4030_power_use_poweroff(pdata, node)) {
 		/* Default for SEQ_OFFSYNC is set, lets ensure this */
 		err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
 				      TWL4030_PM_MASTER_CFG_P123_TRANSITION);
@@ -939,7 +940,12 @@ static int twl4030_power_probe(struct platform_device *pdev)
 			}
 		}
 
-		pm_power_off = twl4030_power_off;
+		err = devm_register_trivial_power_off_handler(&pdev->dev,
+							      twl4030_power_off);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to register power-off handler\n");
+			goto relock;
+		}
 	}
 
 relock:
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
