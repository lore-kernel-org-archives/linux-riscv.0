Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F821D6E2CA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d83pmYfph/3BA5C9vUsu8OqAEMaTVsHS1ggQO01HE0Q=; b=A7/yjAagUUUuoQ
	ldKdZQSXZpUcNRZcud/FSrsQXBXJBJSUMZX8Wbfpx5bkWRLaySedB1L7ZwSvDUUh1XWDx3Xf4XYf7
	dold+Iyr17/iY+suX+tG/8zKFHSnCbwvI+itUhQTEes0FeZwl9w9ahFglwe4n6RcM/4fAS7p5JG2U
	yyHkdpx9t1C19Wcd3D0nQbqdWaNKl3D4kMsuJ4ZVHSUqfOfds/Lv3mvS9UCvggpyle5RIsxLs/myp
	hvbqiT5xIWBCZk3RL+EfG1MhTje1IJvFV+0/BGp+A///mf2HnVNdbJY2lUVcO3uT20+jykOwaBcUi
	G/NW6QnFK7tG85yg57BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRj-000000094FS-2CRT;
	Thu, 18 Dec 2025 19:13:55 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJRg-000000094Dx-0lve
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 19:13:54 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vWJRT-000RlL-1f;
	Thu, 18 Dec 2025 20:13:39 +0100
Received: from localhost.localdomain (10.250.9.200) by MBX19-SUB-05.um.gwdg.de
 (10.108.142.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 18 Dec
 2025 20:13:38 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <linux-riscv@lists.infradead.org>
CC: <palmer@dabbelt.com>, <pjw@kernel.org>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, <daniel.weber@cispa.de>,
	<michael.schwarz@cispa.de>, <marton.bognar@kuleuven.be>,
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH 1/2] riscv: Use pointer masking to limit uaccess speculation
Date: Thu, 18 Dec 2025 20:13:31 +0100
Message-ID: <20251218191332.35849-2-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251218191332.35849-1-lukas.gerlach@cispa.de>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_111352_246942_85ABC79C 
X-CRM114-Status: GOOD (  13.52  )
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

Similarly to x86 and arm64, mitigate speculation past an access_ok()
check by masking the pointer before use.

On RISC-V, user addresses have the MSB clear while kernel addresses
have the MSB set. The uaccess_mask_ptr() function clears the MSB,
ensuring any kernel pointer becomes invalid and will fault, while
valid user pointers remain unchanged. This prevents speculative
access to kernel memory via user copy functions.

The masking is applied to __get_user, __put_user, raw_copy_from_user,
raw_copy_to_user, clear_user, and the unsafe_* variants.

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 36bba6720c26..ceee1d62ff9b 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 #define __typefits(x, type, not) \
 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
 
+/*
+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
+ *
+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
+ * User addresses have the MSB clear; kernel addresses have the MSB set.
+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
+ * fault, while valid user pointers remain unchanged.
+ */
+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
+{
+	unsigned long val = (unsigned long)ptr;
+
+	val = (val << 1) >> 1;
+	return (void __user *)val;
+}
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -235,7 +252,8 @@ __gu_failed:								\
  */
 #define __get_user(x, ptr)					\
 ({								\
-	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	const __typeof__(*(ptr)) __user *__gu_ptr =		\
+		uaccess_mask_ptr(untagged_addr(ptr));		\
 	long __gu_err = 0;					\
 	__typeof__(x) __gu_val;					\
 								\
@@ -366,7 +384,8 @@ err_label:							\
  */
 #define __put_user(x, ptr)					\
 ({								\
-	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	__typeof__(*(ptr)) __user *__gu_ptr =			\
+		uaccess_mask_ptr(untagged_addr(ptr));		\
 	__typeof__(*__gu_ptr) __val = (x);			\
 	long __pu_err = 0;					\
 								\
@@ -413,13 +432,15 @@ unsigned long __must_check __asm_copy_from_user(void *to,
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
-	return __asm_copy_from_user(to, untagged_addr(from), n);
+	return __asm_copy_from_user(to,
+		uaccess_mask_ptr(untagged_addr(from)), n);
 }
 
 static inline unsigned long
 raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
-	return __asm_copy_to_user(untagged_addr(to), from, n);
+	return __asm_copy_to_user(
+		uaccess_mask_ptr(untagged_addr(to)), from, n);
 }
 
 extern long strncpy_from_user(char *dest, const char __user *src, long count);
@@ -434,7 +455,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 {
 	might_fault();
 	return access_ok(to, n) ?
-		__clear_user(untagged_addr(to), n) : n;
+		__clear_user(uaccess_mask_ptr(untagged_addr(to)), n) : n;
 }
 
 #define arch_get_kernel_nofault(dst, src, type, err_label)			\
@@ -461,20 +482,22 @@ static inline void user_access_restore(unsigned long enabled) { }
  * the error labels - thus the macro games.
  */
 #define arch_unsafe_put_user(x, ptr, label)				\
-	__put_user_nocheck(x, (ptr), label)
+	__put_user_nocheck(x, uaccess_mask_ptr(ptr), label)
 
 #define arch_unsafe_get_user(x, ptr, label)	do {			\
 	__inttype(*(ptr)) __gu_val;					\
-	__get_user_nocheck(__gu_val, (ptr), label);			\
+	__get_user_nocheck(__gu_val, uaccess_mask_ptr(ptr), label);	\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 } while (0)
 
 #define unsafe_copy_to_user(_dst, _src, _len, label)			\
-	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
+	if (__asm_copy_to_user_sum_enabled(				\
+		uaccess_mask_ptr(_dst), _src, _len))			\
 		goto label;
 
 #define unsafe_copy_from_user(_dst, _src, _len, label)			\
-	if (__asm_copy_from_user_sum_enabled(_dst, _src, _len))		\
+	if (__asm_copy_from_user_sum_enabled(				\
+		_dst, uaccess_mask_ptr(_src), _len))			\
 		goto label;
 
 #else /* CONFIG_MMU */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
