Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E971C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TRSgHM828gfV56mVrIRiEGxn21qhTq1XjnItyYLPlM=; b=kkjrH9EkYS/pwO
	/rRATEoSDvqzLuxhzAvXeRKot5DXGnaMt8cFFz6zh7+9NMzLm5CnIfoXvAJITh/NYiucWcCfo1Bsp
	6lj3lrQsu6PM/8YudeWagopbBUt/DlNZhSgSx8VdwmRJmk4r3goZi1/SovhqN2W3fRiMwMLnrknK9
	T2BEjr57Fly7IciW0wtAvcJNvlOrhamqdjltCzWhnUcvkfmKSjdLcijnTJNVGC1/LMvgf/OFw3mTK
	+kFG00NAG4gFU8YZswVoLzFs/eWv6OPcHmusfWoSpDazuHdQfsLBhz7n2tWOgT5kRQsY1HJgUJb5C
	AIJVEmHIEPfyJOqTSUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEyd-00000003VNO-4AYg;
	Wed, 29 May 2024 08:48:07 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEyJ-00000003V9z-3dsS
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 08:47:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 847A5E000A;
	Wed, 29 May 2024 08:47:41 +0000 (UTC)
Message-ID: <f2a3bddd-0cc1-43ca-8421-1d67dd2800f8@ghiti.fr>
Date: Wed, 29 May 2024 10:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] RISC-V: clarify what some RISCV_ISA* config
 options do
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com,
 Andrew Jones <ajones@ventanamicro.com>, pulehui@huawei.com,
 Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Pu Lehui <pulehui@huaweicloud.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20240528-applaud-violin-facef8d9d846@spud>
 <20240528-varnish-status-9c22973093a0@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240528-varnish-status-9c22973093a0@spud>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_014748_433359_9EA5F907 
X-CRM114-Status: GOOD (  34.16  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 28/05/2024 13:11, Conor Dooley wrote:
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
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/Kconfig | 36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b94176e25be1..3b702e6cc051 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -501,7 +501,8 @@ config RISCV_ISA_C
>   	help
>   	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
>   	  when building Linux, which results in compressed instructions in the
> -	  Linux binary.
> +	  Linux binary. This option produces a kernel that will not run on
> +	  systems that do not support compressed instructions.
>   
>   	  If you don't know what to do here, say Y.
>   
> @@ -511,8 +512,8 @@ config RISCV_ISA_SVNAPOT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension in the kernel when it
> +	  is detected at boot.


To me, the new version makes things even more confusing: svnapot 
mappings will indeed be handled by the kernel (since only the kernel 
sets up the page tables) but it will only be used (for now) for HugeTLB 
mappings in userspace.


>   
>   	  The Svnapot extension is used to mark contiguous PTEs as a range
>   	  of contiguous virtual-to-physical translations for a naturally
> @@ -530,9 +531,8 @@ config RISCV_ISA_SVPBMT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) in the kernel when it is detected at boot.
>   
>   	   The memory type for a page contains a combination of attributes
>   	   that indicate the cacheability, idempotency, and ordering
> @@ -551,14 +551,15 @@ config TOOLCHAIN_HAS_V
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>   	depends on TOOLCHAIN_HAS_V
>   	depends on FPU
>   	select DYNAMIC_SIGFRAME
>   	default y
>   	help
> -	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  Add support for the Vector extension when it is detected at boot.
> +	  When this option is disabled, neither the kernel nor userspace may
> +	  use vector procedures.
>   
>   	  If you don't know what to do here, say Y.
>   
> @@ -616,8 +617,8 @@ config RISCV_ISA_ZBB
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>   
>   	   The Zbb extension provides instructions to accelerate a number
>   	   of bit-specific operations (count bit population, sign extending,
> @@ -633,9 +634,9 @@ config RISCV_ISA_ZICBOM
>   	select RISCV_DMA_NONCOHERENT
>   	select DMA_DIRECT_REMAP
>   	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>   
>   	   The Zicbom extension can be used to handle for example
>   	   non-coherent DMA support on devices that need it.
> @@ -648,7 +649,7 @@ config RISCV_ISA_ZICBOZ
>   	default y
>   	help
>   	   Enable the use of the Zicboz extension (cbo.zero instruction)
> -	   when available.
> +	   in the kernel when it is detected at boot.
>   
>   	   The Zicboz extension is used for faster zeroing of memory.
>   
> @@ -693,8 +694,9 @@ config FPU
>   	bool "FPU support"
>   	default y
>   	help
> -	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  Add support for floating point operations when an FPU is detected at
> +	  boot. When this option is disabled, neither the kernel nor userspace
> +	  may use the floating point unit.
>   
>   	  If you don't know what to do here, say Y.
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
