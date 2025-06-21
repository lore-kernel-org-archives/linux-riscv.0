Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75EC7115C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Jun 2025 21:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrZ1tnJROConiaYvd11dyKGd6yu9vL6iiC6+/3BChQw=; b=TaVzfVqVc9PZzO
	FNFpoDQUl1YIEvnbIWBtkSe/THMGiRFKjDkcGcXj79L2SJ51CWMeHc3Zi7bjycg9X4cHcJvv6ck9S
	CCjEoVw/nwQOnN+KY0lgGqlLkr26TQ5ocbadIgt6ewzQKfaS6EWaBG8eiqTS3IKxfJryuC9u9WQEH
	35+9dy5kWD+AMMArdA8arCeSstb41TKY5au0P5LQILwBiWPKSjV37EW5vBNm8KxI9xPj3p229onIq
	gVYN2rF949dcYFCsMUzyPwacVLxi9y0wxTiBGdoVXK3o0uVcji9oFn8Bgs0BExp5VY0uesAPhQ2XN
	MBtkHDKamM4wwgTiCCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5OQ-00000000Hw9-0xER;
	Sat, 21 Jun 2025 21:04:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT5ON-00000000Hvo-42Ke
	for linux-riscv@lists.infradead.org;
	Sat, 21 Jun 2025 21:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ADFD7A4D081;
	Sat, 21 Jun 2025 21:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2130FC4CEE7;
	Sat, 21 Jun 2025 21:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750539890;
	bh=I+H/ACdKPJZiazgKrac5bRP/4sQkTk9nIYPRUqznQ7M=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SHvMKmZCkSpZ7VJko/5vLNJI7f1Mc4vSlEVWHE8hQMbJxG9mO4BAaNuayQVytTDzf
	 NUCx+Z2ansv6KkVCwFAbpl6qVnO8hQLoI/VCnTP0G9nIXtUrcCRbyXBmpfFMYLncAp
	 L0YMxSU/CYTST4o4L3Bi37qQe7msF4Xkh7yt+QtTOt4RgYbdkOiqGwDwhyz8mIJRdi
	 BuS/rcy+m/8UkHKdmTmyjRy8P58uZhyf5oS673ayorBKLni5bW1YktdA9DBvYjDP4T
	 IdqNT6zo/H/ja4zuWBKSStVNdWqdjUH4bBNWPAFfboJ7tmd4Nd8Om10AEWdksfhsyO
	 OfvvunTqLdwhA==
MIME-Version: 1.0
In-Reply-To: <20250618121358.503781-10-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com> <20250618121358.503781-10-apatel@ventanamicro.com>
Subject: Re: [PATCH v6 09/23] clk: Add clock driver for the RISC-V RPMI clock service group
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Anup Patel <apatel@ventanamicro.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Rafael J . Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Sat, 21 Jun 2025 14:04:49 -0700
Message-ID: <175053988941.4372.15869767607401919839@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_140452_074760_1BCB6D2D 
X-CRM114-Status: UNSURE (   6.29  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Anup Patel (2025-06-18 05:13:44)
> From: Rahul Pathak <rpathak@ventanamicro.com>
> 
> The RPMI specification defines a clock service group which can be
> accessed via SBI MPXY extension or dedicated S-mode RPMI transport.
> 
> Add mailbox client based clock driver for the RISC-V RPMI clock
> service group.
> 
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
