Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AABCD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 11:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbB+722CFak8ajM7Elx6cpGIuF+MHTqRvG6q/F85E64=; b=Bw3P8NJGe7gGUH
	MgOwU/4/Rz1zNXH+mIzlyj42AlPvotCL7HAQ9c+fxzJ7eWWLZdCjRHi1kxZ6b9ABd8iP3kA/k9Jrt
	ADmWQvQXK3pu25CMVyeKZ5s1nI5clNb7+7ldRD1513iCUUaZWvJQWYK3oTIbHFbOJUmznjmSSNJbU
	MgycgYcCikBTNGyODnfsa7+Ssl8I6Z0/+JLcVIadj49zWRp4kDmZ/UkQVXcHj3PjjAXDVLJxmB7TE
	QNEzcomvf+gBT1TcbTQr1c7ioIng1WbuLVWUrLUyBgEEjG3dsvxbIEJAn0Pt5zW5FnaCqUIFvzeF2
	ayceJ4ryKcES4HdnUWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKxA-00000002Joe-0WVF;
	Thu, 04 Apr 2024 11:08:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKx6-00000002JlI-04xt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 11:08:17 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a50f170b7e3so116181666b.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712228893; x=1712833693; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XHYX+6wGVMHeamknM7Pg3k7ckv45aX0Tuc02oE5EGZo=;
        b=mWrstkBfvhJiYQVJ24OUxfiNREz1DqKbVvwQe9NJIQY7UIuyMbLGOzUmPJdmWX3gJB
         rKB3LDoSGDeSFPaAcrPYKVhm7Gcc/bgsVnbj/bgPTZ6r3OtHP1u+MOVOmqKFHhhGBBIm
         yF/LnHEKtrK0hSrtxv1XPc05dObkNl8grB4VRSpUHkCAWlsabSU7ubF/nOaqW02uFOzL
         i071dpqno0gq0Eb3gvMN3DoaE9NASu9GAWRrIEYcLj+S0azZDw/239+0se4BD9XVWQ4i
         x4nR3WBR3Ztc5WlxgE9c7b0GszYxKmJbN0g721usfePfbpXhr3lZ7KPsy0dQ+vGRGopi
         Yb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712228893; x=1712833693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHYX+6wGVMHeamknM7Pg3k7ckv45aX0Tuc02oE5EGZo=;
        b=TTOogVmiZFN4i6pSaY+YSV14eGC858R+7a3/KHwGeqQ1/Qw3r0DNW7AM8o5U4d0tq4
         lOn3dg04lsLW3NzAbPeZh5kXJXnPyJMLVBF9dorobOJQ8CNhMeudE5qW1jcY8U1V6Pb4
         CrWM/sz5bTv3Ijiai+GTAttW0xfDeUWYZ9ofmjjmImg7nlSixE6Oe4SSZzPV1psr5+TG
         RrrMnKdzbB5OsHpP9MBD2G9d7ZKzx4qx2zhjAibCa1z60DpQ+s2603pJYWeiPyqbwxlc
         hNDO3QH0n37OUBTOdzhI0TusdwKj6aWkMiRkF2O6FWHmYCxPUV3cmiyRAkgOGYynJ8p5
         mEcA==
X-Forwarded-Encrypted: i=1; AJvYcCVQoZUepmMDHe5OOApbPCW1UFblZ+lfP2hPjta6sqefOriYj7FIIFBUCIbcX1a0v1FsAzbw42SCpH2xSh2jTWRvcH0keBy3B/84N4kEgi30
X-Gm-Message-State: AOJu0YxMbjKYDyIA4BTnq+cphO7aaGCM/mpStwO78ky1/SekETmuVTtM
	6AQ4mcLlcd62PPzcyxr75chzEWWjqgVBCxvxLkI0OQdkTxoS1pBSMN1drpRM5AM=
X-Google-Smtp-Source: AGHT+IEwWasdhwJaS9vUXUMAlSdyN0d8CLHZIu2tQiTvCmJ1aDUIwnQzoZygayQdRyXB/log4Zvjmw==
X-Received: by 2002:a17:906:a02:b0:a4e:2d69:e379 with SMTP id w2-20020a1709060a0200b00a4e2d69e379mr1481920ejf.4.1712228893383;
        Thu, 04 Apr 2024 04:08:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id xh12-20020a170906da8c00b00a4e579ce949sm6017903ejb.51.2024.04.04.04.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 04:08:12 -0700 (PDT)
Date: Thu, 4 Apr 2024 13:08:11 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Ajay Kaher <akaher@vmware.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <amakhalov@vmware.com>, 
	Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Will Deacon <will@kernel.org>, x86@kernel.org
Subject: Re: [PATCH v5 04/22] drivers/perf: riscv: Use BIT macro for shifting
 operations
Message-ID: <20240404-9a84f2090d00f6b994e1de7c@orel>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
 <20240403080452.1007601-5-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403080452.1007601-5-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_040816_103554_C539A308 
X-CRM114-Status: GOOD (  18.13  )
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

On Wed, Apr 03, 2024 at 01:04:33AM -0700, Atish Patra wrote:
> It is a good practice to use BIT() instead of (1UL << x).

(1UL << x) isn't generally a problem. The problem is with (1 << x).

> Replace the current usages with BIT().
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 20 ++++++++++----------
>  drivers/perf/riscv_pmu_sbi.c |  2 +-
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index ef8311dafb91..4afa2cd01bae 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -233,20 +233,20 @@ enum sbi_pmu_ctr_type {
>  #define SBI_PMU_EVENT_IDX_INVALID 0xFFFFFFFF
>  
>  /* Flags defined for config matching function */
> -#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
> -#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
> -#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
> -#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
> -#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
> -#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
> -#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
> -#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
> +#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
> +#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
> +#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
> +#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
> +#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
> +#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
> +#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
> +#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
>  
>  /* Flags defined for counter start function */
> -#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
> +#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
>  
>  /* Flags defined for counter stop function */
> -#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> +#define SBI_PMU_STOP_FLAG_RESET BIT(0)
>  
>  enum sbi_ext_dbcn_fid {
>  	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index babf1b9a4dbe..a83ae82301e3 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -386,7 +386,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>  			cmask = 1;
>  		} else if (event->attr.config == PERF_COUNT_HW_INSTRUCTIONS) {
>  			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
> -			cmask = 1UL << (CSR_INSTRET - CSR_CYCLE);
> +			cmask = BIT(CSR_INSTRET - CSR_CYCLE);
>  		}
>  	}
>  
> -- 
> 2.34.1
>

Other than the commit message,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
