Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57409C88E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hh7SG6TrM8/qdzZ6PA9m1SfUyR/gpd/oYQnkxKfzy3E=; b=c4eWKwRQcbQDKQ
	+AVAfHkEjVuWnN29OYhV1OScPzHb+INbSXcwnNzYYKLkQc9JkGZ+HYfQdSetNQL9upyy1q5xdQ1UG
	hVM41h1aTQz4Bgvdx05yNWUAHGtDEE0vBYSXeplmsWfjXvMymzI2ot2QeEdlQrHdQQY0lzT5s4xNO
	O+1RSZGpOp8zZ/S2ULaluiFx5BBEVs9gxkaF/aQzBtLhe4ODjA9q4WD1dV1Yy/qJJnMinHsnmNcPo
	7opxS97D6NKjI+InLNqlds59DkTrYc9e7l+1fLURphmJ3NxScxETPUuw9kYLpUfWBlQaounE9CUJI
	bLbe+RHkFGXuh6JPQ1Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q48-00000009LKu-2mFk;
	Wed, 16 Sep 2026 13:52:48 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6q44-00000009LK9-02X5
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 13:52:45 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-52fa9c055b5so23374361cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789566762; x=1790171562; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrXhm30p4Oapdc6/FVPPsH4AbsMAlVpIDcdh0Tr8GC4=;
        b=CtC254cAmCTYAe4nil6FzQ74PonedNJjmLcaZArCU0vojXONubQQsbedYMMKanNpxu
         B34ifxgU/Ft1ilTF/0P2IRd4xhtwKVUgzZF4kibidmkVBRUGoP7/917KEsb5Cc4jmNNE
         zIP3B9EyOTRYtAmrpFq/Bz/0bzrXBrMQy3IEY81xQTv9zvBfXPR3ma6RyG3sK0//R9Bf
         GKwed9L1rw4yyyvx02Qj6w80/lDWG9uFxKYI/bF7PrTMr6Rwb1VBSkrqrQSHjrX3pM8e
         V2sHxPRFOUp9IGjENTMR6djgFxP8b0u5dcg2lCzLx8mDbRLbnYcr8rde1Nj1hkS5ffPh
         mWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789566762; x=1790171562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VrXhm30p4Oapdc6/FVPPsH4AbsMAlVpIDcdh0Tr8GC4=;
        b=ki9d65GgiiR2S3lAsmOyriYB1Cx55kzxkTO5RSZ861soIkzR+7Kpk8WTal7kH0h3Nm
         i95eC3NXZ3WXt5sLmHKUbVT+WqkKDoK5YCB9lSJGbTugzx/uYzvd9r8RpAxwnGM29Dfj
         JozYMnu/jvSxJ+ZL1aIbJ53G9armQOfkDqbmoHCEs0K6nmPWr1OKKf9vKfZ1gTm/FTej
         YR5CbH6nzHTjZJ0DXCZtGvzQBHlbxA+iUgRgBChEC+w5JbJ7RdAOFDlMDWgX8PKLYAXF
         aBSP/mkQn3V52+c0WyA55NBT98ZvBy0gFXzkw1IpcG1gKLW5wy5VQuEZfd2mP+UrG5/D
         fg9g==
X-Forwarded-Encrypted: i=1; AKwUvBzZrqUfKxbFDH1Vn2oGOOhGnfypE/hf3s4KAjIx3wJ5KDqKHtgsWQm7L4h+8iuHoRE9ZB/ikFvPmMWB5A==@lists.infradead.org
X-Gm-Message-State: AFuF++k3Vh3wA62KuZsWLG9SnmakwWcsMv15eGF1AZ+HrVsN0/QadSx5
	yLC4zNgG7Bnv5JyuCpy/vGzSE/Pz4tdgz7GJ8h4EGd3St9hWpKyEqLE2
