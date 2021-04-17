Return-Path: <SRS0=TuAZ=JO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31DFC433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 02:58:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B30610A7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Apr 2021 02:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B30610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=llAb9+0FIYwpR6Z/vNW/pMgr2/05tJpRuJm5cjuMAig=; b=ndrE70rj9J9hs4WnGmHZQcaRGY
	gbddTo6Qe3OK4GVznB/eq7MHlWufYqFfRtnnTyYWFJDPkTDGBHDFUJI/pR+uKNjhMevayFCwjg52V
	aUKxz055WtQam+JYR5KEXwPqU6RsZ+Spg1N0EDEtXUv5D4XdlKApaqBGgi80aBBdZGs26V00g37Ak
	nEfPT4y2sROTP1/Ws5QV0oznrK2KJdwArcEhG2v7WwUxCzqyZW+WLRN6DiQ79uAcqEIwvoHSdhjEJ
	dOwjZb9dFnJbbHarRP3r8xswCcSPHbV/Vq4aZB+wvmaPHyVpAFWh+fXgHcuGLiGkAGTRFdxKJ/1aK
	KL9cOjcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXb9s-00492k-6x; Sat, 17 Apr 2021 02:58:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXb9l-00492A-L8
 for linux-riscv@desiato.infradead.org; Sat, 17 Apr 2021 02:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pcoUfst2kML5oEjExRjqVY+G88nuEReSQqbFkxMSAG0=; b=TIWSZaXb+Nx+CP/F96w7z1tngM
 64A01TxzwQlYm78mL/zH8iPjERr71ETqgOaOY8legQQCHZj/zhgwe+9SVD1DOjLgV1nl44SzmffjO
 ndjrl7cjyEtTC39Ooe+M/H3L3s1ps8YGbS0dtyiU5hrahPSAhYjUanapZ31T8gmdoP2vxgUq2DlDU
 kP0beo7F5GoOqVwsCrD3R4HUShrHYmZWMR+DeEdIXdTIvlsMEZ9LBwK1Xq4LfkX34T6Lpzshcha6p
 yoap6Hkt46vN19Jla1hx6N12B2XRmpjvKVEMxr799DFUzGPj9mIyIcBM5oWvinCYJQFR8Y4gvyJWG
 mGiNuAMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXb9i-009qBs-03
 for linux-riscv@lists.infradead.org; Sat, 17 Apr 2021 02:58:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76581610A6;
 Sat, 17 Apr 2021 02:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618628277;
 bh=+JmE/v3oFUO4I0103fRBthfFLpndj44+LF9dFv2oKiQ=;
 h=From:To:Cc:Subject:Date:From;
 b=O/+wuGAb2tDuJ5kzsJnOXKjdh+DflY9TWEZM6FfPgjSwyu/LlkgK6DdQFXB0EVN4g
 Upt01XP4QGcC/SRkgQNezZ9h9jpTOgfmABPpJVtpxDUNN0IoBpJ2QW8830RPGjD04A
 pOT9hBsDNU5Ym37D5KdXw5h7SwWXaLlkz5R+Q/CfrPlB5emJvy3hv4ioAhd5FDbJBN
 17KxrrfVM5nOfa7hm3/XWGABsXPEobJ/PuVnIKBfYGpL617EUusV4DjXhOfcTzBsuX
 GjAxcJfUQ0jRSAacEut9LcA3cywINWZWupGrsqNZytSPALs+o2PYw3z7iZWYkWdm/F
 dCRkCkbfX4k8w==
From: guoren@kernel.org
To: guoren@kernel.org,
	peterz@infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/2] locking/atomics: Fixup GENERIC_ATOMIC64 conflict with
 atomic-arch-fallback.h
Date: Sat, 17 Apr 2021 02:57:10 +0000
Message-Id: <1618628231-86789-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_195758_113844_11111763 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Current GENERIC_ATOMIC64 in atomic-arch-fallback.h is broken. When a 32-bit
arch use atomic-arch-fallback.h will cause compile error.

In file included from include/linux/atomic.h:81,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/riscv/kernel/asm-offsets.c:10:
   include/linux/atomic-arch-fallback.h: In function 'arch_atomic64_inc':
>> include/linux/atomic-arch-fallback.h:1447:2: error: implicit declaration of function 'arch_atomic64_add'; did you mean 'arch_atomic_add'? [-Werror=implicit-function-declaration]
    1447 |  arch_atomic64_add(1, v);
         |  ^~~~~~~~~~~~~~~~~
         |  arch_atomic_add

The atomic-arch-fallback.h & atomic-fallback.h &
atomic-instrumented.h are generated by gen-atomic-fallback.sh &
gen-atomic-instrumented.sh, so just take care the bash files.

