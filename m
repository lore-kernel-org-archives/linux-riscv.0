Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F161C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 04:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BsdAQ/utfGt7wW9kJGq6+VkVgWZmkoCuzSK5z0p0qek=; b=ErL8V9fU77I3E3
	WeIJnR+jbCG6hm7b8mcvgGD7L9icshea/+HoNXLXEye4Gcu0SSzthTDEi7JYELhVHtAR1olDt8Qel
	diOYy+4NyNaXAH60q7M2INCC6irWcaC1AEte/XFodDOym11zTc3T11NglKMIsNab6iQqLS4hH5drR
	Yh4rshW6gr44537wN6BMQge5/4ipruF5CjjpDOBJ9gb0uiXaiFTqCzp3peN7cXWH1QzzBondLk/7/
	suYUBuwF2SA0jN42SScn+1ixR0GbqefwiJplUYqwIxXeOqXD9X60zaKW8txs8llT/ugTAeB+2mCcz
	AXUny/bR0yHsXv2R8E5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZjXp-00000007Y37-3cV0;
	Fri, 02 Aug 2024 04:05:33 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZjXm-00000007Y2S-1C5n
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 04:05:32 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-70943b07c2cso4138136a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722571529; x=1723176329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCaSe5jBDmfLQ7UtNKeC+GSnHOUZU+L2Md+6S25fGyc=;
        b=KelQVTlfYry+Dyk4Q+Vf9f0EktJ31fzJ0WkoIyz3orJyJNP071Vt7cG5q6beTs0yFM
         NS5hcftrx1vX/w1Yp94YxboWTbUoXu0SOVuA1KRBkhyl6TMw0Vq6EkpSsI4R3ee2f1Ge
         CZB66wTPpKNcaD0bSw0ELjaCbL8yEzRYmog7Ty5fEXa+Kc4FdXZUkMDM1L6Eh4zrRSkW
         L/8A7LqbvkswJACtEQ4wrL2UzOW5RY2GAU8SwnBlvYMHPvVyPq/XwWD5SyWy6mmbXtGS
         wfaNfrMqI5rtDEkO1ZpelxZmtI4C2HAMMs/hFuHRi0y0bHUKsa+QOenS51kUkK4mptMb
         NbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722571529; x=1723176329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCaSe5jBDmfLQ7UtNKeC+GSnHOUZU+L2Md+6S25fGyc=;
        b=g+2yCJdcgxQRhU/aNmxbDGbdd5O2f7T5PrIfwc3unuap6InqQB79Sz/+5pcC5Eob65
         FwaO0yTThqZS1QIvZ7GfOXVEa3RO2RAaUgAJrR/3gsnnRgCXKZHegnUjzwlG+p8L5HnP
         O0vLr4gu6JTnZrdgKQ0LDodCO8GPZ7HNKKu4LjsSZV6N9bDznqhVZiTGx+fLm9T+/W0/
         jp/NKkANztItfg0pG0bneaDO6+cNnd5a1zQPV4LWowJctS+rkkoPspVgfageE+M0XZGN
         Yo6UuPJdXiBGxBdtKrO7wiveGauau0/YIs18IEkVVDINF2sXgiQ5cRxgLpeR/asE7Q8l
         sYEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Zmf5WySjDs7h4rBiuRUNVSUkdAzqA9Wzw/c6wXko8SQwCp1PeHMKqjvEbV6PFlO+oKAjwgbT49Pm0qiBr07fKLb2wMKmtfHlt07acbnd
X-Gm-Message-State: AOJu0Yxd98khbMVwP4qJyDaBj3Heb3gi4Pv8P22LK+OwdT0pXnpp1kMo
	a0FH5t9DVz+275dxE0dSIVRk4bIVqqBIm36fTIKDNvZNqx7GK/KZ
X-Google-Smtp-Source: AGHT+IG7pVxT5JsqTRcIcEFhSeMR1Ue5oY3cdSzXsrIAPd10/0lOhP13GCp/O4x0EAT3+0JAPj1qLw==
X-Received: by 2002:a05:6830:f89:b0:708:b46d:5c76 with SMTP id 46e09a7af769-709b3245aefmr2143230a34.17.1722571528735;
        Thu, 01 Aug 2024 21:05:28 -0700 (PDT)
Received: from gmail.com ([2a09:bac5:80c9:78::c:349])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b7654beb1csm554813a12.93.2024.08.01.21.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 21:05:28 -0700 (PDT)
From: Qingfang Deng <dqfext@gmail.com>
To: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: [PATCH] riscv: support KASAN instrumentation of bitops
Date: Fri,  2 Aug 2024 12:05:06 +0800
Message-Id: <20240802040506.712-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_210530_360567_61C1AE51 
X-CRM114-Status: GOOD (  20.89  )
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

From: Qingfang Deng <qingfang.deng@siflower.com.cn>

The arch-specific bitops are not being picked up by the KASAN test
suite.

