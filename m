Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C850C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRhN7Er4OeL4DlQztx1Acxaz8m0TPBSDPF3XcSWDez4=; b=krzPanpnau/VkV
	3aZnlFXNOmYnz5eWaZ+X413OG5v7Gbyz5yVD2tznGnIAKFcA0cCO9P3NTvzGgLITyyKN6IXdkmdg2
	Zej7Hp4mHhL8iKYRTQ97l+/dMQ1wOUCsHOE4fEsYAJJOMWSiWK2eAHPjhqUoK/8DLeyuSfB/6Py6M
	lJUkkV0bmzvDgRhC/DXet0lIBKKk6vspD39Y5wmaCeEKJUoJorO88J2a2URoK0QwgFUGP+qghEXLE
	exsJcVvwsFf6b3FeIAWIX+cAnuc/yEzHqXnKrFwMNTQuL5/ncW5fwN5BBxyPbGuzpFs5Xc5X4SoTK
	5fRxTrUijRZSQqbrNXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmI0-00000009IAz-33Cw;
	Wed, 21 Aug 2024 14:26:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgmHx-00000009I9B-2KtR
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 14:26:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-371a6fcd863so2901395f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724250376; x=1724855176; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrIMYX5Iitm0qRfXTFPY5P6XAicIDodU2yRwqwdOg/Y=;
        b=Bb9kFOxx18VOyxtaXhpm4ILLoQ4zTEW2IwaI4wPEoY20FXv7SJ1isFCckXx+4L/A/K
         jwCdCD8/UgqdITWo+b7aE1wvzXVfGBZv2LEbrfVwVFq9kVBuDTvRWwPLAjjA0gPGrUmA
         7Eq1oQuNlfINe/rqB0LL6iIPDze85e6/Encx5tPufsHf0VeteI8C1KFPMRXvcW0hWVvs
         PibSLUye3wvs5dYd1nR5Gipzx0JuyvnZvqlKpH1CusWnHZahBeUTlXl0CMCFKQCUPLhe
         mHaBx2ImkZCo2iBvPgkZXH6lFXBUPF0fz+5iLhk6zLX8tKH5KBJaY31130GI2E/VRVeL
         LLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724250376; x=1724855176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrIMYX5Iitm0qRfXTFPY5P6XAicIDodU2yRwqwdOg/Y=;
        b=X/KcB0ahiWmnk6zJtKj0a+PEQJ88G2IKM1H6JoyMlTEtG/3DBQR9yiO9J6uzv1jyRI
         dAGlZ+Yakg/JxNNr6YrNesdDU4vxYEJ0Et3CJpBKpt/p9NKsWyBVfpgbRjZpLc0FI8/F
         vstb9ZWOR3ViyGYcd3zcqyWOF/g3MpmRxilyMvkU6VvuodK36ARfJgjvQycIbtlP1i58
         iL6bkFhczf0OU4CB1rGst2w9RtCqwh9X95mHTPimqxRNH2jtNLyt9C+EjjF/x0yfD5Um
         EEllFSbMLpmaVH9Xhv1HBpeY3ToAa8TN1H+QSnV+P6tJOSPJFOE6j/pCVcw3mzOXxgvi
         uOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwSz07qGURXwWBx6cgf/4WL+aPxqgK3ir8nktZrrH7Xh+bOCanhVjVfgn1ZAG9JYEOjsWAIo2WJei4GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgDNn6687dIJNyXwRQtznGlBAu3eDmOFhT32iRbYF4qVEUhfoy
	6YjFGk1ziuME76+yV7azsK3K7BCSWEZvuwd+1pyio4xDeHOsSm1y8sYKKCHtCwo9kSQ/5QUukxz
	q8V4=
