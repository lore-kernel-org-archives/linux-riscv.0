Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5E2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 11:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D59610F8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 11:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34D59610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQCUKSdD65ZGRVCYOC+RJk8kOhfafoGf02evS4TsAps=; b=VFKV6+wvOijxRD
	z6mk9Vly37z0IcTP7CPkRxzyDy4xcHXJsMFCxkrb5ClvT8Xh4w4GgHNClrVAeBEpZx5+gZp45M67k
	p15sGzyQ8nbjEpWnu0XCqobhERkC559Kcx0cbOo3RrgV+LWU4HOW/vEd9E2KDi3AlFKpsNFIhVs3M
	kMgaaOug5CnERoUHXNBRN/m0e8XVolSY2Uwt8MKS8EU4cGCyPZI62qfQHDOh/UV+hfe+Kml3whhvj
	/NDsDtyd/EzoTyiik2tokuu6BsuawfLlO23012ZVyPGyeJmq62VqOWbalfn9C7hddSElJXPEdK+3L
	kgh7NeDFCz4aXesV+XRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg39o-007crS-FR; Thu, 28 Oct 2021 11:01:16 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg39k-007cpg-E1; Thu, 28 Oct 2021 11:01:13 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="229130748"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="229130748"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 04:01:11 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="447649034"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 04:00:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mg395-001jY2-If; Thu, 28 Oct 2021 14:00:31 +0300
Date: Thu, 28 Oct 2021 14:00:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 03/45] notifier: Add
 atomic/blocking_notifier_has_unique_priority()
Message-ID: <YXqCz/utp2DFJJ45@smile.fi.intel.com>
References: <20211027211715.12671-1-digetx@gmail.com>
 <20211027211715.12671-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211027211715.12671-4-digetx@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_040112_526857_7C4B6E01 
X-CRM114-Status: GOOD (  20.06  )
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

On Thu, Oct 28, 2021 at 12:16:33AM +0300, Dmitry Osipenko wrote:
> Add atomic/blocking_notifier_has_unique_priority() helpers which return
> true if given handler has unique priority.

...

> +/**
> + *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
> + *	@nh: Pointer to head of the atomic notifier chain
> + *	@n: Entry in notifier chain to check
> + *
> + *	Checks whether there is another notifier in the chain with the same priority.
> + *	Must be called in process context.
> + *
> + *	Returns true if priority is unique, false otherwise.

Why this indentation?

> + */
> +bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
> +		struct notifier_block *n)
> +{
> +	struct notifier_block **nl = &nh->head;
> +	unsigned long flags;
> +	bool ret = true;
> +
> +	spin_lock_irqsave(&nh->lock, flags);
> +
> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {

' != NULL' is redundant.

> +		if ((*nl)->priority == n->priority && (*nl) != n) {
> +			ret = false;
> +			break;
> +		}
> +
> +		nl = &((*nl)->next);
> +	}
> +
> +	spin_unlock_irqrestore(&nh->lock, flags);
> +
> +	return ret;
> +}

...

> +	/*
> +	 * This code gets used during boot-up, when task switching is
> +	 * not yet working and interrupts must remain disabled.  At

One space is enough.

> +	 * such times we must not call down_write().
> +	 */

> +	while ((*nl) != NULL && (*nl)->priority >= n->priority) {

' != NULL' is not needed.

> +		if ((*nl)->priority == n->priority && (*nl) != n) {
> +			ret = false;
> +			break;
> +		}
> +
> +		nl = &((*nl)->next);
> +	}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
