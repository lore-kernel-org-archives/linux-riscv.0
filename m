Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494E0C3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ibayjv4Axp3gyREWI17pHOSTBFQFwqQWsKRoPB9pQAA=; b=l0pmF1mYiPoEVy
	K7MNT0yiFdjbKAEhiCbrADqzjSjhltihHPsNXQ/3e5i+D8hB1vFdADfPqW9KUrwsl+60YY3McYTJZ
	7aI/kKfZKNpXe1u4o9wRsZZUIqX1/NeNWk4Gbl1Xo87OX7c8AiwhPsPNeo1Osroo+xya+lAchSAR7
	2HttS4AtdZxMD6iqH0Uv+iuR2orsCHtXjVDtNjWnMCVQ/jNxnP5PPkSivcjQ/0dE33hVQV5LL9diI
	oLBz7V93FZJb1pVwCLRkSYjmTEKU9mc/8nq9ExANKrlaGQFv5EIpkZJyLBLNyTVh/z2qjwLeh2/Gg
	jum2OqsUXrl1jZjRh40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLeBW-00G6h5-1U;
	Fri, 05 Jan 2024 07:00:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLeBT-00G6gL-0L
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 07:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704437997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JQVueAH6b8OhMM6ibqLC2xO4nUW7aQbo88ztAYelySE=;
	b=fFkktsrbDaY04rPOnqkGUwpakETfAc6Hvlw+svWWmO/zvmplmUrXLWuHDgShJOT8cp9lGC
	U1UtknQPbcKZhFKQqtuRjaa3YPf53OWH4z/KKfcWubQb/N80Jr5XzIolkqBB1dceYRaqSp
	JcUGBd9kYJOtgVGKdHFXLMBw3K+v0Pg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-JlaHvYpaOj-YwC_bgLOEdg-1; Fri, 05 Jan 2024 01:59:54 -0500
X-MC-Unique: JlaHvYpaOj-YwC_bgLOEdg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28bbe965866so983913a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 22:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704437993; x=1705042793;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JQVueAH6b8OhMM6ibqLC2xO4nUW7aQbo88ztAYelySE=;
        b=HHPqba4kBdLfLjpcCcmtDQa+dFSQacKneA4lcllAEvbm2yAePfvJhjk93bnBG8PWN9
         WJM/MCekPpkaa7REERr87oSXOxRY0HBxhE48+qg2KpZCMtvFYwrfAR7N84Xf9bVhK30B
         aKI8ZIUkUSMhk8evVHaz2Krk3MHLHdTmbla7xgjV09u5IDK4iFyyoVqEMeVSqLt8rXUi
         hMYiTGsPKHkZk5hFGPLRh5/kx145c9hu0Fj50wTOcOBG1wu6kssEuRuYTzCR0Iq8JAtU
         lX6IY52BaGLz1PQt/AKxMGlOxGOvfZeGTw0Ov7zVGtPQZVENzdriFjSkO8nTgmdhdZfR
         monQ==
X-Gm-Message-State: AOJu0YwdxDypMFg/erXzPbQY8fUUwlFV/20V2rsasHGYZywK4dFJ++3q
	WZmf3coK0NuUGa9Mg+q6ebmgE2Vr+o8xGAyoVJ+MHi7d/TZsuqVJTOdC9ga8CBN8XuX2SHT5xNz
	QF+pIBrx79n6TT2stQ+pckgE4HAG3EdsQHs6X
X-Received: by 2002:a17:90b:81:b0:28c:f163:4884 with SMTP id bb1-20020a17090b008100b0028cf1634884mr1362124pjb.50.1704437993336;
        Thu, 04 Jan 2024 22:59:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7q8OltVswbziyk5VXAXNj9YieqSpXs4x4sIMJ4dv8668MQdkAFbsWlf3g0mBjEwPXX7tMvg==
X-Received: by 2002:a17:90b:81:b0:28c:f163:4884 with SMTP id bb1-20020a17090b008100b0028cf1634884mr1362118pjb.50.1704437992956;
        Thu, 04 Jan 2024 22:59:52 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:3efd:1dbc:859f:ecb4:d775])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902d90500b001d33e6521b9sm693032plz.14.2024.01.04.22.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 22:59:52 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Fri,  5 Jan 2024 03:59:44 -0300
Message-ID: <ZZeo3-XzV9GBZuMe@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZZeRF2GX6sLLxgrM@Boquns-Mac-mini.home>
References: <20240103163203.72768-2-leobras@redhat.com> <20240103163203.72768-3-leobras@redhat.com> <ZZcMycoHUqzBmGFs@boqun-archlinux> <ZZcX9vwk1dsZOfYu@LeoBras> <ZZcoWB_8dumgUn5K@boqun-archlinux> <ZZeJdjP2gUnTQCl-@LeoBras> <ZZeRF2GX6sLLxgrM@Boquns-Mac-mini.home>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_225959_282427_61844E55 
X-CRM114-Status: GOOD (  41.48  )
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

