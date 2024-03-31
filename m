Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1BECD128A
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 17:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkFJwn77IhYlEHgSgIpQ7P55NeARUwqH/BCH/nouh/Y=; b=VJDxcQwQuN2mbD
	ZTJb2cWRWVPIyBUtb/1JMyX3uzCGm1Pta/nvZdvOmHDc0c3CUIPTBNDZnB1ZM5H2xU/8IZA7zk2GO
	9XsaBE0uLHwsPUnhKqEF7Kx2O5e7HYaiwtw5T1jN1pkz422EwlHTSIVJNDSrcvh08bEsIaH8nDLsT
	OKU5MI7FH5YXeZLj+3z2W9At6QA705Vxuf21D0t8mrj5QRpTK7e2upqGMI01k99QRkhj/LaWLDO4R
	FjjplRUqBLzgZZ0zc6sseL1/LQ6nvsNNwRDLeY5jyVcb7j3KWlJvP0b8LGV68u2KAFgZbR7SeUB6n
	086qYEbkYgeIZl0Fo6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzJE-000000061c3-0Qxd;
	Sun, 31 Mar 2024 17:49:32 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqzJA-000000061bc-2Kam
	for linux-riscv@lists.infradead.org;
	Sun, 31 Mar 2024 17:49:30 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7d0486cf91aso180060439f.1
        for <linux-riscv@lists.infradead.org>; Sun, 31 Mar 2024 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711907367; x=1712512167; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfXG+wF/tlnzwlpe6WnuuMRMbwNdJXyeLBAyx26A1ms=;
        b=JlcwpqNyiGuYbwdM44bbr1fjtD3XgWSTxXkCAFDcE3WYpseYqoQLg9ppiH4l8fDJm9
         DlDDULjks2PSI7TFxyqOGQaaGoCGavm0HHj+2rJZjF3LcM2bNbIwtxr3//iB+jTK80T/
         wq+Glmd4Q4ca9242iqkHxsvKcHB4zSaZFd3XqmW9q1IXiAWdimcNRoOWFWFLvKHU27Zs
         kQibl+9/qCypjKLdQYlfigz3MCvJlfqLrV8Mi32ZtZHKGvn7a+5eK+tvrooDodRCd0Qi
         k9jow1cnOnLh/w3GDrKX5a8zx3UdE5bE6L3wLRTD6OEAX8wPKHvC5LibzHAHh5F6TxDt
         gZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711907367; x=1712512167;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wfXG+wF/tlnzwlpe6WnuuMRMbwNdJXyeLBAyx26A1ms=;
        b=sVXdry92119pPxzFx6sMC9rXjBoiWaU6eoOD7kMisY/rg16dWkA0A1OpUxL14UcS43
         o9+HgvqHddk3RQxUjuVWM0W2J9uJZvhb2DYo548RlT5weH1iOJfxUfq3vWrrkaxZouIY
         U8D+xFFVLaipG+8hkRS5BrRwaLLNXjCe9mnI94P3498EDuHT7JxnWDNK+P0fhcZGxc+6
         QIVkDvpym0ty64j8GdpG7EQQvW0MQZGY5sagUu5KsZxTtK2lNxJgyv2bHtuQWgnUZPrR
         GwMQxSngTOHaDYIxvq6Kdgo16ut1zlg8+DFyAnQ/ZZWgUyLg2LqX2r8+WkAuwi6HChlt
         A9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUynY8RqDyduqOOeLxebl+9U3DbDqo+zRkzlhcdbVFnFe6h6TAptHLxEobTnO0i7wqQCiHnAohHJ4VVvjIOD+ckwNbb39L+V57A8PugZlqn
X-Gm-Message-State: AOJu0YwqB7BXIu9tzafxsT+ZVOkgOEgw3FZj+gLq1Yby6dHyqcpnnIK2
	LnEwj5JeNmQwdm5yOywgVU4sQkaBeKvvwkUYcZmvOdPbN6lFiqU7o2SpH8rbIfA=
