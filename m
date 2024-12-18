Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C54AE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 10:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M35DV9p7+on36DOKNRtkAzXQjn2uZ8jkFrJ8nBl5gCk=; b=coOp5Bbw2k9h6f
	D5VvSsXRJIGv6nnJc1kGllojMKOoCIC8wpxDlt4tUSOGlpwmmfR1zQgNrIvHDZuPzXSfkc92kyhgE
	8TMzBIgts2whNwWes5jODWXSVtGx8nWBnJgbizToCD51KfiS8XfvV2gIvYGDl+hNLFDDjHNeNCh72
	zdzAnkNykZiRPbKx3JzbPb3t4ioHYP1hxHi14DbYVZ29qRPacPTq1O5HOLQoHYTGa5jKQY7TWcfdD
	jxrlY84u4zQLXn7AQ5wk4oU4qN6xWbRwIIFuDuI1solSnNEds6+uVOZtn1J5pw14sx2cy9oEXLvKV
	2Vx+qkhMnjhmpStsI1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr85-0000000GE8A-0v7J;
	Wed, 18 Dec 2024 10:18:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNr6x-0000000GDyG-39kR;
	Wed, 18 Dec 2024 10:17:01 +0000
Date: Wed, 18 Dec 2024 11:16:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734517014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asQwivYoQ6OyVNJBd3EdgJw1JjuKg7fNklboQjqanF4=;
	b=k+9+2dt84P2yu2JQjHriNsnfLK1U2zwMe3zETXzWpHvMFbzWIWRl0216I0Fp7Fs0GxVlyo
	yc6i4Q3Hu1q2hD8wlkaWxUa2/LSRxg2COBfpJYgxfKOVjFaVDrdSLxoJSE3b4rni7eSePg
	zI/dWD74oT5nZPEZZO7hwDCfBtI4dfQFjxRIFS9AkAU85OAfFsoE1hleSOYGu1n4z2yAZY
	Y1RK/InyIx+aLJuE6QRRzC4LUqndo/HAvuKeT1pLXt7sSb5Bh3nglAiSTENEvex8fG+geW
	f0ENU722o2Q/62/Nus5sE3hNF3ZF1A45agg8WoxbV4hKlyXpoR26vp6T9Jw1dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734517014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asQwivYoQ6OyVNJBd3EdgJw1JjuKg7fNklboQjqanF4=;
	b=yXhQ4RjeaS/+ewnR286ORrRNsrdJ4qpmR9IkiLgWDlKmPEPu6UZYxm4SDqI/YyJISRXAyJ
	qqASr10vg3j1/pBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 12/17] powerpc/vdso: Switch to generic storage
 implementation
Message-ID: <20241218105556-6d6d0bcb-f2d7-418e-a4e6-1222c506d2cb@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-12-f7aed1bdb3b2@linutronix.de>
 <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12120bbe-1d79-425b-982d-46af1fa5d70d@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_021700_068755_B9F052A6 
X-CRM114-Status: GOOD (  16.24  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christophe,

On Wed, Dec 18, 2024 at 08:20:51AM +0100, Christophe Leroy wrote:
> Le 16/12/2024 =E0 15:10, Thomas Wei=DFschuh a =E9crit=A0:

[..]

> >   #ifdef CONFIG_TIME_NS
> > -static __always_inline
> > -const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_=
data *vd)
> > +static __always_inline const struct vdso_time_data *__ppc_get_vdso_u_t=
imens_data(void)
> >   {
> > -	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
> > +	struct vdso_time_data *time_data;
> > +
> > +	asm(
> > +		"	bcl	20, 31, .+4\n"
> > +		"0:	mflr	%0\n"
> > +		"	addis	%0, %0, (vdso_u_timens_data - 0b)@ha\n"
> > +		"	addi	%0, %0, (vdso_u_timens_data - 0b)@l\n"
> > +	: "=3Dr" (time_data) :: "lr");
> > +
> > +	return time_data;
> =

> Please don't do that, it kills optimisation efforts done when implementing
> VDSO time. Commit ce7d8056e38b ("powerpc/vdso: Prepare for switching VDSO=
 to
> generic C implementation.") explains why.
> =

> For time data, the bcl/mflr dance is done by get_datapage macro called by
> cvdso_call macro in gettimeofday.S, and given to
> __cvdso_clock_gettime_data() by __c_kernel_clock_gettime() in
> vgettimeofday.c . Use that information and don't redo the bcl/mflr sequen=
ce.

So instead keeping the logic of this:

static __always_inline
const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data =
*vd)
{
	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
}

Makes sense.

Adding a constant value should be cheaper or just as cheap as a
PC-relative addressing for all architectures, so it can go into the
generic code, too.

[..]

> >   }
> > +#define __arch_get_vdso_u_timens_data __ppc_get_vdso_u_timens_data
> =

> There is not #ifdef __arch_get_vdso_u_timens_data anywhere, this #define =
is
> not needed, the function should be called __arch_get_vdso_u_timens_data()
> directly as before, unnecessary indirections reduce readability.

I'll see how this works out with the include order and conflicts with
symbols in include/vdso/datapage.h.

> >   #endif
> > -static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
> > +static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
> >   {
> >   	return true;
> >   }


Thanks!
Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
