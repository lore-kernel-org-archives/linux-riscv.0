Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5124BC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 20:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zsiaXUq/hcKk+7iTHMOf16p/fg17kbEtNOmQEYluaA=; b=pF5B4wSpSHnNTY
	vRGziEZCBQG0Up7u6Sde0Rj3omrhi6/5OMSEz6WRR3unamhpDBOgXo9KtTbS3qzjSc0ZRYVYiXzfh
	BWVBczbAeMOckayJoV7BIU8tGDD9SS5f1kgIizS+/AkoQV8pvfybFX+sMrAKxuBjFEAa8s1t9CtmP
	nY9wNSJN/3ptFDx/HbqjYz4ltFlmAySKlX7+VL28GtkDdmrgAmdkqX7CYqbPPV1tJ2Jg9rHWD9VPz
	xR3v6L/W/oRfgLhknBf+/N4s3moeLgoWTrEPxFft3sesVlDU9iNp5dSli0hjkD7SDMqOMAoYk19+T
	YLlGkKI5LOljav7WDRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLUXg-00FBmH-2r;
	Thu, 04 Jan 2024 20:42:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLUXe-00FBlu-18
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 20:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704400932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAmQvLaF2jO2nEcpKJ+aB+e3AH0L/O+kz07dDjvJ2J4=;
	b=XeSi0E0tW/YhJ409nYKtAhqGnenhZPrBWpKHjziJboShCACRRYJma1Yv6Qz6Qc8PXW4rIR
	boRQBFV5vdLXH/J9YFsTb2rtS3vfOFxRwELslzTHUy9pi52ocTo00XoOMT3nj6Rj218urt
	f+xNYnXi1PMVPN1p8as3bJnPZ/qE1jU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-UDB9nQ0-Pw-dhWjAI8JUxw-1; Thu, 04 Jan 2024 15:42:11 -0500
X-MC-Unique: UDB9nQ0-Pw-dhWjAI8JUxw-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d4ce9f52a0so4907125ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 12:42:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704400930; x=1705005730;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wAmQvLaF2jO2nEcpKJ+aB+e3AH0L/O+kz07dDjvJ2J4=;
        b=vVlF4mBZty8dfkUyqsg5uPa5KwQUxJsgC3WpmG/KqKvdzIke1bOVT3/OPBRCrJxNL1
         Gp6TmHNb0iMwZs1hvoehaNfhkDlQi8McB0zvXo2k09gMt/S2T21gxxsntEA7sxPlS1/m
         K4Mwb+Lbp5RE6eIpe4DarnfMdNuogmxJT0CqvCcxhqSJ3nsBVl/rCNfEfC5v1328Zikj
         Z6wdMljS4XSqeoTVvMqJEIjv5U6bw2tViVWxPIFMOL/+C81Jta06dJD9+Vf3JgBSiPD/
         OeOZCM6wz6rINdNGWptCGiupDjGK3keTP4uzJ2nXKguW/wAN1Q3PfippdiCWMMdtYxZU
         iAWg==
X-Gm-Message-State: AOJu0YwSTxmKeiHl7FtU093/JvcF3gqdy5UnvD5gpbj2Qxv0hsXu3h/J
	r9Az79RuJSkqedkHQxjTbTJ8F5jA2aXiSHbGOGJoHpwMj4GCi2pjl1c0tPNYim+1asoXkc0Hu+b
	xF7uBUp6KaoyvDumFTRyzC9jJu8OD+TD9fJrU
X-Received: by 2002:a17:902:6946:b0:1d4:b6e9:9e42 with SMTP id k6-20020a170902694600b001d4b6e99e42mr970240plt.21.1704400930231;
        Thu, 04 Jan 2024 12:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4k1+6bEArfLc4KJe1Y4BM1WpQOEYufqPMfLPjtLZCpfhiodfznVwuXXmndPOhZDdINaUI/A==
