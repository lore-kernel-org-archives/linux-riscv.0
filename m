Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B007FC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 06:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV2iY39chgUW+qn8uIpCDsmoFXuV0YCw3q6P6dhGz+s=; b=oryqSdxTsF9H1U
	UGgyA4WteILKCXQCvIp5kR8LwjxxIU+/oCuGQdj2Jgr8F80G2C4hVSrSIX6lOySAjHFzWTRGzRDkd
	DVxMQKM9yp5JnLwPUBUxEGPF/FxbvTWBs/gGJ8oezcLlonx2vZSM8WMFjUydy1OIcyxg51F83e+31
	T0S8Acp+aI5MPChTAlpkTNYVnZv3Z/wonAxAo9kvP0L0ziU70rd+sTecsIMAronPX1v1VFfJSsoYm
	QrGYVkHNuijWQp9nwAn84n60G828kUzHnOOdIZAj1+bwxHHGu2uOpHtTKuho2SZMXWLdLEF/Wqeea
	tMyfr6ApnG326+V2Nfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvAL-00000005Mgd-1m80;
	Thu, 06 Feb 2025 06:15:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvAI-00000005Mg7-3yUG
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 06:15:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2f833af7a09so700937a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 22:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738822506; x=1739427306; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TM79uKolxyBlDOrOyvuXpI1JGsS08omcZT8YRtNESMU=;
        b=16FKWfi43kEFoDDH0I2YIl5mfz1euqy6za5yeQp8X1OkTtSs5e4ml4FpYoZGP4bF1W
         /pRdsi7MmRoInGqz/5ysSIW5aTXrtGjtvih09XAR4wY6KjQwv6mRr1MB6SlSVzmu4jUl
         AiaG2Y3a2DvnuPnGe1jNDUicy6l7T9Z3LRIqEhm3Y7LHLsfHfkzH/yaDdjuSYsVcoKSi
         /AqC5ekzEwpXblb17ze5+WGg9gcxGTYae/v4yla/C72ZsJhA7ebCO8GX8JzGuMdFtMeV
         JL9tdOGth+91kX9sxt43GQxJdO+fHMNO40rdseBQXk88etwYtaQY9UQJHEaoezL5bi11
         TKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738822506; x=1739427306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TM79uKolxyBlDOrOyvuXpI1JGsS08omcZT8YRtNESMU=;
        b=tiUEfSF0qBYbdWwlC0R4tdwvFSDYMIuSEakqAq4HqajmqNByk4P4x0eWT8j5gktmWr
         PoHKEXfzRJUU9l5WZqZ0eOSK0SSQl7VOq5S28O0KtA/jL+eu7ldUcDcaS76j1xO7K0dS
         2gupxz40QGJH5O1GY9E7g0d6uqtLpS0whV6KFFIDu0rfSPfvcQfkE9Inb8F40jRX3woQ
         qQHY3+K2y47yFQmqyCCVSEZTnoGex7d2BBhpV7RM+N3CXq9pL26O4IhUjXNUfCCavlTe
         rt0D9oY1aiSB1C2r68hWYFH9pUZQ9emPVVVEkbzWg6/6x1p7XoRs9x2UhM9JZR4s9UbC
         AhHw==
X-Gm-Message-State: AOJu0Yy9mqeBBUR7wYMUoz6DlLEnf049Yi6RWh++U5vKikUoLl3ud6Pl
	zB3kd4hkIN+5/yamhK0gPCMv2iQaCCcvpeN3+pwFei3mvcNt0VlrP0rTm1jOXXY=
X-Gm-Gg: ASbGncvbAjWqm0rihdDZ2rsJ1pG2TUWM2bVSwhgmje6qZdFik7sB0kqWcAJqEeB9vdB
	qdSToLDyXnVUu/9t/lERVPwajyjfFeO1SXk6GUd6cMWTjF+TYcnVe0QGBTAOWDZDXqkgRzIHmsG
	kWHPxXpJTOOSf+tzRAGNF4EhZ+t3OttEwDGmT1JzhOkbrGR8y5BtoNJo49qz9oyi+RRi397aD0o
	kKwyGPjjVCfrvvX9yyunBmWlDRd1ysjSG17K2xUrL6J79vC1Jq553FSyVf7nKIsQB/zsHVPvlJX
	XKaeJw97+UUOxvNs/EnPCdfCu+iL6dLbXQ==
X-Google-Smtp-Source: AGHT+IHHI4Fk2RhahhWlcZopHqqsAq9Md4PgPbOPDMqDoa+6jQPlFXiqVIuLO/HcwrNxNClahIr3pQ==
X-Received: by 2002:a05:6a00:1d88:b0:71e:4930:162c with SMTP id d2e1a72fcca58-730350fe44amr8208242b3a.6.1738822505731;
        Wed, 05 Feb 2025 22:15:05 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad2604sm491635b3a.49.2025.02.05.22.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 22:15:05 -0800 (PST)
Date: Wed, 5 Feb 2025 22:15:03 -0800
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, alex@ghiti.fr,
	Charlie Jenkins <charlie@rivosinc.com>, Mr.Bossman075@gmail.com
