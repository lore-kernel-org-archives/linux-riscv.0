Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D05C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 06:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l+s/AmxAGVnWhxII9hmgSP7oWKrXJ5zHGjNDR9nNymU=; b=DSOy1sal8Ptoea
	YAJA3xOnV2nxBagUuo5v5jyRj5nkce1u7BroA0Qr2BpGFkLV9AGmKFR6/Cvby414mGBWU2MxcGf/T
	2bgFCTrYYOL6xcnPN5ANHUcImdrCHpeWVWajG1dzjrEWdZ4WA/iSQDdLeODISki2OP3/EGetmgy5S
	HG/Q2GUjZxBE6jgRf1zu+0h2dTALPYYCq9p2IN4xInbFI8i2fCnuuiRpI6t2b8K8IGJ1NHJACxy2j
	b0FH7YnuY6EuJ06L+onOm8yfH/gZP30oKpwA4OyCmrPT5Q46Z+z/Qh9xGm03ZTAhuCP+oRBy6EU0e
	cYCX4uWMhLnEogyuNSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3peg-00000008DJE-2aRz;
	Tue, 08 Sep 2026 06:50:06 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pee-00000008DIq-0DXm
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 06:50:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4994587a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 23:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788850202; x=1789455002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0N0giRdggNHYhrEdwLleOIkya5cDy0uT5Ra+zX3SKY=;
        b=fj5cp+egLJeIAbeT8f71UUrngsMN0p5cKCb6IuK5/+sRK+87auGeHxChLLMVz0+H51
         Vb1kVl/G66YWxuSNaafNmG55Xsn10QcH3m0JwrorADrH7xKIgb0tvAZAbG0KL2dFDsQj
         UUO2iaxSpPKWWEBjKfteTGdVya0qoQlzfoQfnQ1ulMI2DKo3hYxdPUjD9Dadrlb7yevP
         YcYhfcKr8R/ItT7C0vfQ6JiyHCLDdT71Iq8mVFGwoTwcySmzx2f05jiYvl/0Ny6HGLl/
         7F8OLk8r5xJbxmdqBWjR5N57na7Fe+weVGQcqVs7Uc3zNjOKYBfHYDF6NRutc1hpAwCJ
         eq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850202; x=1789455002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0N0giRdggNHYhrEdwLleOIkya5cDy0uT5Ra+zX3SKY=;
        b=TeqQZ3FQVAsd6mk7zVgKMRsO5zdzmQL/6AkoGDpw/3cWiA5wTWCKUcE9Yy9gcocjiv
         VhJX0ekbBRwUPuxtj6z06q7xtSQAVHGWPLEuVHifk7Cgf+u8i8A8JLkt7NjZ/LINJfwx
         Os2I9ywZnO08r3+WIi287ba0YJmDPdK7XVMpqoXi/EEjcbknq6gi0b7fH7HVBMW+oddy
         bsCg6+s/rTFqVsW2KNTSRtCmCzHxKmX6VS+Z2wolkB5/uneaaOmt6kkp8iYdjWY9k/RA
         Ow+QX72jiMVEnwEqQdvoOk/ZWfFrqdTvXrHsKVT8TDe2xXUTnV/Esv94fG3mpOhPxWBe
         fbaw==
X-Forwarded-Encrypted: i=1; AKwUvBxyJFR37tiXtYcS8XPuaNyFxatwr8mkzc1AVbo37ZooBZHAqy7fQL/VsXYxot+4GLZ1V0rVzOc9yvR2Xg==@lists.infradead.org
X-Gm-Message-State: AFuF++lrfuol9Ibi/F61CvmPyFplGX3rZn5XdWZGZsMQ2Sn4O3dea20m
	n8R46Zpua0nc3NsTn6qSgWaLLa9TSIjACF7VkBU2/DXcSfHF3F095/PT
