Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD335C7618B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH/GiSnvHDPVnYpZj4KtdnlB39fWDnJTaeIzkztLDDE=; b=1IjyDiS4lah1ZT
	OJixEagPnAXoCS1MJSg3M53X0r5/3mSkz6r8EMScIbhaLeXAT/jn0DqBHUrYNxfc0Gb+ACPmfRHEd
	2BvqKxgWqO2jTsSXdR27a4nZFLb3NtAF2gtHzl6EJwuGSlah3qiOdVAu1gkv2T3IQuhHTm8c+ZICx
	k3hUohaaav/ONtnHSWMVFroYHWg8XExrjJCPmGr974PiVFBr/QWtn3RaQx7OKeZn+5kl8WsEFvKIs
	ddLJDI/1fHomHphF9beB82mOVK8O5r2geUX4owAVv1gDTkKe4gfBHSDv6f2bONGMXqtCAL1m7To4a
	CsCTEDTKHZOpV25d+DEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRXC-004OWw-13;
	Sat, 18 Mar 2023 08:03:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRX8-004OUu-2W
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbEE9rLsMkeSG6CkDtERD6c7FbVv+HEbsIDG5ynJNIc=;
	b=T6DhJHYtHoCETn9yw0i1CJD89H/soHyvBP6HwCHe/NcFGbFOGDth8OTZYUVh1fOk/Xu01b
	/YC1a1BeAxcVR+myfhz4CIROEqnMCyzD/MMkBucnHHMGxb7a2JYfD5vZuRH3b7Fz8mpvjs
	DO6tvU5Sxy3cMUoEgLecJMEVy9/EO58=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-bjmlrMxGPkWgvTw5UIa7Kg-1; Sat, 18 Mar 2023 04:01:45 -0400
X-MC-Unique: bjmlrMxGPkWgvTw5UIa7Kg-1
Received: by mail-ot1-f70.google.com with SMTP id e8-20020a9d63c8000000b0069f0e0bd36cso86792otl.20
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbEE9rLsMkeSG6CkDtERD6c7FbVv+HEbsIDG5ynJNIc=;
        b=4X6ro6TxTtFslodR5kTmfQqQLJvms9gxrc4OYbLtsqiZ1VhEKAlIUuBciUCe2JRf8X
         k/7h42ZXtZtNJDdx0Au3oB/E2x9f/ofk51URSxhhR1eA2X5GEEi9xTfnesxlYjdaYLNK
         5/NSnry6cwlbmNt4Ccv2oz4K2X5l/8ntV1+5hs5dgWMYonVFY87SM1WM9zMKY0ikqmqf
         rOZ11u/Qwkd2vNXGe3WO40P0w1EdEOsrDap2XbvLAA7c6hZUaGkU1Y+nOmzlOieB0fOR
         A41OZ0vZDwtun8pnx2HmiQhM5bs8TciquS1on4XsVgJQGz539Qo8wOiphvGngvLNXHE2
         CJyg==
X-Gm-Message-State: AO0yUKVbHAMnWXlSfg+gsR/RQ95FBOZSOyOTM5JtPfHl3cqntNv1Sdt8
	5LWDjak28owy3edNVQlUWLwJcMBqJO09XqIHCxLAwzOFfArTagznN7+FudhwMvIfVvbETEyb9To
	ttkSaVFrK/yoOEjRcb0rHHHmn/rlx
X-Received: by 2002:a9d:6d07:0:b0:699:a4f5:c951 with SMTP id o7-20020a9d6d07000000b00699a4f5c951mr545248otp.2.1679126504310;
        Sat, 18 Mar 2023 01:01:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set98ZKY0u5f8b+haxIAAI83p8gfQCrvcJ86i5uq8nFKjoznRe70RyMpyZxxyaIYMjXHy5gPGaQ==
X-Received: by 2002:a9d:6d07:0:b0:699:a4f5:c951 with SMTP id o7-20020a9d6d07000000b00699a4f5c951mr545241otp.2.1679126504089;
        Sat, 18 Mar 2023 01:01:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:43 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/6] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Sat, 18 Mar 2023 05:00:58 -0300
Message-Id: <20230318080059.1109286-5-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010322_902679_9E7E03C2 
X-CRM114-Status: GOOD (  10.72  )
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
index e49a2edc6f36c..13dc608229ef0 100644
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
+		___xchg("w.aqrl", "", "");				\
 		break;							\
 	case 8:								\
-		__asm__ __volatile__ (					\
-			"	amoswap.d.aqrl %0, %2, %1\n"		\
-			: "=r" (__ret), "+A" (*__ptr)			\
-			: "r" (__new)					\
-			: "memory");					\
+		___xchg("d.aqrl", "", "");				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
