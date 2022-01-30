Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385AAC4321E
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPDC/FF5Pv2lOfd/aGx8+p9GIR9b9+3KFg0IPhNqjhE=; b=xkXb7tWfByhC2B
	5ao3EJNNHhyxx2l66EzlDYx73qJefUHa/wZVDPplZVWyQ3SFELABgOB5vEE2X4MVRs0RAWzse3DMA
	95CUpEhlwKxNIE9OUYTiba0Z8hzvPvrVqUz7X3Oure9kTte5Fpvu/Nb0e2MfRKfGuHfirW6K8FwJ7
	cr2kBgmFXSFx4yJdOXEnAikEewlpdUZ9WHqBvhafYh/4RDT/u+8+Ih/MlHg/a3zx1MFrlOrYk/Mj2
	bzvFQoMFI6J3oBbEmJjWi99hJawS7ja6jG9sR/cxCULzO+N72/o82nDZBQRhJLOZg3VA++s0CdTpF
	tjVS4beoslF+RyB3eWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlp-007fyV-HE; Sun, 30 Jan 2022 23:38:09 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlP-007fa4-CE
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id z7so17117714ljj.4
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgUqH21X35PnBCT61HDKwIodN/aq26TmgR9kDSi8+dE=;
 b=fEIAF9bcuqAzIb/0tvvq3O8BS3Czq/h/Pef82qF5eHHyasojPcfrbzHIoydtxto2wQ
 wX3GRnvjdbDLsYzgPU//nRHxWx9+vDmqu8vdYaGgwj5L8VR9yxpsog+gt5eJPplHLl4e
 kqhHMmdlDa++8c9buauTRSwKJ6jfUHn5/JsOh2KUKr7++Tl8q3EC24jzcc+1IqofA7cx
 yXwlnX+5/2eKeRHjSIgSHEbnUPlgmP3R0LM3AyLuosb/cm9cEGXdYAYHlBtd7sLoPY5e
 i0MqdVJGdefaKvtADgtcIGnn2Rb9Fp4xI/VcrEBkKlMINocLP6Acwod5XzODcGIEG+vI
 gglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgUqH21X35PnBCT61HDKwIodN/aq26TmgR9kDSi8+dE=;
 b=WBfJk678Fi9Vby5qzdTWB3zQzIfh1ICDVlfO70KS3QcLl8Oo2jYbk5lBz2xzO9JCTI
 W4D2NwC7nQ+K/QHEJlTJq/fZv6RU9V3vcjnwnMLK0ewOJbqMgCUQMgkQtMmRCEEiizCP
 x/7UjRlDvKAEo3aBSGA6Je5e2nN1igcoDAoTg5eCFllWZ2OO3sMGBLiQ6IeQ3a9YHbJu
 ICkorBasHbrnQfTYDhPnjFKKTUCauTT5vQVccmrCZBPBufVVd7Z5aHZ3Qnl+VpKVGoTF
 AMmiFFFhrg7hVzW8mD53DUOUSA3khKkDNTUQ91Nx5o//dPeTfbIXTVcP0AtJ4SHWOHBt
 WF5A==
X-Gm-Message-State: AOAM531HsN4ovbX4mJhxBMDujn5r10XOg/T+LapnaTVKliIkUey7sGvS
 8f00sHAg46nssTDgUaPep7Q=
X-Google-Smtp-Source: ABdhPJwQcQFogpM/qB5H07sE2bxg4HVgxxJELrz/nZ4JWWpyA2e1jZd2qT8OYjJChyxa9ZABZerkCg==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr12382831lji.91.1643585861720; 
 Sun, 30 Jan 2022 15:37:41 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:41 -0800 (PST)
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
Subject: [PATCH v6 09/21] parisc: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:06 +0300
Message-Id: <20220130233718.21544-10-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153743_490918_30C0C402 
X-CRM114-Status: GOOD (  17.15  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
