Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01BAEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hn1rvS+hkyUAq9y3h1T2tTVyoSrrSWvjcfzpYDll0sQ=; b=URF0J5hPjko4u0n42wizrVDrfK
	fEyzV8c5OgKsxlq5oaWHrHghH4+MF8gxazyk2KMPTAQdL/9T4g0qiQwObSXI45iESCauWli3kk22N
	oxgOEsdJh1nmDkeuUPgxvX7+PJ35sPfTpUZSsG0B428wyBzvSmZnDiRJiTXVOBNBV8zOHZZ508/iT
	xwwZ5ua/TOnAgEJ0hRHzWrlm3wMyBXq4ESEcrJEalo6kYVZyV/u2hyfv9Hn6fShS4LB1HprETBnt7
	H6lhsmHEG5wvGB43zjGUAgWy2yiAc7DNM6c22C0Bbk9utMxDN+qts0CF18Y6rbmTD87Dc6Ymax/s9
	XMpBvY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEz0b-002Cm9-2S;
	Thu, 29 Jun 2023 21:16:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEz0X-002Ckz-0W
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 21:16:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666edfc50deso746200b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688073412; x=1690665412;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hF59tCLB3i2ZSoqiIO+QZt0MgqaxDzN1p9jJHZT4o+s=;
        b=uJs9KJk6RGq0HhR7GKju0z6egwb7wxB+esjqPBd+t9q0Idj2H4/W5fcpz5BalQjpxb
         kJ/1ZJoq78fN1zsmRVQakK08c6JSVIFi9IdPT8U9EYVYWx/bmp9ZcYyXRhjkpA8XpEsw
         fX21run5W6Pzcmk6qFlVwzRm1K1g+ISxCzH+aP1X4KhTpL+wupXPV0OlS2CaQhd+rc7E
         7yllj4OqVWMyeK7TIX6qAE6iXs4aoNSPIkC5P5O66+L3289HbOXDpx0Ex9+I6MEFwtFm
         Xp+2xmsbqmk5sEdsau03wGoii0c9R99HvqxpL9zVRBBkpuhqoGp03Izjy0eVwIYdGuWj
         Mxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688073412; x=1690665412;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hF59tCLB3i2ZSoqiIO+QZt0MgqaxDzN1p9jJHZT4o+s=;
        b=WfPuaIdFo+cIM/Wz30NVZu0Atpy4h9g3fm2XOKxOZNFYPoKI+si8YUURfF9CAyhDUY
         ZbHqYC0ROk98J5EHMLcehi+dTEEKnKl7QOtePN3Epgyyct7gE4/r34MdXQolGzmRjeXS
         cjxsNfnCaMjeTg50qAUjqrLIstC1VEnhIYPuxA2IPNMzPE/ijW9x4knCHUN72kgQ0jfN
         OdwXZBUpLCxE9Qngq++Jv5QrgceVK+1x0zzcvzqApCgSgwdg/+rfstqvcuMVNYDbWUSJ
         XL/FlISeaCZCD1LKagL4Vy0yuXpv4cq0QZGWmalWIMNK5lEt4PXVKDcGKrExrdTAhycR
         /D9A==
X-Gm-Message-State: AC+VfDyWnDq5wgbkt8MRu1Vt2CKHY2LOde5wca+jFOInlSQq5zXscWnF
	Vg7hR8cH7DSaMH+BO+ZS3/MKxw==
X-Google-Smtp-Source: ACHHUZ7Auq8rFwwTGtUSvrhxsKs6/7bdYvH4fWA7K/VE+Y1vOb62kTbTAFbRXyz4qwl5TBhNqJoUYQ==
X-Received: by 2002:a05:6a00:1388:b0:668:93e7:6800 with SMTP id t8-20020a056a00138800b0066893e76800mr7718754pfg.14.1688073411489;
        Thu, 29 Jun 2023 14:16:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a17-20020a62e211000000b0066ccb8e8024sm8411714pfi.30.2023.06.29.14.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 14:16:49 -0700 (PDT)
