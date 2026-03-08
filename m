Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B68AEA853C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjozfWjWzs7AMjs+4RGfS5ABlKK8TE+poOxwYUFtKcg=; b=vmIxdv0CjRce2l
	VJYj/+MsjC1BGxK8SD2sBYdalcq7JUFPtnoRYYcvU42x966bRPBDeX62KpZoc1OZCTW4WzgGEba2J
	QCOKc4YlKe2WBHopj4Y+VgupQ3z+iOANFnTtL3fdaimV8W3ACFx0JUYQ8gzaUsc41XT4/WU8ktu2V
	XMvRIlkWs5LIIZ0c05jbnl0p/5174Of9s/7N7MXQWRk6X39mfTrYeqHWEe4lqf/VWOlUmLloLjg4Q
	pV5fYw+APu+mYe1SLVSM8Dx0GYpvz7Nz7NRz7qJmLY1T+XFJlWYNeclKef38mKUmz4F9H8yVhKUt3
	vSeyqIrO7Aw/37nNppGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIjn-00000006Fk6-18nb;
	Sun, 08 Mar 2026 18:20:23 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzIjk-00000006Fjl-1JRv
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 18:20:21 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-798527f822cso107469237b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Mar 2026 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772994019; x=1773598819; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebNKnkiCdgWGG7d84Dx/mjbwarrbx79g9Rc6LzAJfuU=;
        b=cujPuUnGOHfkf/6UJ1kC0YUum36t2jktJ+aO2s+6v5fT6RGh/a1AVzPj4rI2P08oyH
         EPhLQko9m3hVRRUVtG+HW/5riSrKjClyDgtAOO11MvDctjnx4gR7Cg81c0yDQUKd8WOF
         ocsdfzBBewnIRzBxwYlzl4L5daVY7ACoztRb3mDyJBotnC/i/JQIJjaejdJvQXzgFLqc
         1Pp+ZK+jEiqy5GL9FwvI0vs4LhR0RV5AKmHJbh/AvVMZZork+T3YaU6a1wNI5xA8NgM2
         kTpTHl2o60JrvuqN1FUrt/o91M7JYNpynlxfER7MGU9ca//MzUUS+5MqoD5R1dgPq6K2
         B50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772994019; x=1773598819;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebNKnkiCdgWGG7d84Dx/mjbwarrbx79g9Rc6LzAJfuU=;
        b=c4++bkWtKyPXfzcNCPegMx6RwphMKPWNupoavXvTvL7c52x2tdMSL1lRUbdIflqdj1
         pbTmjP4kXk8T8XiZfaTGKH1bs8N+FItGBlUGlZBajrRyEQMJlDexbfcRFG5TW6iqWt8e
         m6j/Dv5O4OxUuBG6K9FsS4zuuQsYwCq8lT5XTmgC2o6la359Wb9cmE4cy//eu+YyAv1U
         1NmlRlvpaqIMYESSf3fub13+lNChUocLj+UMyv8adh12Fv0tsORc75kajf+u2+9hoQyn
         kWFHWj71+UXtFPqF7/EAmrY8ut/rvCJL2zmrYxk5jimsGADxlUB0B39Lnu5pNA4uiFTn
         psUw==
X-Forwarded-Encrypted: i=1; AJvYcCVppK6dbn3d5B3hierYShQoxuUcuEASSKN2N9atXdqsU6gveLu1qLph9T+msaTBelzq3+yPBA2iBczkoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydGEE9dPDRdc2Q1BG0qQxYtZdlzgWy4DDi7zUmpPLrJY7jrD9T
	JRaEG977LA16sc+YBx2o2eiqJIADojvaYUt53md1EAsR+k2B3JUv2DIoM1qfmO5/ews=
X-Gm-Gg: ATEYQzwxsX1LmihyH1hwBKAUavSAScLSh4JryCW9kWpVM0TKU5SINa3cqh56p5w83Rd
	EKyu7K3cUvc/eQZOYBWVVTdJbB46nQ9QvG+jWgJ5A8it7GcOzaQkCN6gBLPvJoQ1VwihMxN28lH
	wcKLbqOor43CNdd+STI7yj8FhFlVJ9S2UjCv2HY6uQ/rcZWdBlfWjHcDkwIn/Eg2yOYXp4rA3Nf
	h708blWEV15NczG1K8i5l0dDZxRJAPX+xhlU/uEoJO1ZM+6Za2vfcKFaaHUb5Kyz24RmUdWdjDq
	q2c3i8GwSB5ZkKbJO8cAMhsUTwstrJsIv8nPFr+PYIZ+o1x2bVdjYh+W4LCYxOJYwkQCmITWeXD
	mZEEZmuWywm86bVVd9ICTK4GFx5O1gdYS9QNjbkoNfAIO89KFmMDpOQ7SZMxMd5UIrC7YxKUrNR
	5ayZIRVKeSgI1qV/G3rDnrSSbdk9MzZ0xa9ALDL0zX
X-Received: by 2002:a05:690c:6902:b0:798:d9a3:e723 with SMTP id 00721157ae682-798dd7433acmr81222947b3.49.1772994018987;
        Sun, 08 Mar 2026 11:20:18 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dec8de45sm35617467b3.9.2026.03.08.11.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 11:20:18 -0700 (PDT)