X-Gm-Gg: AYBFou0+y+qBdjYUuyYFNnAQnsXMf5Lh/h09NSquRBj/hQ/rRBv/aTmmHgMvt3haO9W
	NZEEDyzpXqhXJGJJMaDkLCw6IQkIRviOu8ucaAb4ue27YH1GMumx/RTlTfrjXS8J2QKsnKkSlJB
	Xk3fUkv53Yp+T6wVJtCsrCGGrq8/U8xsYPsrpbGTg8q22cXCng/xuh4xAvOw7XKoOtY9X3eoBGy
	o0uwDE6UV+42vGMlw16JXVvSZuBcj8yhgPj6JqBjmrLdsJyRlVwx+MNwYBrbETY1ut6NTpFlAbI
	OzQQrfH+BIaEAzjMQLR9X/sqKET33lNUC7WhN5nBhNE9S0+juL9RH2jVPaNjcJ8tCp1UP9X1q+n
	sklTqofGoSERrw/iZpXykC5wo/VrWsHmQWa+pZcplBYQ9dZtgZur4V61xOy4HDBkkSAWK23zAzf
	IBzhDeeUxgFBOctnPHO5EjHeWtut1iPt0q3fb3ZXGxt4bC4dpQmny/YxtK+fNIgmP2jOkYEZ74C
	017xzb8R0jE85W6m1WlPdKyWlNapj1BP0FC6MZhr04ukxWMOeR4ohDP
X-Received: by 2002:ac8:5e0e:0:b0:530:f45b:4372 with SMTP id d75a77b69052e-53119f01f7fmr112879611cf.29.1789566761864;
        Wed, 16 Sep 2026 06:52:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53259aed4b0sm23229691cf.2.2026.09.16.06.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:52:41 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:22:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, kees@kernel.org, amachhiw@linux.ibm.com, ritesh.list@gmail.com, 
	nikhilks@linux.ibm.com, mahesh@linux.ibm.com, robh@kernel.org, sayalip@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH V3] powerpc/kasan: require memintrinsic prefix support
 for KASAN
Message-ID: <aqqej0mnRbfsD9EP@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260915100938.1337401-1-mkchauras@gmail.com>
 <15808e6e-a6c0-49ae-b23e-daa3785a1be0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15808e6e-a6c0-49ae-b23e-daa3785a1be0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_065244_164567_5351EDF8 
X-CRM114-Status: GOOD (  56.12  )
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

On Wed, Sep 16, 2026 at 01:09:41PM +0200, Christophe Leroy (CS GROUP) wrote:
> =

> =

> Le 15/09/2026 =E0 12:09, Mukesh Kumar Chaurasiya (IBM) a =E9crit=A0:
> > powerpc unconditionally selects GENERIC_ENTRY. The GENERIC_ENTRY
> > infrastructure relies on the compiler emitting __asan_mem*() calls at
> > instrumented mem*() sites rather than plain memset/memcpy/memmove, so
> > that entry/exit paths calling those functions are not instrumented.
> > =

> > This assumption is encoded in two places:
> > =

> >    mm/kasan/shadow.c:
> >      #if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) &&
> >          !defined(CONFIG_GENERIC_ENTRY)
> > =

> >    include/linux/fortify-string.h:
> >      #if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) &&
> >          !defined(CONFIG_GENERIC_ENTRY)
> > =

> > When GENERIC_ENTRY is set, both guards suppress the C wrappers for
> > memset/memcpy/memmove and the __underlying_mem*() redirections. This
> > is only safe when the compiler supports the prefixed __asan_mem*()
> > intrinsics. On older toolchains (e.g. GCC 9) that lack this support,
> > plain mem*() calls from instrumented code fall through to the raw
> > assembly implementations in mem_64.S / copy_32.S, completely bypassing
> > the KASAN shadow check.
> > =

> > Other arches with GENERIC_ENTRY (x86, s390, loongarch, riscv) do not
> > hit this because their CI toolchains are always new enough to support
> > the prefix flag.
> > =

