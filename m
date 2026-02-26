Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FFCFD8FC3
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 15:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1lQt0TyH5XL/+cLrUTW5IJbjaXrN3BPf24Hai4aYu2w=; b=YDL6/vjd/H9USC
	D2kJFmQmm+/OuWL8h2jMSC31pe4OkZfeIWtG3rRYU0Ut47Db5+AGp3bgVS2jQ3w1Fz4TU15pcAS2k
	JLc29AtCrqLyz7l+PBLmPbhUMcSwJhgZPyo6bi8m18k0S19CoAzNuOOcNjuf660H/cr3tJ8O0RELa
	fXFe64kA8o+1hrKqT4pZtsRD+WEb6UtvDWfdFXwcpYQxqEFdJ0VheHrEsCRwmypVkUtE7EVT73+1d
	tI6kbWe/MMISSaxs1FkwQ0bjQSB8/j6C1QhOltpVlYYgtmzvMjjvZhc0C1h4Wl6lg4pxRVDogmLQy
	VKg4CxSFDFCXqfwp+rSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcuA-00000006Ou5-0LdS;
	Thu, 26 Feb 2026 15:03:54 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcu7-00000006Otg-49W1
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 15:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:Message-ID:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=e6M1tQVvDIkc+dV5Pa2VDS+xz7uDyD3Gvv7kQY0e+lY=; b=hkeKPiIdwY3mI+0W5T25sYZP/9
	oNuznDb8m1zBW/f6+J0BULGhEHcsNRasAjxK0FnKNWxJX6jROm+iYAl/FOFwqPqmMMbSZsBWI+MG6
	PDyzWWVsKKxUXcHP4gWNt5LIrnsNCOajTIt+oMhGGE+ZECesArTJ1aEHjN89+lGPmqsu7q9sXXz0Y
	lnTiCDmHGd1FgETVer1kHGr50wzguqCWU1qa4id0C3YfYS9W+JYCpng0ghA2QSfkLh5nu9nPPfrVI
	TMz3GWbJUNixxx+KuhowVml4TFC8LLCVcGj8qb6moP4boURegb4jk4cIorW5bBPClby6MvGsb/1G0
	7ytUCSNQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:47548)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcu4-006Fja-1U;
	Thu, 26 Feb 2026 16:03:49 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcu4-000Sr5-3D;
	Thu, 26 Feb 2026 16:03:49 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 16:03:48 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Thu, 26 Feb 2026 16:03:46 +0100
Subject: [PATCH v2] riscv: Limit uaccess speculation using guard page
MIME-Version: 1.0
Message-ID: <20260226-uaccess-guard-v2-v2-1-765a314839bc@cispa.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgMlahWvIg61jZqlSoMiFO9uc
 XzD/xmUk7DCWGVIfIvKEQuorsDvLm6MEoqBDFlDZPFy3rMqbpdLAW/C3jVNNyzMfUtQsjPxKs+
 /nOb3/QAGlbiBYgAAAA==
X-Change-ID: 20260226-uaccess-guard-v2-7a3358bee742
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, David
 Laight <david.laight.linux@gmail.com>, Deepak Gupta <debug@rivosinc.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Daniel Weber <daniel.weber@cispa.de>,
	Michael Schwarz <michael.schwarz@cispa.de>, Marton Bognar
	<marton.bognar@kuleuven.be>, Jo Van Bulck <jo.vanbulck@kuleuven.be>, Lukas
 Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4767;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=dDzSFQNPZcPTrUMGcmfEwmsreETTYY5zIvVeXw61NmM=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLEq5czDhyZMZT4ysem5kOzdKfxm/ywDhPUb3qktjR3
 7xz6m5s7ShlYRDjYJAVU2SZKviasW+PA09S5uFzMHNYmUCGMHBxCsBEur0Y/lm03/765Nwzswsu
 pQsM1ANNL09xVjuveaDt8tfXFiw8N2cy/LNeorBmvTSXyeOE008EGS5Uvk9sXdi5z92RR/F191/
 GbC4A
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-06.um.gwdg.de (10.108.142.59) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_070352_033560_50EDD718 
X-CRM114-Status: GOOD (  12.98  )
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

User pointers passed to uaccess routines can be speculatively used
before access_ok() validates them, potentially leaking kernel memory.

Clamp any address >= TASK_SIZE to the guard page at TASK_SIZE-1, which
will always fault. The clamp is branchless to prevent speculative bypass.

Unlike the v1 approach of clearing the sign bit, this works with all
paging modes (Sv39/Sv48/Sv57) and does not interfere with the pointer
masking extension (Smnpm).

Similar to commit 4d8efc2d5ee4 ("arm64: Use pointer masking to limit
uaccess speculation").

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/include/asm/uaccess.h | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 11c9886c3b70..df31df3bd55c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -74,6 +74,20 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 #define __typefits(x, type, not) \
 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
 
+/*
+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
+ * Branchlessly clamp any address >= TASK_SIZE to the unmapped guard page
+ * at TASK_SIZE-1, which will always fault on access.
+ */
+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
+{
+	unsigned long p = (unsigned long)ptr;
+	unsigned long mask = (unsigned long)((long)(TASK_SIZE - 1 - p) >> 63);
+
+	return (void __user *)((p & ~mask) | ((TASK_SIZE - 1) & mask));
+}
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -245,7 +259,8 @@ __gu_failed:								\
  */
 #define __get_user(x, ptr)					\
 ({								\
-	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	const __typeof__(*(ptr)) __user *__gu_ptr =		\
+		uaccess_mask_ptr(untagged_addr(ptr));		\
 	long __gu_err = 0;					\
 	__typeof__(x) __gu_val;					\
 								\
@@ -376,7 +391,8 @@ err_label:							\
  */
 #define __put_user(x, ptr)					\
 ({								\
-	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
+	__typeof__(*(ptr)) __user *__gu_ptr =			\
+		uaccess_mask_ptr(untagged_addr(ptr));		\
 	__typeof__(*__gu_ptr) __val = (x);			\
 	long __pu_err = 0;					\
 								\
@@ -423,13 +439,15 @@ unsigned long __must_check __asm_copy_from_user(void *to,
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
@@ -444,7 +462,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
 {
 	might_fault();
 	return access_ok(to, n) ?
-		__clear_user(untagged_addr(to), n) : n;
+		__clear_user(uaccess_mask_ptr(untagged_addr(to)), n) : n;
 }
 
 #define arch_get_kernel_nofault(dst, src, type, err_label)			\
@@ -471,20 +489,22 @@ static inline void user_access_restore(unsigned long enabled) { }
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

---
base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560
change-id: 20260226-uaccess-guard-v2-7a3358bee742

Best regards,
-- 
Lukas Gerlach <lukas.gerlach@cispa.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
