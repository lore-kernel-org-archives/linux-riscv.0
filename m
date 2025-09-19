Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BACCAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S67VhI2YHw5sT6cJjdiqZ+8k1r4EJ66yrsex8gbDiiI=; b=SohCIdb6FaqjcM
	kt0QfM0f225F1DDwxcO1eKnOZn0mXS+ovmr5Dvz8HXDjaszlWLvwiJZNHc0fb4PmazCETADkEHnH3
	J1BmuHDpV67PUI/WmQ/Q4Gg2FKMgbcXENxjwGNrzjJHzI7f6sOijoyNFxqjuIMLcOXUOJ73+uPT0m
	7dD3WFmMbJZxlaWKFy3sdkAxYOzJpwLf/HwGo+4af2wnjVtnf4S1IYS8gbzmzcVJbK7BAmFbr3mMz
	BZjEGQMFYROjYwqfXmZ8SeEXmEtBEoAeSqTnFYpusJdoiqImey8RXlr3SqsMYK8mt/IL2PbwnVYX2
	rf3WBcuSiRqaDpG88ppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhT-000000025pc-1fdh;
	Fri, 19 Sep 2025 07:38:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhQ-000000025mq-1AEo
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:33 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77615d6af4fso2633452b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267512; x=1758872312; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3On5utOYIbuVmrZq33FPNGpaqahVTFNH4SYvOX0y2+w=;
        b=h7lyrVD2PohWommwhNwutJRts3fsH7LtqQ7V82A+6ASFbtRdQByPM5CTsdmvJ8C9f2
         xfvxnGYbqQWpfa7HdO+UeuC2RdhDzyAqE0YWVfOxsNnyJyG4d/DnFNFAft0RLHyLwKZ8
         SnQSl+PLq3Xda9hDtQmw99e/VezpMhHRvB6tGbBt/LtNkb+8J3ZyMVh7En3YR2mlBC8J
         YYMs75EowAwDOwMUqHfahl/ED5NlX7E+M/X+TZjktuljFffZQzwvj06XL98afGE1QsLF
         maRd1DiNfITiuyRr5TVmBZb+bargMSRRWZblZJQpnBK8CsvxC9CTulF7SAwk/EM1p+Rd
         iImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267512; x=1758872312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3On5utOYIbuVmrZq33FPNGpaqahVTFNH4SYvOX0y2+w=;
        b=YuO9rrH6cotA499DqbKqjjogrKRzyTQqbPaqmo8Nu8tVEVi56FKpBDMrMYpLy39eJF
         YvR33oMZGSejITn2gt1W1FXeKmgMKoHSDsMbMc/7pB9G2EP8LxBow59OFO98LD1Bwtka
         Y+vX1UNKEwElV5KJKG+S7gvQyvRVwZKWHBPFPzfGmDQQ8GxdO3hm0MaJ5QoAt5ZHU/bB
         qaTcnP0fJA8K2lUiBcjjDFSH2gGlT596fFYLi2x3X+QeCiq1Gf5cl76xd1WnfKsBjy2s
         tsl7uecAuVv931qkzSl7I2QblzKBEHVOng1WphQjY6ZBYnsah4XpyAHy3PKGgbl0mWsa
         RWhA==
X-Forwarded-Encrypted: i=1; AJvYcCUrI6LELw5mZE4Aohq7UxmzeRdgeuIMEtNKqOB1FDQHUWNITx4DDefQE8N3MoYwrSaUzP1f5k602sqFeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS2x5pQCtHtcJuJhDms7NA6z8eoAo/+KWCDgmDkvUjROlwJTxl
	BYjgdJbhz3lhA1ACyqfZXBBpvBnLXCFxpRLz7H98OAmVFJCg4dD+1YlCVZ8B7DHyxHk=
X-Gm-Gg: ASbGnctdHf0Jn0r1hh9A+6pabl2hZDFF5+1BVthzbHMeifKMdNnCRf2nS2N5XL8ZsHM
	sm+msJvjVvCQEXIlmXSU6p3Wss4MrjiUUUNZ/+7cJ7ja4hyPSiey2BaMePI0ZsNA4eXH9a3lsEp
	3hvUhsDiGqDx89NYWhROMt5mNyUL2xS8efCZLDbcBSM0zwD0lEWge2sKv0jYZBtmLRyLg7cx2Np
	59/rnqVXBFBimm6pEzGQYrdwVw8B3LLfabb4LdrPdtuBCw5oKe2Yp+SXc7TJR1uVLHd6lJ2pcGX
	qnrEOK/ujDqSaXoBQHk6cl1v16W0W293Yp0BALTBRZ+6hqoqdLQKhG7dTXE1+EHmgRmlcDDoQxo
	QWDP5+XOwP0qTFEEyU3fCPEQL/LkxoZ/pUkCBqdUYJ91LGEu7FKaLROCLViEX1h54s/todOvh+Q
	axvcU86R4qxwx2XFj2/tUsO6sTwcW8xNWTwF7hjuf9qQ==
