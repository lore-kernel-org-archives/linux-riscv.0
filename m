Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E75EC982C1
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=99wsoA1zmEVwGo3gJhL8/VB880YN/jvuY80bv0KzC4o=; b=rdbpBp/yry5lbPUfPaI6sLCBtO
	6HLGPnY6PQn1izJnFh1fC8rTqdKI6CPG/nIL4rdZ/1pEfBV4jvpxmb5ZWAjeOuGZjFXnbYWeXl9Dt
	o1Wb+0uXLlaa6/YseB9NXBYN2aIDKgA5N8e/rBNTkdclodPpwhmYpvyVwQFvx7YiuP38QRI5FE7VT
	sOJL9t9YWGVHHMPLlxNt1x+T56+0cFQuXD6GSaxu8PuoABA4rVvKLJ3dk2CaId/J4hiDhmB8ldMgt
	QQZXqCTVjrDyUqR2IbtSMwZmhEoTPdCMYogmevAqabvu5D0zKQ+wxui8rUklIEDk/ibI31QtZwnXS
	UJatElxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sKM-00000009iIZ-10Bz;
	Wed, 16 Sep 2026 16:17:42 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6sKJ-00000009iI3-10o5
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 16:17:41 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4cdc68c1so180491d50.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Sep 2026 09:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789575457; cv=none;
        d=google.com; s=arc-20260327;
        b=qyN9ol/KHL6m60VEDpJSdf29pxdLmXE1UH7PlWGYeJrZKo0+gXTWWId3JCRzUbem+C
         a56ynDDVkxv6J9RzASBepwhdedNJx17Yd2vKUz4CrN6CWbhRRh6t7QSAKCzZWOozKge1
         mcL10gU2n6+lpiBS7vyrAhVxnSVRSzIBeqhDm6Buid9NZTUNAqrtSqcr/beRgo+6G8bz
         0u7XTLhUWGBZSxUCeizsFIJNtLX3Hu1nKDLyDMS2wZBclAGXjn3MK3La8PQWmcZ3186S
         65cUmvlVlekYyuvezHZXNKn6ADAXf6/k/k7DDalMBK63HEUW/F+iG0UTdWCS8jjkmpgY
         M4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=6Zu+rp2wCwzsomTmeAznU3Xcy8b37OGWL83J8MuNrIk=;
        fh=d+qB5m2wKLYB9W3Fm178y7DPKNxq//gbcDTNsQmpqHc=;
        b=UGrYXpp7S69GkgX36oqkiuxtHzpCqs5t+m1aNHYKqxM9ayCydbDhFwZL43tT61dU4o
         ilwHDtSO+qdjYqRAoFcJQRud2/KDnNWi0V8D8YtIeAhdQI4eh1M33g09SqHNT6mU33qj
         qwwDVIQ5zlRj2qoesRaKDdorpjgYYSow7KSQ7mx2Lg+EmejHG5JzAeVhUKjuNuB63bHx
         FzL064XV+OB4u9Vy/HgM9dvUe9KfUkrzlpAOQGFFkLcBLJLxjSnh3YomxvZIX/1g+pMn
         bljKJvlwrV6+7gKVHpOgZCoola04JOoYchNO6KewnXi0vexGcYYQGI3t+CVe1wML479j
         SzMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789575457; x=1790180257; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Zu+rp2wCwzsomTmeAznU3Xcy8b37OGWL83J8MuNrIk=;
        b=FF5deqoiR//rxO2mc3v5j+uOqmMysJbgZA/XCHZqAmKzpyXyNSmF66CW5hu5xckXTb
         bzC3zm8MggRZiObaKwbbe8hN/6WhcBoCOqntG/FDhsvLTHsNC1KUPGXCA0KbEpb4IDjD
         nVUsHVVlBBKX4JvWjY6LpY1/mZ8vf4i+1k59vhqfAwhNtLcE9hKJMeIzoK6LcnUT5/Sm
         2bSwt3YCM6rNcyf/Tq14gXYp66QHyVEb3pKoPBKd3JoNoBLKNxu5C/PmpjqS+edB2Tk0
         BjLaPiHIoh+viW61XoXQFL7gzeimDYOyBCf0Jze7T2YanrgfAEbQUOkVt8gsN6tWJjF/
         TnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575457; x=1790180257;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Zu+rp2wCwzsomTmeAznU3Xcy8b37OGWL83J8MuNrIk=;
        b=cl0UG3cNXq55aB4eX1HXTYXqSZAhTn1KkBYZ0Sq8H+h/iJXAMg2gRM4x27pZ2a734i
         daQnKBZmcFZ5nuPzR4p/ZM5vYbWZqHeX1UxMM7O3Wfe4PnqabcZjb7p7C7iE6OalcZ0T
         rFFgdPjIhcavQFgntskRdU6qoFIF+9m4ICidvKSamNcLjeuA/d0lyWG/QYFMxa9QBr1x
         PLJwbwOJt+hh21y7aCYEgJ2bJE1rmTfy/HUWCZf9bwL8650vvnLli38t2UUGG+4CxaPg
         frl4uNDUehHC3crzGjbW7f956B8F91pIUwrhw1wwcC4R4+GtxGYnCBrgFh7y4+87V23E
         KThg==
