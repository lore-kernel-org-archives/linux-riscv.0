Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044D7C3525C
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dd7dzB6Xsf8FK0aeFYV6mje09QkgmZ/oGXLkH7GEbpw=; b=rrVxwbP/UhYK79
	/Pu67sw6mezKpGAoPOJ7cSW542Vjc9ZH7GhN5ZtsZTm7oKjZggjtG5R+QFbvUwACv3AgLZo6kLB5v
	U2xC+0v7fBEq1+hVh1Zy5nrtnTMPm/MynZDZS+QT1ILn/uOD2Ct0PxVqHUUTmMubyfqP66oe5EHuI
	NXbL/h56ulckf1dOLfDqBdRFrwNpdg7yhzSLrVPXodVO0U+50mR4kOvIy2NLsQrTOxtVPWdqtm6A2
	QCBTdwJTRaa4pGTQeH9MPsjJTksgROF5blxQW+3DMTZmALhxXhsTxQo4l/a/R1mr3RiPFBDM7vIwu
	LBHFNiohC98Q10iShGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlu-007g2Q-5y; Sun, 30 Jan 2022 23:38:14 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlR-007fb0-6o
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id z4so23316454lft.3
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=66lCIOUKcPJ2J+m4Cr3ZW94G0lABJXZaED/s9f5QGmA=;
 b=IaLlORDZoeaYRpO44854hgYk2/vgTJOclvwIF3Vv/dy/WRswOVfYMTb/lgYFF6u20R
 kgD4kuaMUZhPrzrsrp+1aHUtVBmfCdIQHjkOsK+D3JxP5SLPXm0dCS3YEeqxtX5eYSIx
 8EdSobISpvnT22JqnHeoUtNW+EX+/cnH1SeCCQB6STOy1ozdbhelGYqvV1xMpt5YBA99
 B/96htM+mne2xjdlCrcPFCtKPM7GzoR7BZlH1OzPT5hR1hE9cLpw2j5lrnPZ7ZPlmwwI
 nMOCD5Tt0vJ4ks8CXxb7pk/YLn1ILllHgnHrKEVAgGpxNOjR5JCV7EBSVseqXYt1IKk7
 FSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=66lCIOUKcPJ2J+m4Cr3ZW94G0lABJXZaED/s9f5QGmA=;
 b=RCILfL7hqFDkVaUrGw5jpSE78WCHeYvvfNeTHVBSl4MBaFQRUqGd9sfNiOd1uzQ7js
 Hqwve2ZBOrMbTxcB4dhjSvd2/DCn6s1MihRt2CwMEcqrRfSdTl9Z+VMIx7mZi8CZFTpm
 r65eK0tQuxrSMrCwyKIQJbmCJ0ifWWin9cYRHFalGafHsfaSP5pZoNYYqHSHkCt0fhOK
 8RQhTDXbneVmWMvjP0WMwe05qxnl1ropU/Yixxh0w/LA9UzammzeU0Oefw9eMzvdzp58
 BZPeGfNve9Z0JyMBS9/1KXG06ZXTjvNyiAzUAlwcsbKtC4z0rlT5oxsi/QkVwJiBcfPy
 vTtg==
X-Gm-Message-State: AOAM532KlB0UmUiVPXZ8EFGkRQgyAmLdbPMHel3URy1R78qatUWPd8kR
 N2TzZcJTqLmtovQ53sN82iw=
X-Google-Smtp-Source: ABdhPJw0xUt9j/jtl0uaDt91Bsr3KfV7lR3RRZqMVEqi4OIibegSJcLOPzN3p/u9YZbK6f72FdmH0g==
X-Received: by 2002:a05:6512:3091:: with SMTP id
 z17mr13662510lfd.216.1643585863533; 
 Sun, 30 Jan 2022 15:37:43 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:43 -0800 (PST)
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
Subject: [PATCH v6 10/21] xen/x86: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:07 +0300
Message-Id: <20220130233718.21544-11-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153745_316377_1A879DF0 
X-CRM114-Status: GOOD (  15.85  )
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

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/x86/xen/enlighten_pv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5004feb16783..527fa545eb1f 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/edd.h>
 #include <linux/objtool.h>
+#include <linux/reboot.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -1068,8 +1069,7 @@ static void xen_machine_halt(void)
 
 static void xen_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	xen_reboot(SHUTDOWN_poweroff);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
