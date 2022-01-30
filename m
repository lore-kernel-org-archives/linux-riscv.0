Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E01C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9ouTZTzO9KXzcGoaa/+k069xT0KMruNYx9LcVQmABw=; b=tm+83sfHqdA6pD
	FXxKAID+o/NyLBY+c3DjWROkuocfXpr8QRH3TI5jXQcajrEczgiqk2LgrDEjiq2t2M/3K+vA79hu5
	Wbfg9aW3zURYv1oTXtMhO94eSVIfpUCytHJMLligGsmvpd4IUXbxLfcvkZcokzUeZffrileauXYrY
	1Bm1qcNYfxNgxqgA3Zo/Y3/164c5mYV0zHiwe+eXi6fwJj+daaFxKnIDGfswNHR340m9MpPxUoXBE
	inJ5GpAEDYwPLBFYLIlkirNH8IuIcamNM1d2mcj7ZsfquBAKpH4SRlB1zfM6QsgNlbXvTQXuuakxq
	CLFm3Cmoe1KCkLAWoZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJmF-007gK9-6S; Sun, 30 Jan 2022 23:38:35 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlW-007fgd-GS
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:52 +0000
Received: by mail-lf1-x133.google.com with SMTP id u14so23250838lfo.11
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lR6BHFjgwiTI/QHx3OYkgrWFcCc5NqsF2rCbYvrczTw=;
 b=OduVSYhLRySW+3FGo+lYc9j4W9HkKmk+97wWY4/PKlxzrnNEGe7IOz6y/PV9uhmuYH
 VbBEW+nYBK2ziWW+TStoU9eZ6gL1PkjuI1ofbTH8+TOQptRYgjmefIFtU0D9AU9yECTE
 wqIQ28X1CWgvtGBdcQInk87pjgtwqDDaYuXcwwDPa/0zDV3/S4ib2HIps9cfr/6meMoa
 dpisZE6WgAIokqI2Ya3EMFRoo30TdvDDOXKmVm0bWzDf4eWjjHx8blQrZkXRZ4mmvZbY
 iP42tSCk0c1besP2SMC/I2M1UFGm2YmtIyiDwWlnaIJMOhQK/UVloZGfKEkbhIA5KUcX
 lOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lR6BHFjgwiTI/QHx3OYkgrWFcCc5NqsF2rCbYvrczTw=;
 b=SObRVtqFsOD+7J0XnNJ8nWo7sEozW/MTvg0vu55RsAu3pIjPXHwElKHiMRv0V1xcMq
 0/PmbJnSJh8477bxiLI0wbv0f7iIAAHVAp0orHdS+41wY0CdeUCnuy+/z/Le0EwYRu7J
 1h67bwlCvIFVc/rA0qd/vJzwZiwuTpuoEi+44ACNHbOIndFQTJ6Ju8mp5VqhrqIUe4Mw
 Tvaci2RWVCGQlVG7wACqo3y7Hbvs6F+Lvlbfdz9Fi9vW+mqZrjCYW/Ex4V3JzTbBMkdf
 URcgyppnOfdlDLx1MWy2DX8suyZoicwxnCL4PP6CX3agwfgXyEbIchpMV3GxXr1wU9Ys
 Zcnw==
X-Gm-Message-State: AOAM532gb6EbK9crDXrDTgglJCe4vvUfyThTbRGsZnZcYsRDORBySvKn
 EQgIwgfzFxH/46jejzE9GBU=
X-Google-Smtp-Source: ABdhPJwExHziyQ0kLCJityRURMH34UMkV5DKgCH9gkjn+41CqzmGp3rGiEZyC8GTneOx2JMjWbTdbQ==
X-Received: by 2002:a05:6512:3e11:: with SMTP id
 i17mr13690035lfv.305.1643585868954; 
 Sun, 30 Jan 2022 15:37:48 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:48 -0800 (PST)
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
Subject: [PATCH v6 13/21] sh: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:10 +0300
Message-Id: <20220130233718.21544-14-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153750_588912_3AF0808D 
X-CRM114-Status: GOOD (  14.37  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
