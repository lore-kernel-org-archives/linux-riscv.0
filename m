Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9242D606A326
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JN3QBy8r;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VdLfid2n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ueg5W8VrLZVKUVxj8vLf60Dgo0ckq5QgOK+pjLWrpE0=; b=JN3QBy8rrY9gH9xVGpbrZplbi1
	S/4D+JsLOJi+6RNKlp9OX8hbA7HxyyzE35TxO1VINh1TonY4trCt65p5yAKBtFtpDAUxjplD77jR3
	UtIJ5NXA2F9ofiAtXCyQEBvAWz0MYXAKUUlPqZH2UD13eE4ByjHw1r6NryTaulpzlGLRYNx5A3c+G
	+r5VnzwzqmRjk/KXXJ1S5oteKljbc1iJ6XpmpgwdDFO0/e5U6RFzReaYqvlV/fSPw3Z34oTXRuXZc
	dGHmFp3I9D6x+G3kxXOrEVC8qVjEPq00T/6j9ICn8W/h7NGhYC+d0OqJVBKBthIG7VJDrwzFyq07L
	HbCtUEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgsB-0000000Em64-2Gyn;
	Sat, 07 Nov 2026 13:54:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgsA-0000000Em5y-2FwS
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 13:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E66A160145;
	Sat,  7 Nov 2026 13:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07941F0089F;
	Sat,  7 Nov 2026 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794059660;
	bh=tzmJbY9+2aOS+0PEDWjK0tMonM6rQxiKbKkjm8cfCuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VdLfid2n0iyoCwfWQHlDpS/Q2T2WaxLRQyYrVQMM5Ww15NqLpRAX6WF5VKcyYSfx6
	 XAF1POZV9qcBXCH3XbJY26zMQ/1QTpwYmTYL9lftMKnyMhro3YpIK8lLJuV51jJImy
	 vjgntYe0Oz0E133Z8Qcb09YfJAdbp28bC993ArDB2AjsQbZD17+kkcER54Xh9gG4gA
	 IBf16lQLo+kXKTdAc2Ng1KY3kAgpcKOmiKwCf0bSQyQ3Zt8IvJTRPxwFtRuUyUZt/G
	 l91SacI5S9DscZ9L92NUqhaPsljMRZJuqulEl7mfPtTTRkcaI3jKL37J6TRi4FO3qM
	 wGDp/Nn8bF3Mw==
Date: Sat, 7 Nov 2026 21:34:00 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, conor@kernel.org,
	wangruikang@iscas.ac.cn, ganboing@gmail.com, alex@ghiti.fr,
	cleger@meta.com, geshijian@picoheart.com, niehaitao@picoheart.com,
	cuiyunhui@bytedance.com, gaohan@iscas.ac.cn
Subject: Re: [PATCH v6 5/5] riscv: errata: picoheart: Add workaround for
 AMOCASQ errata
Message-ID: <au8oyDjRJuSL9mj_@xhacker>
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
 <20261104075706.73657-6-yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104075706.73657-6-yang.yicong@picoheart.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 03:57:06PM +0800, Yicong Yang wrote:
> Some Picoheart CPUs implement Zacas extension but lack support
> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
> facto unavailable. Since currently no ways to retrieve the PMA
> information and the riscv kernel will declare cmpxchg128 support
> if platform declare support of Zacas, the use of cmpxchg128 will
> lead to PMA violation and crash the kernel. Add the errata
> workaround to disable the use of cmpxchg128 on the affected CPUs.
> 
> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> ---
>  arch/riscv/Kconfig.errata                    | 12 ++++++++++
>  arch/riscv/errata/picoheart/errata.c         | 25 +++++++++++++++++++-
>  arch/riscv/include/asm/cmpxchg.h             | 18 +++++++++++++-
>  arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
>  4 files changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index c75dec4b0ba7..4e6516ba3a42 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -202,4 +202,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
>  
>  	   If you don't know what to do here, say "Y".
>  
> +config ERRATA_PICOHEART_AMOCASQ
> +	bool "Apply Picoheart AMOCASQ errata"
> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
> +	default y
> +	help
> +	  Some Picoheart CPUs implement the Zacas extension but lack support
> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
> +	  unavailable. Enable this errata workaround to disable the use of
> +	  CASQ in the kernel (cmpxchg128).
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
> index c945ae694396..a658f38cf4de 100644
> --- a/arch/riscv/errata/picoheart/errata.c
> +++ b/arch/riscv/errata/picoheart/errata.c
> @@ -174,11 +174,34 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
>  }
>  
> +static bool picoheart_errata_probe_amocasq(unsigned int stage,
> +					   unsigned long archid,
> +					   unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
> +		return false;
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
> +	    !riscv_isa_extension_available(NULL, ZACAS))
> +		return false;
> +
> +	if (archid != 0x804a555049544552 || impid != 0x100)
> +		return false;
> +
> +	return true;
> +}
> +
>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
>  				  unsigned long impid)
>  {
> +	u32 cpu_req_errata = 0;
> +
>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
> -	return 0;
> +
> +	if (picoheart_errata_probe_amocasq(stage, archid, impid))
> +		cpu_req_errata |= BIT(ERRATA_PICOHEART_AMOCASQ);
> +
> +	return cpu_req_errata;
>  }
>  
>  void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 662e160b0522..0488b9314c13 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -329,7 +329,23 @@
>  
>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
>  
> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
> +#define system_has_cmpxchg128 system_has_cmpxchg128
> +static __always_inline bool system_has_cmpxchg128(void)
> +{
> +	/* The vendor erratum overrides the standard Zacas alternative. */
> +	asm goto(ALTERNATIVE_2(
> +			"nop",
> +			"j %l[l_yes]",
> +			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
> +			"nop",
> +			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
> +			CONFIG_ERRATA_PICOHEART_AMOCASQ)
> +		: : : : l_yes);

This makes the generic code ugly, adds some maintain effort.
why not discarding "zacas" in the dts? It's much simpler

> +
> +	return false;
> +l_yes:
> +	return true;
> +}
>  
>  union __u128_halves {
>  	u128 full;
> diff --git a/arch/riscv/include/asm/errata_list_vendors.h b/arch/riscv/include/asm/errata_list_vendors.h
> index 8160afed8d21..97b7bbdc4984 100644
> --- a/arch/riscv/include/asm/errata_list_vendors.h
> +++ b/arch/riscv/include/asm/errata_list_vendors.h
> @@ -29,7 +29,8 @@
>  #endif
>  
>  #ifdef CONFIG_ERRATA_PICOHEART
> -#define ERRATA_PICOHEART_NUMBER	0
> +#define ERRATA_PICOHEART_AMOCASQ	0
> +#define ERRATA_PICOHEART_NUMBER		1
>  #endif
>  
>  #endif /* ASM_ERRATA_LIST_VENDORS_H */
> -- 
> 2.54.0 (Apple Git-157)
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
