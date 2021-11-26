Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E773C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSiY5kuW3m1JMJBUrbm8zMyId0URVXhsEdpXXdIK+xE=; b=gv2Yftd2UkUA9S
	Fq2sTGXaZEDHBpoqUPctGZlxncCozKZmuyWkqxIOyAYlW/etSpwqrHTRtv+MbGZ1uJob5cFSRz+ot
	bQJje9eWXwbaYpBzKuWIM/1eTaMp1UA30Ou+RzSJ10wt8HzIq4MKiSRyvM4tLPF/6WDBeSTnyakg2
	l9BSZe+K7pwAPimfPii0vmUgWCdfW7NOAFEAmxesLG84Ye6a+P4wThal5N6aCS09axMVbZdN8sb88
	pLOhlwxWMjTLKAzTX9x9YSGkZbDUpJCgxKGfa53Vkpw/yIN8T2GTCD5XEtL/405uSGOxjyEfIMgh7
	Rg9wCyAuLDWedIWvuuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfYW-00BO6C-1P; Fri, 26 Nov 2021 18:02:40 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfXy-00BNfC-PK; Fri, 26 Nov 2021 18:02:08 +0000
Received: by mail-lj1-x236.google.com with SMTP id d11so20201568ljg.8;
 Fri, 26 Nov 2021 10:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=hNDiDyK0mXFGn4DxizRDTh848JRSUoRpy2BGku+puCZb4ybkLBVQYxsigPgsX8oTYo
 6uGIJxTr27Sr/5uMIfvDrPYcj5JZCK4JVm0hmsmagDb+4g/16Qb2Lml6lDE5kEYxSTqN
 1cZzQ5YrCG/5jHmOAHWFPzd6RK6Nxwzyc+2hsTlnygT/PBOMYmYfgTBreyJX/cM8e8Ri
 XH/uWJcEe4LPCRWWl546Fte/fnOxNdqhmyH7lhZm2kP9gpSFr43Ku3Kops2TSD2lJLii
 3tQMh9H3YmdwyreB+CGFvAehWfGPKgIyfGRW4a8rgOWMZfouUk4VEJQah1A9TCWCHZqH
 suDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=6tS6Z4zTvnKMn98lMdQ1ZYZBurs+m96aEgaHu/haKABXfGUzXf0P6C+1jQPW1suVaO
 qZA4BF/YH12XIgg/Gc2LhiAWDgrHnWe9pA6J3u+b9676MEw76b0AFlSMLhEfus9PNwCR
 B0A39b0ADD7bcKtnmxJF31bVZe02+Q5BHeAcA6o/ZXXwr/a9Cic7JHLkuarRZcx0Obu8
 EmB/HYpP7zIxzDWjm9xvsdX6OXp3+eKGiJzQEmcrcUBBrHd0RK5/EZfFUwSm4YEc+VIy
 HmOxn0NFRIS+BkX6iOdi36F31fo+PBdq5yBrFdmxIAtfK1baEdlLEwhxpv2A+9puLAyr
 F6UA==
X-Gm-Message-State: AOAM530zAkDr/aTh7tXVdMdEaRruo/w9C8/2geiq00ZwFFd0tBQnx0gC
 UtLEQAhv4R8bAgNCuX9Xrj4=
X-Google-Smtp-Source: ABdhPJyb8kz1UEvDCKCp+BiDo+e8J/+zE/2jFszIocFNHpuea9i2+EEWlZYq05sNitfJ0uIdOtFxwg==
X-Received: by 2002:a05:651c:b12:: with SMTP id
 b18mr33869925ljr.306.1637949724600; 
 Fri, 26 Nov 2021 10:02:04 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:04 -0800 (PST)
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
Subject: [PATCH v4 07/25] reboot: Remove extern annotation from function
 prototypes
Date: Fri, 26 Nov 2021 21:00:43 +0300
Message-Id: <20211126180101.27818-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100206_854596_9D96B6F2 
X-CRM114-Status: GOOD (  14.04  )
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

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 7c288013a3ca..b7fa25726323 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -40,36 +40,36 @@ extern int reboot_cpu;
 extern int reboot_force;
 
 
-extern int register_reboot_notifier(struct notifier_block *);
-extern int unregister_reboot_notifier(struct notifier_block *);
+int register_reboot_notifier(struct notifier_block *);
+int unregister_reboot_notifier(struct notifier_block *);
 
-extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
+int devm_register_reboot_notifier(struct device *, struct notifier_block *);
 
-extern int register_restart_handler(struct notifier_block *);
-extern int unregister_restart_handler(struct notifier_block *);
-extern void do_kernel_restart(char *cmd);
+int register_restart_handler(struct notifier_block *);
+int unregister_restart_handler(struct notifier_block *);
+void do_kernel_restart(char *cmd);
 
 /*
  * Architecture-specific implementations of sys_reboot commands.
  */
 
-extern void migrate_to_reboot_cpu(void);
-extern void machine_restart(char *cmd);
-extern void machine_halt(void);
-extern void machine_power_off(void);
+void migrate_to_reboot_cpu(void);
+void machine_restart(char *cmd);
+void machine_halt(void);
+void machine_power_off(void);
 
-extern void machine_shutdown(void);
+void machine_shutdown(void);
 struct pt_regs;
-extern void machine_crash_shutdown(struct pt_regs *);
+void machine_crash_shutdown(struct pt_regs *);
 
 /*
  * Architecture independent implementations of sys_reboot commands.
  */
 
-extern void kernel_restart_prepare(char *cmd);
-extern void kernel_restart(char *cmd);
-extern void kernel_halt(void);
-extern void kernel_power_off(void);
+void kernel_restart_prepare(char *cmd);
+void kernel_restart(char *cmd);
+void kernel_halt(void);
+void kernel_power_off(void);
 
 extern int C_A_D; /* for sysctl */
 void ctrl_alt_del(void);
@@ -77,15 +77,15 @@ void ctrl_alt_del(void);
 #define POWEROFF_CMD_PATH_LEN	256
 extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
 
-extern void orderly_poweroff(bool force);
-extern void orderly_reboot(void);
+void orderly_poweroff(bool force);
+void orderly_reboot(void);
 void hw_protection_shutdown(const char *reason, int ms_until_forced);
 
 /*
  * Emergency restart, callable from an interrupt handler.
  */
 
-extern void emergency_restart(void);
+void emergency_restart(void);
 #include <asm/emergency-restart.h>
 
 #endif /* _LINUX_REBOOT_H */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
