Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 22:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Hr0aHax2/DUMtjDR6xZYUB5dTdoy00+FqbSvKGycMQ=; b=mfNWWAZ4r8oWEm
	3dPh8WZkk8211fQe/PJHKAqmW6PCP1zTfFyPalnPfW2qiB080m5zNNTYXfqyENSvC4PvcskeDMyvh
	7hQFi4j06Qjj7IgFlOW4S4K5lDnV/Tq0mT7bnn7XhRMxc/Nb6wHfhTyOVbQKVmtDxYwkMj/Yiqq95
	hOsRqFoLH64H0iVlRsKNKGiwr/15ebHbWjgYIVqyoJNh49Y27RdxeB3vHB/fZC+76LlVW5YHcifAT
	i15T91JuPG1u6rqSfyM+5jBa6gi34TLKP67wZnjBuK9R08J6HrmH3Sgf1d2T55cUp32XIXdmawfo2
	Yl19WJMomvZZg2eC68Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBvd-00GZ9X-5S; Mon, 09 May 2022 22:32:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBvY-00GZ4H-5z
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 22:32:29 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so582424pjh.4
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 15:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=ZW4Wh2F92AaGgkTq3RYNioOG15W5RvqR7U43OAjNTGE=;
 b=OJ8/z1H0yxOfjvNIz5GyJj5zfB3yzETOSWZgiZ4JDbCXZ4D/Fw0kDuTE+TVB7WnjKz
 f10yDnI2QhASS2wNA9HaJ3RgUMeT75ziZXqgEzTmHHJtxq59d2fXeEjM5wOAxZW2NzD1
 vsqWI3UMY+G9WNlAQbNLY9dcfzxfr+bKESuRkrl9KWNGc0FcGikBLc/QIWcVyMnbd54f
 g3kXLZhpt3B23HL6lhDUviKv8fCVonj8AkNF1BOtU4dS23DtdFTjMLYo7kVdPu9uaMRF
 r3zvAnCirXnIri808iEE9IDgcsFN4ys53jS+uv4sZq5oYQt047znsym3BXBmMlanOmDg
 Sl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ZW4Wh2F92AaGgkTq3RYNioOG15W5RvqR7U43OAjNTGE=;
 b=j0cg2N1hdsVbhF5HoBFscXJ2ArrgSeEfag/O9dIJQRsE7Wgw5I/zPo0iBTcDesPDaH
 wRXxYmIW751wu8oXTz7VYat/d7gZcUfr3ISoeydnYptGfYt7gy145E+G/oDjH1SMWVfE
 yrZ4h5TsnLIyap+ngyD33JKbmnidi6FP2UlbG90mt+pjXufKb3nhFhiHTOX0qD1g4UWu
 hFAxbyI8N80l6tJk+RFA16C71ww3nP9qq9DnQgECFkQzyYVXdh46CCAzj97E61zE2vIx
 FXPKSlLK/09J9VyGqqS1WwthajgSm18c4IlpxRdojdIo6jgS7tHYOlgvOYBJHKoV6Sv2
 TDjQ==
X-Gm-Message-State: AOAM533kRaGpSWUY1s3IX1YGm8YmSt/WmMFEr28zkLKy5zB9YhmPlqH0
 8F6QsTtzBh7GtNI9Kdbzdjkumg==
X-Google-Smtp-Source: ABdhPJx0hcRTNWyyUDxvbLajs6wyBIGgRAtfmL2Lsz3K2ittGTQcIfLVbn7WWX9D3t+/vP39Ej+XHg==
X-Received: by 2002:a17:902:bf09:b0:153:99a6:55b8 with SMTP id
 bi9-20020a170902bf0900b0015399a655b8mr17645821plb.142.1652135544838; 
 Mon, 09 May 2022 15:32:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 w8-20020a170902e88800b0015eb200cc00sm378567plg.138.2022.05.09.15.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:32:24 -0700 (PDT)
Subject: [PATCH v5 1/7] asm-generic: ticket-lock: New generic ticket-based
 spinlock
Date: Mon,  9 May 2022 15:29:50 -0700
Message-Id: <20220509222956.2886-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509222956.2886-1-palmer@rivosinc.com>
References: <20220509222956.2886-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: guoren@kernel.org, peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com,
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, macro@orcam.me.uk, 
 Greg KH <gregkh@linuxfoundation.org>, sudipm.mukherjee@gmail.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org,         linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153228_268090_D5080A5C 
X-CRM114-Status: GOOD (  22.50  )
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 include/asm-generic/spinlock.h       | 94 +++++++++++++++++++++++++---
 include/asm-generic/spinlock_types.h | 17 +++++
 2 files changed, 104 insertions(+), 7 deletions(-)
 create mode 100644 include/asm-generic/spinlock_types.h

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index adaf6acab172..fdfebcb050f4 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -1,12 +1,92 @@
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
+ * uses atomic_fetch_add() which is RCsc to create an RCsc hot path, along with
+ * a full fence after the spin to upgrade the otherwise-RCpc
+ * atomic_cond_read_acquire().
+ *
+ * The implementation uses smp_cond_load_acquire() to spin, so if the
+ * architecture has WFE like instructions to sleep instead of poll for word
+ * modifications be sure to implement that (see ARM64 for example).
+ *
  */
-#ifdef CONFIG_SMP
-#error need an architecture specific asm/spinlock.h
-#endif
+
+#ifndef __ASM_GENERIC_SPINLOCK_H
+#define __ASM_GENERIC_SPINLOCK_H
+
+#include <linux/atomic.h>
+#include <asm-generic/spinlock_types.h>
+
+static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
+{
+	u32 val = atomic_fetch_add(1<<16, lock);
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
+	atomic_cond_read_acquire(lock, ticket == (u16)VAL);
+	smp_mb();
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
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
diff --git a/include/asm-generic/spinlock_types.h b/include/asm-generic/spinlock_types.h
new file mode 100644
index 000000000000..8962bb730945
--- /dev/null
+++ b/include/asm-generic/spinlock_types.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_GENERIC_SPINLOCK_TYPES_H
+#define __ASM_GENERIC_SPINLOCK_TYPES_H
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
+#endif /* __ASM_GENERIC_SPINLOCK_TYPES_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
