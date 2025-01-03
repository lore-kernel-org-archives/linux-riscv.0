Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10E8E77197
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 00:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E333R0sQtP/utPxGsQnqTEAOUNehMQIbndQIo/SgFco=; b=KxXTAUrp4AjOau
	va2ii+FL3DXSXjEPT01dvstRxnZJQ04Wyk4iUzL1jJLOHyofxN4OI3K5SmMHyU94FDY51eXeKnKor
	iIuYcfcTV8gZMZHrAXnYfd13rFvnTIDSdddSlUGOP/UaTIKOssxq+kbBJhdp93eYhLKFseA78aNCp
	f+fCrv1T2eBcjHnKUQrmSFN/59pV+NzYA3lpwHW6oS50c1qDwmUAG7kf0ivisw8QkZcCIhYxUsKG5
	x3yT4UHXf70dHBK30Y4+K6DuEYTr10719AvPv29qb6HLiHyD4+5+fxIzPx04Jb4PEASkBLoSuLTzS
	h9tYML4XuGD2Fvab34pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVbb-0000000BlIE-40mg;
	Fri, 03 Jan 2025 00:31:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVbY-0000000BlHn-3Far
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 00:31:58 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso12149559a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jan 2025 16:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735864315; x=1736469115; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p60ohEC0lcMDc5+vsoccSHrGFVlwexFhvL+evZT42iQ=;
        b=thIHanpMtgLAxP6bqo0F27WkLhyODrT4aOmyOrNzQ4Tcqtv+NIjRk6x7h0vfwu8RW/
         tyE/eLTnCiAVKhPbyIV0i74me5L4z60Mcka6tgA5ElLM2qRxNpr4BEuSOAmom17XjFs2
         KJl3meV49KEhK0flsARPJDONGL7gR/k87qMa9FtAObUfdxJmySv/WIkkYnviPyUIC8YY
         b+TfuwhxeZNflKBhJjdo+Wd26evgFyI5/o15YQ8DoTq1EtKMOUmvWSCol1ppkiMp7FCS
         2U5ELiE7fiers0cfGK51Nes5YeneR5fSH23W2ymAFP5ANk2Y5hV0bI+iYAcnesAgA71j
         7aeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864315; x=1736469115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p60ohEC0lcMDc5+vsoccSHrGFVlwexFhvL+evZT42iQ=;
        b=IzENZvly7RP4SsHPP0Io7BrJkSJfzTPieIgolHAmF21X/0lQwE16eyXHkJn4jxvDQi
         V4v4K/9T+M4tuEAC/nvGEzEhLdxBpJicfcryH1Tl4xMVZjgzfiYoIhKMxuWCGQKoxgLu
         19jEcVxw0RPxN4TawPV+/x4p/76UMwe6rwKZX6lKcy330uIUs4CYZditnXTfQ5V/7vzt
         xYyzT9AJgVk8YKvr30cNoQwIu/GkoVMAqRaw9jSbUJZT1YxhyLuCZ2lXsipBE2IgFDKB
         TR8VWk5K/TBX3FfpTWKn5W4P+demI4x1lqOcogCbnTmDatFibFIu4MUxNNjOac7aExCz
         MP6w==
X-Gm-Message-State: AOJu0YyeoEkgOrU5FBXCFV3BhfpTetFel5wSX4gFTzkkEgmPZpdfYDXk
	WMlA+t5qQSXvi2e9xsYZTaLC3+SsGp6WVDAeaJeKikMHaDogKXtW6g4KBvtozgQ=
X-Gm-Gg: ASbGnctKdiWinPjf4SttDpNhYjdjQatHtF+/V/yS5swgqqKnItq3cPuqRqAie8EEEgf
	oZtfiUHSXfzovkTXM/nWUI3X2mkAjj7axG6bvSDjy7CTByw9vh717SXgNMPdWXQsDQeOF78/UNP
	kPSPxLpHJ9nhn9QVau832vvOeqrAORLFeM3uGIZGCnkZbYNNvKGvSTI4/+11MJ0vqSpHxA48Bj3
	RQdYhdoX71vuH2cAtRT1/1s/1riUVghvOVtusaAh1sP2nn21C4R
