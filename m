Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DE4C3DA7D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 03:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSQjimGEZXETaowRcJ80m0Js2FAUM3hsva85lVHidXI=; b=XErS4ChLxxfDRX
	nzu71OfocI6EzeyYTgrHltX/njUQ0l4RYs+oGkoJAX8EG7G2QW//q25mIhLswCXOdykUaswe1aRIh
	Btb3FC8QZpF1jPmlHvON+cafWRtF5yehaPv85WqzGGGgfrPs2RPQEmskB1UObumjDzwoi9zcsXUXz
	lYShpWFQ0B4YkZ43KWAmxPEB/vVa2zMRE59mFkeU7JJJlWY3j4jwHcivM7N9NsHVqnzjqruRQCeg4
	+g3/itIsdZCp/lR+4KZoTJRQBT+WOpzsgqg3JfGdQuQl7H63TV39n9KjvrXipk5ZJ+0EhZPiwN+d0
	HRPx7Lb2Uu/7sKOm4xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAMvZ-0016t2-1o; Wed, 28 Dec 2022 03:16:25 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAMvV-0016qv-Lw
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 03:16:23 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CED0F5C00D1;
	Tue, 27 Dec 2022 22:16:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 27 Dec 2022 22:16:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1672197380; x=
	1672283780; bh=7jin4XazGLKFO27pYIcGAVJNsgoEOWK5fTgHDAuEH9M=; b=d
	wgj3v/Jy0Scguok3oB+t3kmP54QViNPR4hRAGv/wRDaXrbvrhyC/kMphC73Ap6us
	VGp63//AUMpo1SAzc3SjOe0hw0XRN5B2v2QGVMljQ9eqcvfXvpWpZrJgzSnpW74s
	OHAE/p/avnB+AoUXcMhgY6K9+P7b75XkGroA0X1pyhrsmYUDNSTeDsPXLQ2z2exs
	0AOSZLEjydkXbtYoHeYJcwxKKdZdpdMXSLpUnF4Ijmmxk328r6r9GljsvvI+Hr2V
	XZ5BWw8uLXCMdGHIUddlfRyhMHnmgsA3DoCiT7SRFX0a5EUAIPG5ME0W0HLnvVtR
	Xyol9e2slkwMt3oCUtaaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672197380; x=
	1672283780; bh=7jin4XazGLKFO27pYIcGAVJNsgoEOWK5fTgHDAuEH9M=; b=l
	WVhoiWZe9+WH7diIx1P9Mg/1tVv9Op0uGY4CiABf7gYTyDjxm3qfplz691phW73/
	Dh4EC0QVQYtKYA85fVQ8I6HwoByxewHVPnqJCy0Ikky30EGWwH2b8b9ng5GkkczZ
	oM0TIKrii7lA8t24+sQZ+KMuBwM83g7F9zVCKX2ej9ALnV+QGPyyS2M0DidsZiAK
	haHR2fp5a09rT7/4kovcgGQaq1cAP2htU5o/FB8elmo3BD4vrf/IEGvm0r1/Wbbe
	0y2A5v0squbiRHtLQu9DOs7AKtqY/GREkg05WJyJiwJNPg7ZqRZC1H/zgqF420qB
	HgiHUkUBYedd2zW8ZAOEw==
X-ME-Sender: <xms:A7WrYwKrtA1yE0Hq8aDWuVujfMuPrNcY5TQwgux4-NZdHcsZIcMwHA>
    <xme:A7WrYwK4XtHwOQDxoLfQPP50iRJWCcdtOpKGhJsU1Jf_xHdIGKQgkq6_fhW0c9_SM
    cXkQYVL1I1Db83c_g>
X-ME-Received: <xmr:A7WrYwt93pNXjbam6awClnwhVrixjwdIlWrVOGqxigpK9suF1Qnqin1VWlnW8_9FhFPh1J9yNW2ppDHO6DtlpLYL9wKJnYemsfi0oQWYIQgBrhkfpjta89c9Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepteeuvddvveeigefhkeduueduudefgfdvleejgfeiuefgjefhteei
    hfdtleffgeelnecuffhomhgrihhnpegrnhguvghsthgvtghhrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhho
    lhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:A7WrY9aLGu9W2O9YrBMdbCf6babj7ebFfUFaDHVvR4_emlJIkc-zGg>
    <xmx:A7WrY3aSe2Gb34umjRPvWEhUAu7fEXA3_qJ6lTtgtnc9L3C2T5no1A>
    <xmx:A7WrY5D84WCReDlxojdEzK9FKdDRut9QfwkdGdytyLgi_BXW-RlV9A>
    <xmx:BLWrY9xK00UlJeKD5QTn2jXInzoHUkgHRYMa0egaa7xVGbiLlPl_yA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Dec 2022 22:16:18 -0500 (EST)