X-Gm-Gg: AYBFou32EcasFhTYYL1Ic4czbyn4FM0n2UTgN+cx0vkcur+MmU17IH2STu56nCycCPM
	oVSPoXmD0kG3YHcBKuC2SfT6hlFhJgFzYucSt1i024iD5AhPiStuBju0qiMYLuWCcA2JcschuYu
	gZ5t6rvmaA6ZTKjJ4Tjv8gfPZtE30QHr9J8QMttxyEcNdSeN95js2rkKHgBkIEBdohRcroTATqV
	pZQ6yT8eW80Mwg3u0dQMcQlVc/NWrA0VQHE0ynpkJFqIl8pYTHjkTDSTsOuadF1ILHW7MT+s83h
	A2eDQlOixFJVVaKF5QO00gFzg8okh6MnGau3HTE4IKoq/wUhVt9pGdOrxM366Z38i604uCAxiSJ
	vo6QNmUcKjTXXaHXW7qV1pl39TKM2McOvBRQPl4r8TypoDeeRn0i29AafQqttwSrUmZ9K+iwUqR
	rLFcFIPrrTv2jCpukl/alPa6Uv5ymNIldzXxokPLflM0GG7X7QgtR6fpuV15QbpcQis1RdN/7Uy
	yZml9eAEtdsuU965x6c9quTva4lHDcMtoujEQP8sCI=
X-Received: by 2002:a17:90b:2b43:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-39b25ed34f3mr47298760a91.0.1788850202170;
        Mon, 07 Sep 2026 23:50:02 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([122.161.53.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm24493928a91.10.2026.09.07.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:50:01 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kees@kernel.org,
	mkchauras@gmail.com,
	amachhiw@linux.ibm.com,
	ritesh.list@gmail.com,
	robh@kernel.org,
	sayalip@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH] powerpc/kasan: require memintrinsic prefix support for KASAN
Date: Tue,  8 Sep 2026 12:19:48 +0530
Message-ID: <20260908064948.999530-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_235004_117595_B9D1B221 
X-CRM114-Status: GOOD (  28.76  )
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

powerpc unconditionally selects GENERIC_ENTRY. The GENERIC_ENTRY
infrastructure relies on the compiler emitting __asan_mem*() calls at
instrumented mem*() sites rather than plain memset/memcpy/memmove, so
that entry/exit paths calling those functions are not instrumented.

This assumption is encoded in two places:

  mm/kasan/shadow.c:
    #if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) &&
        !defined(CONFIG_GENERIC_ENTRY)

  include/linux/fortify-string.h:
    #if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) &&
        !defined(CONFIG_GENERIC_ENTRY)

When GENERIC_ENTRY is set, both guards suppress the C wrappers for
memset/memcpy/memmove and the __underlying_mem*() redirections. This
is only safe when the compiler supports the prefixed __asan_mem*()
intrinsics. On older toolchains (e.g. GCC 9) that lack this support,
plain mem*() calls from instrumented code fall through to the raw
assembly implementations in mem_64.S / copy_32.S, completely bypassing
the KASAN shadow check.

Other arches with GENERIC_ENTRY (x86, s390, loongarch, riscv) do not
hit this because their CI toolchains are always new enough to support
the prefix flag.

Background: the !GENERIC_ENTRY guard was introduced by commit 69d4c0d32186
("entry, kasan, x86: Disallow overriding mem*() functions", Peter Zijlstra,
Jan 2023). The root problem is that the KASAN C wrappers override the
linker symbol memset/memcpy/memmove globally, so any call from noinstr or
__no_sanitize_address code (e.g. irqentry_enter/irqentry_exit) would still
reach the KASAN shadow-check wrapper -- at a point where KASAN invariants
may not hold. The compiler prefix approach (Marco Elver, Feb 2023,
commit 51287dcb00cc) solves this by having the compiler emit __asan_memset
at instrumented call sites and bare memset inside __no_sanitize_address
functions, splitting the decision at code-generation time rather than at
link time.

A manual C-level override cannot replicate this split: a single linker
symbol cannot be made to resolve differently depending on the caller.

x86 also placed its raw memset/memcpy/memmove implementations in
.noinstr.text (same commit, 69d4c0d32186), which is the other half of
the fix: noinstr callers hit the raw assembly directly, safely bypassing
KASAN. PowerPC has not done this. Placing mem_64.S / memcpy_64.S /
copy_32.S implementations in .noinstr.text would be the complementary
long-term fix that could re-enable KASAN on older toolchains, but it
requires care around linker stub overflow on large PPC64 kernels (the
same reason powerpc uses NOKPROBE_SYMBOL rather than noinstr for its
interrupt handlers -- see the comment in asm/interrupt.h). That work
is left as a follow-up.

For now, introduce PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX, an arch-local
compiler probe that mirrors the same check as CC_HAS_KASAN_MEMINTRINSIC_PREFIX
in lib/Kconfig.kasan but lives outside the 'if KASAN' block to avoid a
recursive dependency (CC_HAS_KASAN_MEMINTRINSIC_PREFIX depends on KASAN
which depends on HAVE_ARCH_KASAN). Gate the three HAVE_ARCH_KASAN selects
on this new symbol so that KASAN is not offered as a config option on
toolchains that cannot support it correctly with GENERIC_ENTRY.

Since KASAN on powerpc now unconditionally implies
CC_HAS_KASAN_MEMINTRINSIC_PREFIX, the old !CC_HAS_KASAN_MEMINTRINSIC_PREFIX
code paths in asm/kasan.h and asm/string.h are dead. Clean them up:

- asm/kasan.h: remove the dual-entry-point variant of _GLOBAL_KASAN /
  _GLOBAL_TOC_KASAN / EXPORT_SYMBOL_KASAN that emitted both memset and
  __memset as entry points to the same assembly.  These aliases were only
  needed so the C KASAN wrappers in shadow.c could call __memset() to
  reach raw memory ops; with the compiler prefix approach the wrappers are
  not used at all for mem* on powerpc.

- asm/string.h: remove the separate __memset/__memcpy/__memmove symbol
  declarations and the memset/memcpy/memmove macro redirections for
  uninstrumented files that were needed on old toolchains.  Simplify the
  CONFIG_KASAN block to just the three #define aliases (which are still
  used by shadow.c as raw backends).