Date: Thu, 29 Jun 2023 14:16:49 -0700 (PDT)
X-Google-Original-Date: Thu, 29 Jun 2023 14:16:07 PDT (-0700)
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable parsing "riscv,isa"
In-Reply-To: <20230629-landed-popsicle-ab46ab3b46d9@spud>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-f060b5c8-aa99-4952-b1e1-ee85a92e6b07@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_141653_450558_71A93862 
X-CRM114-Status: GOOD (  62.61  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, Evan Green <evan@rivosinc.com>, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 29 Jun 2023 13:20:55 PDT (-0700), Conor Dooley wrote:
> On Thu, Jun 29, 2023 at 03:53:08PM +0200, Andrew Jones wrote:
>> On Thu, Jun 29, 2023 at 12:39:51PM +0100, Conor Dooley wrote:
>> > On Thu, Jun 29, 2023 at 11:31:33AM +0200, Andrew Jones wrote:
>> > > On Thu, Jun 29, 2023 at 09:28:56AM +0100, Conor Dooley wrote:
>> > > > As it says on the tin, provide a Kconfig option to disabling parsing the
>> > > > "riscv,isa" devicetree property. Hide the option behind NONPORTABLE so
>> > > > that only those willing to keep the pieces enable it, and make sure the
>> > > > default kernel contains the fallback code.
>> > > > 
>> > > > Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
>> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> > > > ---
>> > > >  arch/riscv/Kconfig             | 16 ++++++++++++++++
>> > > >  arch/riscv/kernel/cpu.c        |  3 +++
>> > > >  arch/riscv/kernel/cpufeature.c |  2 +-
>> > > >  3 files changed, 20 insertions(+), 1 deletion(-)
>> > > > 
>> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > > > index 1d39efe2b940..0e1909ac5947 100644
>> > > > --- a/arch/riscv/Kconfig
>> > > > +++ b/arch/riscv/Kconfig
>> > > > @@ -291,6 +291,22 @@ config NONPORTABLE
>> > > >  
>> > > >  	  If unsure, say N.
>> > > >  
>> > > > +config NO_RISCV_ISA_FALLBACK
>> > > > +	bool "Permit falling back to parsing riscv,isa for extension support"
>> > > > +	depends on NONPORTABLE
>> > > > +	help
>> > > > +	  Parsing the "riscv,isa" devicetree property has been deprecated and
>> > > > +	  replaced by a list of explicitly defined strings. For compatibility
>> > > > +	  with existing platforms, the kernel will fall back to parsing the
>> > > > +	  "riscv,isa" property if the replacements are not found.
>> > > > +
>> > > > +	  Selecting Y here will result in a kernel without this fallback, and
>> > > > +	  will not work on platforms where the devicetree does not contain the
>> > > > +	  replacement 	  properties of "riscv,isa-base" and
>> > >                      ^ spacing issue
>> > 
>> > Huh, weird. Given the tab followed by spaces, it must have snuck in
>> > during reflow of the text after some rewording.
>> > Wonder how I missed it, given that...

I sometimes end up with these when reflowing in vim, the Kconfig help 
text indent confuses things (though many things confuse whatever vim 
reflowing I'm using, so I should probably find something better).

>> > > Should we also have a kernel command line option, 'isa_fallback', where
>> > > without this config the command line option is not necessary to fallback,
>> > > but, with this config, no fallback will be done unless 'isa_fallback' is
>> > > provided?
>> > 
>> > I don't know, maybe I have the wrong end of the stick but it feels a bit
>> > premature for something that may never not be hidden behind NONPORTABLE?
>> > Perhaps that could be left for a point in time where the default value
>> > of the symbol changes, or the dependency on NONPORTABLE is removed?
>> > 

I agree it might not be worth the work, but looks like that's done...

>> With the command line option, we could consider dropping NONPORTABLE (but
>> still default off this config). What I'm thinking is that if we want to
>> encourage the adoption of the new format, then there should be a bit of
>> pain when it's not used, but not enough pain to risk rebellion. So,
>> 
>>  * defconfig builds will silently/painlessly fallback
>> 
>>  * builds that want to encourage adoption enable this config and will
>>    fail to boot when they don't get what they want and don't have the
>>    command line option
>> 
>>  * users still working through the growing pains can manage when
>>    the boot fails, and when it doesn't, with the command line
>
> So, something like the following squashed in? I inverted the config
> option, seemed more natural that way.
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d910fba25f2c..6c0d0bc06048 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5437,6 +5437,13 @@
>  			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>  			CPUs.
>  
> +	riscv_isa_fallback [RISCV]
> +			Fall back to detecting extension support using the
> +			"riscv,isa" property on devicetree systems when the
> +			replacement properties are not found, on kernels where
> +			RISCV_ISA_FALLBACK is not enabled. See the Kconfig entry
> +			for RISCV_ISA_FALLBACK.
> +
>  	ro		[KNL] Mount root device read-only on boot
>  
>  	rodata=		[KNL]
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0370713ad965..a9a473b67182 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -291,22 +291,6 @@ config NONPORTABLE
>  
>  	  If unsure, say N.
>  
> -config NO_RISCV_ISA_FALLBACK
> -	bool "Permit falling back to parsing riscv,isa for extension support"
> -	depends on NONPORTABLE
> -	help
> -	  Parsing the "riscv,isa" devicetree property has been deprecated and
> -	  replaced by a list of explicitly defined strings. For compatibility
> -	  with existing platforms, the kernel will fall back to parsing the
> -	  "riscv,isa" property if the replacements are not found.
> -
> -	  Selecting Y here will result in a kernel without this fallback, and
> -	  will not work on platforms where the devicetree does not contain the
> -	  replacement properties of "riscv,isa-base" and "riscv,isa-extensions".
> -	  Please see the dt-binding, located at
> -	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
> -	  on the replacement properties.
> -
>  choice
>  	prompt "Base ISA"
>  	default ARCH_RV64I
> @@ -857,6 +841,24 @@ config XIP_PHYS_ADDR
>  	  be linked for and stored to.  This address is dependent on your
>  	  own flash usage.
>  
> +config RISCV_ISA_FALLBACK
> +	bool "Permit falling back to parsing riscv,isa for extension support by default"
> +	default y

I think the only risk here is that randconfig will result in systems 
that don't boot, but we're already stuck with no meaningful base 
requirements.  Fixing that is a way bigger hurdle than this, so IMO it's 
fine.

> +	help
> +	  Parsing the "riscv,isa" devicetree property has been deprecated and
> +	  replaced by a list of explicitly defined strings. For compatibility
> +	  with existing platforms, the kernel will fall back to parsing the
> +	  "riscv,isa" property if the replacements are not found.
> +
> +	  Selecting N here will result in a kernel that does not use the
> +	  fallback, unless the commandline "riscv_isa_fallback" parameter is
> +	  present.
> +
> +	  Please see the dt-binding, located at
> +	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
> +	  on the replacement properties of "riscv,isa-base" and
> +	  "riscv,isa-extensions".
> +
>  endmenu # "Boot options"
>  
>  config BUILTIN_DTB
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e3cda14a486b..52fa607a1691 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@ struct riscv_isa_ext_data {
>  
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>  extern const size_t riscv_isa_ext_count;
> +extern bool riscv_isa_fallback_cmdline;
>
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 86a1d98b8b3b..1e4cbdedc7fc 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -81,7 +81,7 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  	return 0;
>  
>  old_interface:
> -	if (IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK))
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) && !riscv_isa_fallback_cmdline)
>  		return -ENODEV;
>  
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f6fb18d2af84..5d848b7c1dde 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -471,6 +471,14 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  	return 0;
>  }
>  
> +bool __initdata riscv_isa_fallback_cmdline = false;
> +static int __init riscv_isa_fallback_setup(char *__unused)

Maybe it's better to support =true and =false here?  Not sure it 
matters, we're already down a rabbit hole ;)

> +{
> +	riscv_isa_fallback_cmdline = true;
> +	return 1;
> +}
> +early_param("riscv_isa_fallback", riscv_isa_fallback_setup);

IMO it's cleaner to just set the default based on the Kconfig, that way 
there's only one thing to check.  We're already duplicating the "check 
both Kconfig and cmdline" logic twice, there's probably going to be 
others eventually.

> +
>  void __init riscv_fill_hwcap(void)
>  {
>  	char print_str[NUM_ALPHA_EXTS + 1];
> @@ -490,7 +498,7 @@ void __init riscv_fill_hwcap(void)
>  	} else {
>  		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
>  
> -		if (ret && !IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK)) {
> +		if (ret && (IS_ENABLED(CONFIG_RISCV_ISA_FALLBACK) || riscv_isa_fallback_cmdline)) {
>  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
>  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  		}

I haven't read the whole patch set, but at least having a nice error for 
why probing didn't happen seems like the right way to go here.  IIUC 
this is just silent when ISA string fallbacks are disabled and the new 
properties aren't there.

Sorry in advance if it's just somewhere outside the diff, though.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
