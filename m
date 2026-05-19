Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704A6CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vEPvvbt6HFsZIR4fBlKnmQ595E6k6hNSeut721SDoA=; b=TStzUQ6eRBU05N
	7RT0/aH4m2DbEY/JoiijbA0Wmo5S8oS8dpFQmdYxbYuTOjzrXyZAEDsNm+HjD7J3j0yFgbiJYAh8+
	3H9/M6oouEOYUv/PmmUnEyU6P9UXNi+Uz2TVll57nmIwtCv0XymDV3730UmdcFyxsoMna61YGyy6Z
	sGopok+1aVSPdjAH/6hSCWfl50rUVAnxDI14E7cIEd6SF6qX+oWjtoWUtrMOGfqhOO3MErb/6/3kU
	xKm9xaDUIpACW6oFyuh+kbPH3TKobWyyS7awwrIV8+LnLIOZaznnt7fKSIdvtE12CphI7iQaMbQUS
	ao2IcwggqeyUG4Xf2LUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOHu-00000002P86-3gl7;
	Tue, 19 May 2026 17:31:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOHs-00000002P7W-3I9W
	for linux-riscv@bombadil.infradead.org;
	Tue, 19 May 2026 17:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+M43gBW8YyjmiDrGj03/O7lQi+1aZT7Iw8k13I+uBgA=; b=TE+sVUN5Xi+E4vGqRcw8yC4bHc
	l+3PfLhn+oyoMaFDVY1Q62gT4vOBr0FNpXzxY9a807iTsJvQ4GNHihj55JieFyF4kfQH8XpIUgXO5
	MMeK8EhABp5za29pWdCSQHyTsHlAwqGHxZT8dR4cqpDuQF+9+tAbAISNhdUFbQ1a1WWnaZMSZgkYR
	1pnYtDr/QXsCHJ1U+FQ1VlqE/z2YFxm4wsgzwAwmOhwymkvMg/VuX787YVbjazzEIkhnJD3oXscxX
	/6okqZ0Iydd9H11pGHdCtSl0f6iPp0fl2L3aVeNhztkI/ZpWR4iGonlBNVPaGSHXK6cfJ0yZTMLVk
	RrH3hNwg==;
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPOHp-0000000EwH6-1Sr2
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 17:31:23 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-479ef2b78f3so3685331b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 10:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779211879; x=1779816679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+M43gBW8YyjmiDrGj03/O7lQi+1aZT7Iw8k13I+uBgA=;
        b=dZFiYlFP+XnlYwvWMwD2+PkFzFS1A1bB8aAttg/2FvmkCRkUNqKBQUzchwoSZL1KoF
         rJJpW1RLt0NF9lKiR+1NrRo4GLVlscHU/0O03pjJHMfUI7oxs1fF2OD5+gSzXpl1dni0
         3wn8T8wT5ml2XMb+PbCp9p09gyGIw4wiXqQtYkrqDbd85sisc6F0rLYeGE5YOi3BhW1Y
         qciZ8+nqx6QlbIfrwk9HOu2/1/+dGnnGlsSU5hDXO0AZBYDtaQkQzcKIiRd1ndvEG4MZ
         +4xKqgE/+ZTTUlogkSqRgMtadkCT/Vg5/A0cvR9CMaFiIDXVx4piMlgffuQEM7moLqL3
         Fakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211879; x=1779816679;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M43gBW8YyjmiDrGj03/O7lQi+1aZT7Iw8k13I+uBgA=;
        b=pa8M5AHo3JWeWwfzMaNh0ObW0WND5WB/GNxJjaTH7vgPNztTih2Nsj39M6QjEAprod
         sr11OFTvhSTrWx6azOs8k+Gn85GRr/DcFEzkFCZA8qwzRb7EWeF6mkw33VXVF6uhMQ8K
         dKYw9C1UuZiFXzS47FvCEHSeOw9IHBtM6ZJsmdv92ZiNFVfORlGbd5EwholG5tUNcv02
         uWMM7jZ0d70QW12Qs+xiB6CN+8RsEgGWV+vxZHAaPSMDmRgm8id5qKXt8ysD7dMBqhoM
         YmKKYYSxY0tKa06W3EOgriA/A8dHlZrH/lY9rICVQvGYymag0Snb/g8l/mryFx+NpMGS
         JLrA==
X-Forwarded-Encrypted: i=1; AFNElJ/nJ39Nkdhr+VEEojOUlxbTAi93iSrFovdBlrzDIrxyFSnscpTOZZ36ZCPq7DOy0G7En3zlPcoXc478ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXpnijg6S1YelDHttBtRF8AMAh+756utAcx4Jw87mPgP22reGS
	qaDBgDKaymzuKyOnAUI1xDV2MGNam5ecFeUL3NU5iPN87o4RwcAwfzqcpqS0lu0aNlE=
