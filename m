Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98050C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9/wZ+biVKMqkYqGban343oKDQabaU7GSXwAl0018d8=; b=ofsQHugpn+hyRp
	X9I//0V8C98bg9OVP1MDG8fv+stZ0bdmVNao6npioLKvalt4aWWSiJEA4Rilupex46ZIiFnUQv7cA
	xJF+QojTmAuWE5+y31hS9u9Gbrg36F25fiBbbLzrMtj91da81ezNmfnBZpupexFQQwWJI7MU8xzaK
	8AbmWts2pMqfXge8DK56ZThhX/W3ceNABnjvrBjdyO9qb9D1fAqUQJGmkrshNYOoa/G+ZH/JKZfJe
	rawZe9qluVeZ1bJW3W85+i22eUyq37/YVtivuKprScWYcXWvJABzcPHZ0IQl0FfHFtR1lQs9SvBF4
	HnU343FF+v8rGLazHR7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfYi-00BOHE-By; Fri, 26 Nov 2021 18:02:52 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfY3-00BNjL-NQ; Fri, 26 Nov 2021 18:02:13 +0000
Received: by mail-lj1-x22a.google.com with SMTP id u22so20243828lju.7;
 Fri, 26 Nov 2021 10:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
 b=Q7bS5Bcds94ZCTDJZ73tKxITpYV8Kav4ePR+HRo9YdxSWek6px4wRJdgcPmS5hk/Rr
 VPvNAMuE26rR2wieWZvoqh2JqGKS7hi+wU3x2h17uhsQmowPgLITYDnbrjG1GwGkvefd
 hHxk6lkApAV38Oi8vIzUQfEJ8wFoDrL8RwZq4qDk19AhYWVm238iVmmmVO7DlbUJ33tI
 BLX+/0wZLAv6GevVfNs/5TC56F1I6JNn+sAhx6wYa6M2qI3hZxBZFaK0EH29RxIb8wYE
 l0fPT66HRS9VmV580SbvW1FY/SVTqBcYuvfEtu2otEWz3FsM+lLxfdinbLZf9OO11+V4
 J1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
 b=qy3eE2FPB9nbsCQXcXtENZ8cUvsmHKYxcxrK1+tkBc90enqlcTe6C6a5W6Rov3s2kp
 tm4DPBZdHZIHHMe+h4zGwpS92kzZZGaQEyQZIQSSWeGH2N7c2rmLNETSxjqw+9E4dKFJ
 SEfFOc/XAsE7E/nsj/IppPZ514aOt59Jf3Axpemvpq67WX/GWUDs16CHBMmFto2mXC8H
 u3dPC73h24UiEpGaieSAlqqL7qVpP9ah15oxK20yYMXnltHx1r6Hxza7Y6ZhR6RDUSh5
 7/r9j5WZwemiDooYbsC0mt4C1kb6cWhia9JpXHi3Wp9pLm3AWqmMKBWOtarKxOlFMCug
 1Lkw==
X-Gm-Message-State: AOAM532rat8yNF5j/d/3awKaniHKi0zb+9y00mt++hGrutIjRnd0JdRX
 GVkMs6twzrRvJcbEQ9RWgTI=
X-Google-Smtp-Source: ABdhPJw++X7mxtdOavKH8Ip6GlDs2g7F+GbwMx/tI9yDFlFB9AlrVDhMOYYWaSu8ROQpefmcYFa9fg==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr33453590lji.177.1637949728768; 
 Fri, 26 Nov 2021 10:02:08 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:08 -0800 (PST)
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
Subject: [PATCH v4 09/25] ARM: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:45 +0300
Message-Id: <20211126180101.27818-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100211_830099_31823620 
X-CRM114-Status: GOOD (  14.31  )
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/kernel/reboot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d073..2cb943422554 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -116,9 +116,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
