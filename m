Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA69CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 23:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihGP8e06mi8Fd1bHhWz6CNfkTx9pbkq1l6FCW8DkzaY=; b=Ks3GW6avX8VgSY
	Yu7EEkEuRExmykh5+Cw7p59d9XdPop6FD0ckTAC8ipUq9vDjD8w/6dbbksrbz4qrflxqZI/IB0Q1D
	jGDKRyeqNMmX+mdYE5AQ+Sj/5UfB9PhOHUsmlmd2ihBPoEfZsBw6YloX4vSpAEOfpflueSzP1ZyDM
	ZhUCjHDyomP4VBd9767wVV1DzGPFgna0bkAGUQheVG50EhTdXNBQflOn+CzFF3grLNU0Sjjt16b/h
	hCXUAnsq5CaXGnU/Q89EVf4yPLtLogUew2gmw/BYKDVTagMHfjslQmn0FfIOJc551hiArkzb1hphw
	5c3EsGX5PbkAgG+FA4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCsk-00Gk8K-Ky; Mon, 09 May 2022 23:33:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCsh-00Gk5M-Ke
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 23:33:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id C21B61F430BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652139214;
 bh=hTMdSPi0zN4MGEkpm7fbCDxWpGgYrC/cc+PuY565mHY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sk8pDCwXSAwTQ9cVTZlPz8a8ySrGY3hGrPt+VGDskV6R+uCOw9LADMc/JKfeftNPo
 asFxJcHbxHiK/3w91N3jvIgWMJgwCq+N4MlCfsgguAazqG3J0kdIxL0enJF0AIFfvB
 qrj4DZBOnMGXRehw13w/Gqu1lXja85Nu7DH8kFwOkMscD0FBV8ggmpXlUuebyAbpd6
 13JtTCF+jbP9cTENV6T22N6ht/UOp/jY7vlhjRhQskgAm5LbyaAdU+aqJl1oWzNotR
 zhh4iJ4DmsyzvGmL9Z1V2DZh2YCAdFZhUlWdl4dlLp7iND0uYa6NncprgcDCwwXRCN
 BwArMJ/2esCeg==
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
Subject: [PATCH v8 08/27] kernel/reboot: Add register_platform_power_off()
Date: Tue, 10 May 2022 02:32:16 +0300
Message-Id: <20220509233235.995021-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_163335_969905_AAE9EE49 
X-CRM114-Status: GOOD (  15.65  )
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

Add platform-level registration helpers that will ease transition of the
arch/platform power-off callbacks to the new sys-off based API, allowing
us to remove the global pm_power_off variable in the future.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/linux/reboot.h |  3 +++
 kernel/reboot.c        | 55 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index c52f77ee4ddd..f185b64faae0 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -141,6 +141,9 @@ int devm_register_sys_off_handler(struct device *dev,
 				  int (*callback)(struct sys_off_data *data),
 				  void *cb_data);
 
+int register_platform_power_off(void (*power_off)(void));
+void unregister_platform_power_off(void (*power_off)(void));
+
 /*
  * Architecture independent implemenations of sys_reboot commands.
  */
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 982e58c11ce8..e74103f2a801 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -469,6 +469,61 @@ int devm_register_sys_off_handler(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_register_sys_off_handler);
 
+static struct sys_off_handler *platform_power_off_handler;
+
+static int platform_power_off_notify(struct sys_off_data *data)
+{
+	void (*platform_power_power_off_cb)(void) = data->cb_data;
+
+	platform_power_power_off_cb();
+
+	return NOTIFY_DONE;
+}
+
+/**
+ *	register_platform_power_off - Register platform-level power-off callback
+ *	@power_off: Power-off callback
+ *
+ *	Registers power-off callback that will be called as last step
+ *	of the power-off sequence. This callback is expected to be invoked
+ *	for the last resort. Only one platform power-off callback is allowed
+ *	to be registered at a time.
+ *
+ *	Returns zero on success, or error code on failure.
+ */
+int register_platform_power_off(void (*power_off)(void))
+{
+	struct sys_off_handler *handler;
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					   SYS_OFF_PRIO_PLATFORM,
+					   platform_power_off_notify,
+					   power_off);
+	if (IS_ERR(handler))
+		return PTR_ERR(handler);
+
+	platform_power_off_handler = handler;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(register_platform_power_off);
+
+/**
+ *	unregister_platform_power_off - Unregister platform-level power-off callback
+ *	@power_off: Power-off callback
+ *
+ *	Unregisters previously registered platform power-off callback.
+ */
+void unregister_platform_power_off(void (*power_off)(void))
+{
+	if (platform_power_off_handler &&
+	    platform_power_off_handler->cb_data == power_off) {
+		unregister_sys_off_handler(platform_power_off_handler);
+		platform_power_off_handler = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(unregister_platform_power_off);
+
 static int legacy_pm_power_off_prepare(struct sys_off_data *data)
 {
 	if (pm_power_off_prepare)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
