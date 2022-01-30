Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6298DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F//6w/oPlpkzVf4qn1vJf5/RcIF6iEwaVRjjXx+wP6k=; b=4gxtNLH1aXPILd
	bhc0GN+j+da14EBXu3EdcNLKcPhaMJVvOoP5SRC0eWGpT2CJamSzTGKm8IqRdupkPPJtYpoT93tSL
	q6HgwOx/FevY3WoNtjq3ogf990e/YSvcB7YYSniowL6wof6+DwRNlSXNSXorsKyEYUi8clWZzoclD
	4Vzh3XfrA5oHaJvIlCe7dgMTGzNfisw7h340LrZGfUGDnRNqEFPbS3oEM1WaeHA/xA4EDI8/91Zwz
	EtiSVBBDJQYHsCEIJuhKUHFo5tnTBdMcN8fkHbZIeicxWGFRf6btl12+Cbr3YHq5Z+VaM37GytV6F
	VK6YFWmFNPJcuwKqj0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmg-007gdZ-E0; Sun, 30 Jan 2022 23:39:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlc-007flX-51
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id u14so23251133lfo.11
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wIfZ+CakpfzF/ji3grllPcoAe/10yjc1ewRUofBsGOM=;
 b=A13Wbd19LUDerIcNp/bwkNjnM7R44S+FNahenjlu62KKeZzOwn22X46AmnbpRRHSD6
 ++VeiYi+w5973OIjqsKBoqpWZd1tNrsstlD+OK5Nb2BIn3qQuUxHMsdUL9LOLlnC2oh9
 3QYxZJ6Rvcj4kbBtFo+GSvpPb2P4Us99EVxpEAj6NeCn9wQxCxqcvyPU6/Tn7QITtakm
 /V8zmLAMP0Zz48vMEXqiIlcDRfQmJ+d8Go+JSVClm5dRCb8xO1gx+MaZWCx1Y3YgBNEK
 BDZgHhW3BSNpzM/0TkvVs4HG5kI01iX7LNugVEJmEF9vWL8OTabOwQyDCncuLuPplJj0
 eXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wIfZ+CakpfzF/ji3grllPcoAe/10yjc1ewRUofBsGOM=;
 b=3uEi/uMDq62tMQIq4hPKPg50y3Est1EKzcTt3nfgAC6swn4ubNGLfDSpuwIkP+NScn
 2UvkjRgm7/0fx8uCDmmoiKGovBps/frpx7eu9Rbr5NDJsV8QKZGftPS4gWSZ7HqToZwI
 aOVUd09xmITkDQYY1TXC1hcADgZPegmd4Q/a+uzyl7tZar2cUEZ7AK3eiUlZEQ29HMAi
 3Fx9XSXs+V7KmSThBO1/LB5jwzrjJyJRUACEGyHR6lvMqzwT8BQDd/TPPOzsS82eAJM8
 8DVpSwlKCDRY2kxpFPHKJBP2BtlZiyImxSFG3pJ+gpnC9Cyvx9W++COmkxae26ftQtlM
 v15g==
X-Gm-Message-State: AOAM533nFFa8K552SZgzsZ5XVKueBl4tbAozF0+qrUtWQ9Vd9h1QgPss
 DdDGgqSDBeTIA8LGk3fZ3I4=
X-Google-Smtp-Source: ABdhPJyeM0zHMQgSAKLIY1pkC0yU7P3sq8yPWGFis8laCOZJiGOjvUQ29pFsEShO7sH0bxipvLhl6g==
X-Received: by 2002:a05:6512:c09:: with SMTP id
 z9mr13566872lfu.147.1643585874478; 
 Sun, 30 Jan 2022 15:37:54 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:54 -0800 (PST)
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
Subject: [PATCH v6 16/21] mips: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:13 +0300
Message-Id: <20220130233718.21544-17-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153756_634154_F885BB5C 
X-CRM114-Status: GOOD (  14.00  )
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
 arch/mips/kernel/reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..e7ce07b3e79b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -114,8 +114,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
