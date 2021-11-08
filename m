Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9ACC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B353860C4D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B353860C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfdFIg3nzRorHrpFS3kFvI5TmyzmVyx3vD+hxPkWQPg=; b=5BFKCRk/i8+ciu
	G2BSS+r09NhZxK9lfiO9Kyz8v8cNoyIsJltL0w/dys/ez+nmbW2AWqol7uhVGoaB87fNjm9pVVEKV
	bc6ckeTedbylFvkrWLUQIE7OZVeLN5fsaUzDG7/UPDs+Bqcj+9pF/Z8caDrfFq8x8mjcd9S56C48X
	rmlOBepNkvKSRx6xUM+npmqjFMdOZjnqT6YIXe6Mk6xzbifzcMRE8kh2txagwuLWbkBbDRAx3T89a
	durbmdq2nxs6CDlb7cZl4BfgoylJIPLVsj3EMis+oaL4d3fzPJTcMVJmz8fKEzkx4h66NO4tILMie
	bG/gvwI1r76w9tSkS3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsq7-00F83S-EH; Mon, 08 Nov 2021 00:48:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspW-00F7WE-F7; Mon, 08 Nov 2021 00:48:11 +0000
Received: by mail-lf1-x134.google.com with SMTP id j2so32527225lfg.3;
 Sun, 07 Nov 2021 16:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
 b=Ql+iItYP1Svp00bziCX4qxrEeyzbUlmRQXTwLpVTtXcu3VtuEFuJo7lbzaIda8d8rr
 KqXIx3zpbGsyJmWEWh9sBWE/wusBL5Oilk0c/94PseLHfeTAwkrX6NgFmm3suP1WAllB
 c81OLCSyb4JojBTZzPdn3I2GFZi2lwJg2MvAdwlRxVM7bHaRwOe/jqS2nHkHIINEo/Sk
 b8kvsLOEvTf/6gsL7N6XwybvVTxS3xKwLrkTnvUR3ZXvsB2SNyNdQDFppmn3mPs+A1jp
 9PSBBSNxKocuzfgXDYQs2CTV7G3YMr3HbhsA4m9EbrtHqik2plRzUruFqdmlTVzjETH4
 Gz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
 b=d3YmB0gqQ2CTVBSIVSX+VRICx6ErV/j/o0sgecR/Y7uCJT39TFP/4I9LwCRaOTXCZM
 u48VZp2pRJysfXzwv/bCq5pq8Gu6A6XNz1dYQI+qvDJX2mtygHtkaLzIPeyLKCDn1T+D
 ZSlzdG0kg9paZmK9jWwY3O5tF4YEnIviWPlpitkNhGT2Jf3RQsnkMg0t9kLViZYkZs22
 ovmlQm4jomBiHKHDI0S0ZQUryxyzkhdYb/wG4MKMFO4OjRk5zRsyi5bmll/etHevAhZ9
 7L0vBHvpsLmMGP2UfB9MGyj9P8Ekfq7J6gBSJf/3T9yo8McqEkMRc0iXcq696Pusr9+u
 cXAw==
X-Gm-Message-State: AOAM532gP7MhELkQDf5tWUqWpGngesuTIQBK6m270hqbdoBS8rVSmdrG
 zHuOYuXxGs+g9sY4+tFA6I4=
X-Google-Smtp-Source: ABdhPJxlb1ZL+XWZnAn8zR/SOKzgcJArloMLd6W6MRTYVSPU38I56SwTItR6Q2sFEqOAjGb16DtsTw==
X-Received: by 2002:a19:dc03:: with SMTP id t3mr14409455lfg.552.1636332488742; 
 Sun, 07 Nov 2021 16:48:08 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:08 -0800 (PST)
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
Subject: [PATCH v3 12/25] arm64: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:11 +0300
Message-Id: <20211108004524.29465-13-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164810_545823_A7B9DBC1 
X-CRM114-Status: GOOD (  14.30  )
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