X-Forwarded-Encrypted: i=1; AKwUvBwjglC35na8Zp9XHw49/gR9wfS2tv9ZuKBXueo77REEpdKRy/8pepthE7aBFAOYtsyoYiBJGH3EvZ9A4w==@lists.infradead.org
X-Gm-Message-State: AFuF++kElaXdBfwr9RCuAAF3RaiQS4/oloLB5yD90UdZNKHC1e0eoFG5
	qIzkSb6ZIZLkhkvNxj+HFymB9t/iC4fKpQOSdVx5XCFEV9ewS07gPnp0ZTU2HcUkDIk3hUrpL4V
	Gm+W0oO8TG7BJJwqHMiq1G9f0LvLUNww=
X-Gm-Gg: AYBFou02pOFmUVxziaAyZaJ70KV1ErbhxW/hmQLy1vjk0TQp0W0Pl5oM2zf6lckFd70
	+2zn0ezpgJCbpYL2slAGAFIZrsov5X9QyKxukqwiKxh06+qYggfherR3q1pZV0d9wU2H1I+Q1F/
	EZQ25FA61zwoyzoY/A4WLjF552DHkC3sjHS3/ur7Jch2PDRF15C3X1KCctABn5tTYwlbOMGEwfA
	0Vcq6HSrZbK0BYXf2wYtiHtm7pUfAvFCqE2g9jpe/YAk07o+z76/QhLhgwqt4KJ3FsFN1wg/LuW
	dGi2fQi6U4Lqxg2JN8SFCw4NQ3i5ycmRiRGDmtQqKcgnOgHCx7XiQzysstSANbsb
X-Received: by 2002:a05:690e:4248:b0:668:3d3e:17ce with SMTP id
 956f58d0204a3-6716330d09cmr1083975d50.4.1789575457085; Wed, 16 Sep 2026
 09:17:37 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 16 Sep 2026 11:17:36 -0500
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 16 Sep 2026 11:17:36 -0500
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20260915100938.1337401-1-mkchauras@gmail.com>
References: <20260915100938.1337401-1-mkchauras@gmail.com>
MIME-Version: 1.0
Date: Wed, 16 Sep 2026 11:17:36 -0500
X-Gm-Features: AcwNN1Vix9N3Wt5oSO53Rrr7xZRS3mS3LSXn__U97oCPVBZRtBhbEn6_Ltb1Tek
Message-ID: <CAPAsAGwUnRncpGr47Pq2y7+7AOiGUu4d1FQNnXow4b78kYGMHg@mail.gmail.com>
Subject: Re: [PATCH V3] powerpc/kasan: require memintrinsic prefix support for KASAN
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	kees@kernel.org, amachhiw@linux.ibm.com, ritesh.list@gmail.com, 
	nikhilks@linux.ibm.com, mahesh@linux.ibm.com, robh@kernel.org, 
	sayalip@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_091739_374172_9694F02A 