X-Google-Smtp-Source: AGHT+IFIJw3ZbMmjD6VhzqUSKT7pqN8ruRnEiHd3w5FK7GBp4ujpuv/Fd0UOkn0D7RcUADn2pVkDew==
X-Received: by 2002:a05:6a20:6a20:b0:24d:d206:699b with SMTP id adf61e73a8af0-2927154982dmr3593051637.41.1758267511524;
        Fri, 19 Sep 2025 00:38:31 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:31 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 6/8] riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
Date: Fri, 19 Sep 2025 15:37:12 +0800
Message-ID: <20250919073714.83063-7-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003832_336456_B88B38FD 
X-CRM114-Status: GOOD (  12.22  )
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

The existing arch_xchg/arch_cmpxchg operations are implemented by
inserting fence instructions before or after atomic instructions.
This commit replaces them with real acquire/release semantics.

|----------------------------------------------------------------|
|    |    arch_xchg_release       |     arch_cmpxchg_release     |
|    |-----------------------------------------------------------|
|    | zabha      | !zabha        | zabha+zacas | !(zabha+zacas) |
| rl |-----------------------------------------------------------|
|    |            | (fence rw, w) |             | (fence rw, w)  |
|    | amoswap.rl | lr.w          | amocas.rl   | lr.w           |
|    |            | sc.w.rl       |             | sc.w.rl        |
|----------------------------------------------------------------|
|    |    arch_xchg_acquire       |     arch_cmpxchg_acquire     |
|    |-----------------------------------------------------------|
|    | zabha      | !zabha        | zabha+zacas | !(zabha+zacas) |
| aq |-----------------------------------------------------------|
|    |            | lr.w.aq       |             | lr.w.aq        |
|    | amoswap.aq | sc.w          | amocas.aq   | sc.w           |
|    |            | (fence r, rw) |             | (fence r, rw)  |
|----------------------------------------------------------------|

(fence rw, w), (fence r, rw) here means such instructions will only
be inserted when zalasr is not implemented.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/atomic.h  |   6 --
 arch/riscv/include/asm/cmpxchg.h | 136 ++++++++++++++-----------------
 2 files changed, 63 insertions(+), 79 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb5..b79a4f889f339 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -18,12 +18,6 @@
 
 #include <asm/cmpxchg.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
-
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
 	return READ_ONCE(v->counter);
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0b749e7102162..207fdba38d1fc 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -15,15 +15,23 @@
 #include <asm/cpufeature-macros.h>
 #include <asm/processor.h>
 
-#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
-			   swap_append, r, p, n)				\
+/*
+ * These macros are here to improve the readability of the arch_xchg_XXX()
+ * and arch_cmpxchg_XXX() macros.
+ */
+#define LR_SFX(x)		x
+#define SC_SFX(x)		x
+#define CAS_SFX(x)		x
+#define SC_PREPEND(x)		x
+#define SC_APPEND(x)		x
+
+#define __arch_xchg_masked(lr_sfx, sc_sfx, swap_sfx, sc_prepend, sc_append,	\
+			   r, p, n)						\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
 		__asm__ __volatile__ (						\
-			prepend							\
 			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
-			swap_append						\
 			: "=&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -37,14 +45,16 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-		       prepend							\
 		       PREFETCHW_ASM(%5)					\
+		       ALTERNATIVE(__nops(1), sc_prepend,			\
+				   0, RISCV_ISA_EXT_ZALASR, 1)			\
 		       "0:	lr.w %0, %2\n"					\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
 		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 		       "	bnez %1, 0b\n"					\
-		       sc_append						\
+		       ALTERNATIVE(__nops(1), sc_append,			\
+				   0, RISCV_ISA_EXT_ZALASR, 1)			\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 		       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
 		       : "memory");						\