> > Background: the !GENERIC_ENTRY guard was introduced by commit 69d4c0d32=
186
> > ("entry, kasan, x86: Disallow overriding mem*() functions", Peter Zijls=
tra,
> > Jan 2023). The root problem is that the KASAN C wrappers override the
> > linker symbol memset/memcpy/memmove globally, so any call from noinstr =
or
> > __no_sanitize_address code (e.g. irqentry_enter/irqentry_exit) would st=
ill
> > reach the KASAN shadow-check wrapper -- at a point where KASAN invarian=
ts
> > may not hold. The compiler prefix approach (Marco Elver, Feb 2023,
> > commit 51287dcb00cc) solves this by having the compiler emit __asan_mem=
set
> > at instrumented call sites and bare memset inside __no_sanitize_address
> > functions, splitting the decision at code-generation time rather than at
> > link time.
> > =

> > A manual C-level override cannot replicate this split: a single linker
> > symbol cannot be made to resolve differently depending on the caller.
> > =

> > x86 also placed its raw memset/memcpy/memmove implementations in
> > .noinstr.text (same commit, 69d4c0d32186), which is the other half of
> > the fix: noinstr callers hit the raw assembly directly, safely bypassing
> > KASAN. PowerPC has not done this. Placing mem_64.S / memcpy_64.S /
> > copy_32.S implementations in .noinstr.text would be the complementary
> > long-term fix that could re-enable KASAN on older toolchains, but it
> > requires care around linker stub overflow on large PPC64 kernels (the
> > same reason powerpc uses NOKPROBE_SYMBOL rather than noinstr for its
> > interrupt handlers -- see the comment in asm/interrupt.h). That work
> > is left as a follow-up.
> > =

> > For now, introduce PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX, an arch-local
> > compiler probe that mirrors the same check as CC_HAS_KASAN_MEMINTRINSIC=
_PREFIX
> > in lib/Kconfig.kasan but lives outside the 'if KASAN' block to avoid a
> > recursive dependency (CC_HAS_KASAN_MEMINTRINSIC_PREFIX depends on KASAN
> > which depends on HAVE_ARCH_KASAN). Gate the three HAVE_ARCH_KASAN selec=
ts
> > on this new symbol so that KASAN is not offered as a config option on
> > toolchains that cannot support it correctly with GENERIC_ENTRY.
> > =

> > Since KASAN on powerpc now unconditionally implies
> > CC_HAS_KASAN_MEMINTRINSIC_PREFIX, the old !CC_HAS_KASAN_MEMINTRINSIC_PR=
EFIX
> > code paths in asm/kasan.h and asm/string.h are dead. Clean them up:
> > =

> > - asm/kasan.h: remove the dual-entry-point variant of _GLOBAL_KASAN /
> >    _GLOBAL_TOC_KASAN / EXPORT_SYMBOL_KASAN that emitted both memset and
> >    __memset as entry points to the same assembly. These aliases were on=
ly
> >    needed so the C KASAN wrappers in shadow.c could call __memset() to
> >    reach raw memory ops; with the compiler prefix approach those wrappe=
rs
> >    are not used for mem* on powerpc.
> > =

> > - asm/string.h: remove the separate __memset/__memcpy/__memmove symbol
> >    declarations and the memset/memcpy/memmove macro redirections for
> >    uninstrumented files that were needed on old toolchains. Simplify the
> >    CONFIG_KASAN block to just the three #define aliases (still used by
> >    shadow.c as raw backends to bypass KASAN checking).
> > =

> > - cputable.c, prom_init.c: the memcpy is not required now as the manual
> >    instrumentation of memcpy is removed. Hence directly use *dest =3D *=
src
> >    for this.
> > =

> > Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Closes: https://lore.kernel.org/all/96dae110-f79b-4e54-8a9b-514369019b5=
d@linux.ibm.com
> > Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> =

> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> =

> > ---
> > Changelog:
> > V2 -> V3:
> > - *dest =3D *src used instead of memcpy in cputable.c and prom_init.c
> =