X-CRM114-Status: GOOD (  31.81  )
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

"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> writes:

Hi,
I fed this patch to an AI for review, and the review results are included below.
Please take a look. From my side, I agree with all of the points
raised by AI in the
review, and I think they all need to be addressed. There is also a diff with
the suggested changes at the very end of this mail.


> powerpc unconditionally selects GENERIC_ENTRY. The GENERIC_ENTRY
> infrastructure relies on the compiler emitting __asan_mem*() calls at
> instrumented mem*() sites rather than plain memset/memcpy/memmove, so
> that entry/exit paths calling those functions are not instrumented.
>
> [ ... ]
>
> When GENERIC_ENTRY is set, both guards suppress the C wrappers for
> memset/memcpy/memmove and the __underlying_mem*() redirections. This
> is only safe when the compiler supports the prefixed __asan_mem*()
> intrinsics. On older toolchains (e.g. GCC 9) that lack this support,
> plain mem*() calls from instrumented code fall through to the raw
> assembly implementations in mem_64.S / copy_32.S, completely bypassing
> the KASAN shadow check.
>
> Other arches with GENERIC_ENTRY (x86, s390, loongarch, riscv) do not
> hit this because their CI toolchains are always new enough to support
> the prefix flag.
>
> [ ... ]
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com
> Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

The thread in the Closes: link is about an early boot hang, but the
commit message only describes mem*() calls bypassing the shadow check.
Bypassed checks would lose coverage, not hang the machine.  Is the
mechanism of the hang understood?

Looking at the state before this commit, the !CC_HAS_KASAN_MEMINTRINSIC_PREFIX
macros that bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature") added to
asm/kasan.h emit two ELFv2 global entry points back to back:

  #define _GLOBAL_TOC_KASAN(fn)
          _GLOBAL_TOC(fn);
          _GLOBAL_TOC(__##fn)

With the _GLOBAL_TOC() definition from asm/ppc_asm.h that expands, for
memcpy_64.S, to:

  memcpy:
  0:      addis r2,r12,(.TOC.-0b)@ha
          addi  r2,r2,(.TOC.-0b)@l
          .localentry memcpy,.-memcpy       <- local entry is memcpy+8
  __memcpy:
  0:      addis r2,r12,(.TOC.-0b)@ha        <- this is memcpy+8
          addi  r2,r2,(.TOC.-0b)@l
          .localentry __memcpy,.-__memcpy

Assembling exactly that for powerpc64le gives memcpy st_other 0x60
(local entry offset 8), and memcpy+8 is the __memcpy TOC prologue.

Every same-TOC caller of memcpy() or memmove() is resolved by the
linker to the local entry, so it lands on that second prologue with r12
holding whatever the caller left there, and returns with r2 pointing
at garbage.  Same-TOC callers do not reload r2 after the call.  With
GENERIC_ENTRY, mm/kasan/shadow.c no longer provides memcpy(), so on a
toolchain without the prefix parameter every instrumented file calls
the memcpy symbol directly and hits this.  That matches an early hang
that only shows up with GCC 9.

This commit makes the hang go away because the dual-entry macro is
deleted, but the commit message attributes the fix to something else.
Could the message describe the r2 corruption, and since this repairs a
regression from the GENERIC_ENTRY conversion, should it carry:

  Fixes: bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature")

On the claim that other GENERIC_ENTRY architectures "do not hit this
because their CI toolchains are always new enough": x86, s390, riscv
and loongarch with GCC 8 to 12 build exactly the same configuration,
CONFIG_KASAN=y without CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX, and
run with mem*() unchecked.  scripts/Makefile.kasan documents that as
the intended behaviour:

  # Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
  # instead. With compilers that don't support this option, compiler-inserted
  # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.

and mm/kasan/kasan_test_c.c skips the affected tests with "Test
requires checked mem*()".  So the situation the message describes is
the accepted upstream state for old toolchains, not something specific
to powerpc.

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2580e27e4328..b27ed9739eea 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -7,6 +7,10 @@ config CC_HAS_ELFV2
>  config CC_HAS_PREFIXED
>  	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
>
> +config PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> +	def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=kernel-address -mllvm -asan-kernel-mem-intrinsic-prefix=1)) || \
> +		 (CC_IS_GCC && $(cc-option,-fsanitize=kernel-address --param asan-kernel-mem-intrinsic-prefix=1))
> +
>  config CC_HAS_PCREL
>  	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
>  	# where pcrel code is not generated if -msoft-float, -mno-altivec, or

