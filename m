Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6184EC43219
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 23:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPKYgmGQTiWRADrr56DGddfGtGJHxNXUZg7kdN+eKMo=; b=Cw8pPMFo+Eg5Qk
	aQpyFacfHrkvkBtA84pHzueFPcun2rMzdwUwANS981pzXfozKEX1IGDfEl64GI+xOlTlCNkhlAX7w
	sHZzw0XOrCGn2pXfzXh3554Y5ICVeIGXW6k5ad8H2fv7dAqRvsTLZcM46Yg2SXcZlM5pDepXdoCbR
	fmBMu1ak1j1+zGaVaisRXPK1prOni9o04+ESMgce/tNxOrQyn4UOrLSw4gvhJIYdFC+Lb061yecez
	JC8YblxXEabrsvXyp7jpGtv7ep/X/Ccmfm9q4H5R2+Lljv1Yu9diSa5DpRB0olMphuQmsAsHXMacY
	I9wUMA3PDOOaDf32SnDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUd4D-00EUBe-5Y; Wed, 16 Mar 2022 23:28:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUd47-00EU7R-Mt
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 23:28:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d19so5365761pfv.7
 for <linux-riscv@lists.infradead.org>; Wed, 16 Mar 2022 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=FX0vp498CDh+Q8VYRYD8Az++zOHOkwOZmBFCOJ/MPQk=;
 b=g7RGlpUtsYp0dL6ZURcJ9XqT0FTjuYFUg3R+dEpF965ZohDKCeoeGHfjtjiVSkGxEj
 lANdfMQl9/IBkJ/9UMg+SPHYCtMWSo9c4xaW9U1+sxAE128S6sObkonPfJPoKIzymiIw
 09sK8rm+D+QlLwCSg7j5kwRZZ5Ze8MI5Jek627pUrimcrgKq4K2jJlUa/Pj8a2SElTV9
 xl4ffwNapdts7992kA3feRtQzz/jnL60ZUCdKR4LQ7AoV/Y7AfVaxzeYDr7myiwH00f4
 SRKTk+WG9MddPkkdOopQzO/1xBaFNEzmYY2D9huskq0oyJ4kYPwaGuIBtGRfGZgtAFr0
 gBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=FX0vp498CDh+Q8VYRYD8Az++zOHOkwOZmBFCOJ/MPQk=;
 b=hqQ+Y5bhVtKz4Nngz+t/qyMqLnrXJBDDmax23tRV8ygcfMWtliZmuiJztyfL1+nerM
 vZcGKFDqrOfxbxOFTuReyKr7XLE+6FG+SSRUu0cYQ94Dh9UsMzxYQWehJTFhGWW3eKNd
 xtlVV4QjBJ3SsgKDRhRz2DhXKokRE2nJCDUQvxyn8Z6YXrBMG/4Cc/4D/HN4lR4rWt/k
 nBbjiiEUG8JgBws8/rHu3vRA6uFJCyt3zjyWuy/BKFWKjwwbz3goZRX1Obx3Yngwgri2
 tCGknCshKagZL0UzXRflUUnqrbz0yigTNVjuNfaiPnFRhu8bph04JNUwGQ1WYSHFlST+
 Dk8w==
X-Gm-Message-State: AOAM530CoGHqI57dBHq1dp5XrTGGnzWXU1hvOScMXfTCJrrnwK22q+bb
 UZgVEBBpBoDmLiT5SBOQIH6axg==
X-Google-Smtp-Source: ABdhPJxPEnRTV51QRb/xegbfDS8UXc6ttxfzGlax57AVGxnNF0PWp6AH0Fu+hZMGJACkhYsvidNMYQ==
X-Received: by 2002:a05:6a00:729:b0:4f7:77ed:c256 with SMTP id
 9-20020a056a00072900b004f777edc256mr2013933pfm.1.1647473306932; 
 Wed, 16 Mar 2022 16:28:26 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 ce3-20020a17090aff0300b001c51f47840csm3560019pjb.0.2022.03.16.16.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 16:28:26 -0700 (PDT)
Subject: [PATCH 2/5] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Date: Wed, 16 Mar 2022 16:25:57 -0700
Message-Id: <20220316232600.20419-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316232600.20419-1-palmer@rivosinc.com>
References: <20220316232600.20419-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com,
 openrisc@lists.librecores.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, peterz@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_162827_792902_21E9EB98 
X-CRM114-Status: GOOD (  15.93  )
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

From: Peter Zijlstra <peterz@infradead.org>

This is a simple, fair spinlock.  Specifically it doesn't have all the
subtle memory model dependencies that qspinlock has, which makes it more
suitable for simple systems as it is more likely to be correct.

[Palmer: commit text]
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

--

I have specifically not included Peter's SOB on this, as he sent his
original patch
<https://lore.kernel.org/lkml/YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net/>
without one.
---
 include/asm-generic/ticket-lock-types.h | 11 ++++
 include/asm-generic/ticket-lock.h       | 86 +++++++++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 include/asm-generic/ticket-lock-types.h
 create mode 100644 include/asm-generic/ticket-lock.h

diff --git a/include/asm-generic/ticket-lock-types.h b/include/asm-generic/ticket-lock-types.h
new file mode 100644
index 000000000000..829759aedda8
--- /dev/null
+++ b/include/asm-generic/ticket-lock-types.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_GENERIC_TICKET_LOCK_TYPES_H
+#define __ASM_GENERIC_TICKET_LOCK_TYPES_H
+
+#include <linux/types.h>
+typedef atomic_t arch_spinlock_t;
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_TYPES_H */
diff --git a/include/asm-generic/ticket-lock.h b/include/asm-generic/ticket-lock.h
new file mode 100644
index 000000000000..3f0d53e21a37
--- /dev/null
+++ b/include/asm-generic/ticket-lock.h
@@ -0,0 +1,86 @@
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
+ * uses atomic_fetch_add() which is SC to create an RCsc lock.
+ *
+ * The implementation uses smp_cond_load_acquire() to spin, so if the
+ * architecture has WFE like instructions to sleep instead of poll for word
+ * modifications be sure to implement that (see ARM64 for example).
+ *
+ */
+
+#ifndef __ASM_GENERIC_TICKET_LOCK_H
+#define __ASM_GENERIC_TICKET_LOCK_H
+
+#include <linux/atomic.h>
+#include <asm/ticket-lock-types.h>
+
+static __always_inline void ticket_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add(1<<16, lock); /* SC, gives us RCsc */
+	u16 ticket = val >> 16;
+
+	if (ticket == (u16)val)
+		return;
+
+	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+}
+
+static __always_inline bool ticket_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(lock);
+
+	if ((old >> 16) != (old & 0xffff))
+		return false;
+
+	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+}
+
+static __always_inline void ticket_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + __is_defined(__BIG_ENDIAN);
+	u32 val = atomic_read(lock);
+
+	smp_store_release(ptr, (u16)val + 1);
+}
+
+static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return ((val >> 16) != (val & 0xffff));
+}
+
+static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return (s16)((val >> 16) - (val & 0xffff)) > 1;
+}
+
+static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
+{
+	return !ticket_is_locked(&lock);
+}
+
+#define arch_spin_lock(l)		ticket_lock(l)
+#define arch_spin_trylock(l)		ticket_trylock(l)
+#define arch_spin_unlock(l)		ticket_unlock(l)
+#define arch_spin_is_locked(l)		ticket_is_locked(l)
+#define arch_spin_is_contended(l)	ticket_is_contended(l)
+#define arch_spin_value_unlocked(l)	ticket_value_unlocked(l)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
