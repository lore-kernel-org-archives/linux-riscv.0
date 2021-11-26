Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5799C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 18:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5xmADLHMp+VfdXbceDRxgszwkjnaUSi9P8fE9Ko1ok=; b=XBZSLy07VLr7Tp
	wf8o+bfXN59/zeyqORjOAlKwZX1x9j0hm/GZwcsvJRjleyj/Z72dh3gBnqGNOvGjluBDGUQrJ09Cb
	6qUDNYJPOOllO9BqJpS9pSgBcR6RfmiQPSx4xKMXGbQngtcMcEvEur/LxtHgGe0WKRYE3bvQ6sdyi
	JJX7f6vKTkFaNLWoRVi2r0UG9iPDCzNmEojWcK3kUDT94wK9RPvd9eRdKk+sPMEkywEwOA8wLC0Ls
	TPcHyrdjV3C9d+2YxAVrtHDreKH63B/4P+78feXo/DNGnhLAFDEty5tNE/7zoPtL1RqZIaZGehxAM
	A83D4oIcK0s3pQRbyDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqfas-00BPgT-L6; Fri, 26 Nov 2021 18:05:07 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqfYU-00BO4A-Cx; Fri, 26 Nov 2021 18:02:39 +0000
Received: by mail-lj1-x22f.google.com with SMTP id t11so20240684ljh.6;
 Fri, 26 Nov 2021 10:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
 b=ECvKbjjC4k6xmEeYZWrO/WEg/c+QJDXxCqak7r6iNridtANEKQLVROGm9rP6qAIv6t
 kh51GXz+yRDZEM2mBoH6ntP1ABqmER9Si49N45A/pCLP0XO9mi8xIypB/ToFA1oQJuOS
 wwbxHYGgL19rk+qHJWBPr1A9vfcQrQzuuliJ/L80ro/I2ILJf3zewwy4NwA9E940mf4r
 xEi2A9cjm4C0qVHvXqkGTSyz2UB0idug3/v+jtMboxI8IjYR2GgWZvitP1/XFtiscxqL
 u0mpHa7paJWDiLpKYE5GFeHDbFGuk4Q26nCGlavs8CCSfR7kpNZa0mPgE3msZdUROlp7
 j66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgdEY3brdUGAcbkVUTuopyRaDKQjmT9IOiG4donLZPs=;
 b=xJk51LpStETPbRX17Y2d1iw9s+bjpfv8Wl5eekWpn2x5EOLTo4zIZjgeTR9tMNX2jV
 xYwSbySAbv8joyxGAh3AGLZPzM7Fec9rlEJcFz0kzzPoLXRH7fLpAqgOPGzB1eKZ4wGq
 q/1E3V9wwDz+ukrx+thr7ho4SvtBrhTEOmJrB524FdsSoKGADLYT/0TkV1bqOeIeWq0e
 b1l0M29yg+1NypWapB+4RYetjh6NVnM526zkPvU8T+ke1zYYXtNja28PEUCNBmsF39fa
 Gf5HYeBMHtsmXkiEvuGpNRRFxP6g1JvVgDqaj98QtZUM+rC9ngGiqscpUqQ5pDYhDLJ8
 wKcA==
X-Gm-Message-State: AOAM531NuWzAn+Mq+W6IrTAgSJzQq9fDGvscYvqeQ9kKo8w5i+qkuZTL
 oWukloFudc37rCDD/LGqmsE=
X-Google-Smtp-Source: ABdhPJxeTR96OaFv43HaZCJZhHcnGI5BbEkrJ8CeEZK4iGXuaQDDFiKVrcMegRPebBnF+ysNB/sxoA==
X-Received: by 2002:a2e:8059:: with SMTP id p25mr32828659ljg.403.1637949755739; 
 Fri, 26 Nov 2021 10:02:35 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:34 -0800 (PST)
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
Subject: [PATCH v4 21/25] nds32: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:57 +0300
Message-Id: <20211126180101.27818-22-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_100238_488182_DE6178F8 
X-CRM114-Status: GOOD (  14.48  )
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
 arch/nds32/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 49fab9e39cbf..0936dcd7db1b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 EXPORT_SYMBOL(machine_power_off);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