Remove the dependency of atomic-*-fallback.h in atomic64.h.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/atomic-instrumented.h | 307 +++++++++++++++++-------------
 include/asm-generic/atomic64.h            |  89 +++++++++
 include/linux/atomic-arch-fallback.h      |   5 +-
 include/linux/atomic-fallback.h           |   5 +-
 scripts/atomic/gen-atomic-fallback.sh     |   3 +-
 scripts/atomic/gen-atomic-instrumented.sh |  23 ++-
 6 files changed, 294 insertions(+), 138 deletions(-)

diff --git a/include/asm-generic/atomic-instrumented.h b/include/asm-generic/atomic-instrumented.h
index 888b6cf..f6ce7a2 100644
--- a/include/asm-generic/atomic-instrumented.h
+++ b/include/asm-generic/atomic-instrumented.h
@@ -831,6 +831,180 @@ atomic_dec_if_positive(atomic_t *v)
 #define atomic_dec_if_positive atomic_dec_if_positive
 #endif
 
+#if !defined(arch_xchg_relaxed) || defined(arch_xchg)
+#define xchg(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_xchg(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_xchg_acquire)
+#define xchg_acquire(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_xchg_acquire(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_xchg_release)
+#define xchg_release(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_xchg_release(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_xchg_relaxed)
+#define xchg_relaxed(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_xchg_relaxed(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if !defined(arch_cmpxchg_relaxed) || defined(arch_cmpxchg)
+#define cmpxchg(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg_acquire)
+#define cmpxchg_acquire(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg_acquire(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg_release)
+#define cmpxchg_release(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg_relaxed)
+#define cmpxchg_relaxed(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if !defined(arch_cmpxchg64_relaxed) || defined(arch_cmpxchg64)
+#define cmpxchg64(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg64(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg64_acquire)
+#define cmpxchg64_acquire(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg64_acquire(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg64_release)
+#define cmpxchg64_release(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg64_release(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_cmpxchg64_relaxed)
+#define cmpxchg64_relaxed(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg64_relaxed(__ai_ptr, __VA_ARGS__); \
+})
+#endif
+
+#if !defined(arch_try_cmpxchg_relaxed) || defined(arch_try_cmpxchg)
+#define try_cmpxchg(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_try_cmpxchg_acquire)
+#define try_cmpxchg_acquire(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_try_cmpxchg_release)
+#define try_cmpxchg_release(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+#endif
+
+#if defined(arch_try_cmpxchg_relaxed)
+#define try_cmpxchg_relaxed(ptr, oldp, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	typeof(oldp) __ai_oldp = (oldp); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
+	arch_try_cmpxchg_relaxed(__ai_ptr, __ai_oldp, __VA_ARGS__); \
+})
+#endif
+
+#define cmpxchg_local(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
+})
+
+#define cmpxchg64_local(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
+})
+
+#define sync_cmpxchg(ptr, ...) \
+({ \
+	typeof(ptr) __ai_ptr = (ptr); \
+	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
+	arch_sync_cmpxchg(__ai_ptr, __VA_ARGS__); \
+})
+
+#ifndef CONFIG_GENERIC_ATOMIC64
 static __always_inline s64
 atomic64_read(const atomic64_t *v)
 {
@@ -1641,78 +1815,6 @@ atomic64_dec_if_positive(atomic64_t *v)
 #define atomic64_dec_if_positive atomic64_dec_if_positive
 #endif
 
-#if !defined(arch_xchg_relaxed) || defined(arch_xchg)
-#define xchg(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_xchg(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_xchg_acquire)
-#define xchg_acquire(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_xchg_acquire(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_xchg_release)
-#define xchg_release(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_xchg_release(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_xchg_relaxed)
-#define xchg_relaxed(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_xchg_relaxed(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if !defined(arch_cmpxchg_relaxed) || defined(arch_cmpxchg)
-#define cmpxchg(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_cmpxchg(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_cmpxchg_acquire)
-#define cmpxchg_acquire(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_cmpxchg_acquire(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_cmpxchg_release)
-#define cmpxchg_release(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_cmpxchg_relaxed)
-#define cmpxchg_relaxed(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_cmpxchg_relaxed(__ai_ptr, __VA_ARGS__); \
-})
-#endif
-
 #if !defined(arch_cmpxchg64_relaxed) || defined(arch_cmpxchg64)
 #define cmpxchg64(ptr, ...) \
 ({ \
@@ -1749,57 +1851,6 @@ atomic64_dec_if_positive(atomic64_t *v)
 })
 #endif
 
