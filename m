Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC8C04FDF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcxJWYG9UbomtgCR+3W5Op5SwWjBjms4g+WpxS2pbfk=; b=K6zT5XJOXp0+ax
	G/md7xUcTu0ob3oL5rc/aeDP/IAh9cBF79BtmKGcGENVs5guaHRXTFehioEC7WfXtc3kqPiR9wecR
	sm/LcQt5lM2NytvrR9NS8Z6tRutKzUFE2AK+Eu+FDEgXg51/AAvy83a/+Ak4CVkz5N3nXl2xwFhwm
	AzSZs6cYzjbpqIOqZPzmjYMugOkPVDprQVUeoFwoYcE86qgXvupOYmEezkdMHIbn6mNgUS0VLFgz4
	dMZ4CC2KFjpthlWpZKeEDXGA+oG7IKMPZGHuzlDw5FK7/xPr3jookCkEF7dtrnbX0xljQQopImbLz
	e28WgdCbz5TNgMbx+N7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF4N-005PRZ-01;
	Wed, 02 Aug 2023 16:51:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF4J-005PPz-2j
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 16:51:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54C1C61904;
	Wed,  2 Aug 2023 16:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B42C433C8;
	Wed,  2 Aug 2023 16:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995086;
	bh=1/GsGHwmBv8uH+dMkqUv9IEb/BPlKAA9d7hlqgNtS/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WjEKhwxTykGowm9ZIjdHGLeI/AhTS0fwaekb++vJl1EBhZj0uTbvwoTA6Nva8ivX/
	 VavcZY4KiNAy1NF8+diCDFt3/LnkTYMsCc5vgegL3MI9LGArnb96JGQtIZm9D6hCHV
	 iy1r+Fg6640k5qONYfPBeFyx25cFaoF799+WquNgLGDLeus6Vzl0wEgr35NwYJzQTl
	 xWLjI9wCXkHllFQXic4zh6NB3qBQ746warrABJTL9JMCj64UsNKKC8uJX2otK6yblb
	 JxNUFElHUiNTPpBqwJCePYvh83fH5f/4baqwXva0qpsFD/AJy3kqRerGvW5Brm0E2Y
	 M3uIfGIt6q+QA==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	anup@brainfault.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	palmer@rivosinc.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	tglx@linutronix.de,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	rdunlap@infradead.org,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	keescook@chromium.org,
	greentime.hu@sifive.com,
	ajones@ventanamicro.com,
	jszhang@kernel.org,
	wefu@redhat.com,
	wuwei2016@iscas.ac.cn
Cc: linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V10 14/19] RISC-V: paravirt: pvqspinlock: Add xchg8 & cmpxchg_small support
Date: Wed,  2 Aug 2023 12:46:56 -0400
Message-Id: <20230802164701.192791-15-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230802164701.192791-1-guoren@kernel.org>
References: <20230802164701.192791-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095127_988933_AF3D221A 
X-CRM114-Status: GOOD (  11.63  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The pvqspinlock needs additional sub-word atomic operations. Here
is the list:
 - xchg8 (RCsc)
 - cmpxchg8/16_relaxed
 - cmpxchg8/16_release (Rcpc)
 - cmpxchg8_acquire (RCpc)
 - cmpxchg8 (RCsc)

Although paravirt qspinlock doesn't have the native_qspinlock
fairness, giving a strong forward progress guarantee to these
atomic semantics could prevent unnecessary tries, which would
cause cache line bouncing.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 177 +++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 3ab37215ed86..2fd797c04e7a 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -103,12 +103,37 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 					    _x_, sizeof(*(ptr)));	\
 })
 
+static inline ulong __xchg8(ulong new, void *ptr)
+{
+	ulong ret, tmp;
+	ulong shif = ((ulong)ptr & 3) * 8;
+	ulong mask = 0xff << shif;
+	ulong *__ptr = (ulong *)((ulong)ptr & ~3);
+
+	__asm__ __volatile__ (
+		"0:	lr.w %0, %2\n"
+		"	and  %1, %0, %z3\n"
+		"	or   %1, %1, %z4\n"
+		"	sc.w.rl %1, %1, %2\n"
+		"	bnez %1, 0b\n"
+			"fence w, rw\n"
+		: "=&r" (ret), "=&r" (tmp), "+A" (*__ptr)
+		: "rJ" (~mask), "rJ" (new << shif)
+		: "memory");
+
+	return (ulong)((ret & mask) >> shif);
+}
+
 #define __arch_xchg(ptr, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(new) __new = (new);					\
 	__typeof__(*(ptr)) __ret;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))				\
+			__xchg8((ulong)__new, __ptr);			\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"	amoswap.w.aqrl %0, %2, %1\n"		\
@@ -140,6 +165,51 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
+static inline ulong __cmpxchg_small_relaxed(void *ptr, ulong old,
+					    ulong new, ulong size)
+{
+	ulong shift;
+	ulong ret, mask, temp;
+	volatile ulong *ptr32;
+
+	/* Mask inputs to the correct size. */
+	mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);
+	old &= mask;
+	new &= mask;
+
+	/*
+	 * Calculate a shift & mask that correspond to the value we wish to
+	 * compare & exchange within the naturally aligned 4 byte integer
+	 * that includes it.
+	 */
+	shift = (ulong)ptr & 0x3;
+	shift *= BITS_PER_BYTE;
+	old <<= shift;
+	new <<= shift;
+	mask <<= shift;
+
+	/*
+	 * Calculate a pointer to the naturally aligned 4 byte integer that
+	 * includes our byte of interest, and load its value.
+	 */
+	ptr32 = (volatile ulong *)((ulong)ptr & ~0x3);
+
+	__asm__ __volatile__ (
+		"0:	lr.w %0, %2\n"
+		"	and  %1, %0, %z3\n"
+		"	bne  %1, %z5, 1f\n"
+		"	and  %1, %0, %z4\n"
+		"	or   %1, %1, %z6\n"
+		"	sc.w %1, %1, %2\n"
+		"	bnez %1, 0b\n"
+		"1:\n"
+		: "=&r" (ret), "=&r" (temp), "+A" (*ptr32)
+		: "rJ" (mask), "rJ" (~mask), "rJ" (old), "rJ" (new)
+		: "memory");
+
+	return (ret & mask) >> shift;
+}
+
 #define __cmpxchg_relaxed(ptr, old, new, size)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -148,6 +218,11 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))				\
