Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87294C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5tyWSykIgB/Jn6b0yOqkQbwQdciWRgOQeXpkIUVIqE=; b=LoqujfT7cMLv8O
	RlmwxAgXmTVgfAsVsuTR5N2fQNmfP8JG+uPRB8QaFeBJdhr1gVBfKHjZFRyOLbA7h7uM4pJkrlJCB
	HDcA+yzCwrV/ceKPNU5lehZN6j9P0S60j5qRapfLc2xnHrd7dtxkiskYptEpD5sIVbGBXJE19TCly
	gOVVpZknw8UWAf258H8zKJ85S92QzGcOB3c2aWrGfqkO1hNzk6QImJGFUmvCaWjv/03RKT3IqeLto
	Q3fdzp0X0MhsGC/44fe1BY5ceoi8+OQ4bueiC3yNfTUtgKbz5TQfbdKloqBlI1mjMi+OMw5iXlHhk
	pR19cvlSRXmikyv03nTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfe-002Er3-0U;
	Tue, 04 Apr 2023 16:38:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjfb-002EpG-2c
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 16:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680626287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0rQxrNAcokC6W+51FfMD9h8pzjOdzJF6kUxCcV/Qp0=;
	b=J/Fu+MVa1YE3BH1hGIj9CT1VdVEdMCB9WjMCj8A5VfIKaQNxz/6yyBsassVKaSYA+fr5kg
	ugJMMPX/Tixcw3nMsTAHI0QV6hDGfXCmnfhfuWgWhV/oQ2Lm0E98j6v8Z5KejI7z1wYBGn
	9IDnQHGJGMFEMCBf/ZvGw4W4BbmIMYs=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-_9Lx5hbPOKKCN4QoFsVZBg-1; Tue, 04 Apr 2023 12:38:03 -0400
X-MC-Unique: _9Lx5hbPOKKCN4QoFsVZBg-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-18094db13f5so3885557fac.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 09:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0rQxrNAcokC6W+51FfMD9h8pzjOdzJF6kUxCcV/Qp0=;
        b=0H5hwtEVPraxFBJKBn9x2IF+a/8C8JkO/5xXoo9N4EusFu8gZTOjlDID2FL3HpNRQY
         /vrwbTD3UVBiTZ4KJ5/UO724OupO1m1A+gXPnbOBHpFFQ05UA2+1y9nlQNH86kFy+UXp
         C+QlxmSSPNkqv0/fAPfGls5Ub0iXtLxQm69Yf8YJtWdKF31LJMY/XyF5lCn9C0/922oz
         LM/lQu4yZ7v2UwdYdn334QelusPQ2abA3Bz3Vz110Qa3Cqp7Dicmv2ChGaGIMRaO6mFm
         +tL8ePT6CXTzQl6JwtlGT93TcqdB4g3AN1Inj0P1PlTYQW75G17NXmNBKaoLTXdAkktz
         /0Uw==
X-Gm-Message-State: AAQBX9ftpLnDEpUpyBgYRqTqfbScTaqy+51IVZ1g9qu6WtH2rVR+cyKj
	CjXdHOT90dBcP46CoSiyG9HalAwg4fFLEaYXe300Mh5sDRhk3Oy6jyXXw+zAE6E+H82DzW4Og0C
	n2SurIVKQu9yjdLi+BTF0ahiTC6tF
X-Received: by 2002:a05:6808:6141:b0:389:4a00:51b5 with SMTP id dl1-20020a056808614100b003894a0051b5mr1470951oib.8.1680626282541;
        Tue, 04 Apr 2023 09:38:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350YnaLdfH8tuMD+Yi3A2v4l8UvYgA1HiIUzt7doj1XBln6gnqsmFL5ffbVmpHlQtBFCWz3mhXA==
X-Received: by 2002:a05:6808:6141:b0:389:4a00:51b5 with SMTP id dl1-20020a056808614100b003894a0051b5mr1470938oib.8.1680626282256;
        Tue, 04 Apr 2023 09:38:02 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a802:2599:c6a8:e6db:a08:61b6])
        by smtp.gmail.com with ESMTPSA id bd1-20020a056808220100b0038755008179sm5264623oib.26.2023.04.04.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 09:38:01 -0700 (PDT)
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
Subject: [RFC PATCH v3 5/6] riscv/cmpxchg: Deduplicate xchg() macros
Date: Tue,  4 Apr 2023 13:37:40 -0300
Message-Id: <20230404163741.2762165-6-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404163741.2762165-1-leobras@redhat.com>
References: <20230404163741.2762165-1-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_093807_922798_0BA5165A 
X-CRM114-Status: GOOD (  10.97  )
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
 arch/riscv/include/asm/cmpxchg.h | 72 ++++++--------------------------
 1 file changed, 12 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index a524484946815..480234719b78c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,7 +11,7 @@
 #include <asm/barrier.h>
 #include <asm/fence.h>
 
-#define ___xchg(sfx, prepend, append, r, p, n)				\
+#define ____xchg(sfx, prepend, append, r, p, n)				\
 ({									\
 	__asm__ __volatile__ (						\
 		prepend							\
@@ -22,19 +22,19 @@
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
-		___xchg(".w", "", "",					\
-			__ret, __ptr, __new);				\
+		____xchg(".w" sfx, prepend, append,			\
+			 __ret, __ptr, __new);				\
 		break;							\
 	case 8:								\
-		___xchg(".d", "", "",					\
-			__ret, __ptr, __new);				\
+		____xchg(".d" sfx, prepend, append,			\
+			 __ret, __ptr, __new);				\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -42,6 +42,9 @@
 	__ret;								\
 })
 
+#define __xchg_relaxed(ptr, new, size)					\
+	___xchg(ptr, new, size, "", "", "")
+
 #define arch_xchg_relaxed(ptr, x)					\
 ({									\
 	__typeof__(*(ptr)) _x_ = (x);					\
@@ -50,24 +53,7 @@
 })
 
 #define __xchg_acquire(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w", "", RISCV_ACQUIRE_BARRIER,		\
-			__ret, __ptr, __new);				\
-		break;							\
-	case 8:								\
-		___xchg(".d", "", RISCV_ACQUIRE_BARRIER,		\
-			__ret, __ptr, __new);				\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___xchg(ptr, new, size, "", "", RISCV_ACQUIRE_BARRIER)
 
 #define arch_xchg_acquire(ptr, x)					\
 ({									\
@@ -77,24 +63,7 @@
 })
 
 #define __xchg_release(ptr, new, size)					\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w", RISCV_RELEASE_BARRIER, "",		\
-			__ret, __ptr, __new);				\
-		break;							\
-	case 8:								\
-		___xchg(".d", RISCV_RELEASE_BARRIER, "",		\
-			__ret, __ptr, __new);				\
-		break;							\
-	default:							\
-		BUILD_BUG();						\
-	}								\
-	__ret;								\
-})
+	___xchg(ptr, new, size, "", RISCV_RELEASE_BARRIER, "")
 
 #define arch_xchg_release(ptr, x)					\
 ({									\
@@ -104,24 +73,7 @@
 })
 
 #define __xchg(ptr, new, size)						\
-({									\
-	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
-	case 4:								\
-		___xchg(".w.aqrl", "", "",				\
-			__ret, __ptr, __new);				\
-		break;							\
-	case 8:								\
-		___xchg(".d.aqrl", "", "",				\
-			__ret, __ptr, __new);				\
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