- cputable.c, prom_init.c: update stale comments that said GCC replaces
  memcpy() with __memcpy() under KASAN; with the prefix flag it emits
  __asan_memcpy() instead.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/all/96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/Kconfig              | 10 +++++++---
 arch/powerpc/include/asm/kasan.h  | 19 ++++++++-----------
 arch/powerpc/include/asm/string.h | 25 +++++--------------------
 arch/powerpc/kernel/cputable.c    |  6 +++---
 arch/powerpc/kernel/prom_init.c   |  4 ++--
 5 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2580e27e4328..b27ed9739eea 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -7,6 +7,10 @@ config CC_HAS_ELFV2
 config CC_HAS_PREFIXED
 	def_bool PPC64 && $(cc-option, -mcpu=power10 -mprefixed)
 
+config PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=kernel-address -mllvm -asan-kernel-mem-intrinsic-prefix=1)) || \
+		 (CC_IS_GCC && $(cc-option,-fsanitize=kernel-address --param asan-kernel-mem-intrinsic-prefix=1))
+
 config CC_HAS_PCREL
 	# Clang has a bug (https://github.com/llvm/llvm-project/issues/62372)
 	# where pcrel code is not generated if -msoft-float, -mno-altivec, or
@@ -220,9 +224,9 @@ config PPC
 	select HAVE_ARCH_HUGE_VMAP		if PPC_RADIX_MMU || PPC_8xx
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
-	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14
-	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU
-	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64
+	select HAVE_ARCH_KASAN			if PPC32 && PAGE_SHIFT <= 14 && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	select HAVE_ARCH_KASAN			if PPC_RADIX_MMU && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	select HAVE_ARCH_KASAN			if PPC_BOOK3E_64 && PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
 	select HAVE_ARCH_KASAN_VMALLOC		if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KCSAN
 	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index a690e7da53c2..ffada5f51b2b 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -2,20 +2,17 @@
 #ifndef __ASM_KASAN_H
 #define __ASM_KASAN_H
 