-#if !defined(arch_try_cmpxchg_relaxed) || defined(arch_try_cmpxchg)
-#define try_cmpxchg(ptr, oldp, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	typeof(oldp) __ai_oldp = (oldp); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
-	arch_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_try_cmpxchg_acquire)
-#define try_cmpxchg_acquire(ptr, oldp, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	typeof(oldp) __ai_oldp = (oldp); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
-	arch_try_cmpxchg_acquire(__ai_ptr, __ai_oldp, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_try_cmpxchg_release)
-#define try_cmpxchg_release(ptr, oldp, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	typeof(oldp) __ai_oldp = (oldp); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
-	arch_try_cmpxchg_release(__ai_ptr, __ai_oldp, __VA_ARGS__); \
-})
-#endif
-
-#if defined(arch_try_cmpxchg_relaxed)
-#define try_cmpxchg_relaxed(ptr, oldp, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	typeof(oldp) __ai_oldp = (oldp); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
-	arch_try_cmpxchg_relaxed(__ai_ptr, __ai_oldp, __VA_ARGS__); \
-})
-#endif
-
-#define cmpxchg_local(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_cmpxchg_local(__ai_ptr, __VA_ARGS__); \
-})
-
 #define cmpxchg64_local(ptr, ...) \
 ({ \
 	typeof(ptr) __ai_ptr = (ptr); \
@@ -1807,13 +1858,7 @@ atomic64_dec_if_positive(atomic64_t *v)
 	arch_cmpxchg64_local(__ai_ptr, __VA_ARGS__); \
 })
 
-#define sync_cmpxchg(ptr, ...) \
-({ \
-	typeof(ptr) __ai_ptr = (ptr); \
-	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
-	arch_sync_cmpxchg(__ai_ptr, __VA_ARGS__); \
-})
-
+#endif
 #define cmpxchg_double(ptr, ...) \
 ({ \
 	typeof(ptr) __ai_ptr = (ptr); \
@@ -1830,4 +1875,4 @@ atomic64_dec_if_positive(atomic64_t *v)
 })
 
 #endif /* _ASM_GENERIC_ATOMIC_INSTRUMENTED_H */
-// 4bec382e44520f4d8267e42620054db26a659ea3
+// 701f331c42f0e10e2effb6d113873d44a7495f15
diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
index 370f01d..bb5cf1e 100644
--- a/include/asm-generic/atomic64.h
+++ b/include/asm-generic/atomic64.h
@@ -34,6 +34,18 @@ extern s64 atomic64_fetch_##op(s64 a, atomic64_t *v);
 ATOMIC64_OPS(add)
 ATOMIC64_OPS(sub)
 
+#define atomic64_add_relaxed atomic64_add
+#define atomic64_add_acquire atomic64_add
+#define atomic64_add_release atomic64_add
+
+#define atomic64_add_return_relaxed atomic64_add_return
+#define atomic64_add_return_acquire atomic64_add_return
+#define atomic64_add_return_release atomic64_add_return
+
+#define atomic64_fetch_add_relaxed atomic64_fetch_add
+#define atomic64_fetch_add_acquire atomic64_fetch_add
+#define atomic64_fetch_add_release atomic64_fetch_add
+
 #undef ATOMIC64_OPS
 #define ATOMIC64_OPS(op)	ATOMIC64_OP(op) ATOMIC64_FETCH_OP(op)
 
@@ -49,8 +61,85 @@ ATOMIC64_OPS(xor)
 extern s64 atomic64_dec_if_positive(atomic64_t *v);
 #define atomic64_dec_if_positive atomic64_dec_if_positive
 extern s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n);
+#define atomic64_cmpxchg_relaxed atomic64_cmpxchg
+#define atomic64_cmpxchg_acquire atomic64_cmpxchg
+#define atomic64_cmpxchg_release atomic64_cmpxchg
 extern s64 atomic64_xchg(atomic64_t *v, s64 new);
+#define atomic64_xchg_relaxed atomic64_xchg
+#define atomic64_xchg_acquire atomic64_xchg
+#define atomic64_xchg_release atomic64_xchg
 extern s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u);
 #define atomic64_fetch_add_unless atomic64_fetch_add_unless
 
+static __always_inline void
+atomic64_inc(atomic64_t *v)
+{
+	atomic64_add(1, v);
+}
+
+static __always_inline s64
+atomic64_inc_return(atomic64_t *v)
+{
+	return atomic64_add_return(1, v);
+}
+
+static __always_inline s64
+atomic64_fetch_inc(atomic64_t *v)
+{
+	return atomic64_fetch_add(1, v);
+}
+
+static __always_inline void
+atomic64_dec(atomic64_t *v)
+{
+	atomic64_sub(1, v);
+}
+
+static __always_inline s64
+atomic64_dec_return(atomic64_t *v)
+{
+	return atomic64_sub_return(1, v);
+}
+
+static __always_inline s64
+atomic64_fetch_dec(atomic64_t *v)
+{
+	return atomic64_fetch_sub(1, v);
+}
+
+static __always_inline void
+atomic64_andnot(s64 i, atomic64_t *v)
+{
+	atomic64_and(~i, v);
+}
+
+static __always_inline s64
+atomic64_fetch_andnot(s64 i, atomic64_t *v)
+{
+	return atomic64_fetch_and(~i, v);
+}
+
+static __always_inline bool
+atomic64_sub_and_test(int i, atomic64_t *v)
+{
+	return atomic64_sub_return(i, v) == 0;
+}
+
+static __always_inline bool
+atomic64_dec_and_test(atomic64_t *v)
+{
+	return atomic64_dec_return(v) == 0;
+}
+
+static __always_inline bool
+atomic64_inc_and_test(atomic64_t *v)
+{
+	return atomic64_inc_return(v) == 0;
+}
+
+static __always_inline bool
+atomic64_add_negative(s64 i, atomic64_t *v)
+{
+	return atomic64_add_return(i, v) < 0;
+}
 #endif  /*  _ASM_GENERIC_ATOMIC64_H  */
