Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF3BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 23:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q26WekKjCe76CFhDG9MlxxTSxbdX4yxJ8aJgfVdIDHM=; b=F6lUoN4iSRTsw8
	jv6Kx/atsxrSllW2TM9/IlyCncGts9WipBghC44Q96FAE18yzuRknmG+8KikHXCNy5sO2bOOTQdzl
	EtNQfko9tGyQAqn+Uy0cQ34PL6o3u4KX9Qr9WtvN9IcrIXVGY77yMl3Q6dHc/UQU5ntsv3Ehtynia
	iCZt/v5CYyrfowkFrWTbqaWiFCCXPbHWW9wqJx8mEJXt5HT+emknMvKX80Pll6mNFsbmX7q5ePwPJ
	P6BeDlXo7BSSexljk7hkWewRQUoVpdK79MJEU7dvbtW1Ix7AxMmq78W3Qv8T4u+h6T+MpJHfJMlHV
	oXDOxIO1Ik0GohFxySUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUv-006UAJ-0S;
	Mon, 08 Jan 2024 23:57:37 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMzUs-006U9D-17
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 23:57:36 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5987a7640adso81145eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 15:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704758253; x=1705363053; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPVTonO+LXQZXwYb7iCPbl02ew7Jx3P2FceZOwyOvEQ=;
        b=0q/jtSl9EGey6lDFg7e18P5Iths9Q+sM9UhyYyUwElGWRt5zMOknm0N87mn3IkaVU4
         nK1F5fXFyILUK4rqN8V3kVul9ti+OaxEf2cvMTLzUMHQjxFEVypUkfw4+4pLQVa/QiM/
         KBV8+h9QlOv9rjGC2xFXUnPXFgfmBf29GTD5J3V8IYweIXf5iw/U+atIxUCoB4MF1L09
         2sQy8Lhqk9ZA4+EJK6CI0jj8z2BrQT5s3Dju/f44tVFJ6BVqK5p3FTLD8sEZYTMijRdM
         mW1cg/d+IGKrVpG5MYHIhM+3mhDzzGqqU4163ZalB3y+6aeVOaVNsvPwg6YDmQ7n/Bup
         B7AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704758253; x=1705363053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPVTonO+LXQZXwYb7iCPbl02ew7Jx3P2FceZOwyOvEQ=;
        b=PTbyKN6XUJYGPELvxbJ4/Enj2EZiON98OgPxFJQu7zrP4NGn8uUWyrqAkN5Bqo6j+P
         b4v1ZTqtMDDjRYrgts31p4nyO923wto7Nz8bguoxCUtgZq0p4JKV7WBgYkVFBE7JDHIV
         zY6Z426mc1OBAXhNDk8JypNhcN+aU47rSp/m0lwFH9j2nuKBvHx5elVVu6JzTxc4f+yx
         4vUF+mmO+ea4Z4AzFFaIG6NkvlwaIzG8wQnxSKTJ09zfyNE9Zpb8lGdMtcNTxEv5osgv
         OEntA76iYT+9VXmVJ62wudk6qxHz91PWGfMtZ3Bad1vX/qUc8dolzcK8P88Jk9egg57t
         TSpg==
X-Gm-Message-State: AOJu0YzElrq+giA87Z9F77T+5zC3IPr+LYMNVkMY5KOhTQeHuFTpdFL4
	1FU4hi/NcRaDrCMO/efpF7YrkWXHJa6hQA==
X-Google-Smtp-Source: AGHT+IFekKo10GKrEWRGTXXVAIj79XHSPtsaOOZAoT44bsOZwqbiaCU7s1kzsfKznhlyr+tb7qrXLQ==
X-Received: by 2002:a05:6870:b4a5:b0:1fb:851:bc2b with SMTP id y37-20020a056870b4a500b001fb0851bc2bmr2135695oap.57.1704758253096;
        Mon, 08 Jan 2024 15:57:33 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ti5-20020a056871890500b002043b415eaasm206961oab.29.2024.01.08.15.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 15:57:32 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 08 Jan 2024 15:57:05 -0800
Subject: [PATCH v15 4/5] riscv: Add checksum library
MIME-Version: 1.0
Message-Id: <20240108-optimize_checksum-v15-4-1c50de5f2167@rivosinc.com>
References: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
In-Reply-To: <20240108-optimize_checksum-v15-0-1c50de5f2167@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704758245; l=11199;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eDRUmyydl8PJNUFvLDZrYV4a83sgieN+gaZVXKbTj+s=;
 b=x81sIU1itD3uMLgAc46+aMRV0tUqVmo9nuzPVVBmf4KYvXW/F6AFwbqhvR3xgc+1kflSkpRH0
 5ffVAs1hrIcCyQJDiDFFRwN88ibAFnOvym7LzWSONvi/m2ndV/nSs5O
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_155734_394258_7C21B930 
X-CRM114-Status: GOOD (  25.60  )
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
 arch/riscv/include/asm/checksum.h |  11 ++
 arch/riscv/lib/Makefile           |   1 +
 arch/riscv/lib/csum.c             | 326 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 338 insertions(+)

diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 5a810126aac7..a5b60b54b101 100644
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
