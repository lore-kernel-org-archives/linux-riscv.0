Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1150C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JP2f0zBW9mD1e1ZDtR/zzj/Kyj6uIkJmTqGpcW4Vq9E=; b=uEtEE2jkVlnv7gXHGwX73FACix
	p5FkVUahzZ7zLiSKbgnMZSuFnENLGhwkKHvGUvyVmLTAKCgHqCqvJqGHiN9s+uB4WhpqjUdcGf6Sm
	C/FDtNCJXuTHu5+yUzT3w/RGGQcEBaYVsYHaTayu9GvRhxEwKX7DxR6qsl0txOgsGavtft02TjPOS
	lt+gYcJ8PBnWNOMljE1g1+fUWlY1zjnah1UPk6Vs0+hKjBG4lgjNh4noQUqD9+g5y/DCiH5JnP2EA
	OsHbqF1egSOXK9Mm5aBoqgFI1kzQumGE0q1IHssjRNCDhXO4+6u2DYCRxCyaxOyij8l4+KzAtdmSe
	/1gyS3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtp2-00000009WlO-0GXz;
	Tue, 13 Feb 2024 14:31:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtoj-00000009WbE-2CHo
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:31:33 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dbf618042daso1566808276.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707834671; x=1708439471; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzWDY0mBU7/wSOckVTmjGeC7uR6OHBXvGcRFd04Rqsk=;
        b=TIQ1JGtcH+WgQEv7VAzo2pJXFKcGli7X424SeQsYwSL7ibEz3i2FmbKFAC1cKFkE6s
         GjANfXnrU3I1IoPTaBMprFvy3N20Q7SiHN48GJlXv6rxmSfgIOUJQTNPVvIJDV/HVwlC
         Cw+BcmXDlkwNXuO7mD3kajoBV9yPYeQony/P3VvopMq0V3D++d2FNSTIywjHm0rKFTLZ
         QnjMVQGQc58BXK0MXq5nIIUkopwm7i8hRCXTOnYrKsUgPLyGGqCBG0tjdifLKW0yaSy+
         v7BeTT29rEBUjkBNMhKCKaOcRMMMw/BQWfPLYQBKj6b2x/aQbDKoqtQQDcbchn0exnpY
         2gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834671; x=1708439471;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzWDY0mBU7/wSOckVTmjGeC7uR6OHBXvGcRFd04Rqsk=;
        b=Srqf/M/i1EXV7pKVjqJpgqUBh0OX+4mzexbc1U+RqU8iDSuZ0i0I6j09imZn+kwf5+
         PErWVLbeKNmx+Z+8ryDCnpltj4xtrH4lKyRxtai4s4dFEy0PH3fQ9kKYX9z3NRK1fX8x
         qlrdHy4Uum+Pwjb6j19X/NBWtJ1othn6P0dhTMUJna1gFyOjOY6SCSaQYYYZgJwC84n7
         k2oLlTBU2r0ApSwYgLLVBGS7LfiPTQg+uaWPlWBIGo7RDEBz7v8erROHMK9oaAc1KWsV
         wLFtZ5N+g0j/A3xwntaj83Ht3JGTrHs+enBJewFd1oVu/V0qsfHj+207r4RRmyUmfuMt
         3X+Q==
X-Gm-Message-State: AOJu0YwrAR8mohaLYy8wrzuJsqB468Z8wu8g9ZLM87UL8xvzFe0P3PLr
	Hi0nk8i1egx2TYPGXoIkUrEB0G4kvGLmx36ddFf3fbEcGMjknQLRStr0qgZzORH8tySEjwDRat7
	mQGWM/XgxZcPtzBGsKQ==
X-Google-Smtp-Source: AGHT+IG1EP97jJJl0nKHqVDmwFVseRqKM6YlcjU/nrMn/gsTAqxMXErcgrlGclTN3Km1NnzLTpHhZiOxV5OTsuBX
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1027:b0:dc6:207c:dc93 with
 SMTP id x7-20020a056902102700b00dc6207cdc93mr345253ybt.2.1707834671075; Tue,
 13 Feb 2024 06:31:11 -0800 (PST)
Date: Tue, 13 Feb 2024 14:31:05 +0000
In-Reply-To: <20240213142632.2415127-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213142632.2415127-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213143105.2418044-1-ericchancf@google.com>
Subject: [PATCH v3 4/4] riscv/barrier: Resolve checkpath.pl error
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_063125_867820_C3FBBDC9 
X-CRM114-Status: GOOD (  13.94  )
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

