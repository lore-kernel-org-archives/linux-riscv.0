Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60FCC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5xmADLHMp+VfdXbceDRxgszwkjnaUSi9P8fE9Ko1ok=; b=eOOnN16d6w+NwF
	tnAEWzWIJihUFuesAsNqlRXG9Zt3alGeMhsiFk5q6Vg/du8BsY5Xz/+HanbkXV/xgEoBJDQV7Uboy
	x5mI6nLS5XN/0WfWDlkx/FkliLcOy019nXvOeIhxDJuLJVdEnsvV2S/hW3/9XMbroqZ5pwAqpRJE5
	F73o1eFSYS0GgKiAwKRRWKiMVI0/mrBvlRTK69b9MIi+wqcCQ8FGudis39cXQJMRsijLhPGAbfLnE
	hGU3qR4Sl/rbXqg+YGsgOPq6OVq8dXqMVqaoAy0M7k8+gAJicHzpXKRLNIhQg7bni3cacpP2xPnrO
	cRzcMWZIyt5Jaa8WkzJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW1q-007Gwk-AM; Sun, 12 Dec 2021 21:05:06 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0w-007GE8-7p
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:04:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id bn20so21108973ljb.8
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
 b=pRjCeelZEbxaZGwO+A2aL0XPV/VaH02YaHpKAd9wdI9JEveM57sE60GJ6XNHSn3X7R
 3k3prwg00aYmbn6qrs0hvCC/Qu+NXBudxBQ11zdQ8NwOHe1318/leMZcgjGjBHY51gwa
 7soXg88k1YVhJkGc+TTtq+bVpeCDRCSSMfOlkqSinKAC0bda9LJdWsfx6/W5MHM5/jd9
 DvPUXfjXzCMkaPG3Qy81MLfolhXJsYt+NP13KnN+kkNkRrGfJb6pVBACzy9He8+wQu/l
 eGVwkctUMedEHbT7ecy6K+YGcbliElewyWmMiaaA91DPydKzN7z1nc6/16QB5Y1JZoWn
 FbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
 b=XzcLyOEuliApljoTn/S+fQnk+vm7YRuJJibYkh7oe4CIyL7ILfz+M/wlvWVZHnEpL7
 ym/7BA1b0THkOcrB5k5Zw6dWsw0ui5WJBG30mcBFYCpIvS6gaV2u92UcemaNNVcp+ugY
 WU4Q/HpbmAI2dnvkkJlP1+nQnOMz1Jt+lv1AJwNkU6tPoj6ZVELmdLdRwG0Z/Ap/8eEv
 jnjhqDtRnVwVSRoAlWUUK+DfKKIQj55WIPOEUHK/eaKaPMXfzlPDZqpppMedCISnuryf
 s4s/02oOSOOL34jLkx9mGwx8kHFrxZ71Y3/hvSX+9lvmxm0lagUw27SMmlVZMSmqfzF7
 jeEA==
X-Gm-Message-State: AOAM533DWb05yTkSq5UkfKD91Yc9V+sZmyvWMQEaf9zdGefWszBFVAHF
 pdxi+0dRqeRTG7EdIspAsyM=
X-Google-Smtp-Source: ABdhPJxNW1DwCShpX2NDWOWr5vcKraTuFYIWDWgUXB6EPWJrHuuBITafm/NNerVkSN6nEKqLT69IWQ==
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr25360872ljp.458.1639343048830; 
 Sun, 12 Dec 2021 13:04:08 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:08 -0800 (PST)
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
Subject: [PATCH v5 17/21] nds32: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:03:05 +0300
Message-Id: <20211212210309.9851-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130410_316231_29578E9F 
X-CRM114-Status: GOOD (  13.42  )
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
