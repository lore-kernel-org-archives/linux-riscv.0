Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F99BC021AB
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zans3bnkURxy9/J3WUrK93ilRqt9Ru2N16mm95onjFg=; b=xLKutOcFkGkTFo
	HnJEYtGh0oxWDCUiL3Wd+NlYrtqW1Lxu2IlzVF2ge6/oGB1Vh6Ec25dBWTI9sojEVLk8lOzYCUFMG
	D3kC/CbnL5LjzxCvR3Mx8LSZVdqeZSDsf1ld9c7KshKu9PQmxmQzpHakCBt0OlqlbY5QpdWSPxSHR
	gw6oWgwLQmu2SJGSHo75yfFeIF+/tPI5pAUpeKFw55eZnwBAlL7mT/WBaN+rtCzsxBeplJeA7jfRO
	OA0Rp9+F2YW5qdyGj0elAcEqzU/2JvmUZJqB287upZHQbl0Zx+o2QkEHMKWEe2w/I3mL3y2kKXRNC
	4xHAlmSvPtZbbL4zsPEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0GY-00000004TNr-3NqP;
	Mon, 17 Feb 2025 12:30:26 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk09w-00000004RIc-2MGW
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 12:23:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AA054419E;
	Mon, 17 Feb 2025 12:23:29 +0000 (UTC)
Message-ID: <199526de-4351-4fd7-8f6a-9e8dbf05c184@ghiti.fr>
Date: Mon, 17 Feb 2025 13:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: select DMA_DIRECT_REMAP by RISCV_ISA_SVPBMT and
 ERRATA_THEAD_MAE
Content-Language: en-US
To: Sergey Matyukevich <geomatsi@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Christoph Hellwig <hch@lst.de>
References: <20250116172950.1989748-1-geomatsi@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250116172950.1989748-1-geomatsi@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkeeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepvdeludfgleffteekgfelheetvdeugffgiedtueetgedtfeefleeileehieekvddunecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemleelvgehmehfrgdtsgemjeeivdgumedusggsfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemleelvgehmehfrgdtsgemjeeivdgumedusggsfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemleelvgehmehfrgdtsgemjeeivdgumedusggsfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_042336_756721_C136B206 
X-CRM114-Status: GOOD (  16.55  )
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

Hi Sergey,

On 16/01/2025 18:29, Sergey Matyukevich wrote:
> Select DMA_DIRECT_REMAP for the RISC-V extensions that allow to set
> page-based memory types in PTEs according to the requested DMA
> attributes. This is the purpose of Svpbmt or XTheadMae extensions.
> Zicbom or XTheadCmo serve a different purpose, providing instructions
> to flush/invalidate cache blocks.
>
> Fixes: 381cae169853 ("riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT")
>
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>   arch/riscv/Kconfig        | 2 +-
>   arch/riscv/Kconfig.errata | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d4a7ca0388c0..a5dabb744009 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -603,6 +603,7 @@ config RISCV_ISA_SVPBMT
>   	depends on 64BIT && MMU
>   	depends on RISCV_ALTERNATIVE
>   	default y
> +	select DMA_DIRECT_REMAP


 From what I read, DMA_DIRECT_MAP relies on the ability to map pages 
uncached (pgprot_dmacoherent() here 
https://elixir.bootlin.com/linux/v6.13.2/source/kernel/dma/pool.c#L104). 
But CONFIG_RISCV_ISA_SVPBMT does not guarantee that the underlying 
platform supports svpbmt so to me it is wrong to select DMA_DIRECT_MAP, 
we would need some runtime check instead.


>   	help
>   	   Adds support to dynamically detect the presence of the Svpbmt
>   	   ISA-extension (Supervisor-mode: page-based memory types) and
> @@ -787,7 +788,6 @@ config RISCV_ISA_ZICBOM
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	select RISCV_DMA_NONCOHERENT


And in the same way, we should not enable RISCV_DMA_NONCOHERENT since 
CONFIG_RISCV_ISA_ZICBOM does guarantee the presence of zicbom. Because 
then in mm/dma-noncoherent.c, the cache flush operations are nops.

Or am I missing something?

Thanks,

Alex


> -	select DMA_DIRECT_REMAP
>   	help
>   	   Adds support to dynamically detect the presence of the ZICBOM
>   	   extension (Cache Block Management Operations) and enable its
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 2acc7d876e1f..3bcae5bd3231 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -86,6 +86,7 @@ config ERRATA_THEAD_MAE
>   	bool "Apply T-Head's memory attribute extension (XTheadMae) errata"
>   	depends on ERRATA_THEAD && 64BIT && MMU
>   	select RISCV_ALTERNATIVE_EARLY
> +	select DMA_DIRECT_REMAP
>   	default y
>   	help
>   	  This will apply the memory attribute extension errata to handle the
> @@ -96,7 +97,6 @@ config ERRATA_THEAD_MAE
>   config ERRATA_THEAD_CMO
>   	bool "Apply T-Head cache management errata"
>   	depends on ERRATA_THEAD && MMU
> -	select DMA_DIRECT_REMAP
>   	select RISCV_DMA_NONCOHERENT
>   	select RISCV_NONSTANDARD_CACHE_OPS
>   	default y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
