Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFA4C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3u62KmDQMeTBR29q5kMpkBufFZ1Y3+LZh71bOQYCuU=; b=NGXFphlWnxGUnQ
	fhXGB1D+cipYlsNGFdyPgUmDCrNS4dZQVsssqmaYQ78HE5G8fvwoMNIVksf5gc4QFth7qkxUcP1PX
	ZUvng+Vh8qDSbSH4xV36ZPWqkb4hdLoFsNK/pQUkteNS0HEQuX7BnloNlbhymjzne5iFLlxRd+KgJ
	cnwNrmNbBTZq2GPRawMijjasADMXFL90aEpjlsyyTF/XzaZtsKiMkZ/Q8Nj+BOp/d4xSpvCXGdHtZ
	WK8ab5QcajbgMkmKAs2z7FOaV0pXgDFlPNO3dYpVx422jpxypJuUkb7L5PaylyDnUIrUn36H2DZ7P
	w9AoOvNnib+4/cRymjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZVB-0000000AvEK-3OUS;
	Wed, 27 Mar 2024 20:04:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-0000000Au88-3DCL
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nnfcb5HAvzgd9XZtKey8r+Hj1U7B+/pwxPGR+srUxos=; b=ozrgTldVFuLV6I1oAzGCa2Rn/9
	dG6w5TYFh7QejPaJDwpL2iwkffWS6q0aSQnVKARhLOBtyCLVN1MBKGEwdcqep7ado6DWWVfU8F2Sc
	Kch8rdClckEzxf5RVAQjAoZDl068I8ae2ubUTI5zi4G2Ewa9U6ZrTxm+alXC6HgpDtjQgOMWrRWeg
	ZqP773BULHKiiQfkYjkXyHB0AeE/iliv7JQyJeHVv5hy8GE8+vh7vXd2UMvkJFpAE2CywbuJ/9cIU
	Ml0camCGUZevkyXbXSDQ7+xM3+CDwPUovMvmlw2D+NswjdhwwUS8hsCX4T4Xkkhxbo7LPyerIl3l1
	+CrkQSRw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTS-00000004dpJ-2XDa
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0ae065d24so2142855ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569731; x=1712174531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnfcb5HAvzgd9XZtKey8r+Hj1U7B+/pwxPGR+srUxos=;
        b=RBw/1oeiAlSavLClFtdRhFh664hsj9wpy1zB9FxJchnrtdi5RLDB7lfvMKub4ru2+e
         krt8E3f0/Ny92SrQIhjMg+q1cpIvzcqLQH7TZEfaJvH99Xy5ZtTBZJGV1eQ4BXNW7b56
         O4JJK2iwODnxQSbOSbdY3TtJfV93r+f8dfxEoCoCL6aq/Ut4WrxiavxfoiqpwGbh1IL0
         G4SYWa8o/zIsgr/+P8xP0sbfE0nHctO+ndESXG41n13ZpH4EexxXe9XHeEjP0fx+Afn6
         +LhxXF4a7PWSeO6TEF2e6jAmGnIF7VmujVi2QvoA8oqP3TgJ1ozeCSYjJlNc4NOlc9GL
         VX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569731; x=1712174531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnfcb5HAvzgd9XZtKey8r+Hj1U7B+/pwxPGR+srUxos=;
        b=WIGwW/kRBGq/myZlZLOgYuRjtQgisT9LAdJnKEHfrV7XQEzjt3goIstOq89AY2oPq5
         Abi/0n2qtIqXh/p/qFXkzVGcno1RsTuXI6n459HN94msAQ89wMZ9+0a46cG40lcb07g6
         93d4Y1hDmagLCmHwZzzq50eD8d7XZL1pPnmuwjAiPd1UAIOdeIFNVE+1NpnZpoAF/tiE
         8eYyrYELn9C4Pel7hYfrHKfgZOx5eSzD7ccLDt3/oI0zhVNPwk5jicDoBUz4zGHXaRVG
         c2ShmEVVsJTC8sh2JknFMFD2XeQDAMkVdVc3BXBSIPcRUmYdu5rAVu8QqWkKvmMKoAW/
         Ym9w==
X-Forwarded-Encrypted: i=1; AJvYcCWRgqiuu5GexCvQo9NK9lAgB9ZF82pWN+C2svJH/v0z8zo16n1iE8LNi3naWZKjI9dTEyoQKo6H0Lsv6mTwtbmbJ/ydqDFAhJ1PnnUPaI8l
X-Gm-Message-State: AOJu0Yy0b1PskcptS0ymlpoHsLeLvcBHH/Zkb4XlLQGMsp7/ib6yWTk5
	OfNoSQh0X8/9Y6CI0LLmUDmypwWEPiFIAu6LJtX37yCcb8SrRP6S6PJwALgZtPk=
X-Google-Smtp-Source: AGHT+IGwHWClv4VHwAUMeRko9/IrGC0nK3n3EBnq+VQl6LUZXOQ24ITW9JUdRJyNTiGgpBBFPtyemA==
X-Received: by 2002:a17:902:f545:b0:1dd:73ba:cd7f with SMTP id h5-20020a170902f54500b001dd73bacd7fmr731731plf.47.1711569731200;
        Wed, 27 Mar 2024 13:02:11 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:10 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 09/14] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:40 -0700
Message-ID: <20240327200157.1097089-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200214_660060_D06BF21D 
X-CRM114-Status: GOOD (  14.06  )
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

x86 already provides kernel_fpu_begin() and kernel_fpu_end(), but in a
different header. Add a wrapper header, and export the CFLAGS
adjustments as found in lib/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/x86/Kconfig           |  1 +
 arch/x86/Makefile          | 20 ++++++++++++++++++++
 arch/x86/include/asm/fpu.h | 13 +++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/x86/include/asm/fpu.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 39886bab943a..7c9d032ee675 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -83,6 +83,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 662d9d4033e6..5a5f5999c505 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -74,6 +74,26 @@ KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+#
+# CFLAGS for compiling floating point code inside the kernel.
+#
+CC_FLAGS_FPU := -msse -msse2
+ifdef CONFIG_CC_IS_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
+#
+# The "-msse" in the first argument is there so that the
+# -mpreferred-stack-boundary=3 build error:
+#
+#  -mpreferred-stack-boundary=3 is not between 4 and 12
+#
+# can be triggered. Otherwise gcc doesn't complain.
+CC_FLAGS_FPU += -mhard-float
+CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
+endif
+
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
 # Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
diff --git a/arch/x86/include/asm/fpu.h b/arch/x86/include/asm/fpu.h
new file mode 100644
index 000000000000..b2743fe19339
--- /dev/null
+++ b/arch/x86/include/asm/fpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_X86_FPU_H
+#define _ASM_X86_FPU_H
+
+#include <asm/fpu/api.h>
+
+#define kernel_fpu_available()	true
+
+#endif /* ! _ASM_X86_FPU_H */
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
