Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A1AC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 04:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6nxqz31p3n+lB2ki9FvuMIvLIqdddtHMP1y8dSiBac=; b=K4b5GihwKly3VN
	LBQH1H96j8CqwAsZfunpnu0UJ3arIoKX2AXXc7Uzcbyvv/v3sUkg2LsjbcfPqOCYecXiAEI/9rUMl
	8F/KQA32+8AuHXOctK6Uv022MCxvZFhkHO8mv+zl3oFagPC303sp4bSUgCT3ZFDeWeZffsZGEty9L
	X9bHLBB6dFSbmMoogjZTf6wn2gdolj8vglkImezquwe9GKjzSHXuST0GFkH97NToZL4H3Sp7PFPJm
	+NDSbMu5Y1oSzT03zdpeXREti7qpi/dQoosAnvhFxzDFa6r/Y0395wlkK76B/pBvjNvMCUiA0nATG
	bDSKhqx5QW0TH45faqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSoJ-00EiFN-2z;
	Fri, 08 Dec 2023 04:49:59 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSoH-00EiD2-0k
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 04:49:58 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-77f524597c3so4619085a.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 20:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702010995; x=1702615795; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
        b=IfNW0IeAxZiM30hEjZhyBunkZ+JZCC90vA0ddwIAExWzfpM1AS+KYpSxJmH3kJpeyL
         eOVOUzwrQUBWVwq35lfUvyNYbP552uLsZWDfYe1JtLpLjyRE0w1aWY+GlWLkuZb0m70Q
         BNP/Zea7LFB/qfKHE2l+YezIu0rFAVfcg7oOOOKbqNY+gpqzh4U75YF1gp47PoTyybpf
         HIbjqx+SH/QaFspR2Z4py2RAOJ3CjQnxdjEabfAl9wyrEhGTJUsrlHik8V/yprxDqOvY
         sT+CPG/4KsjbnG1GI+HWLhxkUbnw6fMHgPDzb5HYY/0mShgnHl8C4TTtARW1UvA89ZZW
         mQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702010995; x=1702615795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
        b=aD0SoJe5e1r121BJN1XeuxRT3CviRlJWqjsVl2csV7HpGtkYdt+LkhYsomf5Mh9FP0
         s61if5wJdVtYH9/EIWitkfWRj1ffbdKHXvWjOO7ewGCVLmNtZ2TDIj1cE39ayNb8mINi
         OGLWXZ+hYL0oUBT55NvCN5NJBWlq36aDV0aINrYDrX8dj1Vv5NEpG+SzCzhjBAiuyXT0
         E+ijQCoMHFV8uENB1K1B4jtpikMPnjReQ+WMLNkErIFpdP/lqd5+j3c9Pm0DEyx5Tppy
         xpEaLNfltWxp7skmuD7tc1BPoQo6PiMcP0AchDTlw1k7lty44riljBEBn8pYSQSEvmAS
         138w==
X-Gm-Message-State: AOJu0YxgcC14GLT1eL1Orm3VfWxvSVwV2BzgFE9/uH0KAowAbKVTN9ou
	9ZHLI30PgJbSnSDKUnr5MJRBPw==
X-Google-Smtp-Source: AGHT+IFZn6XnJPcvVcVddGixsOUuewR/YlITPthokCfZLM+Gy+wdFy5aCuBE/cobBs7DetgZyfJ9UA==
X-Received: by 2002:a05:620a:1a8a:b0:77f:338c:a713 with SMTP id bl10-20020a05620a1a8a00b0077f338ca713mr2602110qkb.62.1702010994966;
        Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95? ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
        by smtp.gmail.com with ESMTPSA id ov11-20020a05620a628b00b0077f05db2663sm430776qkn.66.2023.12.07.20.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Message-ID: <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
Date: Thu, 7 Dec 2023 22:49:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZV2+f/yu3C6xTVqn@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_204957_265439_5C31319A 
X-CRM114-Status: GOOD (  22.20  )
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

Hi Christoph,

On 2023-11-22 2:40 AM, Christoph Hellwig wrote:
>> -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>> +	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
>> +	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
>> +	select DRM_AMD_DC_FP if RISCV && FPU
>> +	select DRM_AMD_DC_FP if LOONGARCH || X86
> 
> This really is a mess.  Can you add a ARCH_HAS_KERNEL_FPU_SUPPORT
> symbol that all architetures that have it select instead, and them
> make DRM_AMD_DC_FP depend on it?

Yes, I have done this for v2, which I will send shortly.

>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_begin();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>> @@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
>>  
>>  	depth = __this_cpu_dec_return(fpu_recursion_depth);
>>  	if (depth == 0) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_end();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> 
> And then this mess can go away.  We'll need to decide if we want to
> cover all the in-kernel vector support as part of it, which would
> seem reasonable to me, or have a separate generic kernel_vector_begin
> with it's own option.

I think we may want to keep vector separate for performance on architectures
with separate FP and vector register files. For now, I have limited my changes
to FPU support only, which means I have removed VSX/Altivec from here; the
AMDGPU code doesn't need Altivec anyway.

>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index ea7d60f9a9b4..5c8f840ef323 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
>>  dml_rcflags := -msoft-float
>>  endif
>>  
>> +ifdef CONFIG_RISCV
>> +include $(srctree)/arch/riscv/Makefile.isa
>> +# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
>> +dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
>> +endif
>> +
>>  ifdef CONFIG_CC_IS_GCC
>>  ifneq ($(call gcc-min-version, 70100),y)
>>  IS_OLD_GCC = 1
> 
> And this is again not really something we should be doing.
> Instead we need a generic way in Kconfig to enable FPU support
> for an object file or set of, that the arch support can hook
> into.

I've included this in v2 as well.

> Btw, I'm also really worried about folks using the FPU instructions
> outside the kernel_fpu_begin/end windows in general (not directly
> related to the RISC-V support).  Can we have objecttool checks
> for that similar to only allowing the unsafe uaccess in the
> uaccess begin/end pairs?

ARM partially enforces this at compile time: it disallows calling
kernel_neon_begin() inside a translation unit that has NEON enabled. That
doesn't prevent the programmer from calling a FPU-enabled function from outside
a begin/end section, but it does prevent the compiler from generating unexpected
FPU usage behind your back. I implemented this same functionality for RISC-V.

Actually tracking all possibly-FPU-tainted functions and their call sites is
probably possible, but a much larger task.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
