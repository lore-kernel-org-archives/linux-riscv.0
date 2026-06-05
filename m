Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE854CD6E5D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tekr+oWaB63cKHaiKnkbvKm1rbYQiegJey0ODk7jcic=; b=goScxtWHNs3DMk
	SixJ0pO32PnnMt/xki/O0+j9UHD6KMGBkDDPPnzNPf2ay2yO0pCtxWHu8xj6fVQhWziLgAd2qECIf
	yoSrL4tz3uBNQzcXE7d1iFHEylUiFVgnr7vLGqnW7WgTgrXwo9xHZqZfxM+xTPFgQp5Rk6C+5Boz+
	iQ86m6To1aK8Mr7oMvKGlwn2ZLNo1gXwjisFB1tQL/UXbMfCgn76f7PDZzGRoaMpstfFhfWQ9Vw0j
	lgp1oJ9AfC7pzX+8es+C+fGBeId3iPsBXey8UbF8cmhn8gotUrKWCDi9v4FHsD4giAwvPv/7ZqT+J
	2+tlmJuCddWQZ5SA/qIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSy9-00000000Z9W-2gMx;
	Fri, 05 Jun 2026 11:44:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSy6-00000000Z9A-2xKK
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 11:44:08 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8423f52af13so1291013b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659846; x=1781264646; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gMNKh8FX3BpICK82C0IcgqwADrmONDwFxBNWibd71SU=;
        b=J3Zb7Vcfv8bX449B32HBW3PBDih1R/Abo2zJGhHoptaHTS3UDOqOW6Pv1d7yRvw42M
         dqr7JKg96YH7ZgnKITUX8QI0bLeKG5BOEsNNJLqJPZRJ745Df5CuRXI6cDpu4jVTdC+7
         vf0E+SfMqRknJj5izcyg0z9OR3TlpxnFbYYlsA86yMzVvualkRtvaA4AaHuGLLxK/KBs
         7HCsZN27T541e3LhXbDS2ulP8x41/0Ldv+UeYrEFJgY3QsmZRaW0qAMbvL/Dv39tpdIK
         JbM+fRo0w5HtB1Pj/H0l7ML0EVhhXuo0rhmU0DEcQw9KYnDzsLG3Tjk3M/98tN8pSYiP
         7trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659846; x=1781264646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMNKh8FX3BpICK82C0IcgqwADrmONDwFxBNWibd71SU=;
        b=NqWkEMBZNeX6fZ6C5SZ3JUxoSLOK5Ld4ohFQqkkTtT95vJe0cst1XSU/tF0DwFr2WH
         rxMj9YXmC9enW5PZKkPhP0RlzYvJ2q3YmehXAVYFcQkDrQfOqxFr7F8Wh1vvmZANcl95
         XsZQC04HPXOLwJUz/I/eil5tfXi2LnENeg5eWcrlcQ5rGIwXjnBYttAEUFZnfyc2Ly/X
         taChd+G/Ey8CHYEKgz4KL/cTMyky8p3OAZZBeoxZqscY8ePANpHaFUf0wfeeSeUq47aA
         eR5gFI3KsicPx9XndejTpXmqM6T7r3hV9LrHzSlVfc1ALd2RDsIRXQQHGhH4zIbpCwc/
         Dbcg==
X-Forwarded-Encrypted: i=1; AFNElJ/JlDpKrMxqYYYpFOLXttiP2nlSfPPl0NqGHtJ+kVGPd0Rfya3ro6J1e6DzJu6jX8DidPOzfS2SGHGlYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIUGDinyN6h8nfkQWre6aOpx5B4QyW8D1iist9v4H/DE8SfUQl
	rnZWCJdgMd2Siygao1euv+jmgPhtaSyDGHsXUEVvPVRGQNTlpr1Oekc4
X-Gm-Gg: Acq92OGx7m0ypxrELgkMfOVgr+Qpb7pHVFeFrh7Z6cAiZ7xecxyzoetjB5YfuYhe1oa
	FfMgF/j3Z0whaSyIKl+R2meukSi+x7nFhVLHHXkmVyhzq4+KL7dLzlY+SBKZlqkvqPSNTDzEyk9
	MFZia/PXMSCKPT6whfxn8+gPMlLj7hTzqq+uWapgqNa1HJ6/YAFLXL877yIq7kvkyXXE3nvCcRE
	S0It2undctdqFafsyttVMr/GxX4NcMA+eGfku18OvXqUVHWECZrkE11/qRXFTIOrYcME8NNdTDC
	BggaaKANFY6pcLih6SbNaHGlzbdlKhp/KILcRT0dqcBv2jjSDgnT+3upTUGLSWab3Zxkm3BU0Mn
	6xDIPR3GKza9rXcU/vjOlx+0PSMtTWZbC4+foOFYzjD4hpymoRk6x+O2B6oqicOopF7xARfztvi
	jxpSCy1Q6iCk53Vjr5vi9C
X-Received: by 2002:a05:6a00:ab8b:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-842b0e95864mr2991555b3a.20.1780659845679;
        Fri, 05 Jun 2026 04:44:05 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm10866367b3a.36.2026.06.05.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:44:05 -0700 (PDT)
