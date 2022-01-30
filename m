Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8E7C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+LfMO5PpisUIIZgfykgwC7jXKSH238hPUcSxkKxYhM=; b=eeIedHLfl3GkXm
	BWlyfK+FpMHr6RgaELSn0KDV9jH+Ka+Yt0ucdftDmOhI4N8SaikIbEPfKZtp0eDis3HbXEAymtVAy
	HL1AGA4JVFvayNh4woBtf/zZohri28d8SMckZIEhlKrrSLfyR3PLS/oZxEUj7iF6IaT/0U6FS6yfo
	K2pa16ijj5HwlAzuLiL4gEMhTm9uSHrbDI+yiCrTqMYM1ArHrf5qtt/xbTbZ+sSvHnHOtaF9DGpeO
	kT9abNCM6gAhz+swHwgzDO8vmgV5Bx03sEt3v5A93oXofmumVR9C6TIWbAffd8Dmkm2y7etHRJhpZ
	skfQlk3s+WKQIa0f6koQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmn-007giC-U7; Sun, 30 Jan 2022 23:39:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJld-007fnW-Jv
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:59 +0000
Received: by mail-lf1-x134.google.com with SMTP id u6so23257753lfm.10
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=69wNajrm4+G/M74hrnrqfe/8gDIP1KRo4GBjc3qiBlE=;
 b=eADmGdhywqGHgBNSOTg6DDqxchm8B8ixUxTFBRIurSpOjI9zmNGmnnTl7ImQhqB8Ei
 0mWnD7TAo0wSYeOZ937uVVcmUSkjlnYWZ7M+/JM6Dh7lyKqqc2++u6LI+atIfPTN5ays
 s+ktDvb2sLXt8MKBHLK9lwAFupFTVgxMIzESdB4QojqTGIkGjlXlLAoIu5tRpwgO0yvf
 ryjVbvaJTv11mzbS9UuOXGg5YPShB0ncAu5hIuMku9PpTrfxOLc753LOzzY0nXEsJ4s1
 aTORw1Zo0yFFM9ZCzLTV1LBU1iplcGdbnitByV0PuagiZ7HTypKyLYaRcYB4LG2Z4YgC
 xHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69wNajrm4+G/M74hrnrqfe/8gDIP1KRo4GBjc3qiBlE=;
 b=awkYcO5Ki0XJb3czlTLE6Nf+TALSeRZ9OCCfIql7JGlfr4XneI5xjiw5UdxgI+DLo1
 94PMtjxJivRCdd4kz+YtjvAMYTruR0fLenYo5xlufDrBTF13zh8LFg6xYSZNb/iGqtDk
 StVPtU+ak/AeDluZAC9pcZyt98a033MaOmKiD58EZBdOJ5IBDbwFZii/NUlcOSh9jSsv
 gIpgsrqBN8BDSkRwgH+tJPf5H5Os4DT0Mkk1QaVS7PnnIs0rjNikPG/XjAfXmz2c279L
 whq++TkW+iC3kqrUldvJRXgca6tyEAH5Ioo4+PXL/VEufjF7jA5ksVL2NQytq2zQs6Sj
 ULwQ==
X-Gm-Message-State: AOAM530x3+t5USDD84jr0JMjS6f2pnJG9v18zFWupO8b+kwVIRJxOZuJ
 p8SO00kFrGJKkyJZYQv0y0M=
X-Google-Smtp-Source: ABdhPJwNSyf/5qJrwp6Ej2liXxYcZa6QcRMNedNFLOrkN6ogQ1iJOFH/fhB+J9LuMCwJeeOYVcQcPA==
X-Received: by 2002:a19:f806:: with SMTP id a6mr13933723lff.592.1643585876243; 
 Sun, 30 Jan 2022 15:37:56 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:55 -0800 (PST)
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
Subject: [PATCH v6 17/21] nds32: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:14 +0300
Message-Id: <20220130233718.21544-18-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153757_737711_D9F44A7B 
X-CRM114-Status: GOOD (  14.04  )
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

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/nds32/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 49fab9e39cbf..0936dcd7db1b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 EXPORT_SYMBOL(machine_power_off);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
