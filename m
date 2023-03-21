Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE25C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dH59x81M0Xxt/TW605N5K2lz+7ZwyyEQrFctVsSr0o=; b=Z1kD1EgMXOrDE0
	cexNc7anssYzJxJUfbwxdWgs4HxMGzWlX+ou+t0rki+NMsIWWRbEAu8jyaqdq/3IYa9UUbHKTNmhA
	zE8HgRwY79znany452bzXLLiHxyeyZlC3hGLnasIrh73KHPZNm3S4sfFaEAgkyQP/75vQ8J/yBeW6
	PQw005G7vF7f5LGtskYuYMAdg4VGTY86AQ3yit9kRWEUSzcgW5mnvjMDnXWUr+JVLWSa2yShh5+zk
	+65FILFjfAH8ZKZvODUVENUF1s+SCvcMVJpr1ZsqP3h4yxnLQluxLVN8ZvSqBidPxwvqp4HPYwd44
	NJe+vw78VjgPVyeQzRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVan-00BOPy-0Q;
	Tue, 21 Mar 2023 06:35:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVai-00BOOW-2t
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlcmKFBm9EfeLOX/A4Ek+TTZZd7OjXZ+kA7z9b9Tay8=;
	b=iURs8xeXYNok0JE2Ic4HVneeGYr81nVsK5gRNb/gqAAdptjOw/2jX5ElPLL+m0CcOzD3oX
	y2cymY48OkCGyfcYtkSUX4c3v0fH/KOvikqMUwNDq9maeZYtel7qZYp1OfS6KabluSpNuK
	eqPsDmV/1pG/nU8XsIphLNAJvXWQXX0=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-1pcdUK8lPq6WSyQY9u2dqg-1; Tue, 21 Mar 2023 02:35:26 -0400
X-MC-Unique: 1pcdUK8lPq6WSyQY9u2dqg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17abfe9fd10so8132578fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlcmKFBm9EfeLOX/A4Ek+TTZZd7OjXZ+kA7z9b9Tay8=;
        b=cdapzbWpFausR6M/CiwgXLop0HoA7uODGebO8wAN9TkxHajbmBswMVKeiEny8zxxvl
         Eiw572aC3gD2/xkdMVdV//qPRMu8sCusnLAacymsZF6EzRcALvsydyk+QqSVbn9pl46M
         0R5i7wbAqvgLNSYoyvs7ljs8Ipy0jAQ9vCUa/YL/r079OxzEQFHbb62yTn9r9h3WdY50
         C9Z70crxkW018GlfX3m1nOParGG2hLSp67WP3fHeOwqr5AzpGN3FykQ+6eo0ev2J4WQj
         Q7w7ouxjVipyrh3uhbjQjktibzG4Sptz/2nlsGNB1sUr79Awx+uKFrD+UKYxkOHU2gKv
         Ueow==
X-Gm-Message-State: AO0yUKVaMXr4fx5pYYqbv7ewHPJoSmmkYlBi2Vp7Gtonhob3X4dvmDsX
	HQU7wHFsjzSsYo+cYy/MP4jf03+g15bqf+TvTEf3g5VBU/RMiLgLZ6NI7rLGLUddixFNHl7tHkt
	NYUdOcAd+NZvFP/CbDpVwKLGfGdjV
X-Received: by 2002:a9d:6ad0:0:b0:69f:d2:4ff9 with SMTP id m16-20020a9d6ad0000000b0069f00d24ff9mr658169otq.34.1679380525850;
        Mon, 20 Mar 2023 23:35:25 -0700 (PDT)
X-Google-Smtp-Source: AK7set8BL8xxcS2gihrUiVrow++wCxZdFOVZ6MdUs+6m2NdC+EoSp3K2yAnigR0ShdhdoBiekQPvMA==
X-Received: by 2002:a9d:6ad0:0:b0:69f:d2:4ff9 with SMTP id m16-20020a9d6ad0000000b0069f00d24ff9mr658162otq.34.1679380525642;
        Mon, 20 Mar 2023 23:35:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:25 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 5/6] riscv/cmpxchg: Deduplicate xchg() macros
Date: Tue, 21 Mar 2023 03:34:31 -0300
Message-Id: <20230321063430.2218795-6-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233529_009773_C7C72458 
X-CRM114-Status: GOOD (  10.73  )
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

Every xchg define (_relaxed, _acquire, _release, vanilla) contain it's own
define for creating tmp variables and selecting the correct asm code for
given variable size.

All those defines are mostly the same code (other than specific barriers),
so there is no need to keep the 4 copies.

Unify those under a more general define, that can reproduce the previous 4
versions.

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 62 ++++++--------------------------
 1 file changed, 10 insertions(+), 52 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 715bf61e72c82..23da4d8e6f0c8 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,7 +11,7 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
-#define ___xchg(sfx, prepend, append)					\
+#define ____xchg(sfx, prepend, append)					\
 ({									\
 	__asm__ __volatile__ (						\
 		prepend							\
@@ -22,17 +22,17 @@
 		: "memory");						\
 })
 
-#define __xchg_relaxed(ptr, new, size)					\
+#define ___xchg(ptr, new, size, sfx, prepend, append)			\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		___xchg(".w", "", "");					\
+		____xchg(".w" sfx, prepend, append);			\
 		break;							\
 	case 8:								\
-		___xchg(".d", "", "");					\
+		____xchg(".d" sfx, prepend, append);			\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -40,6 +40,9 @@
 	__ret;								\
 })
 
+#define __xchg_relaxed(ptr, new, size)					\
+	___xchg(ptr, new, size, "", "", "")
+
 #define arch_xchg_relaxed(ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
@@ -48,22 +51,7 @@
 })
 
 #define __xchg_acquire(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w", "", RISCV_ACQUIRE_BARRIER);		\
-		break;							\
-	case 8:								\
-		___xchg(".d", "", RISCV_ACQUIRE_BARRIER);		\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___xchg(ptr, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_acquire(ptr, x)					\
 ({									\
@@ -73,22 +61,7 @@
 })
 
 #define __xchg_release(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w", RISCV_RELEASE_BARRIER, "");		\
-		break;							\
-	case 8:								\
-		___xchg(".d", RISCV_RELEASE_BARRIER, "");		\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___xchg(ptr, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg_release(ptr, x)					\
 ({									\
@@ -98,22 +71,7 @@
 })
 
 #define __xchg(ptr, new, size)						\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w.aqrl", "", "");				\
-		break;							\
-	case 8:								\
-		___xchg(".d.aqrl", "", "");				\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___xchg(ptr, new, size, ".aqrl", "", "")
 
 #define arch_xchg(ptr, x)						\
 ({									\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
