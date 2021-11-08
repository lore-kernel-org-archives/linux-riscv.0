Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43CEC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABFC660F4A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABFC660F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMt9kKXpJuI7tqoXmgauYNUD8MsObjZU60THDC8kFp8=; b=vKee07WFL2MdUg
	B0E5NXWcaSEuD5ffvY8vFBqMEz+01SCq3AisdkuYGM+7fjkKlzloLrJFg/XO3SdsiYJkFUxN+P3io
	zdhyhTHKZDr+qRYbi9em8e6ci/muxl1wnA4qrLl759ckuJGKRxWgsNevCcQhZankh7g7NWrpxGh/f
	g4hjypNTpQTF2/5XQHQJ4QoKlpXDaVzlf+VD83YpF1NVEIWpoCWhtQK5IVmf1SM95y2K/pnqU+faK
	C1Npz+/FWaG0Rmc2VKykVJLw3rjEd8+WqbUhrTWIJiDYsevFBLFkLSPCBfDU9/jGxccJEx1R13tEU
	cUa2xgBTHVqNQB8pk6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsqb-00F8RQ-At; Mon, 08 Nov 2021 00:49:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspd-00F7cT-IT; Mon, 08 Nov 2021 00:48:18 +0000
Received: by mail-lf1-x135.google.com with SMTP id o18so32429823lfu.13;
 Sun, 07 Nov 2021 16:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
 b=ZVNAr1U4ql3QetoKQdPWWOYdxSBB0k5djEWleeY+9VSLcYiHnCSkCkIaOl4kqaHShO
 oab4Tmm3bwD0P0vkAzDwXd33MBPBcdebn4RnRlv1JfpXW5azFQJ8VDNmkiaenWK08EOn
 RwVRxb2a8jq1Me5zajmOOnqUKWN+NVp3gIC4vDQvl7X+QS/9Q/6G8PsCj7pFygNZ42G6
 2+Tzi7ka9eoxAdQUiRD+NnUxxBwExid0v7AfOqmbTtknjCEBmTA6xGh62w38gQj+fJ/p
 jOjBMtv9YA3dt8WYnPd7X0Be6DYsLDDoWJqswRWvH4kz+YPHCvK+UcFcEoVWh55qLPDl
 ATPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
 b=2guQ3Xvo61LQ0VIpz7CBdsWdoW/ch/BC8oGHiKNepxAUTjkcSAe/yaR2jcYXGTebO2
 iRz4FRXggvlAAN64lA5cOwTghZZIvBS7kBf+pM03yZxhqdAyBXTU5R3Ig3qKJsF3zbbE
 lf+hJpMXwEIc27/4yEqkCLAMKU7Ti3k7hYtyuLGuj6qI7j3x2SQ/TtWRyLZlSyfWrNdH
 Ec1wQ91lVDuhfv0+5loSZAX5YVJgHvOC7MxRlVo0GiL8Y/O6BggY5oiL/ZJ1TVjLoVPF
 5fV0ww5fksowgTHJiJz+4SqwP+42295qJ0bOM8u9ziQ7loDUfQ3uvh5qvetfSVlu7fiX
 c+Ew==
X-Gm-Message-State: AOAM532xwoKssAh2hQSN7BXUYOluTDqOf8db3AiP6iIy2bq2fXNJyuEs
 Kn30xhf1tXbTo09+IlNc5H0=
X-Google-Smtp-Source: ABdhPJxGJgazXdUgtKIBvIIz/6GDfezGKbWWr8YH8P5/vbQu6B1dGA0GfveTE6FMi6W4ZN9EO5qX9g==
X-Received: by 2002:a05:6512:402a:: with SMTP id
 br42mr25576250lfb.530.1636332495851; 
 Sun, 07 Nov 2021 16:48:15 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:15 -0800 (PST)
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
Subject: [PATCH v3 16/25] x86: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:15 +0300
Message-Id: <20211108004524.29465-17-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164817_648629_9A9678DC 
X-CRM114-Status: GOOD (  16.55  )
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
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0a40df66a40d..cd7d9416d81a 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -747,10 +747,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
+	if (kernel_can_power_off()) {
 		if (!reboot_force)
 			machine_shutdown();
-		pm_power_off();
+		do_kernel_power_off();
 	}
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
