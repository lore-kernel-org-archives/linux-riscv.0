Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAC5C7EE33
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLBA43hYTUISuGFnYik79+6NJYexzlfLGXZ7Gm50EWk=; b=vyuHjTXHUbwy0v
	CWw0yPDPGRHcwDSnF6aPaABJwrUpt9PyQZJkExPagwk2f6NC3ZdGwN8CHC+0cqFKsDEbf8msQKoxx
	blQWrennJn04X31gO8u+P1NjKtjMn6A23Nw9U3ic203omr5eUd9vLmZVEBhT4d/rdoD0K1jkULzEp
	n3J/QNh21WgwTrqJicAwKDvEAwIqByasSNh0nVO8LwvHrZJqOOKYZNfx7QNUEPlg2ZRi+kT6veBjW
	5+mSllpq+BnPNCygpZukNR7hMzEG7ktsHpFZlJcueEo89Q0QNHrCd6ku3T62T0S0QJw7wQwtr6BSw
	+7eWD+vd0K+cVgU5oEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjFS-0000000BCBR-2Nee;
	Thu, 26 Jun 2025 09:50:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUinC-0000000B7c8-0sPq
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 09:21:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-453647147c6so7921575e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750929672; x=1751534472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=abzh1NTk7KCeGul2ZPzds8KEdyGo8xG8p1Ejzl7E3xnF5woJpRqaClcT8nlZAXIgFR
         1bjc1HECjklYjcYO00591toG6Yu8/1dZCGIrOVkX1Sl6rEzEhdTuhoxvYKjMOMcLtVfi
         IR7oSSTS/IMtv0MlPGVozsY1JYBbMHkvj7syYEDwrf1aGlwfndfcVcOO9A8X8nFH5KoB
         NztlATlcKcD3BgERANtMavnPIAQspGzaPc8VhPZPzKmrMDZD1eUqT8Kju94qoc6VfwBN
         v8/Rv2BKBZlu86CtFlNGH88ELIkitP3eAzsAyai5hcDEDk2M55GijM5DvJxnQibAolrd
         UReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929672; x=1751534472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l110quEZgWrA+tUVqx7bwejOA2gGYkFrBUl+v3tOblQ=;
        b=d97KfgREBHOvH6nn0U6ekaAly8+3BEuSZPNNVGKlRLuoe40Ni2BQM6jmWeUFFbxpf5
         WFxT1O9x1hFTUcd+Fq/+FiCHoayj2J9MFF7HCcT0Vz1oust0sh96Cdq23/U+rbQwCPag
         fZvqbNFg2uApw2eeUuEsW8MlXzJbvwDpoR8gZsyb9F3KbcVcmAYwtrsTPKfg/RBCutTI
         sSI3P6WjGR+GFyveXrVhJf7C8yZeBuh5UK7jL+3OfO9vgGaC4LXiW5oc2aJgVfW+9ywJ
         dia4+tvH4Qcd69JmOlqi88JpMRochogeHTo+FRFpfmN85lSbsCtK9uB0j06V2WezFZs1
         fprQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5VZk2aYDwwZaoITGAeZ0FOnvauuiAErW/PRDbnuk6Y0yIKJw7WbNCgmURF5JewdXGsy3ITIdexxF4cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrA7OyXv7Ogoa2gnGXu57xi4ITrY3pKunXKPA567qwvSriQ1aQ
	AHbM8D730wSM0Liexz/iJcXtekZ6QCbfxRfpdAq9XVN+4HeAJAx07EVcuCAaUEtPENU=
X-Gm-Gg: ASbGncuKU1t8Byy/v30bxehgEpeZnGj9VBTzNViEOoRvfjuUJ7lTl0zMjVkmArImiMF
	EfiaygDhCIECeFPGKmqKglpL7rgEOCKUY4uvw/ZqUt9bMnxnRD1a0wMR3RMg1IlCqmzBQS9icKc
	crR6BlPG9Y2jxXl5MBWOF19R3nWZzl4ShfX3BJ1FQslphzY5P2d/WhXf4g2IEspIfGy2+KAzaS8
	NlU7CXHGbvExoRvBY5hjRK9j7f23iaSrgcVbi5UmN2HN2Nyt/I49h4dqzz0x6oUGdGp+A993pHt
	5gqXEUKInrLsd9TLnaVF0GAzVdJzFvvij3SslJmZUP67eN07Kw==
X-Google-Smtp-Source: AGHT+IHeq7BmdkNC1QZmLNEvB/p5lyP1vBsXS+C4YxORLxnk7NCsQMhF/36QZ4+0Ss1Q61RwIEK+Ag==
X-Received: by 2002:a05:600c:a44:b0:453:9b7:c214 with SMTP id 5b1f17b1804b1-45381b2155cmr60602115e9.29.1750929672028;
        Thu, 26 Jun 2025 02:21:12 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe587sm13667895e9.19.2025.06.26.02.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:21:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 11:21:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-a1aca9887bbf5410741e17c4@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_022114_246946_429601ED 
X-CRM114-Status: GOOD (  22.71  )
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

On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> 
> Use the hwprobe syscall to decide which PAUSE instruction to execute in
> userspace code.
> 
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -4,26 +4,33 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +#include <asm/hwprobe.h>
> +#include <sys/hwprobe.h>
> +#include <asm/vendor/mips.h>
>  #include <asm-generic/barrier.h>
>  
>  static inline void cpu_relax(void)
>  {
> +	struct riscv_hwprobe pair;
> +	bool has_mipspause;
>  #ifdef __riscv_muldiv
>  	int dummy;
>  	/* In lieu of a halt instruction, induce a long-latency stall. */
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
>  #endif
>  
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> -	/*
> -	 * Reduce instruction retirement.
> -	 * This assumes the PC changes.
> -	 */
> -	__asm__ __volatile__ ("pause");
> -#else
> -	/* Encoding of the pause instruction */
> -	__asm__ __volatile__ (".4byte 0x100000F");
> -#endif
> +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> +
> +	if (has_mipspause) {
> +		/* Encoding of the mips pause instruction */
> +		__asm__ __volatile__(".4byte 0x00501013");
> +	} else {
> +		/* Encoding of the pause instruction */
> +		__asm__ __volatile__(".4byte 0x100000F");
> +	}
> +

cpu_relax() is used in places where we cannot afford the overhead nor call
arbitrary functions which may take locks, etc. We've even had trouble
using a static key here in the past since this is inlined and it bloated
the size too much. You'll need to use ALTERNATIVE().

Thanks,
drew


>  	barrier();
>  }
>  
> 
> -- 
> 2.34.1
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
