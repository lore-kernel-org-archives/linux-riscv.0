Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F34BC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WRMTm5n9vjpjLY+cA0wBOTzvcLny4cuYR6T6NDo8kQ=; b=mV5hzRABnXMKQw
	l8rQGXzjSkjY/5XBeNPrSL4Mnk1+/xsF/MNDLZ+plSh6GaK8qFpSeJQFEpm6X3knpF4en0U3gfk4T
	GDNBXyqE6jjnPFKw/ks0zbo6wf6Ult+FY4w+EjsferhzHH/mEH3EMsYWQ3DBD9zauo0xnRvfTR8AP
	YG+SvFzYE288IZgKpvNCdtxUyUf+ricRvTnTSdNLuEkbQmXe+o3Qs1rci9KBQYbPMv02vA4EIZ6sX
	TLO0LOiQC0qm5rOTTTKr7926SRpTtGn0D0dhxxXGSKiKN2erznaJi1F1UitQYP+/e2vnUly2HhbXP
	dUaQqLciWsgWFeQDIa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUS-00000009ala-0HFo;
	Thu, 10 Apr 2025 07:38:24 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lye-00000009TAo-0UyG
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:05:33 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3fa0eb29cebso925579b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268731; x=1744873531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=cMkztjUw+mCF0myNDEJmJZmGeE6hw3RY5hy0PCOSBXWxVqwBj8Bl5MjNiFZdYhI4Ya
         O8FBuHUUufXcHWFtdHie6RvHYSg9kd6KXn6AklefMxpRQNZUf+2NdayAhD/n3ZJmLRFr
         QCJ5DxT6wc/K2+uHENr+nNKJUMvXL/MCWiwsFXnazl8704z2F4V+VxQqAYsSLpQiGNcc
         MuHQm1WcpgYE7K1HX1XPCWs2H2pol6vLcMQYuxbmcjvjwfBrqDOYVLpvATQTe5X8Zc5n
         FhRszGiSokIrU8xtGuAU9dRGXN1oGlPGqsTOOOMrHbUYNJVF568SXl0pZr+GeH/+9b45
         D89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268731; x=1744873531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vvw7nYWiLBIqfTSpurYIsb0A2VRmihRadD2HqJzvOMM=;
        b=vZEzTm8m8U6QgtHOIGUwnYCSse+gKWyHIXKiphuB0241Dla2RhsxD1+beR6G9QFcPw
         FEpznKgq8kguMkhwZcjZBwP/NfgWzpFSWnanadflR1ln26/kGzbIq5X/44sAYM+ThNKB
         LJB8F5Vf2Yf7ePJk5X32H+psnjn9rb8PATy3izh91xn1zhGi7JPQoXLsKx1BXXPxANtU
         7UMF4AayFWTCWE9DoI64K6pyszjj+frhMcJuh6u3IMPsg4HDKQ6nUsjApgHVH7gpD6m6
         q0Nx3x3rOHSs2eA3VZe2V0ji+S9IsDNuMmPPNd8vFACWTMtKwDde3PnGJTjzHcwVeCLN
         dcMg==
X-Gm-Message-State: AOJu0YybJeBQs/qa4sFX4qxbeut255xJIQuT3uGgl4JIlS1CSfvcfhkq
	+26y3+hO7tvTrLGfumjRR7Dj4Wj4MbetPXCjvo0gyqpBBQ2G+3bohF2s3h0Huw==
X-Gm-Gg: ASbGncvTJT1LTt4Gle+OWTLK6zBzXXWtRKbJriDmQDfNDXbXFWytZHxAREQ9gw7nsQG
	3TFi1tLlD3cESPrEEpJMjdqFFzM2Fng1hD+BEeWPfIUijnqLTJh6mLCWb7tAomIJrmcg++k15AM
	m7aH1MFC1itOoH4hXeAY0xpM8qM2Qp9ofpRyi+PFbeQFGbJxkdQh/dEJy2toTglETjXMp9uNVpT
	iAud4uzDqzYt47yz1dy560fFfap21lTCI+Ft47w7JRxmRiczIrcVabq9ZhynQE0ObZBYhAUOffE
	TfbYCDopaQ9+FPKpVoIXfJk82eP33GHMC/7FuC4tIJ6lcqPfodf9RPeSFbTM7K/OTaZ6Qw==
X-Google-Smtp-Source: AGHT+IF/4Hhe3gfMVMHnBMPKqqrqs5V8qr1hvivIjhC40n+SJ1Uz45EXIUL/JoOL6so0taxy89Y6cQ==
X-Received: by 2002:a05:6808:11c1:b0:3f9:aeb6:6e92 with SMTP id 5614622812f47-4007bfe2744mr915328b6e.9.1744268730964;
        Thu, 10 Apr 2025 00:05:30 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:30 -0700 (PDT)
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
Subject: [PATCH v6 2/5] riscv: implement user_access_begin() and families
Date: Thu, 10 Apr 2025 07:05:23 +0000
Message-Id: <20250410070526.3160847-3-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000532_157002_DFDE7F9A 
X-CRM114-Status: GOOD (  14.97  )
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
