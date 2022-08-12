Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96708C25B0F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ByLdYLO2OEQg/OWFT3RqnQD/CqpuxpNbModpYvNLrdw=; b=vuk4uRvA79iKWr
	zcdgcp2cCoosy+HzmN2wVJWxUa0yAUivYLH2SbZ/0x7JUhB6danetuKX2V+Uzsl7sVbshNn1w2Ird
	MksHYEHndr6LLPRmCQ5kTcjOI5CxY73Wra+FNRCIsC53b6PCy2t65GQaVMcMOQpQw4UVo/u2eK4oW
	mpS+W/iHbE+3m1W8niJgsAMhCeVpVW8a/yfsTqJnFjKjvxNNVVhzJzfMRIqcfYt8OCiIWkbXXcKoL
	hi8lZUX+utEKpC8bw3iaQI8S2nlvbmBBS0Qth+2f2a4gfg1bvcIN1MiYEvdyLH6nAb/nZFOSIIwy7
	i/FHZeiMNYRk9zCMfdbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMQPS-003BaB-G0; Fri, 12 Aug 2022 08:52:50 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMQPO-003BWO-6O
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 08:52:48 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4M3y7x47sYzGpRd;
	Fri, 12 Aug 2022 16:51:09 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 16:52:36 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 12 Aug 2022 16:52:35 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Tong
 Tiangen" <tongtiangen@huawei.com>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
Subject: [PATCH -next] riscv: extable: add new extable type EX_TYPE_KACCESS_ERR_ZERO support
Date: Fri, 12 Aug 2022 08:52:12 +0000
Message-ID: <20220812085212.1525820-1-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_015246_656278_EF92D486 
X-CRM114-Status: GOOD (  11.21  )
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

Currently, The extable type EX_TYPE_UACCESS_ERR_ZERO is used by
__get/put_kernel_nofault(), but those helpers are not uaccess type, so we
add a new extable type EX_TYPE_KACCESS_ERR_ZERO which can be used by
__get/put_kernel_no_fault().

Also change the name of __get/put_user_nocheck to __get/put_mem_nocheck
to make it conform to its use situation (not only used in uaccess).

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/riscv/include/asm/asm-extable.h |  12 ++
 arch/riscv/include/asm/uaccess.h     | 160 +++++++++++++--------------
 2 files changed, 92 insertions(+), 80 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 14be0673f5b5..73c70098a9c8 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -6,6 +6,7 @@
 #define EX_TYPE_FIXUP			1
 #define EX_TYPE_BPF			2
 #define EX_TYPE_UACCESS_ERR_ZERO	3
+#define EX_TYPE_KACCESS_ERR_ZERO	4
 
 #ifdef __ASSEMBLY__
 
@@ -57,9 +58,20 @@
 			    EX_DATA_REG(ZERO, zero)			\
 			  ")")
 
+#define _ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)		\
+	__DEFINE_ASM_GPR_NUMS						\
+	__ASM_EXTABLE_RAW(#insn, #fixup,				\
+			  __stringify(EX_TYPE_KACCESS_ERR_ZERO),	\
+			  "("						\
+			    EX_DATA_REG(ERR, err) " | "			\
+			    EX_DATA_REG(ZERO, zero)			\
+			  ")")
+
 #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
 	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)
 
+#define _ASM_EXTABLE_KACCESS_ERR(insn, fixup, err)			\
+	_ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ASM_EXTABLE_H */
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 855450bed9f5..5372f3f1e3f6 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -50,62 +50,62 @@
  * call.
  */
 
