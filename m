Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC428C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saoOx5kjOYkSuSZCZC2GGU7PuZmKQ1e89W7xPHUSBxI=; b=Nnjfp8pneIZy1R
	j8yjHnohFEyEehd/SC3g/eUkcEVAvS6uRfxa7bZkDvrWcyRgR859rt6DYpVnC6rxfqXFm4blbv+vg
	5Hzv9HaOcVc10roOY1h6efBkVCsGER6LxNFURZH6F5U6XCaDX1utC61yqiX2m+stfkCoOnooKoGS7
	TNrPpOfe196nZhMVRAMLoDcdRp1F3iyWolLDQwARjbXxFlAYV1G7YZ8GDOR6tXZ1ZrBEm/9ApJBWi
	RYwaylNTbFIpJgIBPeYNCYZ2S06bcpgIHw6g2wxyOyioKB6k6yPSJFQXEuXCLkHsKsx39FbKiAHvp
	X1IJklTSHXOoBt+qDuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWgQ-00Ba1p-2m;
	Tue, 21 Mar 2023 07:45:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peVag-00BONk-29
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 06:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679380525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uYmUB/WTTMvmBA0Z285enRAA2vTEDkWBaww5wTiZcXo=;
	b=Fmd7Uk18NfZw9VMf02qFkxlZOEoiIVPUCThAT6FUhgVVLpsXiuXhXJfVk23k6dI7u/GNC4
	sf7yK2cJYR1K3Andj3I99xwRhXMRN2EjmthIIh/qv7K4JoPDYhUxs8mzG+A/tcLYIsnoJa
	FpCuO9KLV+lK97wH9d8zfib1nXH7fpk=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-OccHjH8EPH6LrzySb4tIRw-1; Tue, 21 Mar 2023 02:35:22 -0400
X-MC-Unique: OccHjH8EPH6LrzySb4tIRw-1
Received: by mail-oo1-f70.google.com with SMTP id c83-20020a4a4f56000000b0053b4b212346so954724oob.10
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 23:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679380521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYmUB/WTTMvmBA0Z285enRAA2vTEDkWBaww5wTiZcXo=;
        b=1bdBMgKYdsgWI+aSx8+c87N35HMH68VMatT369sg8EosZZTOHEBompndC99g/mh5eP
         SZcP1VzUQIfnModLRTamm4mPRXt4cUX8bVoZ9gGf53n0PqORkBT1bAYPsCJ8MEWBpFA3
         TRt3qCZldxiygaHRF/3AbOhEH2dL3QQSiZrgeLsLgx/z/b7kR9sC6H+un8eD2W54RsPm
         D1FWYm81sFt2ey84VI6LjJz4TTo0OH8Y5t6YnJi/rmerK1bB6mrSZ0/Ks0eVAj0rGDLz
         +EB9J54nBF6rRlkWE8AeZqEZ9K8HAiOdtD4pzNlQVimxeGmCHhY0AI2nq9kba+mrrd2l
         KSfw==
X-Gm-Message-State: AO0yUKX6/xt4vCMB+q6xnDWxo0YaTsNl72kzPCuRuxeLFQQn67z2QbnF
	BC1uPsN5eMZQPbJrkaweQCvRIkqOyZxQYciyYrjyru9OOV7OVIKDYKrLj2FjgrDHEvuIJ4OG0Kb
	G8J4Yjl6V8jY4ECze7IBx8CzWXpiH
X-Received: by 2002:a05:6830:138c:b0:69e:1412:75b8 with SMTP id d12-20020a056830138c00b0069e141275b8mr781579otq.15.1679380521773;
        Mon, 20 Mar 2023 23:35:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set/O7aq75O5qq7VbvS/dReIriYuF/Eh9gUgT7dPlFJIkJw5WajWjKU4lERNuA7fyWJf4dIfjFw==
X-Received: by 2002:a05:6830:138c:b0:69e:1412:75b8 with SMTP id d12-20020a056830138c00b0069e141275b8mr781575otq.15.1679380521553;
        Mon, 20 Mar 2023 23:35:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id y75-20020a4a454e000000b005293e9a12f5sm4545147ooa.45.2023.03.20.23.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 23:35:21 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/6] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Tue, 21 Mar 2023 03:34:30 -0300
Message-Id: <20230321063430.2218795-5-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321063430.2218795-1-leobras@redhat.com>
References: <20230321063430.2218795-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_233526_780073_FF4C1881 
X-CRM114-Status: GOOD (  10.89  )
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
 arch/riscv/include/asm/cmpxchg.h | 63 ++++++++++----------------------
 1 file changed, 19 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index e49a2edc6f36c..715bf61e72c82 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,6 +11,17 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
+#define ___xchg(sfx, prepend, append)					\
+({									\
+	__asm__ __volatile__ (						\
+		prepend							\
+		"	amoswap" sfx " %0, %2, %1\n"			\
+		append							\
+		: "=r" (__ret), "+A" (*__ptr)				\
+		: "r" (__new)						\
+		: "memory");						\
+})
+
 #define __xchg_relaxed(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -18,18 +29,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", "");					\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", "");					\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -51,20 +54,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", "", RISCV_ACQUIRE_BARRIER);		\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d %0, %2, %1\n"			\
-			RISCV_ACQUIRE_BARRIER				\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", "", RISCV_ACQUIRE_BARRIER);		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -86,20 +79,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.w %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w", RISCV_RELEASE_BARRIER, "");		\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			RISCV_RELEASE_BARRIER				\
-			"	amoswap.d %0, %2, %1\n"			\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d", RISCV_RELEASE_BARRIER, "");		\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -121,18 +104,10 @@
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
 	case 4:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.w.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".w.aqrl", "", "");				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg(".d.aqrl", "", "");				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
