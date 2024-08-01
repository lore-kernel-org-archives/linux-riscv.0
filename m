Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188A8C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 01:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+Bb6ZjWkzbHGOT5ZtyqiMAivmNxBZVWiSlV/me4SJg=; b=aSIPxL3bMcAxPt
	Ougy9yfx+SkwWcb7wWpKJaFR0OxmqvwhEffsFEtAy3V3f9F+7Opy4Kg8XGflRS8XeUs+5Hd+TR/xa
	8Lc7zZ9FwTKQmr8MOJyGCU8LHZgDINYK41qjYSYbvfKhXkrz4t++f7GDleoSDVSnVPWZoh1w93DRn
	BAAUSXGmgjrJLp4n78KXCdXkdX7+6y15HonEPO4gKG9YmghfYm8tWNnE4PvXqCu13udKkxd5Hi3o0
	heEjWgoAIYndO4Xy8uFFZ1jczaRYDNqey80GSvmY9VoG5rJXOoGwbQy26FrQ+aE/V+MgFEjADk58U
	bSsyprJXtm1p7heo3r7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKZW-00000003Dq4-1juI;
	Thu, 01 Aug 2024 01:25:38 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZKYj-00000003DhX-18yU
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 01:25:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fd78c165eeso55637205ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 18:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722475488; x=1723080288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SqRMogXeetDsxVWaHMdgtrMfJcNtziw3WUUBNleIBpE=;
        b=sWCzxq6lXX3DQ83G/1PyUbXhrwo3hKBQyzAOvsKVImE6IAUDsOFYpannqk9KVPLfYo
         K45rqmsY/9rhgVALzfn2qt1/VVefOiRJ2hq4f2dXF40FjAehiml1lTXml02y9exI6ehz
         DY+9FYS077G+l/TjgsDFgU8qz7l0kzdVcCM0Q61V0OKBvi155pwKWSYY88J59gZimiHW
         bT/qxnV8L7pWPWRfbTfNDMJkX4cD/02j1P0X6hJljHtKFclAlkwpapqE9FCnHJCSL852
         yKQt2JNICam8Jq8TNeWuM/o5OS9I/mH45J85q5KHB3vBbFKAANxgUygYjPMbC0MxN6C0
         +viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722475488; x=1723080288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqRMogXeetDsxVWaHMdgtrMfJcNtziw3WUUBNleIBpE=;
        b=Uf7S+8UtD2Eo5jXDdA9oxo835csqF1Rpp2QP+lY8fUnWIzMJaJD8iyVujGWXJ2zMbQ
         2tGRvtj1yKMYJ9rchoXGivk8RCnDl3fZEuLvg+U2Kp6Sak++nulIWTc67KsqfuWrmYUd
         59Np2arwpSot/teMDzCeX62ZahYFHoeceRn9ZYC4OCHcbFRxy7Q7uDo8fNS9vdfQVxr2
         jiFUiI6ZQJmcodw+BTeyCdeq0uURfiLzdt9MrXaB38Wmj59zprEdffMLrTYRG3A9cBms
         SIDYhp9XFkGtcnU42NsJuXAp98JylODKuuAbDQ9nvR3eUaiZ0s3HkKXjFLkHHcnbflOp
         Yx4w==
X-Gm-Message-State: AOJu0YwJZkcY2y24Y6aZuFakheee/pFJuhVWOUTiETDBPNjV/CFg1CR6
	Y+JZOd72GbnzzrclUpDdBS491q9yzTIPDoEKMrzq+lwPRaG28jqF2ANLggw3p6gv8tlXiwWl+yQ
	O
X-Google-Smtp-Source: AGHT+IGAfFV8HFo0gsx9gnLUfRBYcxRzGKeFcFENxL9QSZBNbO/NCU4E2dZQv4sau3nkSuJ3569wxg==
X-Received: by 2002:a17:902:d4cf:b0:1fc:287f:628 with SMTP id d9443c01a7336-1ff4d21528emr13974225ad.53.1722475488092;
        Wed, 31 Jul 2024 18:24:48 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d25fafsm126268555ad.108.2024.07.31.18.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 18:24:47 -0700 (PDT)
Date: Wed, 31 Jul 2024 18:24:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
Message-ID: <Zqrj3Snhh3mJdU/a@ghost>
References: <20240731162159.9235-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731162159.9235-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_182449_336772_EB212CE5 
X-CRM114-Status: GOOD (  25.66  )
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

On Wed, Jul 31, 2024 at 09:22:00AM -0700, Palmer Dabbelt wrote:
> I recently ended up with a warning on some compilers along the lines of
> 
>       CC      kernel/resource.o
>     In file included from include/linux/ioport.h:16,
>                      from kernel/resource.c:15:
>     kernel/resource.c: In function 'gfr_start':
>     include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>        49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>           |                                     ^
>     include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>        52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>           |         ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>       161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>           |                           ^~~~~~~~~~
>     kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
>      1829 |                 end = min_t(resource_size_t, base->end,
>           |                       ^~~~~
>     kernel/resource.c: In function 'gfr_continue':
>     include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>        49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>           |                                     ^
>     include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>        52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>           |         ^~~~~~~~~~~~~~~~~
>     include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>       161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>           |                           ^~~~~~~~~~
>     kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
>      1847 |                addr <= min_t(resource_size_t, base->end,
>           |                        ^~~~~
>     cc1: all warnings being treated as errors
> 
> which looks like a real problem: our phys_addr_t is only 32 bits now, so
> having 34-bit masks is just going to result in overflows.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This is sort of a v2 of
> https://lore.kernel.org/r/20240729151652.15063-2-palmer@rivosinc.com,
> but I think that was just bogus.
> ---
>  arch/riscv/include/asm/sparsemem.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
> index 63acaecc3374..2f901a410586 100644
> --- a/arch/riscv/include/asm/sparsemem.h
> +++ b/arch/riscv/include/asm/sparsemem.h
> @@ -7,7 +7,7 @@
>  #ifdef CONFIG_64BIT
>  #define MAX_PHYSMEM_BITS	56
>  #else
> -#define MAX_PHYSMEM_BITS	34

I was trying to figure out why this was set to 34. It looks like that
comes from this patch (which heavily changed over the course of review)
[1] and the following text:

"On the Sifive hardware this allows us to provide struct pages for
the lower I/O TileLink address ranges, the 32-bit and 34-bit DRAM areas
and 172GB of 240GB of the high I/O TileLink region. Once we progress to
Sv48 we should be able to cover all the available memory regions."

Seems like the max should be 32 though so:

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

Link: https://lore.kernel.org/all/20190327213643.23789-4-logang@deltatee.com/ [1]


> +#define MAX_PHYSMEM_BITS	32
>  #endif /* CONFIG_64BIT */
>  #define SECTION_SIZE_BITS	27
>  #endif /* CONFIG_SPARSEMEM */
> -- 
> 2.45.2
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
