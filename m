Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DECC35274
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gxmn5FZir8mZPXz1vQ45oy1fM6IDxdWc6hx6cHVDuzI=; b=xboALSj4gF/8pq
	6PHuTxeQw+Fgg8AUPcc8i0yFGTIDBhxZXm2S7LLPZ/MCnfCeFfZPXQkRsDg7I+j9TWsXxrm5bfKFs
	d3grkQZnMDrXspXUQVDxKvMF3RJ5m8K6s0JxomNyMQ9jDLeeUm5rM4C6vAVRp0BY5vLlrh+HCkNZJ
	NHzZrY5iFkSJZKqYjwIt/Jeeq5NXGDxD+mgiO6BnfaKoWQeuXEDZIW0pRAXsJaAhBf4z6zKIZtGrL
	gcjmb/SO6CSoAfKRRFATvaKKE71BPmpS+lYPUaCbAzqmikzc3Z0EafsbG2cJaMPiikc3pWfvpV3Gh
	KnoWbwl2ieQqSozxkydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJlX-007fiW-E8; Sun, 30 Jan 2022 23:37:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJlJ-007fWV-Ij
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 23:37:38 +0000
Received: by mail-lf1-x129.google.com with SMTP id u6so23256705lfm.10
 for <linux-riscv@lists.infradead.org>; Sun, 30 Jan 2022 15:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ZrDgi56okXdj0bmuwFyDd+PCBPMTNLxDRZAmCQiy7Q=;
 b=c3NtOsqbA47a1sJX+GEy+0rTmzy10+oHXKnLf++rqhzO+HkV5EX5GbmXX0syutXx6R
 46cFfpCzhcPa31L6Xgo37w0ud+s6MmIVbyT0zR8tDah7CqXCEteg4iWk/eRCwba6mO4V
 8W4zc+2KzJhcjNF1j1wVUUcXHT6ObiOakX5p2KYvUVsZQRY7Y82Y6MKvBpcRryxOInUF
 RxKVqw9v4fGeVOkmtCX3EyiW/0qXGxVzl0X9GRONS3eJ/CiP8qRj0ZyFLbrruPRrmWMZ
 iKAyqg4ppe9pVvVxKhsjy91ldTFtuqlW7PzcwXhnonKoFQRzsPVvvJpThza+ddSLXVij
 QBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ZrDgi56okXdj0bmuwFyDd+PCBPMTNLxDRZAmCQiy7Q=;
 b=vGfD1ram8y14vdy083KkUPBawGDAoquw3rgx2nDIdzck9KlXiJ4yD3Z2tlT3k3q1zC
 /4vzr1e74D8lbQlwMyhwz6m9UVT3gf3lhbC8okAvudJyLBhyZtozDfcsXisbBreZqvCe
 Zbg1P+xwapTcuL/yxxFjOwF2v1M/9kSOoIiBCdlv9hRNinpwH6P9ytk+0UUZnp07xEeZ
 JbzQxeBgNqk7QfHGxEWJBfJ1k6bZ0NkIm2LXmYaAkRtjQRUwDE5NzbRi8W9V6a1UjOHB
 JmIDVjwna7b7o8aa7Ou5M+XKdclWwZOO9iFbii18Rq7z9zZfdDmkwug7/VSQ5H/mVuVh
 mIPQ==
X-Gm-Message-State: AOAM530qJT/WXvuNhnqPIMQwfu/K796djneMWB0/4VJhEmXJSOuor4qK
 LxGtZFNlp3C93q6zlWArXRI=
X-Google-Smtp-Source: ABdhPJwjH2OF/Lh8B3AhmAwBhRKlkrWOfnqlna+Zr9L+uqZhDMGJf1wpdqmmSlpmTjq1hjKH+//r2w==
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr7550090lfg.371.1643585856261; 
 Sun, 30 Jan 2022 15:37:36 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:35 -0800 (PST)
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
Subject: [PATCH v6 06/21] csky: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:03 +0300
Message-Id: <20220130233718.21544-7-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_153737_652291_548FC647 
X-CRM114-Status: GOOD (  13.41  )
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
