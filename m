Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4889C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 19:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQ/o6h/NlrGJ8fg5GdPPY6oU5loshCgReqoPesKjnPY=; b=MIy+Ve5dN5buBZ
	5BIgY1vDrPrxtu1iMaq29lk4jkWEoTZHeG+3kbMqJv/I9V6DF/aPKcFS0Zm+mm7QsjqvzR264Od3f
	WejTVkKwUvoimeeMcWpJartS6Ugx4kTH3dtBRTtsj85Yh6VyFFi9Wr2vT/jOlUcJfsosAc7GZ4wzK
	a66snUXukC+qf5XuTDOQ5IIghIjmiaCnyC9WlmeXGMxOqnXhbOhuP3zltMDJPePsCydXjTdjUNvY4
	xOfWqjI1QKPd1LspRzNJTgbWTeC77dihcJij6t9eK7b9aovY4Vtwv3hFGgIdW6h828Zi1LcO+xCjj
	wr4i9Jp/ZrhS3vJJFOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTnv-00F8EN-34;
	Thu, 04 Jan 2024 19:54:59 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTns-00F8Dd-1g
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 19:54:58 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-42782601608so4060301cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 11:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704398095; x=1705002895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dn8vRr4qHHYrzVumxZ4mBTr1b1gKVQEBFS3/J0er3M=;
        b=iUkGkceO7CKCymvbWr8zQTEb52APLI0QOOvKw0v0U/n1/1qwRQyUViJdYwuGGiHn1I
         Sr+QvzcougANUY0A8KAcKDu9wbLfq20wXb4ZtNc2Z0+WRcA5Z4awHl6K26aHuNdwk+7T
         CQiu27uDn8ZiXxkCUVdnyqQSrNXvLFx9f09mZk754l3BxYKv1FhZJtN4M222vdmhcFla
         eywvajXXwXZTb66NlYDGUHXVHD63vQqW9dncZ9H2q6ntj8dYTkrwmRw4quMBqdanLVs8
         shEmCD/PwsfM/QUWhS1aLdFLwtRkHjhnEbQ8bwKK+XyYEn4TF6gPaxXAYNaHWUboMAfe
         29Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704398095; x=1705002895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dn8vRr4qHHYrzVumxZ4mBTr1b1gKVQEBFS3/J0er3M=;
        b=dTKoPEoe3/z4RR/myUmz8PThNZ8laVENlpSUhATYI513tDx7USGN0iF4Mw42eaYAdi
         jjqAN5YL6InbYVxxPWb3hJNyXGOGEqj+HDjJgKluy0pMUS5LWRMqcc1/qFPmSyIhQSfb
         /uGG/gBCkbDrPaoJnRx1I0X4eXIZEowMRPBDKVG1EV3FvZRdzECbX26rvL/+4MHlOxSw
         ecGMxavg9DUWO4x/YMqbYicmVSc26e5RSAQZhi8SWIReoWSka67XtD3seivwFo42pg4s
         NvNdMGFddzxOdmSj5bBw90ajwj48V4VQQeVKbc3y90nV/jBZPO94tVe5AI3gtgapdj3P
         nJzA==
X-Gm-Message-State: AOJu0YzveDrSSzs2A34PiG/jKHd6F0Yq7lhfBbmTY9UwBEHHFc0EeGiI
	TzKSy9R6HYvxTFX4rPtjsrU=