X-Google-Smtp-Source: AGHT+IGKGAeDhUlzYbvQRqd8UylgnFkCkYWQF4YyiX8Kt33xlyrfV+H8wMqxdbtsRoigqCVOJqH/bg==
X-Received: by 2002:a17:90b:54d0:b0:2ee:c918:cd60 with SMTP id 98e67ed59e1d1-2f452e4a7f6mr72948222a91.20.1735864315357;
        Thu, 02 Jan 2025 16:31:55 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:e7aa:b727:e049:3265])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed0d8bb2sm28947179a91.0.2025.01.02.16.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:31:54 -0800 (PST)
Date: Thu, 2 Jan 2025 16:31:52 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v4 1/2] RISC-V: clarify what some RISCV_ISA* config
 options do
Message-ID: <Z3cv-GI7gdCpIdm2@ghost>
References: <20241024-aspire-rectify-9982da6943e5@spud>
 <20241024-overdue-slogan-0b0f69d3da91@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-overdue-slogan-0b0f69d3da91@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_163157_080799_E461DB30 
X-CRM114-Status: GOOD (  36.06  )
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

On Thu, Oct 24, 2024 at 11:19:40AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> During some discussion on IRC yesterday and on Pu's bpf patch [1]
> I noticed that these RISCV_ISA* Kconfig options are not really clear
> about their implications. Many of these options have no impact on what
> userspace is allowed to do, for example an application can use Zbb
> regardless of whether or not the kernel does. Change the help text to
> try and clarify whether or not an option affects just the kernel, or
> also userspace. None of these options actually control whether or not an
> extension is detected dynamically as that's done regardless of Kconfig
> options, so drop any text that implies the option is required for
> dynamic detection, rewording them as "do x when y is detected".
> 
> Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

This has been sitting around for a while but is a good change.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 62545946ecf43..278a38c94c5a6 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -527,7 +527,8 @@ config RISCV_ISA_C
>  	help
>  	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
>  	  when building Linux, which results in compressed instructions in the
> -	  Linux binary.
> +	  Linux binary. This option produces a kernel that will not run on
> +	  systems that do not support compressed instructions.
>  
>  	  If you don't know what to do here, say Y.
>  
> @@ -537,8 +538,8 @@ config RISCV_ISA_SVNAPOT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Enable support for the Svnapot ISA-extension when it is detected
> +	  at boot.
>  
>  	  The Svnapot extension is used to mark contiguous PTEs as a range
>  	  of contiguous virtual-to-physical translations for a naturally
> @@ -556,9 +557,8 @@ config RISCV_ISA_SVPBMT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) in the kernel when it is detected at boot.
>  
>  	   The memory type for a page contains a combination of attributes
>  	   that indicate the cacheability, idempotency, and ordering
> @@ -577,14 +577,15 @@ config TOOLCHAIN_HAS_V
>  	depends on AS_HAS_OPTION_ARCH
>  
>  config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>  	depends on TOOLCHAIN_HAS_V
>  	depends on FPU
>  	select DYNAMIC_SIGFRAME
>  	default y
>  	help
> -	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  Add support for the Vector extension when it is detected at boot.
> +	  When this option is disabled, neither the kernel nor userspace may
> +	  use vector procedures.
>  
>  	  If you don't know what to do here, say Y.
>  
> @@ -667,8 +668,8 @@ config RISCV_ISA_ZBB
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>  
>  	   The Zbb extension provides instructions to accelerate a number
>  	   of bit-specific operations (count bit population, sign extending,
> @@ -707,9 +708,9 @@ config RISCV_ISA_ZICBOM
>  	select RISCV_DMA_NONCOHERENT
>  	select DMA_DIRECT_REMAP
>  	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>  
>  	   The Zicbom extension can be used to handle for example
>  	   non-coherent DMA support on devices that need it.
> @@ -722,7 +723,7 @@ config RISCV_ISA_ZICBOZ
>  	default y
>  	help
>  	   Enable the use of the Zicboz extension (cbo.zero instruction)
> -	   when available.
> +	   in the kernel when it is detected at boot.
>  
>  	   The Zicboz extension is used for faster zeroing of memory.
>  
> @@ -760,8 +761,9 @@ config FPU
>  	bool "FPU support"
>  	default y
>  	help
> -	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  Add support for floating point operations when an FPU is detected at
> +	  boot. When this option is disabled, neither the kernel nor userspace
> +	  may use the floating point unit.
>  
>  	  If you don't know what to do here, say Y.
>  
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
