Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E83AEB8FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 04:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hAB2WBPsgPGsotgjpQ3tko3ok01zv8ssGCPVrGh/gA=; b=v9Bubb/6QJiwDn
	ukb7z35UqAwRrHdKOkeG3LA/GNBIaE6NkuF1AQaTvYqRfbA0A6vy6PILFusueR+7cOzXWbk4OnRCV
	H+N0p49fVMb5ui7lO+xT44qBg2hdSJ6qDDSgJge7qbl045eLnqJUloP4K/UbHeXX2qW6pbZJTqkDQ
	buhPCTklinJqYjYnC1XlLpD/LwmNxSFXF1Ktaz711KdzT5yu4TvCwVr7ZKR+ZLOLHaBED3cUSbKRg
	eAIO5J+ROteb7LlI7fVMuhQpEu/hiGkT4/y4TGhIgnxVxXZm60hiXjAHHStMJGHh0VEC/V6wSbhBw
	MzhPofMQwg687N/oudEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRo-007Fbp-34;
	Wed, 06 Sep 2023 04:47:24 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRi-007FYp-2m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 04:47:22 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bdf4752c3cso19550965ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 21:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693975633; x=1694580433; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZKCot4vQgfBzQdTs72aF/Oh78uNBB1lCJbD+oQFEek=;
        b=IznBw5eXdXI7fqtAtOx5msAr7Q4f1VV2SuJKwSrbAjY0IcurpId/Y6GhuShT/y9Evz
         AF//SauxalyAZ2yBK56ScFbECiqWu20PoFcVhIbwE3CG7P5YPVQVVbXVBoTnAal8g8Oz
         Qes/SI0d/ObI8NwDRCHD0atGm3XJUO5EG38u+2ARBdSrV4hAyvi8KCYh2Vw6mFa/XpyN
         LQqoM4k3g7YCzlnXqqY3SQxCC1mXNF/PhYxNmIicvO2uB/aNEs8PLmAS3w2StmjTB9Ps
         snowWQcPf8y9iG+0zI+yKGIfiMKtzzT2ns8vUIgQl5cN7XTJZLx4bi3MfUdFx6bfMIti
         R75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693975633; x=1694580433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZKCot4vQgfBzQdTs72aF/Oh78uNBB1lCJbD+oQFEek=;
        b=FCZnfFoVky8HlJiQqSzP8Y0G8Pr5681RaB8T9So8+2GAJQ8i+bmAq5ITxnfiiLvfsX
         95EIrBwFPtCSDG4qq5Z3bGn/0QzlDW40dx7ygzKYMITuNbIYckDNx4uxzQ9tfqq5+UvX
         F4yuf01p23nMGHbnGcN4y+DWGn3q/fs3GFqvhh208L0bdnpbPKbvt+li93eVyQEIxKrP
         sREXEjhwpEEBY33FRUSLS5c3CXV8CaHrMbvUvmeYwiWIZ5YeRUj0TBhz8VxIxkOrgvcR
         aZH0wnmdSLkHJ0dfEl4KuGxQ1fWm8MF8oDDwliCNLRc19VuAkG1yLNzPyBuChkZm3HLI
         +8Pw==
X-Gm-Message-State: AOJu0YyT1rYJbvAI2GtNOGrX+GBcPhU4QUtebjYrD8jMJftc25HYH/az
	4zeBWNc3bE/hXz0Yc7xQyvqzkRcvnsiG7TjcHVo=
X-Google-Smtp-Source: AGHT+IEVCzVz76gakebkUF90S+0lDOKknfZ0EKcnTgEvvECMQ2CLHVZVR++XrSEjTLxDg7ABbk2nDQ==
X-Received: by 2002:a17:903:247:b0:1bd:d14a:7e14 with SMTP id j7-20020a170903024700b001bdd14a7e14mr14329922plh.65.1693975633489;
        Tue, 05 Sep 2023 21:47:13 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001bc56c1a384sm10087313plt.277.2023.09.05.21.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:47:12 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 05 Sep 2023 21:46:51 -0700
