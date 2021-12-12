Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD29C4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfrBY0gGlEJs8dzJ+bHqT1AurrBSYK9DAo0oEVzHGIY=; b=H9zEydYGNAgq3K
	XeI8y9Y6MSxBp198JR+vtzwlwHOgxURD+oU8kA6ff7WIjnhqzE68KbqDQqV1gMMkC9oO2j76q2RtN
	oYyNCeB+opoHc410xc9YqoQc+Y9is2ru9uyuIAspO8xEU9Pb52NpG5FmCXXU/bhMYhnKUpH3klmUy
	cP52eI2U24eUvSSQvm/7uVzvkgqgVvFEv4+Qg31peOZWBrkdK9noMqmvfDD/jMX4mWZW4lJS0MIRn
	UBv62jtuzayDJTS9I1T+kvKTkk9+/USwI+wyuBbZmwqKQ105FIgeRN4TVdj5G1DI6Fu1xurjpeDls
	Asb3K0FllYh0rDLB41mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0t-007GBQ-JS; Sun, 12 Dec 2021 21:04:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0g-007G15-2I
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:56 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 207so21064769ljf.10
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
 b=cwgMkLRmIC5Jc7bTumRtZfdR/utOuYZMGz1d8ygkTHHtVzgzo42XHF3MxCIlHJHEyT
 C7LdLWylZ0pNaMDQhDT13J5l+njgSg9TNbzeMmfiPFReiWjuLN3BPKhAAriju1eHl9cw
 v0xZYrbokM5iV9yDxCHW4tROVpkV6lIWT7CatJGFsO5P7KMEX+3KZoYfdE3quHDnbdkY
 jpj2wUw+3g4R/1VtteNb23NQNkNZ2V1/PAhs7heDgq209kuV3pPkDwgZ1aWLoWFqzEEX
 OFHc08yxalGQachdnm1D3b45tSRQQlH3u/KkV4GShGX8mzd5qIB7iZpCyJ01mJBdqNcV
 pVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
 b=QXj6gdaNxY+RY0Su9yWEVe6egnk65W6XKYqM0eKa0Nf4eBQQk9i09cmXmcVa6C+ChG
 QZwcYwuomHW4ahC1TNCz8VFVvLuLSjwonA0zPeNYp35pljL1EINzxtakgTDOudX1259I
 tC0j6mGEJMsnhj4H2WeC9F+nGQttPSkMJ7kiCXIHvIFnrNOChNeOQGsz4+L4ELW6XZti
 cnIRq5aGJOMj95B65Z0s9617R+ZqMGbAopSIiLvBWN6DAk/Jr3be8ux33faAioVVUHHo
 uREIFt09/arALMSEi0j6j+QPEUsipx2KOLklpCx+Js8FrVSLwx38u1rxn7ysz5hP1cog
 563A==
X-Gm-Message-State: AOAM531AFv9MTwM0ktHVUdAH2AddEaFJUPVZNKBFDXpgySI6bTa2/VxP
 xTG9rGft+jbGC4J1qAA5DAE=
X-Google-Smtp-Source: ABdhPJwkugCxrPdxtc+DUdPqlE8VTgsZlj2PXoqJkSrC88l4/tv/AsdhkMaJuxd6V34n0G6eKbJ/hw==
X-Received: by 2002:a05:651c:1790:: with SMTP id
 bn16mr25960176ljb.475.1639343032645; 
 Sun, 12 Dec 2021 13:03:52 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:52 -0800 (PST)
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
Subject: [PATCH v5 09/21] parisc: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:57 +0300
Message-Id: <20211212210309.9851-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130354_153399_9B836951 
X-CRM114-Status: GOOD (  16.52  )
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

Acked-by: Helge Deller <deller@gmx.de> # parisc
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/parisc/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index ea3d83b6fb62..928201b1f58f 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/personality.h>
 #include <linux/ptrace.h>
+#include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -114,8 +115,7 @@ void machine_power_off(void)
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
 
 	/* ipmi_poweroff may have been installed. */
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 		
 	/* It seems we have no way to power the system off via
 	 * software. The user has to press the button himself. */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
