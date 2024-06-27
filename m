Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC1EC3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2wn7HfFqPOSXiYs/MGqbDqZ6ytmTbbwG4UsT7YcJHI=; b=3URIoyad0hyVBx
	2hmdgNB/OQQlIZGBfbj6LdmC2O4sKH0PLYoVW2pXRTDJXceDoVPfzTmsac62JI/XVeip5vlM2IIaE
	Nv7qIaIIMhLX2NqBaAV022hCSTRg370bv9ldNN33370u+O/TeRmG66b9ikQ7T0xG4Vk9PiSMeo5re
	vHYEp0oBt/GqRV57lIlZDJwyJSO1dhzIYqDDmpnWBVNMSG6k6Y6QC/w2brRoMUkwpvj4zurZS2naU
	jSR8fLlunNpAl8l56h/DjncaPP2tBS4FfF1bdK+5uVfphaT6Tzds73kCHHlHjgxRB55cXka1nY0LO
	ie2ik782SibZn0cnyxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpeM-0000000AY7V-2zR8;
	Thu, 27 Jun 2024 13:58:58 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpe6-0000000AY54-48WT
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 13:58:51 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so1838180a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719496721; x=1720101521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq5kitpL+DNnXu/D9/hs8Bp0/3waJ/uTRKdNkzKgHOY=;
        b=VCHUq8ca2MvJY9ytN/rA/MUNHSgaYmYEWeV5ZpBonugyhYsfN5CMLTU8yhCfzXB+z/
         4wLFlrxQXXOHlPJ1J2k1G7v+6gyH6xVrrAn1yzNdcwa7e16DnTorcnkZIe7karaj5erJ
         5kVhy+jHK3d9Jq+7UnUtX6bPqjI9in4D1vUC2EHQYSdcqgbtMJvhbHaGGvJmaybiSdvO
         vI+Aiyf5m2Z4VFVvZBCrKfDgquWKIHsZBuypIoQry+N9t1IRv5MuOK4nfZIP/dqsyifH
         TxXe6MLXWX/s7PPr0CI+3PvqE5FOitV2W/dpYCEUQUIuM4IB0RQy+nSQVOyJCevTygUB
         l16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719496721; x=1720101521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kq5kitpL+DNnXu/D9/hs8Bp0/3waJ/uTRKdNkzKgHOY=;
        b=W1G0wJdtQOikCCQzkMf6OnQrEy7BuchblCtkfS770zcsfXeEGFi7FUYf+/ncteYA4P
         ajUtHi3IHCUqtqInkty2cCjZo1nvL6FE5mTMbPiE46w20qNNSqERYBZHh7EOnTgOj/cD
         D3Qz/ggbQ3kuq/sRnkQ5WPaW0pltPhXP8Nd+p746IA7h8sUXwx7kwDpI6ELHY5A3I1To
         z3LP/cfcG05i1/mvg5rd39n65fBjx7WQz0Z7sh1ver5fo51dkfmVWBaL+QGs8fr5Cnil
         YhBi7s0iSzrD38iIlPQcrVBPNi/qJ3TKabe8CAoZ18WQGkRpnHhi7fq3nJUZFTIMXPC+
         lUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPzN6RyL6RbaKFfp3kqvjYsXke3INsKL2DGY3297e22kZVzeHXYDBohr+qazi1SENbPjvC9KHclOX7mkfZJmlTlE/caAVccLj5C90n7Cg6
X-Gm-Message-State: AOJu0YwebrjUA9FnAsYCNxSnWdcx2UIVxq9FRMokO5+VJPm3znEGOAdQ
	SsmXE5TveQBYjnPyotI+dczTRXVnP3dDNq/XtVfb/gCB/2CyoF7e
X-Google-Smtp-Source: AGHT+IHvyluvD0SP5UIJpy0mzv9Rb/yj78D4vKm/kObn4l7XWRh5tCnb+ua1oj/MkdIB7mBGiA7dTQ==
X-Received: by 2002:a17:906:48d0:b0:a69:13a2:4f6e with SMTP id a640c23a62f3a-a7245c70519mr687906566b.74.1719496720885;
        Thu, 27 Jun 2024 06:58:40 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7c9628sm61491866b.202.2024.06.27.06.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:58:40 -0700 (PDT)
