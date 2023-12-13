Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B49BC4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzVvnmRJEL+NxbggX480QV20axS4WYNENbr7iO/8D7E=; b=4qFt2oVCt216jO
	bAyVrLF/rcw8vLLH0KJ8i6QPpKWvsQJlEhqEXQ3yBBYXljHexNegPT3+OIwdfeKwEEQ59JxGL32s4
	5EX/ZXGg7O7wxpyxlzKcqZNUL+q2XiLwOUFI9gm0s1faHvZgY1MkaBClG/joH73romj1praPvS5XX
	yu9ePQY9wPdV6PRDPEuGO27zZtPxmYeFGsJe8YHirk1qoswTPYNwGIGBXJDZ1Mv0ddRFs+KRiDsWt
	f+5BAXuCqD36kkecDvOgpzHCWXPTon74eHWNHtqIfpOnBh7f1+8EMNMxX57OPGvv44lyF8D+/yPzB
	SJWXXLKJZnz8eOmZUNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDtm-00DIID-2I;
	Wed, 13 Dec 2023 01:18:54 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDDti-00DIF0-0y
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 01:18:52 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-203019328a6so656460fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 17:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702430327; x=1703035127; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O34NP3N4+tG7CSPikIEpfPydhMG6ggnuxu8MeonXvNU=;
        b=YN2vd6/aqagEYE3oaQr2d1ow2hjQZsp/ByQpyLhJ5ZvaVbSxfZgyIxVQkT89OGmlX0
         URYSwYyV6FB7Zmb+dAQ7z8sCjU1ZJHdvP/bpQfUWkIEyx1ocTkcyzi3m94TEUONODWxA
         ZrDvFvHtE+Hqz04v0vuCFO5U8zfzk1dgAVm+0jpaTAaLWBMEGiYp/TmKzaPbbn1eyXyM
         fVIy5tac/DTL6FBo7OJjlbgrRE8KRWeoLn7XdT8VJRA2Cz5hOXk8fT1V24R9zLP0rA4O
         HV/UltLfJ8v63zR0lXNGKCAMMe+P0ou3sSUalqaf/8CfEupxkADf2PXZ+VEN5xtJV+0z
         K5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702430327; x=1703035127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O34NP3N4+tG7CSPikIEpfPydhMG6ggnuxu8MeonXvNU=;
        b=AH7TyBcVqWeMS11UcNNQYYCFL3HgVH3KrCBDgu9VbRJ6M6JhPNhFLVG69lL2RZOOAb
         vzXG+UZF1/j0WC0Tqk3tUvdSwyCwXVlzCvSCyQpbvEkKKrIcB0R4sBIXRklWkLEmdIzw
         55E3gu5zlpTwyUilt+HozRNqtP7XOnjYSEcA+eAgeYSGDgke0SAYKYfvgLLuDjkKk0Ow
         jXI/D6xkkt/3zkflbJw2TbRz8iQaaoTW8LqUTvuIHA7+1kckIVpvtagcTGhuo3RbgkS+
         Yhp0t118k2CJW/NXh1xc5jj5ehYN9XGTLBOAXX0osOP69SCfjYtjPhrx9pqUkiQz034I
         iTbA==
X-Gm-Message-State: AOJu0YyfOX0pkavr3HvtZ6wkP815uRfWY9taflHHBocq17gjdqADz8vT
	U8K8zinmB0PyWLkqy9rbyBMRRQ==
X-Google-Smtp-Source: AGHT+IGXppRqE+5w1Sg6OxDbwDLTvu/G20D1pfq/whsvxf/Zp1ZPK6sbWWZAupEWFVGI20lpI61H1Q==
X-Received: by 2002:a05:6871:3a2a:b0:203:d18:6700 with SMTP id pu42-20020a0568713a2a00b002030d186700mr1361515oac.21.1702430327241;
        Tue, 12 Dec 2023 17:18:47 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id cy26-20020a056830699a00b006d9a339773csm172548otb.27.2023.12.12.17.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 17:18:46 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 12 Dec 2023 17:18:41 -0800
Subject: [PATCH v12 4/5] riscv: Add checksum library
MIME-Version: 1.0
Message-Id: <20231212-optimize_checksum-v12-4-419a4ba6d666@rivosinc.com>
References: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
In-Reply-To: <20231212-optimize_checksum-v12-0-419a4ba6d666@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702430319; l=11490;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=PB6vw80peypvugpLNiryiVNWb7bYvS4OHOMam/9k0p8=;
 b=R/U6XRj0tpsSTOWsI7kd/Np9rEmGvPWYxs4flPotaBUrn2UkHetp7LNgrmOBCOyafcJFBoZog
 7aNcBSXgjOaCaGXbyNebvcIMDsuZ0ojYC3N3TQZgb69ssCpF1Sqb4t9
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_171850_343082_7E18AC6D 
X-CRM114-Status: GOOD (  26.98  )
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
64-bit will load in groups of 64 bits.

