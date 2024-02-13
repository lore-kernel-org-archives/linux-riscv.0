Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CFAC48BC1
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IjYUq5q0JZRV3ErpxGvxOwjUA2Inu6/i3tXvboMtl8w=; b=UUHX9YqpBx2S8ka4c/3FfFloB+
	zTwzPhSXeIiVo0ReU8/A4pwZZmJO3+4ywlm19GupiEVFUkV1UE9hba+puud8tpoOhjMJVGsI9PGKE
	udPkDWJBcVL/FYO7OfgOLqhpDonsA7bDw7VyGYAWXJmZTGBFvtEhEToC2cvVH2O8LZOa0tvvo6Ecl
	d8CjULWISal7Q3o1HpMe4iVwjq67iwxC4BHQV7NnwU5vbWRAskfWaPxkPZyd0dBR5Xfm1UflWJl4c
	2CrukAC3cqPEj4xvDiBbygY33gWw5jTXoA1qMXLKIe7MJUT9IjxL8BLvypYAtWfZ37PenqpEsScSW
	OuCbfcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtnA-00000009W5e-1qMk;
	Tue, 13 Feb 2024 14:29:48 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtn3-00000009Vyu-3SHq
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:29:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dcc6c9b6014so1675261276.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707834579; x=1708439379; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjHBvtVzi/tC9ODHchdE1QaPBdrPAE+kD8d5Z9zVo4E=;
        b=hqUmLYXJNdUYyrtXvzN7zTUEZd6ZdRV1mrhAbxIRpJbPJpHoalO7VMlMVYXzxhway7
         M37ePAir4xEiUPmWBISGK7MrKfh7yEKSm3NPD04S44cCwjAi0cN1wBjyIJ0WxRIBMsiu
         ia0jpHtbDEUzvXfPIrCCMcFT/7/A5CZw/uX45J7vhE00/HXPFWSKv7PM3ByvwcAL8Ndl
         pNqgxhvQ2/qEwLD5pLLziIJQTJOKAjOCyxKOdV2vgKpbtCDn/5Nayk0fdmM/WC7H1Afp
         Yab6kNIkFuE1HtREKpXyHzDztZVh69e9BTkhmSVhdTxQ5WyQKvD8934ZySvJIINq4PKY
         CnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834579; x=1708439379;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjHBvtVzi/tC9ODHchdE1QaPBdrPAE+kD8d5Z9zVo4E=;
        b=gn25/s+hDeFCzG8i0bZyBiDAwRCNj6sBLDZbapVjPKNZs+LqOwqxBFI9W/rYOtfCwT
         uZBhL6OfBbhnIFFp7eSPHplv/kMirbSsv6MUtFsXXEHN0WZsog36dQPV+tViCmvF1Vcc
         IeZt+VNHVHsY1IvsRAU8RsEzbvlCSJ9B4wW4r3znNbjBa3OdkHRcJIPocM+HlsETRQU0
         b+ALWx1kBfE7g4HNBUhfG09OHukpdstPZuBYtly8/cnNbzEIqm9HLioWKD7BJlFyNh/Y
         odnCLUcnRib807pgb1XB/jWp4/R7n2SfcyWqKrh8ab4xqAUFgiVXHXm4n/HJ/x8LY/f9
         WhiQ==
X-Gm-Message-State: AOJu0YyC8+9uBxVIckJ+qkVFDvieQuaaEaXwuJy3iVWx7TtItFE08L+J
	wOhY80wjVs/qjr6VELyCG/BVprALEigelApL5dBxOpDAV5aQKYAaYWGh4aZqtdCBtwKnOFSKng9
	XjA6/K0GIkDO6m1J5gw==
X-Google-Smtp-Source: AGHT+IEnRJCLwueO7eGhQ0rGhmrv6mGsg0TspHtOVgdQaw4v/YUHbGoNtQMQmcFS8B1QPArMjVa90Vp9ttsYRXQZ
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1884:b0:dc7:68b5:4f3d with
 SMTP id cj4-20020a056902188400b00dc768b54f3dmr2393690ybb.11.1707834578969;
 Tue, 13 Feb 2024 06:29:38 -0800 (PST)
Date: Tue, 13 Feb 2024 14:29:33 +0000
In-Reply-To: <20240213142632.2415127-1-ericchancf@google.com>
Mime-Version: 1.0
References: <20240213142632.2415127-1-ericchancf@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213142933.2417154-1-ericchancf@google.com>
Subject: [PATCH v3 3/4] riscv/barrier: Consolidate fence definitions
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_062941_974612_8F4E83B9 
X-CRM114-Status: GOOD (  14.19  )
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
And align with the existing form.

Signed-off-by: Eric Chan <ericchancf@google.com>
---
 arch/riscv/include/asm/atomic.h  |  8 ++------
 arch/riscv/include/asm/barrier.h |  3 +--
 arch/riscv/include/asm/cmpxchg.h |  1 -
 arch/riscv/include/asm/fence.h   | 10 +++++++---
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 31e6e2e7cc18..1b2ae3259f1d 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -17,13 +17,9 @@
 #endif
 
 #include <asm/cmpxchg.h>
-#include <asm/barrier.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+#define __atomic_acquire_fence()	RISCV_FENCE(r,rw)
+#define __atomic_release_fence()	RISCV_FENCE(rw,r)
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 4c49a8ff2c68..4f4743d7440d 100644
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
 #define __mb()		RISCV_FENCE(iorw,iorw)
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
index 6c26c44dfcd6..ca094d72ec20 100644
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
+#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r,rw)
+#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw,r)
+#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw,rw)
 #else
 #define RISCV_ACQUIRE_BARRIER
 #define RISCV_RELEASE_BARRIER
diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 42497d487a17..afb5ead7552e 100644
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
+#define __io_pbr()	RISCV_FENCE(io,i)
+#define __io_par(v)	RISCV_FENCE(i,ior)
+#define __io_pbw()	RISCV_FENCE(iow,o)
+#define __io_paw()	RISCV_FENCE(o,io)
 
 /*
  * Accesses from a single hart to a single I/O address must be ordered.  This
diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 4c58ee7f95ec..a708968d4a0f 100644
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
+#define __io_ar(v)	RISCV_FENCE(i,ir)
+#define __io_bw()	RISCV_FENCE(w,o)
 #define __io_aw()	mmiowb_set_pending()
 
 #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
index 0b2333e71fdc..3bcae97d4803 100644
--- a/arch/riscv/include/asm/mmiowb.h
+++ b/arch/riscv/include/asm/mmiowb.h
@@ -7,7 +7,7 @@
  * "o,w" is sufficient to ensure that all writes to the device have completed
  * before the write to the spinlock is allowed to commit.
  */
-#define mmiowb()	__asm__ __volatile__ ("fence o,w" : : : "memory");
+#define mmiowb()	RISCV_FENCE(o,w)
 
 #include <linux/smp.h>
 #include <asm-generic/mmiowb.h>
-- 
2.43.0.687.g38aa6559b0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
