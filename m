Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0135FC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 10:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvvoM4A6b3rqVWqzrBZBWfwGxgYSl3yxLBN1WWuwf60=; b=3UAs0o7UYBb0LH
	fI7WmRvSOW/p0qLGUMhJLNavvvWfv7DmkC5PmgAsy9d/5oCQUJqE9qI5nWi/JNTYok+2weAmsySkw
	Hd0fmOzES/cCKbF9Jkh5r1/A3iN+DWEjdTmx1mecnxhch63F/7s3ZhE/xLllkNAMTVzIufiNCENgP
	8Kh2urilV6EC92ijK+bVliebu2bz8cEm44H0MNH2tjPsa6EtZ/QMl/QL9TJ/jRhyr3ISNeHJha2JM
	47ZnselWxZtpVH8vzeIoos0/FPOUD6cOr1cw4Kq2vuwMxb3VPmTTEOrNoi0gWyAxW3+SoWbul9+6H
	Vn2SkVKWbbhllt5trAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jz6-00FKSw-N1; Wed, 30 Nov 2022 10:06:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Jz3-00FKRu-U7
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 10:06:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p0Jz2-0000zH-4G; Wed, 30 Nov 2022 11:06:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, prabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 3/4] riscv: alternatives: Drop the underscores from the assembly macro names
Date: Wed, 30 Nov 2022 11:06:27 +0100
Message-ID: <4168918.X9hSmTKtgW@diego>
In-Reply-To: <20221129150053.50464-4-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com> <20221129150053.50464-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_020630_017128_D12B5325 
X-CRM114-Status: GOOD (  18.95  )
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

Am Dienstag, 29. November 2022, 16:00:52 CET schrieb Andrew Jones:
> The underscores aren't needed because there isn't anything already
> named without them and the _CFG extension. This is a bit of a cleanup
> by itself, but the real motivation is for a coming patch which would
> otherwise need to add two more underscores to these macro names,
> i.e. ____ALTERNATIVE_CFG, and that'd be gross.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Hmm, I would assume the "_" are there to mark those as
"internal / don't use". So with removing the underscores
you loose that marking.

It works though, so
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

But I'll leave the judgement on its viability to others.

Heiko

> ---
>  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 7cc2b587c5c4..9ea95331a280 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -33,7 +33,7 @@
>  	.endif
>  .endm
>  
> -.macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> +.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
>  886 :
>  	.option push
>  	.option norvc
> @@ -45,11 +45,11 @@
>  .endm
>  
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
> -	__ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
> +	ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k)
>  
> -.macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> -				  new_c_2, vendor_id_2, errata_id_2, enable_2
> -	__ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
> +.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> +				new_c_2, vendor_id_2, errata_id_2, enable_2
> +	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> @@ -57,9 +57,9 @@
>  					CONFIG_k_1,			\
>  				  new_c_2, vendor_id_2, errata_id_2,	\
>  					CONFIG_k_2)			\
> -	__ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
>  					IS_ENABLED(CONFIG_k_1),		\
> -				   new_c_2, vendor_id_2, errata_id_2,	\
> +				 new_c_2, vendor_id_2, errata_id_2,	\
>  					IS_ENABLED(CONFIG_k_2)
>  
>  #else /* !__ASSEMBLY__ */
> @@ -126,15 +126,15 @@
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
>  
> -.macro __ALTERNATIVE_CFG old_c
> +.macro ALTERNATIVE_CFG old_c
>  	\old_c
>  .endm
>  
>  #define _ALTERNATIVE_CFG(old_c, ...)	\
> -	__ALTERNATIVE_CFG old_c
> +	ALTERNATIVE_CFG old_c
>  
>  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
> -	__ALTERNATIVE_CFG old_c
> +	ALTERNATIVE_CFG old_c
>  
>  #else /* !__ASSEMBLY__ */
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
