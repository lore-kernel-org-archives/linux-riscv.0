Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC096EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 05:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eLuVd3F7NGPjfdgSuyQN5AWfyB2zrhJ38g3EttoA10=; b=XdJ2dEJXUgNu9p
	28p59SO3WLU76k+C7QmjDXj40wy1wwosyHZRC4obJzX47I4p6dimT5uClEFCqsRX9c4m9fzRJuv7V
	nO4zW5DnF+oFMeZ04L3h80/aMnQaHKUaT2wm82kZ8kaGyuar9jh/lyqYhDMx1obJrbiB0DGxzLEy2
	Sxqv4IgNaTwBLWZbkoI7LlZNGLTrD1CFMYnn1k+n0gfn+wXj4oKuXqaw79xniDDIlcieZ24PiaNYT
	d5BRAifQaUMNfXbYUfpse0cXtoZ3KFzNt1hhydtAbnrbrv3wwGqk3KPtRL/fyRCxLzyAa80U8eN5s
	/WIhb2qDDiZX6HfAqZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQfg-006fRD-26;
	Thu, 03 Aug 2023 05:14:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRQfd-006fNu-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 05:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691039678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wZcGwtCjzhW0OBBycEUaxWbT2VDTB4yqfuLafpABV3I=;
	b=Qn7bbrB9UPJGR/2tGKA8JDFGm2ZvoM1/H1a3A+IvDeFOFneq7QECCd0pFycGCR8LpQnZh9
	+2aNIC2MQG/ZIwjd+qzacz13eTQetdqJ6rGN+lXRLnnLgZm6l6y7hWwrL4KZtxjfGKn2mL
	qMkpKtED6/WTdJQIk24ZUSNizlRSo94=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-qmC_roWvM6q5hKJ52UbJLg-1; Thu, 03 Aug 2023 01:14:35 -0400
X-MC-Unique: qmC_roWvM6q5hKJ52UbJLg-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-39cdf9f9d10so623359b6e.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 22:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691039674; x=1691644474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZcGwtCjzhW0OBBycEUaxWbT2VDTB4yqfuLafpABV3I=;
        b=cJO7rRdFcbyBMSH0smm/mW+RBSLQBY4psw553RmwejbdexEBSET3Etx4KeBtiGIyUq
         Z0TgEkNGOXmfLy6fcSepfB4o2C8ra9cx06avpbdxIpciWYXSpsDNK6T50i/ipZqxHDBH
         rcFWTTdHKw5RLscYhq0BhoYkbuRX18j9ZtymVKUD5vXucgalCc7waetJ+/2HOVfUmzQR
         g8aR+mRZcQhX7Xxuo8423hLBDD6p2jMnaQmbdrY/7oBBD4tGdLEbLEgtySkdCVx01ODo
         PZSC6xG/xduXvpx82ZBUlRjGbl4iX1yXtHbqeJpF0qX0IklpWcFuU+es79dyCqCg5tc+
         e8Wg==
X-Gm-Message-State: ABy/qLYYdrKDv67dowLbPhVPYU0ZIsJWUZJCrbJgeAd3bWFC9uX+VQ3N
	hbl1ukJxw2sZ1EUemA05623n+4W8D3qD2/wdBnXuEubZ63Zrb5Kiz60rAokfTx1wqtQ9xj3MHkO
	fBrgUeTGMTLHa5js4g95kqTpXH99e
X-Received: by 2002:a05:6808:b08:b0:3a7:5314:e572 with SMTP id s8-20020a0568080b0800b003a75314e572mr5934118oij.53.1691039674424;
        Wed, 02 Aug 2023 22:14:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEfiz2uOFuhiqR6748NuQ/vIPQxwC/CwbLPbjx+5B22xsQA9uZm1XAzQNvPTBTAb3fsMZ+03g==
X-Received: by 2002:a05:6808:b08:b0:3a7:5314:e572 with SMTP id s8-20020a0568080b0800b003a75314e572mr5934111oij.53.1691039674128;
        Wed, 02 Aug 2023 22:14:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id g51-20020a0568080df300b003a75593746asm1675473oic.57.2023.08.02.22.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 22:14:33 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ingo Molnar <mingo@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/3] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Thu,  3 Aug 2023 02:13:58 -0300
Message-ID: <20230803051401.710236-3-leobras@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803051401.710236-2-leobras@redhat.com>
References: <20230803051401.710236-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_221445_631565_CB6B00E2 
X-CRM114-Status: GOOD (  12.70  )
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

In this header every xchg define (_relaxed, _acquire, _release, vanilla)
contain it's own asm file, both for 4-byte variables an 8-byte variables,
on a total of 8 versions of mostly the same asm.

This is usually bad, as it means any change may be done in up to 8
different places.

Unify those versions by creating a new define with enough parameters to
generate any version of the previous 8.

Then unify the result under a more general define, and simplify
arch_xchg* generation.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 136 +++++--------------------------
 1 file changed, 22 insertions(+), 114 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..ec4ea4f3f908 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,60 +11,30 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
-#define __xchg_relaxed(ptr, new, size)					\
+#define __arch_xchg(sfx, prepend, append, r, p, n)			\
 ({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
-
-#define arch_xchg_relaxed(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" sfx " %0, %2, %1\n"			\
+		append							\
+		: "=r" (r), "+A" (*(p))					\
+		: "r" (n)						\
+		: "memory");						\
 })
 
-#define __xchg_acquire(ptr, new, size)					\
+#define _arch_xchg(ptr, new, sfx, prepend, append)			\
 ({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __new = (new);				\
 	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
+	__typeof__(ptr) __ptr = (ptr);					\
+	switch (sizeof(*__ptr)) {					\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		__arch_xchg(".w" sfx, prepend, append,			\
+			      __ret, __ptr, __new);			\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		__arch_xchg(".d" sfx, prepend, append,			\
+			      __ret, __ptr, __new);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -72,79 +42,17 @@
 	__ret;								\
 })
 
-#define arch_xchg_acquire(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
+#define arch_xchg_relaxed(ptr, x)					\
+	_arch_xchg(ptr, x, "", "", "")
 
-#define __xchg_release(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+#define arch_xchg_acquire(ptr, x)					\
+	_arch_xchg(ptr, x, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_release(ptr, x)					\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __xchg_release((ptr),			\
-					    _x_, sizeof(*(ptr)));	\
-})
-
-#define __arch_xchg(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	_arch_xchg(ptr, x, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg(ptr, x)						\
-({									\
-	__typeof__(*(ptr)) _x_ = (x);					\
-	(__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));	\
-})
+	_arch_xchg(ptr, x, ".aqrl", "", "")
 
 #define xchg32(ptr, x)							\
 ({									\
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
