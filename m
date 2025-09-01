Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E7FCA0FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1f71ftdVKhum7jM54lCXCcG9rs0o2TvvlTSu8ZsDrA=; b=fuwPKpSALdZogh
	jP0Uvjz+8ubQsg31Lk0JuRM6TZJtuOgHdz4xexOi87GTaBTiCvURAMRYCyRQVVFza1YSLoGasFWYu
	fRkkDlxFujHQEp2/ZUvL76YrXJRVDZdAwmn6s4fEuPP76x5viIf9kTaIFKhLPygr1juAZ/keirLwP
	+aUVYp4Czfj/iJZLzQvDk+UOdsRK7FemlUBJq2pZazLhm6wqzk0pXxbhAhkTbM/ynGdzJ6zqAxorU
	rEFvnYbtQvmpzMVjwqu//HfuMt6MGkuIQAjrsdejUsFjWLxq0OM7DBJ5YDlEoHstm3ABezmHYphE2
	sSN019GwnnZa228M3P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4uW-0000000CkDP-2iL8;
	Mon, 01 Sep 2025 13:49:28 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2kU-0000000C3wx-0wgY
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 11:30:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7722c8d2694so2279209b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 04:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756726257; x=1757331057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=DuFATm6LHUWwdlpM2ArOA50fFGHzQVHLvIWrkCqO1HIFPkgFFjfeZFIx9Lwm6tmgkB
         7jdyKuUNYI0L6pjC46/cPTWS7axgzlP9+ng/+5IGdslP9yx9tcwB6t6MUti22kLWpO22
         eM/ASFWGaPykxLG+InLUoJzEBCMSAQfqNGXhi4rD4zOSm8XgBevAZPvYoLDoT5YI9EPy
         Qwf7uICQYBNTo/769rHAggLlMqTAkXi6fyBIiqRPgRZ+n8GjIH+MrFbtpzjROl/ct0Ha
         GpEqzx2fquoHNGC6Wt8IfiQdyTZsZQ+/YNT9mm4vqaG57OQcYdSkNbdCTSbnWXcyT4s3
         UZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756726257; x=1757331057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsWJ8LfQ5pRsnjiKNBF8VnH1ORJpnctEr1VaNmcMPZo=;
        b=S7IVCzBq9IuN09GKWoz6QzIACthOxP5VdXCbdSNCTK7pLyofniYz5Yp7CMuQtolOfV
         JJs585hvvYNrikPA5UyQWxDYX8u6LHv6mnkofCRlxsrs9Wx4KTD3Y3LTB31SvDt9XOQc
         LX/2xmL64ATMZ9xL0Na3kq82nJvU4OZ1VqEHpAAhw79Df0FJWQ8ncCyYzprBWpEiY2xn
         cmGyDwjvbgF+P+lIMlnJsSzoCVuaMOJ/rCLyrmkUrQqu2/LglG6cwoyQtNuNhTF+pRrh
         qKgIXAJrrbvlo0wYPyMlBW5yi5g/D09zma2zT29elwqZinh3ifj5FlnRF7l3cWMlNZkN
         rQZA==
X-Forwarded-Encrypted: i=1; AJvYcCXecuivJzckuCJ3RLOfs/A9Jv3VvMHflMHbbma1C2l1oLxklHOQBRc6WxCTy5w/6iKV0Cc2jqZ8REiWaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXYybwBLGMaCudjfOZ/CwCxRyUi8NtJ7S7cm/+M6dv7FKULb8l
	J61BuPU8j5Nz7sxfFNuYTig6xcMBpzEo3LjiqFW82Bez9VASyHSgmkICbxFw3wYuqv8=
X-Gm-Gg: ASbGnctrmbDs5SlvG8h5FiKxTtoZ7tJrqjOYHmN0u7+82+7pMpfurPnsBLTmO18C8EQ
	TsbHbnCi0L5SK7xoIIxePslju64gcLxZIHT9KYe9oDdiWPX57TumyRumSSxZWI6WUf03qfjqj2z
	Y5W7/4Fkx+A4KKkKiJZ561QvbcMZ0X488vrt84CWA8QspUj4eWuI6dPOPngqUbzAm51ih0jdGSu
	9F1UxGXAi7twyXMRj7k4et+siw72fMs7SvKMogfIJ2nD3fP/jzvo9P7XApzZOKgB1bpWq4tAXNc
	B3bbJLdIXOj13YYQChLcxtEiLSgL+Uz0MiQEunrpNDOvITEsaZnpOtS1jETMgwAfB4iZ7JhzVWK
	h7gWyXnMRIe8nhKLdza15Kh16Ew/3upKnm4MaXl6zCAX0sbM6dORnL5n3mG3hKZNp94mVG1cdKg
	wWX+eJdaSAtwMOegooLwf1LxPBQ/s9WfJigatEizrgxIk=
X-Google-Smtp-Source: AGHT+IHAP/HpWJz43wjzWV1AMfyaEGlxWi3s5h5cxx1rxnhDpNmQHxPjIrGV0BRKPAD8DAepB/KmuQ==
X-Received: by 2002:a05:6a20:394b:b0:243:a251:cf51 with SMTP id adf61e73a8af0-243d6f87714mr10685440637.54.1756726257360;
        Mon, 01 Sep 2025 04:30:57 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm2911441b3a.11.2025.09.01.04.30.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Sep 2025 04:30:57 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	brs@rivosinc.com
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 4/4] riscv: Use Zalasr for smp_load_acquire/smp_store_release
Date: Mon,  1 Sep 2025 19:30:22 +0800
Message-Id: <20250901113022.3812-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250901113022.3812-1-luxu.kernel@bytedance.com>
References: <20250901113022.3812-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_043058_280163_A18F824F 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

Replace fence instructions with Zalasr instructions during acquire or
release operations.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 79 +++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..b1d2a9a85256d 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -51,19 +51,76 @@
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
-#define __smp_store_release(p, v)					\
-do {									\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
-	WRITE_ONCE(*p, v);						\
+extern void __bad_size_call_parameter(void);
+
+#define __smp_store_release(p, v)						\
+do {										\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
+					 SB_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsh %0, 0(%1)\t\n",	\
+					 SH_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsw %0, 0(%1)\t\n",	\
+					 SW_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsd %0, 0(%1)\t\n",	\
+					 SD_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (v), "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
 } while (0)
 
-#define __smp_load_acquire(p)						\
-({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
-	___p1;								\
+#define __smp_load_acquire(p)							\
+({										\
+	TYPEOF_UNQUAL(*p) val;							\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LB_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LH_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LW_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LD_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (val) : "r" (p) : "memory");	\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
+	val;									\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
