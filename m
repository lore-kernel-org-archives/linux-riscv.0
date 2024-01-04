Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34128C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COZG+xMZWMKqJc73D2cEZVhOVte+R8fAYrEjq7rX7Ks=; b=q8kDLjk6mYkGA4
	CxJBgm/G3/umeVfLJKfdoOi0la+XhpUa2SxQFS8w+xE7R4MfxM6lzNSczl2vub/j7f/h6vUNTR6GB
	Kaayu6slNPEhXTuEDAvtzhVpmxledMv12weZ8gMOd+glUzFCRCdUs4fW9ypg2RkWAMzmUbyzimh9h
	aYQp5gdsq+XINJZwPB+tKHxVOSvybqlvWpdaRSVTffM90Fd7pnj48eVMpmRJkCNXTBFLYrVN3tfjI
	B8aT2WUPECpW94Un8fmevxgw5rRF+ebupIOwg9rQBIptjz1+9aHSMV4h0AsoOp5r2cLYcESoXltwK
	fLkw8qfiOoIzNQMayVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLVdj-00FIeA-2v;
	Thu, 04 Jan 2024 21:52:35 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLVdg-00FIcf-0q
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 21:52:34 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-203fed05a31so525273fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 13:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704405151; x=1705009951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvWcQn1BhDvQdLqX/zAMlU202SCETljxrEn7ea1oEXs=;
        b=MgRRXp6T06pVEYvaDWTK/myLNyqdHL5Axg2UfJGLoouji/tMDbvwAZdFPGtk5l0n3V
         69266zZieXV1BDoO3X1gWVFJ4zSghJlYuatLO/DdozP3uABfhuxmgWEh25DIujD8GaeL
         VjivQDNeEJ4g582jQT0CVpq6/yUSgQ7uPO6qnFUz4NEXfyS90MMkXK/FIyuikmgaHR16
         wL6/U3a+33wtK4dYXJ7VDjQ0tbDG/NtJRWb87l0knbhgEmfBYyrdhlRqT/FiybJCSj/H
         MMCi/XhA39XZSwcstuFcqVQ3fJGm53oUcKu3RoJ/qgo3BFEYD3UZPmXRogI6BaZsT4bT
         UN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704405151; x=1705009951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvWcQn1BhDvQdLqX/zAMlU202SCETljxrEn7ea1oEXs=;
        b=HMjJQKC4JORxzXrnoZkVqCwsrHARQGG7HQkE/qRkv2MIEH74aDT5wvraNbEUDFYTJH
         3TDeSKuvWZf47I7JWUfQbWQszUBnrz3TQuW4bTxVzudfyJzbIdCEBa26wAAFbHYswbkY
         7M6wbgmeOE98ZflsfrOU04+iAfFn8EkbaXSmCedSEi+DlvyXiUvX5vMlUOdqMNoI+NV+
         HKcA/G4Ys7WLf7VCUgzwOqMb7S4DTBJ1or1wsnnkI+h23ppqNSPkabOHZJQDiGQJiF+M
         ekX+IlLNHD8c0UmGC1JlqGq6fNxkDyxnSe/PObbanGx1gQquJ9WGcLoy9ZwGe1cMTV0x
         tCPA==
X-Gm-Message-State: AOJu0Yzq39gXO0Db4C1nM5l+pKpRdk1gCvd57x9gaR33uYCtgfzQ+UGH
	B/OYOiEX+iRp67oXabGR/d8=