-#if defined(CONFIG_KASAN) && !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX)
-#define _GLOBAL_KASAN(fn)			\
-	_GLOBAL(fn);				\
-	_GLOBAL(__##fn)
-#define _GLOBAL_TOC_KASAN(fn)			\
-	_GLOBAL_TOC(fn);			\
-	_GLOBAL_TOC(__##fn)
-#define EXPORT_SYMBOL_KASAN(fn)			\
-	EXPORT_SYMBOL(__##fn)
-#else /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
+/*
+ * powerpc requires CC_HAS_KASAN_MEMINTRINSIC_PREFIX whenever KASAN is
+ * enabled (see PPC_CC_HAS_KASAN_MEMINTRINSIC_PREFIX in arch/powerpc/Kconfig),
+ * so the compiler always emits __asan_mem*() at instrumented call sites and
+ * bare mem*() inside __no_sanitize_address / noinstr code.  The old dual
+ * entry-point trick (_GLOBAL_KASAN emitting both memset and __memset) is
+ * therefore never needed.
+ */
 #define _GLOBAL_KASAN(fn)	_GLOBAL(fn)
 #define _GLOBAL_TOC_KASAN(fn)	_GLOBAL_TOC(fn)
 #define EXPORT_SYMBOL_KASAN(fn)
-#endif /* CONFIG_KASAN && !CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/powerpc/include/asm/string.h b/arch/powerpc/include/asm/string.h
index 1981bd4036b5..743126e3dcc1 100644
--- a/arch/powerpc/include/asm/string.h
+++ b/arch/powerpc/include/asm/string.h
@@ -29,29 +29,14 @@ extern void * memchr(const void *,int,__kernel_size_t);
 void memcpy_flushcache(void *dest, const void *src, size_t size);
 
 #ifdef CONFIG_KASAN
-/* __mem variants are used by KASAN to implement instrumented meminstrinsics. */
-#ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+/*
+ * powerpc requires CC_HAS_KASAN_MEMINTRINSIC_PREFIX whenever KASAN is
+ * enabled, so the compiler emits __asan_mem*() at instrumented sites.
+ * The raw mem* symbols are always safe to call directly.
+ */
 #define __memset memset
 #define __memcpy memcpy
 #define __memmove memmove
-#else /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
-void *__memset(void *s, int c, __kernel_size_t count);
-void *__memcpy(void *to, const void *from, __kernel_size_t n);
-void *__memmove(void *to, const void *from, __kernel_size_t n);
-#ifndef __SANITIZE_ADDRESS__
-/*
- * For files that are not instrumented (e.g. mm/slub.c) we
- * should use not instrumented version of mem* functions.
- */
-#define memcpy(dst, src, len) __memcpy(dst, src, len)
-#define memmove(dst, src, len) __memmove(dst, src, len)
-#define memset(s, c, n) __memset(s, c, n)
-
-#ifndef __NO_FORTIFY
-#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
-#endif
-#endif /* !__SANITIZE_ADDRESS__ */
-#endif /* CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX */
 #endif /* CONFIG_KASAN */
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index 6f6801da9dc1..44115f904c2c 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -36,8 +36,8 @@ void __init set_cur_cpu_spec(struct cpu_spec *s)
 
 	t = PTRRELOC(t);
 	/*
-	 * use memcpy() instead of *t = *s so that GCC replaces it
-	 * by __memcpy() when KASAN is active
+	 * use memcpy() instead of *t = *s so that the compiler replaces it
+	 * by __asan_memcpy() when KASAN is active
 	 */
 	memcpy(t, s, sizeof(*t));
 
@@ -55,7 +55,7 @@ static struct cpu_spec * __init setup_cpu_spec(unsigned long offset,
 
 	/*
 	 * Copy everything, then do fixups. Use memcpy() instead of *t = *s
-	 * so that GCC replaces it by __memcpy() when KASAN is active
+	 * so that the compiler replaces it by __asan_memcpy() when KASAN is active
 	 */
 	memcpy(t, s, sizeof(*t));
 
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index eb9f556b0937..b763720c68b6 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -1365,8 +1365,8 @@ static void __init prom_check_platform_support(void)
 	/*
 	 * First copy the architecture vec template
 	 *
-	 * use memcpy() instead of *vec = *vec_template so that GCC replaces it
-	 * by __memcpy() when KASAN is active
+	 * use memcpy() instead of *vec = *vec_template so that the compiler
+	 * replaces it by __asan_memcpy() when KASAN is active
 	 */
 	memcpy(&ibm_architecture_vec, &ibm_architecture_vec_template,
 	       sizeof(ibm_architecture_vec));
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
