Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D079C7115B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scKjJ3YLeoJHHNa4hMNma86mC9Qr+PbJJ3BMHSdUh/U=; b=xvyRAxHHw+sUhq
	fsaG2O9Ge4Gzd+yUAXaQqUBjXf2NYlRRT3SDputQcu09/Gw5f8Exr61w8Rv1qnFH4Djf1VLINcCDb
	lxndNx6NhVcIVnXU5+snsni3OOsH2eILZI+PavllGimpGgeou7m0d4CKIk2Omnfws6VI1ayoH/GUD
	6bVgYVKDPL/Ifo1uaq9IEXg88w6ao4oE2latuG2XyAh56yT03WKT9NPwJAL5mtAAtujQNW2NOgQHT
	iX/4SN7hi0/xNszdrX2Ee0iUQ7mn/Gm9dX2m83RUPhpcoh29yJDv9ki5BMfnywq4Xfbb89xpHLqJ6
	V2F5liuBW6Haapq5RPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8ww-0000000HF9b-0bcp;
	Fri, 13 Jun 2025 18:16:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Pc-0000000GtTL-0DHU
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 15:33:49 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h8Q++Tfje6GjVU5ZbxYDb9xgWKXCeQmLjtaQsH9Blrg=;
	b=Wam1ZeryyWsLC839quGmvrQZxsl2Qu2r1Wbbz10NjClptQ3jXkEJ2o3N5iCZ8jEqOCm/D1
	Q1Gfk3JDLdKsKMieahHNU1lT2runC8/OPNNVYUoaiObqBAS+lKVzghN3wc/cU9EtSrzuXo
	Ay2va7G4g6E+uUQYK1nqWJY71JA2ss2dkQSsAsVxFLoD/nt5RiSVqa3zq77DSUgCAWpiTB
	kG06m+Q8qAy9BxG0rXrjWq0T89cYIy5xKZBnH0xSwCYmP3YHbLlZwm2kRuWVf+0/WqzO+k
	xwwe4VBC5v12Pkm5+sDIIveRZeleIlaKg6YKcgYNk6PpNrP1YbAoRHUKJ0n7rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h8Q++Tfje6GjVU5ZbxYDb9xgWKXCeQmLjtaQsH9Blrg=;
	b=3oyORhNP3386qwl3ZT3zsuGyBlNpKcQv05Bm+651IskbFfbN56X1uEmU/I3TikwWhkrzWk
	Nt8e7dFKI/DRzYCg==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v5 12/23] irqchip: Add driver for the RPMI system MSI
 service group
In-Reply-To: <20250611062238.636753-13-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-13-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:33:45 +0200
Message-ID: <87ldpvirl2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_083348_227995_F265FFA5 
X-CRM114-Status: UNSURE (   8.28  )
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

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> +	ret = rpmi_sysmsi_set_msi_target(priv, hwirq, msg);
> +	if (ret) {
> +		dev_warn(priv->dev, "Failed to set target for hwirq %lu (error %d)\n",
> +			 hwirq, ret);

Just let stick it out. You have 100 characters ...

> +	}
> +}

Other than that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

under the assumption that this goes all through either the RISC-V or the
mailbox tree.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
