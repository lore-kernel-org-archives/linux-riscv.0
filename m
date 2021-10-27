Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7001AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D5360231
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31D5360231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zt5t0pvKBA27Xir15PoVxPsa2PYVEKXKvnZF+Cg2TYA=; b=zBms3jMK14dabc
	gXCE0Wq3a2+P6tYcEhp+0GFEnwUwIf+/sK36VyPZBQ6AcNr1EzTWtWWUsnUd+zdKLW5Bj2EeFt7Hk
	BHWqsJfiwhHsOd1ep7SY4UYYk0jzzYGnd8UajqQlPmEURmEpF769tCY5IOzi+qRfiDiQv9mV0ko66
	Rdc9CSZryI9DvWy6KefW6x3Ea8hsZ+/q3Z/FsrAAozLHOnF1QFfGNekWuz1rXvmoRO9V/A++gLwaG
	azmnihiT//HDX3c7axb7n9AsbWPlG3npmyT4Fq9wvsAtLI9WkVYuUwn6iZVzvrjxHM1YFRsFMHJ6n
	qubXmyitAzqyKcdbBj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqQt-006F2h-Ux; Wed, 27 Oct 2021 21:26:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqKA-006B8V-Oh; Wed, 27 Oct 2021 21:19:09 +0000
Received: by mail-lj1-x22a.google.com with SMTP id l2so6987500lji.6;
 Wed, 27 Oct 2021 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
 b=TlGsLZtcrVzUb7sAOhif3p7pVw8LafC2xLy1EDPy1NIwJl5MQQvmHy2JQZYszcOE8Z
 bpdCDmyEM5D03Couzbs3VVZUIdamWSCPF0yzl5vvizBqtDssLI1790jRM+TPIcawNrlD
 8STEeq0OEOHvy2rX7OXiOWUq9V+Wbq3xZg3vhjF/dealnvdRkEuGDx5b0mmtoBXsa4Tg
 7gFUHQvvLRw3QjAUV5dCuqij4emeiEy4r7tFICkEZrQaaXXABdfN2M8h/mxrxQbImqYG
 GaGzMOCXHjG+QuAc4Dq0gK0PotuHucIYhVqvi35iVuJc+hGZhg1h00rdw0kra8k/EpLO
 luJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
 b=kayLgUaV4oD1jAVdI2PPh7M3tMWg2HEe449zMYsCgxAMJeUSzYah/JfHteZidZYQ/M
 h5QvRNvPjD64JeUNgvhzoKfZaoslnnqTWowHOH3LKbwVv77kKyCrn7PDY4HIAAhm2LMp
 ulTLFQuBJe+OHhVB4sOfApu0imtoDIIUOeq00ocsWTwIErXlgJF1wWTIzw9fHfp42AW4
 T07ejlJ6ZV0zoqp7h0cbTZinvwf6y9u4J9YNEkhAQCorOx2ow5xS8Rxu6h/bAYujyJQD
 h0Mobn3s86VpSzM/RbBOzf+VfPIQaHoCSYkMlowFN3snS0LV+P7RM9wjWc7klaH4uqJ1
 1Amw==
X-Gm-Message-State: AOAM533M9ollq72FAAhI+kdadJmqq8OANUlr5U6sraww0Rl3L0Kej4Ty
 AVxraO4rz64ZeFOZn0eqJ30=
X-Google-Smtp-Source: ABdhPJzDbMhKltt/cJ4cLHVC7lvSJKFFWBp4i2pL/KBXA4D8sI4Ihh3wNKVdm9xKvnEcHeY8d+ELCw==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr336408ljl.522.1635369545290;
 Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
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
Subject: [PATCH v2 39/45] mfd: dm355evm_msp: Use
 devm_register_trivial_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:09 +0300
Message-Id: <20211027211715.12671-40-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141906_888713_059F1A13 
X-CRM114-Status: GOOD (  18.13  )
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
 drivers/mfd/dm355evm_msp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 54fb6cbd2aa0..5ee830f65589 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/err.h>
@@ -375,11 +376,10 @@ static void dm355evm_power_off(void)
 	dm355evm_command(MSP_COMMAND_POWEROFF);
 }
 
-static int dm355evm_msp_remove(struct i2c_client *client)
+static void dm355evm_msp_remove(void *data)
 {
-	pm_power_off = NULL;
+	/* FIXME remove children ... */
 	msp430 = NULL;
-	return 0;
 }
 
 static int
@@ -392,6 +392,11 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -EBUSY;
 	msp430 = client;
 
+	status = devm_add_action_or_reset(&client->dev, dm355evm_msp_remove,
+					  NULL);
+	if (status < 0)
+		goto fail;
+
 	/* display revision status; doubles as sanity check */
 	status = dm355evm_msp_read(DM355EVM_MSP_FIRMREV);
 	if (status < 0)
@@ -416,13 +421,15 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto fail;
 
 	/* PM hookup */
-	pm_power_off = dm355evm_power_off;
+	status = devm_register_trivial_power_off_handler(&client->dev,
+							 dm355evm_power_off);
+	if (status)
+		dev_err(&client->dev, "failed to register power-off handler: %d",
+			status);
 
 	return 0;
 
 fail:
-	/* FIXME remove children ... */
-	dm355evm_msp_remove(client);
 	return status;
 }
 
@@ -436,7 +443,6 @@ static struct i2c_driver dm355evm_msp_driver = {
 	.driver.name	= "dm355evm_msp",
 	.id_table	= dm355evm_msp_ids,
 	.probe		= dm355evm_msp_probe,
-	.remove		= dm355evm_msp_remove,
 };
 
 static int __init dm355evm_msp_init(void)
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
