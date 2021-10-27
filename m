Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0323C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:20:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7CAA610C7
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7CAA610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGRUd/6JBTCITiZRNLTLEuPE75jNjmffSOzDCFHkvis=; b=krwzhUBE+Pif3k
	g+zZGi4HQ8qTi6h4nub3vLx/47B+B9cTGpnFohJ2zsgyXsFRQA3gYeqEePLICKaR6BeO+E0EFBCeu
	HS++PdpQ4lX+cdDurT/Q2UNrN8JWonXb+b23xpV498oECJn7dVzAxb3mBTs46PhnksZxiaZJKyIxE
	3I2FBrKX4LnkZ13aSE7WIPYxUK5AOrTlKXqVJflH6kuB0AZX/hIKiQLbcjfrz9qhrzx/ntcQfdeyO
	Vx3u3quv0fYLMwkNP8szFSZK7gxHZAavNJm7CCw4lufyySpSvkK1comzDjKCdHQhULEtDPVRdxEIo
	yLQhaXMgXp1CMYyoGAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqLU-006BvG-MU; Wed, 27 Oct 2021 21:20:28 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJR-006AXF-0N; Wed, 27 Oct 2021 21:18:31 +0000
Received: by mail-lf1-x133.google.com with SMTP id l13so8989464lfg.6;
 Wed, 27 Oct 2021 14:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
 b=hGiOk7puznFSxpZSFm/Eya2Cl9N4a04S/N7AMKzyQzEzjBU4DjBRSyeAPC6r2d+wM7
 xUQ7Ac9D1vF+xVotAvlC6ZCck4cXMzjLk9AuV7aPkEcOFRxo/Y6dcKGr+AskSfh12zZH
 j4t9S3xSdGJpshUHlnXLi2wz4oVxcxE35PVQckWFsoWLYAS6gGsox7O/ylTaKD83bUPI
 lt0JfBMnsOVk10t4KXi669c5Oy5pFEzyyvF+GC9JzvCvwEtP2Bq8P5zo32YZHs5FWOMt
 Vb6ZGXWglhHchKGKPrIHgEEJ9wGUMKsnUwpN3Lz0Uy/fasmq0C+gajXgFsv262T+m1RI
 GwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
 b=toqW2WhuxxVtS3LeuUgOV/KWLqPZSbVsdsqdwprpdiWlUOpKno2047VZmTX0dkkB94
 Mw+WCRVNPoqDjQPF0AJY7BU/r/WaMY6naRJ/n2W6D0WeBWqCBY2+XB9jU8M/PwfSuzil
 hPvd1W3hdI421AfE8hCBjpYDapiu04YIOqDwQbHh6BgQDqALK+sLjD4mM82OKNV/zuIo
 +HXHb75vYBzhsPvaxnQHSo9FYW955wpYE8lQDhfAL0QIo4pAAD5PNo5co1PuKDDIyWJP
 fyM9grjMFU8nGCnN/Voq7JhN8aeoDId3ODbIhxofO32imfbGfbExUxslBfUyQw3SDdz4
 rN2w==
X-Gm-Message-State: AOAM532bUyvhC563g7ZzkSJAlw/l/sEQrpbVm3OXIqSAVF6f8SsLFpBl
 YHVOrlfSUbhNvtIbeopDe4g=
X-Google-Smtp-Source: ABdhPJygpdJSNoXRh8ba3OotHfDcr8CSl9bSWUL0hunV++q/wiTfcZPk6onGhghey5UXGxJAqpQkjw==
X-Received: by 2002:a05:6512:228a:: with SMTP id
 f10mr83288lfu.489.1635369498913; 
 Wed, 27 Oct 2021 14:18:18 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:18 -0700 (PDT)
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
Subject: [PATCH v2 14/45] mips: Use do_kernel_power_off()
Date: Thu, 28 Oct 2021 00:16:44 +0300
Message-Id: <20211027211715.12671-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141821_086021_68157A5A 
X-CRM114-Status: GOOD (  14.67  )
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
 arch/mips/kernel/reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..e7ce07b3e79b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -114,8 +114,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