Date: Thu, 27 Jun 2024 15:58:36 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, Andrea Parri <andrea@rivosinc.com>
Subject: Re: [PATCH v2 07/10] riscv: Improve amoswap.X use in xchg()
Message-ID: <Zn1wDAXjBdJu48Oi@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-8-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-8-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_065845_518655_FFE814CA 
X-CRM114-Status: GOOD (  15.87  )
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

On Wed, Jun 26, 2024 at 03:03:44PM +0200, Alexandre Ghiti wrote:
> xchg() uses amoswap.X instructions from Zabha but still uses
> the LR/SC acquire/release semantics which require barriers.
> 
> Let's improve that by using proper amoswap acquire/release semantics in
> order to avoid any of those barriers.
> 
> Suggested-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 35 +++++++++++++-------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index eb35e2d30a97..0e57d5fbf227 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -11,8 +11,8 @@
>  #include <asm/fence.h>
>  #include <asm/alternative.h>
>  
> -#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,	\
> -			   swap_append, r, p, n)			\
> +#define __arch_xchg_masked(sc_sfx, swap_sfx, sc_prepend, sc_append,	\
> +			   r, p, n)					\
>  ({									\
>  	__label__ zabha, end;						\
>  									\
> @@ -31,7 +31,7 @@
>  	ulong __rc;							\
>  									\
>  	__asm__ __volatile__ (						\
> -	       prepend							\
> +	       sc_prepend							\
>  	       "0:	lr.w %0, %2\n"					\
>  	       "	and  %1, %0, %z4\n"				\
>  	       "	or   %1, %1, %z3\n"				\
> @@ -48,9 +48,7 @@
>  zabha:									\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>  		__asm__ __volatile__ (					\
> -			prepend						\
>  			"	amoswap" swap_sfx " %0, %z2, %1\n"	\
> -			swap_append						\
>  			: "=&r" (r), "+A" (*(p))			\
>  			: "rJ" (n)					\
>  			: "memory");					\
> @@ -58,19 +56,17 @@ zabha:									\
>  end:;									\
>  })
>  
> -#define __arch_xchg(sfx, prepend, append, r, p, n)			\
> +#define __arch_xchg(sfx, r, p, n)					\
>  ({									\
>  	__asm__ __volatile__ (						\
> -		prepend							\
>  		"	amoswap" sfx " %0, %2, %1\n"			\
> -		append							\
>  		: "=r" (r), "+A" (*(p))					\
>  		: "r" (n)						\
>  		: "memory");						\
>  })
>  
> -#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
> -		   sc_append, swap_append)				\
> +#define _arch_xchg(ptr, new, sc_sfx, swap_sfx,				\
> +		   sc_prepend, sc_append)				\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __new = (new);				\
> @@ -79,21 +75,19 @@ end:;									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
>  		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
> -				   prepend, sc_append, swap_append,	\
> +				   sc_prepend, sc_append,		\
>  				   __ret, __ptr, __new);		\
>  		break;							\
>  	case 2:								\
>  		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
> -				   prepend, sc_append, swap_append,	\
> +				   sc_prepend, sc_append,		\
>  				   __ret, __ptr, __new);		\
>  		break;							\
>  	case 4:								\
> -		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
> -			      __ret, __ptr, __new);			\
> +		__arch_xchg(".w" swap_sfx,  __ret, __ptr, __new);	\
>  		break;							\
>  	case 8:								\
> -		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
> -			      __ret, __ptr, __new);			\
> +		__arch_xchg(".d" swap_sfx,  __ret, __ptr, __new);	\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
> @@ -102,17 +96,16 @@ end:;									\
>  })
>  
>  #define arch_xchg_relaxed(ptr, x)					\
> -	_arch_xchg(ptr, x, "", "", "", "", "")
> +	_arch_xchg(ptr, x, "", "", "", "")
>  
>  #define arch_xchg_acquire(ptr, x)					\
> -	_arch_xchg(ptr, x, "", "", "",					\
> -		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
> +	_arch_xchg(ptr, x, "", ".aq", "", RISCV_ACQUIRE_BARRIER)
>  
>  #define arch_xchg_release(ptr, x)					\
> -	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
> +	_arch_xchg(ptr, x, "", ".rl", RISCV_RELEASE_BARRIER, "")
>  
>  #define arch_xchg(ptr, x)						\
> -	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
> +	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER)

I actually see no reason for this patch, please see also my remarks
/question on patch #4.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