Date: Fri, 5 Jun 2026 19:44:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org, 
	pasha.tatashin@soleen.com, andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com, 
	debug@rivosinc.com, baolin.wang@linux.alibaba.com, zhangchunyan@iscas.ac.cn, 
	apopple@nvidia.com, namcao@linutronix.de, wangruikang@iscas.ac.cn, 
	apatel@ventanamicro.com, liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, 
	cleger@rivosinc.com, charlie@rivosinc.com, hui.wang@canonical.com, 
	guodong@riscstar.com, pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v2 1/2] riscv: track effective hardware PTE A/D updates
Message-ID: <aiK2WPERUEvVMZqY@inochi.infowork>
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522142358.87589-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_044406_753013_1C090DC3 
X-CRM114-Status: GOOD (  29.97  )
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

On Fri, May 22, 2026 at 10:23:57PM +0800, Yunhui Cui wrote:
> Track the effective hardware PTE A/D update mode separately from
> Svadu capability discovery. When both Svade and Svadu are present,
> enable SBI FWFT PTE A/D hardware updating on each online CPU via
> CPUHP and use the resulting runtime state for arch_has_hw_pte_young().
> Fall back to software-managed A/D updates if enabling hardware updates
> fails.
> 
> When Svadu is present without Svade, assume hardware PTE A/D updating
> is enabled from boot, and document that boot-time behavior in the DT
> binding.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml |  6 +-
>  arch/riscv/include/asm/cpufeature.h           |  6 ++
>  arch/riscv/include/asm/pgtable.h              |  8 +--
>  arch/riscv/kernel/cpufeature.c                | 58 +++++++++++++++++--
>  4 files changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb214..b09888e9988de 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -294,10 +294,10 @@ properties:
>                 of the PTE A/D bits or page faults when they need updated.
>              2) Only Svade present in DT => Supervisor must assume Svade to be
>                 always enabled.
> -            3) Only Svadu present in DT => Supervisor must assume Svadu to be
> -               always enabled.
> +            3) Only Svadu present in DT => Supervisor must assume Svadu is
> +               enabled at boot.
>              4) Both Svade and Svadu present in DT => Supervisor must assume
> -               Svadu turned-off at boot time. To use Svadu, supervisor must
> +               Svadu is disabled at boot time. To use Svadu, supervisor must
>                 explicitly enable it using the SBI FWFT extension.
>  
>          - const: svadu
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..ad9fad6eee55d 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>  extern const size_t riscv_isa_ext_count;
>  extern bool riscv_isa_fallback;
> +DECLARE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
> +

I think a EXPORT_SYMBOL is required, otherwise the kvm is failed to be
built as module.

Regards,
Inochi


> +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
> +{
> +	return static_branch_unlikely(&riscv_hw_pte_ad_updating);
> +}
>  
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index a1a7c6520a095..20663a466cf6c 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  #define pgprot_dmacoherent pgprot_writecombine
>  
>  /*
> - * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> - * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> - * DT.
> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
> + * need to be set. The core MM code only cares whether hardware updating of
> + * the accessed/dirty state is currently active.
>   */
>  #define arch_has_hw_pte_young arch_has_hw_pte_young
>  static inline bool arch_has_hw_pte_young(void)
>  {
> -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +	return riscv_has_hw_pte_ad_updating();
>  }
>  
>  /*
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f46aa5602d74d..831dd6a7c1a06 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,7 @@
>  static bool any_cpu_has_zicboz;
>  static bool any_cpu_has_zicbop;
>  static bool any_cpu_has_zicbom;
> +DEFINE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -287,15 +288,60 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
>  	return -EPROBE_DEFER;
>  }
>  
> -static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
> -				    const unsigned long *isa_bitmap)
> +static void riscv_set_hw_pte_ad_updating(void)
> +{
> +	static_branch_enable(&riscv_hw_pte_ad_updating);
> +}
> +
> +static int riscv_hw_pte_ad_updating_starting(unsigned int cpu)
> +{
> +	int ret;
> +
> +	ret = sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
> +	if (ret) {
> +		if (ret != -EOPNOTSUPP)
> +			pr_err("CPU%u failed to enable hardware PTE A/D updating: %d\n",
> +			       cpu, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init riscv_hw_pte_ad_updating_init(void)
>  {
> -	/* SVADE has already been detected, use SVADE only */
> -	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
> -		return -EOPNOTSUPP;
> +	bool has_svade, has_svadu;
> +	int state;
>  
> +	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> +	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +
> +	if (!has_svadu)
> +		return 0;
> +
> +	if (!has_svade)
> +		goto enable;
> +
> +	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				  "riscv/pte-ad:starting",
> +				  riscv_hw_pte_ad_updating_starting,
> +				  NULL);
> +	if (state < 0) {
> +		pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
> +			state);
> +		return 0;
> +	}
> +
> +	/*
> +	 * A successful CPUHP_AP_ONLINE_DYN registration means the startup
> +	 * callback has already succeeded on all online CPUs.
> +	 */
> +enable:
> +	riscv_set_hw_pte_ad_updating();
> +	pr_debug("riscv: hardware PTE A/D updating enabled\n");
>  	return 0;
>  }
> +arch_initcall(riscv_hw_pte_ad_updating_init);
>  
>  static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
>  				const unsigned long *isa_bitmap)
> @@ -584,7 +630,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
> -	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> -- 
> 2.39.5
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