[ ... ]

> @@ -220,9 +224,9 @@ config PPC
>  	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
>  	select HAVE_ARCH_JUMP_LABEL
>  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
> -	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14
> -	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
> -	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
> +	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14 && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> +	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> +	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
>  	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
>  	select HAVE_ARCH_KCSAN
>  	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC

This drops KASAN from powerpc entirely for GCC 8 through 12, which are
inside the supported range in Documentation/process/changes.rst (GNU C
8.1 minimum).  An existing .config with CONFIG_KASAN=y silently loses
it on olddefconfig once HAVE_ARCH_KASAN is no longer selected.

Given that the actual breakage is the broken memcpy/memmove entry
points, is it necessary to go this far?  Keeping one _GLOBAL_TOC()
prologue for __memcpy and making memcpy a plain alias of it (a second
label plus a matching .localentry, or a global entry that branches to
__memcpy) would restore the pre-GENERIC_ENTRY behaviour, with mem*()
unchecked on old compilers exactly like the other GENERIC_ENTRY
architectures.  That also keeps a Fixes-tagged backport candidate from
removing a feature on stable kernels.


> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index a690e7da53c2..d62756b87ba4 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -2,20 +2,9 @@
>  #ifndef __ASM_KASAN_H
>  #define __ASM_KASAN_H
>
> -#if defined(CONFIG_KASAN) && !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX)
> -#define _GLOBAL_KASAN(fn)			\
> -	_GLOBAL(fn);				\
> -	_GLOBAL(__##fn)
> -#define _GLOBAL_TOC_KASAN(fn)			\
> -	_GLOBAL_TOC(fn);			\
> -	_GLOBAL_TOC(__##fn)
> -#define EXPORT_SYMBOL_KASAN(fn)			\
> -	EXPORT_SYMBOL(__##fn)
> -#else /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
>  #define _GLOBAL_KASAN(fn)	_GLOBAL(fn)
>  #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(fn)
>  #define EXPORT_SYMBOL_KASAN(fn)
> -#endif /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
>
>  #ifndef __ASSEMBLER__
>

this isn't a bug, but after this change _GLOBAL_KASAN(), _GLOBAL_TOC_KASAN()
and EXPORT_SYMBOL_KASAN() are unconditional identity macros with a single
empty one.  Should the five users in mem_64.S, memcpy_64.S and copy_32.S
switch to _GLOBAL()/_GLOBAL_TOC() and the macros go away?

Related leftover: arch/powerpc/kernel/prom_init_check.sh still has

  has_renamed_memintrinsics()
  {
          grep -q "^CONFIG_KASAN=y$" "${KCONFIG_CONFIG}" && \
                  ! grep -q
"^CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y" "${KCONFIG_CONFIG}"
  }

  if has_renamed_memintrinsics
  then
          MEM_FUNCS="__memcpy __memset"

which can no longer be true on powerpc after this commit.  Should that
branch be removed in the same cleanup?

> diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
> index 1981bd4036b5..72b5c93a2b84 100644
> --- a/arch/powerpc/include/asm/string.h
> +++ b/arch/powerpc/include/asm/string.h
> @@ -29,29 +29,10 @@ extern void * memchr(const void *,int,__kernel_size_t);
>  void memcpy_flushcache(void *dest, const void *src, size_t size);
>
>  #ifdef CONFIG_KASAN
> -/* __mem variants are used by KASAN to implement instrumented meminstrinsics. */
> -#ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> +/* Used by mm/kasan/shadow.c as raw backends to bypass KASAN checking. */
>  #define __memset memset

this isn't a bug, but the new comment names only mm/kasan/shadow.c.
The same __memset()/__memcpy() names are used by mm/kasan/generic.c as
well (DEFINE_ASAN_SET_SHADOW() and release_alloc_meta()), so would
"used by mm/kasan as raw backends" be more accurate?


---
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b27ed9739eea..2580e27e4328 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -7,10 +7,6 @@ config CC_HAS_ELFV2
 config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)

-config PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
-	def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=kernel-address
-mllvm -asan-kernel-mem-intrinsic-prefix=1)) || \
-		 (CC_IS_GCC && $(cc-option,-fsanitize=kernel-address --param
asan-kernel-mem-intrinsic-prefix=1))
-
 config CC_HAS_PCREL
 	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
 	# where pcrel code is not generated if -msoft-float, -mno-altivec, or
