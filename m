Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD3CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 04:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvOygWcFrel7UXnlYBiQ4+YlITeK5eqqG8q/Lsjod/k=; b=LxKQqk4jL3qZZc
	70xHPAFYQ5kzlAXnGu09HuwoIu32hZEdphupvJB2GQKissGYeo2Kfb+m9pSNCZW3tdh9mzeoP42Bq
	RLWphdZQnqH3tWSoGboaPpoxRvnNXfutKGlxeQAAZ0XfTWOOQFjcCMuP8WjFZYdPYOBBiFByIQ5u5
	XP56qYBGKzUocfJqBFqr5Qo7DNffQscGZmStezTyB48IMsquJH7HR2Bcf71yvZQ/D7ttkB8skcerr
	ZmcT3YVSkEgIWv66BCxV48fzVI3ymYRbRv0CMLYdJW9wTrxhaHIvrsVxwWHbqSflWdLTuMq1Nzlvo
	gIIrtr2/IcZBYivpweNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLc5r-00FvsT-1E;
	Fri, 05 Jan 2024 04:46:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLc5m-00Fvs5-1J
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 04:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704429957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gCHPbzKxxZdm0rXXdb7LMI6sZxhhhsFujNk7n3OB9k=;
	b=PI2wR42KFr7Nmea7hpO1QeKGHQ4VA3kySnUjYBwAkiwyP06AfF/y3+jp7/hp3TT7/sxFcR
	Wjz0Dbvvj2XRmHqfMUaNSS4Hfydk/dbcY6OXTQtTgciMeOSSinhBWIaedbiweC4fIG9EO5
	UJ6e09OFQ98qKzx0vg4MX4WvPNTRmLM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-I52AGPfWNUqPee17_5gTpQ-1; Thu, 04 Jan 2024 23:45:55 -0500
X-MC-Unique: I52AGPfWNUqPee17_5gTpQ-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6d9c07b2372so210154b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 20:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704429955; x=1705034755;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gCHPbzKxxZdm0rXXdb7LMI6sZxhhhsFujNk7n3OB9k=;
        b=CpYgVt/84nPg4FfYkGBGBCkEFX2YA71ZCO+yz3hgkt4+ltX9LAm5NaWihvHEVSAIo5
         C1S3w4Zjr1hTJrPMg92XzXgMKySYgDfhKPHse2pTyaRL6UPdZOWYo4HbKo77I6VnTUf0
         r8Hv1Y37/B0MI/XM7ytxtc2ePTekUZa5+HJVrSJp6q5TtvWRtF0jdfSx0xlokpccg6ZQ
         8+pmCK5OXqcPv0YNkLd7q/K1lZbZxb8Rg13OKJJKZLcXunxle9CWtc4c/9VRqK/4oEK7
         a4YAoniSltvd7aU4kKc5/3YznJPI7Qcj0RyllMtSA4piWpnqeEK0QHqsjwwwwBasWfaJ
         2Vmg==
X-Gm-Message-State: AOJu0YzbL4PFAz1bDlPAWIR0TtTINLtqa0ll625j0INs1gEjlMvg+R28
	7rTp0VIodrV5oq8RZEUKycqoiHhFtguo8VuK/g/HfMrQHUunFgVU4QL3vMGPB7XGvW7NY1CXCli
	5Kb6taphqlQi3oMqkDawfL52lDnW2UpcrQkIW
X-Received: by 2002:a05:6a20:158a:b0:199:2c16:cbf7 with SMTP id h10-20020a056a20158a00b001992c16cbf7mr1183107pzj.14.1704429954730;
        Thu, 04 Jan 2024 20:45:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc2sarifblykqbJU9N1a3e6+A2wNmKesa/PhNh3XT1AxNwJq39B3g2l/OmTNhD6Kftz6LNhQ==