diff --git a/include/linux/atomic-arch-fallback.h b/include/linux/atomic-arch-fallback.h
index a3dba31..2f1db6a 100644
--- a/include/linux/atomic-arch-fallback.h
+++ b/include/linux/atomic-arch-fallback.h
@@ -1252,7 +1252,7 @@ arch_atomic_dec_if_positive(atomic_t *v)
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #include <asm-generic/atomic64.h>
-#endif
+#else
 
 #ifndef arch_atomic64_read_acquire
 static __always_inline s64
@@ -2357,5 +2357,6 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #define arch_atomic64_dec_if_positive arch_atomic64_dec_if_positive
 #endif
 
+#endif /* CONFIG_GENERIC_ATOMIC64 */
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// cca554917d7ea73d5e3e7397dd70c484cad9b2c4
+// ae31a21075855e67a9b2927f8241dedddafda046
diff --git a/include/linux/atomic-fallback.h b/include/linux/atomic-fallback.h
index 2a3f55d..7dda483 100644
--- a/include/linux/atomic-fallback.h
+++ b/include/linux/atomic-fallback.h
@@ -1369,7 +1369,7 @@ atomic_dec_if_positive(atomic_t *v)
 
 #ifdef CONFIG_GENERIC_ATOMIC64
 #include <asm-generic/atomic64.h>
-#endif
+#else
 
 #define arch_atomic64_read atomic64_read
 #define arch_atomic64_read_acquire atomic64_read_acquire
@@ -2591,5 +2591,6 @@ atomic64_dec_if_positive(atomic64_t *v)
 #define atomic64_dec_if_positive atomic64_dec_if_positive
 #endif
 
+#endif /* CONFIG_GENERIC_ATOMIC64 */
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// d78e6c293c661c15188f0ec05bce45188c8d5892
+// b809c8e3c88910826f765bdba4a74f21c527029d
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 317a6ce..8b7a685 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -247,7 +247,7 @@ done
 cat <<EOF
 #ifdef CONFIG_GENERIC_ATOMIC64
 #include <asm-generic/atomic64.h>
-#endif
+#else
 
 EOF
 
@@ -256,5 +256,6 @@ grep '^[a-z]' "$1" | while read name meta args; do
 done
 
 cat <<EOF
+#endif /* CONFIG_GENERIC_ATOMIC64 */
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
 EOF
diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
index 5766ffc..c4e0611 100755
--- a/scripts/atomic/gen-atomic-instrumented.sh
+++ b/scripts/atomic/gen-atomic-instrumented.sh
@@ -182,21 +182,40 @@ grep '^[a-z]' "$1" | while read name meta args; do
 	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
 done
 
+for xchg in "xchg" "cmpxchg" "cmpxchg64" "try_cmpxchg"; do
+	for order in "" "_acquire" "_release" "_relaxed"; do
+		gen_optional_xchg "${xchg}" "${order}"
+	done
+done
+
+for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg"; do
+	gen_xchg "${xchg}" ""
+	printf "\n"
+done
+
+cat <<EOF
+#ifndef CONFIG_GENERIC_ATOMIC64
+EOF
+
 grep '^[a-z]' "$1" | while read name meta args; do
 	gen_proto "${meta}" "${name}" "atomic64" "s64" ${args}
 done
 
-for xchg in "xchg" "cmpxchg" "cmpxchg64" "try_cmpxchg"; do
+for xchg in "cmpxchg64"; do
 	for order in "" "_acquire" "_release" "_relaxed"; do
 		gen_optional_xchg "${xchg}" "${order}"
 	done
 done
 
-for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg"; do
+for xchg in "cmpxchg64_local"; do
 	gen_xchg "${xchg}" ""
 	printf "\n"
 done
 
+cat <<EOF
+#endif
+EOF
+
 gen_xchg "cmpxchg_double" "2 * "
 
 printf "\n\n"
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
