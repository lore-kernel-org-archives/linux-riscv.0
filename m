Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA88EEEE278
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 01:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyXuSYECSIAEMy9ei5IslCvpTQJYY4KbGUq3hwqiHrY=; b=4stIF9oqKCB/Mi
	VXh5ZxgZzcnuQzeQEjyySorptw9csmxH0MbX7JyiSVsS2VR/OQVRPTDo5EOXFPX6E55EajNoS8E2A
	591Ef8ngvHjGQ/0p0awoPjVDXB5yxQutw81pmyABL71NE/YVVhnh0xSHBCGm6ELHP5Rctw63NHjjZ
	d+3NJOWVM11EHZI6g5apD6AoR5bxG0PIe5oaNv9sLAvFZWqXBD7rZpR8Aaj+cX+aclgHBKcRqkyQr
	TBEgYWMKmzww/puOm2z4P+XzgjaTHCxr8g/eg2AWfalb6rSbBqcIEFdoOOWwe80wuHbFL25XZkxbn
	Mbi/kIvYQFxMT8KEy91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souoP-0000000EdAj-0Sc8;
	Fri, 13 Sep 2024 01:09:25 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souoM-0000000EdA7-1f2q
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 01:09:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2db89fb53f9so1114671a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 18:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726189762; x=1726794562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBOQBRMmgRWLHrkPWadCkqX7dsfwA7uumaxy52Rb4Ds=;
        b=IXiFAv8LLpqsBF3UU5rDoYhu38ybzoOPIda6DPDD+jt7HBkk3zAEkPYuOKThzbOXlb
         qXmPhSwhFwS2fjUuRPCNhqebzxhba+j/ljsEjUiRkyFc+w01Nx6qEy8j7QlWRpIZM0zB
         NJtp8qf1DmjZWBS/D9VbtTL3fFIrTNXotHQeED3e6c/Ru4Iyj8QCY1TGf/rb6iVs1c6/
         fybw661+Rv1xZ4vf12x7BLCS1zWka1ag9LpeSaBZEFpyM39OdHTv6g8wnhxpBNJsW6Sz
         7cxi7R5nQ82liUQmeG9YyLoQfZX29Jk7COBFa4kum7ih3AXnHqmiry0SzKOdvZRAoaUZ
         +O1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726189762; x=1726794562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBOQBRMmgRWLHrkPWadCkqX7dsfwA7uumaxy52Rb4Ds=;
        b=Q8bzKuR3Q7csPU0Dl7U8CJvXtEEPELj5WT9UgZki+Gj0oVny8k96X6nKtGyY5oNiM4
         hmoYrF029Hxtd0OZiqgqy2qAZKWE7D48A4xZJougcC5xenQvXUwslrmzjslqctvPINsg
         s4SU1WL8jLaGsAruQkokkOXZlz9UW6D+OH9gv61Vai6nLj+weAcAWrtjRz3rJb260uks
         fRdnyNPzmBTfjVAI+sW+bPI/lTj5SWhu9UAHPTnIun1b273kfv3Eh2jdQ25XHEOQ46hi
         8JhUZkhnXd7fesloVg+KbNaQ5yaQBipUOmkGLZBhQgq7M3K2jy/Cs4QDuu1/K3sVyWfs
         OSVw==
X-Forwarded-Encrypted: i=1; AJvYcCVx0c+MPyKalWjB4WlmxXdfRGCplDK43AY2H39vw7etbgbmPUrUGMf5GRWDgORbsUWYyW2eH4UtxCktug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmdvKSZteUnx41gXS7d2fyr6GaTKQzHoG3PxzcfqcUhdJfvbPh
	nCLHKMLPkkzqAE6QzMnTsZbTnd7OhbJo8SruEZg9p1tnPY8tu9bhcii265q+erU=
X-Google-Smtp-Source: AGHT+IELZk/pD31FeS3VxS4fCTPtGC6V51tC6EAgDTBFOWR4aTgZsvwcoPf51FPsq0mK7JOIhy2Dkw==
X-Received: by 2002:a17:90a:d507:b0:2d3:b8d6:d041 with SMTP id 98e67ed59e1d1-2dba0064f94mr5074427a91.32.1726189761464;
        Thu, 12 Sep 2024 18:09:21 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9ccc836sm374464a91.25.2024.09.12.18.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:09:20 -0700 (PDT)
Date: Thu, 12 Sep 2024 18:09:18 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>, kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v4 02/10] riscv: Add ISA extension parsing for pointer
 masking
Message-ID: <ZuOQvmjywvvmo4Hd@ghost>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
 <20240829010151.2813377-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240829010151.2813377-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_180922_459133_1DB4D515 
X-CRM114-Status: GOOD (  22.26  )
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

On Wed, Aug 28, 2024 at 06:01:24PM -0700, Samuel Holland wrote:
> The RISC-V Pointer Masking specification defines three extensions:
> Smmpm, Smnpm, and Ssnpm. Add support for parsing each of them. The
> specific extension which provides pointer masking support to userspace
> (Supm) depends on the kernel's privilege mode, so provide a macro to
> abstract this selection.
> 
> Smmpm implies the existence of the mseccfg CSR. As it is the only user
> of this CSR so far, there is no need for an Xlinuxmseccfg extension.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
> 
> (no changes since v3)
> 
> Changes in v3:
>  - Rebase on riscv/for-next (ISA extension list conflicts)
>  - Remove RISCV_ISA_EXT_SxPM, which was not used anywhere
> 
> Changes in v2:
>  - Provide macros for the extension affecting the kernel and userspace
> 
>  arch/riscv/include/asm/hwcap.h | 5 +++++
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5a0bd27fd11a..aff21c6fc9b6 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -92,6 +92,9 @@
>  #define RISCV_ISA_EXT_ZCF		83
>  #define RISCV_ISA_EXT_ZCMOP		84
>  #define RISCV_ISA_EXT_ZAWRS		85
> +#define RISCV_ISA_EXT_SMMPM		86
> +#define RISCV_ISA_EXT_SMNPM		87
> +#define RISCV_ISA_EXT_SSNPM		88
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> @@ -100,8 +103,10 @@
>  
>  #ifdef CONFIG_RISCV_M_MODE
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
> +#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SMNPM
>  #else
>  #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
> +#define RISCV_ISA_EXT_SUPM		RISCV_ISA_EXT_SSNPM
>  #endif
>  
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b3b9735cb19a..ba3dc16e14dc 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -377,9 +377,12 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
>  	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
> +	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
> +	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> -- 
> 2.45.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
