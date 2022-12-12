Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E433C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8J/UbeFBM4HCpwE9jC0ei/BWx2cuTvD6xb3GeZkdRZI=; b=PuAozE0Vsx1TJC
	0xwAb10cG64ijvPKFx3xg6GY2kAy0cj/BeGvzrJp5xynBmNIdyMe8WfuWNU9ip1Udjmrdym7T1Y3G
	5cxNt5iuBGziejVb5NRfs6xsvwktfZO5AYkpa856XpGSw5EfbEGzF/0kcT04HO75OWjEbcnWLwU0N
	9DRiLgn25zANhRzKhxRSn9jUWjb7vCwxPxfMg7wF604wW6RNjnmtpvoj8pFmjb99AXrwchrbXyuxL
	//AwlzbOETesYYh8yObLU/Qrd328dYIB+nb2aDSQlTStSC12vHCfIMLC1QspusW+2BYVQcqMvzIkW
	nBbhZB32eP2TmJg4KR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hzH-00FaiF-MW; Mon, 12 Dec 2022 12:32:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4hzE-00Faf0-Di
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 12:32:50 +0000
Received: from p57b7793f.dip0.t-ipconnect.de ([87.183.121.63] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p4hyl-00033o-D8; Mon, 12 Dec 2022 13:32:19 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 1/6] riscv: asm: alternative-macros: Introduce ALTERNATIVE_3() macro
Date: Mon, 12 Dec 2022 13:32:17 +0100
Message-ID: <8194084.DvuYhMxLoT@phil>
In-Reply-To: <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221212115505.36770-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_043248_514091_786441EB 
X-CRM114-Status: GOOD (  21.78  )
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

Am Montag, 12. Dezember 2022, 12:55:00 CET schrieb Prabhakar:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce ALTERNATIVE_3() macro.
> 
> A vendor wants to replace an old_content, but another vendor has used
> ALTERNATIVE_2() to patch its customized content at the same location.
> In this case, this vendor can use macro ALTERNATIVE_3() and then replace
> ALTERNATIVE_2() with ALTERNATIVE_3() to append its customized content.
> 
> While at it update comment above ALTERNATIVE_2() macro and make it generic
> so that the comment holds good for any new addition of ALTERNATIVE_X()
> macros.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
> v4->v5
> * Rebased the patch on top of Andrew's series (now in Palmers for next-branch)
> * Updated comment for ALTERNATIVE_x() as suggested by Heiko
> 
> RFC v3 -> v4
> * New patch
> ---
>  arch/riscv/include/asm/alternative-macros.h | 46 ++++++++++++++++++---
>  1 file changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index 7226e2462584..a5b4691520da 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -50,8 +50,17 @@
>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> +.macro ALTERNATIVE_CFG_3 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> +				new_c_2, vendor_id_2, errata_id_2, enable_2,	\
> +				new_c_3, vendor_id_3, errata_id_3, enable_3
> +       ALTERNATIVE_CFG_2 \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable_1,	\
> +                                 \new_c_2, \vendor_id_2, \errata_id_2, \enable_2
> +       ALT_NEW_CONTENT \vendor_id_3, \errata_id_3, \enable_3, \new_c_3
> +.endm
> +
>  #define __ALTERNATIVE_CFG(...)		ALTERNATIVE_CFG __VA_ARGS__
>  #define __ALTERNATIVE_CFG_2(...)	ALTERNATIVE_CFG_2 __VA_ARGS__
> +#define __ALTERNATIVE_CFG_3(...)	ALTERNATIVE_CFG_3 __VA_ARGS__
>  
>  #else /* !__ASSEMBLY__ */
>  
> @@ -98,6 +107,13 @@
>  	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1)	\
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
>  
> +#define __ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> +				   new_c_2, vendor_id_2, errata_id_2, enable_2,	\
> +				   new_c_3, vendor_id_3, errata_id_3, enable_3)	\
> +	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1,	\
> +                                   new_c_2, vendor_id_2, errata_id_2, enable_2)	\
> +	ALT_NEW_CONTENT(vendor_id_3, errata_id_3, enable_3, new_c_3)
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
> @@ -108,6 +124,13 @@
>  	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
>  				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2))
>  
> +#define _ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
> +				  new_c_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
> +				  new_c_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
> +	__ALTERNATIVE_CFG_3(old_c, new_c_1, vendor_id_1, errata_id_1, IS_ENABLED(CONFIG_k_1),	\
> +				   new_c_2, vendor_id_2, errata_id_2, IS_ENABLED(CONFIG_k_2),	\
> +				   new_c_3, vendor_id_3, errata_id_3, IS_ENABLED(CONFIG_k_3))
> +
>  #else /* CONFIG_RISCV_ALTERNATIVE */
>  #ifdef __ASSEMBLY__
>  
> @@ -152,15 +175,28 @@
>  	_ALTERNATIVE_CFG(old_content, new_content, vendor_id, errata_id, CONFIG_k)
>  
>  /*
> - * A vendor wants to replace an old_content, but another vendor has used
> - * ALTERNATIVE() to patch its customized content at the same location. In
> - * this case, this vendor can create a new macro ALTERNATIVE_2() based
> - * on the following sample code and then replace ALTERNATIVE() with
> - * ALTERNATIVE_2() to append its customized content.
> + * ALTERNATIVE_x macros allow providing multiple replacement options
> + * for an ALTERNATIVE code section. This is helpful if multiple
> + * implementation variants for the same functionality exist for
> + * different cpu cores.
> + *
> + * Usage:
> + *   ALTERNATIVE_x(old_content,
> + *      new_content1, vendor_id1, errata_id1, CONFIG_k1,
> + *      new_content2, vendor_id2, errata_id2, CONFIG_k2,
> + *      ...
> + *      new_contentx, vendor_idx, errata_idx, CONFIG_kx)
>   */
>  #define ALTERNATIVE_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
>  				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)		\
>  	_ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
>  					new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2)
>  
> +#define ALTERNATIVE_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,		\
> +				   new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,		\
> +				   new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)		\
> +       _ALTERNATIVE_CFG_3(old_content, new_content_1, vendor_id_1, errata_id_1, CONFIG_k_1,	\
> +                                       new_content_2, vendor_id_2, errata_id_2, CONFIG_k_2,	\
> +                                       new_content_3, vendor_id_3, errata_id_3, CONFIG_k_3)
> +
>  #endif
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