Additionally provide riscv optimized implementation of csum_ipv6_magic.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Xiao Wang <xiao.w.wang@intel.com>
---
 arch/riscv/include/asm/checksum.h |  13 +-
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/csum.c             | 326 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 339 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 2fcf864186e7..3fa04ff1eda8 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -12,6 +12,17 @@
 
 #define ip_fast_csum ip_fast_csum
 
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
+
+/* Default version is sufficient for 32 bit */
+#ifndef CONFIG_32BIT
+#define _HAVE_ARCH_IPV6_CSUM
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum sum);
+#endif
+
 /* Define riscv versions of functions before importing asm-generic/checksum.h */
 #include <asm-generic/checksum.h>
 
@@ -69,7 +80,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 			.option pop"
 			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp));
 		}
-		return csum >> 16;
+		return (__force __sum16) (csum >> 16);
 	}
 no_zbb:
 #ifndef CONFIG_32BIT
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
index 000000000000..06ce8e7250d9
--- /dev/null
+++ b/arch/riscv/lib/csum.c
@@ -0,0 +1,326 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Checksum library
+ *
+ * Influenced by arch/arm64/lib/csum.c
+ * Copyright (C) 2023 Rivos Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/compiler.h>
+#include <linux/jump_label.h>
+#include <linux/kasan-checks.h>
+#include <linux/kernel.h>
+
+#include <asm/cpufeature.h>
+
+#include <net/checksum.h>
+
+/* Default version is sufficient for 32 bit */
+#ifndef CONFIG_32BIT
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum csum)
+{
+	unsigned int ulen, uproto;
+	unsigned long sum = (__force unsigned long)csum;
+
+	sum += (__force unsigned long)saddr->s6_addr32[0];
+	sum += (__force unsigned long)saddr->s6_addr32[1];
+	sum += (__force unsigned long)saddr->s6_addr32[2];
+	sum += (__force unsigned long)saddr->s6_addr32[3];
+
+	sum += (__force unsigned long)daddr->s6_addr32[0];
+	sum += (__force unsigned long)daddr->s6_addr32[1];
+	sum += (__force unsigned long)daddr->s6_addr32[2];
+	sum += (__force unsigned long)daddr->s6_addr32[3];
+
+	ulen = (__force unsigned int)htonl((unsigned int)len);
+	sum += ulen;
+
+	uproto = (__force unsigned int)htonl(proto);
+	sum += uproto;
+
+	/*
+	 * Zbb support saves 4 instructions, so not worth checking without
+	 * alternatives if supported
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		unsigned long fold_temp;
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
+			rori	%[fold_temp], %[sum], 32		\n\
+			add	%[sum], %[fold_temp], %[sum]		\n\
+			srli	%[sum], %[sum], 32			\n\
+			not	%[fold_temp], %[sum]			\n\
+			roriw	%[sum], %[sum], 16			\n\
+			subw	%[sum], %[fold_temp], %[sum]		\n\
+		.option pop"
+		: [sum] "+r" (sum), [fold_temp] "=&r" (fold_temp));
+		return (__force __sum16)(sum >> 16);
+	}
+no_zbb:
+	sum += ror64(sum, 32);
+	sum >>= 32;
+	return csum_fold((__force __wsum)sum);
+}
+EXPORT_SYMBOL(csum_ipv6_magic);
+#endif /* !CONFIG_32BIT */
+
+#ifdef CONFIG_32BIT
+#define OFFSET_MASK 3
+#elif CONFIG_64BIT
+#define OFFSET_MASK 7
+#endif
+
+static inline __no_sanitize_address unsigned long
+do_csum_common(const unsigned long *ptr, const unsigned long *end,
+	       unsigned long data)
+{
+	unsigned int shift;
+	unsigned long csum = 0, carry = 0;
+
+	/*
+	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
+	 * faster than doing 32-bit reads on architectures that support larger
+	 * reads.
+	 */
+	while (ptr < end) {
+		csum += data;
+		carry += csum < data;
+		data = *(ptr++);
+	}
+
+	/*
+	 * Perform alignment (and over-read) bytes on the tail if any bytes
+	 * leftover.
+	 */
+	shift = ((long)ptr - (long)end) * 8;
+#ifdef __LITTLE_ENDIAN
+	data = (data << shift) >> shift;
+#else
+	data = (data >> shift) << shift;
+#endif
+	csum += data;
+	carry += csum < data;
+	csum += carry;
+	csum += csum < carry;
+
+	return csum;
+}
+
+/*
+ * Algorithm accounts for buff being misaligned.
+ * If buff is not aligned, will over-read bytes but not use the bytes that it
+ * shouldn't. The same thing will occur on the tail-end of the read.
+ */
+static inline __no_sanitize_address unsigned int
+do_csum_with_alignment(const unsigned char *buff, int len)
+{
+	unsigned int offset, shift;
+	unsigned long csum, data;
+	const unsigned long *ptr, *end;
+
+	/*
+	 * Align address to closest word (double word on rv64) that comes before
+	 * buff. This should always be in the same page and cache line.
+	 * Directly call KASAN with the alignment we will be using.
+	 */
+	offset = (unsigned long)buff & OFFSET_MASK;
+	kasan_check_read(buff, len);
+	ptr = (const unsigned long *)(buff - offset);
+
+	/*
+	 * Clear the most significant bytes that were over-read if buff was not
+	 * aligned.
+	 */
+	shift = offset * 8;
+	data = *(ptr++);
+#ifdef __LITTLE_ENDIAN
+	data = (data >> shift) << shift;
+#else
+	data = (data << shift) >> shift;
+#endif
+	end = (const unsigned long *)(buff + len);
+	csum = do_csum_common(ptr, end, data);
+
+	/*
+	 * Zbb support saves 6 instructions, so not worth checking without
+	 * alternatives if supported
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		unsigned long fold_temp;
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
+
+#ifdef CONFIG_32BIT
+		asm_volatile_goto(".option push			\n\
+		.option arch,+zbb				\n\
+			rori	%[fold_temp], %[csum], 16	\n\
+			andi	%[offset], %[offset], 1		\n\
+			add	%[csum], %[fold_temp], %[csum]	\n\
+			beq	%[offset], zero, %l[end]	\n\
+			rev8	%[csum], %[csum]		\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			: [offset] "r" (offset)
+			:
+			: end);
+
+		return (unsigned short)csum;
+#else /* !CONFIG_32BIT */
+		asm_volatile_goto(".option push			\n\
+		.option arch,+zbb				\n\
+			rori	%[fold_temp], %[csum], 32	\n\
+			add	%[csum], %[fold_temp], %[csum]	\n\
+			srli	%[csum], %[csum], 32		\n\
+			roriw	%[fold_temp], %[csum], 16	\n\
+			addw	%[csum], %[fold_temp], %[csum]	\n\
+			andi	%[offset], %[offset], 1		\n\
+			beq	%[offset], zero, %l[end]	\n\
+			rev8	%[csum], %[csum]		\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			: [offset] "r" (offset)
+			:
+			: end);
+
+		return (csum << 16) >> 48;
+#endif /* !CONFIG_32BIT */
+end:
+		return csum >> 16;
+	}
+no_zbb:
+#ifndef CONFIG_32BIT
+	csum += ror64(csum, 32);
+	csum >>= 32;
+#endif
+	csum = (u32)csum + ror32((u32)csum, 16);
+	if (offset & 1)
+		return (u16)swab32(csum);
+	return csum >> 16;
+}
+
+/*
+ * Does not perform alignment, should only be used if machine has fast
+ * misaligned accesses, or when buff is known to be aligned.
+ */
+static inline __no_sanitize_address unsigned int
+do_csum_no_alignment(const unsigned char *buff, int len)
+{
+	unsigned long csum, data;
+	const unsigned long *ptr, *end;
+
+	ptr = (const unsigned long *)(buff);
+	data = *(ptr++);
+
+	kasan_check_read(buff, len);
+
+	end = (const unsigned long *)(buff + len);
+	csum = do_csum_common(ptr, end, data);
+
+	/*
+	 * Zbb support saves 6 instructions, so not worth checking without
+	 * alternatives if supported
+	 */
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+		unsigned long fold_temp;
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
+
+#ifdef CONFIG_32BIT
+		asm (".option push				\n\
+		.option arch,+zbb				\n\
+			rori	%[fold_temp], %[csum], 16	\n\
+			add	%[csum], %[fold_temp], %[csum]	\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			:
+			: );
+
+#else /* !CONFIG_32BIT */
+		asm (".option push				\n\
+		.option arch,+zbb				\n\
+			rori	%[fold_temp], %[csum], 32	\n\
+			add	%[csum], %[fold_temp], %[csum]	\n\
+			srli	%[csum], %[csum], 32		\n\
+			roriw	%[fold_temp], %[csum], 16	\n\
+			addw	%[csum], %[fold_temp], %[csum]	\n\
+		.option pop"
+			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
+			:
+			: );
+#endif /* !CONFIG_32BIT */
+		return csum >> 16;
+	}
+no_zbb:
+#ifndef CONFIG_32BIT
+	csum += ror64(csum, 32);
+	csum >>= 32;
+#endif
+	csum = (u32)csum + ror32((u32)csum, 16);
+	return csum >> 16;
+}
+
+/*
+ * Perform a checksum on an arbitrary memory address.
+ * Will do a light-weight address alignment if buff is misaligned, unless
+ * cpu supports fast misaligned accesses.
+ */
+unsigned int do_csum(const unsigned char *buff, int len)
+{
+	if (unlikely(len <= 0))
+		return 0;
+
+	/*
+	 * Significant performance gains can be seen by not doing alignment
+	 * on machines with fast misaligned accesses.
+	 *
+	 * There is some duplicate code between the "with_alignment" and
+	 * "no_alignment" implmentations, but the overlap is too awkward to be
+	 * able to fit in one function without introducing multiple static
+	 * branches. The largest chunk of overlap was delegated into the
+	 * do_csum_common function.
+	 */
+	if (static_branch_likely(&fast_misaligned_access_speed_key))
+		return do_csum_no_alignment(buff, len);
+
+	if (((unsigned long)buff & OFFSET_MASK) == 0)
+		return do_csum_no_alignment(buff, len);
+
+	return do_csum_with_alignment(buff, len);
+}

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
