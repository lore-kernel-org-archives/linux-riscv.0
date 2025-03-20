Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1313C36000
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WRMTm5n9vjpjLY+cA0wBOTzvcLny4cuYR6T6NDo8kQ=; b=ax+cjzcsHZrmhr
	0wZT/Z2Rbte0q7EAt7dHxo22nURoeZGjNu9tHMKBRwT3zAERuIxUAfwHKz/lbrXqjYv/0swHexv2O
	TjBnTuCwwRo3qd26mWD9MlwEpP7vPMMBmEIHGdDjHd/CpnQfq+ENCuiHo948GMSKpJOY8hTmwDsxZ
	ubx2pQsXrJg+ymsCdz1Km3oiQadNj6l2/x44LRHisGeTvui6X0ecDBrcMZeCNElEY43aUSF7IPs70
	2eqE4Pi51eg78x2xUmw44wF2puToGaVGjXidwmQRUBFNqjweXMB2GtOiv3rVBNRQSyG1GZkpljyMu
	CdY6cZzjGaYiG8tg9Cag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcp-0000000DPHQ-3rLC;
	Thu, 20 Mar 2025 22:44:31 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcn-0000000DPGO-29lU
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 22:44:30 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3f3f4890596so755579b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Mar 2025 15:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742510668; x=1743115468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=EC2e8KULGNAiZ7bBGLPT+kxW4n/FQ6dlinbjol0F35iLJ8ZhgwvXlXMP67Swe7O86j
         JtY4Ai0RFUsp2Ug3u8SDbMPyo1rTVLD7XRxhelLBxzGrIuTc7pFgWcHN8/E046YJeCoq
         L+pINYMNxuDpD4GuwMKtfiwB11D1uGn7aJwaWrQeokm0j81g7z6B7XEz5JyOOZ7XKQQ6
         /cr/sKEyL7c18L2x9sjVfQB2g+EgcsTOom8aQea/KtOK7EJf20FzvgTd07HTPegrbc3w
         Sm+hyI12QewcqGhwy6VXTZjXIfWE7NRfMYTM39ljnuYM1ThAceuC+6Wma/QlMtt9WgbE
         KTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742510668; x=1743115468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=Ob+d1StYdbHptRQ5zk5ES4hme9mdZVCMtlqqnLBX1QLDl9pgKoyWyvZeJOoBfUbSzi
         ESyRQReeVvLhKK4FOqQJDDfgygiXIz12AYRehtPY9PzjEzaNV3fDO0VL97qlhf0W0qyW
         mBkgQeJ71IMXVO11qsrKFhKVayKRt2jAKOJOkKBOx6Hh9GiwuGkXxgHjWeD1mAW39Ipy
         IfPRzqqPeS0mBJ0o/c4WIc1hJRyKKeX/O0EEzwqrTOssgOXoqRycVV10jcwtmjeKXEKj
         qfiiFQd7qcHRZZQQH/9YrlOz6pRSH1V83+xohYSHA7gNUohhIjmwagmkaa3u6mNb0nP4
         x9zw==
X-Gm-Message-State: AOJu0YzvDmEO0igH/N4Dreelji0tePdlD3kF5rYgimjfbcBJu2uK8VNS
	P75Yx11foyzdNlkO0aKVkGR/kE7M4y03QvI6URKxuAdmMbAlm9ldjbsd21UYuw==
X-Gm-Gg: ASbGncukqW7ZDKK2TaUYLt/aP46S4uFchSvVeLcMvUDRnoOTI28MZuBXDt698yJjFFm
	MHyFucghWsBwnRm7xoImDP41mgWmyKl0Z+DsetZhCg05nwzQRV2rbmuQ51ppOdmQBQ5ay2ZrN+M
	qrbJjB+eYt3ZHYb+gKYdfDMu6adkAzg/YyRmleaSX5370iMUq48rZ48RawjCE7YBEJWE5NGpoDR
	TM73orKdWFdGpF5pIP7nZPWmkyjzzrykeG5PdDnxead4IUiYU6K64PYSOqFKT1E28LZl3k3dFt/
	4g/xSimCdfBTz/KYBttaEqr7Zrd9VCKlXaoNxCdxQgmERth4eqHEiZil3JnX/ro=
