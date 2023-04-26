Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40837C7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1I+aIaJA/LyS5zLrFAa0D/ydenwtVLn61NAcgLv/lA=; b=qXBx/kyv8BBtQE
	1FP6+I6DNY3faEBoMRM7qpFOx6q8kmdgJBs+nlSFCkXRK/tX0CSbJAKdoB+v95AbbHyahDaBQuGki
	y5pvOzCjC1mXHKXhv0CGqQ7liUNTX4de2ZxsGO2xpFwteXxlQxFsVcejPs0kBZmlV+lPL2t7HaQ2N
	+RUxBTFXIvFE+zCxSpbOHgvTg4d7/DHLyhoOF6e7DWFxJlLR+3swdRq5mYeuUm166GcQLxtyCjmKl
	jSzXoTORBRyvqm0Voe68S2emWXkkh7UQUHZvbgqilgJRDxIhZEdkK1/m7e3SG0npaK62hHtMQChPU
	z/eJi9KJnhR7Bnjav7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pre73-003tMA-1a;
	Wed, 26 Apr 2023 12:19:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pre6z-003tIx-0U
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 12:19:07 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f20215fa70so27915745e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682511540; x=1685103540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmcjdQ8RsVLRzv4Q3ef05jNyRl9ej4qHvJanOCZLJ0E=;
        b=K1RxM3g3ODFypAviB+wu3nxOeIZV0HPru6hpU1H0nNRY/BzQYSGXLanrNxtdZARdgL
         hxqNblt9p/koSNHmgIs3q6ndXnWymgcYwvRw2oQcujS0gVe0mYQaBHvMvXKiapWFW9My
         6pQl57VKgLF9KjVyBC8RQ1kChazvENrloOypxONMyE9nJCm4O1PORFJ9+TZUmOida3Bv
         zVrmHswFHY+vYfkgXszldRkZCDZinQ6kUhzWzAu91f8uZnQdDcWW8wMBx+8RcriKGtiA
         nvJIBT7SpoVwv0I49LtBrN9Dp/u4ClnXBXGhZZh/jzEPRzzFIoSQnFMKVurqXY5l46R6
         2W+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682511540; x=1685103540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmcjdQ8RsVLRzv4Q3ef05jNyRl9ej4qHvJanOCZLJ0E=;
        b=NYqlekBP66WlsqQh33U2zoXT8aGVhka9cTTkvEQi81Nvcr6T1fsmB5VklJob7MF8qt
         4KEJN+1bN13rXlQeBZ4dYudF/zrS0ROuU0Xcf4moLTBNE3PGpz9jR5ljVQHRNj72UWyu
         6wCRPpiOMBJ3rPtDvQI+oSgdyDhF21rDKP+HFLAXEwJAuITfhziMYH1qstVTUI10tIYt
         iKBMACyYjCfEa2vZg7d1Bd3YEqMfFp0/8dblm4ZkkYOK5mQHVrMUl7QkqXHwT+mQFTw5
         T32j3k6vr9G8oXlo1Vp8Mek+xoTBfCDVmkV9Qn2wQy9fS+M7QEplfJImO9OR4M5RAtv3
         /PRg==
X-Gm-Message-State: AAQBX9dN7reTnidTp2tmhTnV9r0x81cMKTZ6qMiHX/DQ+ni2yxFyq259
	2ZPVIXSJNuHPyzisSob6QEOetYNFU3fWmeqspwg=
X-Google-Smtp-Source: AKy350ZuAQG2NzMLpZsGbGbslS8EiUE5c3iWnjYb2zoOD/0f8W4YMwo2MONCPTPjhlYYwFkvkprawA==
X-Received: by 2002:a7b:c446:0:b0:3ed:ea48:cd92 with SMTP id l6-20020a7bc446000000b003edea48cd92mr13616937wmi.15.1682511539807;
        Wed, 26 Apr 2023 05:18:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d5950000000b0030490c8ccafsm3720048wri.52.2023.04.26.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 05:18:59 -0700 (PDT)
Date: Wed, 26 Apr 2023 14:18:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, 
	Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-devalue-enlarging-afb4fa1bb247@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-devalue-enlarging-afb4fa1bb247@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_051905_195578_E0C156D3 
X-CRM114-Status: GOOD (  26.56  )
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

On Wed, Apr 26, 2023 at 11:43:24AM +0100, Conor Dooley wrote:
> Yangyu Chen reported that if an multi-letter extension begins with a
> capital letter the parser will treat the remainder of that multi-letter
> extension as single-letter extensions.

I think the problem is that the parser doesn't completely abort when
it sees something it doesn't understand. Continuing is risky since
it may be possible to compose an invalid string that gets the parser
to run off the rails.

How about completely aborting, noisily, when the string doesn't match
expectations, falling back to a default string such as rv64ima instead.
That also ought to get faster corrections of device trees.

> 
> Certain versions of rocket-chip will export devicetree containing
> rv64ima_Zifencei, which is parsed by the kernel as rv64imafc.
> 
> While capital letters in riscv,isa are invalid and the validation of
> devicetree's isn't the kernel's job, we should behave more gracefully
> here. Rather than abort parsing on meeting a capital letter, mark the
> extension as an error & allow the parser to skip ahead to the next
> extension.
> 
> Reported-by: Yangyu Chen <cyy@cyyself.name>
> Link: https://lore.kernel.org/all/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/
> Fixes: 2a31c54be097 ("RISC-V: Minimal parser for "riscv, isa" strings")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 52585e088873..93850540b0b4 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -142,6 +142,10 @@ void __init riscv_fill_hwcap(void)
>  			const char *ext_end = isa;
>  			bool ext_long = false, ext_err = false;
>  
> +			if (unlikely(!islower(*ext))) {
> +				ext_err = true;
> +			}

Can drop the {}

> +
>  			switch (*ext) {
>  			case 's':
>  				/**
> @@ -156,6 +160,15 @@ void __init riscv_fill_hwcap(void)
>  					break;
>  				}
>  				fallthrough;
> +			case 'S':
> +			case 'X':
> +			case 'Z':
> +				/*
> +				 * As the riscv,isa string must be lower-case,
> +				 * S, X and Z are not valid characters. Parse
> +				 * the invalid extension anyway, to skip ahead
> +				 * to the next valid one.
> +				 */
>  			case 'x':
>  			case 'z':
>  				ext_long = true;
> @@ -185,10 +198,8 @@ void __init riscv_fill_hwcap(void)
>  				++ext_end;
>  				break;
>  			default:
> -				if (unlikely(!islower(*ext))) {
> -					ext_err = true;
> +				if (unlikely(ext_err))
>  					break;
> -				}
>  				/* Find next extension */
>  				if (!isdigit(*isa))
>  					break;
> -- 
> 2.39.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