The original form would cause checkpath.pl to issue a error.
The error message is as follows:
ERROR: space required after that ',' (ctx:VxV)
+#define __atomic_acquire_fence()       RISCV_FENCE(r,rw)
                                                     ^
correct the form of RISCV_FENCE and RISCV_FENCE_ASM even if they
already exist.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/atomic.h  |  4 ++--
 arch/riscv/include/asm/barrier.h | 18 +++++++++---------
 arch/riscv/include/asm/fence.h   |  6 +++---
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  4 ++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 6 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 1b2ae3259f1d..19050d13b6c1 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -18,8 +18,8 @@
 
 #include <asm/cmpxchg.h>
 
-#define __atomic_acquire_fence()	RISCV_FENCE(r,rw)
-#define __atomic_release_fence()	RISCV_FENCE(rw,r)
+#define __atomic_acquire_fence()	RISCV_FENCE(r, rw)
+#define __atomic_release_fence()	RISCV_FENCE(rw, r)
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 4f4743d7440d..880b56d8480d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -19,19 +19,19 @@
 
 
 /* These barriers need to enforce ordering on both devices or memory. */
-#define __mb()		RISCV_FENCE(iorw,iorw)
-#define __rmb()		RISCV_FENCE(ir,ir)
-#define __wmb()		RISCV_FENCE(ow,ow)
+#define __mb()		RISCV_FENCE(iorw, iorw)
+#define __rmb()		RISCV_FENCE(ir, ir)
+#define __wmb()		RISCV_FENCE(ow, ow)
 
 /* These barriers do not need to enforce ordering on devices, just memory. */
-#define __smp_mb()	RISCV_FENCE(rw,rw)
-#define __smp_rmb()	RISCV_FENCE(r,r)
-#define __smp_wmb()	RISCV_FENCE(w,w)
+#define __smp_mb()	RISCV_FENCE(rw, rw)
+#define __smp_rmb()	RISCV_FENCE(r, r)
+#define __smp_wmb()	RISCV_FENCE(w, w)
 
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw,w);						\
+	RISCV_FENCE(rw, w);						\
 	WRITE_ONCE(*p, v);						\
 } while (0)
 
@@ -39,7 +39,7 @@ do {									\
 ({									\
 	typeof(*p) ___p1 = READ_ONCE(*p);				\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r,rw);						\
+	RISCV_FENCE(r, rw);						\
 	___p1;								\
 })
 
@@ -68,7 +68,7 @@ do {									\
  * instances the scheduler pairs this with an mb(), so nothing is necessary on
  * the new hart.
  */
-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
 #include <asm-generic/barrier.h>
 
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index ca094d72ec20..5b46f96a3ec8 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -6,9 +6,9 @@
 	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
 
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r,rw)
-#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw,r)
-#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw,rw)
+#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, r)
+#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index afb5ead7552e..1c5c641075d2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -47,10 +47,10 @@
  * sufficient to ensure this works sanely on controllers that support I/O
  * writes.
  */
-#define __io_pbr()	RISCV_FENCE(io,i)
-#define __io_par(v)	RISCV_FENCE(i,ior)
-#define __io_pbw()	RISCV_FENCE(iow,o)
-#define __io_paw()	RISCV_FENCE(o,io)
+#define __io_pbr()	RISCV_FENCE(io, i)
+#define __io_par(v)	RISCV_FENCE(i, ior)
+#define __io_pbw()	RISCV_FENCE(iow, o)
+#define __io_paw()	RISCV_FENCE(o, io)
 
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index a708968d4a0f..06cadfd7a237 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -132,8 +132,8 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * doesn't define any ordering between the memory space and the I/O space.
  */
 #define __io_br()	do {} while (0)
-#define __io_ar(v)	RISCV_FENCE(i,ir)
-#define __io_bw()	RISCV_FENCE(w,o)
+#define __io_ar(v)	RISCV_FENCE(i, ir)
+#define __io_bw()	RISCV_FENCE(w, o)
 #define __io_aw()	mmiowb_set_pending()
 
 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index 3bcae97d4803..52ce4a399d9b 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -7,7 +7,7 @@
  * "o,w" is sufficient to ensure that all writes to the device have completed
  * before the write to the spinlock is allowed to commit.
  */
-#define mmiowb()	RISCV_FENCE(o,w)
+#define mmiowb()	RISCV_FENCE(o, w)
 
 #include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
-- 
2.43.0.687.g38aa6559b0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
