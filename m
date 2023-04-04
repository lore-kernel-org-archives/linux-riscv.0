Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B95C77B62
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltNHxmx1hqCSj6YGZBKJgaQLYGxvqS3nm95EvwZE4Qc=; b=MVvNpxZfBX/jnC
	ploXzvqbvM1D+iPDuA1K7161p1ALxGBlrco6rugPmnf/2mL5Roq1efucAH9VV/46ntanhnDmd/sLI
	PmsFnwnFNGCmF3NQGG70y1HOGWAUQdfEEzCTP9bYGkLnqiZAlp7v/THjp0iVSARthC/1m3AzFDW05
	OJJHJ77T99PUXwmKh7IB13XN66JVePAThXqfc4veddn2kyiURs0g7JxbvZ5NqwXLMZGIkliWSTot3
	IFttmOssNwNw76NrGrtic/8FASqG0OsIan5lYgH/8Xs6RzWHhsLXR6yZH22UZDfWZgtqqJSJUy3FD
	wty4+ZiCSqfl8l5fnl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfb-002EpI-1S;
	Tue, 04 Apr 2023 16:38:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfX-002EnL-0B
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Po1dD0V9oZXC1u6q0PdogM7Oei1BCdcz7qvnbPIGYkM=;
	b=KNUIIrNyHUBHqosd+dGvA43xjaNmUIHRNFt4edLoXiH3BsOH4sO3oird4AeMEmrb6g+BAu
	EYZg6xgbL4sUUE8GR9tPq7I5YUh8sj3Y67ErtjD8rTpDz9tYuwF34OpyTi68rgEs0ef/f6
	Ty9mg1Necx7KQVgU5nygZZkg3X68zkE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-DsPpcKnfN_i0zW1gFbOpwA-1; Tue, 04 Apr 2023 12:38:00 -0400
X-MC-Unique: DsPpcKnfN_i0zW1gFbOpwA-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17fd0d597dcso10068981fac.6
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po1dD0V9oZXC1u6q0PdogM7Oei1BCdcz7qvnbPIGYkM=;
        b=jesfi0v4UGRsORc3/rZGY/Ea75kLpN0apcYH2ZKpDKKR5HWx85aPqnPbN8GzNf+Hsn
         eLx48IymKFXxP5jJw+AF+MVcXxqNrC6WZ2IFYDZ3fDDaJxdYJ0WtUDLoVzpoNBZHzytT
         kp/fvyB+VEEdD1y8qISwZ6kQhYZZILl4UkFF8FbVBs1hiwWDhtYNKMFoLR7sjXc6RoQ+
         ZuBuw+QB0XLUuBj+NjPFmFr64nE7PDFTf6Om7PG/f+ITb1AC4bDjZqgNjmrCsW5k4vgu
         k2DI0g7jcrSds6VYylm1ZT39DQDmRf+c1zJMu0Lcn/Qe4xlrcqofVFogV/ly/iVn0BA3
         SHHA==
X-Gm-Message-State: AAQBX9dFChsEp8MqXPl+z7zOcEP3HM7468XCfcA3HQ3692nOy1W+hjp5
	E97/ORGb5XnCCtHGOhJJI/9BJVHY9CdiV4juqo7V7FIy9sTFk3SuK1z0rFBR0mzAqK3zWTtmXGL
	Tcj9vgYQHIDMkeSdqIPGqysHFslaW
X-Received: by 2002:a05:6808:4b:b0:384:23f0:21b7 with SMTP id v11-20020a056808004b00b0038423f021b7mr1347060oic.14.1680626279664;
        Tue, 04 Apr 2023 09:37:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOrxgdZwug+N0+LNMDxyZG6RB11xLyFdHeoJrlEj4dqfaDrYNSHKssIXTp1eibxVXFi6Velw==
X-Received: by 2002:a05:6808:4b:b0:384:23f0:21b7 with SMTP id v11-20020a056808004b00b0038423f021b7mr1347044oic.14.1680626279345;
        Tue, 04 Apr 2023 09:37:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:37:59 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 4/6] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Tue,  4 Apr 2023 13:37:39 -0300
Message-Id: <20230404163741.2762165-5-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
References: <20230404163741.2762165-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093803_165960_AAF8D02A 
X-CRM114-Status: GOOD (  11.13  )
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

(This did not cause any change in generated asm)

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 arch/riscv/include/asm/cmpxchg.h | 71 ++++++++++++--------------------
 1 file changed, 27 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index f88fae357071c..a524484946815 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,17 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define ___xchg(sfx, prepend, append, r, p, n)				\
+({									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" sfx " %0, %2, %1\n"			\
+		append							\
+		: "=r" (r), "+A" (*(p))					\
+		: "r" (n)						\
+		: "memory");						\
+})
+
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -18,18 +29,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", "",					\
+			__ret, __ptr, __new);				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", "",					\
+			__ret, __ptr, __new);				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -51,20 +56,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", RISCV_ACQUIRE_BARRIER,		\
+			__ret, __ptr, __new);				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", RISCV_ACQUIRE_BARRIER,		\
+			__ret, __ptr, __new);				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -86,20 +83,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", RISCV_RELEASE_BARRIER, "",		\
+			__ret, __ptr, __new);				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", RISCV_RELEASE_BARRIER, "",		\
+			__ret, __ptr, __new);				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -121,18 +110,12 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w.aqrl", "", "",				\
+			__ret, __ptr, __new);				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d.aqrl", "", "",				\
+			__ret, __ptr, __new);				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
