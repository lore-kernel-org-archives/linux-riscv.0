Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA47C43219
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B80610C7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B80610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vSiY5kuW3m1JMJBUrbm8zMyId0URVXhsEdpXXdIK+xE=; b=xjBeUpNateInjl
	J/iT2rgrZw1Njl68tKSMPiEr7DkvH4cvjbXZvZ4LLuf19J+PWHBTNFBE4LEV0DlOqMsJ/t8a0Bxcm
	VHFiVts3pThdNMoifNS7kfeT1jl6Mfcv6ak2upX+UyPzd1yxpwYWrPFLDVHVAPmpNuJD00ddvJSl8
	kw+umt9hsqD98Dgq4wIyg3o0AzKJMzeLMd0h5OYd5DpkIyYGWsxM9UPccuXnx3HB7kuaHZ0lxw/sh
	UWr4jhiA3bEElqR4U1ldw0hEHJdl+0rB8gz5I9vcpI2/NjSZ2h3wU/OaSfP7ezwaWzy0IVRxpz6bk
	ykZChV5v6OKmDpy0v6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqK8-006B6Y-E4; Wed, 27 Oct 2021 21:19:04 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJD-006AOI-Sl; Wed, 27 Oct 2021 21:18:10 +0000
Received: by mail-lj1-x22f.google.com with SMTP id k13so6919248ljj.12;
 Wed, 27 Oct 2021 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=FUIf1ArHmNaCMJZ4bSQxWbL5JCSm2CJKzXGlBqJrWaAR8tSPTufWS8xOyLSwSu1PM5
 2liVJ/5r60CrtJJr5DfBlw1KykabxABPWMHDsuYjgXtr14EcQg2JUBTjbQBqUDOiqreb
 QGWgVclCqks9knb00wTu5MnkQu4fzkoUJI9+ACesDxpbb8YGJKMHlYbydkINuBcjzEjx
 IFIHDVdQgtIeC1A4mREDvIovPg1tG0nOTZB7ncUf8fLjV8foPKyZUn+53/McMAaFU2Ip
 XymrGCj037mcVReap7wcm8US/GqkUtNAHHKTZ6VwLbtZ8u26dh3C526wfrT0Bgbs2S/w
 m+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
 b=2HRTShawp7pU958QNEhgPcw5XqehOx0+0Zv8uWuZHdD3sZejGXxgAyCUUl1O32Aeoj
 iiFiOOLUSsA4FFlrk+qzL45K9jBEDv8XKZsLu/aCwxb5O5FxFmlAHzfKN7tEo1R06Rxu
 RsV64a4B13RWtlXqDsbZ4mUopWlbhL0A94mKT+LwEtWL3xMTc8sDewn2HkC2yV/J3nhA
 /enK6+9W0OuU/0Iw1uZej5PKeXXK+PmvV+CBT/r7meMc++tHhLOcTu4LvIPc0DlnSYlW
 tYbOCnXgD4iv8EkXG5uQ78waDBbIKXxapPy931q2Chx77c9tUZ9M8O6IZ1zGFxddEEut
 uEqQ==
X-Gm-Message-State: AOAM531W93LjnYIt9Wk4QfoclRWM9SB/rFAqSXBDiq+1jT+GpJRflnaW
 jI6WqdO1s6e776SsIYIwm3Q=
X-Google-Smtp-Source: ABdhPJwf9klS71294z2BVTXZCugJ9JFGgS+3s6bIBq/C8DIXy9Ezc+U1oWDuHg++RtezU/Ib7TxqLQ==
X-Received: by 2002:a2e:2f19:: with SMTP id v25mr310304ljv.281.1635369485711; 
 Wed, 27 Oct 2021 14:18:05 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
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
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: [PATCH v2 07/45] reboot: Remove extern annotation from function
 prototypes
Date: Thu, 28 Oct 2021 00:16:37 +0300
Message-Id: <20211027211715.12671-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141808_009625_8F8170A2 
X-CRM114-Status: GOOD (  14.65  )
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