Message-ID: <2df0317a-5696-8d3e-70a1-72730fbd6a78@sholland.org>
Date: Tue, 27 Dec 2022 21:16:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Andrew Jones
 <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five
 SoC
In-Reply-To: <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_191621_820692_E8860DE9 
X-CRM114-Status: GOOD (  25.37  )
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

On 12/12/22 05:55, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
> 
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
> 
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
> 
> More info about PMA (section 10.3):
> Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
> 
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
> 
> Example PMA region passes as a DT node from OpenSBI:
>     reserved-memory {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         ranges;
> 
>         pma_resv0@58000000 {
>             compatible = "shared-dma-pool";
>             reg = <0x0 0x58000000 0x0 0x08000000>;
>             no-map;
>             linux,dma-default;
>         };
>     };
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Dropped code for configuring L2 cache
> * Dropped code for configuring PMA
> * Updated commit message
> * Added comments
> * Changed static branch enable/disable order
> 
> RFC v3 -> v4
> * Made use of runtime patching instead of compile time
> * Now just exposing single function ax45mp_no_iocp_cmo() for CMO handling
> * Added a check to make sure cache line size is always 64 bytes
> * Renamed folder rzf -> rzfive
> * Improved Kconfig description
> * Dropped L2 cache configuration
> * Dropped unnecessary casts
> * Fixed comments pointed by Geert.
> ---
>  arch/riscv/include/asm/cacheflush.h       |   8 +
>  arch/riscv/include/asm/errata_list.h      |  28 ++-
>  drivers/soc/renesas/Kconfig               |   6 +
>  drivers/soc/renesas/Makefile              |   2 +
>  drivers/soc/renesas/rzfive/Kconfig        |   6 +
>  drivers/soc/renesas/rzfive/Makefile       |   3 +
>  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
>  7 files changed, 303 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/soc/renesas/rzfive/Kconfig
>  create mode 100644 drivers/soc/renesas/rzfive/Makefile
>  create mode 100644 drivers/soc/renesas/rzfive/ax45mp_cache.c

Thanks for the updates! This looks much cleaner and easier to understand
now that the driver is only trying to do one thing.

> diff --git a/drivers/soc/renesas/rzfive/Makefile b/drivers/soc/renesas/rzfive/Makefile
> new file mode 100644
> index 000000000000..2012e7fb978d
> --- /dev/null
> +++ b/drivers/soc/renesas/rzfive/Makefile
...
> +void ax45mp_no_iocp_cmo(unsigned int cache_size, void *vaddr, size_t size, int dir, int ops)
> +{
> +	if (ops == NON_COHERENT_DMA_PREP)
> +		return;
> +
> +	if (!static_branch_unlikely(&ax45mp_l2c_configured))
> +		return;
> +
> +	if (ops == NON_COHERENT_SYNC_DMA_FOR_DEVICE) {
> +		switch (dir) {
> +		case DMA_FROM_DEVICE:
> +			ax45mp_cpu_dma_inval_range(vaddr, size);
> +			break;
> +		case DMA_TO_DEVICE:
> +		case DMA_BIDIRECTIONAL:
> +			ax45mp_cpu_dma_wb_range(vaddr, size);
> +			break;
> +		default:
> +			break;
> +		}
> +		return;
> +	}
> +
> +	/* op == NON_COHERENT_SYNC_DMA_FOR_CPU */
> +	if (dir == DMA_BIDIRECTIONAL || dir == DMA_FROM_DEVICE)
> +		ax45mp_cpu_dma_inval_range(vaddr, size);

I think this at least deserves a comment explaining why it differs from
the clean/flush/invalidate choices in arch/riscv/mm/dma-noncoherent.c.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
