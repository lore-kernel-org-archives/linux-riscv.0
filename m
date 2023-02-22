Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D913FC636D6
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37vL0Uw54c8axp2IHT+CRYyqDOl7TADmGwW6wBqc97c=; b=fKE4JySlyy3DSN
	fA8EQ4rJt9/3MEXnYqRT4DSlh5g5k9/ZuoW5iPFMBdFOyhUbLzUd5ual5haxBUKF3YQfIRPbSxoI3
	ZlyNzTYTyGOhp8Nru2SscFac/Q+5iM65VWj5qC1Xq9wJb/SXBFA2+uzrv02rin2Xe4Fg6RrLjLDs4
	IgbDNIIhVqCHm9hVdLI61yF6ikP5LI9+1KAUm4YsZ+4vS41VHpZSxUVMqzXOCheZFH+oTCxivj0dT
	wMrYC0ivDOUFP2apTDjLSX2SJjnne1YNzGOZNFEJSXN7+bo5LKxSy9pafU4McDU1fOxntGwp/1Mu7
	GzaswzpWZWceLaLvgFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsrQ-00DDFQ-8p; Wed, 22 Feb 2023 17:24:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUsrN-00DDCM-Gf
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 17:24:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 996D41063;
	Wed, 22 Feb 2023 09:25:28 -0800 (PST)
Received: from [10.57.16.42] (unknown [10.57.16.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2E83F881;
	Wed, 22 Feb 2023 09:24:43 -0800 (PST)
Message-ID: <e9d882f4-d57d-f6b4-7ae0-bbfea0f5aa59@arm.com>
Date: Wed, 22 Feb 2023 17:24:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] of: address: Use dma_default_coherent to determine
 default coherency
Content-Language: en-GB
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au, paul.walmsley@sifive.com,
 palmer@dabbelt.com, robh+dt@kernel.org, hch@lst.de,
 m.szyprowski@samsung.com, linux-riscv@lists.infradead.org
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
 <20230222133712.8079-4-jiaxun.yang@flygoat.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230222133712.8079-4-jiaxun.yang@flygoat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_092453_686766_F804FE50 
X-CRM114-Status: GOOD (  22.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-02-22 13:37, Jiaxun Yang wrote:
> As for now all arches have dma_default_coherent matched with default
> DMA coherency for of devices, so there is no need to have a standalone
> config option.
> 
> This also fixes a case that for some MIPS platforms, coherency information
> is not carried in devicetree and kernel will override dma_default_coherent
> at early boot.
> 
> Note for PowerPC: CONFIG_OF_DMA_DEFUALT_COHERENT was only selected when
> CONFIG_NOT_COHERENT_CACHE is false, in this case dma_default_coherent will
> be true, so it still matches present behavior.
> 
> Note for RISC-V: dma_default_coherent is set to true at init code in this
> series.

OK, so the fundamental problem here is that we have two slightly 
different conflicting mechanisms, the ex-PowerPC config option, and the 
ex-MIPS dma_default_coherent for which of_dma_is_coherent() has 
apparently been broken forever.

I'd agree that it's worth consolidating the two, but please separate out 
the fix as below, so it's feasible to backport without having to muck 
about in arch code.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/powerpc/Kconfig | 1 -
>   arch/riscv/Kconfig   | 1 -
>   drivers/of/Kconfig   | 4 ----
>   drivers/of/address.c | 2 +-
>   4 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2c9cdf1d8761..c67e5da714f7 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -272,7 +272,6 @@ config PPC
>   	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
>   	select NEED_SG_DMA_LENGTH
>   	select OF
> -	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
>   	select OF_EARLY_FLATTREE
>   	select OLD_SIGACTION			if PPC32
>   	select OLD_SIGSUSPEND
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d46a268ce16..406c6816d289 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -119,7 +119,6 @@ config RISCV
>   	select MODULES_USE_ELF_RELA if MODULES
>   	select MODULE_SECTIONS if MODULES
>   	select OF
> -	select OF_DMA_DEFAULT_COHERENT
>   	select OF_EARLY_FLATTREE
>   	select OF_IRQ
>   	select PCI_DOMAINS_GENERIC if PCI
> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> index 644386833a7b..e40f10bf2ba4 100644
> --- a/drivers/of/Kconfig
> +++ b/drivers/of/Kconfig
> @@ -102,8 +102,4 @@ config OF_OVERLAY
>   config OF_NUMA
>   	bool
>   
> -config OF_DMA_DEFAULT_COHERENT
> -	# arches should select this if DMA is coherent by default for OF devices
> -	bool
> -
>   endif # OF
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 4c0b169ef9bf..23ade4919853 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -1103,7 +1103,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
>   bool of_dma_is_coherent(struct device_node *np)
>   {
>   	struct device_node *node;
> -	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
> +	bool is_coherent = dma_default_coherent;

AFAICS, all you should actually need is a single self-contained addition 
here, something like:

+	/*
+	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
+	 * might override the system-wide default at runtime.
+	 */
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
+	is_coherent = dma_default_coherent;
+#endif

>   
>   	node = of_node_get(np);
>   

Then *after* that's fixed, we can do a more comprehensive refactoring to 
merge the two mechanisms properly. FWIW I think I'd prefer an approach 
closer to the first one, where config options control the initial value 
of dma_default_coherent rather than architectures having to override it 
unconditionally (and TBH I'd also like to have a generic config symbol 
for whether an arch supports per-device coherency or not).

Thanks,
Robin.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
