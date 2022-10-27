Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98053FA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DppddwW7oYJuqOGY/r2jrGpaR0OSYBVxTCgT+rx5vS4=; b=hm/lArFNuf7gS8
	7fMpO/RAet6B+cLDm5YQJOZsJ0DisA/gztnN1OknCeW27xygBo7gTc3Ge5krEKOtzfj3LeEFcBFCB
	qG4zIIzrUGJejENQ77NnPWrDEYhU6sLpILIlfbQPxglx/Rs0GNLZpZicAQ8qpObTJfYuVqzswWlja
	qbQxKnZhy/vG9sS6DaiWi5nE5YfkAJjp8BwjJ3lEtyE8Sc2DlN0NdaeMuoVYHEHEIJ52priJ6T/aK
	2tHWnd10TK50+Y6K9CP3ImncmP384AgaTDfasFFCvyM7Rp7tY23j4yiMiLzxBp7W33rdEcfrMYBE2
	5ykPoZ/ie7RPqmL1ePQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2cm-00DLwX-MU; Thu, 27 Oct 2022 13:08:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2cY-00DLoO-St
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:08:35 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo2cX-0000Wo-H5; Thu, 27 Oct 2022 15:08:29 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 2/3] RISC-V: Introduce riscv_isa_extension_check
Date: Thu, 27 Oct 2022 15:08:28 +0200
Message-ID: <2280350.irdbgypaU6@diego>
In-Reply-To: <20221024091309.406906-3-ajones@ventanamicro.com>
References: <20221024091309.406906-1-ajones@ventanamicro.com> <20221024091309.406906-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060830_975170_64A50EB1 
X-CRM114-Status: GOOD (  24.51  )
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

Am Montag, 24. Oktober 2022, 11:13:08 CEST schrieb Andrew Jones:
> Currently any isa extension found in the isa string is set in the
> isa bitmap. An isa extension set in the bitmap indicates that the
> extension is present and may be used (a.k.a is enabled). However,
> when an extension cannot be used due to missing dependencies or
> errata it should not be added to the bitmap. Introduce a function
> where additional checks may be placed in order to determine if an
> extension should be enabled or not.
> 
> Note, the checks may simply indicate an issue with the DT, but,
> since extensions may be used in early boot, it's not always possible
> to simply produce an error at the point the issue is determined.
> It's best to keep the extension disabled and produce an error.
> 
> No functional change intended, as the function is only introduced
> and always returns true. A later patch will provide checks for an
> isa extension.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/kernel/cpufeature.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 4677320d7e31..220be7222129 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -68,6 +68,11 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
> +static bool riscv_isa_extension_check(int id)
> +{
> +	return true;
> +}
> +
>  void __init riscv_fill_hwcap(void)
>  {
>  	struct device_node *node;
> @@ -189,7 +194,8 @@ void __init riscv_fill_hwcap(void)
>  #define SET_ISA_EXT_MAP(name, bit)						\
>  			do {							\
>  				if ((ext_end - ext == sizeof(name) - 1) &&	\
> -				     !memcmp(ext, name, sizeof(name) - 1))	\
> +				     !memcmp(ext, name, sizeof(name) - 1) &&	\
> +				     riscv_isa_extension_check(bit))		\
>  					set_bit(bit, this_isa);			\
>  			} while (false)						\
>  
> @@ -198,8 +204,10 @@ void __init riscv_fill_hwcap(void)
>  			if (!ext_long) {
>  				int nr = *ext - 'a';
>  
> -				this_hwcap |= isa2hwcap[nr];
> -				set_bit(nr, this_isa);
> +				if (riscv_isa_extension_check(nr)) {
> +					this_hwcap |= isa2hwcap[nr];
> +					set_bit(nr, this_isa);
> +				}
>  			} else {
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
