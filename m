Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2606EC021B6
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 00:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Vcn6bO9kVXq+cSz1oQLlSFkt3FA+IlEC4H/jnjuw9Q=; b=SciN+XS2tFKHZk
	lk6RE9E8FvoxLFcaL02dymVsRuKlwVssctOOxwAyNxVjrh6QlopCpCJa4XT+o0vu9/D2uOwIpKVhm
	zReKbh9yCxjNf1gnScAOa0HjP5SoGk1BMZAE4brjhRmExiXBIjdiO9euAUKsk456RHGBgDCUuj3uJ
	FsDJPA6V/hhbOcwAf0i2yuB/RgmOQg2lSLzQKjKATfn23p2spFBFv4r19gDiPr9z0VTAVus/CQaIH
	b7UETnAxgmW3kdAWtwumv6ktsy/vikMBalniRSPHLJ0fryfVb75QAjURANhiGY8wxbbOo8GgFjB52
	Deaj91tdePicJvXpVg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbp-00000003SMV-0dne;
	Fri, 21 Feb 2025 00:09:37 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbj-00000003SFF-05x0
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 00:09:34 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3f4104f0c4cso824126b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1740096570; x=1740701370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5hM23iRroiayTpV3ONpzy5pooTVMbj1TF8BFXhb4r4=;
        b=hUzoy3qUc/fuiwLrJzh08LaYsx5+8EgFghy+gpthzPcgUSbyTdo95Lzwuc7o0ZVO8d
         70BGACTliKGJuQZ9GisAo0TtNjeEyxvvNLePQCNKSXH0X9d8yfyJbJCXG8dCuc87SOmd
         x2opeB2wfwpbt3tSo36LiddjK9FbE4p3C4VAMAxe7rvPWGv9iGX88J87MFu/CRXYpMIx
         KMeFLgH094oa1xjaOHBwxjbf9cYOI7lqoR/ghLnHgtkNDFYjNuPNMHmk0gM/m4Z/oNif
         W93Jsbs0AP2iIFXq6VOU+0ayJPrg24RikvZp9BivinO0eFls2QBA6C4Jhmv+t9j7U6kR
         OdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096570; x=1740701370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5hM23iRroiayTpV3ONpzy5pooTVMbj1TF8BFXhb4r4=;
        b=sO+isOmDxyXDX8bJYC5uGnQ7BZQN8MKowUhkZZZrblCk4wrN8G0u+TXrZeMRY2NrM0
         AWyE5vJolqEV1gdjQSsvV/K2XAl7MTAWk+VDqBEloIPq8ERYHoHg84BAx++2lRVJYMw/
         gIn2a2CCxWkwMob97Ga3XJD3S9mwNqRMMKzzBNPtiwDm+Agoje4ijjXJ6MKEKEwdQfzW
         VKPPURsgWUnycYUI7fDDbNPqHOZF5eHBkaX1H1pP1x0ej55nWITztjSmV29yjYxQLkp+
         BpVbNmfOiUJDJ+015vDhnij0LKMaxOj+1XLaZAxu+Dt5xikxeDcTX7JURqDWRotbYJdB
         bdBQ==
X-Gm-Message-State: AOJu0Ywlmdqp3Iu0l9F4dkG6QaSTklFUMJVsA3bVqei+lrjlJpTjI55P
	WDamt44/T+eV7uxcLBPP/0MKr2bUaxcqKeuuK9+RDRfwIEA/BCY1Wxn9TFaZ5w==
X-Gm-Gg: ASbGncvfO+wYiaUIxsUNdjxa3jb8bXI5CwU3W2awu/5/QSM2PrRZfv3xUYv4peOAqWG
	zAdfWYs5EBJncV04TDxYwD6oFudgueLPP8EBzs8S3IJ5Q+JVYxXbx2Zh3F4xhPovwjoatWWzWPa
	7u7ITd4DeO2p0A/IQdRtpV3e+jqykqNg7YdCSgbcHMvL9ekwxfQTnmaO3YfhmJjvYcRGGNbqov2
	O7DYKKs6EZ3m5GOF7ahHx80xT77U1zyvkrVDaniAK9RYgRq/rf17kixa4GpaGVor2QmRcjLUuX3
	+NOlSI7GQElczPXrW8J2x4p0J/N3ZZFppw==
X-Google-Smtp-Source: AGHT+IF2JM2LKC17wpZxVEWOnlCgEtBUNVIC6uqX4gRfMQHIPsGUXAqsCDrHVc3eY40FDoWxYpcitw==
X-Received: by 2002:a05:6808:3191:b0:3f4:133d:f18 with SMTP id 5614622812f47-3f4247ecff3mr1177279b6e.34.1740096569876;
        Thu, 20 Feb 2025 16:09:29 -0800 (PST)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f40b027906sm1573401b6e.42.2025.02.20.16.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:09:29 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v3 3/4] riscv: uaccess: use 'asm goto' for put_user()
