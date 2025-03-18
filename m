Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB3C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNMNE30+kv0bGqxEwrg7CYKb2qTS4Wym7WL/Dy8ovuA=; b=mMlFwvGgDKIRQH
	x+v1JeKWQ9a5F/i5g9FSU5b3vv3OuwdzJ4nzi+NRtYeAPtN5J5dabRKCudZNKDL0hOEX518UEoNEf
	q89eHsPbA9/dlvZBdP1s8RQV8It6Ymw/koN9Ip3NDS/enI1PjOIBXTzW0kHuoIub184eQNaP7OAp6
	je4STNffRric9jNRVph8yD6BN0+KYdDGLIBvQIGrwu2btCZ7wRXS2+/1QKgANoOKiwhbyvdGVv3eW
	Ynjn/tvl9Q6TXmsfAlCVV8ow4MqPyP/mk9+iHC2BAok7CaOYeRqwyjDKl9Xpn+6RZZIad+EJlaVlH
	v7GP+94AUKthQSht82IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEY-00000004njB-04v2;
	Tue, 18 Mar 2025 06:15:26 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEV-00000004nhD-0UPe
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:24 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f68460865aso2841101b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278522; x=1742883322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HccPZpbZyX4ghGGLQ1GggeTzIynZ7PXEL+v/MCdb8aI=;
        b=QQIYL34SCgQ8Es1CKDANsE1+CCc7eB7k9+bw+bHQSZMpFoFlDbBR0BAQ0sWSulnQMU
         LRxhDeQSlHKEX75ktvirENnymo6ijTrKmQQBFAbPlS9SlnS3NI6BYP+YoS9HQ8Nwak/u
         DW4sNr6JLa3iHDwKLr9dwLnrMmzt1d2A/PyKYHU7FsBrE0bRj6aUevFETHg0t+9xqX9l
         qLmABL4f2pb3B3sdoOAgJYDsNnEAY3U+hVJ2b/BA1T39Dbh1i/DvX6njIuQkd+SI4KxI
         73BM7OanPof66gc3xDqwLQxjFhIHbyC0nuUUFKwC7WKGyLLvHBGsn9IBsvFaLWo8T+kd
         l1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278522; x=1742883322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HccPZpbZyX4ghGGLQ1GggeTzIynZ7PXEL+v/MCdb8aI=;
        b=Bq/dPGjO0kDa1RnBCzCLahSWRcroAhkDqglM87GD6my4RgPLI+BEfJMjuS9uTlplKW
         HfHZbRbmUraftO7MpvkvDXSDS5UZDGFARaMsuSvxWtr1Rmw/4U4VpY0pfANd+57faFWc
         gATAhI2F5vdtJjnBgchXxfsSxYpXRr3AYJPY2D4YthCjIVjq2Gx1SUYIw4a/yxHePA9E
         j4wrEepRZtM0b1+XXDjbTkKvELCse4u0LZgbhm3nTNs/M0JxRtwkWDekrfoRmE3NrjbS
         QjYpYkP3ufrrHDDbee2PSvMMPWB6Jc0ZKU9bLtuThdYsoWXhAi5Jkwuum1x8cNBoGA5Z
         kfkg==
X-Gm-Message-State: AOJu0YxWS8u08VI1XmMXW9JWLQADxA+3q88mc9x7JYRljZbBtk4uU7Rv
	KZu8v7eEDbtQGAcNaYmnQevB0aaacEFj7azWS0LIBo+w1Q9r2W3D4ynCkKyIRA==
X-Gm-Gg: ASbGncuzBCj4bpw2WpvmlEozFkECtHYj1GxwGLJnrf+X2c9a+VTK/8V5aPy0hzvFxSC
	LKux2qndYJ/KFeRSmKtfOgsJG3hF7Th9kDvtJqV6T1TL2Y8PkCXB+wfiKcYT3U4xMybF85Kzv+W
	+3lQiIPtFTENhVIB9PxMKaAGc8L63HmZci/FqgInlp7AJi85ql0rS8+66u88YM0sHmhS6l/6s0n
	TroCbtuRMvT6TD0QUpCfqk/Im4SCOeo1pjslU7kZCPSEVGMpu/e0y4d1iveMaED4+dYmOxPap0X
	VmoXgcFCyX3d4gzK/Fx0EJK5xnIgyrXQMnip2IbK6QdFxHUoey/BfHWEJ0VnDL8=
X-Google-Smtp-Source: AGHT+IHEfvBRTZGysFXmW3RRQXGtzyNoB5Q4apt6oGZu+ZdRy6GfL5mJC1oNgLlW5pjKpJDDbIHUXw==
X-Received: by 2002:a05:6808:201a:b0:3f6:7192:6aaf with SMTP id 5614622812f47-3fdeed0d9b8mr9357410b6e.22.1742278522205;
        Mon, 17 Mar 2025 23:15:22 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:21 -0700 (PDT)
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
Subject: [PATCH v4 4/5] riscv: uaccess: use 'asm goto' for put_user()
Date: Tue, 18 Mar 2025 06:15:13 +0000
Message-Id: <20250318061514.1223111-5-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231523_165407_015DFEE4 
X-CRM114-Status: GOOD (  12.84  )
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
index 180d6e21d5b5..ab91dd2fa230 100644
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
