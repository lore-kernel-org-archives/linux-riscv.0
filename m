Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A80CEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26QJDHkEMsFoHau3YyU+xdWQCMQEX0MDVebo4VMakQw=; b=Q+iG5f2kxAkVuc
	RT4nj5twozp4xH+qrW3qiqFtFaDe9S2t0mczngwlaOUPyhwuTUWvqqZVOP7vzfXg6ds+eFkkBcZAx
	2TtF9jVANTVXuRVSsZBwxvcv0mp1CVsQwZpFNoRmnlwDP7EVugzuVq9H6QLi31gbWKVU714xlS3Xo
	F3YrXe6pJvmx6pqL8VlyRdDgjyzI3Gb0yOill0VePijKXXo5ynsy5HGoaPGsuQfTKml/YjOhWEEwC
	2xVx6NBGAyynNaELqGSWwxYwZw9Qw6XumL5DAQboHIfVT6sUlaWi1OQhecll3GTSFwGiZlMvbenmC
	ppMXyun0ApTELqz0yOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGH3I-00AHsD-32;
	Mon, 03 Jul 2023 10:45:04 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGH3F-00AHpa-1h
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:45:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so6606364e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 03:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688381089; x=1690973089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z+WW5kwnxhCfLcQaJmH1xNEQf/PAh/QQcNu6U1wyek=;
        b=N+N/pXD6XQ24ilAe7T36rjHC/kWdO5IdIka8Ch7o4paXsRfixvo4trlwDMllISRt85
         a3+VwQk2dGZrVCJdwKgg+HVppR3UKrY4HBNJrHeTSytI+iOLXzoLda9vU066Y/SFVkDu
         m8f52hOiPvQDpqBrXaKK2Nfa0CNllfHxCjqTXKPeaeAPHCltP2mqeONZ6sTJkKKG1mGR
         mBKveunaZ4YSU+7hY87RwUkvwshjMWXQI7ZyswvDwoNgIDiyY62c/FmwL18KTzRUnxkV
         S1STKcf6JjQn3BR9EaMLVoMqi36Gw9lkJVSsSWdFdbF93Iw/yX56RXvJgq5GpX7n2RQ1
         41fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688381089; x=1690973089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z+WW5kwnxhCfLcQaJmH1xNEQf/PAh/QQcNu6U1wyek=;
        b=ZgMA+YyBeXDnz61UbBZoxQYpHt1BlEpcq2xQCXl//0b15grEwgVlmioQgXDG0IOZj2
         WGinbjHssqYVKSXCIXwy1QZheVWKcqU/P+5mEFnfO6Zz20CRTHJGUphZIvSICeJynh8R
         MKD68Wik8CRYQLR2clfkjMYfqMsgQ3sBbWKvZAfGKZx+/9/ZCzJUBS0MohfTjQ19fqKX
         41++6LSEpmOqqEBkF+ZEswiueAWjlzR+58i2SMjDLzxiB2iowc9up9IccxAD0NvtjzI1
         h9xzbaG4RNKdULtUnJOYvX6Q4d7WSR4+2uGgqliYBjWxD0FuvobMMpv7tVvQVoHSx/K+
         eV+A==
X-Gm-Message-State: ABy/qLZNkFTRCpc2QBC009VDHYVLxJnZCoEneTXC0PjjMbDNDlDCu9a1
	KT6oHi/gHwE1UIxsLY5kZ/xqrw==
X-Google-Smtp-Source: APBJJlF1w7RoN0Uq19CNfqTlvPYcMoyTNYeuTkFT+ge+QXXoqsRGY+amLSuEfhQDxxk/a9Ld1x5OGw==
X-Received: by 2002:a05:6512:3b0c:b0:4fb:8981:f08 with SMTP id f12-20020a0565123b0c00b004fb89810f08mr8023840lfv.43.1688381089517;
        Mon, 03 Jul 2023 03:44:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e5-20020a05600c218500b003fbcdba1a52sm6996330wme.3.2023.07.03.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 03:44:48 -0700 (PDT)
Date: Mon, 3 Jul 2023 12:44:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 11/11] RISC-V: provide Kconfig & commandline options
 to control parsing "riscv,isa"
