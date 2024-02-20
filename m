Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1EFC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 10:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgGhHZ6nQXKy7Wd9BoUD2IG2zhQgmRynPnGsMXzaT9Y=; b=axhFTPO06XoK2w
	klUCC/bIv3BrDkldRS3Cgi3XFDdRQ8hRIaIC1xMXe+9TUcB+e1febjKHU1IhhQmRR0yG2XMQyCnLa
	ITyEo2IiRR7NL4VapGhvQYjx81F2vBspmI/nJ1mYEx4yC9k1o58Pg+Fk4Mti2guNg/4r/sFElU9Ip
	AI+yfJFlJM3tobTZtR+sYw4ABPOGrPWlEvWanpILTmjq4qaG/xl4m6mOqRWVuI4F94X1M15PMgOEw
	vxzvH+4jKAWzBxCAQumUBFgnRpoz6W4OYztWaN8comL1p4GrnIgdaaDsm9GJ5hjTm6kRZ7UrTbvSL
	Qao03pdkwqBliR2gQKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN4V-0000000EBqN-40xZ;
	Tue, 20 Feb 2024 10:09:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN4Q-0000000EBnK-3C5n;
	Tue, 20 Feb 2024 10:09:53 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708423787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MhBSXu8UlJHcF5aUEqeIcG7LmDKhw95uTgaS8fEGB8k=;
	b=WUT0Kd4brEuI8t9EDd+lbh3h6YT1uDRxkmUIBMWc5pQ91+6vl2Zby12PIn9L8diIrPPWVl
	U5wQEbjWeOh4ARIC878VRZRAhd2PR+1tXvrlKRfTupb0hLo5X/35iYqV6A2U2tzVisfGVG
	jSGT5RdjODsGj3HFAZMOG+YFo8ax2cFMy7eIzyWgI0eAtF6XcU9HVdADNF4E/Y6jJYHdg5
	9yONABFFtC48hsP2HeiVVQptfB+96DIO0A5tQqlbeB64Bob/NHc9COElSARQDP1iwAvm3x
	W9bgt3efrUGVjBqIr+y/MroKQNyA3RBv1HFi0Leb2uZuF8Qts7ZKhBne2wJQlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708423787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MhBSXu8UlJHcF5aUEqeIcG7LmDKhw95uTgaS8fEGB8k=;
	b=rIuXTH/YrKRubdPDWMPYcEOauyFagFe9PjZjHHwCY3oI/7gg2yfcjHdXKVAlJQtmzAySY3
	ZpdYN5yKrT80+sDg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 01/13] irqchip/sifive-plic: Convert PLIC driver into
 a platform driver
In-Reply-To: <20240220060718.823229-2-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-2-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 11:09:47 +0100
Message-ID: <87il2jih04.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_020950_977735_E891CA81 
X-CRM114-Status: GOOD (  10.50  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 20 2024 at 11:37, Anup Patel wrote:
> The PLIC driver does not require very early initialization so let
> us convert it into a platform driver.

s/let us convert/convert/

Please us passive voice and imperative mood all over the changelogs. No
we/us, let....

> As part of the conversion, the PLIC probing undergoes the following
> changes:
> 1. Use dev_info(), dev_err() and dev_warn() instead of pr_info(),
>    pr_err() and pr_warn()
> 2. Use devm_xyz() APIs wherever applicable
> 3. PLIC is now probed after CPUs are brought-up so we have to
>    setup cpuhp state after context handler of all online CPUs
>    are initialized otherwise we see crash on multi-socket systems

This patch is really doing too many things at once, which makes it hard
to review. Can you split this into digestable pieces please?

>  		if (unlikely(err))
> -			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
> +			dev_warn_ratelimited(handler->priv->dev,
> +					"can't find mapping for hwirq %lu\n",
>  					hwirq);

Nit. Please use brackets around the condition. See:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

for reasoning.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
