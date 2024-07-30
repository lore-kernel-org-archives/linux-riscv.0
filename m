Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287BEC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/IR/Wq6qM2N0ni1X2GRXSQOyvDxJARqU4JznUps+Jo=; b=ccnL9AhdWXc61Q
	gOKbBQVXbGLcuqUVcmh+jubRVbUngLpjeFN3jEiFMeL9QX+jQWd6/IOldhNVxdEGjvkkMdkdSxV7H
	7CcdZRcmxlX72M1bYrQ5NUvH8upda8b1JD9k2uODiR1uHH7BzjARi6H+PC8EeIZpMGzedpqiEk7BM
	KQGcyz2Bw/4f6x6YGqyFNXt10g87YBzAFH+WheT8/NG+44BO9+YIBwbsjx45ymtAfNGov5uLOfVfT
	vY/4nOmretJlZ2oxmwtR4hQ9RjH9yt72q9dgMW1CjDAHj6KJpUn8/sBYKPSzTpMtr7xTypz9yqexC
	++aophhe0tqCU/NHl5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmgg-0000000FE8M-3otZ;
	Tue, 30 Jul 2024 13:14:46 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmge-0000000FE6q-23D3
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 13:14:46 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so6675532e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722345281; x=1722950081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bqUkSHzFI9u1ItIMDQJtXdjFjc/hDvkrDt0pAiq7h38=;
        b=kVpAQpuhOf4/VGJ6iDQ2VToMAElM0k5q2eJBABE9ZztTrXZI9YMGgAZdG58ERaPsOj
         uVIv1VfouyA4xjSGLWLCf1XPEJRVboQ4k/WFZ+5fe+FdzO/gcsq2wxprb5L3NAaHL53c
         OWh3LXJk0RYhtqy1dbFeV/TDQg5W0W4uOYUXSUY6qq6g1LV263lcBHj1+mROLHGplQSa
         NAZ9RgjJjy9RgOJh/mNnQZ5KUc+7dPlIByJPaXFSFSBVGdxsJamcXYusuzJUnaS8c2AD
         5+St+WgYk74IFsvZWAdezgxGkDU9OUW73tfvBt43CWcWdEagV7NbQGq+iQnbGt7ZZ6Jh
         JyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722345281; x=1722950081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqUkSHzFI9u1ItIMDQJtXdjFjc/hDvkrDt0pAiq7h38=;
        b=jFYKxQ7tq+tWSnIaHBh0/rDZUbw5t+othiy/QUIEvoDJ+V5va0kioXuqtmkzJGIRYY
         IC2XTkFiCtK014/i6UXe493O753h3bUsI+soYxtTXXK6vVIJUgBN1EcT4jfEisudGNJp
         LuF5wad6GSGQE3QfOxbZo3ISRDpHVgF6J0AISzpvrh3FV/q7j1Bq3DlA7drEHyy0/AoC
         YYbQNtHzAktphysYL6Bvq14jUHYDDa4jst6b/KIRcF1RRA3GXgTyk+nguRqZQfWxtz3y
         XeiDxdL5yO1nUBq0tr3cR+VMWjgAkze9JWMYys8Xw42EC4SWOIrXmN4Ok8pnjR18825E
         L2XQ==
X-Gm-Message-State: AOJu0Yy6tlKMMinQNw1mzhRqcPtkVjTiLpJHUvVjNuHRiWW9fwGJI1mN
	fAytSxBa0iMStz2zWnNHoWsFY9LJhJu0GWnLdPphbaJcg2jeiDynDZeCgXnUcjwfwn6Yh1n1+/F
	1RgU=
X-Google-Smtp-Source: AGHT+IHNJWcUOulc6WgdzX0iUHJzXhXjentRKxTTzPDjEDBjfsWSHeEc3IfYSOi/xqL+E5sFGk2siw==
X-Received: by 2002:a05:6512:340b:b0:530:ab31:5683 with SMTP id 2adb3069b0e04-530ab315a3bmr1176480e87.14.1722345280686;
        Tue, 30 Jul 2024 06:14:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab53704sm645196066b.86.2024.07.30.06.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 06:14:40 -0700 (PDT)
Date: Tue, 30 Jul 2024 15:14:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, debug@rivosinc.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	samuel.holland@sifive.com
Subject: Re: [PATCH] riscv: fix isa validation for virtual [ms]envcfg
 extension
Message-ID: <20240730-bcf30b29609f33dae538f26d@orel>
References: <20240730073847.1999420-1-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240730073847.1999420-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_061444_553836_08E86329 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Jul 30, 2024 at 03:38:45PM GMT, Andy Chiu wrote:
> The exntension RISCV_ISA_EXT_XLINUXENVCFG was accidentally turned off
> after introducing ISA validation. The reason is that this extension is
> not in the riscv_isa_ext[] list, causing riscv_get_isa_ext_data() fail
> to find a corresponding riscv_isa_ext_data pointer. As a result, the
> kernel skipped setting resolved_isa bitmask. To fix this, we proceed
> with the bit information obtained from source_isa bitmask. This means
> that the bit in resolved_isa is set unconditionally, regardless of
> whether we find an entry from riscv_isa_ext[] list. This should be safe
> as the kernel already parse isa string before writing into source_isa.
> 
> Fixes: 625034abd52a ("riscv: add ISA extensions validation callback")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8f20607adb40..3f91a1f39a50 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -432,10 +432,7 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
>  		bitmap_copy(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX);
>  		for_each_set_bit(bit, source_isa, RISCV_ISA_EXT_MAX) {
>  			ext = riscv_get_isa_ext_data(bit);
> -			if (!ext)
> -				continue;
> -
> -			if (ext->validate) {
> +			if (ext && ext->validate) {
>  				ret = ext->validate(ext, resolved_isa);
>  				if (ret == -EPROBE_DEFER) {
>  					loop = true;
> @@ -447,13 +444,13 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
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
> 2.43.0
>

Hi Andy,

This looks like the same solution that Samuel sent which is currently
under discussion[1].

[1] https://lore.kernel.org/all/20240718213011.2600150-1-samuel.holland@sifive.com/

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
