Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C229C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 13:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9czChfBQEgl/LDEYafnslCqYqUqNdYY0nAegWoWzuXs=; b=qCBCcoPeAvDNG1
	aS9n/mk+cy4LUjX1IuUgGA2dv6rhHUme/UyIniYQwgW43AScd89L/KCi5GNf5PwcCrrM72HfDPh/D
	P6AM3XRH/udVwMhiYsk6RzK6BnjojO5w1mz9ABpBF6lRJviqFZLLl3VumPZj75lv3iFZBnGayfwfQ
	UP7cgtU6Psz61kV3qwZVLRijJEr6sRP8+nd2QlxrN/uKq3W3n6E8d/FnB6v/cTKqlOongNqfpxY5g
	kXlCNPpXBE0GN6HovEI5zr1hHvisBVrD9HMtQLDZQHE8SVtU+vVPPVcWn8k4TSN3qnliGnrsobLh7
	1Y78hEmABTshrX7+r0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewtM-0000000FZf4-3DuP;
	Mon, 03 Feb 2025 13:53:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tewsS-0000000FZTh-2LZh
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 13:52:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738590759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLHVOEFTbtw28lXGqZ/3v2t+7cTLKHCxNyw/+InlffI=;
	b=DWbt8mzk758d9C/6+fqiS0jfoaes7BoKIiEvwnJ/B5ableKwXNKbxwt3TZ53yLIWvVbNeC
	8aQkZOBmygeVtFspiEXM3WP2mFRes8Poj2IHk6LE9I4dLWYXY6xyH+sJzOeLf57p/BhoKa
	HhAk7jhBZK87q+y8xMzdFL7UHhGdaH6KlStrOy59Q8GjatbQVGmbNywqPYOu316sKwLU63
	mOkVkauwakMftvSiZAMDuHPfx7qEeoG8tlXzqG9BaHxbmOoDw+yzInwYwwc9cJw5YpREZM
	C3m9um2YeF85U17ENc6hNdEfygXJ7NwDsUkDhVbHgkYf9wo4vxdvWuv6xInMrw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738590759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zLHVOEFTbtw28lXGqZ/3v2t+7cTLKHCxNyw/+InlffI=;
	b=vhCuX6edI1d1zrChh+7PFwxQcCfeXIS3rO7dUcXxZWg+lFoKBvdwACUseRYnhEKsjQqo6k
	nxpULwQTX6sAYlAA==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [RFC PATCH v2 16/17] irqchip/riscv-rpmi-sysmsi: Add ACPI support
In-Reply-To: <20250203084906.681418-17-apatel@ventanamicro.com>
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-17-apatel@ventanamicro.com>
Date: Mon, 03 Feb 2025 14:52:38 +0100
Message-ID: <87y0ynnnix.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055240_732865_9B99659B 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Feb 03 2025 at 14:19, Anup Patel wrote:
> +
>  static struct platform_driver rpmi_sysmsi_driver = {
>  	.driver = {
>  		.name		= "rpmi-sysmsi",
>  		.of_match_table	= rpmi_sysmsi_match,
> +		.acpi_match_table	= ACPI_PTR(acpi_rpmi_sysmsi_match),

Please indent .name and .of_match_table accordingly.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
