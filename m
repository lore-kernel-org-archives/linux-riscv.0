Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8502C2BB54
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E87761406
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 00:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E87761406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dG54fxY9RthhQg8yPtOVkmPAKCNVyxFZxKX40IlnCfw=; b=VaA2EwsQHFbWkZ
	ku+vmoqaCJoG+MmAJnbYWOrhVGGQ//BMmYczMUnWQs4zA0VRh4b0sRxAibVkLaPlMz+vXYD4U1lg1
	VdTIJ3B9tJMjW9M1VyKL0WK+h2gOkYLkO1R7fFX/jreYHMTIS7CwLQc41O+dcE/nniDxQkZypWhJD
	OFx+nGsVrNiD3eRNVIDPTn5nN4Kl+TBR1lr9hXulFRX5uMj/+JWsrYyqDShI/Z1VH0AxSGJcb6ueW
	GRn529pQJk6CHtUQVWm4XxtmA4QLm9YzLGiS0+f5veUTHv50wr4lF88/onfA+CaxvqYdV3A+UN3g4
	CELE78QWUR6MCJ+8cyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsq3-00F7zg-1F; Mon, 08 Nov 2021 00:48:43 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjspU-00F7UY-Re; Mon, 08 Nov 2021 00:48:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id h11so26238289ljk.1;
 Sun, 07 Nov 2021 16:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hKgqav8a8uS+JOYHQI8KBeK4UU43xCMXoqbNcSGFyUw=;
 b=AwJ4FjhZ4uu7Jeadgfe6E5PAdvbICZi/KQGBT5wtWDtpLQCHSuyQii3g8r6pSQIUa2
 LLP/5Ap/Hl0WEPh7xDoz4PaKuVu8acWl/Lrp3owoIRv8bnEjLc6DrINyfILK4sLPa4FA
 TzZracA1tQgQQmzzAozP9oEbAedvpeZNvOmd4r0/GU+RMsqZ8usg0Z1d6BGb5kC/Q8Oi
 092NDC0niu668uYvxs3HRB8I3gSXOvRJLX3+MnU/iBw4aXQabK5GKn4kFRVxx/BZQrgY
 SPfzDlTHPyUyIQ2h7FurvVltaeMoh7kLT95TlZb5fI4FdYpIu9Nno84DCMbZIPC5f3Sq
 OG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hKgqav8a8uS+JOYHQI8KBeK4UU43xCMXoqbNcSGFyUw=;
 b=FkdtQEfZkjrmXz0StuiJKJy87eKQrmlhKP845ATnMPkwnnKfyUyqj2Z/8Zg0/8iJZn
 Nw/7Mq37SrD+sRpc9ZYAimDhykmKzfYR68JGXb9xQS+gc6cce6hxipMuyJ7HINzU7SYb
 NjG0DkboIsWyRDMuRXylD9kzMHKB2YPNFmC5ZmoNia7Y4/+n0sAP4X9tnDYy6Yyp1w8P
 w8JouiQOwyhDqiPGnIYSHsta6VlUjUzrm+JqT3odsJj03+E/Ou0CsWz/x3W0jVL/8pt1
 xcPJ5cK3O4vlbJdzWpNPj0qEM0MuwIXH6NHHLY6upty8z7Ngi/DVtfyTNJc6FWMeO0Jw
 yNTA==
X-Gm-Message-State: AOAM530jL9AGVu9invKMPg9lX0a2vEkXz37/giZWy4Iv9hHnyPvlLa7x
 ASUS9HzxKd3ayCM4cG80Z7M=
X-Google-Smtp-Source: ABdhPJwsYRcvq5lWlknwDGI1giubbuaVFPAkTxLB10aRQ7aivLUihqphCNvbqZqfSKq7V2Eu9b9sFQ==
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr55138383ljp.474.1636332487004; 
 Sun, 07 Nov 2021 16:48:07 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:06 -0800 (PST)
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
Subject: [PATCH v3 11/25] riscv: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:10 +0300
Message-Id: <20211108004524.29465-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_164808_937513_F9D66DE2 
X-CRM114-Status: GOOD (  14.56  )
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

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/riscv/kernel/reset.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 9c842c41684a..912288572226 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -23,16 +23,12 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
 
 void machine_power_off(void)
 {
-	if (pm_power_off != NULL)
-		pm_power_off();
-	else
-		default_power_off();
+	do_kernel_power_off();
+	default_power_off();
 }
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
