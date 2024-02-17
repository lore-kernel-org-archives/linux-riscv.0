Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3D8C48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 13:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WjxKOf9oJpohiV6L26OwbFi5BR3mEFP0XrDWFQ+fsKo=; b=HoZm4XsB7oq/ivWtKCRtMFeiN1
	eM1yZWskn0uMFPlzQDkGBwbQt9T6pMAx8godZd++KWhSBL+eCrVtdMdjc3GsZLg2Fa3EtIozYKvWz
	0hdFJzLkYAy9hKztWWhDCack9kRUaPDqRntZGvGQpqcBuJBIgM+vjdgVyy6SMZ+UufGGt4loUOxws
	omr1+GYGkaLYd/CfPKU1iqvHQHiC8S/zgVZeXIaovQdrmnc0QMsWJyAb3UDMYI0B6IckIAXgVCHWx
	Bcdr9z6Hg1JCAFlbGf84S6OfxCKv5gfikFkSggnlwcnvlRO2ZBB4VOfKZR0XbXYNagxQvz3/CfrgU
	vVPhSePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVU-00000005iNN-2ecC;
	Sat, 17 Feb 2024 13:13:28 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbKVP-00000005iJz-1iu0
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 13:13:25 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-60761bdbd4cso52729817b3.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708175602; x=1708780402; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANQ9Q8CsOYoivVzOOmmpID2/0jm0rKpHZABT07NfwNQ=;
        b=YHI2jV6nJMCyk+GczFe9HyCZRH8aOznA8Ma0UtU42ExNwzwrezMlBDERlCJWp7uBTt
         T1axn4eGMk38BlwLFPxQhhLwfp2Qhp+s2jpOQSQ7hx4cMcbvtmfcEVsJ/xj9PELt2BQ3
         kcBUG+5IzqLEToEbeQNBlinjCT7yq+KY2Kbzc4S9oOpIfbR/8M+UuK77nd3z4+uJTG/+
         sn1Q0nZR+aFHgagMSivsGpguCJ4JpmbXBXk87sz8UMxHOw1pOY5dRJYcx9/ZPqwJkOAq
         suCIAN0rMCA4ammmlRDm6fo3EQeEUyb4ev2mDSpys8+Ygft2Zr8sO4uuSxlIqmeT/Eu/
         kCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708175602; x=1708780402;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANQ9Q8CsOYoivVzOOmmpID2/0jm0rKpHZABT07NfwNQ=;
        b=Rqcdm0bybqclem7cXH1uz9ak5DiP0UA1JHRUK3xJnUh5m1Cnyb16XwJ1R4j3kdxG2I
         fjT92hFpvLb7dX8bf6tSPYAoCwVxoy9D9Z51SNXs996ZO7PGUkkbHCpLn9BGa6A9Cmlf
         FpAXZvOmViq7hiRq2sWXrVQyfqbpy60awbnV7b//gdxjFXsP4RKshcgFF78ukBMsp6sy
         9SV5hvMgt7/CIJ0+6uzzZegY28TwefdbrfkBJzCR8c4jbvQeQKtsazYNF0uZ58IyGJ87
         2DKTABVoUNsDon5ySegCnZfrHwMicuSzz4Vdqpuw2VE6nDWpIeGYISW2ejzJoHLyc7YB
         FBZA==
X-Gm-Message-State: AOJu0YyX3q+3Akee/Px874uDkTSgooufBfnNJe7EOhYj+dPnxbr3dgde
	CUA4Jo43iMUv2k4ksGPRlUjxK5poKk3VtX6ap8uGVgvgck4CrwQpnEM55J4yW5pLgoN6huT/vIQ
	ZtJ9oybfQSJVugx6Ayg==
X-Google-Smtp-Source: AGHT+IFut6wtlgAhbVyHcpO0+LKbaT4xj0hzEj2c8AJpczaQ/l9VLPQeacdsPF1ojOT7WlUdtytMx2a+IO/sBEbx
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a0d:d951:0:b0:608:1b39:245c with SMTP
 id b78-20020a0dd951000000b006081b39245cmr149033ywe.9.1708175602463; Sat, 17
 Feb 2024 05:13:22 -0800 (PST)