X-Google-Smtp-Source: AGHT+IEB9/fAyP/vp9uPaaAL1nlynxu56LOdjDbCLL0N/MsK56MZTm9+Ip49CpX0yMy4sUhIpdjrVw==
X-Received: by 2002:a05:6870:a70d:b0:204:1df1:8c85 with SMTP id g13-20020a056870a70d00b002041df18c85mr1318131oam.94.1704405150906;
        Thu, 04 Jan 2024 13:52:30 -0800 (PST)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id t7-20020a05620a450700b00781b8f4c89asm113105qkp.43.2024.01.04.13.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 13:52:30 -0800 (PST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id C11DE27C0061;
	Thu,  4 Jan 2024 16:52:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 04 Jan 2024 16:52:29 -0500
X-ME-Sender: <xms:nCiXZR0U3J93hzDIvx9ol9PFE56Gzzew4Wt9yqFl6Hpz1VAbfzHC7g>
    <xme:nCiXZYG6eMP2UmXJjk3pW5eQaU5cnC_08eOOv3yLwDx1P2L9lFjzgyo1vM_E7NxK4
    62p0_JvsqIOXG2Evg>
X-ME-Received: <xmr:nCiXZR6nQ3bWmtMC6kFUelsZWoKrGcx4HDExF708Y6VnUEMQo7SnnnMEgZcz3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepffehkeeuhfeigeevveejvefftdehueevfeetleevfefgudeitedvudev
    ieevkedunecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:nCiXZe2HfnuJ44MAXpTAOre_K85BlDkLXV5DmW8OrDG9EYSGCUqx0g>
    <xmx:nCiXZUGSvlNE1CFla8Fqs9SDe-gkXP2ARskLyT-CaFSTQRvT3TMdJQ>
    <xmx:nCiXZf9HXZKLOkjtp_Wf-qdwL2vAHbcV1bGiM9ItIIpBwVTeKV6NIw>
    <xmx:nSiXZYEiE7HFmzXpHcY2lj0M3C6kC3EBvAwc_2ysEoZPSXCETb-X1Q>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 16:52:28 -0500 (EST)
Date: Thu, 4 Jan 2024 13:51:20 -0800
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
Message-ID: <ZZcoWB_8dumgUn5K@boqun-archlinux>
References: <20240103163203.72768-2-leobras@redhat.com>
 <20240103163203.72768-3-leobras@redhat.com>
 <ZZcMycoHUqzBmGFs@boqun-archlinux>
 <ZZcX9vwk1dsZOfYu@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZcX9vwk1dsZOfYu@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_135232_300173_E002D187 
X-CRM114-Status: GOOD (  35.78  )
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

On Thu, Jan 04, 2024 at 05:41:26PM -0300, Leonardo Bras wrote:
> On Thu, Jan 04, 2024 at 11:53:45AM -0800, Boqun Feng wrote:
> > On Wed, Jan 03, 2024 at 01:31:59PM -0300, Leonardo Bras wrote:
> > > In this header every xchg define (_relaxed, _acquire, _release, vanilla)
> > > contain it's own asm file, both for 4-byte variables an 8-byte variables,
> > > on a total of 8 versions of mostly the same asm.
> > > 
> > > This is usually bad, as it means any change may be done in up to 8
> > > different places.
> > > 
> > > Unify those versions by creating a new define with enough parameters to
> > > generate any version of the previous 8.
> > > 
> > > Then unify the result under a more general define, and simplify
> > > arch_xchg* generation.
> > > 
> > > (This did not cause any change in generated asm)
> > > 
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > Reviewed-by: Guo Ren <guoren@kernel.org>
> > > Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> > > Tested-by: Guo Ren <guoren@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/cmpxchg.h | 138 ++++++-------------------------
> > >  1 file changed, 23 insertions(+), 115 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > > index 2f4726d3cfcc2..48478a8eecee7 100644
> > > --- a/arch/riscv/include/asm/cmpxchg.h
> > > +++ b/arch/riscv/include/asm/cmpxchg.h
> > > @@ -11,140 +11,48 @@
> > >  #include <asm/barrier.h>
> > >  #include <asm/fence.h>
> > >  
> > > -#define __xchg_relaxed(ptr, new, size)					\
> > > +#define __arch_xchg(sfx, prepend, append, r, p, n)			\
> > >  ({									\
> > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > -	__typeof__(new) __new = (new);					\
> > > -	__typeof__(*(ptr)) __ret;					\
> > > -	switch (size) {							\
> > > -	case 4:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.w %0, %2, %1\n"			\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> 
> Hello Boqun, thanks for reviewing!
> 
> >
> > Hmm... actually xchg_relaxed() doesn't need to be a barrier(), so the
> > "memory" clobber here is not needed here. Of course, it's out of the
> > scope of this series, but I'm curious to see what would happen if we
> > remove the "memory" clobber _relaxed() ;-)
> 
> Nice question :)
> I am happy my patch can help bring up those ideas :) 
> 
> 
> According to gcc.gnu.org:
> 
> ---
> "memory" [clobber]:
> 
>     The "memory" clobber tells the compiler that the assembly code 
>     performs memory reads or writes to items other than those listed in 
>     the input and output operands (for example, accessing the memory 
>     pointed to by one of the input parameters). To ensure memory contains 

Note here it says "other than those listed in the input and output
operands", and in the above asm block, the memory pointed by "__ptr" is
already marked as read-and-write by the asm block via "+A" (*__ptr), so
the compiler knows the asm block may modify the memory pointed by
"__ptr", therefore in _relaxed() case, "memory" clobber can be avoided.

Here is an example showing the difference, considering the follow case:

	this_val = *this;
	that_val = *that;
	xchg_relaxed(this, 1);
	reread_this = *this;

by the semantics of _relaxed, compilers can optimize the above into

	this_val = *this;
	xchg_relaxed(this, 1);
	that_val = *that;
	reread_this = *this;

but the "memory" clobber in the xchg_relexed() will provide this.
Needless to say the '"+A" (*__ptr)' prevents compiler from the following
optimization:

	this_val = *this;
	that_val = *that;
	xchg_relaxed(this, 1);
	reread_this = this_val;

since the compiler knows the asm block will read and write *this.

Regards,
Boqun

>     correct values, GCC may need to flush specific register values to 
>     memory before executing the asm. Further, the compiler does not assume 
>     that any values read from memory before an asm remain unchanged after 
>     that asm ; it reloads them as needed. Using the "memory" clobber 
>     effectively forms a read/write memory barrier for the compiler.
> 
>     Note that this clobber does not prevent the processor from doing 
>     speculative reads past the asm statement. To prevent that, you need 
>     processor-specific fence instructions.
> ---
> 
> IIUC above text says that having memory accesses to *__ptr would require 
> above asm to have the "memory" clobber, so memory accesses don't get 
> reordered by the compiler. 
> 
> By above affirmation, all asm in this file should have the "memory" 
> clobber, since all atomic operations will change memory pointed by an input 
> ptr. Is that correct?
> 
> Thanks!
> Leo
> 
> 
> > 
> > Regards,
> > Boqun
> > 
> > > -		break;							\
> > > -	case 8:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.d %0, %2, %1\n"			\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > -		break;							\
> > > -	default:							\
> > > -		BUILD_BUG();						\
> > > -	}								\
> > > -	__ret;								\
> > > -})
> > > -
> > > -#define arch_xchg_relaxed(ptr, x)					\
> > > -({									\
> > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > -	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
> > > -					    _x_, sizeof(*(ptr)));	\
> > > +	__asm__ __volatile__ (						\
> > > +		prepend							\
> > > +		"	amoswap" sfx " %0, %2, %1\n"			\
> > > +		append							\
> > > +		: "=r" (r), "+A" (*(p))					\
> > > +		: "r" (n)						\
> > > +		: "memory");						\
> > >  })
> > >  
> > > -#define __xchg_acquire(ptr, new, size)					\
> > > +#define _arch_xchg(ptr, new, sfx, prepend, append)			\
> > >  ({									\
> > >  	__typeof__(ptr) __ptr = (ptr);					\
> > > -	__typeof__(new) __new = (new);					\
> > > -	__typeof__(*(ptr)) __ret;					\
> > > -	switch (size) {							\
> > > +	__typeof__(*(__ptr)) __new = (new);				\
> > > +	__typeof__(*(__ptr)) __ret;					\
> > > +	switch (sizeof(*__ptr)) {					\
> > >  	case 4:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.w %0, %2, %1\n"			\
> > > -			RISCV_ACQUIRE_BARRIER				\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > +		__arch_xchg(".w" sfx, prepend, append,			\
> > > +			      __ret, __ptr, __new);			\
> > >  		break;							\
> > >  	case 8:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.d %0, %2, %1\n"			\
> > > -			RISCV_ACQUIRE_BARRIER				\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > +		__arch_xchg(".d" sfx, prepend, append,			\
> > > +			      __ret, __ptr, __new);			\
> > >  		break;							\
> > >  	default:							\
> > >  		BUILD_BUG();						\
> > >  	}								\
> > > -	__ret;								\
> > > +	(__typeof__(*(__ptr)))__ret;					\
> > >  })
> > >  
> > > -#define arch_xchg_acquire(ptr, x)					\
> > > -({									\
> > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > -	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
> > > -					    _x_, sizeof(*(ptr)));	\
> > > -})
> > > +#define arch_xchg_relaxed(ptr, x)					\
> > > +	_arch_xchg(ptr, x, "", "", "")
> > >  
> > > -#define __xchg_release(ptr, new, size)					\
> > > -({									\
> > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > -	__typeof__(new) __new = (new);					\
> > > -	__typeof__(*(ptr)) __ret;					\
> > > -	switch (size) {							\
> > > -	case 4:								\
> > > -		__asm__ __volatile__ (					\
> > > -			RISCV_RELEASE_BARRIER				\
> > > -			"	amoswap.w %0, %2, %1\n"			\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > -		break;							\
> > > -	case 8:								\
> > > -		__asm__ __volatile__ (					\
> > > -			RISCV_RELEASE_BARRIER				\
> > > -			"	amoswap.d %0, %2, %1\n"			\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > -		break;							\
> > > -	default:							\
> > > -		BUILD_BUG();						\
> > > -	}								\
> > > -	__ret;								\
> > > -})
> > > +#define arch_xchg_acquire(ptr, x)					\
> > > +	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
> > >  
> > >  #define arch_xchg_release(ptr, x)					\
> > > -({									\
> > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > -	(__typeof__(*(ptr))) __xchg_release((ptr),			\
> > > -					    _x_, sizeof(*(ptr)));	\
> > > -})
> > > -
> > > -#define __arch_xchg(ptr, new, size)					\
> > > -({									\
> > > -	__typeof__(ptr) __ptr = (ptr);					\
> > > -	__typeof__(new) __new = (new);					\
> > > -	__typeof__(*(ptr)) __ret;					\
> > > -	switch (size) {							\
> > > -	case 4:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.w.aqrl %0, %2, %1\n"		\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > -		break;							\
> > > -	case 8:								\
> > > -		__asm__ __volatile__ (					\
> > > -			"	amoswap.d.aqrl %0, %2, %1\n"		\
> > > -			: "=r" (__ret), "+A" (*__ptr)			\
> > > -			: "r" (__new)					\
> > > -			: "memory");					\
> > > -		break;							\
> > > -	default:							\
> > > -		BUILD_BUG();						\
> > > -	}								\
> > > -	__ret;								\
> > > -})
> > > +	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
> > >  
> > >  #define arch_xchg(ptr, x)						\
> > > -({									\
> > > -	__typeof__(*(ptr)) _x_ = (x);					\
> > > -	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
> > > -})
> > > +	_arch_xchg(ptr, x, ".aqrl", "", "")
> > >  
> > >  #define xchg32(ptr, x)							\
> > >  ({									\
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
