Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2096EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7/fde5C2YPTWSRP4Le6wqGlhik75tIaw4DpFmrR480=; b=cuh/dbU7Jamf7w
	1lIZk4yY+48uwqjkesIaQNKIpwQdr2UJOkAZ2KTuKehUtvC/GvQRCAn9y9nILj2nvMz02FvBmWX4r
	ocqnVeFhZyLu5sYX4uuUCe6CuOminV0K3tbBTMfH/DPpBLbBeriwiDqp6KUt3f0kNchH/GyCkoKBd
	Da2yi87LfQ0CsdYxWkfVkIXUtlxARKix89rpHJN+vyAkwxbYQLGcE8mqCw3We+K+iNxQFHwWGL3YX
	fORIDYZ2Qcyf4mWJQFhWeViUYLI6l67uBeuXupDbwSNtjVVliJjSV2rRJNBK3bok+QkCjeDhHJrjX
	RzVXdP/84rhfZjLZ39aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp0j-00AdzE-0G;
	Mon, 26 Jun 2023 16:24:17 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDp0f-00Adyd-1g
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:24:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98e25fa6f5bso312537666b.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687796652; x=1690388652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6E3UmB0Xi/qXW41cURjsiNGhcMzRCNjnl7kad4wxhM=;
        b=ayeq224af98Jx+LrP3eLJUWZj9TMhgYYJma26yREUHV/piGkeZoBT34wR7JHVj32AN
         EqjDPzPDoVWxxrU94wNliHobVwNZFaOY6GgPRbO45xnUS4mFRg0a9B1GWpYqcqr/XM/L
         4J0GucrMdq4Us5x1aqYlN6A26GGOQwWCRkB6BWu5yM6tIAf6piigL0acPO2xkeXjnCfK
         CWGidXt5c2cDOsSRDHL37wKtDvBqQLs/oZ9v+SYn8zZFpAJEd6i3jPYKTVioK4kbaaNv
         /R1Gpiqhk1nIEQiLr/Nr2mh6R+dy80Fm5RzNJT4ech7iz1MyhDSJq7QaB8jgL+vP6b1F
         SUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687796652; x=1690388652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6E3UmB0Xi/qXW41cURjsiNGhcMzRCNjnl7kad4wxhM=;
        b=CZBUfPnUcEBQd+S9suC3zWz74fb3uT92ju0zbaTSxWp4E8ukMWnuIewlFn4mbO7jdU
         hnS41f9GXGO/A+Do/we8YUoOV34LEluOe91hWnhgWdC3NSXKyj1yd2KhUtg1jV6FNQBp
         kseKrX1dIAX1ngVKX4qkdvwwbVd1due+Y6P6CNPVsb9zefW7llZowhMou0yuEXxldvj6
         ZpF9/WFrzV11lk5HGxDnDqfo/IlW9kVEAssMUBR2mXT/7PyYUP6XZreYJsBtJAeehmje
         QLW+OI2Ntb8Z1vjxTL17m5UuyLlDviNjpv/COPGK0F2nvM7KrCGZg5NxjczWO6Ri0fX6
         zXJg==
X-Gm-Message-State: AC+VfDzV2TIUs+hG7KM57L/claFEw3Bb7yfPNbmEfsdQEvYPn89QE3Z6
	lHsWqhKMEuJsZAv85WIferVNGw==
X-Google-Smtp-Source: ACHHUZ41eOYZp1TH49I6A9aYgNs+yMw+J+TafTqXSN2v/oTUhy5q8B5rXl0iGQILTxaoHl4ejeM8CQ==
X-Received: by 2002:a17:907:9449:b0:988:b58d:5e0 with SMTP id dl9-20020a170907944900b00988b58d05e0mr18664489ejc.16.1687796651679;
        Mon, 26 Jun 2023 09:24:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bu5-20020a170906a14500b0096f6a131b9fsm3456504ejb.23.2023.06.26.09.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:24:11 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:24:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 8/9] RISC-V: enable extension detection from new
 properties
