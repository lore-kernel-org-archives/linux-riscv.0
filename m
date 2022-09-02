Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E9ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 01:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAar+U0r/UfUB2cuc/LoK4YoKPGVC1xenX7Lgb3nBhM=; b=HABJ+MYvqmqBZI
	qcAv8d0BafqzBfUqqDySZnYc8xrWUOymCOTXS1arI6/npX1ajomQZ6RNv6wfBUPbQOb62sE9TiWmY
	qlZgFPSB/395eyEoG05dwoXWIBdt4HV7aS/BYqQInkH2jwf9ZA7C4q4c5rNCLf5+ZoYf3kk11y0xT
	YGMUVU5nu8Sp/8m350kWMuEfn/0KH3gaw1ThUIbnpEST/Wwuk+f94xIA93qAN4Gc11IOJ6sGjLaB3
	Wp1kWi3ASKLhcGHVhqpSv4auCkyFSneKTmfg2uRGEWUl1hFcvil1mXcu5hhHzqcrsuyZPEvW6NJga
	HeSp6xFIk4RHiB/r2LPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv8A-00GNBC-C1; Fri, 02 Sep 2022 01:05:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTv88-00GN8P-4B
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 01:05:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E0A8061AFA
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E927AC43141
	for <linux-riscv@lists.infradead.org>; Fri,  2 Sep 2022 01:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662080753;
	bh=9NLQPiptMzTPurM9RAlpc0jk2uNe5aQArXXHZJ8RuZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OE65Ri7nXEIsLWxcOd3TvvNE2wg+05deylUEsf6XX5ZCqKg2t6eieplUE8UVcMZq9
	 Nw2fTdwDoZ2Wzrz6gHZQpG+mvnYwR0cYyQYES3THCXXFea23r72IPxZRZ63Uvv83yN
	 jTlq3A2jUh1V3SXGe51ijOffURVRQT+oQLMkt7YHaqr0YIXISGm4TLP97H2Hx0IxQO
	 LM49RSJHBcSM4MLxzdUv/BXENYWn0A8j44iNRAdH7s0+Un8cU13/Iz6ZhTxFTmocB/
	 dVMbrv9ZWRnY+kxJq1oDmjCC6ehchnw3GuvXJvUMe+PsmY8G5OfypZ0EbxPx1bSW0E
	 INSXJLAkT8EpA==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-11f34610d4aso1365761fac.9
        for <linux-riscv@lists.infradead.org>; Thu, 01 Sep 2022 18:05:53 -0700 (PDT)
X-Gm-Message-State: ACgBeo0hgHlhnuAZa9VsHE9dVcuwuC0GcSS/NS2IcBXaIE7QaQf+2cJW
	q1oVfmdJsa12tUqNYce3FWpKtSYtYv4u6sMjVmw=
X-Google-Smtp-Source: AA6agR5ETddg8O9I7UdZfSOUYIc86bV/VgE2MIq6v6DQVgWsrzc6vzpZxaqAUeSF//QoVPL846Ap9/agx772SpoKZBc=
X-Received: by 2002:a05:6808:150f:b0:343:3202:91cf with SMTP id
 u15-20020a056808150f00b00343320291cfmr888181oiw.112.1662080752840; Thu, 01
 Sep 2022 18:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220901222744.2210215-1-heiko@sntech.de> <20220901222744.2210215-2-heiko@sntech.de>
In-Reply-To: <20220901222744.2210215-2-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 2 Sep 2022 09:05:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTdVsoZqn_yRx7VpnjQ+hNvWyVG14KzYToBA+Z1EsOz_g@mail.gmail.com>
Message-ID: <CAJF2gTTdVsoZqn_yRx7VpnjQ+hNvWyVG14KzYToBA+Z1EsOz_g@mail.gmail.com>
Subject: Re: [PATCH 2/4] riscv: drop some idefs from CMO initialization
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, apatel@ventanamicro.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_180556_285569_DBDF4B8B 
X-CRM114-Status: GOOD (  21.98  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Fri, Sep 2, 2022 at 6:28 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Wrapping things in #ifdefs makes the code harder to read
> while we also have IS_ENABLED() macros to do this in regular code
> and the extension detection is not _that_ runtime critical.
>
> So define a stub for riscv_noncoherent_supported() in the
> non-CONFIG_RISCV_DMA_NONCOHERENT case and move the code to
> us IS_ENABLED.
>
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c    |  7 +++----
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/kernel/cpufeature.c      | 22 +++++++++-------------
>  3 files changed, 14 insertions(+), 17 deletions(-)
>
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index 202c83f677b2..bffa711aaf64 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -30,7 +30,9 @@ static bool errata_probe_pbmt(unsigned int stage,
>  static bool errata_probe_cmo(unsigned int stage,
>                              unsigned long arch_id, unsigned long impid)
>  {
> -#ifdef CONFIG_ERRATA_THEAD_CMO
> +       if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
> +               return false;
> +
>         if (arch_id != 0 || impid != 0)
>                 return false;
>
> @@ -39,9 +41,6 @@ static bool errata_probe_cmo(unsigned int stage,
>
>         riscv_noncoherent_supported();
>         return true;
> -#else
> -       return false;
> -#endif
>  }
>
>  static u32 thead_errata_probe(unsigned int stage,
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a60acaecfeda..4363d0beb38a 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -50,6 +50,8 @@ static inline void riscv_init_cbom_blocksize(void) { }
>
>  #ifdef CONFIG_RISCV_DMA_NONCOHERENT
>  void riscv_noncoherent_supported(void);
> +#else
> +static inline void riscv_noncoherent_supported(void) {}
>  #endif
>
>  /*
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 764ea220161f..729f7a218093 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -264,21 +264,17 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
>
>  static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>  {
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -       switch (stage) {
> -       case RISCV_ALTERNATIVES_EARLY_BOOT:
> +       if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
> +               return false;
> +
> +       if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +               return false;
> +
> +       if (!riscv_isa_extension_available(NULL, ZICBOM))
>                 return false;
> -       default:
> -               if (riscv_isa_extension_available(NULL, ZICBOM)) {
> -                       riscv_noncoherent_supported();
> -                       return true;
> -               } else {
> -                       return false;
> -               }
> -       }
> -#endif
>
> -       return false;
> +       riscv_noncoherent_supported();
> +       return true;
>  }
>
>  /*
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