X-Gm-Gg: Acq92OHbImL3/+86a75dt8sV5KMWja/9ujdQYWGw1AkKr8YSN+VEGzQPQNWJTDsvff9
	mdj9S8as+gT0+ZnWSArEu+uHscbD8sxl7DSwqIOGRtk0yabciyadllDjpqqN6f5U0jQPlOt9C7+
	U22KWsh+J8CX/+3HQdTyAILqisOHYypy+NEylLtw4HgzuD7OOCTwyfzHEmZGJBt8WIumUsqJuSE
	OM3y8JSBMvW0wAufQuGcdxz9oQOTvdErrNv46nZUpMDR9Fl/OhWo9yhJTtgK7AF27Ux5YTh6baG
	5c4Upc+tTrJI5HizILtfYoEoh87Y8U3+NtW3VEVRZvmehWs+x1kpkZpAkTP3Rr56AzrcMUfKMeR
	Fw9lO5kFlwUyZcJ+lUDGQeUhn/13Q8VjwgmFzJBSRynaU8Ao+ZO1fCMb5rlov0114OtNCoD6OzG
	z3VYtANorsguE1JtFklRHcquG9fpZ1yVe1XDgf8IWcVT/Tig==
X-Received: by 2002:a05:6808:4fc8:b0:479:ead7:2a5a with SMTP id 5614622812f47-482e55ffbc1mr12525763b6e.11.1779211879045;
        Tue, 19 May 2026 10:31:19 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.37.83])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee0999f3sm6870174b6e.0.2026.05.19.10.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 10:31:18 -0700 (PDT)
Message-ID: <59bf4f1e-8d7f-44ff-836b-76b771542e92@sifive.com>
Date: Tue, 19 May 2026 12:31:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: track effective hardware PTE A/D updates
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: Qingwei Hu <qingwei.hu@bytedance.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, pasha.tatashin@soleen.com,
 andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com, debug@rivosinc.com,
 baolin.wang@linux.alibaba.com, zhangchunyan@iscas.ac.cn, apopple@nvidia.com,
 namcao@linutronix.de, wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
 liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com,
 charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com,
 pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260519031927.70683-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_183121_829233_841387AC 
X-CRM114-Status: GOOD (  27.37  )
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

Hi Yunhui,

On 2026-05-18 10:19 PM, Yunhui Cui wrote:
> Separate Svadu capability discovery from the host's effective ADUE
> state. Enable SBI FWFT PTE A/D hardware updating on each online CPU
> through CPUHP when both Svade and Svadu are present, use the resulting
> runtime state for arch_has_hw_pte_young(), and fall back to
> software-managed A/D updates when enabling the feature fails.
> 
> Platforms with Svadu but without Svade are treated as always using
> hardware PTE A/D updates. Expose the runtime state through an inline
> getter so hot MM paths avoid an out-of-line function call.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  arch/riscv/include/asm/cpufeature.h |  6 +++
>  arch/riscv/include/asm/pgtable.h    |  8 ++--
>  arch/riscv/kernel/cpufeature.c      | 73 ++++++++++++++++++++++++++---
>  3 files changed, 77 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..877d71a1ea755 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>  extern const size_t riscv_isa_ext_count;
>  extern bool riscv_isa_fallback;
> +extern bool riscv_hw_pte_ad_updating_enabled;
> +
> +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
> +{
> +	return READ_ONCE(riscv_hw_pte_ad_updating_enabled);
> +}

Should this use a static key, since it's only updated at boot, and you mention
it is used in MM hot paths?

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
> index f46aa5602d74d..e46b2d2b49eed 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,8 @@
>  static bool any_cpu_has_zicboz;
>  static bool any_cpu_has_zicbop;
>  static bool any_cpu_has_zicbom;
> +bool riscv_hw_pte_ad_updating_enabled __read_mostly;
> +EXPORT_SYMBOL_GPL(riscv_hw_pte_ad_updating_enabled);
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -287,15 +289,74 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
>  	return -EPROBE_DEFER;
>  }
>  
> -static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
> -				    const unsigned long *isa_bitmap)
> +static void riscv_set_hw_pte_ad_updating(bool enabled)
> +{
> +	WRITE_ONCE(riscv_hw_pte_ad_updating_enabled, enabled);
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
> +static int riscv_hw_pte_ad_updating_dying(unsigned int cpu)
>  {
> -	/* SVADE has already been detected, use SVADE only */
> -	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
> -		return -EOPNOTSUPP;
> +	int ret;
> +
> +	ret = sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 0, 0);
> +	if (ret)
> +		pr_warn("CPU%u failed to disable hardware PTE A/D updating: %d\n",
> +			cpu, ret);

Why bother disabling the feature when taking a CPU offline? It doesn't create
any problems to leave it enabled.

Regards,
Samuel

> +
> +	return 0;
> +}
>  
> +static int __init riscv_hw_pte_ad_updating_init(void)
> +{
> +	bool has_svade, has_svadu;
> +	int state;
> +
> +	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> +	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +
> +	if (!has_svadu)
> +		return 0;
> +
> +	if (!has_svade) {
> +		riscv_set_hw_pte_ad_updating(true);
> +		pr_info("riscv: hardware PTE A/D updating enabled\n");
> +		return 0;
> +	}
> +
> +	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> +				  "riscv/pte-ad:starting",
> +				  riscv_hw_pte_ad_updating_starting,
> +				  riscv_hw_pte_ad_updating_dying);
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
> +	riscv_set_hw_pte_ad_updating(true);
> +	pr_info("riscv: hardware PTE A/D updating enabled\n");
>  	return 0;
>  }
> +arch_initcall(riscv_hw_pte_ad_updating_init);
>  
>  static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
>  				const unsigned long *isa_bitmap)
> @@ -584,7 +645,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
> -	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
