Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90230C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kBWbWMJeiWtsxpYEL4UwxaDXl4Cu5rLlXkzRe+UUoE=; b=aE80NpR7PC/x71EnIGBwbOnXCW
	Jy3fQXnjqPf8rbGE0ivscPy+8SoEOlQGWWroiug+vCLeQ/4ZFVkCEvF/xtt547ZFeAc+FBedMri87
	z0bXvAGRJBM/S1mmKhJjZ52wzTgMb0Q5iVWEOA712anT81nyD6a7PynYJSHaiRxcRq7exZmqbd+r6
	wklrDZLpjrcF4Dcv09tnhj75B3V2MH9uXvk490TPFQmXKvvAQyag6A+Rd+GogcsANWX8JTrUgm30z
	YyqUoZkqVL+RZrww2uEprhofR3HkGC31daz4ckBPkmAXskvlUCyLvSfrqEVsXE0cHwcuiVXMQjV82
	Kvc7A9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhfiz-00FJLy-9w; Thu, 21 Apr 2022 22:56:33 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhfiu-00FJKy-Od
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 22:56:31 +0000
Received: by mail-qk1-x730.google.com with SMTP id j6so4681552qkp.9
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 15:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CQPKNi0BaTD+rxlffck9NNikRRrnCX9PAL2NggOjY8M=;
 b=SH+1rhcsztKrKbRBV1dMt2X/Bo9k9vwxwf6OJuUGH8OqdQCnKkfCZ+3qPIfL3guRKY
 QZuwgkTWNoEVdeXadfGVzVeE3PNnqqN6ax6HlWpFBIA0ynpY/pw6mnyY0ltc7S2Nzuzd
 CsnR26A2XgP4hx0eJGlJ530BCGAVVNo+5LcxnB5XFH0PL+b+4hDCmXnHeVPb5gXMggvI
 E9pxIVvfSCo/k/DkqLfkCFNgm7+Id1CxiLQR0xy7cVuwY86n+FQVpSJ+HiLB3y7VoGe9
 LcLjht3MOuJm8q6vT8XeowzS1vCjNs26cpSxrWaYgEHwxplT24uweaxXueh11/7ZyKyb
 0HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQPKNi0BaTD+rxlffck9NNikRRrnCX9PAL2NggOjY8M=;
 b=MqK9r3LroOOV40WPn5b226pEqJ1rQbnP12CKZYpkj0JgtX2ydSZ0UL3yvdAgAoJRVG
 nCVlq2zDQPHvZXAUgHjMx7RHsTKEEF+foAa8cfM8HNY/tiGDzXAWjw+C5U/m7dxU0oYE
 Xj3LyhrnVU5Llxl4KFGWafuinabBy5XISVVWLcX/v0u96iHJFjvR5HzLgGkSdQmnW9me
 ccYwr+ntf9Zxe/bzQJbU0T4d+QlRvEOI1GM6LRJC2H3o2D1T0QX7MRTrBMvD0NoJRRTo
 h0+FFILzQSWalwXgwrMc7aCdQvRMsidwrKGTaAkd7QEPxc/anTh6LppbA0qQjVoso7Xu
 ziCg==
X-Gm-Message-State: AOAM531UaS2ur82/AH5oe9iWDcnj1lTARtY3Em3Vcvx90tNWWJB9rhlG
 q7z+18vEVzVyx+LrxSU4I4w=
X-Google-Smtp-Source: ABdhPJzlbhY67UXUaL2gv8hSkadiC/+XAOFMcmtpWMjFGWTkeawMR9fxN0c6S6ODRXKEmGlVvE/MDw==
X-Received: by 2002:a05:620a:14f:b0:69e:e6d2:9915 with SMTP id
 e15-20020a05620a014f00b0069ee6d29915mr1068216qkn.59.1650581786564; 
 Thu, 21 Apr 2022 15:56:26 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228]) by smtp.gmail.com with ESMTPSA id
 j62-20020a378741000000b0069ebd098171sm164736qkd.8.2022.04.21.15.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:56:25 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id 5A70627C005A;
 Thu, 21 Apr 2022 18:56:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 21 Apr 2022 18:56:24 -0400
X-ME-Sender: <xms:F-FhYlg4snxfrc5dm9dBdXOBqVzyK_vfqzI2B6eMJdHMzJToHikGLA>
 <xme:F-FhYqApl7_PjAxyiUSTQEbrJ29vbG6OC0BFEkm19XK6-p7_yOs2-sBGF_yEu6K7T
 g6SljKumybIC9lYjg>
