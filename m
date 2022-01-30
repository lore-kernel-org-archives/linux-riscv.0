Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9BBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LmQQI93ecMFX9FQse9IKKF8KdCPkUD7XippwwfTV64=; b=O6N4z1NogHnBJ4
	K8EDj2DhiMFM/LBCKzzBZthvikdnQHc7P8T7io2TnJY8vQtJ0FEGR9+VoWkrvWBoyzy7NX64ZCbQy
	3t2ku7nB+8j9cw3WoEyRwy4lnR9BUjTUgwmyvv//xhlCq7ZOVyHClYkDsXYzSeFDNkyD2F0E8vn5h
	K8zXZxE5y9JOX1vc1O6S0u/hh4HonhCkKIxLRHhllZuSJUf9ykfd9Xrbvxumnmyi7myNdAxCaUUlD
	xDguG79q0kALhJNhYtLq2QGVOo1cCGKrUGOG5CtYM7ptZmlIqP6Ro8MdgnzXYCKaijlYgJ2km1VIG
	vWVoVX3QvA9QJZfOLqOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJnC-007gxh-7n; Sun, 30 Jan 2022 23:39:34 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlk-007fub-Pg
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:38:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id n8so23301416lfq.4
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kEaxNtq4BarrclNUiioDBF+6lBsKK3a9toXDktjcMR4=;
 b=HntJ6DyCYL+ke6f/r0is/oFtPZ4gM0JnOcriee/6UCUdnbMrZ6NOZCGasE1GEHraDu
 pCBWJZjwmgcL07nwsUauAU2GlxacbaVxZhonKlPwwFBuAdu9viIQHcwKhf5dcL+qJ3nn
 XhquQFTcfNjpbKfwUnK91j3Ge7sDIsFDFI/0mJTVowVMyA1BhEquZb8cXOuqYsZtg9aC
 IwXRQGqgPsQgyNkeIMf9S+4pn8Wundfp1v2UsKp+neG01ddR2rxW0d3I1LRmyGvULbSe
 5ToOMq/E6pAjk3+OSUQ6ZeKR1+WuSDVpNO845bw8OU98QhOQkdAG7afJAysxD5/92Ee2
 gC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kEaxNtq4BarrclNUiioDBF+6lBsKK3a9toXDktjcMR4=;
 b=ZGXoPnbW4Jw+0SFlTcCyF5BczjCVhwFLks4gs9UDvCcVTOlQBUUQgq7FGLFqUjTgLS
 4xZEr0kBuuRm/mjlHBe8j4O+y7Q0+DFPxBrTqiH71lz4+zzmm49E/1e+d1666Fq663EA
 xO7Gjbk2SNjAxT59GvPfyPPHxw+brILZRt/Wb8c15AL/6jHqwBdpfBGCS3at+xnuI5Rd
 f+CWmO+5yNIGpIFSq1IpqmYuYxU/KaA+5Xynq45bPZiBumbgRaHR0wKMjV0J7py+Vufn
 Urwaf9KlAm7kqIHccpJSu2Q1OBlSyrjuHNAx6iU+CHs/mzK5bubRgX2F5qMmY2AHxlqL
 9UoA==
X-Gm-Message-State: AOAM533ubSIgwuTmMmHh54g4AXfw0ZfmCt2W3ST4xxkio9uwK1R3b/7O
 X19oJSfrcSZsUDzr1Kv8T9g=
X-Google-Smtp-Source: ABdhPJy7y3uqXOwOev3QXphmi8L7tLYmjKiDpJEwGe8WqzvjXRaZTuzAa3HaIFQiqtNJq5XkxRnQXQ==
X-Received: by 2002:a05:6512:310:: with SMTP id
 t16mr13842194lfp.138.1643585883411; 
 Sun, 30 Jan 2022 15:38:03 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:38:03 -0800 (PST)
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
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v6 21/21] reboot: Remove pm_power_off_prepare()
Date: Mon, 31 Jan 2022 02:37:18 +0300
Message-Id: <20220130233718.21544-22-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153804_873843_A10BAB1B 
X-CRM114-Status: GOOD (  13.64  )
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

All pm_power_off_prepare() users were converted to sys-off handler API.
Remove the obsolete callback.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/pm.h |  1 -
 kernel/reboot.c    | 11 -----------
 2 files changed, 12 deletions(-)

diff --git a/include/linux/pm.h b/include/linux/pm.h
index f7d2be686359..62879bfc4b8e 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -21,7 +21,6 @@
  * Callbacks for platform drivers to implement.
  */
 extern void (*pm_power_off)(void);
-extern void (*pm_power_off_prepare)(void);
 
 struct device; /* we have a circular dep with device.h */
 #ifdef CONFIG_VT_CONSOLE_SLEEP
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 1ae5ba86b150..6e0d4deda987 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -48,13 +48,6 @@ int reboot_cpu;
 enum reboot_type reboot_type = BOOT_ACPI;
 int reboot_force;
 
-/*
- * If set, this is used for preparing the system to power off.
- */
-
-void (*pm_power_off_prepare)(void);
-EXPORT_SYMBOL_GPL(pm_power_off_prepare);
-
 /**
  *	emergency_restart - reboot the system
  *
@@ -828,10 +821,6 @@ void do_kernel_power_off(void)
 
 static void do_kernel_power_off_prepare(void)
 {
-	/* legacy pm_power_off_prepare() is unchained and has highest priority */
-	if (pm_power_off_prepare)
-		return pm_power_off_prepare();
-
 	blocking_notifier_call_chain(&power_off_handler_list, POWEROFF_PREPARE,
 				     NULL);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
