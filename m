Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2D4CD8C9D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AuMwHBAYqf8iz9lLCWPhgmyC1kdbXn943WDSl/CSVCc=; b=DUE/NNimaB3+Qn
	YMJrhegN05IxJ9VdhJcgdOl4qPxveemzzIcFFjmfyo+/qTHG790DJBA+cS9LSiXKPR8CF9UP8kawr
	jbZUdUgPUzj0qvhyCl4w/9aTyMjWDN4CsKOHg/W8wtdXMGgoKohHWiFzovpjGKVhSMfDxlrisVQni
	qOLEuenGHVY3JcG1CO8FIsh/eNIs3EkWelyc8y0/q2LezsjzLWQqAtO5y9gIx+jpOEGs9wBzX2z0X
	KdIiHJCdaHwF61cSkNHfp4+eOdnb+WGcl2g+grxSsynccnKypHAej8/3vyy2J2KfxQid06PdnJRRb
	6cJyYfofnJSPAhex3Elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcHe-000000040PT-3Iwu;
	Mon, 08 Jun 2026 15:53:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcHc-000000040Oc-1ERP
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 15:53:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0bd02d97eso52031215ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jun 2026 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780933979; x=1781538779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVMcV2amC0zCzG7WFGyPAc9k2b2Mh+czO6Q9ao0kqOA=;
        b=S+wUasjNQWwXHwWEl1JvjVhSr894TQHrAN9SgVkUII6HAepPNNQ0bD5jZ4jq17j/F/
         l45bfbzlKEmIXdArw2MO+YRX7pb2zmlNZtkxLyBgtHA6I4D+KWK351/4M2UkESsHZehj
         SlK/mRlhcb0g80jZsT65b6eYtC3aU0tMpu7MRnUnT1h+l+9GuRzKlLw1PmTQQ0dayuXP
         DNycsqbNYj/qnSg3I1AtPXqQ8V5RvlR1TW7EX14UUR5Ds1VnV6CzUwn75RSXcbuIvtDr
         GcyNl1Yfxg8ilZG9jb5ue8kxhtC0tQ5COWQdtqGDpPpC78Olg2RmXJSGBXlJBwdYOy4d
         4EjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933979; x=1781538779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVMcV2amC0zCzG7WFGyPAc9k2b2Mh+czO6Q9ao0kqOA=;
        b=kVp/z7cEXR3MxIsKf2o0pxRDYTQlI9ZG3Qqq2wowA/O3Mmm5IrQr6w+1NseWW/5H+L
         G4fgqZ7YsfIRB1mxX4tTB/HBNyJ2Docviu786s9UAkqfIlJPKPBVKfjELB0oBGPopg5k
         hjnPb3y8Cl5B5vZEhY5MjRds4mC8w3DpiyK4MlPJWB3AA/e6/NXwm75eDNRwWNbTwb6Y
         8vlNdMtOlBRN4GbvMbzxuF36fKsiSnkEjvpPSeWooE9g3fLrBqlxaUADXy7on1cgWXEb
         Z8rfD7ef5qBr2KznDR2iGGq3T7QzDHzRnG1v4QZsL91sI6kfo2utKHERe89AhAtbQlUG
         Rv7g==
X-Forwarded-Encrypted: i=1; AFNElJ+hIYazFmJ4sQq7cGtBUySrokGhbpp4bCAghmzdXVE+cNDzWRfPvK0t+GxN+hUEOWOP+0NAcWuYP9IazQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwdxP5yHn4SS668sw2a38OfM2ZPDQSNWaUFalBe/MK9qrA+wi3
	NdwSdezc5TyOV0s4tm7pyj5djOqxhXr0gScDAOlRZVbaYE8NPyWZhjFs
X-Gm-Gg: Acq92OEVoW14Py8zVZCISOgsb02z+RmZkD5Q+lVsZNIgCpoPAhmtI+mglot3eWF8miV
	lcmmydw21dNUsvas/d05JTFv6MvPM9fauMlW7ZjnAo4UXLMIjU2Sh1yJI7gra9xl31pF1tsZw/U
	b1jw2CrT95gZWcwnEB89nnRai57BRaYqKFMKH5yg6WTOlD4m0+d9hvbS+yqqmem+bj8sAxf13Tv
	+9ucXdTunvEGKEUCeJA8zuyKs9FAHWWj8Jn05nX7E4Cg3UTDrwfqO+mkDK3bgvlEppOsE5eLzJ+
	mYxoZs+tjR8icbHDL2Qw+wuG7gRnQIwmoBmj345xkx8yujxvujv/tTv2z6heW6i03d2SITU8Qau
	GqHL2R6Qbjrcu7kKM7+MN59209EQYGVrD9dTexqd1CUj4hkGoHc7L7Agua8JwdU28O+og1JKbCW
	/OyJTxil8gmKj4YVhetna2pYc7FRdQqnSnkNC6kI9tLxsLKg88i6oXzisquBaXrY9WoqQ/0coa4
	MFP01zhP67X36LoSq6/4KT8x9r8ZchbKRpWAYj7Rg==
X-Received: by 2002:a17:902:ce92:b0:2c0:db23:4a4 with SMTP id d9443c01a7336-2c1e85d210amr175246605ad.36.1780933979031;
        Mon, 08 Jun 2026 08:52:59 -0700 (PDT)
