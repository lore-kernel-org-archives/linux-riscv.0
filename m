Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D38E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+u8VPZjgsZMiRA2BUIwuZYETBFufVdzz7LkeW+se7Ew=; b=IdfzARTv/YRTR8
	uPm6j1jZxV1QEv38cLTpx1xpl/ytvm2S9eXrtZ8vLkzIYsTPtBekFk/QoEc29mLn81HKDWHSlgKV6
	0DKEI82nMgJVtI42sPGx7XLtgXvqesBeXUUPI9RUng97jv0gQIQnkeWoY0G0ETyapoxL/A1us3Vje
	kXmF40Limf2l7GrbGy1NfO3L1fZ5EzHS3NpZP7wR15rQE8XfUvSxouV5x1MlO0BeKhF70RBPBPEB7
	O7Bvlt1wUEm3KMWbDHPWSNwXITNy9q3QkTC9VfLWMYflZ4xS9mj04ZvmZ8jgJWZ35zllUvmlPmqmA
	kcdHDIWtWQkQi8vRX0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwJ4-0000000H57Z-3kDG;
	Wed, 18 Dec 2024 15:49:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNwFg-0000000H4Ng-1z8c;
	Wed, 18 Dec 2024 15:46:22 +0000
Date: Wed, 18 Dec 2024 16:46:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=pJxxVRCMHJdngSkzFgGSzBMnBJkDpDuzYyVQMMKK8s3jy4v88LTqHGSsTUFgwaCSaDtpLZ
	9Hz+NSXpB8buHGBeis4umt1p6y1gfXS+W/AM4nWblrH5gJgmsDTKEmgPHIxrL1TURvlt99
	aT2WVnX2bYOlW3X+S+Mecm0lX7V/SRbRpNstAWH6PZljh+0jmjttXmJWtOpxsaQWnDaeRw
	l9mFBpQQhDK9hywRLcUiS2JorNnttHGskIcqaBxCKPMKpA3hMQ9YEKUiIRZnZzY8m8Wfok
	kefZk2jPlkA3QweN8xWEXObFI0S9FXUHUoYjCf486xhj3+SxKW3ibx1LPjcCaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734536777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2PCfBV+N+0D5I2Uv7/hn0t8iMmZx5bcl62I6AxJsW8A=;
	b=wbyFSBHCt2AOMp8iwQLVuUtFnc5a3Q7N/OLe/EpksL5g0UriFWxndXCsQj4joqste9Sv6B
	7KCkZHwqquxkbHBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Conor Dooley <conor@kernel.org>
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
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218-action-matchbook-571b597b7f55@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_074620_790589_08FA35D6 
X-CRM114-Status: GOOD (  18.86  )
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

Hi Conor,

On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Wei=DFschuh wrote:
> > The generic storage implementation provides the same features as the
> > custom one. However it can be shared between architectures, making
> > maintenance easier.
> > =

> > Co-developed-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  arch/riscv/Kconfig                                 |  3 +-
> >  arch/riscv/include/asm/vdso.h                      |  2 +-
> >  .../include/asm/vdso/{time_data.h =3D> arch_data.h}  |  8 +-
> >  arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
> >  arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
> >  arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
> >  arch/riscv/kernel/vdso.c                           | 90 +-------------=
--------
> >  arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
> >  arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
> >  9 files changed, 18 insertions(+), 124 deletions(-)
> =

> Fails to build:
> Patch 7/17: Test 1/12: .github/scripts/patches/tests/build_rv32_defconfig=
.sh
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:11:33: warning: =
declaration of 'struct riscv_hwprobe' will not be visible outside of this f=
unction [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:15:41: warning: =
declaration of 'struct riscv_hwprobe' will not be visible outside of this f=
unction [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:37: error: ca=
ll to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later =
do not support implicit function declarations [-Wimplicit-function-declarat=
ion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:19:31: error: in=
compatible integer to pointer conversion initializing 'const struct vdso_ar=
ch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:22:36: error: ar=
ithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:30:40: error: in=
complete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:31:24: error: in=
compatible pointer types passing 'struct riscv_hwprobe *' to parameter of t=
ype 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:7: error: cal=
l to undeclared function 'riscv_hwprobe_key_is_valid'; ISO C99 and later do=
 not support implicit function declarations [-Wimplicit-function-declaratio=
n]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:35:35: error: in=
complete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:5: error: inc=
omplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:18: error: in=
complete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:36:44: error: in=
complete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:39:5: error: inc=
omplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:40:5: error: inc=
omplete definition of type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:43:4: error: ari=
thmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:49:39: warning: =
declaration of 'struct riscv_hwprobe' will not be visible outside of this f=
unction [-Wvisibility]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:37: error: ca=
ll to undeclared function '__arch_get_vdso_u_arch_data'; ISO C99 and later =
do not support implicit function declarations [-Wimplicit-function-declarat=
ion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:53:31: error: in=
compatible integer to pointer conversion initializing 'const struct vdso_ar=
ch_data *' with an expression of type 'int' [-Wint-conversion]
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:55:36: error: ar=
ithmetic on a pointer to an incomplete type 'struct riscv_hwprobe'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:61: error: in=
complete definition of type 'const struct vdso_arch_data'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:71:29: error: us=
e of undeclared identifier 'RISCV_HWPROBE_WHICH_CPUS'
>   /build/tmp.cAQOaMfDA3/arch/riscv/kernel/vdso/hwprobe.c:72:24: error: in=
compatible pointer types passing 'struct riscv_hwprobe *' to parameter of t=
ype 'struct riscv_hwprobe *' [-Werror,-Wincompatible-pointer-types]
>   fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
> =

> Might be a clang thing, allmodconfig with clang doesn't build either.

The proposed generic storage infrastructure currently expects that all
its users also use HAVE_GENERIC_VDSO.
I missed rv32 when checking this assumption.

I can add a bunch of ifdefs into the storage code to handle this.

Or we re-add the time vDSO functions which were removed in commit
d4c08b9776b3 ("riscv: Use latest system call ABI").
Today there are upstream ports of musl and glibc which can use them.
(currently musl even tries to use __vdso_clock_gettime() as 64-bit only
on rv32 due to a copy-and-paste error from its rv64 code)

There is precedence in providing 64bit only vDSO functions, for example
__vdso_clock_gettime64() in arm.
I do have a small, so far untested, proof-of-concept patch for it.
This would even be less code than the ifdefs.

What do you think about it?


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