Subject: Re: [PATCH v2 2/2] RISC-V: Use BIT_ULL(x) instead of 1ULL << x
Message-ID: <Z6RTZ9lVVP7iEWrh@tjeznach.ba.rivosinc.com>
References: <20250205204129.10639-1-palmer@rivosinc.com>
 <20250205204129.10639-3-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205204129.10639-3-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_221506_996114_98BA4A5C 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Feb 05, 2025 at 12:40:27PM -0800, Palmer Dabbelt wrote:
> There were a few of these outside hwprobe, so I figured it was easier to
> just clean them up too.
> 
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h       | 10 +++++-----
>  arch/riscv/include/asm/kasan.h     |  2 +-
>  tools/arch/riscv/include/asm/csr.h | 20 ++++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 6fed42e37705..181867da7fe3 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -221,15 +221,15 @@
>  
>  /* Smstateen bits */
>  #define SMSTATEEN0_AIA_IMSIC_SHIFT	58
> -#define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
> +#define SMSTATEEN0_AIA_IMSIC		BIT_ULL(SMSTATEEN0_AIA_IMSIC_SHIFT)
>  #define SMSTATEEN0_AIA_SHIFT		59
> -#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
> +#define SMSTATEEN0_AIA			BIT_ULL(SMSTATEEN0_AIA_SHIFT)
>  #define SMSTATEEN0_AIA_ISEL_SHIFT	60
> -#define SMSTATEEN0_AIA_ISEL		(_ULL(1) << SMSTATEEN0_AIA_ISEL_SHIFT)
> +#define SMSTATEEN0_AIA_ISEL		BIT_ULL(SMSTATEEN0_AIA_ISEL_SHIFT)
>  #define SMSTATEEN0_HSENVCFG_SHIFT	62
> -#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
> +#define SMSTATEEN0_HSENVCFG		BIT_ULL(SMSTATEEN0_HSENVCFG_SHIFT)
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
> -#define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +#define SMSTATEEN0_SSTATEEN0		BIT_ULL(SMSTATEEN0_SSTATEEN0_SHIFT)
>  
>  /* mseccfg bits */
>  #define MSECCFG_PMM			ENVCFG_PMM
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index e6a0071bdb56..70660f431f8f 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -25,7 +25,7 @@
>   */
>  #define KASAN_SHADOW_SCALE_SHIFT	3
>  
> -#define KASAN_SHADOW_SIZE	(UL(1) << ((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> +#define KASAN_SHADOW_SIZE	BIT_ULL((VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT)
>  /*
>   * Depending on the size of the virtual address space, the region may not be
>   * aligned on PGDIR_SIZE, so force its alignment to ease its population.
> diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
> index 0dfc09254f99..902d607c282e 100644
> --- a/tools/arch/riscv/include/asm/csr.h
> +++ b/tools/arch/riscv/include/asm/csr.h
> @@ -203,16 +203,16 @@
>  #define ENVCFG_FIOM			_AC(0x1, UL)
>  
>  /* Smstateen bits */
> -#define SMSTATEEN0_AIA_IMSIC_SHIFT	58
> -#define SMSTATEEN0_AIA_IMSIC		(_ULL(1) << SMSTATEEN0_AIA_IMSIC_SHIFT)
> -#define SMSTATEEN0_AIA_SHIFT		59
> -#define SMSTATEEN0_AIA			(_ULL(1) << SMSTATEEN0_AIA_SHIFT)
> -#define SMSTATEEN0_AIA_ISEL_SHIFT	60
> -#define SMSTATEEN0_AIA_ISEL		(_ULL(1) << SMSTATEEN0_AIA_ISEL_SHIFT)
> -#define SMSTATEEN0_HSENVCFG_SHIFT	62
> -#define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
> -#define SMSTATEEN0_SSTATEEN0_SHIFT	63
> -#define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +#define SMSTATEEN0_AIA_IMSIC_SHIFT	BIT_ULL(58)
> +#define SMSTATEEN0_AIA_IMSIC		BIT_ULL(SMSTATEEN0_AIA_IMSIC_SHIFT)
> +#define SMSTATEEN0_AIA_SHIFT		BIT_ULL(59)
> +#define SMSTATEEN0_AIA			BIT_ULL(SMSTATEEN0_AIA_SHIFT)
> +#define SMSTATEEN0_AIA_ISEL_SHIFT	BIT_ULL(60)
> +#define SMSTATEEN0_AIA_ISEL		BIT_ULL(SMSTATEEN0_AIA_ISEL_SHIFT)
> +#define SMSTATEEN0_HSENVCFG_SHIFT	BIT_ULL(62)
> +#define SMSTATEEN0_HSENVCFG		BIT_ULL(SMSTATEEN0_HSENVCFG_SHIFT)
> +#define SMSTATEEN0_SSTATEEN0_SHIFT	BIT_ULL(63)
> +#define SMSTATEEN0_SSTATEEN0		BIT_ULL(SMSTATEEN0_SSTATEEN0_SHIFT)
>

Do not wrap _SHIFT values with BIT_ULL(). Likely caused by too aggressive `sed //`.

best,
- Tomasz

>  /* symbolic CSR names: */
>  #define CSR_CYCLE		0xc00
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
