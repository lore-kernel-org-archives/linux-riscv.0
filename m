Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB2CAC5B0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 02:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fMJkmvY7DGpSnOfgHFcifI46GKW9fe07ApIcr+vJHI=; b=loM/Ha6/UlPaZH
	Xx8RfzYdZZmjZpJpknAdleJKyz1jHr1hW0BYIKqJ6JR45MQ8TzxOPoTE2K50LdPMC3z9Qso+I3QiH
	yoDhc0IR9YR3efQin0ED+M0+IYXO/+N1eFFteDYPjCnz4+rHtM9UjLvDfTtdGpQXs6eyt/kVj/0E3
	BxtuDd65b7hhLsoK9qPC/rKYY3O1SOCqTyaRc5Gt+IJ9h90djMbwN93kRzy0TNNrtHsHSkiD12+T9
	LFE1sOMj9yF03nIYwlCZ6PRSfZbbwdQTv6SfqSy+UU9Dq1Xz9RmW9ykZ1naNfDzXw5oz5B6JLrBHO
	J20QvnUTIoB9yrujNjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xri-0000000Et2f-3PUC;
	Fri, 26 Sep 2025 02:07:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xrh-0000000Et2O-24WE
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Sep 2025 02:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pr01nvddqnQfLzgHdRTcoUpKC4EFLgL6l+FpAu+4sAI=; b=LXDF9GEDkt+4OeHTn5oPOLd042
	NGDeBXpl7swfkH2Bw6RNvod4r7InQmu2uwOPDVfCV+g+YNRRpgEvtjqJk+106GtSy1EElyP9G7qBK
	lQBVlEYs/B8Vpfq8ch2uKiWG9Rc7fbjH3zu1P6eMsXoWmf0CT1IBYwVSQFg6pFm6IWjpsJNfmn/ic
	KI3ieO35HzvEFEuw2KN4AMTjQkPuWfuetUnYPCg0xGnoazsygDkmWkudOHMUc6FTJYexGRabiL7tb
	CJAhKX68PUtI/HBSS12WSivKfTA6OszOLuWcFkkXZ9jJC1frU3zr9asvrIovlodQ4tW6BssTakg7E
	pOzTVZEQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1xrc-00000009bKx-48FT
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 02:07:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E08F442DC;
	Fri, 26 Sep 2025 02:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F46C4CEF0;
	Fri, 26 Sep 2025 02:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758852425;
	bh=2YJDK99s0lMvRJGOHiSJOwxLZMxkVYoczRMWoF8baEc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VktWaqHHYYs86nihTQyoku8q1eGcuuMXhC4UHSJV+//JfmezDua+vtqRiiRV6Mqc4
	 UHjry0UpMkwXw8qX58EgbafwWPFKgTAzhUCud8zlCN6SfxxfJCOJxc9JHMLOTdzL/e
	 9ckLgp9O+6+k+9MZtD+pSI+jncUUpcSL6mODwS8KzWOsGmIiPSKMNJdsnfkbc2Pg3Y
	 NeIzOpY7exAmHlyolxKFPx64f5zFpZ5Qm0wJG6djlhqA48FAa95rNVkYXNWnOODn+d
	 v8ePPOjLn7H/ZlOT6xmIvuj5uAVxs9RVu7hjFgqORzi1kAW19WbmeAGcSvhgrYIMe8
	 wqIOHczzBbfQQ==
Date: Thu, 25 Sep 2025 20:06:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Rahul Pathak <rpathak@ventanamicro.com>
cc: Anup Patel <apatel@ventanamicro.com>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Mika Westerberg <mika.westerberg@linux.intel.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Linus Walleij <linus.walleij@linaro.org>, 
    Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <ukleinek@kernel.org>, 
    devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, 
    Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
    Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
    Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
    Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v10 10/24] clk: Add clock driver for the RISC-V RPMI
 clock service group
In-Reply-To: <20250818040920.272664-11-apatel@ventanamicro.com>
Message-ID: <823e11f3-ba2b-f0ec-8bb9-0785c89e8234@kernel.org>
References: <20250818040920.272664-1-apatel@ventanamicro.com> <20250818040920.272664-11-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030713_823035_C45A8D81 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Rahul,

On Mon, 18 Aug 2025, Anup Patel wrote:

> From: Rahul Pathak <rpathak@ventanamicro.com>
> 
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> 
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

a few minor comments:

> diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
> new file mode 100644
> index 000000000000..7a0a62456314
> --- /dev/null
> +++ b/drivers/clk/clk-rpmi.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V MPXY Based Clock Driver
> + *
> + * Copyright (C) 2025 Ventana Micro Systems Ltd.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox/riscv-rpmi-message.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +#include <linux/wordpart.h>
> +
> +#define RPMI_CLK_DISCRETE_MAX_NUM_RATES		16
> +#define RPMI_CLK_NAME_LEN			16
> +
> +#define to_rpmi_clk(clk)	container_of(clk, struct rpmi_clk, hw)
> +
> +#define rpmi_clkrate_u64(__hi, __lo)	(((u64)(__hi) << 32) | (u32)(__lo))

I'd prefer to see code like this implemented as static inline functions, 
rather than macros.

> +static int rpmi_clk_get_attrs(u32 clkid, struct rpmi_clk *rpmi_clk)
> +{

[ ... ]
> +
> +	format = le32_to_cpu(resp->flags) & 3U;

And similarly, it's best to pull these kinds of magic numbers up into 
appropriately-named macros, to help reviewers understand your intention.

Since we're pretty close to the merge window opening, and the changes are 
minor, I've gone ahead and just made these two changes in the patch, and 
queued it for v6.18 (hopefully).  But maybe you can keep them in mind for 
next time.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