X-ME-Received: <xmr:F-FhYlHRonmGTM0Qc5ZCc1CJyKxCEPni1DPC8Owkv5Z7fFw_i5S_UGcnfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdefgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepvdekhfduveeitdehueehfeekgfduhfetvdefhffhteejhfelvddtgefftddu
 feffnecuffhomhgrihhnpehthhgvrdgrqhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhm
 thhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvd
 dqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:F-FhYqRR8YuGLZxnXkf4L1DLyJI2qLYaoZf1JCVb-fXpazY4rwYFOg>
 <xmx:F-FhYizfjBxZ-XxW-dYE5mJHTWxjd_XWnKSe46DiMiVDGed2Rfj3rQ>
 <xmx:F-FhYg4q8x24o5MdOJMSVd-_yCYT04Ofpq-DO3GIxKa1tpPLBaGXOQ>
 <xmx:GOFhYtpkkXrforR2K1UxR16NTi0JGHfaWevZizjirA1W3_joCSG7Aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 18:56:21 -0400 (EDT)
Date: Fri, 22 Apr 2022 06:56:17 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Dan Lustig <dlustig@nvidia.com>, Andrea Parri <parri.andrea@gmail.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Message-ID: <YmHhEY56jYXh68Q/@tardis>
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
 <Ylt6zqPgimmKpJzg@tardis>
 <CAJF2gTTZnBh_z31VK81cYiBrTt5NRVpSahoPh35Zo4Ns5hCv7A@mail.gmail.com>
 <3f7dd397-2ccd-dfa3-a0ec-dcce6cbc0476@nvidia.com>
 <CAJF2gTQzPsM0X-gib3V0EYYU=weMFXMQZCEbru9y+dDbV+9eXQ@mail.gmail.com>
 <41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com>
 <CAJF2gTSD1CsMf2uFXbv4qekh72r6iY-0BVaBwA8Ntu0L6WcEPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTSD1CsMf2uFXbv4qekh72r6iY-0BVaBwA8Ntu0L6WcEPA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_155628_887511_97A5E2EE 
X-CRM114-Status: GOOD (  41.06  )
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
Content-Type: multipart/mixed; boundary="===============3835913222087355796=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3835913222087355796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ADJQozg734NwqhZw"
Content-Disposition: inline


--ADJQozg734NwqhZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 21, 2022 at 05:39:09PM +0800, Guo Ren wrote:
> Hi Dan,
>=20
> On Thu, Apr 21, 2022 at 1:03 AM Dan Lustig <dlustig@nvidia.com> wrote:
> >
> > On 4/20/2022 1:33 AM, Guo Ren wrote:
> > > Thx Dan,
> > >
> > > On Wed, Apr 20, 2022 at 1:12 AM Dan Lustig <dlustig@nvidia.com> wrote:
> > >>
> > >> On 4/17/2022 12:51 AM, Guo Ren wrote:
> > >>> Hi Boqun & Andrea,
> > >>>
> > >>> On Sun, Apr 17, 2022 at 10:26 AM Boqun Feng <boqun.feng@gmail.com> =
wrote:
> > >>>>
> > >>>> On Sun, Apr 17, 2022 at 12:49:44AM +0800, Guo Ren wrote:
> > >>>> [...]
> > >>>>>
> > >>>>> If both the aq and rl bits are set, the atomic memory operation is
> > >>>>> sequentially consistent and cannot be observed to happen before a=
ny
> > >>>>> earlier memory operations or after any later memory operations in=
 the
> > >>>>> same RISC-V hart and to the same address domain.
> > >>>>>                 "0:     lr.w     %[p],  %[c]\n"
> > >>>>>                 "       sub      %[rc], %[p], %[o]\n"
> > >>>>>                 "       bltz     %[rc], 1f\n".
> > >>>>> -               "       sc.w.rl  %[rc], %[rc], %[c]\n"
> > >>>>> +               "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> > >>>>>                 "       bnez     %[rc], 0b\n"
> > >>>>> -               "       fence    rw, rw\n"
> > >>>>>                 "1:\n"
> > >>>>> So .rl + fence rw, rw is over constraints, only using sc.w.aqrl i=
s more proper.
> > >>>>>
> > >>>>
> > >>>> Can .aqrl order memory accesses before and after it (not against i=
tself,
> > >>>> against each other), i.e. act as a full memory barrier? For exampl=
e, can
> > >>> From the RVWMO spec description, the .aqrl annotation appends the s=
ame
> > >>> effect with "fence rw, rw" to the AMO instruction, so it's RCsc.
> > >>>
> > >>> Not only .aqrl, and I think the below also could be an RCsc when
> > >>> sc.w.aq is executed:
> > >>> A: Pre-Access
> > >>> B: lr.w.rl ADDR-0
> > >>> ...
> > >>> C: sc.w.aq ADDR-0
> > >>> D: Post-Acess
> > >>> Because sc.w.aq has overlap address & data dependency on lr.w.rl, t=
he
> > >>> global memory order should be A->B->C->D when sc.w.aq is executed. =
For
> > >>> the amoswap
> > >>
> > >> These opcodes aren't actually meaningful, unfortunately.
> > >>
> > >> Quoting the ISA manual chapter 10.2: "Software should not set the rl=
 bit
