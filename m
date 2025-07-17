Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02B0C83F34
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yhGFhl9Fnm73PBUT69oVMmEvGFsFwqQvfsDgle7HHMQ=; b=mN7Cv4IjlWo5Ex
	laQtWMlTtZB3bDaFXDg9jm6KSEwtoGXzjdMofJ2vEDwpTbg3unSODb592i7om3aGMz3azUHxhtvXP
	N6X8CCtd4wk0Na8LRSlEcHWvIm87nBDX4mT9VM2J4JwcLQcDNSQA744y4OSIHoY8LFy39Fv0meudX
	kmGcdELwpsylecbuG7Fc8V7pZs1aoExi7P7UGBNSoRmFTXVVIbql2RcV0EMRQ100gN2TD7PBHpjo0
	svVy4HkOIGOpNRcealzjeVidvnWTL24A+I36lLnDOljqKA4DfAcCKbY0i3vtiV1yENUK/A8IBP/39
	CGjcNM3p0IdTsX86Agnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTcR-0000000Av34-3AJ8;
	Thu, 17 Jul 2025 18:46:11 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTav-0000000Aug0-3mCf
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 18:44:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1752777873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mAKc0gZj12q7OYrgO0jy//NODW8HnTIl71eRaw/GUw8=;
	b=N2G56BT/BbYgC1C9q9Sr13xf+d4zwHYofERaUf+6Gk8OnCgO/Kkje/FKkRk26DhZuSh8qv
	h+p1OztjWOrZaZNlhbNVTuvjyQK4/3SpMQ74iAjvb5NGIM81oYDe0Xef5LcYcBPyaw7qoG
	p1NWs46vI3loIjEHlyZYd5bNGAmtEowjEhGuFDP6KwZ1imNjkklT2hixlnWwtLFK/tuC3G
	hkG2WSMtxS+KmHhtYCzC6Kswqo5PNRelZdVPUPvra0/hlRyZrSgIAKeuqVJazPkEmbN+lj
	nGGI8YPL2oofUEVdCQqzjOfn3kG5OsFbiIxu9xYm/JaEHUYZl7hMH/8IR0c/yQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Thu, 17 Jul 2025 19:44:02 +0100
Subject: [PATCH v5] riscv: introduce asm/swab.h
MIME-Version: 1.0
Message-Id: <20250717-riscv-swab-v5-1-1d5bb7c42f38@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAHFEeWgC/23MQU7DMBCF4atUXmM047HdmBX3QCxsZ0JnQVLZy
 ICq3B23QiJBXb4nff9FVS7CVT0dLqpwkyrL3Id7OKh8ivMbaxn7VgaMA4KjLlJz0/UzJp0GTMH
 GEDMm1cG58CRft9jLa98nqR9L+b61G17f3wzCNtNQoybrneEJmYN/Fp6zzLE+5uVdXUvNbHXYa
 aNBj46SH31MAd0dTX/aAu00dU1pOoIbB2CiO9putPE7bbv21gBasNEP+Z9e1/UH6rs8pGEBAAA
 =
X-Change-ID: 20250307-riscv-swab-b81b94a9ac1b
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_114438_557581_CA9CB838 
X-CRM114-Status: GOOD (  14.14  )
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

Implement endianness swap macros for RISC-V.

Use the rev8 instruction when Zbb is available. Otherwise, rely on the
default mask-and-shift implementation.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Motivated by [1]. Tested with crc_kunit as pointed out here [2]. I can't 
provide performance numbers as I don't have RISC-V hardware.

[1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
[2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
---
Changes in v5:
- Duplicate ___constant_swab helpers in arch/riscv/include/asm/swab.h to
  avoid delaying the patch as suggested by Alex in [3] (drop patch 1 and
  convert this into a 1-patch series)
- Link to v4: https://lore.kernel.org/r/20250426-riscv-swab-v4-0-64201404a68c@iencinas.com

[3] https://lore.kernel.org/linux-riscv/7e22a448-3cee-4475-b69b-3dd45b57f168@ghiti.fr/

Changes in v4:

- Add missing include in the 1st patch, reported by
  https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
- Rewrite the ARCH_SWAB macro as suggested by Arnd
- Define __arch_swab64 for CONFIG_32BIT (Ben)
- Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com

Changes in v3:

PATCH 2:
  Use if(riscv_has_extension_likely) instead of asm goto (Eric). It
  looks like both versions generate the same assembly. Perhaps we should
  do the same change in other places such as arch/riscv/include/asm/bitops.h
- Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com

Changes in v2:
- Introduce first patch factoring out the default implementation into
  asm-generic
- Remove blank line to make checkpatch happy
- Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com
---
 arch/riscv/include/asm/swab.h | 87 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
new file mode 100644
index 0000000000000000000000000000000000000000..4f408f59fada7251d62f56d174ae76ff19f4a319
--- /dev/null
+++ b/arch/riscv/include/asm/swab.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_SWAB_H
+#define _ASM_RISCV_SWAB_H
+
+#include <linux/types.h>
+#include <linux/compiler.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+#include <asm-generic/swab.h>
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
+
+// Duplicated from include/uapi/linux/swab.h
+#define ___constant_swab16(x) ((__u16)(				\
+	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
+	(((__u16)(x) & (__u16)0xff00U) >> 8)))
+
+#define ___constant_swab32(x) ((__u32)(				\
+	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
+	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
+	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
+	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
+
+#define ___constant_swab64(x) ((__u64)(				\
+	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
+	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
+	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
+	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
+	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
+	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
+	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
+	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
+
+#define ARCH_SWAB(size, value)						\
+({									\
+	unsigned long x = value;					\
+									\
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
+		asm volatile (".option push\n"				\
+			      ".option arch,+zbb\n"			\
+			      "rev8 %0, %1\n"				\
+			      ".option pop\n"				\
+			      : "=r" (x) : "r" (x));			\
+		x = x >> (BITS_PER_LONG - size);			\
+	} else {                                                        \
+		x = ___constant_swab##size(value);                      \
+	}								\
+	x;								\
+})
+
+static __always_inline __u16 __arch_swab16(__u16 value)
+{
+	return ARCH_SWAB(16, value);
+}
+
+static __always_inline __u32 __arch_swab32(__u32 value)
+{
+	return ARCH_SWAB(32, value);
+}
+
+#ifdef CONFIG_64BIT
+static __always_inline __u64 __arch_swab64(__u64 value)
+{
+	return ARCH_SWAB(64, value);
+}
+#else
+static __always_inline __u64 __arch_swab64(__u64 value)
+{
+	__u32 h = value >> 32;
+	__u32 l = value & ((1ULL << 32) - 1);
+
+	return ((__u64)(__arch_swab32(l)) << 32) | ((__u64)(__arch_swab32(h)));
+}
+#endif
+
+#define __arch_swab64 __arch_swab64
+#define __arch_swab32 __arch_swab32
+#define __arch_swab16 __arch_swab16
+
+#undef ___constant_swab16
+#undef ___constant_swab32
+#undef ___constant_swab64
+
+#undef ARCH_SWAB
+
+#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
+#endif /* _ASM_RISCV_SWAB_H */

---
base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
change-id: 20250307-riscv-swab-b81b94a9ac1b

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
