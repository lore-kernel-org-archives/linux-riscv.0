Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F136FC77B7D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 07:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vg8czhfS4Y1j1UIqlNzivswtfILSQ2q/sdcTntxUPxE=; b=aSj4ZPpntU1ZGf
	j7tKOFxodvbbxfjzZkYZXbTcQC3ni2ESNflBGpAoIRmCncH7ZopkMluWC9o68kWolW+orLBQoVMVQ
	PAvmZv0QeggteUC/2qhphpPtTQbC+I3K/7VADdCemfPh1LuckJo75MgE6O/suN/AZymvRAlSXo1AN
	gnbpJwfjQAuyUmTLSop1Sv50Pw2dC6WPdi1hoZxYyVP3U9tMGc7y1Y/vlxtzenDlSWuMJOIlm6XoR
	WdDO7zRF7qh9/YnEfqXfYkvqZm85fwXBuj3+NdlnF/iPhSFEmMc0Y7YcWmP93OrarfidsDBsc1fYg
	SqBlLVEUg9GN5ZmUy4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puq3K-009whj-25;
	Fri, 05 May 2023 07:40:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puq3H-009whI-2N
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 07:40:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f182d745deso14446255e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683272424; x=1685864424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m4ApvSVwhLIeQgYrjFpAA4IkfXw/8wt8xctUNxDi3M=;
        b=DHCtVNTNcY0JaPCZ0++8il2FT0dqt1uuOGZcqm2nf7m+OoiGyRVKldLN0eN40lalk2
         xqqmqrrxCPau/IOX68cMnLIonk2xdWMzSGgdfzF0f2/dIAo/qvTSpzvm6PoXOdCMm/9q
         8+lJy2ZJqPy3PqR7eroqxJC7hpcV4FqjqktXEIKL6OKPVzNsw+PyeaBhYe/qeJ3jSW23
         ktE3WlgcGDVtOAy0EbcXNgWnWUPPY4PuAnyyKbWIln1n3p2q9QW4iNEYlNs8r+BhyOvW
         UJY8AhaE4IL+qxwXDuB+sPO/+nnl0F1gQV23GgK+kAo1aaVZRl47u4yXSv4bk+tzzlmj
         mGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683272424; x=1685864424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+m4ApvSVwhLIeQgYrjFpAA4IkfXw/8wt8xctUNxDi3M=;
        b=a/fwzWe7JQJKgXdg8PypLGV5I4GOq6G6LPpZFAWsqwo9z/vpfI9AVOByFzqAV9F0em
         8ddKDC7+fjbIEfhMXZY+mWAoVbceRUq3qEKxXC+jFK2aG/IJ+QyZDlL1faHT5DXUPaMc
         HYokISTJPHU8r6tBh3h0Po1mN6c13n9nTGMARd1Bc8I6udx4VliRJTal/GCn351mAUAY
         PNZqP3tcV6bxygcu1ydco6ub2CdvDESIvHtjtdgHvVeW9yl+2GUjEcdeCkvt859UGi7C
         m5Roip0K9DYeXy5inpDIxKVhxspBP0CX3R1WZc71b7pmYSPfVLmP1L2PqXx9fj75cTvd
         eqEQ==
X-Gm-Message-State: AC+VfDw2QuCt4H+CKtmgTrTwDtIErddJKzBBjhBNJ8Ib3APnOeRjQmxC
	p3z+EnBaeHtyRQb2YykCI4X9Zg==
X-Google-Smtp-Source: ACHHUZ64ol/b9+3yadr2xdUpXF5fDW4zZejzu4Vfkguy6XCEc5wViXG/LcKXQQaTqorvxORS9ZuMFw==
X-Received: by 2002:a5d:55cf:0:b0:304:b967:956f with SMTP id i15-20020a5d55cf000000b00304b967956fmr699536wrw.8.1683272424146;
        Fri, 05 May 2023 00:40:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b12-20020adfe30c000000b00306423904d6sm1497676wrj.45.2023.05.05.00.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:40:23 -0700 (PDT)
Date: Fri, 5 May 2023 09:40:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 4/7] RISC-V: validate riscv,isa at boot, not during
 ISA string parsing
Message-ID: <20230505-b0000d4928c8eedff2ae1f8d@orel>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-sultry-frostlike-9dbf19333725@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504-sultry-frostlike-9dbf19333725@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_004027_772250_0086B3A0 
X-CRM114-Status: GOOD (  22.72  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 07:14:23PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Since riscv_fill_hwcap() now only iterates over possible cpus, the
> basic validation of whether riscv,isa contains "rv<width>" can be moved
> to riscv_early_of_processor_hartid().
> 
> Further, "ima" support is required by the kernel, so reject any CPU not
> fitting the bill.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpu.c        |  8 +++++---
>  arch/riscv/kernel/cpufeature.c | 12 ++++++------
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 7030a5004f8e..b0c3ec0f2f5b 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -63,10 +63,12 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
>  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
>  		return -ENODEV;
>  	}
> -	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
> -		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> +
> +	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
> +		return -ENODEV;
> +
> +	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))

'ima' matches the DT binding pattern requirement and the order required
by 27.11 "Subset Naming Convention". If the spec ever squeezes more single
letter extensions into the front of the ISA string, then we can cross
that bridge when we get to it.

>  		return -ENODEV;
> -	}
>  
>  	return 0;
>  }
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3ae456413f79..a79c5c52a174 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -130,12 +130,12 @@ void __init riscv_fill_hwcap(void)
>  			continue;
>  		}
>  
> -		if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32", 4))
> -			continue;
> -
> -		if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64", 4))
> -			continue;
> -
> +		/*
> +		 * For all possible cpus, we have already validated in
> +		 * the boot process that they at least contain "rv" and
> +		 * whichever of "32"/"64" this kernel supports, and so this
> +		 * section can be skipped.
> +		 */
>  		isa += 4;

When we add RV128 support this will need a tweak, but that's for another
day. Since all ISA strings must start with rvXX per the spec, then this
works for ACPI too, which states the isa string in its ISA string table
must conform to the unpriv spec.

>  
>  		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
> -- 
> 2.39.2
> 

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