X-Received: by 2002:a05:6a20:158a:b0:199:2c16:cbf7 with SMTP id h10-20020a056a20158a00b001992c16cbf7mr1183087pzj.14.1704429954369;
        Thu, 04 Jan 2024 20:45:54 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:3efd:1dbc:859f:ecb4:d775])
        by smtp.gmail.com with ESMTPSA id e15-20020a63e00f000000b005c2967852c5sm481924pgh.30.2024.01.04.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 20:45:53 -0800 (PST)
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
Date: Fri,  5 Jan 2024 01:45:42 -0300
Message-ID: <ZZeJdjP2gUnTQCl-@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZZcoWB_8dumgUn5K@boqun-archlinux>
References: <20240103163203.72768-2-leobras@redhat.com> <20240103163203.72768-3-leobras@redhat.com> <ZZcMycoHUqzBmGFs@boqun-archlinux> <ZZcX9vwk1dsZOfYu@LeoBras> <ZZcoWB_8dumgUn5K@boqun-archlinux>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_204558_602493_F307611D 
X-CRM114-Status: GOOD (  45.14  )
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

On Thu, Jan 04, 2024 at 01:51:20PM -0800, Boqun Feng wrote:
> On Thu, Jan 04, 2024 at 05:41:26PM -0300, Leonardo Bras wrote:
> > On Thu, Jan 04, 2024 at 11:53:45AM -0800, Boqun Feng wrote:
> > > On Wed, Jan 03, 2024 at 01:31:59PM -0300, Leonardo Bras wrote:
> > > > In this header every xchg define (_relaxed, _acquire, _release, vanilla)
> > > > contain it's own asm file, both for 4-byte variables an 8-byte variables,
> > > > on a total of 8 versions of mostly the same asm.
> > > > 
> > > > This is usually bad, as it means any change may be done in up to 8
> > > > different places.
> > > > 
> > > > Unify those versions by creating a new define with enough parameters to
> > > > generate any version of the previous 8.
> > > > 
> > > > Then unify the result under a more general define, and simplify
> > > > arch_xchg* generation.
> > > > 
> > > > (This did not cause any change in generated asm)
> > > > 
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > Reviewed-by: Guo Ren <guoren@kernel.org>
> > > > Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> > > > Tested-by: Guo Ren <guoren@kernel.org>
> > > > ---
> > > >  arch/riscv/include/asm/cmpxchg.h | 138 ++++++-------------------------
> > > >  1 file changed, 23 insertions(+), 115 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > > > index 2f4726d3cfcc2..48478a8eecee7 100644
> > > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > > @@ -11,140 +11,48 @@
> > > >  #include <asm/barrier.h>
> > > >  #include <asm/fence.h>
> > > >  
> > > > -#define __xchg_relaxed(ptr, new, size)					\
> > > > +#define __arch_xchg(sfx, prepend, append, r, p, n)			\
> > > >  ({									\
> > > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > > -	__typeof__(new) __new = (new);					\
> > > > -	__typeof__(*(ptr)) __ret;					\
> > > > -	switch (size) {							\
> > > > -	case 4:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.w %0, %2, %1\n"			\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > 
> > Hello Boqun, thanks for reviewing!
> > 
> > >
> > > Hmm... actually xchg_relaxed() doesn't need to be a barrier(), so the
> > > "memory" clobber here is not needed here. Of course, it's out of the
> > > scope of this series, but I'm curious to see what would happen if we
> > > remove the "memory" clobber _relaxed() ;-)
> > 
> > Nice question :)
> > I am happy my patch can help bring up those ideas :) 
> > 
> > 
> > According to gcc.gnu.org:
> > 
> > ---
> > "memory" [clobber]:
> > 
> >     The "memory" clobber tells the compiler that the assembly code 
> >     performs memory reads or writes to items other than those listed in 
> >     the input and output operands (for example, accessing the memory 
> >     pointed to by one of the input parameters). To ensure memory contains 
> 
> Note here it says "other than those listed in the input and output
> operands", and in the above asm block, the memory pointed by "__ptr" is
> already marked as read-and-write by the asm block via "+A" (*__ptr), so
> the compiler knows the asm block may modify the memory pointed by
> "__ptr", therefore in _relaxed() case, "memory" clobber can be avoided.

