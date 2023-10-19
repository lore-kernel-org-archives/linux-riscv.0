Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777D2CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 14:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FZupNNmL2bQh1RESKpo5uG1sU/kNjy1yi5/LYnevOM=; b=U03sb51jV51tFv
	Df1DgbByvVXT7RNbkdNgYef5bOvRvSRu4UeqqtYEOS9jInOjbCP8X8dmoW/HxdWCUAFuSajZ4qlXC
	TvIVTqNJGPgF0E/eDOr3egCbhkoTfAfg5bes7iNvWwveGbpUar1LYes9Dffk8jrzSM5qKV1P0hvlz
	z1JmC3Ro9hPBocEyYWkGtDARwe7XcUV8/hgAcpqEZ3Qjx4tSsXGoRbuDjcFTrJvY0L+nZ8z3D9cpT
	auvL+hXzwz8L2CINLCLDnbvPXRG8umt1O5MRzzSgvxq6DUNmvYV3bLZp1Hba08OgMHmWpbsfl4bHT
	n6LdXq6ZjR4vrrnsJbMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTuP-0003BO-1j;
	Thu, 19 Oct 2023 14:21:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtTuM-0003A4-2X
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 14:21:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so79910235e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697725311; x=1698330111; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X7vXBtFp8YlW9tjprqOhSv3R1fGBRdJcwl00hTgXhRg=;
        b=M98p9BwTVutyQk+gPlJiQLCIkBLxtl77A4Oyt5H1nVsM/J1LznAWODQu5Tc8/WSj26
         csDbFwegE/HyVxhfFTf1kK6d4jgpIuWc8OxK/BhLAAJBPiqZcdlZqOZhXu7n+VuJdfNI
         mxd+YT3SwTBZ9AUTYuQiUpo1AlnpSFOaMfiR6ylgGPqic7pPcmiJFZJL2iKGgQKf0BrV
         gDMNYQ8Wbk3LdduP4qwYn3YP4XqP/75aylx0vrsy2e9oAu94uOgBOkD9dnkKEOFTOyix
         ZL9Dh+0SzWs5+XiZ7/2ZL5U0bu1iE3wvxmuuw1c+kMPD+IVYtRhoirOnoN7jZg2GIKEp
         POIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697725311; x=1698330111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7vXBtFp8YlW9tjprqOhSv3R1fGBRdJcwl00hTgXhRg=;
        b=fCwQ5rDzdaAUokTe9Y59AwxPsHmG/RFns6P7ZqfUmUGT/7rxhtloSfgx8dX56RP+ld
         cbGUSeRRZenLrDPovjay9dW2rtX90w1zls+z0TSr5wxEEHeS7HQlNJMsuCkfQ8oDACIQ
         iZy6fxSCU9N15DkSZpYbW7Y28rPMWE549DXvDyAQJ73BhK5WGnVM4SgLMBmTPfxKIGoM
         Jh4/ZvAI3DVLBsEXXsIJzsMJ5AT21mwD3y4bYi83Rphma9xcAGOLHgf8aoO/Niij17Xt
         KUGf8fjC/M87efaX5tTmJ3jbCQfs8rvr8mVT9m48SfvIAtwrgtkoMp1ZoBz7HwRIxk4E
         18IA==
X-Gm-Message-State: AOJu0YyBuIA3wlVL89AFktYQ3fhxHPjIkG5Yfs6w58bDeOSLcR0+lK/a
	yWcJ1kqrxZEI31mvAOge+gE=
X-Google-Smtp-Source: AGHT+IHJqdSqmsH4yoOH0ZRIaqUFsO89CuN/CmqmV5aQR1+q4EsQXjUOLgsJ3mv0zA5gB9n4+UM+/A==
X-Received: by 2002:a05:600c:3788:b0:402:98cd:a3e9 with SMTP id o8-20020a05600c378800b0040298cda3e9mr1891267wmr.32.1697725310504;
        Thu, 19 Oct 2023 07:21:50 -0700 (PDT)
