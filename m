Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EB2C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+fWt8ivIkDtWlc/kBVG3oAG61Kt/zL6xDnfOZbXFE4=; b=CyplB7FV/Gald+
	QqftbdnDdjmvICOnOub6BxZZqX4fiOzCZSLxGLXVQzpmxwFEyJXbdEYNbR3UMXEqra08hghHsRrc5
	DQXVTdFxxqq5NQ0KLGoDjXaDvgF+Q9UT0Y2VoTuzqLryhILnkwK3XzDidcFg0Tguqt6VcEwWinvcN
	Z+wxStCbRnFeQLosj8syj1i+70fhTpiHqPbR+OfAJTU3olJ5Pyxu+2N2HafZiSkH6F/StS5C1eABq
	PHzxaIkD66ZxrHDZsKsGldOIk4Kp65yDj1oEo7254cbBPVbuZxtqETJSrvE/IGzsaeNGKVrqWcAqi
	RuFxBbBGPAC+vC1kUthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0z-007GHT-F0; Sun, 12 Dec 2021 21:04:13 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0i-007G3D-1j
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:57 +0000
Received: by mail-lj1-x234.google.com with SMTP id u22so21070902lju.7
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
 b=kywzoc+Gi7wLNuBk90TEKZW85IC/6URmBmQrI58bAL/QPFhT2prlCmlNeb9T8eY7Ic
 kaAzgc8G/0LgoIzVYO1QktoG7vKpxJJBnuwLoDt+HIA67HN4VctOi7XqEXlw6RTgsmNB
 9ZzMbAWCGvmSWTdelcaOM9EwDKrMUtEbXlVABEMzzEb6IxT5HrFIy/s6X4Z2D3yGz8be
 G89ttBkdlIOUOuEDpB9kv6rMon8ZyAqpnzA7ZSWI952xKubMgQPGXFJ+ne9aWLwQTENu
 ihN9SLyYypvBOVyotduA1RjOzW4Dvoz4sPrRK/VW5mbeHSEzk4q7EP/uMXmylA99SqQI
 TI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
 b=X57k4fEA+KHqXh78q3+3jGGENYOZAejJAQ6VKgiVLWVeYkpdxPmDxTZCkBZXu4VjXN
 ORZKO3cuFbmryGblXLslzLwIA8aLlGHakhPBxAv15FGzoJ2w3Ca3zwz55CwV0OApdL+f
 X0SWuatUrlf1ZuNOmnU9x9fDzIN7jUTURC7z3nDw4ql+wul/lnNjop3BdCFcuBXJ+KMS
 Vx4FSl2mZn0NDWi4tAtTPgxdJlm6oVwSZC2EP/HOR3WJOP6+Qb+KEnJzkXzX6lSh+uIR
 1Bl6kLbEs3JO56/F6+5qheTr3TH944ffzxgW2nRmAvbhoJlhr2PL7qtnItZ7D6vEbO/R
 0NxQ==
X-Gm-Message-State: AOAM532OThm4mESlUP7nxh23lbpc2WGSsnZ+sq3dgWuRhg/VdaXkkNZq
 GYVDcDfhLW6lMQr+5MH3xNE=
X-Google-Smtp-Source: ABdhPJwPHg+2Pz2/BonOuvJzDEEvGDrSlS58FJbScCfLgCTS8nGeJYv4KFLQDU4sli93Hwi7CmGl0g==
X-Received: by 2002:a2e:a176:: with SMTP id u22mr26407140ljl.116.1639343034642; 
 Sun, 12 Dec 2021 13:03:54 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:54 -0800 (PST)
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
Subject: [PATCH v5 10/21] xen/x86: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:58 +0300
Message-Id: <20211212210309.9851-11-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130356_122298_36C8F691 
X-CRM114-Status: GOOD (  15.04  )
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