On Thu, Jan 04, 2024 at 09:18:15PM -0800, Boqun Feng wrote:
> On Fri, Jan 05, 2024 at 01:45:42AM -0300, Leonardo Bras wrote:
> [...]
> > > > According to gcc.gnu.org:
> > > > 
> > > > ---
> > > > "memory" [clobber]:
> > > > 
> > > >     The "memory" clobber tells the compiler that the assembly code 
> > > >     performs memory reads or writes to items other than those listed in 
> > > >     the input and output operands (for example, accessing the memory 
> > > >     pointed to by one of the input parameters). To ensure memory contains 
> > > 
> > > Note here it says "other than those listed in the input and output
> > > operands", and in the above asm block, the memory pointed by "__ptr" is
> > > already marked as read-and-write by the asm block via "+A" (*__ptr), so
> > > the compiler knows the asm block may modify the memory pointed by
> > > "__ptr", therefore in _relaxed() case, "memory" clobber can be avoided.
> > 
> > Thanks for pointing that out! 
> > That helped me improve my understanding on constraints for asm operands :)
> > (I ended up getting even more info from the gcc manual)
> > 
> > So "+A" constraints means the operand will get read/write and it's an 
> > address stored into a register.
> > 
> > > 
> > > Here is an example showing the difference, considering the follow case:
> > > 
> > > 	this_val = *this;
> > > 	that_val = *that;
> > > 	xchg_relaxed(this, 1);
> > > 	reread_this = *this;
> > > 
> > > by the semantics of _relaxed, compilers can optimize the above into
> > > 
> > > 	this_val = *this;
> > > 	xchg_relaxed(this, 1);
> > > 	that_val = *that;
> > > 	reread_this = *this;
> > > 
> > 
> > Seems correct, since there is no barrier().
> > 
> > > but the "memory" clobber in the xchg_relexed() will provide this.
> > 
> > By 'this' here you mean the barrier? I mean, IIUC "memory" clobber will 
> > avoid the above optimization, right?
> > 
> 
> Right, seems I mis-typed "provide" (I meant "prevent")
> 
> > > Needless to say the '"+A" (*__ptr)' prevents compiler from the following
> > > optimization:
> > > 
> > > 	this_val = *this;
> > > 	that_val = *that;
> > > 	xchg_relaxed(this, 1);
> > > 	reread_this = this_val;
> > > 
> > > since the compiler knows the asm block will read and write *this.
> >  
> > Right, the compiler knows that address will be wrote by the asm block, and 
> > so it reloads the value instead of re-using the old one.
> > 
> 
> Correct.
> 
> > 
> > A question, though:
> 
> Good question ;-)
> 
> > Do we need the "memory" clobber in any other xchg / cmpxchg asm?
> 
> The "memory" clobber is needed for others, see below:
> 
> > I mean, usually the only write to memory will happen in the *__ptr, which 
> > should be safe by "+A".
> > 
> > I understand that since the others are not "relaxed" they will need to 
> > have a barrier, but is not the compiler supposed to understand the barrier 
> > instruction and avoid compiler reordering / optimizations across given 
> > instruction ?  
> > 
> 
> The barrier semantics (ACQUIRE/RELEASE/FULL) is provided by the combined
> effort of both 1) preventing compiler optimization by "memory" clobber
> and 2) preventing CPU/memory reordering by arch-specific instructions.
> 
> In other words, an asm block contains a hardware barrier instruction
> should always have the "memory" clobber, otherwise, there are
> possiblities that compilers reorder the asm block therefore break the
> ordering provided by the hardware instructions.

Oh, I see.
So this means the compiler does not check for memory barrier instructions 
before reordering loads/stores. Right?

Meaning it needs a way to signal a compiler barrier, on top of the barrier 
instructions. 

Thanks for helping me improve my understanding of this!
Leo

