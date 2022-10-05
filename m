Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E11C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7BjjyvQsKrQUIhCJDKIa1v2kbVgCaEeTPtHRgsIUCqk=; b=ZA4NN8xUvZRycz
	Ick3Thi8FUNMD2vipb1JTD843jHI0i0qpKPE8eJ3GZVehjpmXjCv+nkkJ7Kdegy2sVm0rX4BFTv/b
	9I8H2sfvNgkqFOfBLQ896B5Uw4KrV6GPAHgb8hfE2YzV7j8h3GCHfmyTgG2o8b/G2Iaoef2jcSEi3
	rlYBsINdRrMezUAYQMgoOF9qBLSX7iaoj+PMTiINU57ld8+SdWOF0edx61qrI9ohsBfBXZ4lMiqi1
	7FKaJfigdocQgDEEo+MiUvXE/wsXje+Stc0RKOl64cgPIsui+4fnH9by0dnnYzW84KAobQ0Eg2fIe
	dGZss40P8+LJ9VbD0QfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7rS-00FN6L-Tc; Wed, 05 Oct 2022 17:07:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7rQ-00FN5c-BM
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:07:09 +0000
Received: by mail-ed1-x535.google.com with SMTP id s30so20174571eds.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=h8FHBoVsbaxbLl/+Sb8V0zp1dy58bBaAUxOIDo7PJTM=;
        b=DvFebTmJb8iAlZ3noYHSzoKIniXMa0t30LHlrIoPdYfrTEbtlVWDx9FXsfnrIOsLpB
         8wiIFs/aQNFsuMndfNKJEF1uQ7BPiAMg3tXhZgxrOuDEK4RNRgcFkK+wXLApJK9N+S/U
         aznhGd/GmUk9j+EEzGcjoj8bwbJToT2mm0PEOJfR8wVyUoUcpnjsMv6nhXqfxocXYMu+
         Uyanwp5Rhzk9zV8Lr+Gv8aEFE4liHWxLDc2PrIpEYKF+f4AKLGNvU5Si+k7om8Xl2OoE
         0Rp6nabt4D2Hu16xgTzLryyPb/wNdPAN916xkAzpdBRQXv/tQ2mPl+E3DR0tljA1YBl7
         d09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=h8FHBoVsbaxbLl/+Sb8V0zp1dy58bBaAUxOIDo7PJTM=;
        b=riPNOsf+v8ay8BXjue08pJxSg7jQi4BAxI11r8FXO4F7QQZSukd9NubZl1ZHXSSXSI
         coxaGMcCLEtJsU3Tyzd2+L8GpEMe7pBenplYKHjImU7OmXgxaJh/27ChH888FCPtMjFK
         6yDUGrwRkCA2oUew3/a0uuwBLDsRljH+1O8gu5i/UzHoOayksW2GLjJzNPhS7MYoWyR2
         RMMjhnbcEAxIeSfPeLeOwfdoZK0W1opTey6b3l4GuM3kq8w+sDSLXMDgSgYVtTDlx8yk
         kSmpemnDbj7+Q21p68lHjI19hHzHKACiswDQUm+mzoNA0g1C1xRYIfJmSWJtUQpMlPML
         rVnw==
X-Gm-Message-State: ACrzQf244SzRerA/TDd+dcI42NCABac7Ahy5kmEjB5axPDou0saa5RQO
	458ZhKbFMEMAOnqHr6id6hKsdA==
X-Google-Smtp-Source: AMsMyM76Ph31LFWOjl2u+0iEWUe9sg37rv6FveiR8m6uaXcdYZJ7IJNyKG+ftg+wKQ6QY5MDaUExCQ==
X-Received: by 2002:a05:6402:1e96:b0:459:68bb:867 with SMTP id f22-20020a0564021e9600b0045968bb0867mr683282edf.45.1664989624046;
        Wed, 05 Oct 2022 10:07:04 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id lb9-20020a170907784900b007815c3e95f6sm9072173ejc.146.2022.10.05.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:07:03 -0700 (PDT)
Date: Wed, 5 Oct 2022 19:07:02 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: atishp@atishpatra.org, anup@brainfault.org, will@kernel.org,
	mark.rutland@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Conor.Dooley@microchip.com,
	cmuellner@linux.com, samuel@sholland.org
Subject: Re: [PATCH 1/2] RISC-V: Cache SBI vendor values
Message-ID: <20221005170702.bsvjssvau6yv47ku@kamzik>
References: <20221004203724.1459763-1-heiko@sntech.de>
 <20221004203724.1459763-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221004203724.1459763-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_100708_411602_B8637FFF 
X-CRM114-Status: GOOD (  18.91  )
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

On Tue, Oct 04, 2022 at 10:37:23PM +0200, Heiko Stuebner wrote:
> sbi_get_mvendorid(), sbi_get_marchid() and sbi_get_mimpid() might get
> called multiple times, though the values of these CSRs should not change
> during the runtime of a specific machine.
> 
> So cache the values in the functions and prevent multiple ecalls
> to read these values.
> 
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/kernel/sbi.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 775d3322b422..5be8f90f325e 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -625,17 +625,32 @@ static inline long sbi_get_firmware_version(void)
>  
>  long sbi_get_mvendorid(void)
>  {
> -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +	static long id = -1;
> +
> +	if (id < 0)
> +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
> +
> +	return id;
>  }
>  
>  long sbi_get_marchid(void)
>  {
> -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
> +	static long id = -1;
> +
> +	if (id < 0)
> +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);

The marchid register will be negative for commercial architecture ids
because the MSB must be set.

> +
> +	return id;
>  }
>  
>  long sbi_get_mimpid(void)
>  {
> -	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
> +	static long id = -1;
> +
> +	if (id < 0)
> +		id = __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);

The spec says this register is "left to the provider" and may be
left-justified. I don't think we can be sure the MSB will not be set.

For both cases I guess we need an extra bit to determine if we've cached
or not

  static bool cached;
  static long id;

  if (!cached) {
     id = ecall();
     cached = true;
  }

  return id;

> +
> +	return id;
>  }
>  
>  static void sbi_send_cpumask_ipi(const struct cpumask *target)
> -- 
> 2.35.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
