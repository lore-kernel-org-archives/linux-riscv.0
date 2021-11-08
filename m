Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB050C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CC160C4D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74CC160C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ughxHXQlkbvOdMMjZc0b7oWkDdhUUulg+tB/eILHnY=; b=NKg9fedYWZ2Y1S
	bJRfnQX+vbA2BObQMjLOeOQVirnz4MVUpRjAtF7SNt4TGjd6FcXPFxlpSOpn5VxWEMyA4BqmkX5uL
	izYGb66Vp0pjdRrHzOYi/eRhmEYFabsAXz5dXZhJe53eZuirXaB8lmTs0D+xG9hhdFoOfQ3RlnaWi
	72+PMvYQVCkzUIfnZ8LzIc8CxD4fD3tgEfUJRtuw34qWFdV/37W7k/KjPYYm1gW+wp1fh47i4ybq5
	g927kea6wsoVrRfgKeNlVIX5PYsXwGIIsmaFYBwOITA4gjX7kRF7BVklWqly/zSyDwuZt5tNiCJKt
	sx0/aDs8vg5i9B5SQjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsrd-00F98F-DE; Mon, 08 Nov 2021 00:50:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspq-00F7oV-2J; Mon, 08 Nov 2021 00:48:32 +0000
Received: by mail-lj1-x231.google.com with SMTP id z8so3357780ljz.9;
 Sun, 07 Nov 2021 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfpn4GjmPLTNTnhqDUdqufcuPWBAqiXi1zu9JyEbhbk=;
 b=W+BA6i1yQfPHIvKbww0H/Kx11NRHF71Rxe4SzvnJDlq9uOKEN4w96ovj4OquXqfPQJ
 JCbSMj3tYPJKeCx5ruhMxqh9HJs5RtCzyXJO/lX0VrHMlYovhvUDgzUTuXzAvRaAEx6k
 BQjK3uMGMr9zDhSEkM6cFPwapFEkDP2nhbeboGEs7tpPwcQ0ORLVbdqRCj1JsmfdENWp
 Wouvje//jgWEX2Go+W+RKzH6ZjhuUXnF7t/nwShOxV4e7SlATuz/nLumpcFWdS/dBBBB
 eU28/GWtwfAP3B25fdf33iLfMN4macxZ7oQWLC6+1CIjVCLAfP+kj1aowIKfSp3wSgHJ
 6KxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfpn4GjmPLTNTnhqDUdqufcuPWBAqiXi1zu9JyEbhbk=;
 b=uIlkNefSp0KjbtxshyvXXim2g8oqH4mI2c1lNcSqKHc4BQwV6INwyzpTtwoiCkQXGw
 MzAWNeYJDCMO1FWYD/lAhYWI3qen+nEb9VdGiBjZQSQyZEFTPF99QGEA3Noij7KyI1lz
 kgEE9DtChu43uSP3XIvcpB7T+CHvKGH4IdW//vq+gWBvZmrossX04slTErSSDw+4v2Fx
 KatTfiEdPieE2SCLXwlkdC16evknWiaDZ69kcF31Xa18BTvyQ2IyAdb03maMrZehxLCp
 TyL9kRNzIO9DlqrSI8AiNJJD8Xjqvfiaxs5QYvirIviZA+iBgqHVWo21a+wmxfV4C8dn
 COYg==
X-Gm-Message-State: AOAM530uNBYEfl/qWq8MmMH0+aFdjVgZyjSDi/YAI1vVrj/t7xIPiH+R
 jScuc/ycMyjGNTw24dCvwFU=
X-Google-Smtp-Source: ABdhPJxvKGMB3QY7Ut5kEA8s6doinUC1/Ww9qKJdN+MXM8K/PkyljZbitnj0m2icyEnTqlRtLd3GMw==
X-Received: by 2002:a2e:a482:: with SMTP id h2mr8611915lji.87.1636332508421;
 Sun, 07 Nov 2021 16:48:28 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:28 -0800 (PST)
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
Subject: [PATCH v3 23/25] ACPI: power: Switch to sys-off handler API
Date: Mon,  8 Nov 2021 03:45:22 +0300
Message-Id: <20211108004524.29465-24-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164830_161681_E4CB42F6 
X-CRM114-Status: GOOD (  17.17  )
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

Switch to sys-off API that replaces legacy pm_power_off callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/acpi/sleep.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index eaa47753b758..2e613fddd614 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -47,19 +47,11 @@ static void acpi_sleep_tts_switch(u32 acpi_state)
 	}
 }
 
-static int tts_notify_reboot(struct notifier_block *this,
-			unsigned long code, void *x)
+static void tts_reboot_prepare(struct reboot_prep_data *data)
 {
 	acpi_sleep_tts_switch(ACPI_STATE_S5);
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block tts_notifier = {
-	.notifier_call	= tts_notify_reboot,
-	.next		= NULL,
-	.priority	= 0,
-};
-
 static int acpi_sleep_prepare(u32 acpi_state)
 {
 #ifdef CONFIG_ACPI_SLEEP
@@ -1020,7 +1012,7 @@ static void acpi_sleep_hibernate_setup(void)
 static inline void acpi_sleep_hibernate_setup(void) {}
 #endif /* !CONFIG_HIBERNATION */
 
-static void acpi_power_off_prepare(void)
+static void acpi_power_off_prepare(struct power_off_prep_data *data)
 {
 	/* Prepare to power off the system */
 	acpi_sleep_prepare(ACPI_STATE_S5);
@@ -1028,7 +1020,7 @@ static void acpi_power_off_prepare(void)
 	acpi_os_wait_events_complete();
 }
 
-static void acpi_power_off(void)
+static void acpi_power_off(struct power_off_data *data)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
 	pr_debug("%s called\n", __func__);
@@ -1036,6 +1028,11 @@ static void acpi_power_off(void)
 	acpi_enter_sleep_state(ACPI_STATE_S5);
 }
 
+static struct sys_off_handler acpi_sys_off_handler = {
+	.power_off_priority = POWEROFF_PRIO_FIRMWARE,
+	.reboot_prepare_cb = tts_reboot_prepare,
+};
+
 int __init acpi_sleep_init(void)
 {
 	char supported[ACPI_S_STATE_COUNT * 3 + 1];
@@ -1052,8 +1049,8 @@ int __init acpi_sleep_init(void)
 
 	if (acpi_sleep_state_supported(ACPI_STATE_S5)) {
 		sleep_states[ACPI_STATE_S5] = 1;
-		pm_power_off_prepare = acpi_power_off_prepare;
-		pm_power_off = acpi_power_off;
+		acpi_sys_off_handler.power_off_cb = acpi_power_off;
+		acpi_sys_off_handler.power_off_prepare_cb = acpi_power_off_prepare;
 	} else {
 		acpi_no_s5 = true;
 	}
@@ -1069,6 +1066,6 @@ int __init acpi_sleep_init(void)
 	 * Register the tts_notifier to reboot notifier list so that the _TTS
 	 * object can also be evaluated when the system enters S5.
 	 */
-	register_reboot_notifier(&tts_notifier);
+	register_sys_off_handler(&acpi_sys_off_handler);
 	return 0;
 }
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
