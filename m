Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48215C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts9Ce6O1yX7pvjCTk/y0cL7zAoUQ7AjU7a5Z3Nc0J7I=; b=EIJ4JxQS+IMLL1
	pOdFRHTswN8x8ZKuFxySgzNy9wnjzwonY2n56022WQg2cXN68cD7M02S9RW/m+NsSM0X0DkCy0gie
	aIs8Ik7VwoPWfVGksWlASGxu0sKcsvjtMydcgeS58r8zRG2hKkMJ3rTh1jq7xPp1hploFIpmql7jA
	O1OZmS3opYJjaBDQDPdj9TnSlH59bSOXpkbyCFfyN+vpkEo6NgLr3toUvgXvkgf4ajOOd2YWKeS7g
	huh9DUnsSNU5kqnqpQyWxd1Kz/dk37eTjI32A3FecnwNouGAp7nmoO2bRdy1Ty18e2LdL04H1Is6w
	0ZRHMT5c3FQKk60lcAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMdF-00000003avs-0qIH;
	Thu, 01 Aug 2024 03:37:37 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMd9-00000003atv-33gn
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 03:37:33 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7093705c708so6610945a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 20:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1722483450; x=1723088250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msVGAs2Ent9MgPGCzZ9Uq7gVj0jWgfLK/XRk8zdKP5o=;
        b=QYmzkHDDsnXmJro+asK5elKdXusjW3miDbVsEqspMoaQrMkdnpktNatpuxDQskI4aO
         Bm8MSnLF+XyWdXEmbMHMWj0SZfclifbMuRUeXH3KRy5u4e0NtVgUul+km5GLOIRfvx1J
         rT6NljXqCK/ImVJ6eLdOhBULK3Bq7AQwmcMfMeweNzaAaDuxFSnJw+xX+DFoQKFhUg+Z
         KQmMaC1+6jmCkp5+YUJIDXIk6mi68DBoRHchFAuUvnO/EW7JBCRWsfo2cjpcFwrmi8Nd
         7tCFocwd7bKPQOY7SbvvNLb1FB4o3RbE+0R0S34oWtcBAYX8s733Q1LcZ7W+N46gCeGs
         pgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722483450; x=1723088250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msVGAs2Ent9MgPGCzZ9Uq7gVj0jWgfLK/XRk8zdKP5o=;
        b=AcJrEvEKaraUOyHEIEp+8O2bOg/8LirRF6GSesYlwPoPO/YSggAfSjur0h8nEa6EKK
         c00XjxiKcYULxKp1ArVRuCSUsKZ/j776IZ8m5j1S47Ah3Sxc6ITUlwEg8RIYzTtEYbRz
         d8tZuXIK1kzphHfWF2COrBEq52GICVsu2BA/oW/UZ/fq8JXT5GqWG62gU3NPUlM89PB4
         rWn4o+EAokCnPi7qpFVx6BCWDFa0Og1PvcjytjItMn/dsrsg5Ur7mpCueSAZNnt7Hg6L
         z81FDtbJqkRE+xU5E2tzYbTXatSmQA3TAhn0n2SCMkiBELQMTVbWjYFzZAmbHcd2GTQG
         z5og==
X-Forwarded-Encrypted: i=1; AJvYcCX2E/N0flKgbgwpUxXyT3c1x9SdUsW0XcPyvHNQnHBu5SOpWHvoWgRKQ955dREo6E7DiTLqsciBETgAl8bCx1PbQuqzDaonqbBq/oOk3Zwu
X-Gm-Message-State: AOJu0YxAeo5L6htsoA+09tsFucdNi4zgybRszx59HtKiJEghLo9uTq/x
	Vpo4d/vxxQSx90ya71lj9JFE5uWU0dMAvyndDsUTWoJyjU9GbgHOtwALgcVRrJk=
X-Google-Smtp-Source: AGHT+IGP40Ax3lzWFlCGU0aTP1HPnWbwedEDfA5dMJhXTXtH06+s5sdbGtwoQDQnLakNYH4zfh8i/Q==
X-Received: by 2002:a05:6830:6189:b0:702:1dec:c8a0 with SMTP id 46e09a7af769-7096b7ae351mr1395710a34.6.1722483450554;
        Wed, 31 Jul 2024 20:37:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ae3asm10954457b3a.91.2024.07.31.20.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:37:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/2] riscv: Enable bitops instrumentation
Date: Wed, 31 Jul 2024 20:37:00 -0700
Message-ID: <20240801033725.28816-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240801033725.28816-1-samuel.holland@sifive.com>
References: <20240801033725.28816-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_203731_791787_21E08802 
X-CRM114-Status: GOOD (  13.32  )
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