@@ -53,19 +63,17 @@
 	}									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+#define __arch_xchg(sfx, r, p, n)					\
 ({									\
 	__asm__ __volatile__ (						\
-		prepend							\
 		"	amoswap" sfx " %0, %2, %1\n"			\
-		append							\
 		: "=r" (r), "+A" (*(p))					\
 		: "r" (n)						\
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
-		   sc_append, swap_append)				\
+#define _arch_xchg(ptr, new, lr_sfx, sc_sfx, swap_sfx,			\
+		   sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -73,22 +81,20 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+		__arch_xchg_masked(lr_sfx, sc_sfx, ".b" swap_sfx,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+		__arch_xchg_masked(lr_sfx, sc_sfx, ".h" swap_sfx,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".w" swap_sfx, __ret, __ptr, __new);	\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".d" swap_sfx, __ret, __ptr, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -97,17 +103,23 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "", "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(""), CAS_SFX(""),		\
+		   SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "",					\
-		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, LR_SFX(".aq"), SC_SFX(""), CAS_SFX(".aq"),	\
+		   SC_PREPEND(__nops(1)),				\
+		   SC_APPEND(RISCV_ACQUIRE_BARRIER))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(".rl"), CAS_SFX(".rl"),	\
+		   SC_PREPEND(RISCV_RELEASE_BARRIER),			\
+		   SC_APPEND(__nops(1)))
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(".aqrl"),			\
+		   CAS_SFX(".aqrl"), SC_PREPEND(__nops(1)),		\
+		   SC_APPEND(__nops(1)))
 
 #define xchg32(ptr, x)							\
 ({									\
@@ -126,9 +138,7 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
-			      sc_prepend, sc_append,				\
-			      cas_prepend, cas_append,				\
+#define __arch_cmpxchg_masked(lr_sfx, sc_sfx, cas_sfx, sc_prepend, sc_append,	\
 			      r, p, o, n)					\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
@@ -138,9 +148,7 @@
 		r = o;								\
 										\
 		__asm__ __volatile__ (						\
-			cas_prepend							\
 			"	amocas" cas_sfx " %0, %z2, %1\n"		\
-			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -155,15 +163,17 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-			sc_prepend							\
-			"0:	lr.w %0, %2\n"					\
+			ALTERNATIVE(__nops(1), sc_prepend,			\
+				    0, RISCV_ISA_EXT_ZALASR, 1)			\
+			"0:	lr.w" lr_sfx " %0, %2\n"			\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
 			"	and  %1, %0, %z6\n"				\
 			"	or   %1, %1, %z4\n"				\
 			"	sc.w" sc_sfx " %1, %1, %2\n"			\
 			"	bnez %1, 0b\n"					\
-			sc_append							\
+			ALTERNATIVE(__nops(1), sc_append,			\
+				    0, RISCV_ISA_EXT_ZALASR, 1)			\
 			"1:\n"							\
 			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 			: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -174,9 +184,7 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
-		       sc_prepend, sc_append,				\
-		       cas_prepend, cas_append,				\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,	sc_prepend, sc_append,	\
 		       r, p, co, o, n)					\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
@@ -184,9 +192,7 @@
 		r = o;							\
 									\
 		__asm__ __volatile__ (					\
-			cas_prepend					\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -194,12 +200,14 @@
 		register unsigned int __rc;				\
 									\
 		__asm__ __volatile__ (					\
-			sc_prepend					\
+			ALTERNATIVE(__nops(1), sc_prepend,		\
+				    0, RISCV_ISA_EXT_ZALASR, 1)		\
 			"0:	lr" lr_sfx " %0, %2\n"			\
 			"	bne  %0, %z3, 1f\n"			\
 			"	sc" sc_sfx " %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			sc_append					\
+			ALTERNATIVE(__nops(1), sc_append,		\
+				    0, RISCV_ISA_EXT_ZALASR, 1)		\
 			"1:\n"						\
 			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
 			: "rJ" (co o), "rJ" (n)				\
@@ -207,9 +215,8 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
-		      sc_prepend, sc_append,				\
-		      cas_prepend, cas_append)				\
+#define _arch_cmpxchg(ptr, old, new, lr_sfx, sc_sfx, cas_sfx,		\
+		      sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -218,27 +225,23 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_sfx, sc_sfx, ".b" cas_sfx,	\
 				      sc_prepend, sc_append,		\
-				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_sfx, sc_sfx, ".h" cas_sfx,	\
 				      sc_prepend, sc_append,		\
-				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+		__arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,	\
 			       sc_prepend, sc_append,			\
-			       cas_prepend, cas_append,			\
 			       __ret, __ptr, (long)(int)(long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+		__arch_cmpxchg(".d" lr_sfx, ".d" sc_sfx, ".d" cas_sfx,	\
 			       sc_prepend, sc_append,			\
-			       cas_prepend, cas_append,			\
 			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
@@ -247,40 +250,27 @@
 	(__typeof__(*(__ptr)))__ret;					\
 })
 
-/*
- * These macros are here to improve the readability of the arch_cmpxchg_XXX()
- * macros.
- */
-#define SC_SFX(x)	x
-#define CAS_SFX(x)	x
-#define SC_PREPEND(x)	x
-#define SC_APPEND(x)	x
-#define CAS_PREPEND(x)	x
-#define CAS_APPEND(x)	x
-
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(""),			\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(""), CAS_SFX(""),		\
+		      SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
+		      LR_SFX(".aq"), SC_SFX(""), CAS_SFX(".aq"),	\
+		      SC_PREPEND(__nops(1)),				\
+		      SC_APPEND(RISCV_ACQUIRE_BARRIER))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
-		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(".rl"), CAS_SFX(".rl"),	\
+		      SC_PREPEND(RISCV_RELEASE_BARRIER),		\
+		      SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
-		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(".aqrl"), CAS_SFX(".aqrl"),	\
+		      SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
