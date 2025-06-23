Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FDEC7EE39
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 09:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfyRb92xLnm0jnhORpi3eqG4ZsUaD5id3lIxODL9r20=; b=o/lq9zFqRhSZlI
	uoh82XIFFMqBoiFVP4KbBOW1VKuKjNZwy+JYChE8LGtCqcm0wGR9oaQgL12ERyJPzg0LJQUe0MO/5
	4kxwmWp8PNJfP39tfHQsr5oZ5psnSn/59JoLLPhLNqSk6BePER8Mpnw7lkbMdlK5FYvIu2vX2WI7T
	V97yDKmFmK+/o+4Wpbc05lU8Tp4ZCuySY5p2gme0I+qYjNKcaxwr3j4gVUbuVcOlHAgTK5+tQUfZM
	lW4atbWGSQeCg/TfmCJxmx7cBZfnvg0cUpgj9l65qPaIoZafHl5jUI+frAYxF1GTb+CRtvahqZ3F5
	lpiASMMdL858J62O0JKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdAK-000000027Cw-2ftJ;
	Mon, 23 Jun 2025 09:08:36 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcse-000000023ff-2q2K
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 08:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750668621; x=1782204621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jrawT35wmhyz3NLgVIcmL35vMqmLA5Yl2YnxxrpMy/I=;
  b=iPA/bL2eeVYKrTeegYxom4paT2gkbmXLnMwDsr1DviFCTZSwmYTTzkDV
   uBxu2uhHZGx/9LO0ZwysxU6+01l2uEj7zFpdVNmoXj3hOGZiqZ6/iBEWn
   qsn2HEaxvBg8wNm2z6+Ok7/M+Ci7g2Cr3HZcxlNicNivTw+lLmED74wG8
   49rVp8T/KnmX9H2Wp12+dN7Iy73FhY4ScFcxdZ+gR5tO8NfBsXtbmc8dC
   U8Tqud1VZOjNYeDebPjWu9RBrPu22cPOb0ovUsqLpj+TlTnw6gA1sBvT7
   EiPAuzcADaVyzniuKjnogWf2Zuu8D1ldWhkIfBOHyoPo2NtUwUKTdNfKF
   w==;
X-CSE-ConnectionGUID: WwGlN1hEQIO/BRdblAjUIQ==
X-CSE-MsgGUID: bxAkze69Q/Sm0Xi65F690w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="75398340"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="75398340"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:20 -0700
X-CSE-ConnectionGUID: +8bXJz6LSx2prqvi2Q9vlA==
X-CSE-MsgGUID: fQBw2f/FTBCnoy7g9ZEzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152213190"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 01:50:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uTcsT-0000000977T-3KBo;
	Mon, 23 Jun 2025 11:50:09 +0300
Date: Mon, 23 Jun 2025 11:50:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v6 06/23] mailbox: Add RISC-V SBI message proxy (MPXY)
 based mailbox driver
Message-ID: <aFkVQTSCSkvBhzgC@smile.fi.intel.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618121358.503781-7-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_015020_763528_5CAE1FED 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 18, 2025 at 05:43:41PM +0530, Anup Patel wrote:
> Add a mailbox controller driver for the new SBI message proxy extension
> which is part of the SBI v3.0 specification.

...

> +static void mpxy_mbox_remove(struct platform_device *pdev)
> +{
> +	struct mpxy_mbox *mbox = platform_get_drvdata(pdev);

> +	if (mbox->msi_count)

I'm still not convinced we need this check _here_.
Can it be rather a separate patch to add it inside
the below call?

> +		platform_device_msi_free_irqs_all(mbox->dev);
> +}

...

> +static const struct of_device_id mpxy_mbox_of_match[] = {
> +	{.compatible = "riscv,sbi-mpxy-mbox", },

Missing space and unneeded inner comma.

> +	{}
> +};

...

> --- a/include/linux/byteorder/generic.h
> +++ b/include/linux/byteorder/generic.h

This is good change, but deserves to be in a separate patch.
I will Ack/Review it as soon as it appears to be so.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
