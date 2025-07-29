Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B986DC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gEcsYfLQJP2MgRlTAqpjUri1agu52cWXNwZkuDxIfIM=; b=3Hh4wE/tM/Hvun
	3pbOIZuHkXw2LoEattjvWhyHXNLoWNW/OazsDivk2Is5lcQtjc1uy2EYo7rVLNMe3ccl+pW/AJQ9C
	8ZS5BRj6GC06D8fAFCwtu2iHlmGqMvnI0dT4XzKo+SCfjaH7znuccdCOwEDS0/ckaPXhUSG32/82A
	ZI1w28NoEWKZWgmQu23w2Acl+bOMZ0mMlB0Aw+uGCpZY3Snn1DxlzklpW/MILRV3x7AshuOW9Qo6G
	tb3dYFacnrIYtCk6oVQRQ9YMOp6OJf3VwLY0bqPFMJkG0ixNxFBb4Nq56LZhuIkEZf3ab/r5JoduY
	WMDQ4WFPyQsmJ3SJYYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSc-0000000GDbQ-0rJ3;
	Tue, 29 Jul 2025 08:13:22 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSZ-0000000GDYd-3xMs
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 08:13:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-756bb07b029so5055831b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753776798; x=1754381598; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsUjwBpLVzQ5mIZOyiGvQnkCxmITIUZKoOgzZ5YyMZw=;
        b=07c8CrcbdAZBJS7zzzgQfNeoak4DgqqAUy/OhwbMT7zFqtwD5RUvN9nRpgEn+5uBy2
         Mefac1NzSGixxVx8NzvXzs624/xOdoEMfjS+igwFDBLnW0a4m+kp5GrcL4Yu/ZgFGyZg
         IByiJWNrZUw3UNxtvM7zO1wYD2lQMMXGH09Mqv3kaMYXYIzYitQH7QbHr+jm1HVqF81l
         04xIvJIrg5gX2i2hbziH5cTvf4hXPi5cynIiCJ9fIJkIPNRoC+X3FSFco2W3PXMJIQRL
         gFvk5AMJP4EXHH3eyb+FLms3RN0E2Dybyz8khT7MIVUTbIVC1/YlD3QI73YE7ccYD7jh
         e0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776798; x=1754381598;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsUjwBpLVzQ5mIZOyiGvQnkCxmITIUZKoOgzZ5YyMZw=;
        b=HwXme62iTAGdEM6ubKIOMwRsK8gSRQg5OA+QwwlhRjFyFCdl0va5UHXNHnliA28qg/
         rrQRmKL2iGMsC4qEVeo7RS7CZZmf2vmwsgyG1NfSCcc70UFyGYrLNH9ESt+8eg/Uh13h
         5zbLOvlRSxuMKr0PZnLm7wT17BRykFz1GJcu0AE5If/7A9CezHSLdN85/uWopr2mQZMw
         ebUnI4q721rtxYxNr/w0MLL91KETqwYwLwCUYl1+H0IQr8VWF5H4itbMvIGfGT+OorDE
         BHKGIB85m9eOg3glxayN4n7XmVdajfbXg0RDI89OFcOCWi8jcGoysuRJz1Ggqe2ZB663
         M06Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9YuiRY4vTzTUJNePDGb7QoRVhpJ30Qmzzn6yrIfNXP0lOc4eQ3aE7bG5BTKMjUKApEgrQJ7TvL5IIoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJOlD6Wi82bCzYoE5PJp57+qXHsqctPYadqUe14h90o1bN1jt0
	9zndqZha1nTMsAPmKbk+3T6zUhvukA1VE9QQL0pfu0A6JH8vc8f905+Sow2xtK8FggrG234GlIu
	II/dkIg==
X-Google-Smtp-Source: AGHT+IGmZ0F0KObLxBSHlu3SHnlP483NmWhuV4JLZ7ucOE/TKxG1RmC9r56fjS+PXM6PjH97P01ASiU6GEc=
X-Received: from pfbml8.prod.google.com ([2002:a05:6a00:3d88:b0:748:e22c:600c])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4f89:b0:742:a77b:8c4
 with SMTP id d2e1a72fcca58-7633227efbcmr22440554b3a.3.1753776798231; Tue, 29
 Jul 2025 01:13:18 -0700 (PDT)
Date: Tue, 29 Jul 2025 01:12:55 -0700
In-Reply-To: <20250729081256.3433892-1-yuzhuo@google.com>
Mime-Version: 1.0
References: <20250729081256.3433892-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729081256.3433892-3-yuzhuo@google.com>
Subject: [PATCH v1 2/3] perf bench: Import ticket_spinlock from kerne
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yuzhuo Jing <yzj@umich.edu>, Yuzhuo Jing <yuzhuo@google.com>, 
	Guo Ren <guoren@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_011319_989477_ADD1283D 
X-CRM114-Status: GOOD (  19.58  )
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

