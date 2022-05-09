Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7965C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szlu/tnVWJHy+jH0jX6etefR74vSEavhjf1fG4GW3y4=; b=dYNujopgXld92S
	nHslQrqICJHlTFA/NoKrMLKsSgQLReql1mz10NmxP+yPxhJRU1diTgO4O4h30euUVbjPbwvtFuj9O
	ALoiVbubXVSzoXC60LlnpGvPj0kmgepIT8kpLRExOJ3H49iZmTI9A0f3Bg/3q6ZUFzVXvgGoTN8PS
	OuWXWoX1z5F7hsgIr5mX5o+pFNO7TujFW/NDJGEaTElJits1q8/PY90LmtnisN3TnfM46kfawu462
	0FEneGg69t1jR60SbYb7hQK2egZb+2F1K7cm0uU3t93llKPxW2jd3C1+X3Y02Nhf0hNcKIjvCoW0F
	pvKffNCCw9/SSzRJCVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCsU-00GjrJ-QF; Mon, 09 May 2022 23:33:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsR-00Gjnz-Vb
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 17BD61F41D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139198;
 bh=95ioqXFiu/sMhB4rC2pN2mOqsgk/IiTVsJJFignNnOY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kd6IbYNbTMtYO8XHzDROg022CiuVMjD14vclGIX2y/UPqQJTY83k+AAQHlzWmnvvY
 DIbOq+AJ+ca0dm9KVPtIZY6LIwJR0dvHVODvj+gWmFv2rrA23tSPFfLb/Ld7WXpuF/
 H2du8HyPkBmRsP8eQLukPdey+A1NM1blJJ0oKFmsjrsM19cx1w60DHdJiFj+BNJHgA
 CT2Gw205sJVKh3AqToaLUeLHth6M3pyFt+gPqA8mU19vHxX0uyWcQDKqZ8zNR9Nmqu
 cRtxZ2gdReA9506AcmJOJiJA6+rn1NttYLHyho2AlivK1XjmQN+dXmlaF9eF72LNY1
 oD4iLEbpsl5mw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 04/27] kernel/reboot: Wrap legacy power-off callbacks into
 sys-off handlers
Date: Tue, 10 May 2022 02:32:12 +0300
Message-Id: <20220509233235.995021-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163320_219680_97A90D68 
X-CRM114-Status: GOOD (  14.18  )
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

Wrap legacy power-off callbacks into sys-off handlers in order to
support co-existence of both legacy and new callbacks while we're
in process of upgrading legacy callbacks to the new API.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 kernel/reboot.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 672a658f21ee..2fb0357d9483 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -463,6 +463,47 @@ int devm_register_sys_off_handler(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_register_sys_off_handler);
 
+static int legacy_pm_power_off_prepare(struct sys_off_data *data)
+{
+	if (pm_power_off_prepare)
+		pm_power_off_prepare();
+
+	return NOTIFY_DONE;
+}
+
+static int legacy_pm_power_off(struct sys_off_data *data)
+{
+	if (pm_power_off)
+		pm_power_off();
+
+	return NOTIFY_DONE;
+}
+
+/*
+ * Register sys-off handlers for legacy PM callbacks. This allows legacy
+ * PM callbacks co-exist with the new sys-off API.
+ *
+ * TODO: Remove legacy handlers once all legacy PM users will be switched
+ *       to the sys-off based APIs.
+ */
+static int __init legacy_pm_init(void)
+{
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF_PREPARE,
+				 SYS_OFF_PRIO_DEFAULT,
+				 legacy_pm_power_off_prepare, NULL);
+
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_DEFAULT,
+				 legacy_pm_power_off, NULL);
+
+	return 0;
+}
+core_initcall(legacy_pm_init);
+
+static void do_kernel_power_off_prepare(void)
+{
+	blocking_notifier_call_chain(&power_off_prep_handler_list, 0, NULL);
+}
+
 /**
  *	kernel_power_off - power_off the system
  *
@@ -471,8 +512,7 @@ EXPORT_SYMBOL_GPL(devm_register_sys_off_handler);
 void kernel_power_off(void)
 {
 	kernel_shutdown_prepare(SYSTEM_POWER_OFF);
-	if (pm_power_off_prepare)
-		pm_power_off_prepare();
+	do_kernel_power_off_prepare();
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("Power down\n");
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
