Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ECBC35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 22:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4Rs3yMinkqlOsxUW7QJkGRVX2Hq6pf+NwqnsrGzEyc=; b=vYarZMqVJgL40R
	Fuxwoeq0qaTehDC+1hpt1X8irl/ZtuqWc3YudDsLMp3IEI0mDZijPjIrkl023GoerGflirSJ/g53Y
	uHItIni1e+KnjTSfqN2Zgx7OXVTNEYogLhw6ms43fCnGbquDTd6p9WGSx0/x8ixKfKOqt5DOrT0c+
	W/eAkzGGj852tFoX9LkNpQhhRwCZyl5Nvh/2e8lxNf3tC+s6rf74LIQoUFbq6BOPwbe9CjPH0mpTU
	rGFh7xE/9P6EIobOxwuOcEaJsdP16NocCWheltxPjSJjPcbMeLrKrB5aOmc2RvjNKCfszbT1/dAe4
	YnreOMTTmh9Ih+tvtCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEGkD-004m63-1n;
	Fri, 15 Dec 2023 22:33:21 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEGk9-004m4F-0h
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 22:33:19 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6d9f4eed60eso904409a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702679595; x=1703284395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6gE5MsrAaAORf3VjfmyHVqm+yqircqVcZWJ66dQBiE=;
        b=QkZDQojQk6A9L9l3cWRYGR1qatY/5VU/EU9itKdzrpdGNweSjsUAJ4w4r3UO6z2JJH
         hw6i+NovlT3+9L9u3lJw4Mo2FJ7Rt2TJyELi+7geMyB5SsMKWnDF8FjPMjMttg1wgIwP
         T0AVANG/JYpF4P1t/LIsxw/Wgx04S7IOqZ2tKtfO3usu8G7su/WacYaggF23QXysFcbM
         6d9oimAw3toUG6nQk6AduuAu5DiNayuKoLVHrW5PjfTps/y80VmFVLilCxgW0rrQsXxX
         z95plKcV7QIkKKAamMfqpOffB3lz4vW41vzNrwOe599XWGw9APGejBGYgmloVLNGLFss
         bzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702679595; x=1703284395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6gE5MsrAaAORf3VjfmyHVqm+yqircqVcZWJ66dQBiE=;
        b=H+lh4AN6Z7xB3l5q5EpHcwTBMKXlvK2iHkjRFCsZEUV5ve9SBrheWFgn+TLNaxgqo1
         RppkwkL6X7yIhvaWD0xEsT4f2Z38n+kM1cKESDSoflMhkraD8Gb5nmtoJziecwOq/o3c
         szSYf3V315t+vpMT1+THWKPiOR2v62/bF6M/8kLpcCWZ8I9T2anDvuEHtn30dzcazo6O
         SrRfcEqATBsktCKf+NmjBXFC9mEpFmM5LWUpqJcMck5GG8ivOKQ+X0O/3wVxPJQrbPFf
         Ka3Xxqjb8ZYPt8aXDmy1cVsppJeGWhSwAG3cRVUkkFl9PNWAPUQAX+XEYPAd5OifAbj4
         VCww==
X-Gm-Message-State: AOJu0Yy84KUr0KzvTF8TmkD2FS6SEXqhQw09w4wqqISpLJsbC1HKjZul
	1HxU2ccnGvTZ7yLyLhvVxIv2gg==
X-Google-Smtp-Source: AGHT+IHAjy/n+9LSsWcF/6bO2PqjY1xvSOY9SLi18Nb1Y+tenM+ZEAVFDierCTE97UZVs23EOm4Viw==
X-Received: by 2002:a9d:5603:0:b0:6d9:e8e6:d00c with SMTP id e3-20020a9d5603000000b006d9e8e6d00cmr10217426oti.40.1702679595243;
        Fri, 15 Dec 2023 14:33:15 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id x11-20020aa793ab000000b006ce497add69sm14013700pff.103.2023.12.15.14.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 14:33:14 -0800 (PST)
Date: Fri, 15 Dec 2023 14:33:12 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Subject: Re: [PATCH -fixes v2] riscv: Fix wrong usage of lm_alias() when
 splitting a huge linear mapping
Message-ID: <ZXzUKD95hmTPDbaq@ghost>
References: <20231212195400.128457-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231212195400.128457-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_143317_448123_864344AB 
X-CRM114-Status: GOOD (  19.47  )
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

On Tue, Dec 12, 2023 at 08:54:00PM +0100, Alexandre Ghiti wrote:
> lm_alias() can only be used on kernel mappings since it explicitly uses
> __pa_symbol(), so simply fix this by checking where the address belongs
> to before.
> 
> Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
> Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-riscv/000000000000620dd0060c02c5e1@google.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
> 
> Changes in v2:
> - Fix llvm warning about unitialized return value
> 
>  arch/riscv/mm/pageattr.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
> index fc5fc4f785c4..96cbda683936 100644
> --- a/arch/riscv/mm/pageattr.c
> +++ b/arch/riscv/mm/pageattr.c
> @@ -305,8 +305,13 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
>  				goto unlock;
>  		}
>  	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
> -		lm_start = (unsigned long)lm_alias(start);
> -		lm_end = (unsigned long)lm_alias(end);
> +		if (is_kernel_mapping(start)) {
> +			lm_start = (unsigned long)lm_alias(start);
> +			lm_end = (unsigned long)lm_alias(end);
> +		} else {
> +			lm_start = start;
> +			lm_end = end;
> +		}
>  
>  		ret = split_linear_mapping(lm_start, lm_end);
>  		if (ret)
> -- 
> 2.39.2

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

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
