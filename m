Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3876C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrnfMkVdr1iBQbdv/u580xcdbEk/Z0dD1KXW6DxKMGw=; b=KOy3EZz5Ix4ZI3
	8s5w9n5GgLQZl/m3P5m+CG7DcTnWuKUzHTXbED2N1OTrgWZYFN4AC4lEno9h4yJAsqP/mdp2b6lbU
	3TzOvOX7VCONwDkXtplORmS6Pqh30H3Llp61H51yTELh9cJLqreLflEwoCWj7ARgLAqrhCWihEgza
	sYV4XqFbkPs5NbxBLAiXScF2VuvMfl7612B4GnaN6OKKavk9Awg2KwPVOcx+KvIrufXF4Lehc8dUR
	eFjp7KJ1L3pFZbODwa9odf1oe980vnqsONp4fT3paFvcEYzNesjwcYu4IFq7hKZCDqhEWzqR94nS8
	Aybd6w68CMbQOpCVfzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX3-004OTN-1d;
	Sat, 18 Mar 2023 08:03:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX0-004OSS-1q
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPnhvOcPIzsxcdPaGdi9oJi4cZ44pFeBuguAKI/S1NE=;
	b=hxbuH26sHnIlLNHx/zBp6uP7wWd+DvEggnSd9JLt9W6+2dGkcQ43txJvYupzZMSmZYwOPP
	hgdbQmhHN0iTvaQpaJ9XEmOk8qnvJfRVKZQqixeKexybxaWP0ATdBEua0+fBN6rG27UyIK
	+czUun+d7knNks5UwQaEyJ1hIoqJ2dc=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-AltpBZceMk21AUwC_kQuBg-1; Sat, 18 Mar 2023 04:01:37 -0400
X-MC-Unique: AltpBZceMk21AUwC_kQuBg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17ae1c11a20so4237515fac.22
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPnhvOcPIzsxcdPaGdi9oJi4cZ44pFeBuguAKI/S1NE=;
        b=uxq5YoqdInHG3qr4ucYkkmsH7HWItjcIno6XpEYN3TiuBhiwJ2v+QpGze2FCKY553j
         5Bxs8E2ymc2xjq1osYJUie9G34LahcCCaUUeIf2IlRHnsoslBkEO9Yc/lAIv4QYBQLAV
         Z1Ixzcm6vLb3GjbaT4ulTPk25lgroaCKxMF19dCFmdFGYLM/wMaCFV8IKGqIER1OzM/v
         t3KOtRqMANhdOnYUW+Rn+SNsUmxNo7GXgKdpxH/TLDOPUPF5ObUO3S0eTGD9W5wx3CMw
         pIZw8qt3xPofFCK3GXNed5mUM9Fx4LRzKXj47OnVCMp0ICQPaNyoNbQmKScpqa2l2LBz
         VlwA==
X-Gm-Message-State: AO0yUKWvTIls9ATtLcHdQi6jHhoFb18X1eXdRz0Xku8Pn0d1qm1jeDec
	9I6T1pS0yAqKoTmDRsoDxsd/6HpUW1XFpjksEEQW50uovqeBBIz8jF7cM198LSz2CUt/jT82bJw
	azqfUxptPWHuWh2oEa7KZrfvqn3p3
X-Received: by 2002:a9d:6d07:0:b0:699:a4f5:c951 with SMTP id o7-20020a9d6d07000000b00699a4f5c951mr545064otp.2.1679126497074;
        Sat, 18 Mar 2023 01:01:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WcHJHToqcNvmcnD6lpwssEC4fCQRqdp8Ky5jVCA70hyM292yOTI3zEF7jhKXF67Z9dF5gdA==
X-Received: by 2002:a9d:6d07:0:b0:699:a4f5:c951 with SMTP id o7-20020a9d6d07000000b00699a4f5c951mr545053otp.2.1679126496831;
        Sat, 18 Mar 2023 01:01:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:36 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/6] riscv/cmpxchg: Deduplicate cmpxchg() macros
Date: Sat, 18 Mar 2023 05:00:56 -0300
Message-Id: <20230318080059.1109286-3-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010314_702538_C2F759FA 
X-CRM114-Status: GOOD (  10.53  )
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

Every cmpxchg define (_relaxed, _acquire, _release, vanilla) contain it's
own define for creating tmp variables and selecting the correct asm code
for give variable size.

All those defines are mostly the same code (other than specific barriers),
so there is no need to keep the 4 copies.

Unify those under a more general define, that can reproduce the previous 4
versions.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 72 ++++++--------------------------
 1 file changed, 12 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 21984d24cbfe7..c7a13eec4dbcc 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -164,8 +164,8 @@
  * indicated by comparing RETURN with OLD.
  */
 
-#define ___cmpxchg(lr_sfx, sc_sfx, prepend, append)			\
-{									\
+#define ____cmpxchg(lr_sfx, sc_sfx, prepend, append)			\
+({									\
 	__asm__ __volatile__ (						\
 		prepend							\
 		"0:	lr" lr_sfx " %0, %2\n"				\
@@ -177,9 +177,9 @@
 		: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)		\
 		: "rJ" ((long)__old), "rJ" (__new)			\
 		: "memory");						\
-}
+})
 
-#define __cmpxchg_relaxed(ptr, old, new, size)				\
+#define ___cmpxchg(ptr, old, new, size, sc_sfx, prepend, append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(ptr)) __old = (old);				\
@@ -188,10 +188,10 @@
 	register unsigned int __rc;					\
 	switch (size) {							\
 	case 4:								\
-		___cmpxchg(".w", ".w", "", "");				\
+		____cmpxchg(".w", ".w" sc_sfx, prepend, append);	\
 		break;							\
 	case 8:								\
-		___cmpxchg(".d", ".d", "", "");				\
+		____cmpxchg(".d", ".d" sc_sfx, prepend, append);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -199,6 +199,9 @@
 	__ret;								\
 })
 
+#define __cmpxchg_relaxed(ptr, old, new, size)				\
+	___cmpxchg(ptr, old, new, size, "", "", "")
+
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 ({									\
 	__typeof__(*(ptr)) _o_ = (o);					\
@@ -208,24 +211,7 @@
 })
 
 #define __cmpxchg_acquire(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w", "", RISCV_ACQUIRE_BARRIER);	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d", "", RISCV_ACQUIRE_BARRIER);	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 ({									\
@@ -236,24 +222,7 @@
 })
 
 #define __cmpxchg_release(ptr, old, new, size)				\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w", RISCV_RELEASE_BARRIER, "");	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d", RISCV_RELEASE_BARRIER, "");	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 ({									\
@@ -264,24 +233,7 @@
 })
 
 #define __cmpxchg(ptr, old, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(*(ptr)) __old = (old);				\
-	__typeof__(*(ptr)) __new = (new);				\
-	__typeof__(*(ptr)) __ret;					\
-	register unsigned int __rc;					\
-	switch (size) {							\
-	case 4:								\
-		___cmpxchg(".w", ".w.rl", "", "	fence rw, rw\n");	\
-		break;							\
-	case 8:								\
-		___cmpxchg(".d", ".d.rl", "", "	fence rw, rw\n");	\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___cmpxchg(ptr, old, new, size, ".rl", "", "	fence rw, rw\n")
 
 #define arch_cmpxchg(ptr, o, n)						\
 ({									\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