Date: Sat, 17 Feb 2024 13:13:16 +0000
In-Reply-To: <20240217131206.3667544-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240217131206.3667544-1-ericchancf@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240217131316.3668927-1-ericchancf@google.com>
Subject: [PATCH v6 3/4] riscv/barrier: Consolidate fence definitions
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com, conor.dooley@microchip.com, parri.andrea@gmail.com, 
	emil.renner.berthing@canonical.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_051323_481571_92EB0B79 
X-CRM114-Status: GOOD (  14.71  )
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

Disparate fence implementations are consolidated into fence.h.
Also introduce RISCV_FENCE_ASM to make fence macro more reusable.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
v4 -> v5: __atomic_acquire_fence and __atomic_release_fence
omit-the-fence-on-uniprocessor optimization, and fix the typo of
RISCV_RELEASE_BARRIER when spliting the patch in v3.

v3 -> v4 fix the form that can pass the checking of checkpatch.pl.

v1 -> v2: makes compilation pass with allyesconfig instead of
defconfig only, also satisfy scripts/checkpatch.pl.
- (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+ ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

 arch/riscv/include/asm/atomic.h  |  1 -
 arch/riscv/include/asm/barrier.h |  3 +--
 arch/riscv/include/asm/cmpxchg.h |  1 -
 arch/riscv/include/asm/fence.h   | 10 +++++++---
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 31e6e2e7cc18..0e0522e588ca 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -17,7 +17,6 @@
 #endif

 #include <asm/cmpxchg.h>
-#include <asm/barrier.h>

 #define __atomic_acquire_fence()					\
 	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 173b44a989f8..15857dbc2279 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -11,13 +11,12 @@
 #define _ASM_RISCV_BARRIER_H

 #ifndef __ASSEMBLY__
+#include <asm/fence.h>

 #define nop()		__asm__ __volatile__ ("nop")
 #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
 #define nops(n)		__asm__ __volatile__ (__nops(n))

-#define RISCV_FENCE(p, s) \
-	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")

 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw, iorw)
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index a608e4d1a0a4..2fee65cc8443 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -8,7 +8,6 @@

 #include <linux/bug.h>

-#include <asm/barrier.h>
 #include <asm/fence.h>

 #define __xchg_relaxed(ptr, new, size)					\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 6c26c44dfcd6..6bcd80325dfc 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -1,10 +1,14 @@
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H

+#define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
+#define RISCV_FENCE(p, s) \
+	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
+
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
-#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
-#define RISCV_FULL_BARRIER		"\tfence rw, rw\n"
+#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, w)
+#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 42497d487a17..1c5c641075d2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -47,10 +47,10 @@
  * sufficient to ensure this works sanely on controllers that support I/O
  * writes.
  */
-#define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
-#define __io_par(v)	__asm__ __volatile__ ("fence i,ior" : : : "memory");
-#define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
-#define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");
+#define __io_pbr()	RISCV_FENCE(io, i)
+#define __io_par(v)	RISCV_FENCE(i, ior)
+#define __io_pbw()	RISCV_FENCE(iow, o)
+#define __io_paw()	RISCV_FENCE(o, io)

 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 4c58ee7f95ec..06cadfd7a237 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -12,6 +12,7 @@
 #define _ASM_RISCV_MMIO_H

 #include <linux/types.h>
+#include <asm/fence.h>
 #include <asm/mmiowb.h>

 /* Generic IO read/write.  These perform native-endian accesses. */
@@ -131,8 +132,8 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * doesn't define any ordering between the memory space and the I/O space.
  */
 #define __io_br()	do {} while (0)
-#define __io_ar(v)	({ __asm__ __volatile__ ("fence i,ir" : : : "memory"); })
-#define __io_bw()	({ __asm__ __volatile__ ("fence w,o" : : : "memory"); })
+#define __io_ar(v)	RISCV_FENCE(i, ir)
+#define __io_bw()	RISCV_FENCE(w, o)
 #define __io_aw()	mmiowb_set_pending()

 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index 0b2333e71fdc..52ce4a399d9b 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -7,7 +7,7 @@
  * "o,w" is sufficient to ensure that all writes to the device have completed
  * before the write to the spinlock is allowed to commit.
  */
-#define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
+#define mmiowb()	RISCV_FENCE(o, w)

 #include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
--
2.44.0.rc0.258.g7320e95886-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
