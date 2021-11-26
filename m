Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1043C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg3a3o5uBoibDGg1NXmhn0EqAW2L8TsfzntmQhB8Y+I=; b=tl8L0xs7BxSv5/
	v/5x4LcNkMymW3Ld6hODdk/LgXD0BMXswQ+SV+iW6FD8+NGQTa9/17+cQoNxPPcs2YBv9O20Ju77w
	ICTMcY4/WwwAhiE0RIw2hCkDRhiipGoTuvjftpo8KYKZ8XMCKBkVnDmduEQ/4EO+B0ZPN32SaK8Ls
	H9hfS/92jgZg5bUcEQRBan7CpsqMzu6zogIZ5tcEI+KSyXs+W8Lj2RpWozFO+0j3OwLn9Oz4aRjK+
	3g3av57imOPut2gPlj/k2Ny6bUsCyLL5jkbK3MK7iPKYVti3nl1pBbEr1tgds40XpdOcVHXN0wEh5
	6Eh4kVgdnAEDyGkhfwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfa8-00BPGu-7l; Fri, 26 Nov 2021 18:04:20 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfYP-00BO06-2i; Fri, 26 Nov 2021 18:02:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id bu18so26241648lfb.0;
 Fri, 26 Nov 2021 10:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
 b=RkrRcUL3/unWl5TLL2UiI+cIefalNliyD5OZ8qBWw0vd5FWVYlkh2ZGxC2GwymdcF4
 FnuqzFOgJ9BQ/mBjQ1gcA0nf/x0BiZJ+EgXuRos6k9RF6wtv8mydobglnFTyFDM/o/7U
 fUeyXvBvL81voOpGVAlVYzb32boxZjAVRKIIq4IpzrY/VR/M+S4bjgjU1NP9DjKotc3U
 /A+mqp3e4jEEb1Fop04zzVJHmitkr6/6LmFJtLtIeynw10291TBv/dm7oq2oOXHDw/W8
 iLFwl6qMiG8Yr5CgCHF2n1M2IZGz5jiLQvM+yQ7bLbZ3yifj62/79nyqg4+7ZdM7pcg3
 hbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
 b=jxWVcZR4exIdTxo9JyuDCVglv6HBQB1N+RHI61Y18G0MFgbCtj9rv33OF+uFFcksty
 +dWlyI2/CCKGRpmcQVmOaX+ZvzDh3wz3nz1A8FudI1L4Ud4r28xGyH5sL7VDdpvwttPJ
 x4iIFLTQ6MjflnspMLt8yRDtkWeFAlVFxZ2rd6x9TxJ9UAHY58pkcvvQU+OjwoXJVD7H
 XP/5QHY/7Fc67x/bKGOahx4vfOhwcH0UATUhkWGsIKvQh22eU/8nGlhD8m87uulUMSh2
 paFw9f1SC7qVoluSoB/0VkSZ3GJ/nr34N4OQOTmYNqhZHJwyZoPfJ28utKuc0iAyF2xk
 63mQ==
X-Gm-Message-State: AOAM530fsoVJNMk2TwrhRhGWHSrb76MDzDNZXFS5ErTRe4+X9suTYXoB
 SNI3QT/albno6SD8U4Rn6ig=
X-Google-Smtp-Source: ABdhPJwkZw3p0myZeHiHt7tYuC+kBTtIH6I1XgMcBHRb2HpPdyNP738dU9MuctCnRALXDO2n+ThzAg==
X-Received: by 2002:a05:6512:114a:: with SMTP id
 m10mr31826169lfg.54.1637949750851; 
 Fri, 26 Nov 2021 10:02:30 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:30 -0800 (PST)
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
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 19/25] ia64: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:55 +0300
Message-Id: <20211126180101.27818-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100233_235156_4262A4F2 
X-CRM114-Status: GOOD (  15.98  )
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