X-Google-Smtp-Source: AGHT+IFJedQeXWVCp8Wwl18/3gDvFSbrwpqc13CUW17x0vVkYsJlg/z2sLYvBni60TXj6/O4eMplxg==
X-Received: by 2002:a05:6808:1495:b0:3fa:d6c:cdb8 with SMTP id 5614622812f47-3febf79528emr596590b6e.38.1742510668153;
        Thu, 20 Mar 2025 15:44:28 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dcc09sm103524b6e.12.2025.03.20.15.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 15:44:27 -0700 (PDT)
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
Subject: [PATCH v5 2/5] riscv: implement user_access_begin() and families
Date: Thu, 20 Mar 2025 22:44:20 +0000
Message-Id: <20250320224423.1838493-3-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
References: <20250320224423.1838493-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154429_554683_82E995C0 
X-CRM114-Status: GOOD (  14.76  )
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

Currently, when a function like strncpy_from_user() is called,
the userspace access protection is disabled and enabled
for every word read.

By implementing user_access_begin() and families, the protection
is disabled at the beginning of the copy and enabled at the end.

The __inttype macro is borrowed from x86 implementation.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 76 ++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index fee56b0c8058..c9a461467bf4 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -61,6 +61,19 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
 #define __disable_user_access()							\
 	__asm__ __volatile__ ("csrc sstatus, %0" : : "r" (SR_SUM) : "memory")
 
+/*
+ * This is the smallest unsigned integer type that can fit a value
+ * (up to 'long long')
+ */
+#define __inttype(x) __typeof__(		\
+	__typefits(x, char,			\
+	  __typefits(x, short,			\
+	    __typefits(x, int,			\
+	      __typefits(x, long, 0ULL)))))
+
+#define __typefits(x, type, not) \
+	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -368,6 +381,69 @@ do {									\
 		goto err_label;						\
 } while (0)
 
+static __must_check __always_inline bool user_access_begin(const void __user *ptr, size_t len)
+{
+	if (unlikely(!access_ok(ptr, len)))
+		return 0;
+	__enable_user_access();
+	return 1;
+}
+#define user_access_begin user_access_begin
+#define user_access_end __disable_user_access
+
+static inline unsigned long user_access_save(void) { return 0UL; }
+static inline void user_access_restore(unsigned long enabled) { }
+
+/*
+ * We want the unsafe accessors to always be inlined and use
+ * the error labels - thus the macro games.
+ */
+#define unsafe_put_user(x, ptr, label)	do {				\
+	long __err = 0;							\
+	__put_user_nocheck(x, (ptr), __err);				\
+	if (__err)							\
+		goto label;						\
+} while (0)
+
+#define unsafe_get_user(x, ptr, label)	do {				\
+	long __err = 0;							\
+	__inttype(*(ptr)) __gu_val;					\
+	__get_user_nocheck(__gu_val, (ptr), __err);			\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (__err)							\
+		goto label;						\
+} while (0)
+
+#define unsafe_copy_loop(dst, src, len, type, op, label)		\
+	while (len >= sizeof(type)) {					\
+		op(*(type *)(src), (type __user *)(dst), label);	\
+		dst += sizeof(type);					\
+		src += sizeof(type);					\
+		len -= sizeof(type);					\
+	}
+
+#define unsafe_copy_to_user(_dst, _src, _len, label)			\
+do {									\
+	char __user *__ucu_dst = (_dst);				\
+	const char *__ucu_src = (_src);					\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
+} while (0)
+
+#define unsafe_copy_from_user(_dst, _src, _len, label)			\
+do {									\
+	char *__ucu_dst = (_dst);					\
+	const char __user *__ucu_src = (_src);				\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u64, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u32, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u16, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_src, __ucu_dst, __ucu_len, u8, unsafe_get_user, label);	\
+} while (0)
+
 #else /* CONFIG_MMU */
 #include <asm-generic/uaccess.h>
 #endif /* CONFIG_MMU */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
