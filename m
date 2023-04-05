Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5357BC76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+i2oRd2GMVgjyvmKMVZqeUBxNWWVXiczKbKnjo38Z5A=; b=WSX1+4z4Y+2yzq
	UJXV6ChSDS3UYZ4a5zWBTxjq8pKtq52L8WanuXB9QZCaYS+woCtWYuL5KlnsUYq6l+9/gHxfnAIRI
	dadbfNwvmocxNqvBCo3ogZbJHziWdZBAKX6Y72AOxZEkvkSsgCAFv4OUSs3QJ09qvStl2nfdHA+m7
	6S2JNKy7yVntdFt66l1s0mkyo1ygW32XgNzE018GJPowXwUgIrlfkwObsPtdtevvvPlKCpiE7vBBh
	+snxWMUs4lB/hHnNlC1V/Q982ieNGGvi4Gzvqlpmg3JwanwiMdXeUcXBspnz67QFfdBHawLEUY9+o
	xjjumNcPHf6hdyaLtrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1ao-004Jao-0d;
	Wed, 05 Apr 2023 11:46:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1al-004JYj-0o
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 11:46:20 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pk1ag-0006de-Iz; Wed, 05 Apr 2023 13:46:14 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@dabbelt.com, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
Subject:  Re: [PATCH v2] RISC-V: align ISA extension Kconfig help text with each other
Date: Wed, 05 Apr 2023 13:46:13 +0200
Message-ID: <3921419.QJadu78ljV@diego>
In-Reply-To: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
References: <20230405-pucker-cogwheel-3a999a94a2f2@wendy>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_044619_288546_39F72708 
X-CRM114-Status: GOOD (  27.47  )
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

Am Mittwoch, 5. April 2023, 12:21:10 CEST schrieb Conor Dooley:
> Other extensions only capitalise the first letter in the text visible
> in Kconfig menus, and provide a short comment about the extension's
> meaning. Do the same for Svnapot & Svpbmt.
> 
> The precedent for capitalisation in the Kconfig text was set by Zicbom
> & sorta followed for Zicboz. The RVI styling used for multi-letter
> extensions only capitalises the first letter, so do the same here.
> If nothing else, my OCD likes it when the extensions follow a consistent
> pattern.
> 
> While editing one of the lines, reformat the "spelling" of 64-bit.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

I do believe it makes a lot of sense to follow the official spelling
(first letter upper case). This will make it also easier for later additions
to also not create own casing-forms :-) .

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
> Changes in v2:
> - do the same for Svnapot too
> - s/ZICBOZ/Zicboz
> ---
>  arch/riscv/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index cc02eb9eee1f..92e8b4d908b6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -400,31 +400,31 @@ config RISCV_ISA_C
>  	  If you don't know what to do here, say Y.
>  
>  config RISCV_ISA_SVNAPOT
> -	bool "SVNAPOT extension support"
> +	bool "Svnapot extension support for supervisor mode NAPOT pages"
>  	depends on 64BIT && MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
> +	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
>  	  time and enable its usage.
>  
> -	  The SVNAPOT extension is used to mark contiguous PTEs as a range
> +	  The Svnapot extension is used to mark contiguous PTEs as a range
>  	  of contiguous virtual-to-physical translations for a naturally
>  	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
>  	  size. When HUGETLBFS is also selected this option unconditionally
>  	  allocates some memory for each NAPOT page size supported by the kernel.
>  	  When optimizing for low memory consumption and for platforms without
> -	  the SVNAPOT extension, it may be better to say N here.
> +	  the Svnapot extension, it may be better to say N here.
>  
>  	  If you don't know what to do here, say Y.
>  
>  config RISCV_ISA_SVPBMT
> -	bool "SVPBMT extension support"
> +	bool "Svpbmt extension support for supervisor mode page-based memory types"
>  	depends on 64BIT && MMU
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the SVPBMT
> +	   Adds support to dynamically detect the presence of the Svpbmt
>  	   ISA-extension (Supervisor-mode: page-based memory types) and
>  	   enable its usage.
>  
> @@ -432,7 +432,7 @@ config RISCV_ISA_SVPBMT
>  	   that indicate the cacheability, idempotency, and ordering
>  	   properties for access to that page.
>  
> -	   The SVPBMT extension is only available on 64Bit cpus.
> +	   The Svpbmt extension is only available on 64-bit cpus.
>  
>  	   If you don't know what to do here, say Y.
>  
> @@ -482,7 +482,7 @@ config RISCV_ISA_ZICBOZ
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> +	   Enable the use of the Zicboz extension (cbo.zero instruction)
>  	   when available.
>  
>  	   The Zicboz extension is used for faster zeroing of memory.
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