X-Google-Smtp-Source: AGHT+IFBp+F6BpmW+3C9l9vVnrfI4oNMEkRJT5vJDxgLRdcLaekCgZetIKmjR+7etclQht7wUwu4kQ==
X-Received: by 2002:a05:6000:196b:b0:371:87d4:8f1d with SMTP id ffacd0b85a97d-372fd6da3ebmr1649160f8f.28.1724250375016;
        Wed, 21 Aug 2024 07:26:15 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189857069sm15832388f8f.47.2024.08.21.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 07:26:14 -0700 (PDT)
Date: Wed, 21 Aug 2024 16:26:13 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, Andrea Parri <andrea@rivosinc.com>
Subject: Re: [PATCH v5 06/13] riscv: Improve zacas fully-ordered cmpxchg()
Message-ID: <20240821-810273dbc0f3fc92a67d395f@orel>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
 <20240818063538.6651-7-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818063538.6651-7-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_072617_611234_0B774EB0 
X-CRM114-Status: GOOD (  20.93  )
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

On Sun, Aug 18, 2024 at 08:35:31AM GMT, Alexandre Ghiti wrote:
> The current fully-ordered cmpxchgXX() implementation results in:
> 
>   amocas.X.rl     a5,a4,(s1)
>   fence           rw,rw
> 
> This provides enough sync but we can actually use the following better
> mapping instead:
> 
>   amocas.X.aqrl   a5,a4,(s1)
> 
> Suggested-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 92 ++++++++++++++++++++++----------
>  1 file changed, 64 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 1f4cd12e4664..5b2f95f7f310 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -107,8 +107,10 @@
>   * store NEW in MEM.  Return the initial value in MEM.  Success is
>   * indicated by comparing RETURN with OLD.
>   */
> -
> -#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
> +			      sc_prepend, sc_append,				\
> +			      cas_prepend, cas_append,				\
> +			      r, p, o, n)					\
>  ({										\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
>  	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
> @@ -117,9 +119,9 @@
>  		r = o;								\
>  										\
>  		__asm__ __volatile__ (						\
> -			prepend							\
> +			cas_prepend							\
>  			"	amocas" cas_sfx " %0, %z2, %1\n"		\
> -			append							\
> +			cas_append							\
>  			: "+&r" (r), "+A" (*(p))				\
>  			: "rJ" (n)						\
>  			: "memory");						\
> @@ -134,7 +136,7 @@
>  		ulong __rc;							\
>  										\
>  		__asm__ __volatile__ (						\
> -			prepend							\
> +			sc_prepend							\
>  			"0:	lr.w %0, %2\n"					\
>  			"	and  %1, %0, %z5\n"				\
>  			"	bne  %1, %z3, 1f\n"				\
> @@ -142,7 +144,7 @@
>  			"	or   %1, %1, %z4\n"				\
>  			"	sc.w" sc_sfx " %1, %1, %2\n"			\
>  			"	bnez %1, 0b\n"					\
> -			append							\
> +			sc_append							\
>  			"1:\n"							\
>  			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
>  			: "rJ" ((long)__oldx), "rJ" (__newx),			\
> @@ -153,16 +155,19 @@
>  	}									\
>  })
>  
> -#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
> +#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
> +		       sc_prepend, sc_append,				\
> +		       cas_prepend, cas_append,				\
> +		       r, p, co, o, n)					\
>  ({									\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
>  	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)) {	\
>  		r = o;							\
>  									\
>  		__asm__ __volatile__ (					\
> -			prepend						\
> -			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
> -			append						\
> +			cas_prepend					\
> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> +			cas_append					\
>  			: "+&r" (r), "+A" (*(p))			\
>  			: "rJ" (n)					\
>  			: "memory");					\
> @@ -170,12 +175,12 @@
>  		register unsigned int __rc;				\
>  									\
>  		__asm__ __volatile__ (					\
> -			prepend						\
> +			sc_prepend					\
>  			"0:	lr" lr_sfx " %0, %2\n"			\
>  			"	bne  %0, %z3, 1f\n"			\
> -			"	sc" sc_cas_sfx " %1, %z4, %2\n"		\
> +			"	sc" sc_sfx " %1, %z4, %2\n"		\
>  			"	bnez %1, 0b\n"				\
> -			append						\
> +			sc_append					\
>  			"1:\n"						\
>  			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
>  			: "rJ" (co o), "rJ" (n)				\
> @@ -183,7 +188,9 @@
>  	}								\
>  })
>  
> -#define _arch_cmpxchg(ptr, old, new, sc_cas_sfx, prepend, append)	\
> +#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
> +		      sc_prepend, sc_append,				\
> +		      cas_prepend, cas_append)				\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __old = (old);				\
> @@ -192,22 +199,28 @@
>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
> -		__arch_cmpxchg_masked(sc_cas_sfx, ".b" sc_cas_sfx,	\
> -					prepend, append,		\
> -					__ret, __ptr, __old, __new);    \
> +		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
> +				      sc_prepend, sc_append,		\
> +				      cas_prepend, cas_append,		\
> +				      __ret, __ptr, __old, __new);	\
>  		break;							\
>  	case 2:								\
> -		__arch_cmpxchg_masked(sc_cas_sfx, ".h" sc_cas_sfx,	\
> -					prepend, append,		\
> -					__ret, __ptr, __old, __new);	\
> +		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
> +				      sc_prepend, sc_append,		\
> +				      cas_prepend, cas_append,		\
> +				      __ret, __ptr, __old, __new);	\
>  		break;							\
>  	case 4:								\
> -		__arch_cmpxchg(".w", ".w" sc_cas_sfx, prepend, append,	\
> -				__ret, __ptr, (long), __old, __new);	\
> +		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
> +			       sc_prepend, sc_append,			\
> +			       cas_prepend, cas_append,			\
> +			       __ret, __ptr, (long), __old, __new);	\
>  		break;							\
>  	case 8:								\
> -		__arch_cmpxchg(".d", ".d" sc_cas_sfx, prepend, append,	\
> -				__ret, __ptr, /**/, __old, __new);	\
> +		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
> +			       sc_prepend, sc_append,			\
> +			       cas_prepend, cas_append,			\
> +			       __ret, __ptr, /**/, __old, __new);	\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
> @@ -215,17 +228,40 @@
>  	(__typeof__(*(__ptr)))__ret;					\
>  })
>  
> +/*
> + * Those macros are there only to make the arch_cmpxchg_XXX() macros

These macros are here to improve the readability of the arch_cmpxchg_XXX()
macros.

> + * more readable.
> + */
> +#define SC_SFX(x)	x
> +#define CAS_SFX(x)	x
> +#define SC_PREPEND(x)	x
> +#define SC_APPEND(x)	x
> +#define CAS_PREPEND(x)	x
> +#define CAS_APPEND(x)	x
> +
>  #define arch_cmpxchg_relaxed(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", "", "")
> +	_arch_cmpxchg((ptr), (o), (n),					\

nit: no need for the () around the macro args when the arg is not used
in an expression.

> +		      SC_SFX(""), CAS_SFX(""),				\
> +		      SC_PREPEND(""), SC_APPEND(""),			\
> +		      CAS_PREPEND(""), CAS_APPEND(""))
>  
>  #define arch_cmpxchg_acquire(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
> +	_arch_cmpxchg((ptr), (o), (n),					\
> +		      SC_SFX(""), CAS_SFX(""),				\
> +		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
> +		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
>  
>  #define arch_cmpxchg_release(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
> +	_arch_cmpxchg((ptr), (o), (n),					\
> +		      SC_SFX(""), CAS_SFX(""),				\
> +		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
> +		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
>  
>  #define arch_cmpxchg(ptr, o, n)						\
> -	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
> +	_arch_cmpxchg((ptr), (o), (n),					\
> +		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
> +		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
> +		      CAS_PREPEND(""), CAS_APPEND(""))
>  
>  #define arch_cmpxchg_local(ptr, o, n)					\
>  	arch_cmpxchg_relaxed((ptr), (o), (n))
> -- 
> 2.39.2
>

Besides the comment wording and the nit about macro args,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
