Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6896FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 18:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRSnH3qqtKlFvV5IStNFsPmnApRNgzTyXd1cl7n/fuU=; b=2AovEh1mmHEB/A
	d3IkfHttGp2AYgdIj2GCfqif1XXxLGYCJjGI3VG4OWYLN0UiXViBSObBgEc3q8cfcrn2upRu1q3Qh
	7XFI6V51d16FkuLyMck0UBOx9bIZUApPZ+r20sP+wQmfEZDuEa9BG1lTK8iGG4of82scTWFKoRw4A
	QPNENb9bjzw/RLU0e928J8ETKyoTPEus2wQMQKmwDgCG6eQ5xK4eheE+9ZWRGhjQXvf+sKBg8v4dc
	n53BICTEuhmCrXu+jBufgd7Al38I95nszQL2KRTy3dPRsiwFe5RVqMHOMfbZ1JsYRNJlfSSjmOpBX
	5IQH11qePhR1q8+qsQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGcK-00Akoh-Qp; Thu, 24 Nov 2022 18:06:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyGcH-00Akj9-9c
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 18:06:30 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oyGc0-0007BX-HW; Thu, 24 Nov 2022 19:06:12 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Thu, 24 Nov 2022 19:06:11 +0100
Message-ID: <11335542.nUPlyArG6x@diego>
In-Reply-To: <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_100629_366070_CBEBD826 
X-CRM114-Status: GOOD (  17.63  )
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

Am Donnerstag, 24. November 2022, 18:22:01 CET schrieb Prabhakar:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce ALTERNATIVE_3() macro.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
> RFC v3 -> v4
> * New patch
> ---
>  arch/riscv/include/asm/alternative-macros.h | 94 +++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index ec2f3f1b836f..1caf4306b3d6 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -69,6 +69,34 @@
>  				   new_c_2, vendor_id_2, errata_id_2,	\
>  					IS_ENABLED(CONFIG_k_2)
>  
> +.macro __ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
> +				  new_c_2, vendor_id_2, errata_id_2, enable_2, \
> +				  new_c_3, vendor_id_3, errata_id_3, enable_3
> +886 :
> +	.option push
> +	.option norvc
> +	.option norelax
> +	\old_c
> +	.option pop
> +887 :
> +	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> +	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> +	ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> +.endm
> +
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					CONFIG_k_1,			\
> +				  new_c_2, vendor_id_2, errata_id_2,	\
> +					CONFIG_k_2,			\
> +				  new_c_3, vendor_id_3, errata_id_3,	\
> +					CONFIG_k_3)			\
> +	__ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					IS_ENABLED(CONFIG_k_1),		\
> +				   new_c_2, vendor_id_2, errata_id_2,	\
> +					IS_ENABLED(CONFIG_k_2),		\
> +				   new_c_3, vendor_id_3, errata_id_3,	\
> +					IS_ENABLED(CONFIG_k_3)
> +
>  #else /* !__ASSEMBLY__ */
>  
>  #include <asm/asm.h>
> @@ -135,6 +163,36 @@
>  				   new_c_2, vendor_id_2, errata_id_2,	\
>  					IS_ENABLED(CONFIG_k_2))
>  
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					enable_1,			\
> +				   new_c_2, vendor_id_2, errata_id_2,	\
> +					enable_2,			\
> +				   new_c_3, vendor_id_3, errata_id_3,	\
> +					enable_3)			\
> +	"886 :\n"							\
> +	".option push\n"						\
> +	".option norvc\n"						\
> +	".option norelax\n"						\
> +	old_c "\n"							\
> +	".option pop\n"							\
> +	"887 :\n"							\
> +	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
> +	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)	\
> +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> +
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					CONFIG_k_1,			\
> +				  new_c_2, vendor_id_2, errata_id_2,	\
> +					CONFIG_k_2,			\
> +				  new_c_3, vendor_id_3, errata_id_3,	\
> +					CONFIG_k_3)			\
> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					IS_ENABLED(CONFIG_k_1),		\
> +				   new_c_2, vendor_id_2, errata_id_2,	\
> +					IS_ENABLED(CONFIG_k_2),	\
> +				   new_c_3, vendor_id_3, errata_id_3,	\
> +					IS_ENABLED(CONFIG_k_3))
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #else /* CONFIG_RISCV_ALTERNATIVE */
> @@ -153,6 +211,14 @@
>  					CONFIG_k_2)			\
>         __ALTERNATIVE_CFG old_c
>  
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					CONFIG_k_1,			\
> +				  new_c_2, vendor_id_2, errata_id_2,	\
> +					CONFIG_k_2,			\
> +				  new_c_3, vendor_id_3, errata_id_3,	\
> +					CONFIG_k_3)			\
> +       __ALTERNATIVE_CFG old_c
> +
>  #else /* !__ASSEMBLY__ */
>  
>  #define __ALTERNATIVE_CFG(old_c)  \
> @@ -167,6 +233,14 @@
>  					CONFIG_k_2) \
>         __ALTERNATIVE_CFG(old_c)
>  
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> +					CONFIG_k_1,			\
> +				  new_c_2, vendor_id_2, errata_id_2,	\
> +					CONFIG_k_2,			\
> +				  new_c_3, vendor_id_3, errata_id_3,	\
> +					CONFIG_k_3) \
> +       __ALTERNATIVE_CFG(old_c)
> +
>  #endif /* __ASSEMBLY__ */
>  #endif /* CONFIG_RISCV_ALTERNATIVE */
>  
> @@ -202,4 +276,24 @@
>  					new_content_2, vendor_id_2,	\
>  					    errata_id_2, CONFIG_k_2)
>  
> +/*
> + * A vendor wants to replace an old_content, but another vendor has used
> + * ALTERNATIVE_2() to patch its customized content at the same location. In
> + * this case, this vendor can create a new macro ALTERNATIVE_3() based
> + * on the following sample code and then replace ALTERNATIVE_2() with
> + * ALTERNATIVE_3() to append its customized content.
> + */
> +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1,		\
> +					errata_id_1, CONFIG_k_1,	\
> +				   new_content_2, vendor_id_2,		\
> +					errata_id_2, CONFIG_k_2,	\
> +				   new_content_3, vendor_id_3,		\
> +					errata_id_3, CONFIG_k_3)	\
> +	_ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1,	\
> +					    errata_id_1, CONFIG_k_1,	\
> +					new_content_2, vendor_id_2,	\
> +					    errata_id_2, CONFIG_k_2,	\
> +					new_content_3, vendor_id_3,	\
> +					    errata_id_3, CONFIG_k_3)
> +
>  #endif
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