Message-ID: <f1b541f4-6d34-4080-b322-f097c4e2f48d@sifive.com>
Date: Sun, 8 Mar 2026 13:20:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: cpufeature: Add ISA extension parsing for
 Supm
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Evan Green <evan@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260125-supm-ext-id-v2-0-1e3b9714c860@riscstar.com>
 <20260125-supm-ext-id-v2-2-1e3b9714c860@riscstar.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260125-supm-ext-id-v2-2-1e3b9714c860@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_112020_404356_6216FC8B 
X-CRM114-Status: GOOD (  28.52  )
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

Hi Guodong,

On 2026-01-24 7:36 PM, Guodong Xu wrote:
> Supm has been ratified in the RISC-V Pointer Masking specification
> (Version 1.0, 10/2024) and is mandated in RVA23 Profiles (Version 1.0,
> 2024-10-17) for RVA23U64. Supm indicates userspace pointer masking
> support.
> 
> Remove the previous macro aliasing of Supm to Ssnpm/Smnpm in hwcap.h,
> treating Supm as a distinct RISC-V ISA extension ID.
> 
> Add ISA parsing logic for Supm, and implement a validator to ensure
> that Supm is only reported as available if Kconfig allows it and the
> underlying Ssnpm (for supervisor mode) or Smnpm (for machine mode)
> extension is present. Supm relies on Ssnpm or Smnpm to provide the
> underlying hardware implementation.
> 
> With this change, "supm" will be reported (when available) in
> /proc/cpuinfo as part of the "isa" and "hart isa" string.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/#r [1]
> Link: https://lore.kernel.org/all/4ebbe14b-2579-4ba6-808d-d50c24641d04@sifive.com/#r [2]
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: Add Reviewed-by from Conor.
>     Update RISCV_ISA_EXT_SUPM id to solve rebase conflict.
> ---
>  arch/riscv/include/asm/hwcap.h |  3 +--
>  arch/riscv/kernel/cpufeature.c | 35 +++++++++++++++++++++++++++++++++--
>  2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 7ef8e5f55c8d..aa2af21f3bd3 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -112,6 +112,7 @@
>  #define RISCV_ISA_EXT_ZCLSD		103
>  #define RISCV_ISA_EXT_ZICFILP		104
>  #define RISCV_ISA_EXT_ZICFISS		105
> +#define RISCV_ISA_EXT_SUPM		106
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> @@ -120,10 +121,8 @@
>  
>  #ifdef CONFIG_RISCV_M_MODE
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
> -#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
>  #else
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
> -#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
>  #endif
>  
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1734f9a4c2fd..e1f7ad882289 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -317,6 +317,27 @@ static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
>  	return 0;
>  }
>  
> +static int riscv_ext_supm_validate(const struct riscv_isa_ext_data *data,
> +				   const unsigned long *isa_bitmap)
> +{
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
> +		return -EINVAL;
> +
> +	/*
> +	 * Supm requires Ssnpm for S-mode or Smnpm for M-mode to provide
> +	 * pointer masking for the U-mode execution environment.
> +	 */
> +	if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
> +		if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SMNPM))
> +			return 0;
> +	} else {
> +		if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSNPM))
> +			return 0;
> +	}
> +
> +	return -EPROBE_DEFER;
> +}
> +
>  static const unsigned int riscv_a_exts[] = {
>  	RISCV_ISA_EXT_ZAAMO,
>  	RISCV_ISA_EXT_ZALRSC,
> @@ -450,6 +471,15 @@ static const unsigned int riscv_c_exts[] = {
>  	RISCV_ISA_EXT_ZCD,
>  };
>  
> +/*
> + * Smnpm and Ssnpm provide pointer masking for the next lower privilege mode
> + * (U-mode), thus enabling Supm. Both extensions imply the same subset.

If Linux is running in S-mode, then Smnpm does _not_ imply Supm. So this list
cannot be shared between Ssnpm and Smnpm. (When running Linux in M-mode, I think
we assume S-mode isn't supported, so the opposite case isn't possible. If you do
run M-mode Linux on M/S/U hardware, I think there are other things that explode
spectacularly, since we will touch for example the wrong envcfg register.)

> + */
> +static const unsigned int riscv_supm_exts[] = {
> +	RISCV_ISA_EXT_XLINUXENVCFG,
> +	RISCV_ISA_EXT_SUPM
> +};
> +
>  /*
>   * The canonical order of ISA extension names in the ISA string is defined in
>   * chapter 27 of the unprivileged specification.
> @@ -577,12 +607,13 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
> -	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
> +	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> -	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
> +	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(supm, RISCV_ISA_EXT_SUPM, riscv_ext_supm_validate),

I don't think this quite matches what we want either. We don't want to accept
Supm from the devicetree at all, so it shouldn't be in this array (just like
Xlinuxenvcfg is not in this array). You'll need new code in riscv_resolve_isa()
(or its callers) to set the RISCV_ISA_EXT_SUPM bit under the right conditions.

Regards,
Samuel

>  	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
>  	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
