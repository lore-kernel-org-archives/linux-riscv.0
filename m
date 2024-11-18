Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7DDD60CFE
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Een/mWArbvDR8ZFfTk5Sq0trLh3n+ElGNjiJ1+7o3Bs=; b=dsrqEW2gunR6u1
	sN6wBiLPVxUThirTape70fS4jMq9ut7VTnPW4YmjXjO6RC5lzsLGCcpV74I7ac0ODvAK0SyvRnP5K
	tlrI+WlPYgwHhic3PgvoA0bK8NVsJh3vrBCzrsiXphukFM/4AjFsbZ5GHWSCkgQf/jc812tRYvcLx
	qqpRBOlKQeW7mOP9I1sQpe+pBsg2E33T2FeCUbDXEw7yE2FpqiyXC3XsPseOMyiFJ8TplxcY4/E+R
	2UOupekYp60lVMqnpRqtAduHv8UjRRFkLAr31vOAYR82pBIX5gYwdvbuKLSvbOK4os8xTXPcfyYXM
	GlC2XceSGKbjBW3f+wYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkh-0000000AoLn-020l;
	Mon, 18 Nov 2024 23:01:51 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkO-0000000AoFS-49aD
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 23:01:34 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7b15d330ce1so266195985a.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 15:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1731970892; x=1732575692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwX5scsTVfAnPzy5utpE8/PcuRTXCsQPKfCiUnW9jEk=;
        b=B1T47ot1gDcxxgfO/a4g22hM1q3+TfhWE47uzrsHDrLEvKVdn9pCU2Fruf74/ysYIb
         oYgPBa+Dk77gtTIaSgYmyu48RKAo44HyI6CLgECGEcRJbHJoySxX/YPG7P3aBywb6+5u
         MWu5OqMUktk+yLVb5bcesC2tZAyBcPUc/Es1kzvIBsN4ni99KD3yuPlclD+53OXH7Yy9
         ljzU2jMqW0WjLq+kBZCqh0O10DAAvgydZqd+aQ64pa/4pmo/ZvtysQ8dJBJjyyEokGKm
         82wuX90UYubvMbHlKmQOWbh6kMOG64KWNbK2gPUuxdoG3tl9LsAZDzKKW1qjN7YFPMBL
         8/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970892; x=1732575692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwX5scsTVfAnPzy5utpE8/PcuRTXCsQPKfCiUnW9jEk=;
        b=lHB/4d8HnnTFwyCC8ZA7lGM0XaBFvPvw5u7Ib+cup3ZUtR7/LPZBLgHxih/Yr7Im3Q
         9K8YbbGBorg4KwZIUi63rd+Z/yfFl8YIMVLFlJM2VPMaiaRFyok3dMi1NKVUQLbouWTY
         MKHeGZtgw4Lba9eWdL0bGqlUyDWqAx0bfG/S41jqqEWG2nL2FdLMzL9FJYApEJjdEcWJ
         TJk96QSQzY+JaMoSDd2cSqauVSDvMwjCY5SQ7a0cU9qaWsERuzr0+DPZCS8egZAj306a
         DD8iPwtg2DQnNDP0Of4g6PkQYby/wybPOagbB+P8oYesMiocgRz7kSVzVODg11TuJQ20
         Up3Q==
X-Gm-Message-State: AOJu0YwwL/MPwcubCcvSzTGTT6AdwRmVKmr4qWjAxJkHYq3J0qUFSg2k
	DQI1rX344fOVrXWRNYbihqxUCA0WyQldXlYAvnMEQyIRyrkPQ02R3pbOZX4C9pT3HMxaeLuIJS+
	rYQ==
X-Google-Smtp-Source: AGHT+IFmUQ6Alw6TgMZvuOtrCvlZCP/drMIJBLXEykYvSL6Eocpr3m7d3KptR1usfQOxg1R4KAxCyg==
X-Received: by 2002:a05:620a:4714:b0:7b1:8e09:5119 with SMTP id af79cd13be357-7b3622a57e4mr1938760285a.2.1731970891735;
        Mon, 18 Nov 2024 15:01:31 -0800 (PST)
Received: from aus-ird.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a897eebsm35344185a.94.2024.11.18.15.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 15:01:31 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2 3/4] riscv: uaccess: use 'asm goto' for put_user()
Date: Mon, 18 Nov 2024 23:01:11 +0000
Message-Id: <20241118230112.2872978-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150133_028548_51FEACC8 
X-CRM114-Status: GOOD (  11.35  )
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

'asm goto' generates noticeably better code since we don't need to
test the error etc, the exception just jumps to the error handling
directly.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 70 +++++++++++++++-----------------
 1 file changed, 33 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 84b084e388a7..916df594ef3c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -181,61 +181,66 @@ do {								\
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
-		: "+r" (err)			\
-		: "rJ" (__x), "m"(*(ptr)));					\
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
@@ -266,7 +271,7 @@ do {								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
+	__put_user_error(__val, __gu_ptr, __pu_err);		\
 	__disable_user_access();				\
 								\
 	__pu_err;						\
@@ -340,13 +345,7 @@ do {									\
 } while (0)
 
 #define __put_kernel_nofault(dst, src, type, err_label)			\
-do {									\
-	long __kr_err = 0;						\
-									\
-	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
-	if (unlikely(__kr_err))						\
-		goto err_label;						\
-} while (0)
+	__put_user_nocheck(*((type *)(src)), (type *)(dst), err_label);
 
 static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
 {
@@ -361,11 +360,8 @@ static __must_check __always_inline bool user_access_begin(const void __user *pt
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long enabled) { }
 
-#define unsafe_put_user(x, ptr, label)	do {				\
-	long __kr_err = 0;						\
-	__put_user_nocheck(x, (ptr), __kr_err);				\
-	if (__kr_err) goto label;					\
-} while (0)
+#define unsafe_put_user(x, ptr, label)					\
+	__put_user_nocheck(x, (ptr), label);
 
 #define unsafe_get_user(x, ptr, label)	do {				\
 	long __kr_err = 0;						\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
