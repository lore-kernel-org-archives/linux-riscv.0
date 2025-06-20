Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3DFC7115D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 11:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3huk2xqsSuxb+4K9xTrFUSLcdK+ABeLWzwIR9L0Tx60=; b=tw6XfEonz7+vWS
	8aL+LZ72kE9wiNJ4JVAPmq4hL46rKuJifJ6ajQ7JDXM8eovVfhKllLRJN/8inVF0D/RDTBF+Kjxph
	Sz3OEycQCH1Ow+iamD+oBqzsMCgnWsHDTkAvCo3lVCXefK/eap8V7NLyS7W4AhoKudogJgtAR4UUV
	/9dcrnM8x+tjx3Nx/7votWRDDROub7tSkDbYN6dKhLR2AtNk8xvxs732ByhRK9F5d4zgqx/oV2GES
	ItyZoV0F7N6BbxIv/2J//e9etvfnDaV50t3udfy9zgxn7iLsM4sakhYFeIdEQkpnTwOkq4zGpdgwi
	pff2QBcn8ol7pbAMV00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaIg-0000000FVd1-3b8R;
	Fri, 20 Jun 2025 11:52:54 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZjr-0000000FRgM-3oN1
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750418213; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=i6Itj8EUP34Ecukcbx4LZV19FLhT/XveeyJP7HjJzps=;
	b=fVUuJUo9wBTIvP37w6+Mxi1uoEe92OEytcLwTUJL7P2J0le26G2jeAQKce8KavbsLNDh8eWizH6U1ERZrn5erzjxmnSAQKjGm817nIdEugr82DJ4ln0WO2ddVpazggIvuoW93+oPhr9BSXY/uwkIR530aX/GoDiLTpblx+myRTs=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WeKdQMr_1750418210 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 19:16:52 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	arnd@arndb.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Fri, 20 Jun 2025 19:16:10 +0800
Message-ID: <20250620111610.52750-3-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620111610.52750-1-cp0613@linux.alibaba.com>
References: <20250620111610.52750-1-cp0613@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041656_115533_B2BAECC2 
X-CRM114-Status: UNSURE (   7.02  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The RISC-V Zbb extension[1] defines bitwise rotation instructions,
which can be used to implement rotate related functions.

[1] https://github.com/riscv/riscv-bitmanip/

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 arch/riscv/include/asm/bitops.h | 172 ++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2b..be247ef9e686 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -20,17 +20,20 @@
 #include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/rotate.h>
 
 #else
 #define __HAVE_ARCH___FFS
 #define __HAVE_ARCH___FLS
 #define __HAVE_ARCH_FFS
 #define __HAVE_ARCH_FLS
+#define __HAVE_ARCH_ROTATE
 
 #include <asm-generic/bitops/__ffs.h>
 #include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/ffs.h>
 #include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/rotate.h>
 
 #include <asm/alternative-macros.h>
 #include <asm/hwcap.h>
@@ -175,6 +178,175 @@ static __always_inline int variable_fls(unsigned int x)
 	 variable_fls(x_);					\
 })
 
+static __always_inline u64 variable_rol64(u64 word, unsigned int shift)
+{
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rol %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word), "r" (shift) :);
+
+	return word;
+
+legacy:
+	return generic_rol64(word, shift);
+}
+
+static inline u64 variable_ror64(u64 word, unsigned int shift)
+{
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"ror %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word), "r" (shift) :);
+
+	return word;
+
+legacy:
+	return generic_ror64(word, shift);
+}
+
+static inline u32 variable_rol32(u32 word, unsigned int shift)
+{
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rolw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word), "r" (shift) :);
+
+	return word;
+
+legacy:
+	return generic_rol32(word, shift);
+}
+
+static inline u32 variable_ror32(u32 word, unsigned int shift)
+{
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rorw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word) : "r" (word), "r" (shift) :);
+
+	return word;
+
+legacy:
+	return generic_ror32(word, shift);
+}
+
+static inline u16 variable_rol16(u16 word, unsigned int shift)
+{
+	u32 word32 = ((u32)word << 16) | word;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rolw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word32) : "r" (word32), "r" (shift) :);
+
+	return (u16)word32;
+
+legacy:
+	return generic_rol16(word, shift);
+}
+
+static inline u16 variable_ror16(u16 word, unsigned int shift)
+{
+	u32 word32 = ((u32)word << 16) | word;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rorw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word32) : "r" (word32), "r" (shift) :);
+
+	return (u16)word32;
+
+legacy:
+	return generic_ror16(word, shift);
+}
+
+static inline u8 variable_rol8(u8 word, unsigned int shift)
+{
+	u32 word32 = ((u32)word << 24) | ((u32)word << 16) | ((u32)word << 8) | word;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rolw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word32) : "r" (word32), "r" (shift) :);
+
+	return (u8)word32;
+
+legacy:
+	return generic_rol8(word, shift);
+}
+
+static inline u8 variable_ror8(u8 word, unsigned int shift)
+{
+	u32 word32 = ((u32)word << 24) | ((u32)word << 16) | ((u32)word << 8) | word;
+
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
+				      RISCV_ISA_EXT_ZBB, 1)
+			  : : : : legacy);
+
+	asm volatile(
+		".option push\n"
+		".option arch,+zbb\n"
+		"rorw %0, %1, %2\n"
+		".option pop\n"
+		: "=r" (word32) : "r" (word32), "r" (shift) :);
+
+	return (u8)word32;
+
+legacy:
+	return generic_ror8(word, shift);
+}
+
+#define rol64(word, shift) variable_rol64(word, shift)
+#define ror64(word, shift) variable_ror64(word, shift)
+#define rol32(word, shift) variable_rol32(word, shift)
+#define ror32(word, shift) variable_ror32(word, shift)
+#define rol16(word, shift) variable_rol16(word, shift)
+#define ror16(word, shift) variable_ror16(word, shift)
+#define rol8(word, shift)  variable_rol8(word, shift)
+#define ror8(word, shift)  variable_ror8(word, shift)
+
 #endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE) */
 
 #include <asm-generic/bitops/ffz.h>
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