X-Received: by 2002:a17:902:6946:b0:1d4:b6e9:9e42 with SMTP id k6-20020a170902694600b001d4b6e99e42mr969743plt.21.1704400899999;
        Thu, 04 Jan 2024 12:41:39 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:431:c7ec:3c39:8a36:75f0:8b6e:b898])
        by smtp.gmail.com with ESMTPSA id s13-20020a170902a50d00b001d1d1ef8be6sm24508plq.267.2024.01.04.12.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 12:41:39 -0800 (PST)
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
Date: Thu,  4 Jan 2024 17:41:26 -0300
Message-ID: <ZZcX9vwk1dsZOfYu@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZZcMycoHUqzBmGFs@boqun-archlinux>
References: <20240103163203.72768-2-leobras@redhat.com> <20240103163203.72768-3-leobras@redhat.com> <ZZcMycoHUqzBmGFs@boqun-archlinux>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_124214_483135_E3D746C9 
X-CRM114-Status: GOOD (  28.75  )
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

On Thu, Jan 04, 2024 at 11:53:45AM -0800, Boqun Feng wrote:
> On Wed, Jan 03, 2024 at 01:31:59PM -0300, Leonardo Bras wrote:
> > In this header every xchg define (_relaxed, _acquire, _release, vanilla)
> > contain it's own asm file, both for 4-byte variables an 8-byte variables,
> > on a total of 8 versions of mostly the same asm.
> > 
> > This is usually bad, as it means any change may be done in up to 8
> > different places.
> > 
> > Unify those versions by creating a new define with enough parameters to
> > generate any version of the previous 8.
> > 
> > Then unify the result under a more general define, and simplify
> > arch_xchg* generation.
> > 
> > (This did not cause any change in generated asm)
> > 
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> > Tested-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/cmpxchg.h | 138 ++++++-------------------------
> >  1 file changed, 23 insertions(+), 115 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 2f4726d3cfcc2..48478a8eecee7 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -11,140 +11,48 @@
> >  #include <asm/barrier.h>
> >  #include <asm/fence.h>
> >  
> > -#define __xchg_relaxed(ptr, new, size)					\
> > +#define __arch_xchg(sfx, prepend, append, r, p, n)			\
> >  ({									\
> > -	__typeof__(ptr) __ptr = (ptr);					\
> > -	__typeof__(new) __new = (new);					\
> > -	__typeof__(*(ptr)) __ret;					\
> > -	switch (size) {							\
> > -	case 4:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.w %0, %2, %1\n"			\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\

Hello Boqun, thanks for reviewing!

>
> Hmm... actually xchg_relaxed() doesn't need to be a barrier(), so the
> "memory" clobber here is not needed here. Of course, it's out of the
> scope of this series, but I'm curious to see what would happen if we
> remove the "memory" clobber _relaxed() ;-)

Nice question :)
I am happy my patch can help bring up those ideas :) 


According to gcc.gnu.org:

---
"memory" [clobber]:

    The "memory" clobber tells the compiler that the assembly code 
    performs memory reads or writes to items other than those listed in 
    the input and output operands (for example, accessing the memory 
    pointed to by one of the input parameters). To ensure memory contains 
    correct values, GCC may need to flush specific register values to 
    memory before executing the asm. Further, the compiler does not assume 
    that any values read from memory before an asm remain unchanged after 
    that asm ; it reloads them as needed. Using the "memory" clobber 
    effectively forms a read/write memory barrier for the compiler.

    Note that this clobber does not prevent the processor from doing 
    speculative reads past the asm statement. To prevent that, you need 
    processor-specific fence instructions.
---

IIUC above text says that having memory accesses to *__ptr would require 
above asm to have the "memory" clobber, so memory accesses don't get 
reordered by the compiler. 

By above affirmation, all asm in this file should have the "memory" 
clobber, since all atomic operations will change memory pointed by an input 
ptr. Is that correct?

Thanks!
Leo