@@ -224,9 +220,9 @@ config PPC
 	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
-	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14 &&
PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
-	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU &&
PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
-	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 &&
PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14
+	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
+	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KCSAN
 	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index d62756b87ba4..599a9e02af02 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -2,10 +2,6 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H

-#define _GLOBAL_KASAN(fn)	_GLOBAL(fn)
-#define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(fn)
-#define EXPORT_SYMBOL_KASAN(fn)
-
 #ifndef __ASSEMBLER__

 #include <asm/page.h>
diff --git a/arch/powerpc/kernel/prom_init_check.sh
b/arch/powerpc/kernel/prom_init_check.sh
index 3090b97258ae..3155cc722e48 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -13,21 +13,8 @@
 # If you really need to reference something from prom_init.o add
 # it to the list below:

-has_renamed_memintrinsics()
-{
-	grep -q "^CONFIG_KASAN=y$" "${KCONFIG_CONFIG}" && \
-		! grep -q "^CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y" "${KCONFIG_CONFIG}"
-}
-
-if has_renamed_memintrinsics
-then
-	MEM_FUNCS="__memcpy __memset"
-else
-	MEM_FUNCS="memcpy memset"
-fi
-
 WHITELIST="add_reloc_offset __bss_start __bss_stop copy_and_flush
-_end enter_prom $MEM_FUNCS reloc_offset __secondary_hold
+_end enter_prom memcpy memset reloc_offset __secondary_hold
 __secondary_hold_acknowledge __secondary_hold_spinloop __start
 logo_linux_clut224 btext_prepare_BAT
 reloc_got2 kernstart_addr memstart_addr linux_banner _stext
diff --git a/arch/powerpc/lib/copy_32.S b/arch/powerpc/lib/copy_32.S
index 933b685e7ab6..97eb9ca0cc23 100644
--- a/arch/powerpc/lib/copy_32.S
+++ b/arch/powerpc/lib/copy_32.S
@@ -10,7 +10,6 @@
 #include <asm/errno.h>
 #include <asm/ppc_asm.h>
 #include <asm/code-patching-asm.h>
-#include <asm/kasan.h>

 #define COPY_16_BYTES		\
 	lwz	r7,4(r4);	\
@@ -87,7 +86,7 @@ EXPORT_SYMBOL(memset16)
  * We therefore skip the optimised bloc that uses dcbz. This jump is
  * replaced by a nop once cache is active. This is done in machine_init()
  */
-_GLOBAL_KASAN(memset)
+_GLOBAL(memset)
 	cmplwi	0,r5,4
 	blt	7f

