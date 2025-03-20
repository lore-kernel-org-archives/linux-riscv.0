Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1140C36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9d+tiEUFER8rq+XHM0NWO7aMMmA+O4WQVugfBlnoRg=; b=vQGSicJb9FQu6O
	syDCSqpxCKqYX9qlVse2Zh2kjdXFzKJ4/5yb3iuqbvK33r0y2rkT/cIWFxuPwlUzB4zsOLhcWaesa
	6fTA0djzja6QgZ+Wm+24dLSirIg3AxH1qN9IEhmcpcbS7aRoCsvfyFOZwkYE1keVRv3oOrfpe5/aO
	v2Ne/+7eRMlYGvvL8inj2aGwOUMeBIjqjbed8AZG0vAc/6GV/JFbM0W5nxh0DMdwAZOCk5i9WDHu7
	Y4jsvBh4DUq4TkTTQGzAXpA/AOjr79U+3i327kMfpqHXSZA1D27cXYt7VNdsFjccAnuWxexKiw/RD
	LXawHawrYcpDsB305dcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcu-0000000DPKn-1QwB;
	Thu, 20 Mar 2025 22:44:36 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcr-0000000DPIH-1usQ
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:34 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3fa0eb29cebso1475243b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510672; x=1743115472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUM4cL2icpLrYe67mQWolXHTOhfxBr7CeU0SRh8tC7k=;
        b=Vo+7IBC7ym/8ak8RESNXkL3GYQyvH8N8ufCvuXw3KnSEpiyumYxOEXVLPwNYZMGbsL
         /FGwpc8YOxRjsl0NarvCURaxI14y9LRsh0qABlsCr8aLXhKfAuik68on2b67MEIk4uqP
         A7f3lLPcUGns9VEePZsS7x9QHOQUhdH1andR87nJptEMb2zM1eo4hZ5qduF7srni1Fhx
         up3vAGd7A/6qtddiE5HyawQAo+EDGGnyX37y+BcmeoPq6raBMTO2TaZJSJhwRYYFKym+
         ISTSIctBEg08Jq2UKX0gGeEpKx03oAUuk2kueH0ibNlfhUJ88MM7wJ+elWE+LZ8yzxx5
         oSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510672; x=1743115472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aUM4cL2icpLrYe67mQWolXHTOhfxBr7CeU0SRh8tC7k=;
        b=O57FueeOVxgq/798DS9gQxwBtHRQIAywxiyoi9TWnfx7QFT0nOYXBW6gdTYIDKzjtg
         BiJZ2BPl43AK9Yv06aJqSGN3xzoI9bJQP2cKpV09y1Cxrl2CoykpZWK7ZYpj/XFl62sF
         D3Q59xJMHWQDrcRjE8HZeXbDrnBBBx9H6xsecNLDRTOZkVwYQ/9hDpVSQRv1CxJzEC/R
         jFs/u/KuIs5YuJxtdaF4ZnFM4UPGiByxmMb6DO91CQyoOKWv7k84Hq4OubvaZPXEE8OZ
         XaSz7SDZ7nkKGj5aQZNPeKw1+iP3QAn1IchBZMYmIXbhmrqiJYj+Mx32VR6+nWr7GbbQ
         b7Kg==
X-Gm-Message-State: AOJu0YwbDoBulnp5sne5FL6wRUA2PY6tWxSK4DAd6NWY+wLx5OMRx/wX
	3SZOOMUc8b0VxRX2SUDBNTasg69ju7ypETsVGXx/51zq8+j+FqUYGA9lrpsK6w==
X-Gm-Gg: ASbGnctA2Iu+YtKmxYMxTeEKDmR1pCLP+nvLb3Sr7NQPp2GeBI//VlRXoX+0fRJXvS9
	9u6mhjBK/8iKdZ2fgflTZfXgJjCS0k4IT/N4BT9HGVkIeB+MRpof8mGUP7yjrf7X3hwbYxPVLvo
	ATKSSkp1TJ96uLpjHsRjOZTuzwtnHlXWz3wLl5A2FYnU9wvCK0Ok0/I0xShALcp9xh5d5aNg9ji
	uF7mrnGsX2hNW76zCu/gFVTlsR65yNCu/T74EbyVYu45U8pdhDsr0bKTwKt3Mf50tSyCj+vCQF4
	CrWfqc7kaj4kRM94rw4Z97KK/lEGcU54WN8gcT0T0G24FYm+WZOJDy9CD/X35zY=
X-Google-Smtp-Source: AGHT+IHChpwGgXIo7oPDkSwy3Z8aUFaMgcTSyEt/gVcKCBKfeFe7Livn0EfqfYGjYKQnsyWXdaZjLg==
X-Received: by 2002:a05:6808:444b:b0:3fa:10b4:698c with SMTP id 5614622812f47-3febeea9cf6mr1033217b6e.17.1742510672433;
        Thu, 20 Mar 2025 15:44:32 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:31 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv: uaccess: use 'asm_goto_output' for get_user()
Date: Thu, 20 Mar 2025 22:44:23 +0000
Message-Id: <20250320224423.1838493-6-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154433_508064_E762D63E 
X-CRM114-Status: GOOD (  12.42  )
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