Message-ID: <20230626-5dca67a91d6c1b29c51c6169@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-unfasten-guidance-eac4d71d8876@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-unfasten-guidance-eac4d71d8876@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_092413_579684_0B01B1D2 
X-CRM114-Status: GOOD (  31.02  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 12:19:46PM +0100, Conor Dooley wrote:
> Add support for parsing the new riscv,isa-extensions property in
> riscv_fill_hwcap(), by means of a new "property" member of the
> riscv_isa_ext_data struct. For now, this shadows the name of the
> extension, however this may not be the case for all extensions.
> For the sake of backwards compatibility, fall back to the old scheme
> if the new properties are not detected. For now, just inform, rather
> than warn, when that happens.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Naming things is hard, didn't know what to call the new function...

riscv_fill_hwcap_from_isa_extensions() ?

_new() won't age well.

> ---
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c | 80 ++++++++++++++++++++++++++++++----
>  2 files changed, 72 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 6ad896dc4342..e7f235868aa2 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -77,6 +77,7 @@ unsigned long riscv_get_elf_hwcap(void);
>  struct riscv_isa_ext_data {
>  	const unsigned int id;
>  	const char *name;
> +	const char *property;
>  	const bool multi_letter;
>  };
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 366477ba1eea..72eb757ad871 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -101,6 +101,7 @@ static bool riscv_isa_extension_check(int id)
>  
>  #define __RISCV_ISA_EXT_DATA(_name, _id, _multi) {	\
>  	.name = #_name,					\
> +	.property = #_name,				\
>  	.id = _id,					\
>  	.multi_letter = _multi,				\
>  }
> @@ -416,16 +417,66 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
>  		acpi_put_table((struct acpi_table_header *)rhct);
>  }
>  
> +static int __init riscv_fill_hwcap_new(unsigned long *isa2hwcap)
> +{
> +	unsigned int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		unsigned long this_hwcap = 0;
> +		struct device_node *cpu_node;
> +		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +
> +		cpu_node = of_cpu_device_node_get(cpu);
> +		if (!cpu_node) {
> +			pr_warn("Unable to find cpu node\n");
> +			continue;
> +		}
> +
> +		if (!of_property_present(cpu_node, "riscv,isa-extensions"))
> +			continue;
> +
> +		for (int i = 0; i < riscv_isa_ext_count; i++) {
> +			if (of_property_match_string(cpu_node, "riscv,isa-extensions",
> +						     riscv_isa_ext[i].name) < 0)
> +				continue;
> +
> +			if (!riscv_isa_extension_check(riscv_isa_ext[i].id))
> +				continue;
> +
> +			if (!riscv_isa_ext[i].multi_letter)
> +				this_hwcap |= isa2hwcap[riscv_isa_ext[i].id];
> +
> +			set_bit(riscv_isa_ext[i].id, this_isa);
> +		}
> +
> +		of_node_put(cpu_node);
> +
> +		/*
> +		 * All "okay" harts should have same isa. Set HWCAP based on
> +		 * common capabilities of every "okay" hart, in case they don't.
> +		 */
> +		if (elf_hwcap)
> +			elf_hwcap &= this_hwcap;
> +		else
> +			elf_hwcap = this_hwcap;
> +
> +		if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> +			bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +		else
> +			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +	}
> +
> +	if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
> +		return -ENOENT;
> +
> +	return 0;
> +}
> +
>  void __init riscv_fill_hwcap(void)
>  {
> -	struct device_node *node;
> -	const char *isa;
>  	char print_str[NUM_ALPHA_EXTS + 1];
> -	int i, j, rc;
>  	unsigned long isa2hwcap[26] = {0};
> -	struct acpi_table_header *rhct;
> -	acpi_status status;
> -	unsigned int cpu;
> +	int i, j;
>  
>  	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
>  	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
> @@ -435,10 +486,21 @@ void __init riscv_fill_hwcap(void)
>  	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
>  	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
>  
> -	riscv_fill_hwcap_from_isa_string(isa2hwcap);
> +	if (!acpi_disabled) {
> +		riscv_fill_hwcap_from_isa_string(isa2hwcap);
> +	} else {
> +		int ret = riscv_fill_hwcap_new(isa2hwcap);
>  
> -	/* We don't support systems with F but without D, so mask those out
> -	 * here. */
> +		if (ret) {
> +			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> +			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> +		}
> +	}
> +
> +	/*
> +	 * We don't support systems with F but without D, so mask those out
> +	 * here.
> +	 */
>  	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
>  		pr_info("This kernel does not support systems with F but not D\n");
>  		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
> -- 
> 2.40.1
>

Other than the name and moving the removal of the unused declarations to
the previous patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
