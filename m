Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2C3C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 11:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YshbIrjlVlyJX3YyQ9cSoMzDuSaCyxlLFqhmyO0eXJU=; b=qzIJ6BVl+bM0l1
	hm3ggZhZI6FS5iYki4bwxArb4PxJ1vSbrIA2JvgH611sGpSPrcVDypUkW4iE4Ku1cX1iAYvnC04if
	8OWLpdXylGHQcHBwVd7b00ZsHRMZc2Ao26WfBKfDQBs4vfm7xUZTnGEMWuYCwRpwE2wmUQseRTb5o
	5rV9vvkGzTlxOgK0djW3rRnWEinaUJp1yXLxeYd5nFHzb5X8bLfMkIPls55RAIGEC3fl584rEb78D
	ZkhAZXyyiKBYYhqx502gkSd+a6mUFnlUBCE7t+BFluCVfMwb5j0HVjRZVV4/iUud/PlD98LZYp2qA
	IpNxr+foMLC1PE9ZdvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm0G-00000005O0D-3Jl3;
	Fri, 19 Apr 2024 11:02:00 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm0C-00000005Nxk-2oYI
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 11:01:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a5565291ee7so209888066b.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713524514; x=1714129314; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VTTzqipQA62LbzqZVTLpZ7KIqqGEoS+t4l2KKK32uo=;
        b=Cbf0LKEJHorA/FfgnOHJMR/IgY9Z+RD3Vc52bM4oXzW1Ihm6B4Jr1E1yBdnqNG57tD
         YsQZLnzsWDt76QBLtQjBW4QX+gxM0qjlAosXxHOdgnPRWixNFFPxHH1IWhtpMLFyqmjY
         QYd8aKAT01ANavDU+1qUbpJgQzUzBOXJV9KEze5qIOzaRgd96b796qYWIwAlzP97+Wg9
         JVuAerfPlc0U+gX5fA4SbUs0CGzMOecqtzcE9sumvoX6Ck6halxleeE/7Wf1ZXcQXAGD
         0Pevd6/8gmzdaYAxywLivwc9IDaKCKBctWNfy5rX8Q/G/1oSTWGlZpYiq8bvX5tMbPfR
         xkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713524514; x=1714129314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VTTzqipQA62LbzqZVTLpZ7KIqqGEoS+t4l2KKK32uo=;
        b=lOUtETuoF/y5Um8taxzvEvG4JgQOa0ArPAXpx8gpbZFQ/9QlaubpA6PZ5cyK+14TB2
         dnVv5iQZG77NazZEhiusdRA7d45W4VBjf8oxJHGmpqpxNd1A6FITbx3GT7++/PsjqaQo
         UgDCvCgc6Nr1Q/QBYcI+H+HpuUMNA68eVBDisC/RV8xbxOMcfycBWvQr+kWXYCD9alHz
         e3oZcZ0LGliubYePh3y7uIO3roV/r/m4jJhRJ3xiFAnm+XWX2Yez9+95GY3lh1QEv+Gr
         uSN6JZCiQb8hJdCTE3xZ8trboCbZ6X4I2lzJJYp1DMR0tz3Ho5RYsUbUMoVbbUFLxdyc
         cTBg==
X-Gm-Message-State: AOJu0Yy4eeg99ave+aALP860gEThEaQ1slc1+qtFdahTJKysRcln2Rkd
	E6e63OsWyZVq16ctGvm8WPnvjhlRHhaII92CVo8bJGqC1SMhXIHmZBHW1zD4i4A=
X-Google-Smtp-Source: AGHT+IFPLWd/fepjGkb60/ZFbc7sxCgg692Z+BCDRyWFZUyjJCwWhlOXF6oUhAX4lRUmpKzcAhVS9g==
X-Received: by 2002:a17:906:488f:b0:a52:700d:818e with SMTP id v15-20020a170906488f00b00a52700d818emr1132855ejq.13.1713524513758;
        Fri, 19 Apr 2024 04:01:53 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hx20-20020a170906847400b00a529aeb4eccsm2091354ejc.140.2024.04.19.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 04:01:53 -0700 (PDT)
Date: Fri, 19 Apr 2024 13:01:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Pu Lehui <pulehui@huaweicloud.com>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: clarify what some RISCV_ISA* config options do
Message-ID: <20240419-ea2b867f6bde90e711464c95@orel>
References: <20240418-stable-railway-7cce07e1e440@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418-stable-railway-7cce07e1e440@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_040156_796815_3473F822 
X-CRM114-Status: GOOD (  35.55  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2024 at 03:21:01PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> =

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
> =

> Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f7=
5a676c@spud/ [1]
> Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> =

> Vector copy-paste-o fixed, correct spelling of optimisations kept.
> =

> CC: Samuel Holland <samuel.holland@sifive.com>
> CC: Pu Lehui <pulehui@huaweicloud.com>
> CC: Bj=F6rn T=F6pel <bjorn@kernel.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/Kconfig | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6d64888134ba..c3a7793b0a7c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -503,8 +503,8 @@ config RISCV_ISA_SVNAPOT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension when it is detected by
> +	  the kernel at boot.

I'm not sure we need the 'by the kernel', since I guess that's implied by
being in a Kconfig help text, but either way is fine by me.

>  =

>  	  The Svnapot extension is used to mark contiguous PTEs as a range
>  	  of contiguous virtual-to-physical translations for a naturally
> @@ -522,9 +522,9 @@ config RISCV_ISA_SVPBMT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) when it is detected by the kernel at
> +	   boot.

Same 'by the kernel' drop suggestion.

>  =

>  	   The memory type for a page contains a combination of attributes
>  	   that indicate the cacheability, idempotency, and ordering
> @@ -543,14 +543,15 @@ config TOOLCHAIN_HAS_V
>  	depends on AS_HAS_OPTION_ARCH
>  =

>  config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>  	depends on TOOLCHAIN_HAS_V
>  	depends on FPU
>  	select DYNAMIC_SIGFRAME
>  	default y
>  	help
>  	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>  =

>  	  If you don't know what to do here, say Y.
>  =

> @@ -608,8 +609,8 @@ config RISCV_ISA_ZBB
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>  =

>  	   The Zbb extension provides instructions to accelerate a number
>  	   of bit-specific operations (count bit population, sign extending,
> @@ -625,9 +626,9 @@ config RISCV_ISA_ZICBOM
>  	select RISCV_DMA_NONCOHERENT
>  	select DMA_DIRECT_REMAP
>  	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>  =

>  	   The Zicbom extension can be used to handle for example
>  	   non-coherent DMA support on devices that need it.
> @@ -686,7 +687,8 @@ config FPU
>  	default y
>  	help
>  	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use floating-point procedures.
>  =

>  	  If you don't know what to do here, say Y.
>

Zicboz could also use some clarification, right? Or is the fact that
RISCV_ISA_ZICBOZ enables the use in both the kernel and userspace the
reason "Enable the use of the Zicboz extension (cbo.zero instruction)
when available." looks sufficient? Maybe Zicboz should follow the
"Say N here if..." pattern of V and FPU?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