Unlike put_user(), get_user() must work around GCC bugs [1] when using
output clobbers in an asm goto statement.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 95 +++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 719c9179a751..8823471b201f 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -96,27 +96,58 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
  * call.
  */
 
-#define __get_user_asm(insn, x, ptr, err)			\
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+#define __get_user_asm(insn, x, ptr, label)			\
+	asm_goto_output(					\
+		"1:\n"						\
+		"	" insn " %0, %1\n"			\
+		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
+		: "=&r" (x)					\
+		: "m" (*(ptr)) : : label)
+#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
+#define __get_user_asm(insn, x, ptr, label)			\
 do {								\
-	__typeof__(x) __x;					\
+	long __gua_err = 0;					\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
 		"	" insn " %1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
-		: "+r" (err), "=&r" (__x)			\
+		: "+r" (__gua_err), "=&r" (x)			\
 		: "m" (*(ptr)));				\
-	(x) = __x;						\
+	if (__gua_err)						\
+		goto label;					\
 } while (0)
+#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 
 #ifdef CONFIG_64BIT
-#define __get_user_8(x, ptr, err) \
-	__get_user_asm("ld", x, ptr, err)
+#define __get_user_8(x, ptr, label) \
+	__get_user_asm("ld", x, ptr, label)
 #else /* !CONFIG_64BIT */
-#define __get_user_8(x, ptr, err)				\
+
+#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
+#define __get_user_8(x, ptr, label)				\
+	u32 __user *__ptr = (u32 __user *)(ptr);		\
+	u32 __lo, __hi;						\
+	asm_goto_output(					\
+		"1:\n"						\
+		"	lw %0, %2\n"				\
+		"2:\n"						\
+		"	lw %1, %3\n"				\
+		_ASM_EXTABLE_UACCESS_ERR(1b, %l4, %0)		\
+		_ASM_EXTABLE_UACCESS_ERR(2b, %l4, %0)		\
+		: "=&r" (__lo), "=r" (__hi)			\
+		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW])	\
+		: : label)                                      \
+	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
+		(((u64)__hi << 32) | __lo)));			\
+
+#else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
+#define __get_user_8(x, ptr, label)				\
 do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u32 __lo, __hi;						\
+	long __gu8_err = 0;					\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
 		"	lw %1, %3\n"				\
@@ -125,35 +156,51 @@ do {								\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
 		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
-		: "+r" (err), "=&r" (__lo), "=r" (__hi)		\
+		: "+r" (__gu8_err), "=&r" (__lo), "=r" (__hi)	\
 		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));	\
-	if (err)						\
+	if (__gu8_err) {					\
 		__hi = 0;					\
-	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
+		goto label;					\
+	}							\
+	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
 		(((u64)__hi << 32) | __lo)));			\
 } while (0)
+#endif /* CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
+
 #endif /* CONFIG_64BIT */
 
-#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
+#define __get_user_nocheck(x, __gu_ptr, label)			\
 do {								\
 	switch (sizeof(*__gu_ptr)) {				\
 	case 1:							\
-		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
+		__get_user_asm("lb", (x), __gu_ptr, label);	\
 		break;						\
 	case 2:							\
-		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
+		__get_user_asm("lh", (x), __gu_ptr, label);	\
 		break;						\
 	case 4:							\
-		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
+		__get_user_asm("lw", (x), __gu_ptr, label);	\
 		break;						\
 	case 8:							\
-		__get_user_8((x), __gu_ptr, __gu_err);	\
+		__get_user_8((x), __gu_ptr, label);		\
 		break;						\
 	default:						\
 		BUILD_BUG();					\
 	}							\
 } while (0)
 
+#define __get_user_error(x, ptr, err)					\
+do {									\
+	__label__ __gu_failed;						\
+									\
+	__get_user_nocheck(x, ptr, __gu_failed);			\
+		err = 0;						\
+		break;							\
+__gu_failed:								\
+		x = 0;							\
+		err = -EFAULT;						\
+} while (0)
+
 /**
  * __get_user: - Get a simple variable from user space, with less checking.
  * @x:   Variable to store result.
@@ -178,13 +225,16 @@ do {								\
 ({								\
 	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
 	long __gu_err = 0;					\
+	__typeof__(x) __gu_val;					\
 								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__get_user_nocheck(x, __gu_ptr, __gu_err);		\
+	__get_user_error(__gu_val, __gu_ptr, __gu_err);		\
 	__disable_user_access();				\
 								\
+	(x) = __gu_val;						\
+								\
 	__gu_err;						\
 })
 
@@ -369,13 +419,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 }
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
-do {									\
-	long __kr_err = 0;						\
-									\
-	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
-	if (unlikely(__kr_err))						\
-		goto err_label;						\
-} while (0)
+	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label)
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label)
@@ -401,12 +445,9 @@ static inline void user_access_restore(unsigned long enabled) { }
 	__put_user_nocheck(x, (ptr), label)
 
 #define unsafe_get_user(x, ptr, label)	do {				\
-	long __err = 0;							\
 	__inttype(*(ptr)) __gu_val;					\
-	__get_user_nocheck(__gu_val, (ptr), __err);			\
+	__get_user_nocheck(__gu_val, (ptr), label);			\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
-	if (__err)							\
-		goto label;						\
 } while (0)
 
 #define unsafe_copy_loop(dst, src, len, type, op, label)		\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
