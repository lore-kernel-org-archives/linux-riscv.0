Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35391C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 01:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJcs2EPF4mqTVoJCSiM/1ZW1vIVgqiSVBdmr4gss6eY=; b=aRD0kD6h1tWtsA
	E87JehzpPoG77F8Z3GgQl0BM7SfH7AAloF6GJPr7IIbwqzKQANSC2XP0xyVe2Nxi1Ur4YQILMxzGQ
	Rio9txDFUdph24NeqHNf8/5fZ6e5FFeE6RIeWWlvowWoDk8EwgRndregJ66yyArHWB3APlsYv3nva
	VgnEC+/KKGDdc4STVNSD/W88UNZGmbxor6imnJdsizynujLCTtcm4QjUufvxbW6aimOPxwptJWdgF
	tFwqi6ip2eQ40n3IFNGjIxPAw7+CDQd9egFOnauOTasTR8n3r10Tw2bhmNC7lq8C09g/oofxhjAvI
	opis5Oe/7WsvHm9AKyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDa8P-00GOCD-1A;
	Thu, 14 Dec 2023 01:03:29 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDa8K-00GO9s-1w
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 01:03:27 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-77f552d4179so350543985a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 17:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702515802; x=1703120602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kotqopmhql9RPm3S4FTj2FqpufLgCsxyuc5LZys4ifw=;
        b=NOmN/e67M5YWDqdN8NbgGLzVN07hclNUjGQCDjJKJ6+CtMuHH1LNNMMJ9BfvXgSHUD
         JWqUZ/LWR3K72ui6x7PKgNZLgSFFDexrBsjdgBaS9NieZJ2/btf9zvS4lD5wl5bqJOUo
         1xhSeWwOH9zrpxaP2CBa/cxcv3ZfVR0N5s71Gl1cPbMF+jXFwCiCqSWxfkjnS3KsvTgu
         OjIU/1PrnBm5lsOSgsyQcrqW7sRDKrpEY2eYkIWfiORj5r7+qLe3m7HEMd3He2hoHA2u
         6Td5u7vkcmuU8d1M+LtGVpSKQHoO5yvYJk1Bk5fweBa5VlegAVYmh1yyx2FiwOcDCf0y
         bZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702515802; x=1703120602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kotqopmhql9RPm3S4FTj2FqpufLgCsxyuc5LZys4ifw=;
        b=j0w5TM35sGx5cL8tkc/xULiHjPD6vr3dvQp75xjhknUB/DRNSiLoSUI+07oJZX5Qtd
         z8V/QiZm7ct/pLHhtk8GjQIDFMU5qoIx0Ga/oHcdGKpe/GcktRMIXUP07TT+68E+p694
         QivJafaLUKX2kNwNJFGhFcAur+Opn1ChRpuyyNbpF6pT7TgVpYk6AyVnH5t5GFgcf91F
         IGIjfVVtgUXwDx3Ks55iIEQEAxUjtMS5vRjrxl5CYL6iAl1JJwn7AgHYgUsKI71mYLVI
         glVUV/blYMkT3DsPXWvlG8Z9vgEWGVQjj7w4YnqdC1IMA+4ANM0N0cM5fOIopiuzxTLY
         Yygg==
X-Gm-Message-State: AOJu0Yy4c2rMaBbJ1Ot8xOQjrYjofdTNOaRh8cRmr0sPKgW512KNY0xK
	0w3eAo4Cul6LmTEBunmGQ9ducQ==
X-Google-Smtp-Source: AGHT+IFjYn4/wlSclY9FQAk7x1h05GKodk6C3zlVMTJ3BbOMNQ8WP5BrWLxO1hQ2sob52mgNqAJxdQ==
X-Received: by 2002:a05:620a:1034:b0:77f:2734:4c5d with SMTP id a20-20020a05620a103400b0077f27344c5dmr9834012qkk.130.1702515801849;
        Wed, 13 Dec 2023 17:03:21 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:a1d1:dd74:a6de:fdf? ([2600:1700:2000:b002:a1d1:dd74:a6de:fdf])
        by smtp.gmail.com with ESMTPSA id ul9-20020a05620a6d0900b0077f0d3bac3bsm4896980qkn.76.2023.12.13.17.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 17:03:21 -0800 (PST)
Message-ID: <7ed20fcf-8a9d-40d5-b913-b5d2da443cd6@sifive.com>
Date: Wed, 13 Dec 2023 19:03:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/12] drm/amd/display: Use
 ARCH_HAS_KERNEL_FPU_SUPPORT
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-11-samuel.holland@sifive.com>
 <87h6kpdj20.fsf@mail.lhotse>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87h6kpdj20.fsf@mail.lhotse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_170324_709587_4B95C0B9 
