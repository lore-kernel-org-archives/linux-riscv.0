Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B65C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 06:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HrnfMkVdr1iBQbdv/u580xcdbEk/Z0dD1KXW6DxKMGw=; b=qYMdjKJQ/RHDf+
	irfijYHPOhXkeR1uv6OO1goVqExJSE+uxYLURCv7PS1WfHthRVssCJVprlEOV2c0a/0FZILLE1Aw3
	I9f9Z4Er4c+/rYI5MEuNOBPOr4pON6V5hEznmxHY4jU9CIisOs0nopdY3kVbogZ7L0lrQejn36bQz
	tTfCSJZ06V73cac+Je+xJ/+oaaz7vJfZllOimsbKiCFO4R1JaYgWvFkWJ6NIVXqgtowVtHKfCvZiv
	O66FOmLS0u9BwzI2/VYmfCRgSpigKSdif4uAkn01UwyQ82m/APEXxvwEuUzukFJxo3lvDv44Q8PUz
	j50MWADKibCSbkntHj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peVaX-00BOLK-1p;
	Tue, 21 Mar 2023 06:35:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVaU-00BOJz-0r
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPnhvOcPIzsxcdPaGdi9oJi4cZ44pFeBuguAKI/S1NE=;
	b=if00zTOD1hMmx0qcTVMGWOXvT4PImnUr5p/jK/+VJ1AJWk6NGi1dqjsCMMZo5lLDD2Jz9Q
	BmlTcb67yyUnW+Ihx6muy4BQvvfhKGvbDP45crOh4GYoY0NO7v1JC+ysqkk7iKqKQ6nCoW
	I2Y3XJV+brCOjF/KvWyk1jm+RzlBTPo=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-Is2h3pg_Nh2yHSkXi-tROw-1; Tue, 21 Mar 2023 02:35:12 -0400
X-MC-Unique: Is2h3pg_Nh2yHSkXi-tROw-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-17abb9d4b67so8099724fac.5
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPnhvOcPIzsxcdPaGdi9oJi4cZ44pFeBuguAKI/S1NE=;
        b=3ySox4qdo8MhhbrE2hCCanlCGwnvvwQ6FgRV9WfYaKssyFKJWtC8Ck16v2OPYeRgkq
         L3PbVJDeA74z3kwAfTVCbhx/NYz8Wyirf+IE1wr7141+CSlGxAVxO5XoPGl5FbkPWbvt
         XYZETD2yPjyYMZdZ1wwGVv0wzj1iZjnY9pNwB3bWRSx8tYwAz2QP6ICIQsQwCouGLq9W
         PQKm5XguVZVz9qyUnd5h5xtkw6ENe4kgnuwn5IZBkxLNR6WJ1exAt/Z+7ohhyv0G0CJp
         aQ/njyXCRO+90tD1euBz07lNUufiCcPK5YWaZYpYxosFZNN869uuegEuFo0MicQJEJxp
         ycZw==
X-Gm-Message-State: AO0yUKXvpNbu3GI8R2OgrP5QOt4Jqq7/aJLd967ENrIdg8aEh4lnjyyM
	/lFvh5eGbcTJarSVsMr93kBjrZ9TR0Arczj4Gw4gN0EHgrYesroPC84g+1lbwQBbxCEOueNND5D
	UQ0r0xLz9kuBBZAkJ3CGhnR5gLvdF
X-Received: by 2002:a4a:3717:0:b0:525:4cde:53ca with SMTP id r23-20020a4a3717000000b005254cde53camr387162oor.7.1679380511409;
        Mon, 20 Mar 2023 23:35:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set+B3iS14kKznbvOrLdsR2O90xtmoFVXGkXb3A7xEJOE4JmAaaaMLbG1Bq8icqta3r70glUZ9g==
X-Received: by 2002:a4a:3717:0:b0:525:4cde:53ca with SMTP id r23-20020a4a3717000000b005254cde53camr387155oor.7.1679380511137;
        Mon, 20 Mar 2023 23:35:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:10 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/6] riscv/cmpxchg: Deduplicate cmpxchg() macros
Date: Tue, 21 Mar 2023 03:34:28 -0300
Message-Id: <20230321063430.2218795-3-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233514_383939_D62D4606 
X-CRM114-Status: GOOD (  10.50  )
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