Date: Fri, 21 Feb 2025 00:09:23 +0000
Message-Id: <20250221000924.734006-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_160931_065200_12BC0CA8 
X-CRM114-Status: GOOD (  13.08  )
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

From: Jisheng Zhang <jszhang@kernel.org>

With 'asm goto' we don't need to test the error etc, the exception just
jumps to the error handling directly.

Because there are no output clobbers which could trigger gcc bugs [1]
the use of asm_goto_output() macro is not necessary here. Not using
asm_goto_output() is desirable as the generated output asm will be
cleaner.

Use of the volatile keyword is redundant as per gcc 14.2.0 manual section
6.48.2.7 Goto Labels:
> Also note that an asm goto statement is always implicitly considered
  volatile.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 70 +++++++++++++++-----------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index fb3961ecf38b..1b926b61af66 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -214,61 +214,66 @@ do {								\
 		((x) = (__force __typeof__(x))0, -EFAULT);	\
 })
 
-#define __put_user_asm(insn, x, ptr, err)			\
+#define __put_user_asm(insn, x, ptr, label)			\
 do {								\
 	__typeof__(*(ptr)) __x = x;				\
-	__asm__ __volatile__ (					\
+	asm goto(						\
 		"1:\n"						\
-		"	" insn " %z1, %2\n"			\
-		"2:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err)					\
-		: "rJ" (__x), "m"(*(ptr)));			\
+		"	" insn " %z0, %1\n"			\
+		_ASM_EXTABLE(1b, %l2)				\
+		: : "rJ" (__x), "m"(*(ptr)) : : label);		\
 } while (0)
 
 #ifdef CONFIG_64BIT
-#define __put_user_8(x, ptr, err) \
-	__put_user_asm("sd", x, ptr, err)
+#define __put_user_8(x, ptr, label) \
+	__put_user_asm("sd", x, ptr, label)
 #else /* !CONFIG_64BIT */
-#define __put_user_8(x, ptr, err)				\
+#define __put_user_8(x, ptr, label)				\
 do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
-	__asm__ __volatile__ (					\
+	asm goto(						\
 		"1:\n"						\
-		"	sw %z1, %3\n"				\
+		"	sw %z0, %2\n"				\
 		"2:\n"						\
-		"	sw %z2, %4\n"				\
-		"3:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
-		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err)					\
-		: "rJ" (__x), "rJ" (__x >> 32),			\
+		"	sw %z1, %3\n"				\
+		_ASM_EXTABLE(1b, %l4)				\
+		_ASM_EXTABLE(2b, %l4)				\
+		: : "rJ" (__x), "rJ" (__x >> 32),		\
 			"m" (__ptr[__LSW]),			\
-			"m" (__ptr[__MSW]));			\
+			"m" (__ptr[__MSW]) : : label);		\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-#define __put_user_nocheck(x, __gu_ptr, __pu_err)					\
+#define __put_user_nocheck(x, __gu_ptr, label)			\
 do {								\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
-		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sb", (x), __gu_ptr, label);	\
 		break;						\
 	case 2:							\
-		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sh", (x), __gu_ptr, label);	\
 		break;						\
 	case 4:							\
-		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
+		__put_user_asm("sw", (x), __gu_ptr, label);	\
 		break;						\
 	case 8:							\
-		__put_user_8((x), __gu_ptr, __pu_err);	\
+		__put_user_8((x), __gu_ptr, label);		\
 		break;						\
 	default:						\
 		BUILD_BUG();					\
 	}							\
 } while (0)
 
+#define __put_user_error(x, ptr, err)				\
+do {								\
+	__label__ err_label;					\
+	__put_user_nocheck(x, ptr, err_label);			\
+	break;							\
+err_label:							\
+	(err) = -EFAULT;					\
+} while (0)
+
 /**
  * __put_user: - Write a simple value into user space, with less checking.
  * @x:   Value to copy to user space.
@@ -299,7 +304,7 @@ do {								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
+	__put_user_error(__val, __gu_ptr, __pu_err);		\
 	__disable_user_access();				\
 								\
 	__pu_err;						\
@@ -373,13 +378,7 @@ do {									\
 } while (0)
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
-do {									\
-	long __kr_err = 0;						\
-									\
-	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
-	if (unlikely(__kr_err))						\
-		goto err_label;						\
-} while (0)
+	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {
@@ -398,11 +397,8 @@ static inline void user_access_restore(unsigned long enabled) { }
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_put_user(x, ptr, label)	do {				\
-	long __err = 0;							\
-	__put_user_nocheck(x, (ptr), __err);				\
-	if (__err) goto label;						\
-} while (0)
+#define unsafe_put_user(x, ptr, label)					\
+	__put_user_nocheck(x, (ptr), label)
 
 #define unsafe_get_user(x, ptr, label)	do {				\
 	long __err = 0;							\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
