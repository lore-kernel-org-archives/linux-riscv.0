Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E8CC35FF9
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riKXSI+E2K6CYMT9GP1v7IFtNF9V7NAELowQ2sQ90fY=; b=bdcUeYg3A64w4h
	+PzWTJmIxshvN48DcJEr+guuX8INDznBh0iWy+k6g5ZqEZosjCFRfd4bmxPS7pVgEIYKBwOHL5P26
	n9CarnhE6u6D/gYcopjEd3BBVxxGiICK3ez2lXA56jbOLhlFAVEfQAj10nW40P4uxDyOHwIUyHAOe
	n+MuHBeOVRb0gDNJSTKqf07WDNUqlDHinCwWKVfRKG9Xqx29I/YPWwYtmdTIV8sPAGDRnIOxfianA
	SGsNJm8rUvOFsJuMqGpqNROy/N5TFr2oiQlFhMXhYQ83iySJR+Nb7//JfN3F9105faKD6BzMFHFRc
	yihHJbsj7tNBdrL8pvIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQEU-00000004nhE-3LTA;
	Tue, 18 Mar 2025 06:15:22 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuQES-00000004nfz-0glQ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 06:15:21 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3f682a2c3c8so3019320b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 23:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1742278519; x=1742883319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Rz7GbyOPq3wyNoMRzcZSnc3xOAtIOrgSgwyUJM88Lo=;
        b=DQA5lPoZykGY3SwAr9glNH60GcYd7Qh4N1dq/ZhUijfhX3RtgVAPDOc6Kon3EPN+gV
         7TBC3LoenzX+BTCvykS/mL5f2EqFTuOjjuMA4Aj4r1Go8421YGumzgPaKYzoIbuan9Y8
         CMxVqfPOHw2XPjOFRi4L7RYrMx5D5ZK/nRaFsHTXNUfZr3bTS91AAu3CMkEmqcJt7ZxL
         bbvn40PKoc0GOZhS63kXZ/Yv/Sk5BHwNaB+LO7eRWs8yg2WmeoBSVOb4/7eNaS1934UW
         6p9Suy0BjAjvwEJEAnUabsU3AtCHjVu9ubv9ikIir9vhV1LA4xke9rz/R5cUUd+zr5D1
         j59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742278519; x=1742883319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Rz7GbyOPq3wyNoMRzcZSnc3xOAtIOrgSgwyUJM88Lo=;
        b=msuAP6IlBdFWarNM7b5ksnHfJNs1LzMRe1B1R5tgA6U4xs9TNsLS0/nGcgumq0/mOn
         mLUe+pWYUAZzrXkFzLzBWEKA0fq3lT8/gP4KjQw+3vJpkGdspUhMvzJ1++RK6dmOZ/ej
         zFRp/uWluRbEP1obRT7Ao8BIPo5JnO2T9NtlxfDDu/NMYoP7Gjv2nySDg9lU9kPne5lg
         fjkB5H2KLhUFkVyHfs4leIj2CMIIuIKsoEqKj5xRzRgV6TyoIDzFQohsC3hTo36CYfJv
         yMWtKNaAslBP8/Cv5M0zk4OAM5HMxM7AxG/ounXOYQVWxEr+FGwJab2tSEFF2O99N//B
         YsAQ==
X-Gm-Message-State: AOJu0YzBYDq9OhEbxbfmn/3bfOUY8XNt9dFWXgu5rsYOFXSpMxG/tHBI
	KS8HGlwIOkUTMHEWa+Z6nl9uAmeHWDvOmNc/AhK21hjkPl60oVdKLDwvOESkUQ==
X-Gm-Gg: ASbGnctVYDiFrq6Nxofvqq8zclPkWmZJY747BTeGkFO/szT2cVJA6K8Ezj4fArWJOXt
	8NPGcC92Po9G4RXTiQUFBs3W3PllLvQp8bQe1CcjasVP8j4X8s1NojwVEFeXPSKz7LR0wfV+Dyg
	LUT6kFgAhg8NQbk7Rx7Z1xr/KF3d6t3Em0aNvyyRiTJfQRGDizRFBEr8V3SyjnOBzbxV9/jy/Hm
	nDihaKAfcBTw2T71TUQuowUV9MrYwALIQ36LzIzBN+ezRSTkbfIWZ0I/XOdX/ntumMOi8MFaT8V
	FVOgFhMWagvI0UQX8srZGpC5Qi3ih0bEkkVZpMKUvivqHtp7iajyV8FNiMqalTk=
X-Google-Smtp-Source: AGHT+IHjTlUJ8udAjH/mkkQoHGmHBU7+KcdMu+hMBhRq6iTs6DPSX4yEs5XtvzKJa+RBjf2KhPoFlQ==
X-Received: by 2002:a05:6808:3507:b0:3f8:587:dacb with SMTP id 5614622812f47-3fdee93092fmr8770534b6e.9.1742278519108;
        Mon, 17 Mar 2025 23:15:19 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd403b882sm2051642b6e.8.2025.03.17.23.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 23:15:18 -0700 (PDT)
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
Subject: [PATCH v4 2/5] riscv: implement user_access_begin() and families
Date: Tue, 18 Mar 2025 06:15:11 +0000
Message-Id: <20250318061514.1223111-3-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
References: <20250318061514.1223111-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_231520_209562_87EC6803 
X-CRM114-Status: GOOD (  14.84  )
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
index fee56b0c8058..d7fef81b7969 100644
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
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_get_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_get_user, label);	\
+} while (0)
+
+#define unsafe_copy_from_user(_dst, _src, _len, label)			\
+do {									\
+	char *__ucu_dst = (_dst);					\
+	const char __user *__ucu_src = (_src);				\
+	size_t __ucu_len = (_len);					\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u64, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u32, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u16, unsafe_put_user, label);	\
+	unsafe_copy_loop(__ucu_dst, __ucu_src, __ucu_len, u8, unsafe_put_user, label);	\
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
