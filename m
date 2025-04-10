Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A52C369AA
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6t0/V6mMYEILSXK1ctPKLebrJwflqHnsgplgtkAgTYc=; b=1e6D7smsXokoWz
	9n/mlse0/TC3nWWURAyAnhcrvaXX9GsSheHhaSj7qm093s+k31eT6FHpo73Zv+cmJz8zkyrbQlsi7
	+rGE+QMYnKv2vTqwrWLr89p+w+q0hkxfAb6YdrqK+ef/jOBm0ImUE3H7/YCdnND0FLIVD1Tl0e/jZ
	JlspXokQjndBs5/wjA572uX+GU6sfxGhaWVTdKyK8BjnzHcSNuHB+tBDJH0kn0YqckhnZTgmpxgO8
	POjyu7Z3IWh2+OrmNbefThl8pgIytN+g0H/rnBDb+7hf6T3yZ5Dmy3yPcCR/0NQEzveg6dJgoouBx
	78NrfDE5kjsm9QAkl+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUT-00000009an8-2Rhw;
	Thu, 10 Apr 2025 07:38:25 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lyg-00000009TBu-3Xl8
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:05:36 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3fec2899574so317450b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268734; x=1744873534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=O2t7h+rStKrGnjw61ID767AOZIBOnXZwZMna2HTEq2a1+n6khPnKcHfIZfF8uRFQbN
         IwlBEh//TcIK6dh8flR7Ef4dZdxZfOmQXiaJEi9wK9w1NJHa/0zlZHje48vXfMKG83JF
         dqWnSaXqMxFmSMO7Jqeb9gznIb4JM/QqNM5/VA+0b/mHXHIZNFDybVKSlSrG33f5+dgu
         yBonLheCFA60rY+OiNmQQeGiZDOEYrKxaCTGAsB1nVtfg5BO+p9zkib9gT7af5eeDhA+
         xnOs7X9YAcZZV6JuOga3Imn4x/aY/or/lY5WcO1rupp4aIiUo62ha4wKO7+iVa0ONyiu
         fe0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268734; x=1744873534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpC/LMch4vBncOIb4H+uNBUj+A3evJlilB0f5X4S7k8=;
        b=CFfmWqbq1z7gGv68dYwjqCVZWS9k9uJzIeP9vQvdWbOa0XVY6XImSH/0mhcH1BWkT1
         QHpYkmQT2qmccsquj1jNDobHVKbgJ6RXMVCMAH4M24tJHsMoAdc74R9GKRoZju9fyctA
         ousl4K/FGWQtLmRmHGLisqcFZlR7AqOucP7WNXfodXpOHiC2rooP3bubRCiKf7zS+vBG
         nsV+obltkMfWEnAaaydGZpEccKwJpB2xeC1ziZnu9ZsAKnT5pVuZzVoPf4XHdFEzvOlz
         wtalo6WoIKCly9rkxfrC7Q9QMJroaFvHiCn+eaNE2ihTcwiqaxf92JseNi5XzDeF+ceG
         cneA==
X-Gm-Message-State: AOJu0Yx5R8WlBU/NW5h/KHLHkBG8r5pHEr5fd2oKdiSCFILL64yPrlSV
	3Q2j/YIoYM9QWOxqEGZa8M2DLAxipwqUWuy7obcIyUkrCWvS8lR2mq3GQTmNqg==
X-Gm-Gg: ASbGncs9Ac7M/SzOmXLGVmwc0Zh3KL0QUgb3njxiCRFMpx2DzFP8B7fr8QcTcq8DE6P
	fOe6WCy+Q9thNkoYwWY3vogobWDcwQhyGEeuvZOTvX6eEzhcq2Y89iQ1eBuRqi9/wUrA7FJN39Q
	Vh7GE0M8TGfQPOdcCj9Es7TjmrHXF0RY7L8UMm0T4Veg2ic8MwcJ76wP4ukZp6Z0ENnc/K2ntOW
	0EOxbsVSc1Um7Txj31I82Tohy4ab2LhGh5QVKQsPN5YlTz8QLDhuj/YFhHfB+IJa8oljJPFd+0N
	06u+2WHGkyZlcmTwAF+HQ9OfgXFhanhTLKp/EPdaTK4MIm8WpKtWP8T/UFs=
X-Google-Smtp-Source: AGHT+IE+XtNq4lkOGfL5MMqTmIpDIasL7LqvEU62Fpm528DyNXHH0ktFXep74oD9/woVq59pGry6bA==
X-Received: by 2002:a05:6808:14c2:b0:3fa:7328:b9a8 with SMTP id 5614622812f47-4007bcda67dmr907210b6e.18.1744268733620;
        Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
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
Subject: [PATCH v6 4/5] riscv: uaccess: use 'asm goto' for put_user()
Date: Thu, 10 Apr 2025 07:05:25 +0000
Message-Id: <20250410070526.3160847-5-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000534_883309_A56A23C3 
X-CRM114-Status: GOOD (  13.24  )
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
