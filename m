Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22817C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmC9hv/DLsbtbZU2UNB3lvRPNhDGPffeOJFM/fa3lSY=; b=0Yn/A/HC0IWcNH
	9UeiMuJ04vtgKQKKVwRWuyh3QLDCOd357JT21ZnfoQApxux0XMJ2LyYCbTPhFD1CR4cYUh+t6yi/4
	bNZFMM9pmzWvHIwwSSmJMR9svYvPYDTsBmc6TKb+CwSjEvLRP8RdhAyzeAgTlEg9wwchBzQBGQIup
	J0fOXjAoRlgKOJyGut4FLAC6zTI/miJDQVuQGymPb+SJ/FO9E3LQXocngm67js6nFGCmn1+9fEdPY
	wPfQJHPi33NDcBozsGOTnvXbwf6tunmScSJM1GhkvVuUm2VAibqM1ndazaLMYOWxTi/5qlZVvMGRs
	/zzle+Dfx84os6vsTIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZ7g-00000000nQ5-35bE;
	Thu, 18 Jul 2024 21:57:12 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUZ7e-00000000nOu-0MEo
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 21:57:11 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-816b627a7b6so45772539f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721339828; x=1721944628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHwfmEtN2E+ymE9t7lYKh6HDNkIVdbk4aYEg9FHEZF4=;
        b=hT34Zf6OfzAth874qA/QTIIFP0l49c9EjlEXASGEdRzx9qzhGn2Rjvyac7n3aN29TQ
         CwTpaIYk9aQuN319x4JRn7Yh34olxI+KLZrf+4s4XAAgq1cYq8J0t/WM7vIgDaqXecEI
         f3B/eY3yWtYmlHenUOIKVquuuTAfUvmycberIbIdqblCGIeGzHsFVNM+uol/LAKUn8rM
         TD3rHGrH/svLth9u4payn6SBkYxACc2H9M7g8CnhOEbmEWSdJqmWKo1YIAA0/hB12RqQ
         YpEEHQuET7WMpJQgvKTM6Q+pvvbFm0vuw3bBITVEybfRU2CJJ1plKH0s5yhYHuYOw5G8
         5IUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721339828; x=1721944628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHwfmEtN2E+ymE9t7lYKh6HDNkIVdbk4aYEg9FHEZF4=;
        b=LuNgt2C8VobWPXK+K5+LlORIO3xf1XWiBAUrNqVA+ZH70ibVTvLnNq6EC35ShvhaHL
         3JODxVL7D24ytKYpd3J4KsD73WQgkty5pGqcGU1/28jGdDGrRurO3s6w2rtCPLrMZ0y9
         GfXmKKwj7x+xln+c1e7R4oAL3fpZHDGvkpYTx5316ghJiSY/+5KpkRYhfhu5EkEsQe7T
         oyXhDcfv+xbauZM4qAmLLca7kOzZUU/CnnTUYLWDdJ0uQCtGlKMd0j1uEKhDlQB8jyPR
         TplfP6txwx6CdQnDiVZqQJZHx2iRAgwoLueBj7+2kdOOGxLMFEsfVbRsd5+gTbhBIsat
         xmAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeTrzDO7dw4bRge/wCMXari0xKUDOa5htpExYBoBIYj/5HwLIm2AsgGUViLd+LJ4Q5FYmpV7cBbTyM43ak7IE6BYp+Xdmyn/ZTQoy4cpbk
X-Gm-Message-State: AOJu0YwmEMQhTpjQ+QwzNIUI4rtfo3Wk9ajl+n/c+X2DUVrDhjP2LYHZ
	wC8SBtUkOa1w72qHf2q9FhEC5UKU1iaiO/8wCycqh+aoDz0p3T/OdFkomX2BV4U=
X-Google-Smtp-Source: AGHT+IHgduXCJ2ARddrS9gvb1XzJLRZZuOvRvqS0t1x1wW6YQXNExLkXLMyBN1QygkfCSlId5RMcxw==
X-Received: by 2002:a05:6602:6c01:b0:7f6:1f87:70c7 with SMTP id ca18e2360f4ac-81710cca2bcmr710978439f.11.1721339828191;
        Thu, 18 Jul 2024 14:57:08 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2343d3364sm36300173.132.2024.07.18.14.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 14:57:07 -0700 (PDT)
Date: Thu, 18 Jul 2024 16:57:07 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: cpufeature: Do not drop Linux-internal
 extensions
Message-ID: <20240718-a5097a4070f457529d2fff91@orel>
References: <20240718213011.2600150-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718213011.2600150-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_145710_161132_C5E0C211 
X-CRM114-Status: GOOD (  22.37  )
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

On Thu, Jul 18, 2024 at 02:29:59PM GMT, Samuel Holland wrote:
> The Linux-internal Xlinuxenvcfg ISA extension is omitted from the
> riscv_isa_ext array because it has no DT binding and should not appear
> in /proc/cpuinfo. The logic added in commit 625034abd52a ("riscv: add
> ISA extensions validation callback") assumes all extensions are included
> in riscv_isa_ext, and so riscv_resolve_isa() wrongly drops Xlinuxenvcfg
> from the final ISA string. Instead, accept such Linux-internal ISA
> extensions as if they have no validation callback.

This assumes we'll never need a validation callback for a Linux-internal
ISA extension. We can make that assumption now and change our mind
later, but we could also add Xlinuxenvcfg to riscv_isa_ext now and
modify the places where it matters (just print_isa?). If we add
Xlinuxenvcfg to the array with a NULL name then we could do something
like

 print_isa()
 {
    for (...) {
        ...
        if (!riscv_isa_ext[i].name)
	   continue;
    }
 }

> 
> Fixes: 625034abd52a ("riscv: add ISA extensions validation callback")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/cpufeature.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 0366dc3baf33..dd25677d60de 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -457,28 +457,26 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
>  		bitmap_copy(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX);
>  		for_each_set_bit(bit, source_isa, RISCV_ISA_EXT_MAX) {
>  			ext = riscv_get_isa_ext_data(bit);
> -			if (!ext)
> -				continue;
>  
> -			if (ext->validate) {
> +			if (ext && ext->validate) {
>  				ret = ext->validate(ext, resolved_isa);
>  				if (ret == -EPROBE_DEFER) {
>  					loop = true;
>  					continue;
>  				} else if (ret) {
>  					/* Disable the extension entirely */
> -					clear_bit(ext->id, source_isa);
> +					clear_bit(bit, source_isa);
>  					continue;
>  				}
>  			}
>  
> -			set_bit(ext->id, resolved_isa);
> +			set_bit(bit, resolved_isa);
>  			/* No need to keep it in source isa now that it is enabled */
> -			clear_bit(ext->id, source_isa);
> +			clear_bit(bit, source_isa);
>  
>  			/* Single letter extensions get set in hwcap */
> -			if (ext->id < RISCV_ISA_EXT_BASE)
> -				*this_hwcap |= isa2hwcap[ext->id];
> +			if (bit < RISCV_ISA_EXT_BASE)
> +				*this_hwcap |= isa2hwcap[bit];
>  		}
>  	} while (loop && memcmp(prev_resolved_isa, resolved_isa, sizeof(prev_resolved_isa)));
>  }
> -- 
> 2.45.1
>

If we'd rather leave Xlinuxenvcfg out of the array (and generally support
extensions not in the array), then LGTM

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