Import generic ticket_spinlock implementation.  Updated
tools/perf/check-headers.sh to detect future kernel file changes.

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 tools/perf/bench/include/ticket_spinlock.h | 107 +++++++++++++++++++++
 tools/perf/check-headers.sh                |   3 +
 2 files changed, 110 insertions(+)
 create mode 100644 tools/perf/bench/include/ticket_spinlock.h

diff --git a/tools/perf/bench/include/ticket_spinlock.h b/tools/perf/bench/include/ticket_spinlock.h
new file mode 100644
index 000000000000..1d063c99f7cb
--- /dev/null
+++ b/tools/perf/bench/include/ticket_spinlock.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * 'Generic' ticket-lock implementation.
+ *
+ * It relies on atomic_fetch_add() having well defined forward progress
+ * guarantees under contention. If your architecture cannot provide this, stick
+ * to a test-and-set lock.
+ *
+ * It also relies on atomic_fetch_add() being safe vs smp_store_release() on a
+ * sub-word of the value. This is generally true for anything LL/SC although
+ * you'd be hard pressed to find anything useful in architecture specifications
+ * about this. If your architecture cannot do this you might be better off with
+ * a test-and-set.
+ *
+ * It further assumes atomic_*_release() + atomic_*_acquire() is RCpc and hence
+ * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
+ * a full fence after the spin to upgrade the otherwise-RCpc
+ * atomic_cond_read_acquire().
+ *
+ * The implementation uses smp_cond_load_acquire() to spin, so if the
+ * architecture has WFE like instructions to sleep instead of poll for word
+ * modifications be sure to implement that (see ARM64 for example).
+ *
+ */
+
+#ifndef __ASM_GENERIC_TICKET_SPINLOCK_H
+#define __ASM_GENERIC_TICKET_SPINLOCK_H
+
+#include <linux/atomic.h>
+#include <asm/barrier.h>
+#include <endian.h>
+#include "qspinlock_types.h"
+
+static __always_inline void ticket_spin_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add(1<<16, &lock->val);
+	u16 ticket = val >> 16;
+
+	if (ticket == (u16)val)
+		return;
+
+	/*
+	 * atomic_cond_read_acquire() is RCpc, but rather than defining a
+	 * custom cond_read_rcsc() here we just emit a full fence.  We only
+	 * need the prior reads before subsequent writes ordering from
+	 * smb_mb(), but as atomic_cond_read_acquire() just emits reads and we
+	 * have no outstanding writes due to the atomic_fetch_add() the extra
+	 * orderings are free.
+	 */
+	atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);
+	smp_mb();
+}
+
+static __always_inline bool ticket_spin_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(&lock->val);
+
+	if ((old >> 16) != (old & 0xffff))
+		return false;
+
+	return atomic_try_cmpxchg(&lock->val, (int *)&old, old + (1<<16)); /* SC, for RCsc */
+}
+
+static __always_inline void ticket_spin_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + (__BYTE_ORDER == __BIG_ENDIAN);
+	u32 val = atomic_read(&lock->val);
+
+	smp_store_release(ptr, (u16)val + 1);
+}
+
+static __always_inline int ticket_spin_value_unlocked(arch_spinlock_t lock)
+{
+	u32 val = lock.val.counter;
+
+	return ((val >> 16) == (val & 0xffff));
+}
+
+static __always_inline int ticket_spin_is_locked(arch_spinlock_t *lock)
+{
+	arch_spinlock_t val = READ_ONCE(*lock);
+
+	return !ticket_spin_value_unlocked(val);
+}
+
+static __always_inline int ticket_spin_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(&lock->val);
+
+	return (s16)((val >> 16) - (val & 0xffff)) > 1;
+}
+
+#ifndef __no_arch_spinlock_redefine
+/*
+ * Remapping spinlock architecture specific functions to the corresponding
+ * ticket spinlock functions.
+ */
+#define arch_spin_is_locked(l)		ticket_spin_is_locked(l)
+#define arch_spin_is_contended(l)	ticket_spin_is_contended(l)
+#define arch_spin_value_unlocked(l)	ticket_spin_value_unlocked(l)
+#define arch_spin_lock(l)		ticket_spin_lock(l)
+#define arch_spin_trylock(l)		ticket_spin_trylock(l)
+#define arch_spin_unlock(l)		ticket_spin_unlock(l)
+#endif
+
+#endif /* __ASM_GENERIC_TICKET_SPINLOCK_H */
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index b827b10e19c1..c9f76e3e3d66 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -239,6 +239,9 @@ check_2_sed tools/perf/bench/qspinlock.c		kernel/locking/qspinlock.c	"$qsl_sed"
 	"$qsl_common"' -I EXPORT_SYMBOL -I "^#define lockevent_" -I "^#define trace_" \
         -I smp_processor_id -I atomic_try_cmpxchg_relaxed'
 
+check_2 tools/perf/bench/include/ticket_spinlock.h	include/asm-generic/ticket_spinlock.h \
+	'-I "^#include" -I atomic_try_cmpxchg -I BIG_ENDIAN -B'
+
 for i in "${BEAUTY_FILES[@]}"
 do
   beauty_check "$i" -B
-- 
2.50.1.487.gc89ff58d15-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