Subject: [PATCH v2 2/5] riscv: Add checksum library
MIME-Version: 1.0
Message-Id: <20230905-optimize_checksum-v2-2-ccd658db743b@rivosinc.com>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
In-Reply-To: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_214718_900221_25603F35 
X-CRM114-Status: GOOD (  24.85  )
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

Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
will load from the buffer in groups of 32 bits, and when compiled for
64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
csum_ipv6_magic (64-bit version) for an x86 chip as well as running
the riscv generated code in QEMU, discovered that summing in a
tree-like structure is about 4% faster than doing 64-bit reads.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h |  11 ++
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/csum.c             | 227 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 239 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 573714b9ea15..3f9d5a202e95 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -16,6 +16,14 @@ typedef unsigned int csum_t;
 typedef unsigned long csum_t;
 #endif
 
+/* Default version is sufficient for 32 bit */
+#ifdef CONFIG_64BIT
+#define _HAVE_ARCH_IPV6_CSUM
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum sum);
+#endif
+
 /*
  *	Fold a partial checksum without adding pseudo headers
  */
@@ -91,6 +99,9 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 
 #define ip_fast_csum ip_fast_csum
 
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
+
 #include <asm-generic/checksum.h>
 
 #endif // __ASM_RISCV_CHECKSUM_H
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 26cb2502ecf8..2aa1a4ad361f 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -6,6 +6,7 @@ lib-y			+= memmove.o
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
+lib-y			+= csum.o
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
new file mode 100644
index 000000000000..87f1f95f44c1
--- /dev/null
+++ b/arch/riscv/lib/csum.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * IP checksum library
+ *
+ * Influenced by arch/arm64/lib/csum.c
+ * Copyright (C) 2023 Rivos Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/kasan-checks.h>
+#include <linux/kernel.h>
+
+#include <net/checksum.h>
+
+/* Default version is sufficient for 32 bit */
+#ifndef CONFIG_32BIT
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum csum)
+{
+	/*
+	 * Inform the compiler/processor that the operation we are performing is
+	 * "Commutative and Associative" by summing parts of the checksum in a
+	 * tree-like structure (Section 2(A) of "Computing the Internet
+	 * Checksum"). Furthermore, defer the overflow until the end of the
+	 * computation which is shown to be valid in Section 2(C)(1) of the
+	 * same handbook.
+	 */
+	unsigned long sum, sum1, sum2, sum3, sum4, ulen, uproto;
+
+	uproto = htonl(proto);
+	ulen = htonl(len);
+
+	sum   = saddr->s6_addr32[0];
+	sum  += saddr->s6_addr32[1];
+	sum1  = saddr->s6_addr32[2];
+	sum1 += saddr->s6_addr32[3];
+
+	sum2  = daddr->s6_addr32[0];
+	sum2 += daddr->s6_addr32[1];
+	sum3  = daddr->s6_addr32[2];
+	sum3 += daddr->s6_addr32[3];
+
+	sum4  = csum;
+	sum4 += ulen;
+	sum4 += uproto;
+
+	sum  += sum1;
+	sum2 += sum3;
+
+	sum += sum2;
+	sum += sum4;
+
+#ifdef CONFIG_RISCV_ISA_ZBB
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		csum_t fold_temp;
+
+		/*
+		 * Zbb is likely available when the kernel is compiled with Zbb
+		 * support, so nop when Zbb is available and jump when Zbb is
+		 * not available.
+		 */
+		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
+					      RISCV_ISA_EXT_ZBB, 1)
+				  :
+				  :
+				  :
+				  : no_zbb);
+		asm(".option push					\n\
+		.option arch,+zbb					\n\
+			rori %[fold_temp], %[sum], 32			\n\
+			add %[sum], %[fold_temp], %[sum]		\n\
+			srli %[sum], %[sum], 32				\n\
+			roriw %[fold_temp], %[sum], 16			\n\
+			addw %[sum], %[fold_temp], %[sum]		\n\
+		.option pop"
+		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
+		return (__force __sum16)~(sum >> 16);
+	}
+no_zbb:
+#endif // !CONFIG_RISCV_ISA_ZBB
+	sum += (sum >> 32) | (sum << 32);
+	sum >>= 32;
+	return csum_fold((__force __wsum)sum);
+}
+EXPORT_SYMBOL(csum_ipv6_magic);
+#endif // !CONFIG_32BIT
+
+#ifdef CONFIG_32BIT
+#define OFFSET_MASK 3
+#elif CONFIG_64BIT
+#define OFFSET_MASK 7
+#endif
+
+/*
+ * Perform a checksum on an arbitrary memory address.
+ * Algorithm accounts for buff being misaligned.
+ * If buff is not aligned, will over-read bytes but not use the bytes that it
+ * shouldn't. The same thing will occur on the tail-end of the read.
+ */
+unsigned int __no_sanitize_address do_csum(const unsigned char *buff, int len)
+{
+	unsigned int offset, shift;
+	csum_t csum, data;
+	const csum_t *ptr;
+
+	if (unlikely(len <= 0))
+		return 0;
+	/*
+	 * To align the address, grab the whole first byte in buff.
+	 * Since it is inside of a same byte, it will never cross pages or cache
+	 * lines.
+	 * Directly call KASAN with the alignment we will be using.
+	 */
+	offset = (csum_t)buff & OFFSET_MASK;
+	kasan_check_read(buff, len);
+	ptr = (const csum_t *)(buff - offset);
+	len = len + offset - sizeof(csum_t);
+
+	/*
+	 * Clear the most signifant bits that were over-read if buff was not
+	 * aligned.
+	 */
+	shift = offset * 8;
+	data = *ptr;
+#ifdef __LITTLE_ENDIAN
+	data = (data >> shift) << shift;
+#else
+	data = (data << shift) >> shift;
+#endif
+
+	/*
+	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
+	 * faster than doing 32-bit reads on architectures that support larger
+	 * reads.
+	 */
+	while (len > 0) {
+		csum += data;
+		csum += csum < data;
+		len -= sizeof(csum_t);
+		ptr += 1;
+		data = *ptr;
+	}
+
+	/*
+	 * Perform alignment (and over-read) bytes on the tail if any bytes
+	 * leftover.
+	 */
+	shift = len * -8;
+#ifdef __LITTLE_ENDIAN
+	data = (data << shift) >> shift;
+#else
+	data = (data >> shift) << shift;
+#endif
+	csum += data;
+	csum += csum < data;
+
+#ifdef CONFIG_RISCV_ISA_ZBB
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		/*
+		 * Zbb is likely available when the kernel is compiled with Zbb
+		 * support, so nop when Zbb is available and jump when Zbb is
+		 * not available.
+		 */
+		asm_volatile_goto(ALTERNATIVE("j %l[no_zbb]", "nop",  0,
+					      RISCV_ISA_EXT_ZBB, 1)
+		    :
+		    :
+		    :
+		    : no_zbb);
+	} else {
+		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZBB))
+			goto no_zbb;
+	}
+
+	unsigned int fold_temp;
+
+#ifdef CONFIG_32BIT
+		asm_volatile_goto(".option push			\n\
+		.option arch,+zbb				\n\
+			rori %[fold_temp], %[csum], 16		\n\
+			andi %[offset], %[offset], 1		\n\
+			add %[csum], %[fold_temp], %[csum]	\n\
+			beq %[offset], zero, %l[end]		\n\
+			rev8 %[csum], %[csum]			\n\
+			zext.h %[csum], %[csum]			\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			: [offset] "r" (offset)
+			:
+			: end);
+
+		return csum;
+#else // !CONFIG_32BIT
+		asm_volatile_goto(".option push			\n\
+		.option arch,+zbb				\n\
+			rori %[fold_temp], %[csum], 32		\n\
+			add %[csum], %[fold_temp], %[csum]	\n\
+			srli %[csum], %[csum], 32		\n\
+			roriw %[fold_temp], %[csum], 16		\n\
+			addw %[csum], %[fold_temp], %[csum]	\n\
+			andi %[offset], %[offset], 1		\n\
+			beq %[offset], zero, %l[end]		\n\
+			rev8 %[csum], %[csum]			\n\
+			srli %[csum], %[csum], 32		\n\
+			zext.h %[csum], %[csum]			\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			: [offset] "r" (offset)
+			:
+			: end);
+		return csum;
+#endif // !CONFIG_32BIT
+end:
+		return csum >> 16;
+no_zbb:
+#endif // CONFIG_RISCV_ISA_ZBB
+#ifdef CONFIG_32BIT
+#else // !CONFIG_32BIT
+	csum += (csum >> 32) | (csum << 32);
+	csum >>= 32;
+#endif // !CONFIG_32BIT
+	csum = (unsigned int)csum + (((unsigned int)csum >> 16) | ((unsigned int)csum << 16));
+	if (offset & 1)
+		return (unsigned short)swab32(csum);
+	return csum >> 16;
+}

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