> > >> on an LR instruction unless the aq bit is also set, nor should softw=
are
> > >> set the aq bit on an SC instruction unless the rl bit is also set."
> > > 1. Oh, I've missed the behind half of the ISA manual. But why can't we
> > > utilize lr.rl & sc.aq in software programming to guarantee the
> > > sequence?
> >
> > lr.aq and sc.rl map more naturally to hardware than lr.rl and sc.aq.
> > Plus, they just aren't common operations to begin with, e.g., there
> > is no smp_store_acquire() or smp_load_release(), nor are there
> > equivalents in C/C++ atomics.
> First, thx for pointing out that my patch violates the rules defined
> in the ISA manual. I've abandoned these parts in v3.
>=20
> It's easy to let hw support lr.rl & sc.aq (eg: our hardware supports
> them). I agree there are no equivalents in C/C++ atomics. But they are
> useful for LR/SC pairs to implement atomic_acqurie/release semantics.
> Compare below:
> A): fence rw, r; lr
> B): lr.rl
> The A has another "fence ,r" effect in semantics, it's over commit
> from a software design view.
>=20
> ps: Current definition has problems:
> #define RISCV_ACQUIRE_BARRIER           "\tfence r , rw\n"
> #define RISCV_RELEASE_BARRIER           "\tfence rw,  w\n"
>=20
> #define __cmpxchg_release(ptr, old, new, size)                          \
> ...
>                 __asm__ __volatile__ (                                  \
>                         RISCV_RELEASE_BARRIER                           \
>                         "0:     lr.w %0, %2\n"                          \
>=20
> That means "fence rw, w" can't prevent lr.w beyond the fence, we need
> a "fence.rw. r" here. Here is the Fixup patch which I'm preparing:
>=20

That's not true. Note that RELEASE semantics only applies to the
write/store part of a read-modify-write atomic, similarly, ACQUIRE only
applies to the read/load part. For example, the following litmus test
can observe the exists clause being true.

	{}

	P0(int *x, int *y)
	{
		int r0;
		int r1;

		r0 =3D cmpxchg_acquire(x, 0, 1);
		r1 =3D READ_ONCE(*y);
	}

	P1(int *x, int *y)
	{
		int r0;

		WRITE_ONCE(*y, 1);
		smp_mb();
		r0 =3D READ_ONCE(*x);
	}

	exists (0:r0=3D0 /\ 0:r1=3D0 /\ 1:r0=3D0)

Regards,
Boqun

> From 14c93aca0c3b10cf134791cf491b459972a36ec4 Mon Sep 17 00:00:00 2001
> From: Guo Ren <guoren@linux.alibaba.com>
> Date: Thu, 21 Apr 2022 16:44:48 +0800
> Subject: [PATCH] riscv: atomic: Fixup wrong __atomic_acquire/release_fence
>  implementation
>=20
> Current RISCV_ACQUIRE/RELEASE_BARRIER is for spin_lock not atomic.
>=20
> __cmpxchg_release(ptr, old, new, size)
> ...
>         __asm__ __volatile__ (
>                         RISCV_RELEASE_BARRIER
>                         "0:     lr.w %0, %2\n"
>=20
> The "fence rw, w -> lr.w" is invalid and lr would beyond fence, so
> we need "fence rw, r -> lr.w" here. Atomic acquire is the same.
>=20
> Fixes: 0123f4d76ca6 ("riscv/spinlock: Strengthen implementations with fen=
ces")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Andrea Parri <parri.andrea@gmail.com>
> Cc: Dan Lustig <dlustig@nvidia.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/riscv/include/asm/atomic.h  | 4 ++--
>  arch/riscv/include/asm/cmpxchg.h | 8 ++++----
>  arch/riscv/include/asm/fence.h   | 4 ++++
>  3 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/ato=
mic.h
> index aef8aa9ac4f4..7cd66eba6ec3 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -20,10 +20,10 @@
>  #include <asm/barrier.h>
>=20
>  #define __atomic_acquire_fence()                                       \
> -       __asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
> +       __asm__ __volatile__(RISCV_ATOMIC_ACQUIRE_BARRIER "":::"memory")
>=20
>  #define __atomic_release_fence()                                       \
> -       __asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
> +       __asm__ __volatile__(RISCV_ATOMIC_RELEASE_BARRIER"" ::: "memory");
>=20
>  static __always_inline int arch_atomic_read(const atomic_t *v)
>  {
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cm=
pxchg.h
> index 9269fceb86e0..605edc2fca3b 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -217,7 +217,7 @@
>                         "       bne  %0, %z3, 1f\n"                     \
>                         "       sc.w %1, %z4, %2\n"                     \
>                         "       bnez %1, 0b\n"                          \
> -                       RISCV_ACQUIRE_BARRIER                           \
> +                       RISCV_ATOMIC_ACQUIRE_BARRIER                    \
>                         "1:\n"                                          \
>                         : "=3D&r" (__ret), "=3D&r" (__rc), "+A" (*__ptr) =
   \
>                         : "rJ" ((long)__old), "rJ" (__new)              \
> @@ -229,7 +229,7 @@
>                         "       bne %0, %z3, 1f\n"                      \
>                         "       sc.d %1, %z4, %2\n"                     \
>                         "       bnez %1, 0b\n"                          \
> -                       RISCV_ACQUIRE_BARRIER                           \
> +                       RISCV_ATOMIC_ACQUIRE_BARRIER                    \
>                         "1:\n"                                          \
>                         : "=3D&r" (__ret), "=3D&r" (__rc), "+A" (*__ptr) =
   \
>                         : "rJ" (__old), "rJ" (__new)                    \
> @@ -259,7 +259,7 @@
>         switch (size) {                                                 \
>         case 4:                                                         \
>                 __asm__ __volatile__ (                                  \
> -                       RISCV_RELEASE_BARRIER                           \
> +                       RISCV_ATOMIC_RELEASE_BARRIER                    \
>                         "0:     lr.w %0, %2\n"                          \
>                         "       bne  %0, %z3, 1f\n"                     \
>                         "       sc.w %1, %z4, %2\n"                     \
> @@ -271,7 +271,7 @@
>                 break;                                                  \
>         case 8:                                                         \
>                 __asm__ __volatile__ (                                  \
> -                       RISCV_RELEASE_BARRIER                           \
> +                       RISCV_ATOMIC_RELEASE_BARRIER                    \
>                         "0:     lr.d %0, %2\n"                          \
>                         "       bne %0, %z3, 1f\n"                      \
>                         "       sc.d %1, %z4, %2\n"                     \
> diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fenc=
e.h
> index 2b443a3a487f..4e446d64f04f 100644
> --- a/arch/riscv/include/asm/fence.h
> +++ b/arch/riscv/include/asm/fence.h
> @@ -4,9 +4,13 @@
>  #ifdef CONFIG_SMP
>  #define RISCV_ACQUIRE_BARRIER          "\tfence r , rw\n"
>  #define RISCV_RELEASE_BARRIER          "\tfence rw,  w\n"
> +#define RISCV_ATOMIC_ACQUIRE_BARRIER   "\tfence w , rw\n"
> +#define RISCV_ATOMIC_RELEASE_BARRIER   "\tfence rw,  r\n"
>  #else
>  #define RISCV_ACQUIRE_BARRIER
>  #define RISCV_RELEASE_BARRIER
> +#define RISCV_ATOMIC_ACQUIRE_BARRIER
> +#define RISCV_ATOMIC_RELEASE_BARRIER
>  #endif
>=20
>  #endif /* _ASM_RISCV_FENCE_H */
>=20
>=20
> >
> > > 2. Using .aqrl to replace the fence rw, rw is okay to ISA manual,
> > > right? And reducing a fence instruction to gain better performance:
> > >                 "0:     lr.w     %[p],  %[c]\n"
> > >                  "       sub      %[rc], %[p], %[o]\n"
> > >                  "       bltz     %[rc], 1f\n".
> > >  -               "       sc.w.rl  %[rc], %[rc], %[c]\n"
> > >  +              "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> > >                  "       bnez     %[rc], 0b\n"
> > >  -               "       fence    rw, rw\n"
> >
> > Yes, using .aqrl is valid.
> Thx and I think the below is also valid, right?
>=20
> -                       RISCV_RELEASE_BARRIER                           \
> -                       "       amoswap.w %0, %2, %1\n"                 \
> +                       "       amoswap.w.rl %0, %2, %1\n"              \
>=20
> -                       "       amoswap.d %0, %2, %1\n"                 \
> -                       RISCV_ACQUIRE_BARRIER                           \
> +                       "       amoswap.d.aq %0, %2, %1\n"              \
>=20
> >
> > Dan
> >
> > >>
> > >> Dan
> > >>
> > >>> The purpose of the whole patchset is to reduce the usage of
> > >>> independent fence rw, rw instructions, and maximize the usage of the
> > >>> .aq/.rl/.aqrl aonntation of RISC-V.
> > >>>
> > >>>                 __asm__ __volatile__ (                             =
     \
> > >>>                         "0:     lr.w %0, %2\n"                     =
     \
> > >>>                         "       bne  %0, %z3, 1f\n"                =
     \
> > >>>                         "       sc.w.rl %1, %z4, %2\n"             =
     \
> > >>>                         "       bnez %1, 0b\n"                     =
     \
> > >>>                         "       fence rw, rw\n"                    =
     \
> > >>>                         "1:\n"                                     =
     \
> > >>>
> > >>>> we end up with u =3D=3D 1, v =3D=3D 1, r1 on P0 is 0 and r1 on P1 =
is 0, for the
> > >>>> following litmus test?
> > >>>>
> > >>>>     C lr-sc-aqrl-pair-vs-full-barrier
> > >>>>
> > >>>>     {}
> > >>>>
> > >>>>     P0(int *x, int *y, atomic_t *u)
> > >>>>     {
> > >>>>             int r0;
> > >>>>             int r1;
> > >>>>
> > >>>>             WRITE_ONCE(*x, 1);
> > >>>>             r0 =3D atomic_cmpxchg(u, 0, 1);
> > >>>>             r1 =3D READ_ONCE(*y);
> > >>>>     }
> > >>>>
> > >>>>     P1(int *x, int *y, atomic_t *v)
> > >>>>     {
> > >>>>             int r0;
> > >>>>             int r1;
> > >>>>
> > >>>>             WRITE_ONCE(*y, 1);
> > >>>>             r0 =3D atomic_cmpxchg(v, 0, 1);
> > >>>>             r1 =3D READ_ONCE(*x);
> > >>>>     }
> > >>>>
> > >>>>     exists (u=3D1 /\ v=3D1 /\ 0:r1=3D0 /\ 1:r1=3D0)
> > >>> I think my patchset won't affect the above sequence guarantee. Curr=
ent
> > >>> RISC-V implementation only gives RCsc when the original value is the
> > >>> same at least once. So I prefer RISC-V cmpxchg should be:
> > >>>
> > >>>
> > >>> -                       "0:     lr.w %0, %2\n"                     =
     \
> > >>> +                      "0:     lr.w.rl %0, %2\n"                   =
       \
> > >>>                         "       bne  %0, %z3, 1f\n"                =
     \
> > >>>                         "       sc.w.rl %1, %z4, %2\n"             =
     \
> > >>>                         "       bnez %1, 0b\n"                     =
     \
> > >>> -                       "       fence rw, rw\n"                    =
     \
> > >>>                         "1:\n"                                     =
     \
> > >>> +                        "       fence w, rw\n"                    \
> > >>>
> > >>> To give an unconditional RSsc for atomic_cmpxchg.
> > >>>
> > >>>>
> > >>>> Regards,
> > >>>> Boqun
> > >>>
> > >>>
> > >>>
> > >
> > >
> > >
>=20
>=20
>=20
> --
> Best Regards
>  Guo Ren
>=20
> ML: https://lore.kernel.org/linux-csky/

--ADJQozg734NwqhZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmJh4QgACgkQSXnow7UH
+rjbMwgAibXhL/PGFhY4YDVW4ifVuBc1hDq9S16KT/hYVXuoxm9yJvdJ9aOCuTOx
Iodj6fbxLlF0CBfbrcxzsGrQS/vP/JsL+9CA7k3Z1S30/ywtc3MZ8LKWEcQRkkXH
kaw012z2WuuvS81iKxB/+fgRZEfwrrBwkbxzhzimHLKhwa6dS9hLRfPCp64BZ3v4
nkskMHYXOVkjQZ/efann2mciYK8Hgj5hGZsOzNf4helshuEg8LsQtldLiT3/gQ27
U+bCFGrD+CRD2g6W7uShqlIDDlU+Hr40J3VRvvmjgv+wmi+eKnBd9r9MmI7iGp0X
kINUNJm+/95Q+7tPeUXZ4it7xOPneA==
=yJKO
-----END PGP SIGNATURE-----

--ADJQozg734NwqhZw--


--===============3835913222087355796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3835913222087355796==--

