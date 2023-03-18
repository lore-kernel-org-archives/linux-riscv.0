Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C914C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlxlbBeQ1jpdNK3Y/34L+x8rYZCsC47qAH4sAn+eWZY=; b=MiiweyQOzV1dXH
	9vMCrFYxMUNCxJoLx5A4fXL2tbj9YpyCCVOTSPggJYtNzpbehNPlfX3AnZuqow90b/MGhbmaX7Zhs
	4+mj2XOIsixVlewiHSU/uPk+q9bjFOZGZygATv6+M12Bsq1qbQHLQYdJzGA7wW+ItzwnjdvodTNZa
	+ZCXc+Yrwhx4re9YpKX0+Fu0B0XkVTxYvhgk7GaF/8ELZqAco9ZOC7E6koyYOnDiWqsLzAQEIgn4R
	Lg3SF+MYvqf45F1df2F/2amaouCTepeAHTPZxxxKmUqpEprbVGSAJD/U+P9r0O5fEYxZciYjjIUFa
	lzFbquQLvvVqGHqRAWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRXp-004Ohb-1N;
	Sat, 18 Mar 2023 08:04:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRXm-004Oge-0Y
	for linux-riscv@lists.infradead.org;
	Sat, 18 Mar 2023 08:04:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679126641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7gfMcI5aMDF6IpHIz8HZtjeTtHnq7AJwdDOIUhbWBLk=;
	b=A1Lwh14f9ZLSVvluVNVi7DCLg0evPubmeEqGA4CI9FYVQWB0Rkc8sKzywZZ/D+iiCDHVpW
	VA3Lf5SSJM8T0pG922Z9KbPGBiELzKr4MSbOoi/y74xl5JRjN/YkM9G0kYp3kaPqJK3zTg
	gcpm8r5eK6Gau1ZBNDSmCDIBDgj5eig=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-eLvwgSpOOkGG74fxXko0cQ-1; Sat, 18 Mar 2023 04:01:48 -0400
X-MC-Unique: eLvwgSpOOkGG74fxXko0cQ-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-176347f3b28so4207471fac.23
        for <linux-riscv@lists.infradead.org>; Sat, 18 Mar 2023 01:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gfMcI5aMDF6IpHIz8HZtjeTtHnq7AJwdDOIUhbWBLk=;
        b=eNcCU1rPLsi9ZoR24xzegjUcAFYGpPsbpjvkmBn2bCAp4sGUiKhZo5BO+pIzsG4sJs
         /jHm4M6tCt+N8eB1tIaIUlhEUZFpdN1a1N9pEyTP8AlKFU1L5hcmFjEd0gbQi2aK2GRg
         sw5nUFSgfvB7ruIUUtaZGWbp9mycYXh6x6qltSGcf26ap8HSd+qGBUta23Hfpx7zwWFS
         UNS9dbRWvBJq/yb9EnyDHk0Mu9diZso86aIuERWhg0x5a0VMAxYIncit481G410ERewx
         OFvkr0KTM5mafwXEbXvI3SuCBHXbDevfRjKOkRYbzFPacEseThozXzHb+1f13FbYg9sQ
         87Zw==
X-Gm-Message-State: AO0yUKUxyJi7qbdx0RKwO3EVtFETg8KuR3Kuq6rKP23JoZPE9PyD+snQ
	yr/+EBVSbcRTKZILkbkzVBWJPk9wEvmhTT3q7j5Z/RGDKXQzW2eqYHC+ssIw5m4wTSWhCE7h5Df
	ZcfwZEVAvahcBaeltEalbjElPBdzl
X-Received: by 2002:a4a:976c:0:b0:525:42c7:9a5f with SMTP id v41-20020a4a976c000000b0052542c79a5fmr622256ooi.6.1679126507977;
        Sat, 18 Mar 2023 01:01:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set/b+sFSDMT3cPiuGUXdE8iECw0N3iv23H541xyVl8EvWgowAjDCIuSTW7z8aNpA5JDXO8rfgw==
X-Received: by 2002:a4a:976c:0:b0:525:42c7:9a5f with SMTP id v41-20020a4a976c000000b0052542c79a5fmr622245ooi.6.1679126507684;
        Sat, 18 Mar 2023 01:01:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a801:b074:274d:d04e:badc:c89f])
        by smtp.gmail.com with ESMTPSA id c3-20020a9d4803000000b0069dc250cb24sm1824462otf.3.2023.03.18.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:01:47 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/6] riscv/cmpxchg: Deduplicate xchg() macros
Date: Sat, 18 Mar 2023 05:00:59 -0300
Message-Id: <20230318080059.1109286-6-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_010402_284193_3C9B42DB 
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
index 13dc608229ef0..23da4d8e6f0c8 100644
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
-		___xchg("w.aqrl", "", "");				\
-		break;							\
-	case 8:								\
-		___xchg("d.aqrl", "", "");				\
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
