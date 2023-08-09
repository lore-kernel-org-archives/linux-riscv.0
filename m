Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB38C04A94
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 02:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhbQNzoGMzCtmYEY/k+AVnlFkcaxvo5JicgInhaH/vo=; b=UfXidhBKHLd0kK
	ZF/v66gTuMB1Kj2rjH/1mMFxiP7ftau/11uinjlmbAjPbP78o9rEsC8DG3YemQIR27yIG5N3GgPHJ
	NKR5SrA7+m/+IkpqzmyzolHBPNiI5ppjU1E6lqm5fDVlTG9k6lHza74al2uAL680EZwXJEZhnwte1
	YAngjehiUSuuyxZ8ya9LPBh21GoAbCI9xSHWT4uoO+0klLENVDV4000UpOYZX0UT7CwVEqNUu8jVi
	ACHH1JCL7p/nQrx1Kk/TwysFqa7T5SLyOfHX/ZTsVuF8Z/kEnBeGZRsz9bZll/CMLq5bCDdkhvdNV
	vOsijgB0eoOCFHbKvQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYi9-003sWV-1y;
	Wed, 09 Aug 2023 02:14:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYi6-003sVP-0C
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 02:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691547245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=68droSgtD1yUeWujN9KsDS4jg7ssA0NCkb8PZ8Tb+SA=;
	b=ifLKCBrTkbde3XxZnKcm/m6DiScKFCzokIMTbsLRtriUBZpguxbTkbzH34ri7Hw1VujHTV
	VcUfjmqJdVyy9HzBav87WQkkloP9yJg6T0na94CPFzXXxKRi2ofblkkNugzS0LV08pBxQg
	ppYl0F/d4ax8R3r0UcZDdhCY5FYeG9E=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-pV8jn7XNNvmeHRZY8H--eg-1; Tue, 08 Aug 2023 22:14:03 -0400
X-MC-Unique: pV8jn7XNNvmeHRZY8H--eg-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-56c7404fafdso10497304eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 19:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691547243; x=1692152043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=68droSgtD1yUeWujN9KsDS4jg7ssA0NCkb8PZ8Tb+SA=;
        b=Eq7wbOldM9iM98P2TqShaC8hoN/4eka0LidWXRPlNfDFRwSXkMHZH/T0CYN1g7Jcvs
         vNB9km/agp/8OHV9zhpQ3dji7q6yMz7BGQcculjekwPFo5UcDXCub7CTkyfZS7lUqNxv
         H19C5/cgU7we62ZPpKHHTyrqmlTUu72fM0/29M0vaBOW4riKsqf54oa9U0bj4p+0UyMu
         tWYUu9o4ZE6aQV7fZY4ivWY5qFc5DTqCvqDxxB+UZtyBestknvDlcoVvoS8C0U+DR+Fx
         Gcwn5lW1OsGnwcB/YBUqFQU7vBfUU4Ljo2Ly7uh9Kw2ynucjHHftAeLTu4AaCG1chqMg
         5Jgg==
X-Gm-Message-State: AOJu0Yzm99pOKR/zGoKJvOfMAkSPBE1yqQ4GQNxSG1tyXHLlxVEKHiY3
	8dIi6ffV/EhBmWQxfMu/d95IKc23NlkIQpzkHnNOzg+y6c22nxwyG91OtOua7/289sqi6D8Jh9f
	6j0566q4IjZkhtrTWjhfBS4B6MYfl
X-Received: by 2002:a4a:3005:0:b0:56c:aa7a:eaeb with SMTP id q5-20020a4a3005000000b0056caa7aeaebmr1376295oof.4.1691547243033;
        Tue, 08 Aug 2023 19:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRBi7ZrL7X8EpzKEKv574j/yN24o/CUG+jxNQTD3De3Bdux9OGGevu77kaKC1CyIqeEg4tkw==
