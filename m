Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FDDC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42067610CA
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 21:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 42067610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7mgJuhdmzD4HJZ4LfWC+tW/FwOpT9ig8xyGPXySlhc=; b=AJiS7QodzWFwhr
	+1vr7vXhd78bYtux/9c9CeqLdBCV1GOWLzCHs+H6TOq0yBfuQWovfTHfk3jlSTaRVbtg1X7NBGn4P
	YK7rJRHwFIsS9LiBp++fSlgpeFEyB1bNLvTtXsWRGL1QhJQ6L9Vl1dDWboLLxt64CWbvPzSgGZP/z
	FQ8ZMcAaI0mjT1ru++ZAPgDhZL7b+1LZl6B+IF2NIHx51g5yketOh62ySBjQMACACBlIsnELTe//4
	Jp+fyMhzCdm4yMiFXvAe5Ubp9JUeuZ3WCF23fNlUawGGgNT+byhhSQP6Nz4tcQBsz2kzMAks0IiLS
	gCMMeyeDYul0KGx4jyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqJM-006AVS-QN; Wed, 27 Oct 2021 21:18:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqJA-006ALk-1d; Wed, 27 Oct 2021 21:18:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j9so8976649lfu.7;
 Wed, 27 Oct 2021 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+IvQoJf2OjzCPAk90L+IlIvsTQGqRsS8A3mVG9thss=;
 b=BbS8+/zxVJ00rr3ixtYTd3bTdxqjkUjnBr55DaOxzJArvyNX4521PAqPigYX/BjB1N
 aGylVDFiYrs5wRaWuZx6L52it/PPywema7yDnahBHenwiuFnc4S3m//ivsOGtXuUlPNB
 ubXOhenNVEu1KXB2mXMptIWVwaeJRf3hxW3c8R68HPPg3pjoH3MM7xhUxuphpty83aFx
 DGHamMHIXY7/zgP3wsKkRhZ7yEHgmahY/byikn8BiZjEw2DWUQkjcB5nYo+Xgh+eH8p4
 oVpJycq4ZWi1GYj36y1/HBYlXfcjUxN5WpbpwFTT0cF/PRko7dGul5P66XpFeKCAINSY
 8XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+IvQoJf2OjzCPAk90L+IlIvsTQGqRsS8A3mVG9thss=;
 b=03mDcLkM+SSZl1EmUzMWklI2e9E6A8bGVUtmEdrvo9Ldk6deFdEvysu7MmrF9LzR8+
 FgsN+KLpqbXYR0iODuogq+w6IUQ53hi36cHvtUyq6jKE2+pltz4O/Ksg2orQ36juVWmV
 p712NH+LMchwx0HCY2gov7ymdDX91zprj7O0aodJTg1rm2rPkh/VCXYo3mqlgF7Vs3KG
 Fflr6c4MMxocTPx8iQ/fARMqbEC7Y9eh6jnJ4HJw13c2nfQGwpheFTFmkpPy86PQ1Lrn
 NUgmmTRL5SMfSFqEAi1Gsy8gOI31mbvfZ8J8ijC+yPwTrFMmtohmvf/M9cv8Yiou3c9A
 0YiA==
X-Gm-Message-State: AOAM53155v5C40gMox+Mn0dCS71m8qb15kZki9bkz+di8HS8XYzTmoUX
 mooDKykpLpLxG1TEPWF9RZk=
X-Google-Smtp-Source: ABdhPJxyJaCNELbykyJ8mI+u0lU4wtjMFWua0Lm4EEmjlSiKb32hiTjDEQ+OHhGC/feOlGuy6qCfSA==
X-Received: by 2002:ac2:4285:: with SMTP id m5mr140041lfh.86.1635369481970;
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
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
Subject: [PATCH v2 05/45] reboot: Warn if restart handler has duplicated
 priority
Date: Thu, 28 Oct 2021 00:16:35 +0300
Message-Id: <20211027211715.12671-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141804_123919_9AF161E0 
X-CRM114-Status: GOOD (  16.64  )
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

Add sanity check which ensures that there are no two restart handlers
registered with the same priority. Normally it's a direct sign of a
problem if two handlers use the same priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index efb40d095d1e..d39e599c3c99 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,7 +182,20 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_register(&restart_handler_list, nb);
+	int ret;
+
+	ret = atomic_notifier_chain_register(&restart_handler_list, nb);
+	if (ret)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise invocation order is
+	 * determined by the registration order, which is presumed to be
+	 * unreliable.
+	 */
+	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
+
+	return 0;
 }
 EXPORT_SYMBOL(register_restart_handler);
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