Received: from LAPTOP-M4N25KQ5.tail73068d.ts.net (1-160-247-151.dynamic-ip.hinet.net. [1.160.247.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664ad138sm192371645ad.82.2026.06.08.08.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:52:58 -0700 (PDT)
From: Sean Chang <seanwascoding@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Chang <seanwascoding@gmail.com>
Subject: [PATCH v1] riscv: kvm: Use endian-specific __lelong for NACL shared memory
Date: Mon,  8 Jun 2026 23:52:52 +0800
Message-ID: <20260608155252.4292-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_085300_337759_C8664E73 
X-CRM114-Status: GOOD (  13.33  )
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

When compiling with sparse enabled (C=2), bitwise type warnings are
triggered in the RISC-V KVM implementation. This occurs because the
user-space data unboxing macro '__get_user_asm' performs implicit
casting on restricted types without forcing the compiler's compliance.

Additionally, raw 'unsigned long *' pointers are used to access the
SBI NACL shared memory, whereas the RISC-V SBI specification mandates
that these structures must follow little-endian byte ordering.

Fix these by:
1. Adding a '__force' cast to '__get_user_asm()' to safely suppress
   implicit cast warnings during user-space data fetching.
2. Introducing the '__lelong' type macro, which dynamically resolves to
   '__le32' or '__le64' depending on XLEN, and replacing 'unsigned long *'
   with '__lelong *' to enforce proper compile-time endianness checks.

Signed-off-by: Sean Chang <seanwascoding@gmail.com>
---
 arch/riscv/include/asm/kvm_nacl.h | 14 ++++++++------
 arch/riscv/include/asm/uaccess.h  |  2 +-
 arch/riscv/kvm/nacl.c             |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_nacl.h b/arch/riscv/include/asm/kvm_nacl.h
index 4124d5e06a0f..f45407bcaa26 100644
--- a/arch/riscv/include/asm/kvm_nacl.h
+++ b/arch/riscv/include/asm/kvm_nacl.h
@@ -60,9 +60,11 @@ int kvm_riscv_nacl_init(void);
 #ifdef CONFIG_32BIT
 #define lelong_to_cpu(__x)	le32_to_cpu(__x)
 #define cpu_to_lelong(__x)	cpu_to_le32(__x)
+#define __lelong                __le32
 #else
 #define lelong_to_cpu(__x)	le64_to_cpu(__x)
 #define cpu_to_lelong(__x)	cpu_to_le64(__x)
+#define __lelong                __le64
 #endif
 
 #define nacl_shmem()							\
@@ -70,7 +72,7 @@ int kvm_riscv_nacl_init(void);
 
 #define nacl_scratch_read_long(__shmem, __offset)			\
 ({									\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	lelong_to_cpu(*__p);						\
@@ -78,7 +80,7 @@ int kvm_riscv_nacl_init(void);
 
 #define nacl_scratch_write_long(__shmem, __offset, __val)		\
 do {									\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	*__p = cpu_to_lelong(__val);					\
@@ -87,7 +89,7 @@ do {									\
 #define nacl_scratch_write_longs(__shmem, __offset, __array, __count)	\
 do {									\
 	unsigned int __i;						\
-	unsigned long *__p = (__shmem) +				\
+	__lelong *__p = (__shmem) +					\
 			     SBI_NACL_SHMEM_SCRATCH_OFFSET +		\
 			     (__offset);				\
 	for (__i = 0; __i < (__count); __i++)				\
@@ -168,7 +170,7 @@ __kvm_riscv_nacl_hfence(__shmem,					\
 
 #define nacl_csr_read(__shmem, __csr)					\
 ({									\
-	unsigned long *__a = (__shmem) + SBI_NACL_SHMEM_CSR_OFFSET;	\
+	__lelong *__a = (__shmem) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	lelong_to_cpu(__a[SBI_NACL_SHMEM_CSR_INDEX(__csr)]);		\
 })
 
@@ -176,7 +178,7 @@ __kvm_riscv_nacl_hfence(__shmem,					\
 do {									\
 	void *__s = (__shmem);						\
 	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
-	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	__lelong *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
 	__a[__i] = cpu_to_lelong(__val);				\
 	__b[__i >> 3] |= 1U << (__i & 0x7);				\
@@ -186,7 +188,7 @@ do {									\
 ({									\
 	void *__s = (__shmem);						\
 	unsigned int __i = SBI_NACL_SHMEM_CSR_INDEX(__csr);		\
-	unsigned long *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
+	__lelong *__a = (__s) + SBI_NACL_SHMEM_CSR_OFFSET;		\
 	u8 *__b = (__s) + SBI_NACL_SHMEM_DBITMAP_OFFSET;		\
 	unsigned long __r = lelong_to_cpu(__a[__i]);			\
 	__a[__i] = cpu_to_lelong(__val);				\
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 11c9886c3b70..5d4ec15584cf 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -112,7 +112,7 @@ do {								\
 		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
 		: "=&r" (__tmp)					\
 		: "m" (*(ptr)) : : label);			\
-	(x) = (__typeof__(x))(unsigned long)__tmp;		\
+	(x) = (__force __typeof__(x))(unsigned long)__tmp;	\
 } while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_asm(insn, x, ptr, label)			\
diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 08a95ad9ada2..6f9f8963e9dd 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -20,7 +20,7 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 			     unsigned long page_count)
 {
 	int i, ent = -1, try_count = 5;
-	unsigned long *entp;
+	__lelong *entp;
 
 again:
 	for (i = 0; i < SBI_NACL_SHMEM_HFENCE_ENTRY_MAX; i++) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
