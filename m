Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF73C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8JMr0SCgghiOX44KdIczvrsbHNBHvPjxwgfKMPmJVk=; b=wqK+sHvUhhoCDI
	bBaRrvfe2lln7RUuYb9HpJuqpaCN82XwASla3a7ij05EnM3l+40UG0TXkuebFmdyHEN2Y2CIEM++m
	/TCRwRrgJuELFdqcdagGVDX5wzRibfP2H5nFaExLhFNWisxk+8uLWvs08N2mfE1zyVIrJuFkFmFET
	xQKR0vlCAPwD3Si6QioGI+CdpUMmo8wH5j6gUoIl+WmPSDSLtIrBEIaUqleByYfq8jWFACpnWYXwI
	lVz5K+ctDRrPnMBlaSZ34CTT9YWUh+u05DKmy+DMHlPHti83hSHJ3GBptJIqgvceTXQ+cshb6b3jt
	HQW079EyWP3+zcSVU2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnmt-0000000EDfJ-0yIC;
	Thu, 12 Jun 2025 19:40:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhb2-0000000DK7e-1SCp
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:03:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749733434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZNcAOEiL3XjwzVrB/UHurIxwW0UwH/mpeP/ua8JcaY=;
	b=HKzm1HBRKnHelVN43bRcu96NW1WHIrHMsq5hv097N9N7jLbjaiJsGWojti9nurVuuBL4r0
	PKwl74gj+VIH8KePn4AdEb7sddKufpCu+eIzuG1LPQPZG5P0ARKx7XltTvhMoSCxsPe3fU
	Z27WWPqiRZBFfBCMhyXDrC0/qgWjy68oI1ixDs4Wn205lSKZU+pAEWQPjgDeb0/KjWtQl/
	CQ8P9/X44uNsYJY1wPjrkYR0Eg4ZrnY20CAmi33MRlBH277vdBirDlI5tGGYRtMOZOmS/T
	ezvYYf6pZR8oeiX5aKiAbCI+71TCZ/yc5lR/NBRt9XkTgJUfxGHXrjJ9MlQ5+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749733434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HZNcAOEiL3XjwzVrB/UHurIxwW0UwH/mpeP/ua8JcaY=;
	b=GlCjmsnpmUVkNWwToYaFt5t5n4hO8nGY3LbhYhRMlVodb9+ZoBG/85IAyOn+C1HOieKWFX
	mUOQXYPfmZDmdEAg==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
In-Reply-To: <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
Date: Thu, 12 Jun 2025 15:03:54 +0200
Message-ID: <87ecvpru11.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_060356_524413_AFB39164 
X-CRM114-Status: GOOD (  12.25  )
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

On Tue, Jun 10 2025 at 13:05, Vladimir Kondratiev wrote:
> +config ACLINT_SSWI
> +	bool
> +
> +config MIPS_P8700_ACLINT_SSWI
> +	bool "MIPS P8700 ACLINT S-mode IPI Interrupt Controller"
> +	depends on RISCV
> +	depends on SMP
> +	select IRQ_DOMAIN_HIERARCHY
> +	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
> +	help
> +	  This enables support for MIPS P8700 specific ACLINT SSWI device
> +
> +	  If you don't know what to do here, say Y.
> +
>  config THEAD_C900_ACLINT_SSWI
>  	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
>  	depends on RISCV
>  	depends on SMP
>  	select IRQ_DOMAIN_HIERARCHY
>  	select GENERIC_IRQ_IPI_MUX
> +	select ACLINT_SSWI
>  	help
>  	  This enables support for T-HEAD specific ACLINT SSWI device
>  	  support.

That's just exactly the same thing twice for no value. Just rename it to
ACLINT_SSWI and have a list of supported chips in the help text.

The only issue with the rename is, that oldconfig will drop the then
non-existing THEAD_C900_ACLINT_SSWI entry in the previous config. That's
not the end of the world and if really desired this can be solved by
having:

config ACLINT_SSWI
	bool "RISCV ACLINT ...."
	depends on RISCV
	depends on SMP
	select IRQ_DOMAIN_HIERARCHY
	select GENERIC_IRQ_IPI_MUX
	select ACLINT_SSWI
	help
	  This enables support for ACLINT SSWI device on THEAD C9XX and
	  MIPS P8700 devices.

# Backwards compatibility so oldconfig does not drop it.
config THEAD_C900_ACLINT_SSWI
	select ACLINT_SSWI

Or something like that.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
