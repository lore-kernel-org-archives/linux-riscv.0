Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E3AD60CF8
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bPeKjRosb6GJr3Q1iDq1xT2cSIxlfs7nyh+3v3m1bw=; b=O/QuU9HuoROAT3
	4yQZgrrvUBbOPE6Xjhzwcqz8YELwztOUNqbKKp21gs8JU+YpBB37fUNK+ulB1jksVpif4aPzq3VcM
	5Ds3QDJg6gc9AQDLbGT4u4mUg2UikYH/K5CHp/XPt5qoGOvs0Y7mQ3h+eWe5rffgtHYfXyIE7VrCD
	mVqVzosps5A8UNpeBltICX9sWHr5gwYkz9IHovddpyFfHro1ez9iRaomh0YmMPSS+7KJGIXKDGyZH
	bkkOcIADEOvs2GuJiQMvW6jkWJ7fIG1wiMnBnBzyIbHaIVHYFqUT0zK9fSgQilqx1Sdo+eXSlAjjo
	GUu2ELr3ew1zcaUYLF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkh-0000000AoMH-3RUz;
	Mon, 18 Nov 2024 23:01:51 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkP-0000000AoFs-3xjb
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 23:01:35 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7b35b1eb7e3so343040285a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 15:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1731970893; x=1732575693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRVaI3mI4q3ET8HD94GPC1Sw1Gna7OqKIYTjZxZiUMo=;
        b=A46atsmV2zrAVbOBtQhw5Y2RS6KBptDXySRmdotVEryRLqDmBpIRDpVcWYlwPdt/2V
         5y8sDCJ2xA8gKEwb0kmzLtArxMs/cwC97N5m74KWk4dlkAqSYzmOqOfYgF165mg2wm66
         cfb3nG8h7D5R9U/yXwzHfxSrQB3C5xsbboTa1zUopNK7n/3/BNUt3ovWiNsrefjjtCrt
         W6FWmjxVmOAObK1c/4/KTNep1FmSIVAMOc9eIsc8jKJOJCS7L9C1qrPVJHqptr6/Bp+A
         vGuFODz/ZBB0j8G66BC+gZri1ZlNwbhZA5GTr1rXq0yoKsa0bfmQQqfPdjgvs+FX0gCz
         zJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970893; x=1732575693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRVaI3mI4q3ET8HD94GPC1Sw1Gna7OqKIYTjZxZiUMo=;
        b=BRnWb7qxN2hTn+KiDRvqhOYiMAF9GcLQ1JYsPHR1p6ASIyKuJ8/+VmHfsxOtuvTmk7
         aEYSyjWWbUYolmdJcFYKXetSZgDudL03sGYCV40URQTKjgtE5qao5DNQNR/tDd2ziQiw
         kAAuR3u+BvBf40zOqZW1zKOmzAmpw+umF6tnGOraUUjVrtEOdz3mwaqYBROBU4+s7ji8
         n4yhIdWZgSNHFAKxiM98MyCBwV8b7joVKFJ4RiksD3U5WC24EaF64aOK1zeD75wed4a1
         eIlOsRM3QAzAtp48Jk2ziSol3/0Gw538dEsz55fcYuvsLOnKr6eUIDTvypsThGRGgr0G
         EDlw==
X-Gm-Message-State: AOJu0Yzo2ZbIscZYMyo4Kg0T0tNoW+XhTkaAAQjcOWKpPK/QNEPO4YHp
	tnmuJ2zZapdQOJ0+ojJFBIcnEw59Mnp71kOlqfhKVrwc4I1FeRhCWH0WdZkzxQ==
X-Google-Smtp-Source: AGHT+IFgOZgADD9g2Yv8LNg2iDmTl9fW41NRsj+KmA2TQmL8rOOG21P3+sAEG4+q3wXTJbLeh7WvWQ==
X-Received: by 2002:a05:620a:8006:b0:7b2:fa17:f7d7 with SMTP id af79cd13be357-7b37aa0dc7amr185728085a.6.1731970892669;
        Mon, 18 Nov 2024 15:01:32 -0800 (PST)
Received: from aus-ird.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a897eebsm35344185a.94.2024.11.18.15.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 15:01:32 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2 4/4] riscv: uaccess: use 'asm goto output' for get_user
Date: Mon, 18 Nov 2024 23:01:12 +0000
Message-Id: <20241118230112.2872978-5-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150133_982496_E0488367 
X-CRM114-Status: GOOD (  12.86  )
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

'asm goto output' generates noticeably better code since we don't need
to test the error etc, the exception just jumps to the error handling
directly.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 90 +++++++++++++++++++++++---------
 1 file changed, 65 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 916df594ef3c..62a2ddf8c542 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -63,27 +63,56 @@
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
+		: : label)
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
@@ -92,35 +121,51 @@ do {								\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
 		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
-		: "+r" (err), "=&r" (__lo), "=r" (__hi)		\
+		: "+r" (__gu8_err), "=&r" (__lo), "=r" (__hi)	\
 		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));	\
-	if (err)						\
+	if (__gu8_err) {					\
 		__hi = 0;					\
+		goto label;					\
+	}							\
 	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
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
@@ -145,13 +190,16 @@ do {								\
 ({								\
 	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);	\
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
 
@@ -336,13 +384,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 }
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
-do {									\
-	long __kr_err = 0;						\
-									\
-	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
-	if (unlikely(__kr_err))						\
-		goto err_label;						\
-} while (0)
+	__get_user_nocheck(*((type *)(dst)), (type *)(src), err_label);
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label);
@@ -364,11 +406,9 @@ static inline void user_access_restore(unsigned long enabled) { }
 	__put_user_nocheck(x, (ptr), label);
 
 #define unsafe_get_user(x, ptr, label)	do {				\
-	long __kr_err = 0;						\
 	__inttype(*(ptr)) __gu_val;					\
-	__get_user_nocheck(__gu_val, (ptr), __kr_err);			\
+	__get_user_nocheck(__gu_val, (ptr), label);			\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
-	if (__kr_err) goto label;					\
 } while (0)
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