X-CRM114-Status: GOOD (  24.63  )
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

On 2023-12-11 6:23 AM, Michael Ellerman wrote:
> Hi Samuel,
> 
> Thanks for trying to clean all this up.
> 
> One problem below.
> 
> Samuel Holland <samuel.holland@sifive.com> writes:
>> Now that all previously-supported architectures select
>> ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
>> of the existing list of architectures. It can also take advantage of the
>> common kernel-mode FPU API and method of adjusting CFLAGS.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ...
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> index 4ae4720535a5..b64f917174ca 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
>> @@ -87,20 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
>>  	WARN_ON_ONCE(!in_task());
>>  	preempt_disable();
>>  	depth = __this_cpu_inc_return(fpu_recursion_depth);
>> -
>>  	if (depth == 1) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +		BUG_ON(!kernel_fpu_available());
>>  		kernel_fpu_begin();
>> -#elif defined(CONFIG_PPC64)
>> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>> -			enable_kernel_vsx();
>> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
>> -			enable_kernel_altivec();
>  
> Note altivec.
> 
>> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>> -			enable_kernel_fp();
>> -#elif defined(CONFIG_ARM64)
>> -		kernel_neon_begin();
>> -#endif
>>  	}
>>  
>>  	TRACE_DCN_FPU(true, function_name, line, depth);
>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index ea7d60f9a9b4..5aad0f572ba3 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -25,40 +25,8 @@
>>  # It provides the general basic services required by other DAL
>>  # subcomponents.
>>  
>> -ifdef CONFIG_X86
>> -dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
>> -dml_ccflags := $(dml_ccflags-y) -msse
>> -endif
>> -
>> -ifdef CONFIG_PPC64
>> -dml_ccflags := -mhard-float -maltivec
>> -endif
> 
> And altivec is enabled in the flags there.
> 
> That doesn't match your implementation for powerpc in patch 7, which
> only deals with float.
> 
> I suspect the AMD driver actually doesn't need altivec enabled, but I
> don't know that for sure. It compiles without it, but I don't have a GPU
> to actually test. I've added Timothy on Cc who added the support for
> powerpc to the driver originally, hopefully he has a test system.

I tested this series on a POWER9 system with an AMD Radeon RX 6400 GPU (which
requires this FPU code to initialize), and got functioning graphics output.

> Anyway if that's true that it doesn't need altivec we should probably do
> a lead-up patch that drops altivec from the AMD driver explicitly, eg.
> as below.

That makes sense to me. Do you want to provide your Signed-off-by so I can send
this patch with your authorship?

Regards,
Samuel

> cheers
> 
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> index 4ae4720535a5..0de16796466b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
> @@ -92,11 +92,7 @@ void dc_fpu_begin(const char *function_name, const int line)
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>  		kernel_fpu_begin();
>  #elif defined(CONFIG_PPC64)
> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> -			enable_kernel_vsx();
> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
> -			enable_kernel_altivec();
> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
> +		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>  			enable_kernel_fp();
>  #elif defined(CONFIG_ARM64)
>  		kernel_neon_begin();
> @@ -125,11 +121,7 @@ void dc_fpu_end(const char *function_name, const int line)
>  #if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>  		kernel_fpu_end();
>  #elif defined(CONFIG_PPC64)
> -		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> -			disable_kernel_vsx();
> -		else if (cpu_has_feature(CPU_FTR_ALTIVEC_COMP))
> -			disable_kernel_altivec();
> -		else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
> +		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
>  			disable_kernel_fp();
>  #elif defined(CONFIG_ARM64)
>  		kernel_neon_end();
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index 6042a5a6a44f..554c39024a40 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -31,7 +31,7 @@ dml_ccflags := $(dml_ccflags-y) -msse
>  endif
>  
>  ifdef CONFIG_PPC64
> -dml_ccflags := -mhard-float -maltivec
> +dml_ccflags := -mhard-float
>  endif
>  
>  ifdef CONFIG_ARM64
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index acff3449b8d7..7b51364084b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -30,7 +30,7 @@ dml2_ccflags := $(dml2_ccflags-y) -msse
>  endif
>  
>  ifdef CONFIG_PPC64
> -dml2_ccflags := -mhard-float -maltivec
> +dml2_ccflags := -mhard-float
>  endif
>  
>  ifdef CONFIG_ARM64


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