Instead of implementing the bitops functions directly in assembly,
provide the arch_-prefixed versions and use the wrappers from
asm-generic to add instrumentation. This improves KASAN coverage and
fixes the kasan_bitops_generic() unit test.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/bitops.h | 43 ++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 71af9ecfcfcb..fae152ea0508 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -222,44 +222,44 @@ static __always_inline int variable_fls(unsigned int x)
 #define __NOT(x)	(~(x))
 
 /**
- * test_and_set_bit - Set a bit and return its old value
+ * arch_test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
  * This operation may be reordered on other architectures than x86.
  */
-static inline int test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(or, __NOP, nr, addr);
 }
 
 /**
- * test_and_clear_bit - Clear a bit and return its old value
+ * arch_test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
  * @addr: Address to count from
  *
  * This operation can be reordered on other architectures other than x86.
  */
-static inline int test_and_clear_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(and, __NOT, nr, addr);
 }
 
 /**
- * test_and_change_bit - Change a bit and return its old value
+ * arch_test_and_change_bit - Change a bit and return its old value
  * @nr: Bit to change
  * @addr: Address to count from
  *
  * This operation is atomic and cannot be reordered.
  * It also implies a memory barrier.
  */
-static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
+static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(xor, __NOP, nr, addr);
 }
 
 /**
- * set_bit - Atomically set a bit in memory
+ * arch_set_bit - Atomically set a bit in memory
  * @nr: the bit to set
  * @addr: the address to start counting from
  *
@@ -270,13 +270,13 @@ static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
  * Note that @nr may be almost arbitrarily large; this function is not
  * restricted to acting on a single-word quantity.
  */
-static inline void set_bit(int nr, volatile unsigned long *addr)
+static inline void arch_set_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(or, __NOP, nr, addr);
 }
 
 /**
- * clear_bit - Clears a bit in memory
+ * arch_clear_bit - Clears a bit in memory
  * @nr: Bit to clear
  * @addr: Address to start counting from
  *
@@ -284,13 +284,13 @@ static inline void set_bit(int nr, volatile unsigned long *addr)
  * on non x86 architectures, so if you are writing portable code,
  * make sure not to rely on its reordering guarantees.
  */
-static inline void clear_bit(int nr, volatile unsigned long *addr)
+static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(and, __NOT, nr, addr);
 }
 
 /**
- * change_bit - Toggle a bit in memory
+ * arch_change_bit - Toggle a bit in memory
  * @nr: Bit to change
  * @addr: Address to start counting from
  *
@@ -298,40 +298,40 @@ static inline void clear_bit(int nr, volatile unsigned long *addr)
  * Note that @nr may be almost arbitrarily large; this function is not
  * restricted to acting on a single-word quantity.
  */
-static inline void change_bit(int nr, volatile unsigned long *addr)
+static inline void arch_change_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(xor, __NOP, nr, addr);
 }
 
 /**
- * test_and_set_bit_lock - Set a bit and return its old value, for lock
+ * arch_test_and_set_bit_lock - Set a bit and return its old value, for lock
  * @nr: Bit to set
  * @addr: Address to count from
  *
  * This operation is atomic and provides acquire barrier semantics.
  * It can be used to implement bit locks.
  */
-static inline int test_and_set_bit_lock(
+static inline int arch_test_and_set_bit_lock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
 }
 
 /**
- * clear_bit_unlock - Clear a bit in memory, for unlock
+ * arch_clear_bit_unlock - Clear a bit in memory, for unlock
  * @nr: the bit to set
  * @addr: the address to start counting from
  *
  * This operation is atomic and provides release barrier semantics.
  */
-static inline void clear_bit_unlock(
+static inline void arch_clear_bit_unlock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	__op_bit_ord(and, __NOT, nr, addr, .rl);
 }
 
 /**
- * __clear_bit_unlock - Clear a bit in memory, for unlock
+ * arch___clear_bit_unlock - Clear a bit in memory, for unlock
  * @nr: the bit to set
  * @addr: the address to start counting from
  *
@@ -345,13 +345,13 @@ static inline void clear_bit_unlock(
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
 
-static inline bool xor_unlock_is_negative_byte(unsigned long mask,
+static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
 	unsigned long res;
@@ -369,6 +369,9 @@ static inline bool xor_unlock_is_negative_byte(unsigned long mask,
 #undef __NOT
 #undef __AMO
 
+#include <asm-generic/bitops/instrumented-atomic.h>
+#include <asm-generic/bitops/instrumented-lock.h>
+
 #include <asm-generic/bitops/non-atomic.h>
 #include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/ext2-atomic.h>
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
