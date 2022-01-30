Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B878C47081
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yA8Jm7rL8yAzufn9etkeC1NcevNdsuH0EnFn3Pahys=; b=tZ95PQW6vUPnNG
	5CfmT4TnAzhhhEEUfrQMRidXXx4QZsXpb8utLeVTWrqVR0bHf60No/L/DXGH7IWSEefs2hglTvb9F
	8toCsXJs1OLu/AFKb+bg34YcRMJrAQXvM3pCRlgEfwfK0F8jyhZ9qXC889Z5do9KSXACVBXdjhgwd
	Hpno3GeWURbocWt03SSTHsyMzxBwY69TI5szibwIJUz9xHp+vwVjtvpLdY6H2gooYtjkO2jQRn8Ss
	UpdMJZ7JQYTr6u7QeT6vs5opUNP/bqTf4Ytr6/lu7IwtDPd/0g0ft9ZeULcYp7BEyagWR2Ukay6uC
	q6NZ3xv2gY+o+AKTCkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJld-007foZ-RI; Sun, 30 Jan 2022 23:37:58 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlL-007fXd-L1
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:42 +0000
Received: by mail-lj1-x230.google.com with SMTP id t9so17055762lji.12
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVg2kfJsVdscnSQmsGQYEfiSB/7tSvJBE6eAcPu7Sek=;
 b=c4Z1zQFdWlsKxw9UxAzj2ZQzBVH0IlXZ5Q9hlT/o2eauoc+12KgHtyZnfnu9QRCul7
 XIq2yfEDvsyi714qK62uqrcXiKbZ83JQlipU755myvbplyaKCzIx8SoEbYZQx1g2QPK1
 ZiW0YJxW7z6xKBh2ESJStcRTergJa9YSSKnZXGs2GFxaXBnqnCcNoIMPWorMJ7h8whhy
 F2xnNh9XSw25BmP4Yp0yjpYr8c279tQye0/GiTHl+WGgBlBd/yKdunLMFcBd5VjP++Bl
 z5q6iip6mJ3MI/RtrvT6/DwKfRUy9WgbSLddepD6tmbzL6Xf24XNQo71hEy43Zt7gMYI
 LH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OVg2kfJsVdscnSQmsGQYEfiSB/7tSvJBE6eAcPu7Sek=;
 b=BPg4g2mT/wSXYO7q0e4eqj2BBlQvg2EK1Ph9DPtQfwfMMGmCqXM2aWwhUvwLkoLqMZ
 IbIR19TRA1qM2Xx/0xV2ASG1KJq5zjnu0lPF0yIuqtMu2bbBrU09zYHJNE5JHpjaQhQ+
 3mv5Wg2io6kvrOpLKA6byKji8D4c4OToWFe51FnGtZc83P1iOyG3Oi4ZnMZ0GZvJRgih
 X1FLrtmBmlhW/1MfqELfmSDAhRq5Yb7xRKP4R6rDsqFDQ+vxJB1XAIcRim+W2Qf88RQs
 k+mzieQja0lFdK9YARiVgSTNPSzDlSY3/EZaExD9fZnIxeYFF9x5SAK8oz3zFNEFRsgF
 9uYw==
X-Gm-Message-State: AOAM532h8UGdzqHV2Vm82hZoRDWBlkKaqclIZHNe8ZmVJ2m4mFEvH9ai
 1crHUJSIhd9h/GWnWi3PVgM=
X-Google-Smtp-Source: ABdhPJw0o4UVP5/vUUv/1Chd11yJ2CJCMOQv44y6t1B7x180Ayz+XFBoJsJgXLguCKSrO7B2enZNZA==
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr12381352ljg.340.1643585858043; 
 Sun, 30 Jan 2022 15:37:38 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:37 -0800 (PST)
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
Subject: [PATCH v6 07/21] riscv: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:04 +0300
Message-Id: <20220130233718.21544-8-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153739_756623_1A6625DA 
X-CRM114-Status: GOOD (  14.03  )
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

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/riscv/kernel/reset.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 9c842c41684a..912288572226 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -23,16 +23,12 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
 
 void machine_power_off(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
