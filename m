Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05D0C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA3160C4D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AA3160C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dg3a3o5uBoibDGg1NXmhn0EqAW2L8TsfzntmQhB8Y+I=; b=f432tJMWVm4ogH
	V3vmunvkn5Q4IA82No+XWn4w2AfWTurjBSxQ5YVAgYa6qB/muYl7RCR6fqnW+AJcrAO/YG7A6Vmpz
	fzx1EDYJlKgcNbvBge7q/YnS5U6zTbnDO7BPajkA2L/YlUzUeiMHd+nCRzL3ju/OtFKr5N3bP+1xH
	GOevA8sQZ8tfxdO+r5+R6gFydqfrjVFVQFyAzYkwDlbyIfldFcp4QXTWEHHoidgZTsWs9nyVES0c7
	mDFqepu+k11OaCT8qWmcTWQNPuBM1LsIRFFqyBHyYOysCzLlRbZYbkQz8h7MI2ouOJZ+dto+yEDg8
	X/+7x43oSDbrAMpQiXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsqi-00F8X9-8w; Mon, 08 Nov 2021 00:49:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspf-00F7eC-Aw; Mon, 08 Nov 2021 00:48:20 +0000
Received: by mail-lf1-x12e.google.com with SMTP id y26so32419845lfa.11;
 Sun, 07 Nov 2021 16:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
 b=hSCECj6oief95mUKAFt1aYs1z2BhI3PyCJpHbMUlNZ/M49sY1G7gzTeEyttE60gMak
 BF+5uDSKoSn4CaOELlWWJK6Z03Rk6y4HTwrmSVMcH4REAv0cUqJCMn3qEJCUcKMx0Yg2
 hZUAWfnWhmv0u8d55RvvttbeCJzqzTllkqZ8sZrYO0dyywzXm1H9T9B85gH//tK7VGaP
 LSTKHt3pU1K6UjbgljgztfzIXizYQhXuqyNy4a5wOAJ6zgoCDgTzWA5VXtRTbqr75uP5
 JNN1xexiLEoZfDmssN9kF5V9y9vHzkvg7OruyPjb23gGAachOOiZE7sCXiHSj3rLrdzh
 uUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
 b=8A0JImPflwrgkN0c9cXp56RyfjOd56celYYqCG8d/WfgZXMibyE1Fy7rfjMCH8pAkY
 xtcn3IkyrwNRjVQgjmACmmOTwBsfVtVx6RLnmHd+Leh5e1VjWHcpxuCbmRav4epZMWZT
 sUglciQHi+akEbixbjjUC+OSxoP9e2i2nDEVDTCx43wk22yDQrAEDpBK7dax+cLVvvmF
 V09ZP85Sbvx7m1iO3EDTEKk5pb8pFGyyKAllMDj0BDJdd0ipz41xW0aH2sGqK9J1c+CA
 c9Ym6FMVZpAPocEXK44ZQnpSFqkdEArLC50mHrLRCWeJF0hLeYQCcEyii0BmvVyjH6BO
 WEhA==
X-Gm-Message-State: AOAM533280q19u+bbvvxsK3QbN8vVnyIs4H6LBwa9K5wXCcCEtnK1srw
 rBaczE4FpBxwNwxAk+SOYjk=
X-Google-Smtp-Source: ABdhPJzYDrvoemDzHy5lRXulk7VBYq7aeBqM7UdlzGSCmj4dbWeKpvaVLmRfE93Wr+MuGPe+b8E4Uw==
X-Received: by 2002:ac2:4e13:: with SMTP id e19mr3337438lfr.561.1636332497640; 
 Sun, 07 Nov 2021 16:48:17 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:17 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
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
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 17/25] ia64: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:16 +0300
Message-Id: <20211108004524.29465-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164819_447326_46CED6EB 
X-CRM114-Status: GOOD (  15.94  )
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
