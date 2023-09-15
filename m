Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F349DEED61B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 17:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rySlssRqpTm/nuKT4dIdCUjqsrjcvJsqUhb4Z/wwzBI=; b=gFDizB70qrlB8e
	w0Ypcp4Ac7dL7NCmuu5EOLfECyM24cTnlIT9h3CEuoSPpTzXNTXqgfR8+985gpRbvpX/I8TZjGRYZ
	BQGwiRrvF971vOevIndwmxfxm1Lz8oHDYzPqSgkoKrYgmw8n0YBEabCpV/VWvfRDfn76CCicTT6f7
	XXr+jh5lMsNJt7lQjTzb/KU1nBW5RdtReR6XownIdIMeGGYWIZH3l2XfGnvuuO+NKg4JShz/0B/kz
	MjJUPSBlyMua861rYWWpP3jKwLYhZs3rN+6pdZ9TuZF3jeQ14D+2lF8lpYe48WALcLGH6M06+4+ip
	P3LIw4j4OzFS2+KG3n/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDJ-00B6BU-2s;
	Fri, 15 Sep 2023 17:02:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhCDC-00B68n-2g
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 17:02:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c0db66af1bso18586775ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 10:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694797353; x=1695402153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YenmJptO8OUyWvbDRPBx2LDiJqOG9TzUed92tXFO3E=;
        b=TNFWLaM9MuYZlnJSR953L1O7A6r5WMcHVb9MPQZuA1WEKYYulFCLsWQml6ouTPjP8c
         /RHoeViaBTTuL1kJhROiuzT8U1ajOGZ+DmQKltwlwI3b+y+bGjHf9NeMXgd14nr4DpQG
         K+l2tGxwsjXUr7D0jok1C/3eiDOaQd6cohpjDZA1OCTV7J5zLSeZYoJdl/kIv7o6XOnt
         tWbCyutaGu1zAIPxROqKhQChEXJOy0IzphtPJy8c1iC7qMZwJaECIwnnoPUND6ovBgNO
         DaZuSqaN1tIdzyirJx9rYWEL5vmDLWwYqUYMCfRiCTjusS1BZ1pCkDLhInjLhsaF5dQ7
         RL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797353; x=1695402153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YenmJptO8OUyWvbDRPBx2LDiJqOG9TzUed92tXFO3E=;
        b=xQ4jvmIXm2R86VEnv1A12u9Ym5YJh2sexiUuTioRotvPszRa27bIdfz33afhRlIqLM
         cmL8zD7hSvh+XWPAvABPvEI+iE9SEV7AwKDyTxy7BR25R2bTzrxuklw6ICd6R6iGdiVj
         ubNrOATZSt+Hc39Ua7hDzdguqruPtDUXA90ZJKamvnEItcFYPAO3ojqm3oxflEJ7x4b7
         SF150vulGc4S1EYZIyTs6MGauFBaHQw32BKPU6g4MGKkpZLR/KBJTTS11kkGCag0kGmr
         QjlZJB+bxhSX3PeS1eTli42dJArqUJelRNBnH7VkuhCVUUpmhyRyNlHzDshEVuujv2qM
         E/Kw==
X-Gm-Message-State: AOJu0YxlQbuPjKgbtsmPjlgzGr8CJLimdOxu2lE0qtknc0Ba+2n6qHZE
	84AjMct14HWnZJDE/RMnYPmueSl9PKx74IQYnEk=
X-Google-Smtp-Source: AGHT+IFhabtRSCNC2ojl0RQSGzjAOJkYDTlrQYNnmSckJagA35mnr1K8l3L+JQGHEIDnd04q9iFvYg==
X-Received: by 2002:a17:903:1249:b0:1c0:e472:5412 with SMTP id u9-20020a170903124900b001c0e4725412mr2500496plh.18.1694797353332;
        Fri, 15 Sep 2023 10:02:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g22-20020a1709029f9600b001c44c8d857esm34299plq.120.2023.09.15.10.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 10:02:32 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 15 Sep 2023 10:01:19 -0700
Subject: [PATCH v6 3/4] riscv: Add checksum library
MIME-Version: 1.0
Message-Id: <20230915-optimize_checksum-v6-3-14a6cf61c618@rivosinc.com>
References: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
In-Reply-To: <20230915-optimize_checksum-v6-0-14a6cf61c618@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_100234_888651_BE640BF5 
X-CRM114-Status: GOOD (  23.16  )
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

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/checksum.h |  12 +++
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/csum.c             | 198 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 211 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index dc0dd89f2a13..7fcd07edb8b3 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -12,6 +12,18 @@
 
 #define ip_fast_csum ip_fast_csum
 
