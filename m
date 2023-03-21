Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558C6C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dH59x81M0Xxt/TW605N5K2lz+7ZwyyEQrFctVsSr0o=; b=uZewoII14l4ixX
	1lm3jsXvR9/oWWDnJOq9YEUuIAnm8S/ywJYXG7ULV2CMjjM/TtxKS6YO4U5fwkapeJ/aaR2qCldG9
	pIPsH0xIk2OWYnfzrcZGOxpjkeCgaZJ1gzTW+uX3ew1Z1HCVnqkpJuAid4JiU9XYCq0Ux6VNR3wKO
	l0Rk2zokTwofZmaaFKDforANzpexWo1rP18IuBGKCaMPCE8yPY2EP9t7IEpNzky7PGeXor5lUcfCu
	XSWs5x2Jfx5l7X/LcEwZui3k+VxVvcNSwDk7IYI7mqwbByvTxmq0KR/B4b4wbI0zOdAv2yzOhHd9A
	/ozRxvFKwBs4Nqp1xGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeP-00BZLl-0B;
	Tue, 21 Mar 2023 07:43:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeK-00BZIe-0E
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tlcmKFBm9EfeLOX/A4Ek+TTZZd7OjXZ+kA7z9b9Tay8=;
	b=atgDFtI6qe3p9INYrjxx1njWt33NDqzHv2/Zqsr7qMFCrVub1enB1BtCCiAX41ThgKk+C+
	dCASaI+3wLr6IkDRKoavPs+b8ubRJxd8caOJNzemRKiPXXzh/ngF4Sw4+h2CrpQqarg8Ku
	4G46cRijN7Q9nF0pRc4YvUwEXuLXiok=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-nEuhjdkgMUqUufC8AiO0cA-1; Tue, 21 Mar 2023 03:43:14 -0400
X-MC-Unique: nEuhjdkgMUqUufC8AiO0cA-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-17e11dd9a3dso3787238fac.10
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlcmKFBm9EfeLOX/A4Ek+TTZZd7OjXZ+kA7z9b9Tay8=;
        b=LIOLR2bkhQNx5AsyalwKYdtKWiU8v2hOkAuUz/PvCbL/P2S/cOGvrYcPnUEuxTdN1T
         RDU9wuC4TtB5q9v8OG6KkCDNg1Fiq6pT8F11iF2T1NL+t+zPHr34p3foMNeAIcQqI4IH
         fJ3GsHi2hx6UQiZuIqMSNNPOiDPq7nD/gU5roMNw0fRxydW910KYXwHAC1a3SS4jbKuz
         mNuQ5T2H5UumNd4sS9BpIUv7OVL55xZDqVfql9usPMiN48iYsun0Bx+7KkgDKMP/Q9jE
         ET1puzB/XmUZEqDq0MBOKbLEBc+iMf6rQrudcQgbc1x+RDj+TpdWObkpLksMiAOFg17A
         gdIA==
X-Gm-Message-State: AO0yUKVb7NfJPz2YX/87S3fzo03QZ8QoVzF+/jWQy6gK5SoPRhUpvUKn
	+t+vcxBn9qGjLqF9ZLVCFt6asoxQB6szsuh/+EmAWe/TMWuhc1Z+aTOaVSJcyv6E3CRMuy/pe15
	JwKkbGFcLBGogEeE4L5OL32JiCVYS
X-Received: by 2002:a05:6870:17a1:b0:17e:5166:e5ad with SMTP id r33-20020a05687017a100b0017e5166e5admr561226oae.44.1679384593434;
        Tue, 21 Mar 2023 00:43:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/pyAqYnO67AML+s1dNtvHd917Gw9QhFgk20X96rex8UneHTfhT63wtlM0E2stD1HimfqKP8w==
X-Received: by 2002:a05:6870:17a1:b0:17e:5166:e5ad with SMTP id r33-20020a05687017a100b0017e5166e5admr561219oae.44.1679384593178;
        Tue, 21 Mar 2023 00:43:13 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:12 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 5/6] riscv/cmpxchg: Deduplicate xchg() macros
Date: Tue, 21 Mar 2023 04:42:48 -0300
Message-Id: <20230321074249.2221674-6-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321074249.2221674-1-leobras@redhat.com>
References: <20230321074249.2221674-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004316_200670_FBBB2783 
X-CRM114-Status: GOOD (  10.35  )
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
