Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8E4C021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16tsa6nu0NypQcavo+jM81OxEAyEksqgRnQ4X9P7nXs=; b=CLuUADGrBw1hoG
	+EJ6Qywm5/Yp5ZQhgksClHL7DipgmsfzuO4EBYqQD4LXkzMZzadu9xM2L6Ma6RFeavHY4FCBr9qQv
	6621f7zVo6kKNoIxH9/0noNDudXn13nuRZ8IhLdfMoQsaxInjuNSl3J1YSu1Hw7lP4K/x8XwkU81A
	C9T+Z+PAoosOFJnJGSSQNMQHVE/iIhBjZJ0B9DHwwc3iC78nt0CQRw1dXa5UXXHVKdZfBfbduEQC6
	W/26PrFyETT1buIaJ6zIRMQ/I6dC1KraYQFBu386fX5RvoMF4EuJ09uhIT6PhgV2GapvqK7rPBt0z
	5VI5HHqzaoH9h9uVgGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbm-00000003SK2-2tOe;
	Fri, 21 Feb 2025 00:09:34 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGbg-00000003SCw-3PxO
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 00:09:33 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3f3da35555eso868084b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 16:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1740096567; x=1740701367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynQVfR/dFk01f+alSHWcouno+EVl3KD0yb8OXJAhnGc=;
        b=ZVdLVSyGcAwDNiBW1YQCSXbQo8ZSHsNxlbSaSEw4zVNC+hIICUlWWZw+kniIH87IA1
         Yf+Ko1WI3ale9jmtlyoRr8a4gS09BXc/weD9ogXFoo3pF9wD4w67uYb4UyzNYFoCWr0d
         Pg37mhYwHTZwmAA4urMX+vk9UkUezZ7Mo3w5cuS6IwtBs0sYBd6VrHovj/CTGyHEpR4C
         7CoPCb83yPUhhGaNDP5r4prcaEyzRYhXOhiei1e99HzK04Vk+JCXO6G5eBaTA+qYZ/Hb
         OasZ4c3BWBQ6tN+P/uj9CEmb+lGxjp99fCra0FBrggsDmfaCrOVDmOBXGyemg9mWydK8
         Tarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096567; x=1740701367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynQVfR/dFk01f+alSHWcouno+EVl3KD0yb8OXJAhnGc=;
        b=uOejOa6daVg17GSHfIFkbnzBN+rNTfEEeQr5/z4zsQQ3Gu1Q3+PLyejgJMTPmjh95w
         xtOr87llBmWByw24GJhCo+w2l/bg/S84Nxv7DCpcv+a60y0lx9wxX2t9UjXoDPYYnxF2
         bVcdwnbKVIwFu1HhvOmOLkXWVRaoVCoX5dTGQz/aoDEtZoAtMI3mIcp2g6E5BVaL4WSm
         iPIzRSy8Ql3rwkujMRNRhL8cICUy8KNPYhLiYJ9xPPxWOvk9argL5sWlYIRubUHu3G6V
         JWj834TfJZLhO9EZGIy1Mu8MHMYx2lBZKUfi6Ify+0L8orHCXCoQWWTuRV5CfNitrc14
         tU1g==
X-Gm-Message-State: AOJu0YzO901uSbAXM1cxHH8RZEeD9vymKdOqKMTeh70CB29VMHUlcbpe
	8uRqbFXzb56yPdvC6eTKFqLcQuiskP2xenVPwO2Oh1fhkwHUXK75dSCZbRmTDQ==
X-Gm-Gg: ASbGncuj+rODwbIyjlA5UpT/RNWNtzqOb4wm63urabebqcEZadBUW3153FPCm25DQyR
	y0/cEIGQSmVQavNf0QbYUzikjCL/0akoq5ttogzLcpJpmD9ZTjKH1J4aTkViUPMgWVT5Xuo3/0j
	O3kAdGUspTiKuNlQ8R+nqX+lAa1miU5Y4b+a9/vibA1DYB5MBKPyf4xIwNwbwrCuIPWn9gUAKVN
	BD5VY0UDyk/yWa69voINU1Cr0f2LY9iLnr42L42pIDHzPrFkh6mLgYqhIAAU86uWbc8WmIPbm01
	KP2W/ognyXUXLZe4N0wAX0DxdNTBMvTo8Q==
X-Google-Smtp-Source: AGHT+IFhyE2QRwXal+GO2Cm8WYvshkYyOzXF4EFDI4EcmkmeGlVmtYav3txhL7PD6lMOsijhkF4Ggg==
X-Received: by 2002:a05:6808:384b:b0:3f4:b0c:ab6 with SMTP id 5614622812f47-3f42469dfc3mr1403840b6e.1.1740096567630;
        Thu, 20 Feb 2025 16:09:27 -0800 (PST)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f40b027906sm1573401b6e.42.2025.02.20.16.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:09:26 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v3 1/4] riscv: implement user_access_begin() and families
Date: Fri, 21 Feb 2025 00:09:21 +0000
Message-Id: <20250221000924.734006-2-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_160928_853924_0138B910 
X-CRM114-Status: GOOD (  15.14  )
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
 arch/riscv/include/asm/uaccess.h | 63 ++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index fee56b0c8058..43db1d9c2f99 100644
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
@@ -368,6 +381,56 @@ do {									\
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
+#define user_access_end()	__disable_user_access()
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
+	if (__err) goto label;						\
+} while (0)
+
+#define unsafe_get_user(x, ptr, label)	do {				\
+	long __err = 0;							\
+	__inttype(*(ptr)) __gu_val;					\
+	__get_user_nocheck(__gu_val, (ptr), __err);			\
+	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
+	if (__err) goto label;						\
+} while (0)
+
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
