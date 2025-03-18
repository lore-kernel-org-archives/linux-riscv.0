Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC3AC28B28
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwyHUnH9kqvPqtEdh2PRkVmm3Fmtgh1XB1PHgGBjFU0=; b=rhUcQ/FTW64Otx
	J1zZsebPcG/qIvtlORH/rmeprhHtL4LPyewCZl1/tCa+t9Pp4rM5g49g1MEzbFzbmPEzTY2314fUr
	dBGIxlAWNU8RRCEXRrBAoJd/KJCGF3LFJ4dtdMpSFMRLEDxCvonmHNQy3p7ZBDzJHt4GzggKzXooe
	vN62Z8Uage5o7WHkDqJF0kSp0V28XGguBB/GbowTv8MHcAEfPv7GaG1EP2mINzuDwfo6nRGHJEPdH
	M3ayXCxWl88dn2iR/T58YUjY+851B4MKhzh8OHvNJUj+OXgR1hkDDqYz3QZ9a3mWqONyXSd5o9b+y
	gpR0wJUHPRwbdx7pofag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEa-00000004nka-2gcY;
	Tue, 18 Mar 2025 06:15:28 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEW-00000004niE-2vDz
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:26 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3f417de5e25so1972055b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278523; x=1742883323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB88SWzbKOqS560oNmcGvhVMbrzNnGmMk8r7GYi48TU=;
        b=RnoL0QVXbyBWa98WO6L0ZREIWovexUY26+8dBMqiRbhfILadUOQEWcgUajDpOgz2gw
         sXPYGaL+LHWxgWNTYTlyiuoOzi6nI9jjVfht6wZNf+E5ul4E5WAtQ8DBS8aVO5GNo2Dy
         qNImdorjFXDC3h87TtnM5ewdDEnDSjoxMQUmvb4r/9czmSIQ26HskKZLEQVeT65i5ZS4
         JoxUE/qLO0En0bkKh3SYo2/xFSSopXUVNvZh0e3wtoBLgtVGPskpIdc2O1OIP51VDM9l
         k72x5zD1gi5Kht/qnCZ8u4XtJ1u3h3mV+WzELkbnonitr80NN+yNuBXoR6/C0b44CqDG
         l+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278524; x=1742883324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB88SWzbKOqS560oNmcGvhVMbrzNnGmMk8r7GYi48TU=;
        b=oy0D1TAtD8pH3TwpGSJ1GnYmHVDHmgntjSdX7H/NL8cGy80y8sPmbaC3ANRtAI0aj0
         X6r9RYBoLzc9GGDGQKQ59IvGHecAqrMOVJl8CLQZVShOf6H5MA+W8naDr90kXkbucTbs
         iMr3BqvRrIQSM40LITLPBbyTkK8l7S10jMEcNPI+xoY95p/vW0gfUPuDsBkA+s39zBsW
         /EpGkz4o46r5XwwmFlb7NqzXnYghcAYml6djGwN6ePm+tnBDe1S9MWAPTPt5lWTM1Gn8
         G8/YMjbGQhrOIkx1vVirTFnCAD+Z5xQdqF9tfInQ0Ocu5dpjA4dzk3MdcBMFt6udGjf5
         Erfg==
X-Gm-Message-State: AOJu0YxOYIl4mSg90lNaIx9f2z+pbMwiCgTguuNxsUeILe+PIa3HE8pu
	nJyMwiPeZ/EZ7es8hZTaqcTcmAglbnFV+9QKZfQU2idOOVu71mIFTYYN+OYzww==
X-Gm-Gg: ASbGncuAjsGsPOVKcikb/O0qNC8+c7LVCtikKfSygmxDaigSEHx3bCT70y2yM7Ijeam
	Cd0HTT6aeWY1qTm6I4fihW7L5cz8/h2wEhd/gPoPAhNaBEzHvrCQvgHIKP1IUejB3KRKSKy0gQX
	UFnUsK4Eq2Hk9PFg5vhVYq/Y7cTkMCxjivIg5frbD8iZpVkROWQDHq7dNFk3pfURCp+4h2fOYk4
	a5sNNuL8w3LJXdE55bKObeUvDGqDbLxyt3a5p4YonXuMlSDQ6TrQY0rRbIBYYOyiKZKHf60Hz6O
	eANuxipLEAaxUgQxoar364MdSNe4OHC0YkTbbhVSl6jFCnK0PI9zN38Qg2B1drY=
X-Google-Smtp-Source: AGHT+IG5rNTfQnLxyptciRc/2MpA8tF5u7O/A4GY0S1qU3Z6Z6RSpie2GzJANFt/uJHp/UYORqcpgQ==
X-Received: by 2002:a05:6808:f05:b0:3fb:3be7:ac9c with SMTP id 5614622812f47-3fdf0081260mr8892498b6e.30.1742278523672;
        Mon, 17 Mar 2025 23:15:23 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:22 -0700 (PDT)
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
Subject: [PATCH v4 5/5] riscv: uaccess: use 'asm_goto_output' for get_user()
Date: Tue, 18 Mar 2025 06:15:14 +0000
Message-Id: <20250318061514.1223111-6-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231524_738424_C146464F 
X-CRM114-Status: GOOD (  12.31  )
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
index ab91dd2fa230..ef693aca5236 100644
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
