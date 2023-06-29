Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A78EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNU7XPdSYwLcPgd1EDir7Mt6ZsqoPPCboDtTDCeA8MU=; b=MY9BGI29BwPIPR
	SC7yup4VMfqgqWPz1hi8Ix315TRutEEjlyGWGIoxoORy9S9ij4EETq8kYu+HSLsNHoPS08xphoXd+
	rylKcqpKvYqkPdXetm1YCdSB/B2lbTI8RsBNaFwhj/HFYGjn/UuKqASnqzxZu6y3jRoKDmM37Yu3j
	/MGQwX2yHoExBiXolH2qJP9kWNkm9uI5/Og/xxEuLyEzwjDT+Qhuad1C6jFxxti362qqQ5MTID+9w
	HAOEL0a3WegWrKEgqJkolVd3a7wOrGDdUJm3TKd7hc6E+uvkJkObq2Niw6R8GUiurzcyOMgUz+47W
	RDg0OKqqhcJMcTpquBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEo04-000a4y-1o;
	Thu, 29 Jun 2023 09:31:40 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEo01-000a4E-2V
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 09:31:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb960b7c9dso724052e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688031095; x=1690623095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajD4Xlmgnwv8O+jtu7HYaXxwVa4EBrrrsttRRo2IsCo=;
        b=S6CoM+QL+IrLFXgIDSFYfgP3xref1Lw3zrAa+ruoTEOTjEaeaWuoTi/yED9tjbOX3e
         WPy4uhNOuQ/FNXaRj8aD0G3pH+8qlO8D4BxuYAa4lGpwdcf6eftfPCG2ANJ7sdFMv4kV
         NjVwHbhrtAJVyuyZ6UtzcDQEYkrtRwFgHZJUI8GaBcf3os1KN5dYL6QD2xr5mcK6mkY/
         SYXwzjIiHG7dgcHXiVmE0eqmwaXbKdm9KjwnCZS+otS/r8deZFL7rxvIoPhgnLRIdzhE
         z/1HTz7KLstyepnVUfFEUHJ39fR2O1TkMdm/bfO0XjWzVpm1xIjslxTdUBlh/u1r2iC0
         Z2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688031095; x=1690623095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajD4Xlmgnwv8O+jtu7HYaXxwVa4EBrrrsttRRo2IsCo=;
        b=WqyaIPQIootQHFebybZ7oW6HR2wR4dvq9jdmpVsJKr7iFwSpQ7yvJj4fycNgm8dWlO
         9ehW4jeyDs2HFA2MpLxMFoXAe28lqPdWcvLmMr9DJW1uK1ce/iWfzPuvJJeE/LqzbWHB
         sVT8GCVUo+eUmBgIBqGTcZYs71slSaVW9Py8ZgwVSyUcoFeAP5pe14+OmM64i1Sw+v9w
         /6cwanebBGaw8IPcxts1d3aK21Ep4+kTe/gDzhLruuzaSWkSTSR+csnkRU8O5fPX3Lsc
         Q4BMkdxLWqj7k21DZDr+irK7whGyEHZBmVwQm1QO8kv3gn762o2Dt6KSYXeextjY82V/
         uzkQ==
X-Gm-Message-State: ABy/qLYyObZRzIhrPp/fFOZP2GQ7CnDhI3FujVuFPc8RJ//03OT5nAqh
	Q17Y6FBIKunvlmTj2ust6tBORA==
X-Google-Smtp-Source: APBJJlEt3kWDaGO7D0zrrowbl1KaWdBGX6mWiQYWM1fItOdFeb3Rv6MrTumN9H7oxc+mij9WFVhxNA==
X-Received: by 2002:a05:6512:2355:b0:4fb:97d9:382b with SMTP id p21-20020a056512235500b004fb97d9382bmr1730502lfu.60.1688031094662;
        Thu, 29 Jun 2023 02:31:34 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b003f733c1129fsm7205674wmc.33.2023.06.29.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 02:31:34 -0700 (PDT)
Date: Thu, 29 Jun 2023 11:31:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230629-a80f112e6ed4158080867694@orel>
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
 <20230629-resilient-grievance-d782163b09d6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629-resilient-grievance-d782163b09d6@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_023137_839029_50166BA3 
X-CRM114-Status: GOOD (  28.73  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 29, 2023 at 09:28:56AM +0100, Conor Dooley wrote:
> As it says on the tin, provide a Kconfig option to disabling parsing the
> "riscv,isa" devicetree property. Hide the option behind NONPORTABLE so
> that only those willing to keep the pieces enable it, and make sure the
> default kernel contains the fallback code.
> 
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig             | 16 ++++++++++++++++
>  arch/riscv/kernel/cpu.c        |  3 +++
>  arch/riscv/kernel/cpufeature.c |  2 +-
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1d39efe2b940..0e1909ac5947 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -291,6 +291,22 @@ config NONPORTABLE
>  
>  	  If unsure, say N.
>  
> +config NO_RISCV_ISA_FALLBACK
> +	bool "Permit falling back to parsing riscv,isa for extension support"
> +	depends on NONPORTABLE
> +	help
> +	  Parsing the "riscv,isa" devicetree property has been deprecated and
> +	  replaced by a list of explicitly defined strings. For compatibility
> +	  with existing platforms, the kernel will fall back to parsing the
> +	  "riscv,isa" property if the replacements are not found.
> +
> +	  Selecting Y here will result in a kernel without this fallback, and
> +	  will not work on platforms where the devicetree does not contain the
> +	  replacement 	  properties of "riscv,isa-base" and
                     ^ spacing issue

> +	  "riscv,isa-extensions". Please see the dt-binding, located at
> +	  Documentation/devicetree/bindings/riscv/extensions.yaml for details
> +	  on the replacement properties.
> +
>  choice
>  	prompt "Base ISA"
>  	default ARCH_RV64I
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 9a4f4a23afcd..86a1d98b8b3b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -81,6 +81,9 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  	return 0;
>  
>  old_interface:
> +	if (IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK))
> +		return -ENODEV;
> +
>  	if (of_property_read_string(node, "riscv,isa", &isa)) {
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
>  			*hart);
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 2c4503fa984f..f6fb18d2af84 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -490,7 +490,7 @@ void __init riscv_fill_hwcap(void)
>  	} else {
>  		int ret = riscv_fill_hwcap_from_ext_list(isa2hwcap);
>  
> -		if (ret) {
> +		if (ret && !IS_ENABLED(CONFIG_NO_RISCV_ISA_FALLBACK)) {
>  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
>  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
>  		}
> -- 
> 2.40.1
>

Should we also have a kernel command line option, 'isa_fallback', where
without this config the command line option is not necessary to fallback,
but, with this config, no fallback will be done unless 'isa_fallback' is
provided?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
