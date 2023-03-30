Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226BEC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mL1H9JC89R/suGi//Htj8qOMsD6C2mGP/iJ/c9Yra08=; b=MIAg4pDiqH4ZSo
	zLVTlNI5AA7bv+dTV+8eDRWC3Nxu6lk4x1uaBgIPDClPRDRm1M6y314eXUE6XniCFEG83leyVxdph
	PFt0ce6f2tZj/VjR8ezq6Qo/dzZUsHccsy8j9bLnukFJ7s/1qT6RFGZFZ9qrO/DHhI+cccTsx2eBq
	ADXsZ8Zy+B7/ViCdiOPvKYGw7f5RonElvyfbxUFZqFEh5a60SjAOUxNmG3vhQS3QfC+z8erpI+V4M
	jiU5BixVEO541UgXJQLXgGPAwAGaO2SJH95FjRijk6KrIMgXMtKLh+HYvXA37kB55CpCcf78jLtFI
	QFJgphFNINdQltT+zJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzuk-0058FJ-2L;
	Thu, 30 Mar 2023 21:34:34 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzuf-0058EE-1y
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 21:34:31 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 5B925320094E;
	Thu, 30 Mar 2023 17:34:24 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 30 Mar 2023 17:34:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680212063; x=1680298463; bh=hp
	uSAgqfUaqD/ysKyJQwTcBXNZjA8xYFCgAGQ8d1bL8=; b=vPTfmWAyebme5BY4p6
	J4ucGHGxrN86sr2fRjD+KS3geiZl6TYAyvsUFTPJV9vgZm+YpnhnUAfkJuQyjcZ0
	HsUAp7qWX2x1XpqS/6Avrs5R6vNIeD2d9e0BclI7l4+Xa85yS7RJ7d4zBfAPteQY
	IqSl4R+T8FOxkEJWL3lxLJOTpvEslf10gn2QFIk8BUptkGAC1qgV7vk6wPe9Et7X
	9jJquc17UpAUSDRMARTnPuIVSBD/q6atWEbNYS/Tde0YqW4Rrc97T0IXg06IROeW
	rxADsu62hJFwbM1wo85cXh3YgY7X/taN2HPLNJWSvyzj1m98x8wrioQ3DIfdaF4V
	2+0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680212063; x=1680298463; bh=hpuSAgqfUaqD/
	ysKyJQwTcBXNZjA8xYFCgAGQ8d1bL8=; b=ZRndJORL0aLLZMdezjvfovMzjPjgD
	/SKaR2niKqMry7R8FNFZGjh6xUJlJtOb6rhudt5wAj1K9u1sYHvrZpeqlEDxoKFj
	CTdphfMnjq0IF2XCIbcOBtcqdVkl5LClq/oTtAv9Q5Ek04a3t4xNLzeteriILCbR
	wFgeLl4JeUAV7iqsnUT3fP1OZ96KKTukwHGEcPp2mXXWnfg6M875wmv6yXpM9OSy
	0Yx6bCmmskVhOyGFO/I5Pf+60RdcF2NNRAmXxzKR1nCNajILfNoGjY5Flxnbcdz0
	NKA2Ph3MOwJlhjfrjqwQjxoLGItm1DUYfekI3VnjvQGVBMEAu6735U2nQ==
X-ME-Sender: <xms:XwAmZHnJYWMFJmQOZtTITumy-EB4NgW6rRQXnIGt1NOfbyYHegs37w>
    <xme:XwAmZK2aJx29Qpw-cq6bhpawMaG2yq2NHtOziL7jTMDJDb85mCeqym62zH29mwsxN
    rKC1pGPxWAiawX49cA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehledgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:XwAmZNqhsJPQicXWZvvxtikvnPQm5OVNl49IFAyrhhZRaiF1V9y9SA>
    <xmx:XwAmZPkxehnn8E_iSkk91ZnWcfXm8zZDhRls891efa4l0d1EpjMgMA>
    <xmx:XwAmZF3BvN2SH4R7BPA2b39JA-WzPFTCtSkq0rWw-BoDi1Rm7vRXsw>
    <xmx:XwAmZE3yMMFvvLb-B40Fm_jatYudGBfd4G6AXs6SphEee8iJQan4tQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 01C80B60086; Thu, 30 Mar 2023 17:34:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
In-Reply-To: <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 30 Mar 2023 23:34:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, guoren <guoren@kernel.org>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Samuel Holland" <samuel@sholland.org>, linux-riscv@lists.infradead.org
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Biju Das" <biju.das.jz@bp.renesas.com>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function pointers
 for cache management
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_143430_120982_55FEA824 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Mar 30, 2023, at 22:42, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Currently, selecting which CMOs to use on a given platform is done using
> and ALTERNATIVE_X() macro. This was manageable when there were just two
> CMO implementations, but now that there are more and more platforms coming
> needing custom CMOs, the use of the ALTERNATIVE_X() macro is unmanageable.
>
> To avoid such issues this patch switches to use of function pointers
> instead of ALTERNATIVE_X() macro for cache management (the only drawback
> being performance over the previous approach).
>
> void (*clean_range)(unsigned long addr, unsigned long size);
> void (*inv_range)(unsigned long addr, unsigned long size);
> void (*flush_range)(unsigned long addr, unsigned long size);
>
> The above function pointers are provided to be overridden for platforms
> needing CMO.
>
> Convert ZICBOM and T-HEAD CMO to use function pointers.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This is looking pretty good. There are a few things that I
still see sticking out, and I think I've mentioned some of 
them before, but don't remember if there was a reason for
doing it like this:

> +#ifdef CONFIG_ERRATA_THEAD_CMO

I would rename this to not call this an 'ERRATA' but
just make it a driver. Not important though, and there
was probably a reason you did it like this.

> +extern struct riscv_cache_ops noncoherent_cache_ops;
> +
> +void riscv_noncoherent_register_cache_ops(const struct riscv_cache_ops 
> *ops);
> +
> +static inline void riscv_dma_noncoherent_clean(void *vaddr, size_t 
> size)
> +{
> +	if (noncoherent_cache_ops.clean_range) {
> +		unsigned long addr = (unsigned long)vaddr;
> +
> +		noncoherent_cache_ops.clean_range(addr, size);
> +	}
> +}

The type case should not be necessary here. Instead I would 
make the callbacks use 'void *' as well, not 'unsigned long'.

It's possible that some future cache controller driver requires
passing physical addresses, as is common for last level cache,
but as long as all drivers pass virtual addresses, it's easier
to do the phys_to_virt() in common code.

It also seems wrong to have the fallback be to do nothing
when the pointer is NULL, since that cannot actually work
when a device is not cache coherent.

I would either initialize the function pointer to the
zicbom version and remove the NULL check, or keep the
pointer NULL and have an explicit
'else zicbom_clean_range()' fallback.

> +static void zicbom_register_cmo_ops(void)
> +{
> +	riscv_noncoherent_register_cache_ops(&zicbom_cmo_ops);
> +}
> +#else
> +static void zicbom_register_cmo_ops(void) {}
> +#endif

As far as I recall, the #else path here was needed previously
to work around a binutils dependency, but with the current
code, it should be possible to just always enable
CONFIG_RISCV_ISA_ZICBOM when RISCV_DMA_NONCOHERENT is used.

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
