Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED44C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4HO92EvDYEe9EZBG7ft+O25j4RY9riDs6E2XOgpnnA=; b=rfq4on8upXefpf
	nPiPUPcs61QaAR/rVLM25cC/Ff91u5wvZFbozQmTNxXXibS2GP5/ziU03OZ/w5AjVBWs7MKxmkoko
	VoPVet/x9dacxyef5b7YAnlSFzvRxCkGJPejQ+MPte0+Iz1a5lYjOK3hfabw+O3g/EbRCuWF2iWYh
	Rv5OM1FG1Ef6B4TDRFBRHuANFGjJa6+E+8ZyiB0yU6FovXtu/dIRgI8EHxtou4+G4a40vWRigd8f1
	M3kD7DpCfXCbCmWX7Iy/ffZ9811UQIqevWHJDzHQ5XGGxQxODzFWvUgXqGDWCZK3a/sFnfgmtVlHk
	h5unOSaoo3rjaP0R0ZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jzg-00FKhj-Hd; Wed, 30 Nov 2022 10:07:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jzd-00FKfn-Dw
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 10:07:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Jzc-0000zd-2g; Wed, 30 Nov 2022 11:07:04 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, prabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 4/4] riscv: Don't duplicate _ALTERNATIVE_CFG* macros
Date: Wed, 30 Nov 2022 11:07:03 +0100
Message-ID: <14707905.dW097sEU6C@diego>
In-Reply-To: <20221129150053.50464-5-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com> <20221129150053.50464-5-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_020705_496042_C62B7047 
X-CRM114-Status: GOOD (  18.20  )
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

Am Dienstag, 29. November 2022, 16:00:53 CET schrieb Andrew Jones:
> Reduce clutter by only defining the _ALTERNATIVE_CFG* macros once,
> rather than once for assembly and once for C. To do that, we need to
> add __ALTERNATIVE_CFG* macros to the assembly side, but those are
> one-liners. Also take the opportunity to do a bit of reformatting,
> taking full advantage of the fact checkpatch gives us 100 char lines.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

As this depends on patch3,

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

But I'll leave the judgement on its viability to others.


Heiko

> ---
>  arch/riscv/include/asm/alternative-macros.h | 53 +++++++--------------
>  1 file changed, 17 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 9ea95331a280..7226e2462584 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -44,23 +44,14 @@
>  	ALT_NEW_CONTENT \vendor_id, \errata_id, \enable, \new_c
>  .endm
>  
> -#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> -	ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
> -
>  .macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
>  				new_c_2, vendor_id_2, errata_id_2, enable_2
>  	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> -#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -					CONFIG_k_1,			\
> -				  new_c_2, vendor_id_2, errata_id_2,	\
> -					CONFIG_k_2)			\
> -	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -					IS_ENABLED(CONFIG_k_1),		\
> -				 new_c_2, vendor_id_2, errata_id_2,	\
> -					IS_ENABLED(CONFIG_k_2)
> +#define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
> +#define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
>  
>  #else /* !__ASSEMBLY__ */
>  
> @@ -102,27 +93,21 @@
>  	"887 :\n"							\
>  	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
>  
> -#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
> -	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> -
> -#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -					enable_1,			\
> -				   new_c_2, vendor_id_2, errata_id_2,	\
> -					enable_2)			\
> -	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1) \
> +#define __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> +				   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
> +	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
>  
> -#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -					CONFIG_k_1,			\
> -				  new_c_2, vendor_id_2, errata_id_2,	\
> -					CONFIG_k_2)			\
> -	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -					IS_ENABLED(CONFIG_k_1),		\
> -				   new_c_2, vendor_id_2, errata_id_2,	\
> -					IS_ENABLED(CONFIG_k_2))
> -
>  #endif /* __ASSEMBLY__ */
>  
> +#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
> +	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
> +
> +#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
> +				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
> +	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
> +				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
> +
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
>  
> @@ -173,13 +158,9 @@
>   * on the following sample code and then replace ALTERNATIVE() with
>   * ALTERNATIVE_2() to append its customized content.
>   */
> -#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1,		\
> -					errata_id_1, CONFIG_k_1,	\
> -				   new_content_2, vendor_id_2,		\
> -					errata_id_2, CONFIG_k_2)	\
> -	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1,	\
> -					    errata_id_1, CONFIG_k_1,	\
> -					new_content_2, vendor_id_2,	\
> -					    errata_id_2, CONFIG_k_2)
> +#define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
> +				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
> +	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
> +					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
>  
>  #endif
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
