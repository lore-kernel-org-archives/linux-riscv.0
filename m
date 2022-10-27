Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF57FA3742
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg657f8DmSTnh9zaC9wu/MH6gzGL2GSg32zyHBV1rx4=; b=dxdqTRxsyemF/r
	i5s2C2DhWYPIS6989v5XB00lOn+oKCE81fg6GSyU5pzUAcNIqyNYzbzceR8RGyQch1o9wb/BaqNbc
	LnrI4uvFZKNe8U+j7eM0MjdpNc/I17gEdAHGL0Lw/1L7PPVaSRDauvL5vaWr06Jmj8UOL4Cs2eJc/
	36r+yCIl/b31lQhVvDBddyoWUBW3LbWlRe9Q/BXSwkzwyAb8tRWLzJTD1pXqAM7FwWdj9WJkoUmvO
	lwS5Ne0TOg7k8Oa6wSBpfo7ecHxhMbrnR1PkclHTpKZ/QXy7E2p9WPJIKpW2oVEMOZyz3YqEfXo8U
	GkBl52eKa++vg0ISI8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2bP-00DLEQ-KF; Thu, 27 Oct 2022 13:07:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2a0-00DKTn-Pa
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:05:54 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oo2Zu-0000Vs-WD; Thu, 27 Oct 2022 15:05:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Improve use of isa2hwcap[]
Date: Thu, 27 Oct 2022 15:05:46 +0200
Message-ID: <4911272.GXAFRqVoOG@diego>
In-Reply-To: <20221024091309.406906-2-ajones@ventanamicro.com>
References: <20221024091309.406906-1-ajones@ventanamicro.com> <20221024091309.406906-2-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060552_895643_DCAEBE83 
X-CRM114-Status: GOOD (  17.24  )
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

Am Montag, 24. Oktober 2022, 11:13:07 CEST schrieb Andrew Jones:
> Improve isa2hwcap[] by removing it from static storage, as
> riscv_fill_hwcap() is only called once, and by reducing its size
> from 256 bytes to 26. The latter improvement is possible because
> isa2hwcap[] will never be indexed with capital letters and we can
> precompute the offsets from 'a'.
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/kernel/cpufeature.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..4677320d7e31 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -74,15 +74,15 @@ void __init riscv_fill_hwcap(void)
>  	const char *isa;
>  	char print_str[NUM_ALPHA_EXTS + 1];
>  	int i, j, rc;
> -	static unsigned long isa2hwcap[256] = {0};
> +	unsigned long isa2hwcap[26] = {0};
>  	unsigned long hartid;
>  
> -	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> -	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
> -	isa2hwcap['a'] = isa2hwcap['A'] = COMPAT_HWCAP_ISA_A;
> -	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
> -	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
> -	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
> +	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
> +	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> +	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
> +	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
> +	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
> +	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
>  
>  	elf_hwcap = 0;
>  
> @@ -196,8 +196,10 @@ void __init riscv_fill_hwcap(void)
>  			if (unlikely(ext_err))
>  				continue;
>  			if (!ext_long) {
> -				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -				set_bit(*ext - 'a', this_isa);
> +				int nr = *ext - 'a';
> +
> +				this_hwcap |= isa2hwcap[nr];
> +				set_bit(nr, this_isa);
>  			} else {
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
