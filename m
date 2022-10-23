Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6333BC3A59D
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 19:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l4Sor8CEzR+G7bPW6mCBE+ARR3qCBZWas9jn5LDAmE=; b=buFY4v2dgjHZ/I
	PM4TX/d9Doa3LDQErVlMMwINunn7M38oESo01hsk1R/ftb+h+RV5rHVdCDKfyKMhRuzHMUKwtdWKi
	VamVjxEM/AyduVfiANIWRFyy8Sn2QiIurEyWRJ/UQ0OdR9Q3WsWYY0oBoxzTieS8Jey5FBKpd7tlX
	uM9dcjpp1UI58/jU6cs762mOp+O9XzXf6fzGwYhGtkgA9Tky+DtTKRt/LFpwz09JgAZ/9UQ6WcNSq
	VkoOKc3/1lJrtfhr5EvYOtwVaA7L8Gy2/9hm7lolp/bDyPBiWF0NC35A98/AtMl63M9Lexn5fcPgi
	nN38+MB47dCNoV5+OlxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgiN-00G6Aq-8y; Sun, 23 Oct 2022 19:32:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omgiK-00G69j-0x
	for linux-riscv@lists.infradead.org; Sun, 23 Oct 2022 19:32:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F3B5EB80C03;
	Sun, 23 Oct 2022 19:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C74C433D6;
	Sun, 23 Oct 2022 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666553562;
	bh=Lyhyvdo0p6lHqxqilsvy4+1IKGNoioBAzKYNpye+CTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RkCHkkfnJdXFwHyB0nh+uYh8tCBIn15XEoAZx8aXFI0euJ/Qk8lhuZ++t50GZ/Llc
	 nfvvskORWEPeUrkwrOJYuaiwO/6SqELGbJVeSH4FqEU3pDaswHJFoJd9YQ1VslaR+f
	 jw5NjMqWP051T70iHC9nhm7quuGugO54UNZ6F20hj4FbStMII4T915A8Ulz+ao/yP3
	 EcjO1T5K0eSwpX7ASDajMJ9HAISj8paMBLuwPvABKeLD9NqOeKbNNSMfVdE1te8Vp/
	 yaOq9TAJV71wLvzIO65cbE1YDfNjiAEWEygWQ6hY+5WhhG6ieplhCJ5NFUY/k3dZHT
	 ZY0byjc63jkuw==
Date: Sun, 23 Oct 2022 20:32:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 2/3] RISC-V: Introduce riscv_isa_extension_check
Message-ID: <Y1WW1v5T6IYSGN6G@spud>
References: <20221021105905.206385-1-ajones@ventanamicro.com>
 <20221021105905.206385-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021105905.206385-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_123252_385694_F4008215 
X-CRM114-Status: GOOD (  27.07  )
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

On Fri, Oct 21, 2022 at 12:59:04PM +0200, Andrew Jones wrote:
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

Aye, agreed. Could be pretty nasty chasing down something like this...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> No functional change intended, as the function is only introduced
> and always returns true. A later patch will provide checks for an
> isa extension.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
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
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
