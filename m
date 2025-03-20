Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7ABC28B30
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t0/V6mMYEILSXK1ctPKLebrJwflqHnsgplgtkAgTYc=; b=kpeV0g2H3ESk0g
	CNDKsi0H6NpVDI9WdqG2tnfFPBMwdkE8ntJuFNbs7hKCX26xH2ltjokXfgQRDZpab0bPRJf6iAI5t
	Kw5WNb/9hzs8ITPxFD8SqtajnXOECUB8CrUStLjWQ9ryyoBucLagR571rIrCpUD7LNrBKx73pip1d
	KqCeXPkSCGlMxmkOOQc5sJVTDFTQh3BFvSUk8RQ+br0hOEPsrnmfARa8HqOg7X9ptyy2Rsrm5YsAi
	q3v5TD1SZMYX0ogV7RbQx6hu6ReBkhaVl97R7G5sP1EzJIIf6MUVPx653pbNkZVgaNsLifSep35Lv
	LuRFXBZCyCYK1yXYC5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOct-0000000DPK8-2ebq;
	Thu, 20 Mar 2025 22:44:35 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcq-0000000DPHO-1Lup
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:33 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3fea0363284so764395b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510671; x=1743115471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=XsS5VimoAPB1DOlCJ5jFF6lJu4THEPdKoFhreD/a3h1nrkLKgeRf7ImP2GsFRooY4s
         XOIoaOk4/XtLwGsm2sbz+7pet4s5I90+yOjvDJs1HDnL+n7DtTWbgJPmGEt6rZJyVvyD
         0ICfT9abuwJG4oMK9VzUP7OUErs6rM8ukcSFmiYFSQVJLPvBvz0wK2bFeoPMHhv7ORNz
         fntVL0jzzNn178RzVJ+Oh36cN4u7hOCVncEU2OYsKkuJd3ShbzY9KmtPji5JfiktE57T
         la5d5zf03aV593eyXduAwjsqd2aShrZ2jQsYZbZEYGyCCQzBhVatZQ0MMiNET8Uzz1tN
         rppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510671; x=1743115471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=wOhXrdY1RCze4L3csWWhyE44zL2zvyczmcL9KY9mbYbJ4sGu+cyNGLDXfIk9RJjOBR
         hofS9k3wMlawUfxywYAJuUl7HRWHaLDSKOYYLUWD1LvYNVuymlv7zrZIXb43T8VfABUc
         70WAXBdAeqHoauAIfsedSI3ynMoZ8jHSzwVqVeiDZ60P6FXRq5ey4ReKjwgAiILdUCqG
         5QcTBFFJ3n3zCC4lK8g3shaYZqn5A+CT7FFL8jGRJ9L6PbZ9g/Q90Mn9X6q5SpVVGBFP
         rYyDI6BKdhjSVinIqxLF838jiRkh4Fo7zBROc7XUA7yIZb65Bf+aZtxqdTEpBlRymbyp
         N0zA==
X-Gm-Message-State: AOJu0Yyp34jarvFUGZIontM4kLRRsSrLr8CK5hcJ56hIEPSuKTTkMNiS
	PQZd7SI8xpEDZv2jNDkw5lP4fGU7mJ4ILZOpVpoi9jucwGH80i1dlMmA8TfNyA==
X-Gm-Gg: ASbGncsfVzaF3Ucn/MuJpAbJBKcergwTVm/v65WReJ35YG7B++RAIQO5fqHBsosiUmB
	V73jQvnNxbjYySpOysctpvuDFym3AZQ0TZjkKmyKRKLyfokKf2ZpINTikRGyzweJ5DIWOdC2R5W
	GbD2lBH+oEhPNCBVv/fJKmYiX5QNTOnJtf1L3KLH/v+7FGzDbvv4ChbyVRHK1MxhjA6faMZz/Aq
	nhhMwWcOOHRQDYKBkkEeGRU9Ew9ZtRIjsEhwYQrVShI08z0nI9CWd6b0OJkVUFMPyMbjJWIfsjX
	gmYSjIxnfSZvGPYkIXaw0D9JpXOwrO3smCK8oHKiCMhA0PV4pf69gqhfTtLiMQc=
X-Google-Smtp-Source: AGHT+IE2wGE2Be/0SH2O70UOpsv0bSUloPlhYCg9sxzfrbSR5xy7GPcyoBTaN4dfYwWSgd3IGSKcUA==
X-Received: by 2002:a05:6808:1814:b0:3f4:12a:8ca0 with SMTP id 5614622812f47-3febeda6d98mr810784b6e.4.1742510671178;
        Thu, 20 Mar 2025 15:44:31 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:30 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v5 4/5] riscv: uaccess: use 'asm goto' for put_user()
Date: Thu, 20 Mar 2025 22:44:22 +0000
Message-Id: <20250320224423.1838493-5-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154432_377371_EC243F66 
X-CRM114-Status: GOOD (  12.95  )
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
 arch/riscv/include/asm/uaccess.h | 71 +++++++++++++++-----------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index da36057847f0..719c9179a751 100644
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
@@ -398,12 +397,8 @@ static inline void user_access_restore(unsigned long enabled) { }
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.
  */
-#define unsafe_put_user(x, ptr, label)	do {				\
-	long __err = 0;							\
-	__put_user_nocheck(x, (ptr), __err);				\
-	if (__err)							\
-		goto label;						\
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