Instrumentation is done via the bitops/instrumented-{atomic,lock}.h
headers. They require that arch-specific versions of bitop functions
are renamed to arch_*. Do this renaming.

As most comments are identical to the ones in the instrumented headers,
remove them.

Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
---
 arch/riscv/include/asm/bitops.h | 100 +++++---------------------------
 1 file changed, 15 insertions(+), 85 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 71af9ecfcfcb..44ff3114c112 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -221,134 +221,62 @@ static __always_inline int variable_fls(unsigned int x)
 #define __NOP(x)	(x)
 #define __NOT(x)	(~(x))
 
-/**
- * test_and_set_bit - Set a bit and return its old value
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation may be reordered on other architectures than x86.
- */
-static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(or, __NOP, nr, addr);
 }
 
-/**
- * test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
- * @addr: Address to count from
- *
- * This operation can be reordered on other architectures other than x86.
- */
-static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(and, __NOT, nr, addr);
 }
 
-/**
- * test_and_change_bit - Change a bit and return its old value
- * @nr: Bit to change
- * @addr: Address to count from
- *
- * This operation is atomic and cannot be reordered.
- * It also implies a memory barrier.
- */
-static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(xor, __NOP, nr, addr);
 }
 
-/**
- * set_bit - Atomically set a bit in memory
- * @nr: the bit to set
- * @addr: the address to start counting from
- *
- * Note: there are no guarantees that this function will not be reordered
- * on non x86 architectures, so if you are writing portable code,
- * make sure not to rely on its reordering guarantees.
- *
- * Note that @nr may be almost arbitrarily large; this function is not
- * restricted to acting on a single-word quantity.
- */
-static inline void set_bit(int nr, volatile unsigned long *addr)
+static inline void arch_set_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(or, __NOP, nr, addr);
 }
 
-/**
- * clear_bit - Clears a bit in memory
- * @nr: Bit to clear
- * @addr: Address to start counting from
- *
- * Note: there are no guarantees that this function will not be reordered
- * on non x86 architectures, so if you are writing portable code,
- * make sure not to rely on its reordering guarantees.
- */
-static inline void clear_bit(int nr, volatile unsigned long *addr)
+static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(and, __NOT, nr, addr);
 }
 
-/**
- * change_bit - Toggle a bit in memory
- * @nr: Bit to change
- * @addr: Address to start counting from
- *
- * change_bit()  may be reordered on other architectures than x86.
- * Note that @nr may be almost arbitrarily large; this function is not
- * restricted to acting on a single-word quantity.
- */
-static inline void change_bit(int nr, volatile unsigned long *addr)
+static inline void arch_change_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(xor, __NOP, nr, addr);
 }
 
-/**
- * test_and_set_bit_lock - Set a bit and return its old value, for lock
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation is atomic and provides acquire barrier semantics.
- * It can be used to implement bit locks.
- */
-static inline int test_and_set_bit_lock(
+static inline int arch_test_and_set_bit_lock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
 }
 
-/**
- * clear_bit_unlock - Clear a bit in memory, for unlock
- * @nr: the bit to set
- * @addr: the address to start counting from
- *
- * This operation is atomic and provides release barrier semantics.
- */
-static inline void clear_bit_unlock(
+static inline void arch_clear_bit_unlock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	__op_bit_ord(and, __NOT, nr, addr, .rl);
 }
 
 /**
- * __clear_bit_unlock - Clear a bit in memory, for unlock
- * @nr: the bit to set
- * @addr: the address to start counting from
+ * arch___clear_bit_unlock - Clear a bit in memory, for unlock
  *
- * This operation is like clear_bit_unlock, however it is not atomic.
- * It does provide release barrier semantics so it can be used to unlock
- * a bit lock, however it would only be used if no other CPU can modify
- * any bits in the memory until the lock is released (a good example is
- * if the bit lock itself protects access to the other bits in the word).
+ * This should not be used directly, use the instrumented __clear_bit_unlock
+ * instead. See asm-generic/bitops/instrumented-lock.h
  *
  * On RISC-V systems there seems to be no benefit to taking advantage of the
  * non-atomic property here: it's a lot more instructions and we still have to
  * provide release semantics anyway.
  */
-static inline void __clear_bit_unlock(
+static inline void arch___clear_bit_unlock(
 	unsigned long nr, volatile unsigned long *addr)
 {
-	clear_bit_unlock(nr, addr);
+	arch_clear_bit_unlock(nr, addr);
 }
 
 static inline bool xor_unlock_is_negative_byte(unsigned long mask,
@@ -369,6 +297,8 @@ static inline bool xor_unlock_is_negative_byte(unsigned long mask,
 #undef __NOT
 #undef __AMO
 
+#include <asm-generic/bitops/instrumented-atomic.h>
+#include <asm-generic/bitops/instrumented-lock.h>
 #include <asm-generic/bitops/non-atomic.h>
 #include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/ext2-atomic.h>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