X-Google-Smtp-Source: AGHT+IH22sqGdmww4qFmYTNoUoblTRsZ8MDo9UbAH2NhKT2PnzajCNIkvwGlbGpFRCb0Dt+t3AU9/g==
X-Received: by 2002:a6b:6e0b:0:b0:7d0:bee7:b660 with SMTP id d11-20020a6b6e0b000000b007d0bee7b660mr2804375ioh.4.1711907366685;
        Sun, 31 Mar 2024 10:49:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.190])
        by smtp.gmail.com with ESMTPSA id d11-20020a5d964b000000b007cc840d1d0bsm2217439ios.25.2024.03.31.10.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 10:49:26 -0700 (PDT)
Message-ID: <c8e3507b-cab0-4215-9936-cd706f043103@sifive.com>
Date: Sun, 31 Mar 2024 12:49:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
To: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley <conor@kernel.org>
Cc: Stefan O'Rear <sorear@fastmail.com>, Pu Lehui <pulehui@huaweicloud.com>,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 Manu Bretelle <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <20240329-linguini-uncured-380cb4cff61c@wendy>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240329-linguini-uncured-380cb4cff61c@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_104928_672500_9F9266B5 
X-CRM114-Status: GOOD (  36.37  )
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

Hi Conor,

Looks good except for one typo.

On 2024-03-29 6:23 AM, Conor Dooley wrote:
> On Thu, Mar 28, 2024 at 10:07:23PM +0000, Conor Dooley wrote:
> 
>> As I said on IRC to you earlier, I think the Kconfig options here are in
>> need of a bit of a spring cleaning - they should be modified to explain
>> their individual purposes, be that enabling optimisations in the kernel
>> or being required for userspace. I'll try to send a patch for that if
>> I remember tomorrow.
> 
> Something like this:
> 
> -- >8 --
> commit 5125504beaedd669b082bf74b02003a77360670f
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Fri Mar 29 11:13:22 2024 +0000
> 
>     RISC-V: clarify what some RISCV_ISA* config options do
>     
>     During some discussion on IRC yesterday and on Pu's bpf patch [1]
>     I noticed that these RISCV_ISA* Kconfig options are not really clear
>     about their implications. Many of these options have no impact on what
>     userspace is allowed to do, for example an application can use Zbb
>     regardless of whether or not the kernel does. Change the help text to
>     try and clarify whether or not an option affects just the kernel, or
>     also userspace. None of these options actually control whether or not an
>     extension is detected dynamically as that's done regardless of Kconfig
>     options, so drop any text that implies the option is required for
>     dynamic detection, rewording them as "do x when y is detected".
>     
>     Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
>     Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>     ---
>     I did this based on top of Samuel's changes dropping the MMU
>     requurements just in case, but I don't think there's a conflict:
>     https://lore.kernel.org/linux-riscv/20240227003630.3634533-4-samuel.holland@sifive.com/
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8a777f59402..f327a8ac648f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -501,8 +501,8 @@ config RISCV_ISA_SVNAPOT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension when it is detected by
> +	  the kernel at boot.
>  
>  	  The Svnapot extension is used to mark contiguous PTEs as a range
>  	  of contiguous virtual-to-physical translations for a naturally
> @@ -520,9 +520,9 @@ config RISCV_ISA_SVPBMT
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) when it is detected by the kernel at
> +	   boot.
>  
>  	   The memory type for a page contains a combination of attributes
>  	   that indicate the cacheability, idempotency, and ordering
> @@ -541,14 +541,15 @@ config TOOLCHAIN_HAS_V
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
>  	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>  
>  	  If you don't know what to do here, say Y.
>  
> @@ -606,8 +607,8 @@ config RISCV_ISA_ZBB
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
> @@ -623,9 +624,9 @@ config RISCV_ISA_ZICBOM
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
> @@ -684,7 +685,8 @@ config FPU
>  	default y
>  	help
>  	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.

s/vector/floating point/ here.

Regards,
Samuel

>  
>  	  If you don't know what to do here, say Y.
>  
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
