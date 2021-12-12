Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72568C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Dec 2021 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfdFIg3nzRorHrpFS3kFvI5TmyzmVyx3vD+hxPkWQPg=; b=Ovy8y6CnDkeB8D
	6HCXb8tPHt9gSg4yTU2xp3wYCQCkbPuUo9VxQ9hAD+f92eno05rJ7YPrbUuajwsWAEApb3RLsr4CO
	Z4CQJ1LKy8MvP6SktEE/3L1drbzHchy22TMa29xdDt5ZLOiIhrTb2FqeLOjTiOVMjuP6Ex6lxIa7b
	LqkbumcaSj9xmFVeNaQvA4HwB9YwGFpjPe62EIOc6zab9Ga4S41BlOvvjJpEYuznfnKbBFHxLvJcm
	3fOG3RQ1jtfgR+W2VUtuQ1kYqKNI5bxGgpYdQncCowfIek/7VaMxH97VdqVo+Fp12HowEDJCdN8iV
	fCDa3gMVhrJDmfuS7sWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwW0n-007G83-Jv; Sun, 12 Dec 2021 21:04:01 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwW0e-007G01-2x
 for linux-riscv@lists.infradead.org; Sun, 12 Dec 2021 21:03:53 +0000
Received: by mail-lj1-x22b.google.com with SMTP id a37so20012799ljq.13
 for <linux-riscv@lists.infradead.org>; Sun, 12 Dec 2021 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
 b=jKT5aLZfWR0wdy1ZRHa2+F5Hc16ta1np03rkr+cf27BN8zUNhbkEoAuNYpXOIawSIH
 2XymTHuAk1C3VpWmhK4AsE1yb/G2IulrJt3rlG67Vh5DarQrO3/RvtCACcc9q/mrlMzG
 idTBdpttStFv0rFHXoDeMkKrlqiTc6LMJnuQorLtWh4hfdMc2KQqq/SPJGqZAD8cFtP7
 bU0fIoQxCEwyS17dGv1ELgqsYZc+uy4iyxYp9vTtn2S36VrT7egCJ/N2pPTJk/5GCnV0
 wCdVD2AV/3wMZeA5Ef+Z3RwjWWbr7SVUDzZ2VoU/BSE2RRwY2l531P1a/0YVFVmDZNjy
 PILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
 b=bUj0pW2yEfukaX8he71rlbw0eYMMpWqwbqpem41sITnK8z+YkzVQPI93AnoaISwHxg
 RS4X88iYkU2MFO3hPcO5RMoInifrMnHppHgMogeSPmyW0IJlNAN3KmwlbQvWNOVmv4GJ
 o1a1DKIOkMICbbbNQUxOrz3vvd05o5a0OE3e+mYSv1bwQ2dzaBESDCGKGamfeUQ2ZgzL
 aeB99p4tpWUclJ4L8f1kDntDlRqXUyK2gh66cg74JPkIvYvtGmcY13uMachcU5+cfg2h
 JC6BHJL+HZiZHDn2LfZVwouUPf3OMkmoEhWHYZ+4LFBv3LHyMEYFAErBkIKCOLD9DBym
 5n3g==
X-Gm-Message-State: AOAM530krXY/OrD3IdiVHpT1PusjfUTdPy+rkFxjNVtz2xO/ZgOcLyc7
 K5UEUQZufQR+7+b92XkwBFk=
X-Google-Smtp-Source: ABdhPJxgpZfqxao+vFSyfTfxI+LCB5noXzLgWBaLJYSm65bPEK2lM39NLgbcPLKrE+YWXn5oNC0cUA==
X-Received: by 2002:a2e:a26a:: with SMTP id k10mr25711010ljm.156.1639343030651; 
 Sun, 12 Dec 2021 13:03:50 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:50 -0800 (PST)
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
Subject: [PATCH v5 08/21] arm64: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:56 +0300
Message-Id: <20211212210309.9851-9-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_130352_156227_7BCCB081 
X-CRM114-Status: GOOD (  13.25  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index aacf2f5559a8..f8db031afa7d 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -110,8 +110,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
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