Received: from andrea ([151.76.7.139])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c1d1600b004042dbb8925sm4640509wms.38.2023.10.19.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 07:21:50 -0700 (PDT)
Date: Thu, 19 Oct 2023 16:21:45 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
	christoph.muellner@vrull.eu, David.Laight@aculab.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <ZTE7eUyrb8+J+ORB@andrea>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_072154_849508_19B48410 
X-CRM114-Status: GOOD (  31.36  )
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

On Sun, May 21, 2023 at 01:47:13PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> =

> Zawrs [0] was ratified in november 2022 [1], so I've resurrect the patch
> adding Zawrs support for spinlocks and adapted it to recent kernel
> changes.
> =

> Also incorporated are the nice comments David Laight provided on v2.
> =

> =

> Changes since v2:
> - Rebase on top of 6.4-rc1
> - Adapt to changed alternatives Kconfig handling
> - Adapt to changed cpufeature extension handling
> - Address review comments from David Laight
>   - better handling for 32/64bit cases (less ifdefery)
>   - less macros calling macros
>   - don't duplicate __smp_load_reserved_relaxed in
>     __smp_load_reserved_aquire
> =

> Changes since v1:
> - Fixing type checking code for 32/64-bit values
> - Adjustments according to the specification change
> - Adding "depends on !XIP_KERNEL" to RISCV_ISA_ZAWRS
> =

> =

> [0] https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> [1] https://github.com/riscv/riscv-zawrs/commit/9ff54f7e7fcd95cf1b111d2e5=
4276ff1183bcd37
> =

> Christoph M=FCllner (1):
>   riscv: Add Zawrs support for spinlocks
> =

> Heiko Stuebner (1):
>   riscv: don't include kernel.h into alternative.h
> =

>  arch/riscv/Kconfig                   | 10 +++++
>  arch/riscv/include/asm/alternative.h |  1 -
>  arch/riscv/include/asm/barrier.h     | 64 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 14 ++++++
>  arch/riscv/include/asm/hwcap.h       |  1 +
>  arch/riscv/kernel/cpu.c              |  1 +
>  arch/riscv/kernel/cpufeature.c       |  1 +
>  7 files changed, 91 insertions(+), 1 deletion(-)


Hi Heiko and Christoph,

I was wondering about the plan for this series: am I missing some update to
this discussion? do we have a new version to review?

I actually went ahead (as Palmer suggested in private  :-) ) and spent some
time trying to integrate feedback provided in this thread into your changes,
obtaining the diff below (on 6.6-rc6, the #include removal fixes some nommu
builds and should/can be splitted into a separate patch); thoughts?

  Andrea


From 79d25361ddd4a14db6ce94aec140efbdf2d89684 Mon Sep 17 00:00:00 2001
From: Andrea Parri <parri.andrea@gmail.com>
Date: Wed, 18 Oct 2023 02:22:28 +0200
Subject: [PATCH] riscv: Implement LR+WRS-based smp_cond_load_{relaxed,acqui=
re}()

The Zawrs extension defines instructions allowing a core to enter
a low-power state and wait on a store to a memory location.

Introduce the Zawrs-instruction WRS.STO and use it in the polling
loops of the macros smp_cond_load_{relaxed,acquire}().

Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
[based on the arm64 implementation and work from Heiko and Christoph]
---
 arch/riscv/Kconfig                | 14 +++++++++
 arch/riscv/include/asm/barrier.h  | 26 ++++++++++++++++
 arch/riscv/include/asm/cmpxchg.h  | 51 +++++++++++++++++++++++++++++++
 arch/riscv/include/asm/hwcap.h    |  3 +-
 arch/riscv/include/asm/insn-def.h |  2 ++
 arch/riscv/kernel/cpufeature.c    |  1 +
 6 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6da..ff49f90d175ba 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -489,6 +489,20 @@ config RISCV_ISA_SVPBMT
 =

 	   If you don't know what to do here, say Y.
 =