> 
> Regards,
> Boqun
> 
> > -		break;							\
> > -	case 8:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.d %0, %2, %1\n"			\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > -		break;							\
> > -	default:							\
> > -		BUILD_BUG();						\
> > -	}								\
> > -	__ret;								\
> > -})
> > -
> > -#define arch_xchg_relaxed(ptr, x)					\
> > -({									\
> > -	__typeof__(*(ptr)) _x_ = (x);					\
> > -	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> > -					    _x_, sizeof(*(ptr)));	\
> > +	__asm__ __volatile__ (						\
> > +		prepend							\
> > +		"	amoswap" sfx " %0, %2, %1\n"			\
> > +		append							\
> > +		: "=r" (r), "+A" (*(p))					\
> > +		: "r" (n)						\
> > +		: "memory");						\
> >  })
> >  
> > -#define __xchg_acquire(ptr, new, size)					\
> > +#define _arch_xchg(ptr, new, sfx, prepend, append)			\
> >  ({									\
> >  	__typeof__(ptr) __ptr = (ptr);					\
> > -	__typeof__(new) __new = (new);					\
> > -	__typeof__(*(ptr)) __ret;					\
> > -	switch (size) {							\
> > +	__typeof__(*(__ptr)) __new = (new);				\
> > +	__typeof__(*(__ptr)) __ret;					\
> > +	switch (sizeof(*__ptr)) {					\
> >  	case 4:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.w %0, %2, %1\n"			\
> > -			RISCV_ACQUIRE_BARRIER				\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > +		__arch_xchg(".w" sfx, prepend, append,			\
> > +			      __ret, __ptr, __new);			\
> >  		break;							\
> >  	case 8:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.d %0, %2, %1\n"			\
> > -			RISCV_ACQUIRE_BARRIER				\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > +		__arch_xchg(".d" sfx, prepend, append,			\
> > +			      __ret, __ptr, __new);			\
> >  		break;							\
> >  	default:							\
> >  		BUILD_BUG();						\
> >  	}								\
> > -	__ret;								\
> > +	(__typeof__(*(__ptr)))__ret;					\
> >  })
> >  
> > -#define arch_xchg_acquire(ptr, x)					\
> > -({									\
> > -	__typeof__(*(ptr)) _x_ = (x);					\
> > -	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
> > -					    _x_, sizeof(*(ptr)));	\
> > -})
> > +#define arch_xchg_relaxed(ptr, x)					\
> > +	_arch_xchg(ptr, x, "", "", "")
> >  
> > -#define __xchg_release(ptr, new, size)					\
> > -({									\
> > -	__typeof__(ptr) __ptr = (ptr);					\
> > -	__typeof__(new) __new = (new);					\
> > -	__typeof__(*(ptr)) __ret;					\
> > -	switch (size) {							\
> > -	case 4:								\
> > -		__asm__ __volatile__ (					\
> > -			RISCV_RELEASE_BARRIER				\
> > -			"	amoswap.w %0, %2, %1\n"			\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > -		break;							\
> > -	case 8:								\
> > -		__asm__ __volatile__ (					\
> > -			RISCV_RELEASE_BARRIER				\
> > -			"	amoswap.d %0, %2, %1\n"			\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > -		break;							\
> > -	default:							\
> > -		BUILD_BUG();						\
> > -	}								\
> > -	__ret;								\
> > -})
> > +#define arch_xchg_acquire(ptr, x)					\
> > +	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
> >  
> >  #define arch_xchg_release(ptr, x)					\
> > -({									\
> > -	__typeof__(*(ptr)) _x_ = (x);					\
> > -	(__typeof__(*(ptr))) __xchg_release((ptr),			\
> > -					    _x_, sizeof(*(ptr)));	\
> > -})
> > -
> > -#define __arch_xchg(ptr, new, size)					\
> > -({									\
> > -	__typeof__(ptr) __ptr = (ptr);					\
> > -	__typeof__(new) __new = (new);					\
> > -	__typeof__(*(ptr)) __ret;					\
> > -	switch (size) {							\
> > -	case 4:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.w.aqrl %0, %2, %1\n"		\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > -		break;							\
> > -	case 8:								\
> > -		__asm__ __volatile__ (					\
> > -			"	amoswap.d.aqrl %0, %2, %1\n"		\
> > -			: "=r" (__ret), "+A" (*__ptr)			\
> > -			: "r" (__new)					\
> > -			: "memory");					\
> > -		break;							\
> > -	default:							\
> > -		BUILD_BUG();						\
> > -	}								\
> > -	__ret;								\
> > -})
> > +	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
> >  
> >  #define arch_xchg(ptr, x)						\
> > -({									\
> > -	__typeof__(*(ptr)) _x_ = (x);					\
> > -	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
> > -})
> > +	_arch_xchg(ptr, x, ".aqrl", "", "")
> >  
> >  #define xchg32(ptr, x)							\
> >  ({									\
> > -- 
> > 2.43.0
> > 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
