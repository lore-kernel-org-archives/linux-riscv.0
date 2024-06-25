Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6240C3065A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 04:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3iLW8CmZz9fPbdDTX6QTiQQtj8tBqr6lrsnkUdrmVA=; b=MTT/hCoEVCOVBy
	3/IUNIJyLpEGmyplysJuYEShiP8Iwlch94Hc7y4xLDnKIw8CD8rWQknhmrANCSGjRlID7ilx59T6+
	FFFi8KYGRo8Evpu2+nzb0pinMC6PhcKnKyOOQ88DcaD4tk2mmCt3N/DXfocT+KJm2u0RQ0+CQBi/o
	na/AjMI3B0P0vgCZaHuOKiRuGeNwy5+k23857E9HQxL6Bh3v3Zx4O1HbLGQ8e7MbZ8zUjiWrFwgun
	tVKAPHF0wq9I4TdG2CZmdfrfEyUuQy+pkMVUnMGlXTCc9D3zn40UxLRI5EJLVKgo/Vw5Pv6flEVO0
	3ZNmZkqATeDsNkJZVT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxeD-00000001XOy-1mLp;
	Tue, 25 Jun 2024 04:19:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxe8-00000001XN1-3tzg
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 04:19:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 171E5CE139C;
	Tue, 25 Jun 2024 04:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3092AC4AF07;
	Tue, 25 Jun 2024 04:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719289146;
	bh=UfjAcFpr8p8BwnGzYbUElRJhzruRcMixG1Jm7hb8oUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BpRC/okPkhIdo+qkN/KxzojnzWMXXLSWgDUsNqqQk/96MorhbdA8LZAro5cxbC/k1
	 Q0Vi1KInfuqas151KodJ8uSN/XhkDilKMJQBtkF3XjT4e6kDh6AZ0OQ5LTLlKzjn1A
	 VPq+Y0hdGbM/VjLPOwuDTosc/RLTxKzCQvkgyxiDHY9Me28ItVGsFR31VlAn7W8zbo
	 yKmF+T+sOqdrt0xq+AAJjRrSIwIlOCQxBRVFFBoe5O1Y7jg2gH6VmE+oONOc1dXnKm
	 XMdsC0ol9TOyyiPmdxw2aeeWT2iqtDizAnqzpdtxdQVMmunM/hj4FPtYBpa/895ubl
	 bQWrYCHlpot1A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] riscv: implement user_access_begin and families
Date: Tue, 25 Jun 2024 12:04:57 +0800
Message-ID: <20240625040500.1788-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625040500.1788-1-jszhang@kernel.org>
References: <20240625040500.1788-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_211909_347451_36F0C00A 
X-CRM114-Status: GOOD (  14.79  )
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

Currently, when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled
for every word read.

By implementing user_access_begin and families, the protection
is disabled at the beginning of the copy and enabled at the end.

The __inttype macro is borrowed from x86 implementation.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 72ec1d9bd3f3..09d4ca37522c 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -28,6 +28,19 @@
 #define __disable_user_access()							\
 	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
 
+/*
+ * This is the smallest unsigned integer type that can fit a value
+ * (up to 'long long')
+ */
+#define __inttype(x) __typeof__(		\
+	__typefits(x,char,			\
+	  __typefits(x,short,			\
+	    __typefits(x,int,			\
+	      __typefits(x,long,0ULL)))))
+
+#define __typefits(x,type,not) \
+	__builtin_choose_expr(sizeof(x)<=sizeof(type),(unsigned type)0,not)
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -335,6 +348,56 @@ do {									\
 		goto err_label;						\
 } while (0)
 
+static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr,len)))
+		return 0;
+	__enable_user_access();
+	return 1;
+}
+#define user_access_begin(a,b)	user_access_begin(a,b)
+#define user_access_end()	__disable_user_access();
+
+static inline unsigned long user_access_save(void) { return 0UL; }
+static inline void user_access_restore(unsigned long enabled) { }
+
+#define unsafe_put_user(x, ptr, label)	do {				\
+	long __kr_err = 0;						\
+	__put_user_nocheck(x, (ptr), __kr_err);				\
+	if (__kr_err) goto label;					\
+} while (0)
+
+#define unsafe_get_user(x, ptr, label)	do {				\
+	long __kr_err = 0;						\
+	__inttype(*(ptr)) __gu_val;					\
+	__get_user_nocheck(__gu_val, (ptr), __kr_err);			\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (__kr_err) goto label;					\
+} while (0)
+
+/*
+ * We want the unsafe accessors to always be inlined and use
+ * the error labels - thus the macro games.
+ */
+#define unsafe_copy_loop(dst, src, len, type, label)				\
+	while (len >= sizeof(type)) {						\
+		unsafe_put_user(*(type *)(src),(type __user *)(dst),label);	\
+		dst += sizeof(type);						\
+		src += sizeof(type);						\
+		len -= sizeof(type);						\
+	}
+
+#define unsafe_copy_to_user(_dst,_src,_len,label)			\
+do {									\
+	char __user *__ucu_dst = (_dst);				\
+	const char *__ucu_src = (_src);					\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, label);	\
+} while (0)
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
