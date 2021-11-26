Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF24C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH1JV0LxrNHSd4aAsMnYd0DfvjywjYxR83Ujx9MLIxE=; b=mPpC45b5kH3OuS
	cxVmnQD+YeKOv/r3x1NDfRWtRgnooPCD66pZnZiWUeL2dTDP1ahmO/GlLV2Ulh4JvICIi280jB/p2
	Mm9K4eYpnJF5Uk57CvEzJM82zdNSVxEV/YhtSvJNVYnqooQiaOA0Mt+KP9nZIB2ixNj+1Pp4ZoZq2
	cDxacH1+ZRKZe5m5aCDmARYGGfsNGBhn18MuuswUk8LqypP2Sf8ioNjctTATEeafLdHSTdN5/1EbR
	i6PRKjh+pH2ltckw0ci10QjQCttNGKxYIOOY5tIohY+UbKLEq7zih8zbuuXWdBdport0qqARPfgM4
	qqsMJLJw+6HVlM9uQd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfZo-00BP5T-2b; Fri, 26 Nov 2021 18:04:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfYL-00BNx7-3X; Fri, 26 Nov 2021 18:02:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id j18so7036088ljc.12;
 Fri, 26 Nov 2021 10:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=eevKrPwZ8OfFF7dQWRFG4QtZgXf8H+FxBO4fdQv0J5dJKz+FcIsqrfLDqDJxWbQtzw
 Rannkbji9yIhh71t3alOhYeFsEEjXcmyLWuCaW9V7BsVA1f8lNz7tKjGdH7PirB3AKHB
 IL3flLkGtWTeZ8zHUH4p68dALDoMsRSunYqrHM5lkY+nPPnXI44WUInC8tt6QAMxGrW/
 VOHPLbNu1x6QmQMInswQkbNdy92fIZ+PVBjJ4MCbuGkJUycKlQXbLDzbJenn/bDFhWW4
 4EH32hyNFhAmOjxhV9Klszb0OlINW1pXNjwXREKtXPh4wreIy86PzwohGRSPMe1Rc/Sj
 2ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=neobPsbCRQJAd6sScMfi6i/9lXeVG9TNQdyZB67I6y8iickyFMzgNp3lYZ8Vlx47I7
 H7hkok7HsfDYE+d+Vz3EpofMtuL1pfICE4bLue/m86+3p7lwR4q5b0d4WXUOMhlVG7lU
 qqmXvd9JmKYtHWhZD8zwnCSHYmChbgOr62+Hb8Uerqcy73jFQDEDUaLz5hF5T65pEjNt
 c5EEMEsmNx9kEL1mPcDBtXODX1SbdlQVmbVkmFsi3sm/AUc+ojj4FGbzu+gvxbvHkeuU
 XWjOj1VUQtpGyskb+nIBtZVHxTmO/b3ZfUfA/d4KEgxfsyT59ZuI6QKuLZU947TBm2/E
 5tlw==
X-Gm-Message-State: AOAM5315NWe5Rm8Iu0LVv+oFRJQLBKHh3DBEkgCAz+mxuuW435/z375Q
 plUnuev/+vnjx5YFbTyrGLA=
X-Google-Smtp-Source: ABdhPJxWnZpc53RxISntE8TurKfJq9RlVDiB9gU+CKj56xGgbHqq69VbvXkGBZeLXBBzq19pkH3Pew==
X-Received: by 2002:a2e:5c04:: with SMTP id q4mr33226839ljb.334.1637949746214; 
 Fri, 26 Nov 2021 10:02:26 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:25 -0800 (PST)
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
Subject: [PATCH v4 17/25] sh: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:53 +0300
Message-Id: <20211126180101.27818-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100229_198502_6078BCEB 
X-CRM114-Status: GOOD (  14.80  )
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
 arch/sh/kernel/reboot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418b..e8eeedc9b182 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -46,8 +46,7 @@ static void native_machine_shutdown(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 static void native_machine_halt(void)
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
