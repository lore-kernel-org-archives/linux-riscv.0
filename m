Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1826FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 22:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4kWGzG963GdwKExJGZSIrQLxodE5M+KkZJxoP/7lzg=; b=shBYEshjqtkytu
	T0Cg5r07WZorI1uKhfCdoCABQnbCy2Im1g5C0Ny4HfhPxYMn6rlqdA9Wk3CxyChWpvklpGo32Trgn
	ttUn/Ht+ECnn3M/nJH+vAiaeT4Aw0M4kZ/tLCN/G6C4SttsQtaYPT3BZa6Jfcx5H46Y1WztqPOqzw
	91RieAG549Q9on6L6W9+3qUIRMrlPy7lAUxnRdzw6WlyNJqlulrO4DCwfHoE3fU1ZqDmeiLgHS3qj
	fmgu2DZdYAd5lCRnh1N43Nrq73aBVNl2M4Iv4IKKtXz7K134q+xPGytXg6y1Ebbm98g5CkMXd+vm0
	hGtzkO5oaElZha6KRzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf7ad-007RFX-9J; Thu, 14 Apr 2022 22:05:23 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf7aY-007RCJ-Ky
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 22:05:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id r66so5938862pgr.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=0jyU6ZA416nNh7Gcc3z3dq8e/E2mHcoMg9kDd8TTUb4=;
 b=Omlb8jpF+D+nYKUWOpFN7C5wUnbMOSt06NY1KUKR8+1tqHzn+FDuA14XkvhFM1cUgp
 PhPzKk3i3BsX4GV0fiLhjbLyxSM9gCaY2YJLUL8AskEqVjUYvFeIrN+FagEVaQS0l7Oa
 RpX6mLWXN5CJtI8LdG96SjsjhBOnaVEo7IqjB4qW/YhG5MSDzXNGMa/GWxqs51LwN4Sj
 W5tOD/+TO3pe99NqqPLRz7SNv+BZCpXZf4TgWpnuZV/QCN3t9hxq5TApDT76NnIj/brZ
 gBHYFdFMw21OoclH7g/YRcVa5rfgW1DfVMvGIltgRPD4Z3XY5Gz+2W+PTn6/T53ZIVre
 b9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0jyU6ZA416nNh7Gcc3z3dq8e/E2mHcoMg9kDd8TTUb4=;
 b=i1pHZ9rM6rE40njBmouAmcjHoW33aIGJB99sf73YrTfiYij6wsXrl+A9kjiJSN8iOM
 n/wKjTnSibyYrAxPi3hwgMXMCGJx0CbpYCCz4ydsJjQHSNaptDGKIsV2M59rATN/omaf
 +9vv0XmQQMrxq4wm9BrGHhKsNzoYAsHNaWG2qVc2b2bw47qGiCKD+0aZeDZ6/fIKhy4N
 kuQCuVVcxKA4kT48FrEIj6h0keEVlkp3vOoi6bpKte2hvK/7yMiewPdSgOyWApdgvLB/
 rvzI9dR/tD1baMlXihqLCbj18WLa/PzOH9xIwX8hgtag1XOEqkGwezMZjeikC3K+Zzgs
 Mi5w==
X-Gm-Message-State: AOAM530rFc5pbf5ljf/Kg9KcPGpsTZtaPoeuBgqxQgo0qUH89F5qzY2R
 JDhBSk5UXCNI9modELmOHAGfbQ==
X-Google-Smtp-Source: ABdhPJxPSC2qv+JNqkY3kBHG9Zclmo46Dc4kjny0507USILvT/NU5jR2hhF5i++i3cLn2Bu23eMbig==
X-Received: by 2002:a65:41cc:0:b0:380:6f53:a550 with SMTP id
 b12-20020a6541cc000000b003806f53a550mr3873419pgq.471.1649973915618; 
 Thu, 14 Apr 2022 15:05:15 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 e6-20020a17090a728600b001cb646a4adfsm6514424pjg.52.2022.04.14.15.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 15:05:15 -0700 (PDT)
Subject: [PATCH v3 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Date: Thu, 14 Apr 2022 15:02:08 -0700
Message-Id: <20220414220214.24556-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220414220214.24556-1-palmer@rivosinc.com>
References: <20220414220214.24556-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: peterz@infradead.org, mingo@redhat.com, Will Deacon <will@kernel.org>,
 longman@redhat.com, boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 shorne@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_150518_730134_399ECCB8 
X-CRM114-Status: GOOD (  19.16  )
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
suitable for simple systems as it is more likely to be correct.  It is
implemented entirely in terms of standard atomics and thus works fine
without any arch-specific code.

This replaces the existing asm-generic/spinlock.h, which just errored
out on SMP systems.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/spinlock.h       | 85 +++++++++++++++++++++++++---
 include/asm-generic/spinlock_types.h | 17 ++++++
 2 files changed, 94 insertions(+), 8 deletions(-)
 create mode 100644 include/asm-generic/spinlock_types.h

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index adaf6acab172..ca829fcb9672 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -1,12 +1,81 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_GENERIC_SPINLOCK_H
-#define __ASM_GENERIC_SPINLOCK_H
+
 /*
- * You need to implement asm/spinlock.h for SMP support. The generic
- * version does not handle SMP.
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
  */
-#ifdef CONFIG_SMP
-#error need an architecture specific asm/spinlock.h
-#endif
 
-#endif /* __ASM_GENERIC_SPINLOCK_H */
+#ifndef __ASM_GENERIC_TICKET_LOCK_H
+#define __ASM_GENERIC_TICKET_LOCK_H
+
+#include <linux/atomic.h>
+#include <asm-generic/spinlock_types.h>
+
+static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
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
+static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
+{
+	u32 old = atomic_read(lock);
+
+	if ((old >> 16) != (old & 0xffff))
+		return false;
+
+	return atomic_try_cmpxchg(lock, &old, old + (1<<16)); /* SC, for RCsc */
+}
+
+static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
+{
+	u16 *ptr = (u16 *)lock + IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
+	u32 val = atomic_read(lock);
+
+	smp_store_release(ptr, (u16)val + 1);
+}
+
+static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return ((val >> 16) != (val & 0xffff));
+}
+
+static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
+{
+	u32 val = atomic_read(lock);
+
+	return (s16)((val >> 16) - (val & 0xffff)) > 1;
+}
+
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	return !arch_spin_is_locked(&lock);
+}
+
+#include <asm/qrwlock.h>
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_H */
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
new file mode 100644
index 000000000000..e56ddb84d030
--- /dev/null
+++ b/include/asm-generic/spinlock_types.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_GENERIC_TICKET_LOCK_TYPES_H
+#define __ASM_GENERIC_TICKET_LOCK_TYPES_H
+
+#include <linux/types.h>
+typedef atomic_t arch_spinlock_t;
+
+/*
+ * qrwlock_types depends on arch_spinlock_t, so we must typedef that before the
+ * include.
+ */
+#include <asm/qrwlock_types.h>
+
+#define __ARCH_SPIN_LOCK_UNLOCKED	ATOMIC_INIT(0)
+
+#endif /* __ASM_GENERIC_TICKET_LOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
