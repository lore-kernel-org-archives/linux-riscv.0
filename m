Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5s2QuknIpr6Wn7fRZSwunyaghe3uM3+L82qpTMi+5g=; b=Ux7abGxQFja0F4
	9Xd2c9ooWS4cJk1ClEZbYG5vr4Dx84ImFrVRnwP267SEi10kILOG3HEP3/s9aD1n+lFmW/D1g/oAQ
	ahF5Id6YWpj6ftRudFhIm0CCtqHslAKVZ/oogLQaiOf9zpN8XsnUN2hI34TIYUw0TjDfvWYXUUthf
	NhO7TaIVOwSyemy/yqkYfVgrLUNMOzy1VoJz3VfzBWTwyDyhnkGcPXS4l+ySgCJcW+DYjZR4l+RsY
	L+gnMCuaRBifxkpx8oCNuEPMQaOlnE+Q+qdzvNNa136/AxzZ8RtEoCHZOQdGHEzANw34ac6EeDkQ1
	7FmRkEOa5d5UKdKfVxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QM5-000gPN-Kf; Wed, 30 Nov 2022 16:54:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QLD-000fyz-H1
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 16:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0298DB81C28;
	Wed, 30 Nov 2022 16:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF236C433D7;
	Wed, 30 Nov 2022 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669827225;
	bh=ToUnQ1W3XCVIcCqmn+koK92eXyWWySOyL71kIR6pues=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jnrLRPXAcMugwoIaiF1aWiyhmtJ/FCL89RIiHrqQfLogsimc5f1vv0WgaEhOTzg2N
	 4RTefYUEOpiGzZLVpziUD4Vynei3qURbaymM0HXenWB3y53RgiXdZvB/1Yw2yzsnfv
	 lCKO/RREJdj9lbAf3bFAj2SfXDdg1wnqebhVkDDXihbOASNRZRriN7j541ahGlwYS0
	 TLM3Bfi7bPRUhxmSrFF3jd2jWUFOCuCRvG44BBmBcKH7E9SocWOOUJFwaLDQnCv8Ki
	 AkMMIa5JuteCW7AP2pYWtmDwI7z9LSCWGccEQHSN5h/0LI+ZEI+GVbVvOohsqE7GGl
	 +F/edJ3YDBtMA==
Date: Wed, 30 Nov 2022 16:53:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 13/13] RISC-V: add zbb support to string functions
Message-ID: <Y4eKlYlUOE2uGaxH@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-14-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-14-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_085347_935374_9C0E7EEB 
X-CRM114-Status: GOOD (  19.58  )
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

On Mon, Nov 28, 2022 at 11:26:32AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add handling for ZBB extension and add support for using it as a
> variant for optimized string functions.
> 
> Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---

> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 4180312d2a70..95e626b7281e 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -24,7 +24,8 @@
>  
>  #define	CPUFEATURE_SVPBMT 0
>  #define	CPUFEATURE_ZICBOM 1
> -#define	CPUFEATURE_NUMBER 2
> +#define	CPUFEATURE_ZBB 2

I was going to complain that you did not align these but none of the
other "errata" are /shrug

> +#define	CPUFEATURE_NUMBER 3
>  
>  #ifdef __ASSEMBLY__
>  
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..ac5555fd9788 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,7 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_ZBB,

I'll avoid commenting on this for now haha. I've caused enough havoc.

>  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>  

> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index bf9dd6764bad..95d1b8d74342 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -162,6 +162,7 @@ arch_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ba62a4ff5ccd..2ec60794293f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
>  				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
>  				set_bit(*ext - 'a', this_isa);
>  			} else {
> +				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);

This all looks fair, and since I was happy with it matching the
"reference" implementation in the spec doc etc last time & you've
cleaned up the readability bits & bobs:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
