Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0033C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYUHNNx3pdiGnxC6mfQ1ti9xPCIJhXaXMbc0lIz/LIw=; b=F5MIox2W7m4VBi
	LPCsjJAiM8vSkNVTDdqMspj6GwQLXWAHIcezWvqSeBIDg5lD+gGKeXUu3e6wUuxU4aH9RVqXeYDU5
	PDeQ0YFvbWIYSbbaQXVtjv6P4+LK3uRPB/QkxgSIImA2zpg0wTFiNEE8s5kjLnIMkjGRxZSpAd3Be
	M4V7+HQ2BzafpjYwj7QwTjcoK9NNDe1vM+k2wXtIywp2tIPFEaSGK11RVbvwpaT5nXyu8EwRoCrRe
	VLNiT2maw0U9o5/0fF2snfq048Z8E0ji5jmEWB582C6ziw5aCJ2A7/42uL4neKNeqkT05Tmy/N1G5
	lNNH5wBJg7jD9ONfC3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0g-007G2N-BF; Sun, 12 Dec 2021 21:03:54 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0a-007Fyp-8d
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:49 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 207so21064576ljf.10
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
 b=Z9frmqTKg5aoS2PU9i7y55F1Fktg58Vk2dW1KbQjX3M9u/eaFeNaZynJ32r52oBsf/
 P9f28j0C1WiUodwIjr6XbJsThvC5MCwPgOI/+5M/0VrXYfVzLWQeaRXWUSfPZb+I2BSI
 BQPFKoBwRVjbyBL2TND78RdUJQyDLS7Pkm0fODoqLqGIlWJGn8+AfpkS3xhzwQqXsYu+
 5Y85pgu/pjYqmqy25ZvgQq8EW9Jv0u/pC5H+pGq+qKilGUXE9mzv0sr4iNh3LtrbFN9z
 ktmDNa2rZciKvQCLgGh4sd5oSXRV7GuSIk+wrmiOWBZtTjqy61YULWuD5yCzVtaU2XTm
 +s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
 b=FZ+w4cDtd/FXKsDOAx0WMWVRF0Fjp8CkGkO75b/NiXbTejhbJDDSeFNqhmr3vHKNhr
 sgDBGr0+zKoRsil5wy9VwVdUiK+aSvZ8MPy7oYhs6Qim0txce+Ih6UBI7eucl/MPaAzc
 cq0VlKiNNuXaJOQ2lOe+S6NlePwogxy7cR9r/iTdznQnZsgql3VmrM8lLtrRy0FbEAmH
 hFHKevIBkENZltxk8JHaBJPQwLzbqY/PYrGjqjPpNrkrBIIh7riHjVSWZJ0nt3n7gPhv
 6Tr50b3h96aNlyY3A/5MMpPM1Cg3AVt9MTeF0ZzMNdre+JNmHkYQ9aq497REmKzCyIYV
 TWuQ==
X-Gm-Message-State: AOAM531gnYBjJOvFh2uMGJZHtr11CBTwu4tNlcShnSUBRyhDl3vrmptl
 I1vI1Ux/wNCUXUXJtbJqsUY=
X-Google-Smtp-Source: ABdhPJyn4bB+L+dbSeB8tkaNaTLuP+spDExh0AO3PYQ44Uwwg2wXZuKvjQXzPiXg+PdVnR/cyixvqQ==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr26933582ljj.432.1639343026612; 
 Sun, 12 Dec 2021 13:03:46 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:46 -0800 (PST)
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
Subject: [PATCH v5 06/21] csky: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:54 +0300
Message-Id: <20211212210309.9851-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130348_328454_8A3B1809 
X-CRM114-Status: GOOD (  12.80  )
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

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/csky/kernel/power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
index 923ee4e381b8..86ee202906f8 100644
--- a/arch/csky/kernel/power.c
+++ b/arch/csky/kernel/power.c
@@ -9,16 +9,14 @@ EXPORT_SYMBOL(pm_power_off);
 void machine_power_off(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	asm volatile ("bkpt");
 }
 
 void machine_halt(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	asm volatile ("bkpt");
 }
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
