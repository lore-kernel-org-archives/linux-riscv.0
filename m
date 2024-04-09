Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEA1C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0Q+KQUEZND8x9jm8o7p2VEhTGpk3U7drjP+gXrCmO4=; b=hMYWjL3ng6LaG2
	L4XTaMjTQhF5UIH4ayuBbZXnjxGsAvBaMdGUf/gqVXFO2CbO/udHTU6uHRTthIp+UPPk/PkD59VfB
	5Z7syNtESZZQihYd0Te7k8rgYAt9/9XSregcsTD+ITSn8/tjoknFoaZGoQDpSdUXhIdCME9NvL4ws
	kKFKUaEzFAlUcy8tpqZC+GFFpMhaGe3DcRl5isZi352P8zq3WUrPhx2BrPtlEYHfnKbVAnaEe9X5L
	exXACyUn1MEplOgPI6eNGKxnU29s7OSoz7+1pha+slxSB+UZEWA7elwsCeq+iWvRDhrz7qQkJjdu7
	SpweJBjm1t4XZ4G8ZpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFtr-00000003HK4-10T5;
	Tue, 09 Apr 2024 18:08:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruFtn-00000003HI6-0sOS
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 18:08:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 576E9619A0;
	Tue,  9 Apr 2024 18:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BE7C433F1;
	Tue,  9 Apr 2024 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712686125;
	bh=85j4q3S1t04tNE6JB8FUGp/zM0rF5jeGqXukKGZIwB8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=XWFfObJahR4l3e3uA+Um8HE6AygMEhnv4bCi5uqEYCNZZTVj1BkO+ics7yp5isjRu
	 XTl9VJ1Heemw0EVSXQkbkn1uRpKtweJ5JFUrs0RXOJFWHGdpX3tZYHsKdYNSB3kTGv
	 ZMHv+9y9VRcVLo0XE7iXYmKnajbPaEPNDBEtixTqVk4jV/sMenodN9fpWaHLkJ/gQq
	 UC3KtaGxT0XvrIo2fZtkYmYqG5SkjGo9JbpT907wczYKK7ZTOArqIclMG8/2riLh38
	 WLfS1Ccke+e/PTlNnhm5K+mCbKyqLcefYmbnqk3v+mVa3j1K7IZNlMReiHqywDZ8Px
	 hNfJbVuwqV9qg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8815FCE2D22; Tue,  9 Apr 2024 11:08:45 -0700 (PDT)
Date: Tue, 9 Apr 2024 11:08:45 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, dianders@chromium.org, pmladek@suse.com,
	torvalds@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
	Yujie Liu <yujie.liu@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH cmpxchg 14/14] riscv: Emulate one-byte cmpxchg
Message-ID: <bb4e43b1-21dc-4e82-87c9-0ce4c5791d7d@paulmck-laptop>
References: <7b3646e0-667c-48e2-8f09-e493c43c30cb@paulmck-laptop>
 <20240408174944.907695-14-paulmck@kernel.org>
 <ZhV8a+pWAnJQ3Ljp@andrea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhV8a+pWAnJQ3Ljp@andrea>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_110847_302933_590B16E5 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 09, 2024 at 07:35:39PM +0200, Andrea Parri wrote:
> Hi Paul,
> 
> > @@ -170,6 +171,9 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
> > +		break;							\
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> > @@ -214,6 +218,9 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> > @@ -260,6 +267,9 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			RISCV_RELEASE_BARRIER				\
> > @@ -306,6 +316,9 @@
> >  	__typeof__(*(ptr)) __ret;					\
> >  	register unsigned int __rc;					\
> >  	switch (size) {							\
> > +	case 1:								\
> > +		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
> > +		break;							\
> >  	case 4:								\
> >  		__asm__ __volatile__ (					\
> >  			"0:	lr.w %0, %2\n"				\
> 
> Seems the last three are missing uintptr_t casts?

Indeed they are, and good eyes!

However, Liu, Yujie beat you to it, and this commit contains the fix:

4d5c72a34948 ("riscv: Emulate one-byte cmpxchg")

							Thanx, Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
