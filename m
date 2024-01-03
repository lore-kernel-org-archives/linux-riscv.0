Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB0DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rv8aH+0fIR20X2LmMQA2kHf1D1LWBNNdKO0RrIOlSP8=; b=Z7rmd3J5Nnn5Xk
	GKjjInOSkQwhXfdjqdQ6Xkn37+xty2kHpctkF8BfMTaFDsQnf+0EETEo4VR5cHqDDu5xpsVH7R27q
	4/oTLaoYZ/l1OEMrF/aXUjD6wJAUUX/oLBTK1DYhaCTIN0LHeyEVoX+/viAUE0r2HHvg0lgmayeXx
	DDzk209pL5jAG1KynvJha6VMY/p/bhnySDKsvRGl7dVyJOeiXZJg51OGBIiJ1p1vsahZ3CM9iRrk3
	R3YY0BFBr8+dv2cmB7LteqATUZqDY7YAxY2zCKMqs6izGw9uE9VtY4ENK4tOAE+Ypcq7JrR7b+z4U
	Sl+ywZufqxkCCDjLy+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Ad-00BOxT-0F;
	Wed, 03 Jan 2024 16:32:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4Aa-00BOwP-2L
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704299559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfK6+G/fxpQtUcPr0UJaWEhuvxeP6ij0m8scDlFf7oE=;
	b=EHSARiElo1V4B9VfLT/LsAkmKfrlaG5CctB+qaAJgrRQs6UzGH6EtlgepaXwTMqFkapxEk
	/wxGTXCuevPlklEt2GmVjnV0GqvfEC+1axaMYEOXr3qL6MXqTAGhIn7/r37FB040qoYA53
	R64ySriYFuOlAPdX9XvB+yyQAcRQ1kY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-N1etmD_xM-q8r4im84pyVw-1; Wed, 03 Jan 2024 11:32:38 -0500
X-MC-Unique: N1etmD_xM-q8r4im84pyVw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d4b8ad631dso10696975ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704299558; x=1704904358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfK6+G/fxpQtUcPr0UJaWEhuvxeP6ij0m8scDlFf7oE=;
        b=lU0S3UVcsxmcFN+noBKxwy0w7mUblB9hKGmLsNr0Q3ttN3tGgqK6Xy6ihvAxEMPn5t
         Yam5/tFW5HXvwP4BecJqqEyab+ewS360zllecPdMvN8Tfh5VhHtFr8pYZZItnNslP5P6
         OsPG+Hfo9eLXbdLd+xgj/vfsbn8BoCojgp+s9kteMIU3m5pyD0Yw3xeWnF4ag+U9K9tk
         RzyjtgHRCwFXEmk6A0S/Rrd3v56+y7/QjS/Tg9+oXSxdLROqYb6mKVb/pM4T26mPZhAZ
         2beJZd35nF5QMazHQ5evC2sC07Z+wdo9z1sLVCICWK0+YXXC0VQfaeCgm3QDPaZbeUcJ
         DlZA==
X-Gm-Message-State: AOJu0YxEbc3mW7EEIp+XzL8HpVNbZjFrH0W/C/AFDZGRcI9WhSTBJKcv
	l+fLIcwKhCpcLVV1MbLU8JxWz8S9YqXuzcBPqVdTh5jMz4+EHuXKHY8ACTNF5ePwqvBHkrU0qrV
	Upkys613xlHMc/RO7qg6lACFHLbunZqtgJwLX
X-Received: by 2002:a17:902:f7c9:b0:1d4:79b5:b26 with SMTP id h9-20020a170902f7c900b001d479b50b26mr6275119plw.78.1704299557738;
        Wed, 03 Jan 2024 08:32:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTQgC8TXArNxt0zw+/Ybt1FA1l3Pis1O2gQ6NIBPnJnz+swVe6KE7mMi1vmxykVrwzFBJixQ==
X-Received: by 2002:a17:902:f7c9:b0:1d4:79b5:b26 with SMTP id h9-20020a170902f7c900b001d479b50b26mr6275100plw.78.1704299557400;
        Wed, 03 Jan 2024 08:32:37 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902b78c00b001cfca7b8ee7sm23930425pls.99.2024.01.03.08.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:32:36 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
Date: Wed,  3 Jan 2024 13:31:59 -0300
Message-ID: <20240103163203.72768-3-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103163203.72768-2-leobras@redhat.com>
References: <20240103163203.72768-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_083240_836658_F48DCE3F 
X-CRM114-Status: GOOD (  12.16  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 138 ++++++-------------------------
 1 file changed, 23 insertions(+), 115 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc2..48478a8eecee7 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -11,140 +11,48 @@
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
 	__typeof__(ptr) __ptr = (ptr);					\
-	__typeof__(new) __new = (new);					\
-	__typeof__(*(ptr)) __ret;					\
-	switch (size) {							\
+	__typeof__(*(__ptr)) __new = (new);				\
+	__typeof__(*(__ptr)) __ret;					\
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
 	}								\
-	__ret;								\
+	(__typeof__(*(__ptr)))__ret;					\
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
