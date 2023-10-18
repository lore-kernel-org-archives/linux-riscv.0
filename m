Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF5BCDB474
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 02:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVUfJC4jemLOCcuYxylP8n/1M7d1SeRincTgd+pzVpI=; b=hED3upBvCcyPtO
	qLnsidY1MyloPQDHZcxgEq/XAC89W8RBCJvIPPc9F293bY25o0vtmAG6h77fP8y8ID2ZEhU7OVJhZ
	AJaRWowHaBVGZSKRUx3zDiRZwi+sK6Hfu5Sckf+7KhWYgK4X9AyYvOppAKT28Gk4pffgW0VbHj3ro
	uQWge4HPqYMhtxxTdw0noPkhAgNQqVgjD3htJtz0fyCgqG5T9LQ8pjJixldMI7eX2Ket+5trWBQ8K
	gufK0L6OmMcVLdPyc66/cvDmjAJS4OcJIIivhJPI2po2qQf/TIXnrNQPw5t4UHetPF72CLzz8stf6
	8iGbJqmcP22Nx8JCk4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qswQC-00DbH8-0n;
	Wed, 18 Oct 2023 02:36:32 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qswQA-00DbGb-1F
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 02:36:31 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-45853ab5556so238775137.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 19:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697596586; x=1698201386; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=gFz94l2p+XsACy/TSX0BEi7SSq0GBj61RuG9Z1I/gfmjf0uLWgA2+tLvlm4ayUzMl+
         ace2hrgvXm8TcFm2ZiDc+5W7V+pg8nPBs0c6r+ZL0XylTujc3jXMFqXbD9g5dU6nx/dy
         gRaUinx7kWzk4z09rB9yOgIhVHcddBc0gtADLcML/ict/lwDg5PjqCHnjfkocMYYOaDX
         J/m34RK5YNE6CITrTE63mBJHhqmGQKVtw2yGJ7hp+9oYvKeMF07So9sYW/NM9nuNYEFP
         gzLy4wnsNYygHha/2TsJAh759qeSKcd7LQZqHXaz+R3p45FTVjFiwUyrs7RISetkGgKE
         YleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697596586; x=1698201386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1hQUSC6F9AFhvyb/xCilKIC0FwjPecefxnGiwvigfQo=;
        b=CgCG4gzk1K69ZI6pvmTbD6Hnxg9CbYkJW0CRrshD/8GYH5Xy3Aen+LwEWebB6kG7PO
         B+k7TURqFIueEXieBQ5HqV+qu4alOgI2yoTrqzYP/MmOeg0mw/QOZzFrhAIp08nLA/yg
         d42/JSnXB04xXOguqeU3QETkr4LAYGVUlXoDTq0Cuu0oB44jqPI7rdh/cZkF4xHKm0lO
         opuIkCS2tr1tFl/ICrrc2q0lPaWZKjAVJGVPPk4WVxH70fnSdCbQ4edp62ycV8H5M272
         L4RTVvQrUHd9qwWjaZ4zlGEzBmqo+cSrDWyhe9M9U1n4M1YPl/FsrpCazYrd6haX5qt/
         QRQg==
X-Gm-Message-State: AOJu0YyvvResv36U3prRyv8rpReWLSdGfn/oax1szChYwT+CEASKIb4J
	8z//93/vAj5mz++prrS6xWjFVQ==
X-Google-Smtp-Source: AGHT+IGB3G4DPZs6jCzWa2l4tyot1REVVzMZ1DTbbM5dTMuW4mJZGqL+sHBYO3aIbBTBJypIWm04PA==
X-Received: by 2002:a67:c10b:0:b0:452:82ff:e76 with SMTP id d11-20020a67c10b000000b0045282ff0e76mr4377909vsj.13.1697596585740;
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id t6-20020a0cf986000000b00641899958efsm1017131qvn.130.2023.10.17.19.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 19:36:25 -0700 (PDT)
Message-ID: <39aef189-4eca-44aa-8877-9fcf547f3282@sifive.com>
Date: Tue, 17 Oct 2023 21:36:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20231017135926.1240101-1-hch@lst.de>
 <20231017135926.1240101-3-hch@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231017135926.1240101-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_193630_451455_396A7C9C 
X-CRM114-Status: GOOD (  16.10  )
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

On 2023-10-17 8:59 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0ac0b538379718..9c48fecc671918 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -273,7 +273,6 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select DMA_BOUNCE_UNALIGNED_KMALLOC if SWIOTLB
> -	select DMA_DIRECT_REMAP if MMU

This breaks ERRATA_THEAD_CMO, which also needs a `select DMA_DIRECT_REMAP`:

riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L131':
direct.c:(.text+0x42a): undefined reference to `arch_dma_alloc'
riscv64-unknown-linux-gnu-ld: kernel/dma/direct.o: in function `.L192':
direct.c:(.text+0x592): undefined reference to `arch_dma_free'

>  config RISCV_NONSTANDARD_CACHE_OPS
>  	bool
> @@ -549,6 +548,7 @@ config RISCV_ISA_ZICBOM
>  	depends on RISCV_ALTERNATIVE
>  	default y
>  	select RISCV_DMA_NONCOHERENT
> +	select DMA_DIRECT_REMAP
>  	help
>  	   Adds support to dynamically detect the presence of the ZICBOM
>  	   extension (Cache Block Management Operations) and enable its


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
