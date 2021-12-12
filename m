Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562E4C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+issLfMlXR5FVYersebPSGB6urL9MQu0d5k/IvOEk8=; b=r6uZSBqyU9axD/
	vfeqsYKfqLIMtfEDmTiMewN5w2GOWVZ6fB7YpB+Zr42/26zIDkXC1OAANF3vIQjqScbc1MheoZnie
	9fY4Tyz4pFs8n1NKhu0AIoGMJCizMUGKB1PeBlbGrXxLyax/+HdFrl1wuPKBgVxOspEkKsH77PGTu
	pIkOqhmTFQZ/enyAdVvKtgMhF0uJGL02dLEHYtwNHna0wElbOmi7eAIg1849swRclhQIs96Yw1T9I
	sFP7EioLb+8fa7mbjSK+2l8mnBeZREVbw1zdnV0gGDA9H8PPGP6bF55+9HBJ7Z4tDI3KMK4pjv0xl
	aRJO5YvFB3tda+Pe1tYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW1N-007Gc1-Ce; Sun, 12 Dec 2021 21:04:37 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0q-007G9I-8N
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:04:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id v15so21169943ljc.0
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fPDqjeCYEjf+DN+kHXgg7jNjsfy3nUCqOTZJ2Nh3G0E=;
 b=TVIdD68VWfHsQ5jfaqSICSZ1qOhZrUFA9mWdz6ePQHL1xqpH2YdGrbEBaLFkC7gIb8
 G5GVUsLpR7P9l8w4HUpnC9ENPDSIvCHlKYXxYDYBXpjfkLcAfFSnbF/TqDYZgNg+yp5d
 Pc9NdSlFwAt6HBoJA0bEg6oNgazZ4MeI6QmLhlMAROr2y9LwyzEcdRy2/Nl8fcUK+gJw
 4Z7GIu+SBSKJVBNrWt7sUDuuqAeIyNHaS//f1hsWBDWkktlu2hisD12FQFYSkR29TAJT
 LH1R9Pot7fCnjrbI8+c1sLGDG1QxcUxmHT1viqhxlbpmcYRwfmC1bTbrrOdOZDH6A81E
 Mb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPDqjeCYEjf+DN+kHXgg7jNjsfy3nUCqOTZJ2Nh3G0E=;
 b=jrvIQJIdbAbnTeUcOSN8YSquTxlTbgSiq3GrnyQsP8ddWDyLuE1ZZsVabbdiznTjyj
 KTwNCXoS+uQpi2wmrG+KDfJ4wYJYSzipWLjB80lFxJ9ii/QmL62Me3rOX5sgJyuNZoxl
 fPOenkeWiaAqGuP5c2n8K7vCAyclscH/CKTyxmZNnUj5xa1xHRHAimQdzEDfvwqKlGcV
 7aZm1WXKv5DIL5YHxLuDiL2XJURgdpObToSGwPa2UMK+o2d51ESe435SPmppnYiA9EUj
 GZdchE97ekAt4yyLD+LNdUvNli1fT2FNZ075owtXAQnatoY+Uwqc1sLOzVmCg8X3p5v8
 jwsQ==
X-Gm-Message-State: AOAM532aS5xqKj8cqwrwYUIS9NCS73iI0p2baOj9SI7iWBZdfDjCzBC/
 HUtcp7nc8C+222+5b4NKoHc=
X-Google-Smtp-Source: ABdhPJxIWfLkEULnkeRFIBU63iisgF81a9TeLyav941iTQFUBwsy8Hw5dIc9QJtmQkp/rhphX9SNLQ==
X-Received: by 2002:a2e:9698:: with SMTP id q24mr26147048lji.246.1639343042868; 
 Sun, 12 Dec 2021 13:04:02 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:02 -0800 (PST)
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
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH v5 14/21] x86: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:03:02 +0300
Message-Id: <20211212210309.9851-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130404_353675_AC2CC05B 
X-CRM114-Status: GOOD (  15.50  )
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
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index fa700b46588e..c3636ea4aa71 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -739,10 +739,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
+	if (kernel_can_power_off()) {
 		if (!reboot_force)
 			machine_shutdown();
-		pm_power_off();
+		do_kernel_power_off();
 	}
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