Message-ID: <20230703-57fe19b069fdacd4d9a82cf1@orel>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-greedy-dividable-251fa2b809ac@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703-greedy-dividable-251fa2b809ac@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_034501_571783_B31BCBC7 
X-CRM114-Status: GOOD (  37.35  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 03, 2023 at 11:28:03AM +0100, Conor Dooley wrote:
> As it says on the tin, provide Kconfig option to control parsing the
> "riscv,isa" devicetree property. If either option is used, the kernel
> will fall back to parsing "riscv,isa", where "riscv,isa-base" and
> "riscv,isa-extensions" are not present.
> The Kconfig options are set up so that the default kernel configuration
> will enable the fallback path, without needing the commandline option.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v3:
> - Invert the Kconfig entry. It's now default y & not hidden by
>   NONPORTABLE, but its entablement will now activate the fallback
> - Add a commandline option to enable the fallback on kernels that do not
>   enable it in Kconfig, as Drew suggested
> - Default the global var to the Kconfig option & override it with the
>   commandline one, rather than have checks for IS_ENABLED() and for the
>   commandline option in riscv_fill_hwcap() &
>   riscv_early_of_processor_hartid()
> ---
>  .../admin-guide/kernel-parameters.txt          |  7 +++++++
>  arch/riscv/Kconfig                             | 18 ++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                 |  1 +
>  arch/riscv/kernel/cpu.c                        |  6 ++++++
>  arch/riscv/kernel/cpufeature.c                 | 14 +++++++++++++-
>  5 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index d910fba25f2c..1bd435f60055 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5437,6 +5437,13 @@
>  			[KNL] Disable ring 3 MONITOR/MWAIT feature on supported
>  			CPUs.
>  
> +	riscv_isa_fallback [RISCV]
> +			When CONFIG_RISCV_ISA_FALLBACK is not enabled, permit
> +			falling back to detecting extension support by parsing
> +			"riscv,isa" property on devicetree systems when the
> +			replacement properties are not found. See the Kconfig
> +			entry for RISCV_ISA_FALLBACK.
> +
>  	ro		[KNL] Mount root device read-only on boot
>  
>  	rodata=		[KNL]
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d39efe2b940..a9a473b67182 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -841,6 +841,24 @@ config XIP_PHYS_ADDR
>  	  be linked for and stored to.  This address is dependent on your
>  	  own flash usage.
>  
> +config RISCV_ISA_FALLBACK
> +	bool "Permit falling back to parsing riscv,isa for extension support by default"
> +	default y
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

nit: It's probably just me, but 'of' twists my brain a bit here. I
think

...the replacement properties, "riscv,isa-base" and "riscv,isa-extensions".

works better (for me).

> +	  "riscv,isa-extensions".
> +
>  endmenu # "Boot options"
>  
>  config BUILTIN_DTB
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index e3cda14a486b..b7b58258f6c7 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -81,6 +81,7 @@ struct riscv_isa_ext_data {
>  
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>  extern const size_t riscv_isa_ext_count;
> +extern bool riscv_isa_fallback;
>  
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 28d5af21f544..1acf3679600d 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -87,6 +87,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  	return 0;
>  
>  old_interface:
> +	if (!riscv_isa_fallback) {
> +		pr_warn("CPU with hartid=%lu is invalid: this kernel does not parse \"riscv,isa\"",
> +			*hart);
> +		return -ENODEV;
> +	}
> +
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
>  			*hart);
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 2c4503fa984f..5945dfc5f806 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -471,6 +471,18 @@ static int __init riscv_fill_hwcap_from_ext_list(unsigned long *isa2hwcap)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_FALLBACK
> +bool __initdata riscv_isa_fallback = true;
> +#else
> +bool __initdata riscv_isa_fallback;
> +static int __init riscv_isa_fallback_setup(char *__unused)
> +{
> +	riscv_isa_fallback = true;
> +	return 1;
> +}
> +early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> +#endif
> +
>  void __init riscv_fill_hwcap(void)
>  {
>  	char print_str[NUM_ALPHA_EXTS + 1];
> @@ -490,7 +502,7 @@ void __init riscv_fill_hwcap(void)
>  	} else {
>  		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
>  
> -		if (ret) {
> +		if (ret && riscv_isa_fallback) {
>  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
>  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  		}
> -- 
> 2.40.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
