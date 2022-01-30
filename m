Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C53BC3527C
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08Wc1WdFusZm4u3iwyNdvRUGYU78Dheb4Okt8tIAUUM=; b=0vx28ZRIuCNDis
	WnODkwJnfCHmMdY4fAy44A3H14x69xXtDvQ5M7CBxES/FJw04gDRgXW3l2CBbyRNgxn5Jegi6XvDZ
	etHRTez3La5GvMiNNU/cOaPgShYMGUs3jNOLE08Xgn0XdbKQNfXPsuq7BRyW4bxD50fare77XAue0
	rWY4GbHeO2IKyrls9kt2ji6uC+S+BPUCpDecAXYh6FcH01JnOgKQjxrNncNfjaD32sOTiAOlQmJsu
	mHYBTIytYAbQUdmd66d1GTKkl6i70VGEq1qoPJK1p5oIQDTALQlvNwa1KnZOotATCUgyzAuiECBgQ
	5vTWHb7yRnrdhASu7PDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlP-007fat-SR; Sun, 30 Jan 2022 23:37:43 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlI-007fVr-3o
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:37 +0000
Received: by mail-lj1-x22a.google.com with SMTP id z7so17117460ljj.4
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=330E/wQDWGl4ulxyuRNdR1rr3T8TzXfUiE06Vh/nJ/4=;
 b=cg3oMBxQjVviL/NNGojcXm2zIQdA1knh2bjCFHcWisBrm24Ky2GZxKJ3rws8Te7/gs
 gKmhuSiy3i3YAnHFoGCZNUdNK8mgFrgHD+dxBwbG4yZhgFFN7+/vK4MkGE5qXYuXmMVs
 bUYXaFsNJIzGbHLL09HMWCh53ba9YsZpoLFHMsubj4f9OdgATDVSFw5EXTDeZNrJ+YwD
 4i3hO0RlUhqkX+D7hyG57IC2hHmNZLq5o5iowEWUxtxxuAtbxm76BsZH9fLeaXdkEFeP
 spgNrmHN/fUhCBM448V1raIkNHUkI0ImPa7nT8ODh8UXU57uCGiJ333W57c8FPVtKEon
 c6Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=330E/wQDWGl4ulxyuRNdR1rr3T8TzXfUiE06Vh/nJ/4=;
 b=1wGYTtTtf3A9lmC9mMmX4DtX6utVowYgziS/J7pQ5eQH1gMuoulEJ0n83fV1XLiAQp
 DurWRtI9tcnHFkQu8eumGHFlcgbL1piSfRwC/fam47/DNK0D/QeCQFrGnwdfXPk+OqDC
 jDjCu8v0epgVuIWU1Z0SpEq4vxjcfVK6oBvFSWp2OhKz0CWcNQLsqorHAAN3jxeOZVTQ
 M27FgTMkltdquk2PzkSuFdWcpjdHjcX1hQXAAaWlRNWSFYedfchnkw7tn0g8dcOX6GSI
 dCM3AXlnVnPRL3rd/acolA+lfSIVBBPFszAypdTEwPogwpW3cAfkPl2d6AdvHFIhLXUn
 8tAQ==
X-Gm-Message-State: AOAM530Gp16NKxj8JSbdrIEb8gdxnxY0Sb00xDOKJWwptJgD+8CrYNjN
 6HubgwLSG7h14fj71Qs1aII=
X-Google-Smtp-Source: ABdhPJz+BlMXTarUclVIq8qzXV3P6s1WQdhrNGC7YQJ1I4ADKuUOv1DDvqkqis31Xyrq/C6PgvOyzw==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr12328016ljj.264.1643585854485; 
 Sun, 30 Jan 2022 15:37:34 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:34 -0800 (PST)
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
Subject: [PATCH v6 05/21] ARM: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:02 +0300
Message-Id: <20220130233718.21544-6-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153736_196499_13F02CB6 
X-CRM114-Status: GOOD (  13.67  )
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/kernel/reboot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d073..2cb943422554 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -116,9 +116,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