X-Received: by 2002:a4a:3005:0:b0:56c:aa7a:eaeb with SMTP id q5-20020a4a3005000000b0056caa7aeaebmr1376278oof.4.1691547242715;
        Tue, 08 Aug 2023 19:14:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7ec:e667:6b7d:ed55:c363:a088])
        by smtp.gmail.com with ESMTPSA id v10-20020a4a8c4a000000b0054fba751207sm6475518ooj.47.2023.08.08.19.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 19:14:02 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrea Parri <parri.andrea@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v4 2/5] riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
Date: Tue,  8 Aug 2023 23:13:07 -0300
Message-ID: <20230809021311.1390578-4-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809021311.1390578-2-leobras@redhat.com>
References: <20230809021311.1390578-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_191406_175597_C7F9F2AB 
X-CRM114-Status: GOOD (  12.40  )
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

In this header every cmpxchg define (_relaxed, _acquire, _release,
vanilla) contain it's own asm file, both for 4-byte variables an 8-byte
variables, on a total of 8 versions of mostly the same asm.

This is usually bad, as it means any change may be done in up to 8
different places.

Unify those versions by creating a new define with enough parameters to
generate any version of the previous 8.

Then unify the result under a more general define, and simplify
arch_cmpxchg* generation

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
---
 arch/riscv/include/asm/cmpxchg.h | 187 +++++--------------------------
 1 file changed, 29 insertions(+), 158 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index ec4ea4f3f908..5a07646fae65 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -71,127 +71,40 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-#define __cmpxchg_relaxed(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
 
-#define arch_cmpxchg_relaxed(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
 
-#define __cmpxchg_acquire(ptr, old, new, size)				\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
 ({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			RISCV_ACQUIRE_BARRIER				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
-
-#define arch_cmpxchg_acquire(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
+									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"0:	lr" lr_sfx " %0, %2\n"				\
+		"	bne  %0, %z3, 1f\n"				\
+		"	sc" sc_sfx " %1, %z4, %2\n"			\
+		"	bnez %1, 0b\n"					\
+		append							\
+		"1:\n"							\
+		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
+		: "rJ" (co o), "rJ" (n)					\
+		: "memory");						\
 })
 
-#define __cmpxchg_release(ptr, old, new, size)				\
+#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(ptr)) __old = (old);				\
 	__typeof__(*(ptr)) __new = (new);				\
 	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
+									\
+	switch (sizeof(*__ptr)) {					\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
+		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
+				__ret, __ptr, (long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
+		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
+				__ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -199,62 +112,20 @@
 	__ret;								\
 })
 
-#define arch_cmpxchg_release(ptr, o, n)					\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
-					_o_, _n_, sizeof(*(ptr)));	\
-})
+#define arch_cmpxchg_relaxed(ptr, o, n)					\
+	_arch_cmpxchg((ptr), (o), (n), "", "", "")
 
-#define __cmpxchg(ptr, old, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.w %0, %2\n"				\
-			"	bne  %0, %z3, 1f\n"			\
-			"	sc.w.rl %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" ((long)__old), "rJ" (__new)		\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"0:	lr.d %0, %2\n"				\
-			"	bne %0, %z3, 1f\n"			\
-			"	sc.d.rl %1, %z4, %2\n"			\
-			"	bnez %1, 0b\n"				\
-			"	fence rw, rw\n"				\
-			"1:\n"						\
-			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
-			: "rJ" (__old), "rJ" (__new)			\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+#define arch_cmpxchg_acquire(ptr, o, n)					\
+	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
+
+#define arch_cmpxchg_release(ptr, o, n)					\
+	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg(ptr, o, n)						\
-({									\
-	__typeof__(*(ptr)) _o_ = (o);					\
-	__typeof__(*(ptr)) _n_ = (n);					\
-	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
-				       _o_, _n_, sizeof(*(ptr)));	\
-})
+	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
 
 #define arch_cmpxchg_local(ptr, o, n)					\
-	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
+	arch_cmpxchg_relaxed((ptr), (o), (n))
 
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
