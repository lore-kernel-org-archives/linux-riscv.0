Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB5C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4iq8bFgq9Ihmqsc5I4q6jTZgUlnSmgd5AsSm+HjLzw=; b=MQlXlmv1yDmtrZ
	C0TBO9X7rJm6HlMcCQLdpIEC22ZU4H90tPamkktB2xZKeBZzowF2WW+ooohfSB458l7ZQiCf4ovOP
	8uCblNd3qbgCC07TXaN86wJGec1Ollb7eXowFyaw7Of2QVrKm4eNwqKsHxkAixJiBvGiP0EbGWC/z
	i3chv3Jm4D6jeVT8CYm4ijdGo6Hg09+o7qDZhxGay9BlVIfECvcnIIrp/F0qxMfzRROKs5oe9Ztnj
	ivq+jFzXzBdkjbPX9tNrLflB6G4NRGt0DkgpNJoT8KMPAmANlqPEiLGq74O1UPOha6MS9gt01fRiO
	xdIY8VudSbliSi0h6LmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqO-00000008LXI-2EtT;
	Wed, 02 Jul 2025 12:45:44 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwFR-00000008Fic-0l1J
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751458053; x=1782994053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IR63JrJp4EpFgC2hqcOS6ZZUnx2E8wjz2gyvdSKhXcI=;
  b=A9VuuG0iTposzw0winwy0lBA73HUksjHYVQ9swpJgSaNhxwQdBJht/eS
   ILrDP6uGXJF7epGieBKuefwxBmGziQ3f4dwCA5VooSyd1lTr/mHHSWNAa
   qeuxndwHYOF7vgXIfUtVviEo2mdotrOVW9ngzvNfHsNT9F+rnTi5eQkop
   rUrfTcZCFlrgRmAK/XqtWR4x7wGJ6Mo2GZ4ztQz+bPm5JMsBoxbX9Kz92
   lxnkNvhcUwyUtpQK048UAA26e7/JyewZLWB+Ek9oeHZ+brkeLhORrK1HR
   3/txExZaq7+AXYiobZC0HoQdXceiYBZAwS+PvXybch08VFiv9NocHxb8y
   Q==;
X-CSE-ConnectionGUID: +5K2OG5TSmGgpYpAwOxehw==
X-CSE-MsgGUID: DpQbM0P7S3G6pP3x5SLLxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="52866032"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52866032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:07:06 -0700
X-CSE-ConnectionGUID: z0XQZcSdS1KNJrdm0gyElA==
X-CSE-MsgGUID: vG0JtjgiTqqFY8WX4z6jag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153512567"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 05:06:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uWwEp-0000000BuZm-1DFY;
	Wed, 02 Jul 2025 15:06:55 +0300
Date: Wed, 2 Jul 2025 15:06:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v7 03/24] RISC-V: Add defines for the SBI message proxy
 extension
Message-ID: <aGUg3h_vigc6mq5a@smile.fi.intel.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702051345.1460497-4-apatel@ventanamicro.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_050733_231946_D8FFD7F1 
X-CRM114-Status: GOOD (  12.39  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Atish Patra <atishp@rivosinc.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 02, 2025 at 10:43:24AM +0530, Anup Patel wrote:
> Add defines for the new SBI message proxy extension which is part
> of the SBI v3.0 specification.

Actually a few nit-picks.

...

> +enum sbi_ext_mpxy_fid {
> +	SBI_EXT_MPXY_GET_SHMEM_SIZE,
> +	SBI_EXT_MPXY_SET_SHMEM,
> +	SBI_EXT_MPXY_GET_CHANNEL_IDS,
> +	SBI_EXT_MPXY_READ_ATTRS,
> +	SBI_EXT_MPXY_WRITE_ATTRS,
> +	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
> +	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
> +	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS

Add a trailing comma.

> +};

...

> +/* Possible values of MSG_PROT_ID attribute */
> +enum sbi_mpxy_msgproto_id {
> +	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0

Add a trailing comma, and you might want to drop 0x. I don't know what else can
be here, esp. in the future, but some kind of the description of this in TRM
can shed a light on what is better pattern to use.

> +};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
