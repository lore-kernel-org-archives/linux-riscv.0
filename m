Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AFBC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcQQkxWTVDzJRe8/WASllQFi2gmmbzQCYo+XDTVotJw=; b=1QsL13utl1pI+i
	Z1EfOEyWhKZkk5RisyB8LHaI/XjFZzJUNG2JlpsQ+P+CNb9O5sCeXRQ6XqIMsx6JbhFCQfSOBGNnv
	lFv/2jJXWhitm94B/fCUlZhGwWRZVxzeCRCgoB/koFPjQ7FsQu1R1rf5aYRBNtYPsUQE3/xSzaiAr
	irp9v1gOuFJ+eE4XXKyhITf+W9syV/r+4rMmHiE/gnJZlEHihXFiyc62OLsc8juVN3QE9+8pAa+sa
	DFvGYDLySqJN8buql+B6IqsrrxPPhEQdd2Yb01FCF8n7FwKdWRXaxkSm6LYHOembzYQQjHaQqjb/V
	AM/XXx4VKMkRvawkbefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUU-00000009ao4-206M;
	Thu, 10 Apr 2025 07:38:26 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lyh-00000009TCH-2f5l
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:05:36 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3f8df49e75fso143767b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268735; x=1744873535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UI3h0NlmhfF/KG7MnQTXCVk39GvhZn/ER1oVglPpSbw=;
        b=d5qVr7Z4VhuFUulfiMjYED581kqTtvw8SNQFPdAefxLrjuPqJHGZ4vvlBxNmSzLKbh
         5zAOd8xUHhFMjba6ObVwwSYD9RRCpFy1zrWdW0v4kMzgQPGTAQCWsLZCLpbwd24qV2KJ
         2FprIOZVm++aOyrvw90VKSGVXtwZSB+CJ/nNOeg71l3y8yND49gAOyvaMr34c18fpB7f
         EVfRsalw5DP/Eiw9eod9cdZkpkQxvSDsAomNKLXUJNoE0ZNCrh0mJ3xi4uTb94rSWWs1
         NKK9LSI9RaWIyVmjL9sLTC3DTVBPYYTgMmttcatJZz0nXhsHBSlnzKlrt4fSuYgkqjGu
         unyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268735; x=1744873535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UI3h0NlmhfF/KG7MnQTXCVk39GvhZn/ER1oVglPpSbw=;
        b=Qyu3ClmhhSyy11uHBi14usEIjfypjSxL6D9/SxD2R8KGXmNxEEBLpbxDHhzTZGtpbB
         WZv6OpjD09cLthPnaI/y5D06J8aTUUgNCy8iAXOtaMAan3mZ7aazOohxp4Ka26vo40LB
         Lygl+FKTcG4wSmsaft5Jp8roFWp37P18UJgfMT/oOK+N0u3hJlaK4PSoQJxNE1JFnyL7
         UgNBcpH8cLlfmb4HC7acnZO1d6uwQKEJ758Ay9GGW2aKYH8YGPGf2QtHb4kj9eRURJAs
         Hx6wM3R1/0uNnQ09iZv67erZBC55CL88x3SEdbzoV92w1zj4IWX6QC3Nf6MUxosIdWhr
         gJWQ==
X-Gm-Message-State: AOJu0YxZUVcTi0DAK6dTKGoDrg4sBZrCtpx9WDZfPNlBZbYoCYZE3oYf
	McuWqgWO0mr0ZCWoSTcvNUauGbBQeuH2dSjWYQ90NvpzB7IJBO0LF+ZeqxVDMQ==
X-Gm-Gg: ASbGncvDKTWgc1q9QWOpCXq6baNugG35YyLHZDFSCTi0WW+WiyEBdLOK/C6PymRYsfb
	6hy91eFnLPXo7x6JNjPbSQpFM+dMYTbXFOm9TRHeR71UsarA1+vEXlTDvx4kOYsov22yOfmDldn
	iPD/WquDMtBkFPhBbhybO4NkLBrZ/fY238/Xx8oMykYXpb9q0inSJGsvo831VvIeR7IvHAd/1KO
	2hvggx2C0U5mglsr0Zd3ftB2/vTd/xSmGCkkG7lydct8cDaZB4YIxf+53ZQwMM71MWMDK+7yYHW
	XBC/TqO7XHyUDjk0j5TAo/Wp9pFMkkCKl62v/ZCMopjADG9X0arEz7itguw=
X-Google-Smtp-Source: AGHT+IGW0SPg26YQmBEJhc3/+38pKcYOWmw46oXnpTleszoxRuoZLFHb0CFbBs7mvDY52WpYj1W+5Q==
X-Received: by 2002:a05:6808:2445:b0:3f8:debb:7683 with SMTP id 5614622812f47-4007bcde3ffmr1239917b6e.23.1744268734951;
        Thu, 10 Apr 2025 00:05:34 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:34 -0700 (PDT)
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
Subject: [PATCH v6 5/5] riscv: uaccess: use 'asm_goto_output' for get_user()
Date: Thu, 10 Apr 2025 07:05:26 +0000
Message-Id: <20250410070526.3160847-6-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000535_675043_7F83227E 
X-CRM114-Status: GOOD (  12.71  )
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
index 719c9179a751..87d01168f80a 100644
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
+		: : label);                                     \
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