@@ -147,7 +146,6 @@ _GLOBAL_KASAN(memset)
 	bdnz	9b
 	blr
 EXPORT_SYMBOL(memset)
-EXPORT_SYMBOL_KASAN(memset)

 /*
  * This version uses dcbz on the complete cache lines in the
@@ -160,12 +158,12 @@ EXPORT_SYMBOL_KASAN(memset)
  * We therefore jump to generic_memcpy which doesn't use dcbz. This jump is
  * replaced by a nop once cache is active. This is done in machine_init()
  */
-_GLOBAL_KASAN(memmove)
+_GLOBAL(memmove)
 	cmplw	0,r3,r4
 	bgt	backwards_memcpy
 	/* fall through */

-_GLOBAL_KASAN(memcpy)
+_GLOBAL(memcpy)
 1:	b	generic_memcpy
 	patch_site	1b, patch__memcpy_nocache

@@ -241,8 +239,6 @@ _GLOBAL_KASAN(memcpy)
 65:	blr
 EXPORT_SYMBOL(memcpy)
 EXPORT_SYMBOL(memmove)
-EXPORT_SYMBOL_KASAN(memcpy)
-EXPORT_SYMBOL_KASAN(memmove)

 generic_memcpy:
 	srwi.	r7,r5,3
diff --git a/arch/powerpc/lib/mem_64.S b/arch/powerpc/lib/mem_64.S
index 6fd06cd20faa..40eaedd31486 100644
--- a/arch/powerpc/lib/mem_64.S
+++ b/arch/powerpc/lib/mem_64.S
@@ -8,7 +8,6 @@
 #include <asm/processor.h>
 #include <asm/errno.h>
 #include <asm/ppc_asm.h>
-#include <asm/kasan.h>

 #ifndef CONFIG_KASAN
 _GLOBAL(__memset16)
@@ -29,7 +28,7 @@ EXPORT_SYMBOL(__memset32)
 EXPORT_SYMBOL(__memset64)
 #endif

-_GLOBAL_KASAN(memset)
+_GLOBAL(memset)
 	neg	r0,r3
 	rlwimi	r4,r4,8,16,23
 	andi.	r0,r0,7			/* # bytes to be 8-byte aligned */
@@ -95,9 +94,8 @@ _GLOBAL_KASAN(memset)
 	stb	r4,0(r6)
 	blr
 EXPORT_SYMBOL(memset)
-EXPORT_SYMBOL_KASAN(memset)

-_GLOBAL_TOC_KASAN(memmove)
+_GLOBAL_TOC(memmove)
 	cmplw	0,r3,r4
 	bgt	backwards_memcpy
 	b	memcpy
@@ -139,4 +137,3 @@ _GLOBAL(backwards_memcpy)
 	mtctr	r7
 	b	1b
 EXPORT_SYMBOL(memmove)
-EXPORT_SYMBOL_KASAN(memmove)
diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
index b5a67e20143f..0cedd455231a 100644
--- a/arch/powerpc/lib/memcpy_64.S
+++ b/arch/powerpc/lib/memcpy_64.S
@@ -7,7 +7,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
-#include <asm/kasan.h>

 #ifndef SELFTEST_CASE
 /* For big-endian, 0 == most CPUs, 1 == POWER6, 2 == Cell */
@@ -15,7 +14,7 @@
 #endif

 	.align	7
-_GLOBAL_TOC_KASAN(memcpy)
+_GLOBAL_TOC(memcpy)
 BEGIN_FTR_SECTION
 #ifdef __LITTLE_ENDIAN__
 	cmpdi	cr7,r5,0
@@ -227,4 +226,3 @@ END_FTR_SECTION_IFCLR(CPU_FTR_UNALIGNED_LD_STD)
 	blr
 #endif
 EXPORT_SYMBOL(memcpy)
-EXPORT_SYMBOL_KASAN(memcpy)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