> We could have left the memcpy() there but I'm fine either way. What was
> important was to remove the comment as it was valid only for the
> non-CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX case.
>
I thought this would make the code look simpler.
> If for some reason you have to send a new version, it would be good to
> mention it is a revert of commit adcf59187e27 ("powerpc: don't use direct
> assignation during early boot.") as it is not necessary anymore with
> CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> =

I can send out a new version, it's just a commit message change.
> Christophe
> =

Thanks for all the effort in review and explanation.

Regards,
Mukesh

> > V2: https://lore.kernel.org/all/20260911180536.3234640-2-mkchauras@gmai=
l.com
> > =

> > V1 -> V2:
> > - Comments reworded
> > - Commit message reworded
> > V1: https://lore.kernel.org/all/20260908064948.999530-1-mkchauras@gmail=
.com
> > =

> >   arch/powerpc/Kconfig              | 10 +++++++---
> >   arch/powerpc/include/asm/kasan.h  | 11 -----------
> >   arch/powerpc/include/asm/string.h | 21 +--------------------
> >   arch/powerpc/kernel/cputable.c    | 14 ++------------
> >   arch/powerpc/kernel/prom_init.c   | 10 ++--------
> >   5 files changed, 12 insertions(+), 54 deletions(-)
> > =

> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 2580e27e4328..b27ed9739eea 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -7,6 +7,10 @@ config CC_HAS_ELFV2
> >   config CC_HAS_PREFIXED
> >   	def_bool PPC64 && $(cc-option, -mcpu=3Dpower10 -mprefixed)
> > +config PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> > +	def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=3Dkernel-address -mll=
vm -asan-kernel-mem-intrinsic-prefix=3D1)) || \
> > +		 (CC_IS_GCC && $(cc-option,-fsanitize=3Dkernel-address --param asan-=
kernel-mem-intrinsic-prefix=3D1))
> > +
> >   config CC_HAS_PCREL
> >   	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
> >   	# where pcrel code is not generated if -msoft-float, -mno-altivec, or
> > @@ -220,9 +224,9 @@ config PPC
> >   	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
> >   	select HAVE_ARCH_JUMP_LABEL
> >   	select HAVE_ARCH_JUMP_LABEL_RELATIVE
> > -	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <=3D 14
> > -	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
> > -	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
> > +	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <=3D 14 && PPC_CC_HAS=
_KASAN_MEMINTRINSIC_PREFIX
> > +	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU && PPC_CC_HAS_KASAN_MEMINTR=
INSIC_PREFIX
> > +	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && PPC_CC_HAS_KASAN_MEMINTR=
INSIC_PREFIX
> >   	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
> >   	select HAVE_ARCH_KCSAN
> >   	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
> > diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/as=
m/kasan.h
> > index a690e7da53c2..d62756b87ba4 100644
> > --- a/arch/powerpc/include/asm/kasan.h
> > +++ b/arch/powerpc/include/asm/kasan.h
> > @@ -2,20 +2,9 @@
> >   #ifndef __ASM_KASAN_H
> >   #define __ASM_KASAN_H
> > -#if defined(CONFIG_KASAN) && !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC=
_PREFIX)
> > -#define _GLOBAL_KASAN(fn)			\
> > -	_GLOBAL(fn);				\
> > -	_GLOBAL(__##fn)
> > -#define _GLOBAL_TOC_KASAN(fn)			\
> > -	_GLOBAL_TOC(fn);			\
> > -	_GLOBAL_TOC(__##fn)
> > -#define EXPORT_SYMBOL_KASAN(fn)			\
> > -	EXPORT_SYMBOL(__##fn)
> > -#else /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
> >   #define _GLOBAL_KASAN(fn)	_GLOBAL(fn)
> >   #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(fn)
> >   #define EXPORT_SYMBOL_KASAN(fn)
> > -#endif /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
> >   #ifndef __ASSEMBLER__
> > diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/a=
sm/string.h
> > index 1981bd4036b5..72b5c93a2b84 100644
> > --- a/arch/powerpc/include/asm/string.h
> > +++ b/arch/powerpc/include/asm/string.h
> > @@ -29,29 +29,10 @@ extern void * memchr(const void *,int,__kernel_size=
_t);
> >   void memcpy_flushcache(void *dest, const void *src, size_t size);
> >   #ifdef CONFIG_KASAN
> > -/* __mem variants are used by KASAN to implement instrumented meminstr=
insics. */
> > -#ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> > +/* Used by mm/kasan/shadow.c as raw backends to bypass KASAN checking.=
 */
> >   #define __memset memset
> >   #define __memcpy memcpy
> >   #define __memmove memmove
> > -#else /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
> > -void *__memset(void *s, int c, __kernel_size_t count);
> > -void *__memcpy(void *to, const void *from, __kernel_size_t n);
> > -void *__memmove(void *to, const void *from, __kernel_size_t n);
> > -#ifndef __SANITIZE_ADDRESS__
> > -/*
> > - * For files that are not instrumented (e.g. mm/slub.c) we
> > - * should use not instrumented version of mem* functions.
> > - */
> > -#define memcpy(dst, src, len) __memcpy(dst, src, len)
> > -#define memmove(dst, src, len) __memmove(dst, src, len)
> > -#define memset(s, c, n) __memset(s, c, n)
> > -
> > -#ifndef __NO_FORTIFY
> > -#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> > -#endif
> > -#endif /* !__SANITIZE_ADDRESS__ */
> > -#endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
> >   #endif /* CONFIG_KASAN */
> >   #ifdef CONFIG_PPC64
> > diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputa=
ble.c
> > index 6f6801da9dc1..6356b5c6be7b 100644
> > --- a/arch/powerpc/kernel/cputable.c
> > +++ b/arch/powerpc/kernel/cputable.c
> > @@ -35,12 +35,7 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
> >   	struct cpu_spec *t =3D &the_cpu_spec;
> >   	t =3D PTRRELOC(t);
> > -	/*
> > -	 * use memcpy() instead of *t =3D *s so that GCC replaces it
> > -	 * by __memcpy() when KASAN is active
> > -	 */
> > -	memcpy(t, s, sizeof(*t));
> > -
> > +	*t =3D *s;
> >   	*PTRRELOC(&cur_cpu_spec) =3D &the_cpu_spec;
> >   }
> > @@ -52,12 +47,7 @@ static struct cpu_spec * __init setup_cpu_spec(unsig=
ned long offset,
> >   	t =3D PTRRELOC(t);
> >   	old =3D *t;
> > -
> > -	/*
> > -	 * Copy everything, then do fixups. Use memcpy() instead of *t =3D *s
> > -	 * so that GCC replaces it by __memcpy() when KASAN is active
> > -	 */
> > -	memcpy(t, s, sizeof(*t));
> > +	*t =3D *s;
> >   	/*
> >   	 * If we are overriding a previous value derived from the real
> > diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom=
_init.c
> > index eb9f556b0937..e8e071024da5 100644
> > --- a/arch/powerpc/kernel/prom_init.c
> > +++ b/arch/powerpc/kernel/prom_init.c
> > @@ -1362,14 +1362,8 @@ static void __init prom_check_platform_support(v=
oid)
> >   	int prop_len =3D prom_getproplen(prom.chosen,
> >   				       "ibm,arch-vec-5-platform-support");
> > -	/*
> > -	 * First copy the architecture vec template
> > -	 *
> > -	 * use memcpy() instead of *vec =3D *vec_template so that GCC replace=
s it
> > -	 * by __memcpy() when KASAN is active
> > -	 */
> > -	memcpy(&ibm_architecture_vec, &ibm_architecture_vec_template,
> > -	       sizeof(ibm_architecture_vec));
> > +	/* First copy the architecture vec template */
> > +	ibm_architecture_vec =3D ibm_architecture_vec_template;
> >   	prom_strscpy_pad(ibm_architecture_vec.vec7.os_id, linux_banner, 256);
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