X-Google-Smtp-Source: AGHT+IEWMHx0NRm7Ofa64/ajW0gGqYNY7Y6W6RYK4KQsQdXRbMrhRDOEadMtMmC/laUz9klEtQWoDw==
X-Received: by 2002:ac8:7c41:0:b0:427:921b:af98 with SMTP id o1-20020ac87c41000000b00427921baf98mr1028926qtv.87.1704398095086;
        Thu, 04 Jan 2024 11:54:55 -0800 (PST)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id ch11-20020a05622a40cb00b00427f42aadedsm83600qtb.9.2024.01.04.11.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 11:54:54 -0800 (PST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailauth.nyi.internal (Postfix) with ESMTP id 3963627C0061;
	Thu,  4 Jan 2024 14:54:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 04 Jan 2024 14:54:54 -0500
X-ME-Sender: <xms:DQ2XZTDzS5thTNXjEKrfzfJhX35F7PPnf4vXzWcPdkh35FrVQWHB2Q>
    <xme:DQ2XZZjHCXRCc7nfUbY8_wK-Bvv-AG74S-TfzjrhtWCq4Kfv0dcuHWJUNv7Mq2hA0
    FvNnqM7IH3qZOoPWQ>
X-ME-Received: <xmr:DQ2XZenj_PiyQ1VpdiR7_S5IXD_h_ysh6NWCI9E3xgCstt_LDvN3gYIZE3PZRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgudefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedt
    vdetvedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:DQ2XZVzMH6ZLMegFt4GezmnCpl629CH-eTpGspGqGQYZUPdwbgqsog>
    <xmx:DQ2XZYRvOLYOoRZYBTARSPn0KI7_mvVfz6lnIP65QnForzD5RNCWLg>
    <xmx:DQ2XZYavzhA0IZvlMI2u-XYUjvz10-XMat_XwjkmB2zaIrKzyCR6Lg>
    <xmx:Dg2XZaC0dV71R6kpcGpdIe8DJZnWMDUYsozFrkNYhKE5BMVu5hiUgg>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 14:54:52 -0500 (EST)
Date: Thu, 4 Jan 2024 11:53:45 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
Message-ID: <ZZcMycoHUqzBmGFs@boqun-archlinux>
References: <20240103163203.72768-2-leobras@redhat.com>
 <20240103163203.72768-3-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103163203.72768-3-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_115456_584225_66539CB3 
X-CRM114-Status: GOOD (  20.11  )
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

On Wed, Jan 03, 2024 at 01:31:59PM -0300, Leonardo Bras wrote:
> In this header every xchg define (_relaxed, _acquire, _release, vanilla)
> contain it's own asm file, both for 4-byte variables an 8-byte variables,
> on a total of 8 versions of mostly the same asm.
> 
> This is usually bad, as it means any change may be done in up to 8
> different places.
> 
> Unify those versions by creating a new define with enough parameters to
> generate any version of the previous 8.
> 
> Then unify the result under a more general define, and simplify
> arch_xchg* generation.
> 
> (This did not cause any change in generated asm)
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> Tested-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 138 ++++++-------------------------
>  1 file changed, 23 insertions(+), 115 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 2f4726d3cfcc2..48478a8eecee7 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -11,140 +11,48 @@
>  #include <asm/barrier.h>
>  #include <asm/fence.h>
>  
> -#define __xchg_relaxed(ptr, new, size)					\
> +#define __arch_xchg(sfx, prepend, append, r, p, n)			\
>  ({									\
> -	__typeof__(ptr) __ptr = (ptr);					\
> -	__typeof__(new) __new = (new);					\
> -	__typeof__(*(ptr)) __ret;					\
> -	switch (size) {							\
> -	case 4:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.w %0, %2, %1\n"			\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\

Hmm... actually xchg_relaxed() doesn't need to be a barrier(), so the
"memory" clobber here is not needed here. Of course, it's out of the
scope of this series, but I'm curious to see what would happen if we
remove the "memory" clobber _relaxed() ;-)

Regards,
Boqun

> -		break;							\
> -	case 8:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.d %0, %2, %1\n"			\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> -		break;							\
> -	default:							\
> -		BUILD_BUG();						\
> -	}								\
> -	__ret;								\
> -})
> -
> -#define arch_xchg_relaxed(ptr, x)					\
> -({									\
> -	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> -					    _x_, sizeof(*(ptr)));	\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"	amoswap" sfx " %0, %2, %1\n"			\
> +		append							\
> +		: "=r" (r), "+A" (*(p))					\
> +		: "r" (n)						\
> +		: "memory");						\
>  })
>  
> -#define __xchg_acquire(ptr, new, size)					\
> +#define _arch_xchg(ptr, new, sfx, prepend, append)			\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
> -	__typeof__(new) __new = (new);					\
> -	__typeof__(*(ptr)) __ret;					\
> -	switch (size) {							\
> +	__typeof__(*(__ptr)) __new = (new);				\
> +	__typeof__(*(__ptr)) __ret;					\
> +	switch (sizeof(*__ptr)) {					\
>  	case 4:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.w %0, %2, %1\n"			\
> -			RISCV_ACQUIRE_BARRIER				\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> +		__arch_xchg(".w" sfx, prepend, append,			\
> +			      __ret, __ptr, __new);			\
>  		break;							\
>  	case 8:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.d %0, %2, %1\n"			\
> -			RISCV_ACQUIRE_BARRIER				\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> +		__arch_xchg(".d" sfx, prepend, append,			\
> +			      __ret, __ptr, __new);			\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
>  	}								\
> -	__ret;								\
> +	(__typeof__(*(__ptr)))__ret;					\
>  })
>  
> -#define arch_xchg_acquire(ptr, x)					\
> -({									\
> -	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
> -					    _x_, sizeof(*(ptr)));	\
> -})
> +#define arch_xchg_relaxed(ptr, x)					\
> +	_arch_xchg(ptr, x, "", "", "")
>  
> -#define __xchg_release(ptr, new, size)					\
> -({									\
> -	__typeof__(ptr) __ptr = (ptr);					\
> -	__typeof__(new) __new = (new);					\
> -	__typeof__(*(ptr)) __ret;					\
> -	switch (size) {							\
> -	case 4:								\
> -		__asm__ __volatile__ (					\
> -			RISCV_RELEASE_BARRIER				\
> -			"	amoswap.w %0, %2, %1\n"			\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> -		break;							\
> -	case 8:								\
> -		__asm__ __volatile__ (					\
> -			RISCV_RELEASE_BARRIER				\
> -			"	amoswap.d %0, %2, %1\n"			\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> -		break;							\
> -	default:							\
> -		BUILD_BUG();						\
> -	}								\
> -	__ret;								\
> -})
> +#define arch_xchg_acquire(ptr, x)					\
> +	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
>  
>  #define arch_xchg_release(ptr, x)					\
> -({									\
> -	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __xchg_release((ptr),			\
> -					    _x_, sizeof(*(ptr)));	\
> -})
> -
> -#define __arch_xchg(ptr, new, size)					\
> -({									\
> -	__typeof__(ptr) __ptr = (ptr);					\
> -	__typeof__(new) __new = (new);					\
> -	__typeof__(*(ptr)) __ret;					\
> -	switch (size) {							\
> -	case 4:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.w.aqrl %0, %2, %1\n"		\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> -		break;							\
> -	case 8:								\
> -		__asm__ __volatile__ (					\
> -			"	amoswap.d.aqrl %0, %2, %1\n"		\
> -			: "=r" (__ret), "+A" (*__ptr)			\
> -			: "r" (__new)					\
> -			: "memory");					\
> -		break;							\
> -	default:							\
> -		BUILD_BUG();						\
> -	}								\
> -	__ret;								\
> -})
> +	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
>  
>  #define arch_xchg(ptr, x)						\
> -({									\
> -	__typeof__(*(ptr)) _x_ = (x);					\
> -	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
> -})
> +	_arch_xchg(ptr, x, ".aqrl", "", "")
>  
>  #define xchg32(ptr, x)							\
>  ({									\
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
