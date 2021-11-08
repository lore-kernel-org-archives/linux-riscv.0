Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3E8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D1CD60F4A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D1CD60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH1JV0LxrNHSd4aAsMnYd0DfvjywjYxR83Ujx9MLIxE=; b=WBFdaGgAux0+rt
	vbLBKXgcdzBArMv78qOoEryorcbuCSDH/Eil0n/d/NPTnJ/Rjv8FWdtGBFTIJceq3apRR96iomb28
	sASF2BPOhnmeM+Db2t0r/3p0LMsu9BZ49vA4EkDJsYjpbkGydjjGJD4xV/5hZWNjMBfp9voWX0PG0
	ccUHk+E7mmm5ah9m5G7QJbYLy4mt0t2TystooOj8LDEFZc2M9NJPyhLBIRgxiSJT6TgGhqzqnpGXT
	LdIQwKlhbuw3TDror3Ro4EPsS4G6cxLcnTHqdzx5MH8D8Kqi18Q8CrhwKuSJ/aeoB9FM5NYnEz68J
	5VrLFQE8WnlZfDFsh+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsqV-00F8No-KF; Mon, 08 Nov 2021 00:49:11 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspb-00F7as-F0; Mon, 08 Nov 2021 00:48:16 +0000
Received: by mail-lj1-x232.google.com with SMTP id v15so19079059ljc.0;
 Sun, 07 Nov 2021 16:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=CYX+rsWLev5P9iFzQc17Hii5aXl3X9I+N37IjUBPzT3fhs7ejibZMyODAFDdV6x7VJ
 5ZP+Hd71CAUWxtxryja3mUN+CaKHMdnjhX8yiRm1zru3VMaw1ejVu9ZClQmsYSpFhK78
 HJ592agYH/bCrPu2rETaR5XM30/EVbl3bPu5RbPwarWfT6a7OXYwpFfNN/bWsoOdhR5z
 4pjgJh0QLIxf0LagwrjW8fFOa+5fTJF5PXw0QY75bgP3vWV2t/oub8mHgmsVpyYpLQcn
 3aMRiOPeqIpjt7G8XmPwPxPRlc0uQlk6m3r7OnawAviMa5pFwVrm3wWEJl29tulXyA+Z
 C10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
 b=An51E2ctunvcxzQ+kF3jazuIjc+8kAx+i15NgrzTYfv4jvEDi3noxIpyGrLGK3nNkQ
 3AKyzm7wZBPTP9At/jO90TSxnxeN60MNy0XOs03JDRvgySfL+MUWidWkqurkK56Orit9
 aG4BLLv8wpCz9UHCTwD4w7MO0OO0mvUuMn9IRY7zT8J2lgcwURecuSpL6VjModHPgtOT
 ZSfzBEXDjYXI3ceg2+PAyL3kbmSGkN4QomwJ0VlXqH6NUEWAz9CTUg+vGXVGF+TPEMS/
 cSTsh9qlVCedB5b36ARnqxKc1kuL9qS5iANJPunPS6vZcpNutIuLXaQn/NO0PO/K4YQM
 Rwfw==
X-Gm-Message-State: AOAM533KMAIZBebrTdAKuipI7XyCWSaaVTcRh6GzzDF9UJM7GZgvZKZ9
 STqsCRUqQwcPohvIhoJo9W0=
X-Google-Smtp-Source: ABdhPJw9pdaDkOXr3QmoCQ8lY8yPKwvYp6w85pF5+hYdZ4RiByLUnL5yspSV2AH/ECvDb66W5TciQA==
X-Received: by 2002:a2e:751a:: with SMTP id q26mr21102478ljc.168.1636332494070; 
 Sun, 07 Nov 2021 16:48:14 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:13 -0800 (PST)
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
Subject: [PATCH v3 15/25] sh: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:14 +0300
Message-Id: <20211108004524.29465-16-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164815_543975_7B294145 
X-CRM114-Status: GOOD (  14.79  )
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
 arch/sh/kernel/reboot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418b..e8eeedc9b182 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -46,8 +46,7 @@ static void native_machine_shutdown(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 static void native_machine_halt(void)
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