> 
> Regards,
> Boqun
> 
> > 
> > Thanks!
> > Leo
> > 
> > > Regards,
> > > Boqun
> > > 
> > > >     correct values, GCC may need to flush specific register values to 
> > > >     memory before executing the asm. Further, the compiler does not assume 
> > > >     that any values read from memory before an asm remain unchanged after 
> > > >     that asm ; it reloads them as needed. Using the "memory" clobber 
> > > >     effectively forms a read/write memory barrier for the compiler.
> > > > 
> > > >     Note that this clobber does not prevent the processor from doing 
> > > >     speculative reads past the asm statement. To prevent that, you need 
> > > >     processor-specific fence instructions.
> > > > ---
> > > > 
> > > > IIUC above text says that having memory accesses to *__ptr would require 
> > > > above asm to have the "memory" clobber, so memory accesses don't get 
> > > > reordered by the compiler. 
> > > > 
> > > > By above affirmation, all asm in this file should have the "memory" 
> > > > clobber, since all atomic operations will change memory pointed by an input 
> > > > ptr. Is that correct?
> > > > 
> > > > Thanks!
> > > > Leo
> > > > 
> > > > 
> > > > > 
> > > > > Regards,
> > > > > Boqun
> > > > > 
> > > > > > -		break;							\
> > > > > > -	case 8:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > -		break;							\
> > > > > > -	default:							\
> > > > > > -		BUILD_BUG();						\
> > > > > > -	}								\
> > > > > > -	__ret;								\
> > > > > > -})
> > > > > > -
> > > > > > -#define arch_xchg_relaxed(ptr, x)					\
> > > > > > -({									\
> > > > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > > > -	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> > > > > > -					    _x_, sizeof(*(ptr)));	\
> > > > > > +	__asm__ __volatile__ (						\
> > > > > > +		prepend							\
> > > > > > +		"	amoswap" sfx " %0, %2, %1\n"			\
> > > > > > +		append							\
> > > > > > +		: "=r" (r), "+A" (*(p))					\
> > > > > > +		: "r" (n)						\
> > > > > > +		: "memory");						\
> > > > > >  })
> > > > > >  
> > > > > > -#define __xchg_acquire(ptr, new, size)					\
> > > > > > +#define _arch_xchg(ptr, new, sfx, prepend, append)			\
> > > > > >  ({									\
> > > > > >  	__typeof__(ptr) __ptr = (ptr);					\
> > > > > > -	__typeof__(new) __new = (new);					\
> > > > > > -	__typeof__(*(ptr)) __ret;					\
> > > > > > -	switch (size) {							\
> > > > > > +	__typeof__(*(__ptr)) __new = (new);				\
> > > > > > +	__typeof__(*(__ptr)) __ret;					\
> > > > > > +	switch (sizeof(*__ptr)) {					\
> > > > > >  	case 4:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			"	amoswap.w %0, %2, %1\n"			\
> > > > > > -			RISCV_ACQUIRE_BARRIER				\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > +		__arch_xchg(".w" sfx, prepend, append,			\
> > > > > > +			      __ret, __ptr, __new);			\
> > > > > >  		break;							\
> > > > > >  	case 8:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > > > -			RISCV_ACQUIRE_BARRIER				\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > +		__arch_xchg(".d" sfx, prepend, append,			\
> > > > > > +			      __ret, __ptr, __new);			\
> > > > > >  		break;							\
> > > > > >  	default:							\
> > > > > >  		BUILD_BUG();						\
> > > > > >  	}								\
> > > > > > -	__ret;								\
> > > > > > +	(__typeof__(*(__ptr)))__ret;					\
> > > > > >  })
> > > > > >  
> > > > > > -#define arch_xchg_acquire(ptr, x)					\
> > > > > > -({									\
> > > > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > > > -	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
> > > > > > -					    _x_, sizeof(*(ptr)));	\
> > > > > > -})
> > > > > > +#define arch_xchg_relaxed(ptr, x)					\
> > > > > > +	_arch_xchg(ptr, x, "", "", "")
> > > > > >  
> > > > > > -#define __xchg_release(ptr, new, size)					\
> > > > > > -({									\
> > > > > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > > > > -	__typeof__(new) __new = (new);					\
> > > > > > -	__typeof__(*(ptr)) __ret;					\
> > > > > > -	switch (size) {							\
> > > > > > -	case 4:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			RISCV_RELEASE_BARRIER				\
> > > > > > -			"	amoswap.w %0, %2, %1\n"			\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > -		break;							\
> > > > > > -	case 8:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			RISCV_RELEASE_BARRIER				\
> > > > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > -		break;							\
> > > > > > -	default:							\
> > > > > > -		BUILD_BUG();						\
> > > > > > -	}								\
> > > > > > -	__ret;								\
> > > > > > -})
> > > > > > +#define arch_xchg_acquire(ptr, x)					\
> > > > > > +	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
> > > > > >  
> > > > > >  #define arch_xchg_release(ptr, x)					\
> > > > > > -({									\
> > > > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > > > -	(__typeof__(*(ptr))) __xchg_release((ptr),			\
> > > > > > -					    _x_, sizeof(*(ptr)));	\
> > > > > > -})
> > > > > > -
> > > > > > -#define __arch_xchg(ptr, new, size)					\
> > > > > > -({									\
> > > > > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > > > > -	__typeof__(new) __new = (new);					\
> > > > > > -	__typeof__(*(ptr)) __ret;					\
> > > > > > -	switch (size) {							\
> > > > > > -	case 4:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			"	amoswap.w.aqrl %0, %2, %1\n"		\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > -		break;							\
> > > > > > -	case 8:								\
> > > > > > -		__asm__ __volatile__ (					\
> > > > > > -			"	amoswap.d.aqrl %0, %2, %1\n"		\
> > > > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > > > -			: "r" (__new)					\
> > > > > > -			: "memory");					\
> > > > > > -		break;							\
> > > > > > -	default:							\
> > > > > > -		BUILD_BUG();						\
> > > > > > -	}								\
> > > > > > -	__ret;								\
> > > > > > -})
> > > > > > +	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
> > > > > >  
> > > > > >  #define arch_xchg(ptr, x)						\
> > > > > > -({									\
> > > > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > > > -	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
> > > > > > -})
> > > > > > +	_arch_xchg(ptr, x, ".aqrl", "", "")
> > > > > >  
> > > > > >  #define xchg32(ptr, x)							\
> > > > > >  ({									\
> > > > > > -- 
> > > > > > 2.43.0
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