+extern unsigned int do_csum(const unsigned char *buff, int len);
+#define do_csum do_csum
+
+/* Default version is sufficient for 32 bit */
+#ifdef CONFIG_64BIT
+#define _HAVE_ARCH_IPV6_CSUM
+__sum16 csum_ipv6_magic(const struct in6_addr *saddr,
+			const struct in6_addr *daddr,
+			__u32 len, __u8 proto, __wsum sum);
+#endif
+
+// Define riscv versions of functions before importing asm-generic/checksum.h
 #include <asm-generic/checksum.h>
 
 /*
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
index 000000000000..1fda96d2bd8d
--- /dev/null
+++ b/arch/riscv/lib/csum.c
@@ -0,0 +1,198 @@
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
+	unsigned int ulen, uproto;
+	unsigned long sum = csum;
+
+	sum += saddr->s6_addr32[0];
+	sum += saddr->s6_addr32[1];
+	sum += saddr->s6_addr32[2];
+	sum += saddr->s6_addr32[3];
+
+	sum += daddr->s6_addr32[0];
+	sum += daddr->s6_addr32[1];
+	sum += daddr->s6_addr32[2];
+	sum += daddr->s6_addr32[3];
+
+	ulen = htonl((unsigned int)len);
+	sum += ulen;
+
+	uproto = htonl(proto);
+	sum += uproto;
+
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
+	unsigned long csum = 0, data;
+	const unsigned long *ptr;
+
+	if (unlikely(len <= 0))
+		return 0;
+	/*
+	 * To align the address, grab the whole first byte in buff.
+	 * Since it is inside of a same byte, it will never cross pages or cache
+	 * lines.
+	 * Directly call KASAN with the alignment we will be using.
+	 */
+	offset = (unsigned long)buff & OFFSET_MASK;
+	kasan_check_read(buff, len);
+	ptr = (const unsigned long *)(buff - offset);
+	len = len + offset - sizeof(unsigned long);
+
+	/*
+	 * Clear the most signifant bits that were over-read if buff was not
+	 * aligned.
+	 */
+	shift = offset * 8;
+	data = *ptr;
+	if (IS_ENABLED(__LITTLE_ENDIAN))
+		data = (data >> shift) << shift;
+	else
+		data = (data << shift) >> shift;
+
+	/*
+	 * Do 32-bit reads on RV32 and 64-bit reads otherwise. This should be
+	 * faster than doing 32-bit reads on architectures that support larger
+	 * reads.
+	 */
+	while (len > 0) {
+		csum += data;
+		csum += csum < data;
+		len -= sizeof(unsigned long);
+		ptr += 1;
+		data = *ptr;
+	}
+
+	/*
+	 * Perform alignment (and over-read) bytes on the tail if any bytes
+	 * leftover.
+	 */
+	shift = len * -8;
+	if (IS_ENABLED(__LITTLE_ENDIAN))
+		data = (data << shift) >> shift;
+	else
+		data = (data >> shift) << shift;
+
+	csum += data;
+	csum += csum < data;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+		unsigned int fold_temp;
+
+		if (IS_ENABLED(CONFIG_32BIT)) {
+			asm_volatile_goto(".option push			\n\
+			.option arch,+zbb				\n\
+				rori	%[fold_temp], %[csum], 16	\n\
+				andi	%[offset], %[offset], 1		\n\
+				add	%[csum], %[fold_temp], %[csum]	\n\
+				beq	%[offset], zero, %l[end]	\n\
+				rev8	%[csum], %[csum]		\n\
+				zext.h	%[csum], %[csum]		\n\
+			.option pop"
+				: [csum] "+r" (csum),
+				  [fold_temp] "=&r" (fold_temp)
+				: [offset] "r" (offset)
+				:
+				: end);
+
+			return csum;
+		} else {
+			asm_volatile_goto(".option push			\n\
+			.option arch,+zbb				\n\
+				rori	%[fold_temp], %[csum], 32	\n\
+				add	%[csum], %[fold_temp], %[csum]	\n\
+				srli	%[csum], %[csum], 32		\n\
+				roriw	%[fold_temp], %[csum], 16	\n\
+				addw	%[csum], %[fold_temp], %[csum]	\n\
+				andi	%[offset], %[offset], 1		\n\
+				beq	%[offset], zero, %l[end]	\n\
+				rev8	%[csum], %[csum]		\n\
+				srli	%[csum], %[csum], 32		\n\
+				zext.h	%[csum], %[csum]		\n\
+			.option pop"
+				: [csum] "+r" (csum),
+				  [fold_temp] "=&r" (fold_temp)
+				: [offset] "r" (offset)
+				:
+				: end);
+
+			return csum;
+		}
+end:
+		return csum >> 16;
+	}
+
+#ifndef CONFIG_32BIT
+	csum += (csum >> 32) | (csum << 32);
+	csum >>= 32;
+#endif
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