Thanks for pointing that out! 
That helped me improve my understanding on constraints for asm operands :)
(I ended up getting even more info from the gcc manual)

So "+A" constraints means the operand will get read/write and it's an 
address stored into a register.

> 
> Here is an example showing the difference, considering the follow case:
> 
> 	this_val = *this;
> 	that_val = *that;
> 	xchg_relaxed(this, 1);
> 	reread_this = *this;
> 
> by the semantics of _relaxed, compilers can optimize the above into
> 
> 	this_val = *this;
> 	xchg_relaxed(this, 1);
> 	that_val = *that;
> 	reread_this = *this;
> 

Seems correct, since there is no barrier().

> but the "memory" clobber in the xchg_relexed() will provide this.

By 'this' here you mean the barrier? I mean, IIUC "memory" clobber will 
avoid the above optimization, right?

> Needless to say the '"+A" (*__ptr)' prevents compiler from the following
> optimization:
> 
> 	this_val = *this;
> 	that_val = *that;
> 	xchg_relaxed(this, 1);
> 	reread_this = this_val;
> 
> since the compiler knows the asm block will read and write *this.
 
Right, the compiler knows that address will be wrote by the asm block, and 
so it reloads the value instead of re-using the old one.


A question, though:
Do we need the "memory" clobber in any other xchg / cmpxchg asm?
I mean, usually the only write to memory will happen in the *__ptr, which 
should be safe by "+A".

I understand that since the others are not "relaxed" they will need to 
have a barrier, but is not the compiler supposed to understand the barrier 
instruction and avoid compiler reordering / optimizations across given 
instruction ?  


Thanks!
Leo