-#define __get_user_asm(insn, x, ptr, err)			\
-do {								\
-	__typeof__(x) __x;					\
-	__asm__ __volatile__ (					\
-		"1:\n"						\
-		"	" insn " %1, %2\n"			\
-		"2:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
-		: "+r" (err), "=&r" (__x)			\
-		: "m" (*(ptr)));				\
-	(x) = __x;						\
+#define __get_mem_asm(insn, x, ptr, err, type)				\
+do {									\
+	__typeof__(x) __x;						\
+	__asm__ __volatile__ (						\
+		"1:\n"							\
+		"	" insn " %1, %2\n"				\
+		"2:\n"							\
+		_ASM_EXTABLE_##type##ACCESS_ERR_ZERO(1b, 2b, %0, %1)	\
+		: "+r" (err), "=&r" (__x)				\
+		: "m" (*(ptr)));					\
+	(x) = __x;							\
 } while (0)
 
 #ifdef CONFIG_64BIT
-#define __get_user_8(x, ptr, err) \
-	__get_user_asm("ld", x, ptr, err)
+#define __get_mem_8(x, ptr, err, type) \
+	__get_mem_asm("ld", x, ptr, err, type)
 #else /* !CONFIG_64BIT */
-#define __get_user_8(x, ptr, err)				\
-do {								\
-	u32 __user *__ptr = (u32 __user *)(ptr);		\
-	u32 __lo, __hi;						\
-	__asm__ __volatile__ (					\
-		"1:\n"						\
-		"	lw %1, %3\n"				\
-		"2:\n"						\
-		"	lw %2, %4\n"				\
-		"3:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
-		_ASM_EXTABLE_UACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
-		: "+r" (err), "=&r" (__lo), "=r" (__hi)		\
-		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));	\
-	if (err)						\
-		__hi = 0;					\
-	(x) = (__typeof__(x))((__typeof__((x)-(x)))(		\
-		(((u64)__hi << 32) | __lo)));			\
+#define __get_mem_8(x, ptr, err, type)					\
+do {									\
+	u32 __user *__ptr = (u32 __user *)(ptr);			\
+	u32 __lo, __hi;							\
+	__asm__ __volatile__ (						\
+		"1:\n"							\
+		"	lw %1, %3\n"					\
+		"2:\n"							\
+		"	lw %2, %4\n"					\
+		"3:\n"							\
+		_ASM_EXTABLE_##type##ACCESS_ERR_ZERO(1b, 3b, %0, %1)	\
+		_ASM_EXTABLE_##type##ACCESS_ERR_ZERO(2b, 3b, %0, %1)	\
+		: "+r" (err), "=&r" (__lo), "=r" (__hi)			\
+		: "m" (__ptr[__LSW]), "m" (__ptr[__MSW]));		\
+	if (err)							\
+		__hi = 0;						\
+	(x) = (__typeof__(x))((__typeof__((x)-(x)))(			\
+		(((u64)__hi << 32) | __lo)));				\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-#define __get_user_nocheck(x, __gu_ptr, __gu_err)		\
-do {								\
-	switch (sizeof(*__gu_ptr)) {				\
-	case 1:							\
-		__get_user_asm("lb", (x), __gu_ptr, __gu_err);	\
-		break;						\
-	case 2:							\
-		__get_user_asm("lh", (x), __gu_ptr, __gu_err);	\
-		break;						\
-	case 4:							\
-		__get_user_asm("lw", (x), __gu_ptr, __gu_err);	\
-		break;						\
-	case 8:							\
-		__get_user_8((x), __gu_ptr, __gu_err);	\
-		break;						\
-	default:						\
-		BUILD_BUG();					\
-	}							\
+#define __get_mem_nocheck(x, __gu_ptr, __gu_err, type)			\
+do {									\
+	switch (sizeof(*__gu_ptr)) {					\
+	case 1:								\
+		__get_mem_asm("lb", (x), __gu_ptr, __gu_err, type);	\
+		break;							\
+	case 2:								\
+		__get_mem_asm("lh", (x), __gu_ptr, __gu_err, type);	\
+		break;							\
+	case 4:								\
+		__get_mem_asm("lw", (x), __gu_ptr, __gu_err, type);	\
+		break;							\
+	case 8:								\
+		__get_mem_8((x), __gu_ptr, __gu_err, type);		\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
 } while (0)
 
 /**
@@ -136,7 +136,7 @@ do {								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__get_user_nocheck(x, __gu_ptr, __gu_err);		\
+	__get_mem_nocheck(x, __gu_ptr, __gu_err, U);		\
 	__disable_user_access();				\
 								\
 	__gu_err;						\
@@ -163,28 +163,28 @@ do {								\
 ({								\
 	const __typeof__(*(ptr)) __user *__p = (ptr);		\
 	might_fault();						\
-	access_ok(__p, sizeof(*__p)) ?		\
+	access_ok(__p, sizeof(*__p)) ?				\
 		__get_user((x), __p) :				\
 		((x) = 0, -EFAULT);				\
 })
 
-#define __put_user_asm(insn, x, ptr, err)			\
+#define __put_mem_asm(insn, x, ptr, err, type)			\
 do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
 		"	" insn " %z2, %1\n"			\
 		"2:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
+		_ASM_EXTABLE_##type##ACCESS_ERR(1b, 2b, %0)	\
 		: "+r" (err), "=m" (*(ptr))			\
 		: "rJ" (__x));					\
 } while (0)
 
 #ifdef CONFIG_64BIT
-#define __put_user_8(x, ptr, err) \
-	__put_user_asm("sd", x, ptr, err)
+#define __put_mem_8(x, ptr, err, type) \
+	__put_mem_asm("sd", x, ptr, err, type)
 #else /* !CONFIG_64BIT */
-#define __put_user_8(x, ptr, err)				\
+#define __put_mem_8(x, ptr, err, type)				\
 do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
@@ -194,8 +194,8 @@ do {								\
 		"2:\n"						\
 		"	sw %z4, %2\n"				\
 		"3:\n"						\
-		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
-		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
+		_ASM_EXTABLE_##type##ACCESS_ERR(1b, 3b, %0)	\
+		_ASM_EXTABLE_##type##ACCESS_ERR(2b, 3b, %0)	\
 		: "+r" (err),					\
 			"=m" (__ptr[__LSW]),			\
 			"=m" (__ptr[__MSW])			\
@@ -203,24 +203,24 @@ do {								\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-#define __put_user_nocheck(x, __gu_ptr, __pu_err)					\
-do {								\
-	switch (sizeof(*__gu_ptr)) {				\
-	case 1:							\
-		__put_user_asm("sb", (x), __gu_ptr, __pu_err);	\
-		break;						\
-	case 2:							\
-		__put_user_asm("sh", (x), __gu_ptr, __pu_err);	\
-		break;						\
-	case 4:							\
-		__put_user_asm("sw", (x), __gu_ptr, __pu_err);	\
-		break;						\
-	case 8:							\
-		__put_user_8((x), __gu_ptr, __pu_err);	\
-		break;						\
-	default:						\
-		BUILD_BUG();					\
-	}							\
+#define __put_mem_nocheck(x, __gu_ptr, __pu_err, type)			\
+do {									\
+	switch (sizeof(*__gu_ptr)) {					\
+	case 1:								\
+		__put_mem_asm("sb", (x), __gu_ptr, __pu_err, type);	\
+		break;							\
+	case 2:								\
+		__put_mem_asm("sh", (x), __gu_ptr, __pu_err, type);	\
+		break;							\
+	case 4:								\
+		__put_mem_asm("sw", (x), __gu_ptr, __pu_err, type);	\
+		break;							\
+	case 8:								\
+		__put_mem_8((x), __gu_ptr, __pu_err, type);		\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
 } while (0)
 
 /**
@@ -253,7 +253,7 @@ do {								\
 	__chk_user_ptr(__gu_ptr);				\
 								\
 	__enable_user_access();					\
-	__put_user_nocheck(__val, __gu_ptr, __pu_err);		\
+	__put_mem_nocheck(__val, __gu_ptr, __pu_err, U);	\
 	__disable_user_access();				\
 								\
 	__pu_err;						\
@@ -279,7 +279,7 @@ do {								\
 ({								\
 	__typeof__(*(ptr)) __user *__p = (ptr);			\
 	might_fault();						\
-	access_ok(__p, sizeof(*__p)) ?		\
+	access_ok(__p, sizeof(*__p)) ?				\
 		__put_user((x), __p) :				\
 		-EFAULT;					\
 })
@@ -321,7 +321,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 do {									\
 	long __kr_err;							\
 									\
-	__get_user_nocheck(*((type *)(dst)), (type *)(src), __kr_err);	\
+	__get_mem_nocheck(*((type *)(dst)), (type *)(src), __kr_err, K);\
 	if (unlikely(__kr_err))						\
 		goto err_label;						\
 } while (0)
@@ -330,7 +330,7 @@ do {									\
 do {									\
 	long __kr_err;							\
 									\
-	__put_user_nocheck(*((type *)(src)), (type *)(dst), __kr_err);	\
+	__put_mem_nocheck(*((type *)(src)), (type *)(dst), __kr_err, K);\
 	if (unlikely(__kr_err))						\
 		goto err_label;						\
 } while (0)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