+config RISCV_ISA_ZAWRS
+	bool "Zawrs extension support for wait-on-reservation-set instructions"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the Zawrs
+	   extension and enable its usage.
+
+	   The Zawrs extension defines a pair of instructions to be used
+	   in polling loops that allows a core to enter a low-power state
+	   and wait on a store to a memory location.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_V
 	bool
 	default y
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barr=
ier.h
index 110752594228e..7ab7a28e72210 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -71,6 +71,32 @@ do {									\
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
 =

+#define smp_cond_load_relaxed(ptr, cond_expr)				\
+({									\
+	typeof(ptr) __PTR =3D (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	for (;;) {							\
+		VAL =3D READ_ONCE(*__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		__cmpwait_relaxed(__PTR, VAL);				\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
+#define smp_cond_load_acquire(ptr, cond_expr)				\
+({									\
+	typeof(ptr) __PTR =3D (ptr);					\
+	__unqual_scalar_typeof(*ptr) VAL;				\
+	for (;;) {							\
+		VAL =3D smp_load_acquire(__PTR);				\
+		if (cond_expr)						\
+			break;						\
+		__cmpwait_relaxed(__PTR, VAL);				\
+	}								\
+	(typeof(*ptr))VAL;						\
+})
+
 #include <asm-generic/barrier.h>
 =

 #endif /* __ASSEMBLY__ */
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpx=
chg.h
index 2f4726d3cfcc2..65bc21379f40e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -8,8 +8,11 @@
 =

 #include <linux/bug.h>
 =

+#include <asm/alternative-macros.h>
 #include <asm/barrier.h>
 #include <asm/fence.h>
+#include <asm/hwcap.h>
+#include <asm/insn-def.h>
 =

 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
@@ -360,4 +363,52 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 =

+#define __CMPWAIT_CASE(w, sz)						\
+static inline void __cmpwait_case_##sz(volatile void *ptr,		\
+				       unsigned long val)		\
+{									\
+	unsigned long tmp;						\
+									\
+	asm volatile(ALTERNATIVE(					\
+		__nops(4),						\
+		"lr." #w "\t" "%[tmp], %[v]\n\t"			\
+		"xor	%[tmp], %[tmp], %[val]\n\t"			\
+		"bnez	%[tmp], 1f\n\t"					\
+		WRS_sto "\n\t"						\
+		"1:\n",							\
+		0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS)		\
+	: [tmp] "=3D&r" (tmp), [v] "+A" (*(u##sz *)ptr)			\
+	: [val] "rJ" (val)						\
+	: "memory");							\
+}
+
+__CMPWAIT_CASE(w, 32);
+__CMPWAIT_CASE(d, 64);
+
+#undef __CMPWAIT_CASE
+
+#define __CMPWAIT_GEN()							\
+static __always_inline void __cmpwait(volatile void *ptr,		\
+				      unsigned long val,		\
+				      int size)				\
+{									\
+	switch (size) {							\
+	case 4:								\
+		return __cmpwait_case_32(ptr, val);			\
+	case 8:								\
+		return __cmpwait_case_64(ptr, val);			\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	unreachable();							\
+}
+
+__CMPWAIT_GEN()
+
+#undef __CMPWAIT_GEN
+
+#define __cmpwait_relaxed(ptr, val)					\
+	__cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7b58258f6c7c..afabcbf849526 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_ZAWRS		43
 =

 #define RISCV_ISA_EXT_MAX		64
 =

@@ -69,8 +70,6 @@
 =

 #ifndef __ASSEMBLY__
 =

-#include <linux/jump_label.h>
-
 unsigned long riscv_get_elf_hwcap(void);
 =

 struct riscv_isa_ext_data {
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/ins=
n-def.h
index 6960beb75f329..fecb744ed7b29 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -196,4 +196,6 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 =

+#define WRS_sto	".long 0x01d00073"
+
 #endif /* __ASM_INSN_DEF_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1cfbba65d11ae..044682f54f78f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -181,6 +181,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 };
 =

 const size_t riscv_isa_ext_count =3D ARRAY_SIZE(riscv_isa_ext);
-- =

2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