> Regards,
> Boqun
> 
> >     correct values, GCC may need to flush specific register values to 
> >     memory before executing the asm. Further, the compiler does not assume 
> >     that any values read from memory before an asm remain unchanged after 
> >     that asm ; it reloads them as needed. Using the "memory" clobber 
> >     effectively forms a read/write memory barrier for the compiler.
> > 
> >     Note that this clobber does not prevent the processor from doing 
> >     speculative reads past the asm statement. To prevent that, you need 
> >     processor-specific fence instructions.
> > ---
> > 
> > IIUC above text says that having memory accesses to *__ptr would require 
> > above asm to have the "memory" clobber, so memory accesses don't get 
> > reordered by the compiler. 
> > 
> > By above affirmation, all asm in this file should have the "memory" 
> > clobber, since all atomic operations will change memory pointed by an input 
> > ptr. Is that correct?
> > 
> > Thanks!
> > Leo
> > 
> > 
> > > 
> > > Regards,
> > > Boqun
> > > 
> > > > -		break;							\
> > > > -	case 8:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > -		break;							\
> > > > -	default:							\
> > > > -		BUILD_BUG();						\
> > > > -	}								\
> > > > -	__ret;								\
> > > > -})
> > > > -
> > > > -#define arch_xchg_relaxed(ptr, x)					\
> > > > -({									\
> > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > -	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> > > > -					    _x_, sizeof(*(ptr)));	\
> > > > +	__asm__ __volatile__ (						\
> > > > +		prepend							\
> > > > +		"	amoswap" sfx " %0, %2, %1\n"			\
> > > > +		append							\
> > > > +		: "=r" (r), "+A" (*(p))					\
> > > > +		: "r" (n)						\
> > > > +		: "memory");						\
> > > >  })
> > > >  
> > > > -#define __xchg_acquire(ptr, new, size)					\
> > > > +#define _arch_xchg(ptr, new, sfx, prepend, append)			\
> > > >  ({									\
> > > >  	__typeof__(ptr) __ptr = (ptr);					\
> > > > -	__typeof__(new) __new = (new);					\
> > > > -	__typeof__(*(ptr)) __ret;					\
> > > > -	switch (size) {							\
> > > > +	__typeof__(*(__ptr)) __new = (new);				\
> > > > +	__typeof__(*(__ptr)) __ret;					\
> > > > +	switch (sizeof(*__ptr)) {					\
> > > >  	case 4:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.w %0, %2, %1\n"			\
> > > > -			RISCV_ACQUIRE_BARRIER				\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > +		__arch_xchg(".w" sfx, prepend, append,			\
> > > > +			      __ret, __ptr, __new);			\
> > > >  		break;							\
> > > >  	case 8:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > -			RISCV_ACQUIRE_BARRIER				\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > +		__arch_xchg(".d" sfx, prepend, append,			\
> > > > +			      __ret, __ptr, __new);			\
> > > >  		break;							\
> > > >  	default:							\
> > > >  		BUILD_BUG();						\
> > > >  	}								\
> > > > -	__ret;								\
> > > > +	(__typeof__(*(__ptr)))__ret;					\
> > > >  })
> > > >  
> > > > -#define arch_xchg_acquire(ptr, x)					\
> > > > -({									\
> > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > -	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
> > > > -					    _x_, sizeof(*(ptr)));	\
> > > > -})
> > > > +#define arch_xchg_relaxed(ptr, x)					\
> > > > +	_arch_xchg(ptr, x, "", "", "")
> > > >  
> > > > -#define __xchg_release(ptr, new, size)					\
> > > > -({									\
> > > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > > -	__typeof__(new) __new = (new);					\
> > > > -	__typeof__(*(ptr)) __ret;					\
> > > > -	switch (size) {							\
> > > > -	case 4:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			RISCV_RELEASE_BARRIER				\
> > > > -			"	amoswap.w %0, %2, %1\n"			\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > -		break;							\
> > > > -	case 8:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			RISCV_RELEASE_BARRIER				\
> > > > -			"	amoswap.d %0, %2, %1\n"			\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > -		break;							\
> > > > -	default:							\
> > > > -		BUILD_BUG();						\
> > > > -	}								\
> > > > -	__ret;								\
> > > > -})
> > > > +#define arch_xchg_acquire(ptr, x)					\
> > > > +	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
> > > >  
> > > >  #define arch_xchg_release(ptr, x)					\
> > > > -({									\
> > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > -	(__typeof__(*(ptr))) __xchg_release((ptr),			\
> > > > -					    _x_, sizeof(*(ptr)));	\
> > > > -})
> > > > -
> > > > -#define __arch_xchg(ptr, new, size)					\
> > > > -({									\
> > > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > > -	__typeof__(new) __new = (new);					\
> > > > -	__typeof__(*(ptr)) __ret;					\
> > > > -	switch (size) {							\
> > > > -	case 4:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.w.aqrl %0, %2, %1\n"		\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > -		break;							\
> > > > -	case 8:								\
> > > > -		__asm__ __volatile__ (					\
> > > > -			"	amoswap.d.aqrl %0, %2, %1\n"		\
> > > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > > -			: "r" (__new)					\
> > > > -			: "memory");					\
> > > > -		break;							\
> > > > -	default:							\
> > > > -		BUILD_BUG();						\
> > > > -	}								\
> > > > -	__ret;								\
> > > > -})
> > > > +	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
> > > >  
> > > >  #define arch_xchg(ptr, x)						\
> > > > -({									\
> > > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > > -	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
> > > > -})
> > > > +	_arch_xchg(ptr, x, ".aqrl", "", "")
> > > >  
> > > >  #define xchg32(ptr, x)							\
> > > >  ({									\
> > > > -- 
> > > > 2.43.0
> > > > 
> > > 
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
