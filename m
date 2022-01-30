Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBCEC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WMsCsuQq7iW8IlE0Z4ZzZgQrmP8X/1uW0KBLrChyxFI=; b=Zpv0dX/FgdNcjh
	JpdG1dFUdjqdULjjBEYwQ29LLXKTUTM+vLiLaeUqagRQ/GgzWesYOkUMKwmRziuxDTn7R3EHJ6C+3
	a3r8kTS1U0uFRzSeuWrSMzNkunJnuJroUaQJ3KkYm/C7PsnZn0XOBocosagST69gorHBwisEf4CDS
	RMlniD1CdhnopYr/+/0TyKpDMB6l8PIPHYtatW1mwk6eBTpGG2+AHt/ROk7FJlxRqVQ4TqyfLyb4Q
	IOqCWoAvZH7V8FuykQjRq9rM5GdggH1RnmbqwK8Q1MeUMVq/VtNVU3mcYcw1UmDookyHUTWxN6gTu
	qDvwk0RwKUYR7QDMsNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmZ-007gZm-W4; Sun, 30 Jan 2022 23:38:56 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJla-007fkD-1c
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:55 +0000
Received: by mail-lf1-x134.google.com with SMTP id o12so23222777lfg.12
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onbjYH+GRuJ1H+aKPIQ3zfVzcOAEVYGJovL5WFpgYzE=;
 b=UH1XcKU9Gn1SSFj/c6UF13MQ0Jk4L0iTHT84SKL6CKoxP6s+KdtFoXyH/BcfyYDpHy
 loZc76siXQCxc0BEyl6FoScWMfzkuy0+stkGcZcwGW2GEdy+KMmBYv7TWditUzAcwMzy
 Tt6+cvIqwyyrufTRsRpGGLkldJ9LCj0ohCU13mN/KWIDXPq7wGpxAM7zRuw3yc8XG/sX
 kB5V6sSPdbwBeQeNfwWdQOiHlVD0cbXl/3KN+Taw7rwJQ9btmTdGH9V7WkpieowAbyRI
 LCnnw5FiTCZdg9w/dnOXicsOkOVxD4dBkbYZp5w48IHi/dsTV0RcMVW6iF0qd1ahO1Hj
 Vr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onbjYH+GRuJ1H+aKPIQ3zfVzcOAEVYGJovL5WFpgYzE=;
 b=pOHDgurV17BOzz8EKINMK0pvku5EJ6yrveugGDBfxPxflRIgBzxKMg7YkawjQZFD6h
 x87IxlSSXW9WEwZGPW2VMiWUPsTCrUwBpCVJ0dJ/tcAtdLVaM/chzvJkdGw0hNaV7nxL
 OBwkTM6p8fPw8qVHmoJ482hZJRg3Ge6ruro8t7P3skV9/RvgKM0bdd34DKACXzhFcXIN
 S8JTAWSF/02Tgrjt9bPzYWSY1cu8sHBqCiraqItS5nDXBS3I320zsTJ+ukGNM17/FZWT
 mOfRCUExOGuQ2oHQCjs/MykKPyAxC0AOmE0aQkyazIqfcIfFhA5kuw2LPRFoHC6QALbO
 dGag==
X-Gm-Message-State: AOAM5310KSN5v6icUTVpyhzHrAw5eOzvKCxG/S/Psx1ER0AoqxpdJd5+
 lEgvFnsQI1dVW6DUtjtP10o=
X-Google-Smtp-Source: ABdhPJzNx9wknKIs7vHNlQS9Ch9++IYsC8MJz1WUWotZ0fgIzeDZMu0xSzBho+J/7CYm9WmVvjoXbA==
X-Received: by 2002:a05:6512:31cd:: with SMTP id
 j13mr13576351lfe.369.1643585872718; 
 Sun, 30 Jan 2022 15:37:52 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:52 -0800 (PST)
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
Subject: [PATCH v6 15/21] ia64: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:12 +0300
Message-Id: <20220130233718.21544-16-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153754_175017_90D066D6 
X-CRM114-Status: GOOD (  15.51  )
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
 arch/ia64/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 834df24a88f1..cee4d7db2143 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/personality.h>
+#include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/hotplug.h>
@@ -599,8 +600,7 @@ machine_halt (void)
 void
 machine_power_off (void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	machine_halt();
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