+			__cmpxchg_small_relaxed(__ptr, (ulong)__old,	\
+					(ulong)__new, (ulong)size);	\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -184,6 +259,52 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 					_o_, _n_, sizeof(*(ptr)));	\
 })
 
+static inline ulong __cmpxchg_small_acquire(void *ptr, ulong old,
+					    ulong new, ulong size)
+{
+	ulong shift;
+	ulong ret, mask, temp;
+	volatile ulong *ptr32;
+
+	/* Mask inputs to the correct size. */
+	mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);
+	old &= mask;
+	new &= mask;
+
+	/*
+	 * Calculate a shift & mask that correspond to the value we wish to
+	 * compare & exchange within the naturally aligned 4 byte integer
+	 * that includes it.
+	 */
+	shift = (ulong)ptr & 0x3;
+	shift *= BITS_PER_BYTE;
+	old <<= shift;
+	new <<= shift;
+	mask <<= shift;
+
+	/*
+	 * Calculate a pointer to the naturally aligned 4 byte integer that
+	 * includes our byte of interest, and load its value.
+	 */
+	ptr32 = (volatile ulong *)((ulong)ptr & ~0x3);
+
+	__asm__ __volatile__ (
+		"0:	lr.w %0, %2\n"
+		"	and  %1, %0, %z3\n"
+		"	bne  %1, %z5, 1f\n"
+		"	and  %1, %0, %z4\n"
+		"	or   %1, %1, %z6\n"
+		"	sc.w %1, %1, %2\n"
+		"	bnez %1, 0b\n"
+		RISCV_ACQUIRE_BARRIER
+		"1:\n"
+		: "=&r" (ret), "=&r" (temp), "+A" (*ptr32)
+		: "rJ" (mask), "rJ" (~mask), "rJ" (old), "rJ" (new)
+		: "memory");
+
+	return (ret & mask) >> shift;
+}
+
 #define __cmpxchg_acquire(ptr, old, new, size)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -192,6 +313,12 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+	case 2:								\
+		__ret = (__typeof__(*(ptr)))				\
+			__cmpxchg_small_acquire(__ptr, (ulong)__old,	\
+					(ulong)__new, (ulong)size);	\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
@@ -230,6 +357,51 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 					_o_, _n_, sizeof(*(ptr)));	\
 })
 
+static inline ulong __cmpxchg_small(void *ptr, ulong old,
+				    ulong new, ulong size)
+{
+	ulong shift;
+	ulong ret, mask, temp;
+	volatile ulong *ptr32;
+
+	/* Mask inputs to the correct size. */
+	mask = GENMASK((size * BITS_PER_BYTE) - 1, 0);
+	old &= mask;
+	new &= mask;
+
+	/*
+	 * Calculate a shift & mask that correspond to the value we wish to
+	 * compare & exchange within the naturally aligned 4 byte integer
+	 * that includes it.
+	 */
+	shift = (ulong)ptr & 0x3;
+	shift *= BITS_PER_BYTE;
+	old <<= shift;
+	new <<= shift;
+	mask <<= shift;
+
+	/*
+	 * Calculate a pointer to the naturally aligned 4 byte integer that
+	 * includes our byte of interest, and load its value.
+	 */
+	ptr32 = (volatile ulong *)((ulong)ptr & ~0x3);
+
+	__asm__ __volatile__ (
+		"0:	lr.w %0, %2\n"
+		"	and  %1, %0, %z3\n"
+		"	bne  %1, %z5, 1f\n"
+		"	and  %1, %0, %z4\n"
+		"	or   %1, %1, %z6\n"
+		"	sc.w.rl %1, %1, %2\n"
+		"	bnez %1, 0b\n"
+		"	fence w, rw\n"
+		"1:\n"
+		: "=&r" (ret), "=&r" (temp), "+A" (*ptr32)
+		: "rJ" (mask), "rJ" (~mask), "rJ" (old), "rJ" (new)
+		: "memory");
+
+	return (ret & mask) >> shift;
+}
 #define __cmpxchg(ptr, old, new, size)					\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
@@ -238,6 +410,11 @@ static inline ulong __xchg16_relaxed(ulong new, void *ptr)
 	__typeof__(*(ptr)) __ret;					\
 	register unsigned int __rc;					\
 	switch (size) {							\
+	case 1:								\
+		__ret = (__typeof__(*(ptr)))				\
+			__cmpxchg_small(__ptr, (ulong)__old,		\
+					(ulong)__new, (ulong)size);	\
+		break;							\
 	case 4:								\
 		__asm__ __volatile__ (					\
 			"0:	lr.w %0, %2\n"				\
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
