Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F1EC47073
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XTogx0RHTqglAJC+zHDQGh+VACM7PGmUrKkoC+DshEg=; b=ruJ6LaWBepBoe2
	s07u1d25aq/O5K7Dgry7jyJhVm0S2D89iCzv96fdPHwdrJiNyCwncvuodAjEMlkD+lQr8wB79dQSq
	ZkRIaNTO5qjQi0HMjwuzml/2yRIXbWkswY1ziTZ7N+qqQUiXfhIXJydOPFQejtbqZYGxy42xJhWkK
	v74DfVyLsePExcE9nW+LToiZPdBeXnOp6CmTj1sqS5QamO8oOD48EixVoE9JELaCx3VMTZHhKLzp5
	QtH3Q5kFji5FSRTRk+B5a5p00ku5DM9dosrsOAqUzfbLoTHaLuj+artv+s8xB0j8ACJqPmrs1iwFc
	xIqFkPMw3eFzaxR4rh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPm-00Frjn-3D;
	Thu, 28 Dec 2023 01:42:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPj-00Frhe-2C
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6d9bba6d773so2024531b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727742; x=1704332542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKYKCC0iAyjtmcl9i3gxZmi/p+HZhZfirGb7twXi050=;
        b=G9hDV8mI4O4SlegCHtigXxU19e+klgKZqtB4jx1sF35O8QS0HaFq8KFyAmrKKvmuQ9
         +P5oF5fFUX271sNt/kc2ZE7iKbwu6Z7Xo3ThBNku/t1jp7nS+bWbqucs4wacYu0X64JU
         BEy3bNOZPr9zP+7wt6ZYinLJcNets96aeC6UnAjoK8/epZ80uvJ4Lnrotj6bath6W4KI
         fb8VezhFdWhwOgBHmg5f4EEo43EFAv9kUMziJHzPz8Jc7zdVQb1IR54LER5zRjemxmr5
         XiBvmx9HFAk4mxWou3ToSuZXTKvaGLq5H75eRAf+ljFC7Sgb9h+Qr7AgfPQJRLJ7h5op
         Mxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727742; x=1704332542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKYKCC0iAyjtmcl9i3gxZmi/p+HZhZfirGb7twXi050=;
        b=bnsOFuujdKQqgrMZCiIvq0NeOAM9Bzb5QkQBkA8EhWPazDKW9W2/HmXPa89Y1e1GiO
         lmweblYTSafKWjbJJakwhrhrE8FUm22vDzyiuZLiFLMAOB9hNFmTVR0DmeNAhzEMPakT
         s0AU3ylPd1DlejBULUjCavZds5/aGXnBpPKNXr2zJKyJNXCseQDC1gognGTzok2z2F31
         YLctoUSZh+kVX+PTvjr+8bIeQ3Jj028ooVUs+yLpKSbxBXJKT67w5Kn/26D0ES1JzFDW
         cAi3YP3b8wCQM+9xpXbQHtlmP5CuPQWUDX0tncl0XANy7LO2LNfRKqIn4inClVJ62M4/
         03xA==
X-Gm-Message-State: AOJu0Ywx7FM6sKy85oEUBHBrZY1gSbeX/9T3VvWfNfNRPDBIwB0pXacu
	/CM9t5Mh77tY3RKodFaQQflBG6CFc7G2xg==
X-Google-Smtp-Source: AGHT+IHZ0/JideaaZYntOkNOqAPh5V/QL/d8QFy5AdTRppdgJDCkExfUqVkpEa+jpNl3GOmHDV7Ddw==
X-Received: by 2002:a05:6a00:1d05:b0:6d9:bfb8:e37c with SMTP id a5-20020a056a001d0500b006d9bfb8e37cmr6112797pfx.41.1703727742547;
        Wed, 27 Dec 2023 17:42:22 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:22 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 00/14] Unified cross-architecture kernel-mode FPU API
Date: Wed, 27 Dec 2023 17:41:50 -0800
Message-ID: <20231228014220.3562640-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174223_733109_A21866CB 
X-CRM114-Status: GOOD (  14.26  )
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

This series unifies the kernel-mode FPU API across several architectures
by wrapping the existing functions (where needed) in consistently-named
functions placed in a consistent header location, with mostly the same
semantics: they can be called from preemptible or non-preemptible task
context, and are not assumed to be reentrant. Architectures are also
expected to provide CFLAGS adjustments for compiling FPU-dependent code.
For the moment, SIMD/vector units are out of scope for this common API.

This allows us to remove the ifdeffery and duplicated Makefile logic at
each FPU user. It then implements the common API on RISC-V, and converts
a couple of users to the new API: the AMDGPU DRM driver, and the FPU
self test.

The underlying goal of this series is to allow using newer AMD GPUs
(e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
FPU support.

Previous versions:
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement
 - Remove file name from header comment
 - Clean up arch/arm64/lib/Makefile, like for arch/arm
 - Remove RISC-V architecture-specific preprocessor check
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers
 - Declare test_fpu() in a header

Michael Ellerman (1):
  drm/amd/display: Only use hard-float, not altivec on powerpc

Samuel Holland (13):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
 Documentation/core-api/index.rst              |  1 +
 Makefile                                      |  5 ++
 arch/Kconfig                                  |  6 ++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++
 arch/arm/include/asm/fpu.h                    | 15 ++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++-
 arch/arm64/include/asm/fpu.h                  | 15 ++++
 arch/arm64/lib/Makefile                       |  6 +-
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 +-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 +-
 arch/powerpc/include/asm/fpu.h                | 28 +++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 +
 arch/riscv/include/asm/fpu.h                  | 16 ++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 +++++
 arch/x86/include/asm/fpu.h                    | 13 ++++
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
 include/linux/fpu.h                           | 12 +++
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 +------
 lib/raid6/Makefile                            | 31 ++------
 lib/test_fpu.h                                |  8 ++
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
 lib/test_fpu_impl.c                           | 37 +++++++++
 37 files changed, 343 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 create mode 100644 include/linux/fpu.h
 create mode 100644 lib/test_fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
