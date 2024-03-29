Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531CFCD128D
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+S9sFBEjqc5sItJBpQgLkWO2Nbp2kTj2gAUqOBbXA4g=; b=dS/9cwChg+xUys
	ALltANMv2OtY1/JFNfdsdz03dQZ0KriCkIRxZdWNuXzAwHq7NeGaq6tH3smrtRlzgASeO4HQahMYI
	57m5rHXYwWOkVC77pDgBjKJB36a88U2oZbMgmbniFGs3k7BWMFT/mAq6TTGRvUNxOSztb3fHRIc89
	JasHni003e/UDu2dmoEk2rtM0eud5Bo3nedJUpwoMSzkc2gzXM7wuHxb7iBN5vJgkCv5KN0x+zkRE
	58ropGY5PtEfLt8w3NxrDPovEBwypjCyW6xUXYTp5RBELe7UoIV3qkvixWNX7XsCOnjxkgH8JtTUm
	d+P7JSu3cqLXqovII09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7gb-0000000HKZf-2URg;
	Fri, 29 Mar 2024 08:34:05 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bW-0000000H8WN-0LmU
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so1029748a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697083; x=1712301883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9VxbCTgzZ80UmziOWsKJFOvNNy0Qw1c5wWNUXcCD38=;
        b=XYiCcuVIcLWUU5J5klJPsrE+J9dHPvzxpIKlk4zGflyLKllChYmIIBzKeezV7yibOi
         TMj5Sxy1SoIwPAkgAaSMrnunt5n3kDmrelvDy9u08SV5mJpLPA6lZdMm9lEBZ/vOmb/3
         7CKwAVjhy114naKJ6s9AjVROWl2Ov89NUqG1H7ruwnGIOpsa16iOb88eofYNPSLE21V+
         tVU8s+FoDIIfXFvB69WSpwnHtZttbBU898ngwVsoF4MLn9Kgw8Tbsj9yOEsY0SwcNiVu
         vckB9rHI2Ljol+TOJ7DUZP2pnVVSCjiq9YVP007LVwFyCQD3Z/wPXR9oJy8v6ObSB9wY
         EmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697083; x=1712301883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9VxbCTgzZ80UmziOWsKJFOvNNy0Qw1c5wWNUXcCD38=;
        b=O+Uypvz/JRJ3D1XTUr/Prp7WkZSAcavvFsvAFNjPET7erS0ZFC+DEQDlLY2P140ggU
         u9Gs6jE1GH4hM8NbFpUkXiksnXe0y4thp8ZF7AsBqH2fKXzYrPxVNjCTfa3oGFxQcmg/
         yLi5pqInivHWKl0PEvh25ed4pP2yGxPXEzBzV8wOdmP7lGcmL9HR5YFPurMa2tvEge8c
         KTRSYrxa3IeDiEBQ1k26ZinrpbIHcDe9RC3NQK+6aOAQaSV3hE495nAO7ZKLTfDEjeXV
         q0nVNjz0FceOZx9sw4fn8bsbJEnmrlzVQoZIBn03NRDSUP6TM3HY3XqO5ou7O4otnUPH
         /nLA==
X-Forwarded-Encrypted: i=1; AJvYcCUe6JDhppCalSPkQynoSw7MVo5dM/KcMYTB1KzgeZCQNyOmLtdY9+K6RMbCKWo1Le40viXr0qz5BJn4Y3DL2Tz4K8+Hwtw2Y/NBa1RO5qJQ
X-Gm-Message-State: AOJu0Yyk4VSk9IS7uSexxqowvZg2XppUp9s/eVadSYUnV3dShSNV0QuJ
	lnm+oVK/DFFUx0d0fZuFrjcce2GIpavN7mEgSMZqU3Nqeif38guViHJrJxOfYR8=
X-Google-Smtp-Source: AGHT+IEb5QR4f0wxokXnCFueIg3e5DUC8zxXcfXICifgdBJpQrnHEBOFNWDHzDiuuKhBOVbgthprFw==
X-Received: by 2002:a05:6a20:ce4d:b0:1a3:c460:1a4f with SMTP id id13-20020a056a20ce4d00b001a3c4601a4fmr1590367pzb.59.1711697083202;
        Fri, 29 Mar 2024 00:24:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:42 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v4 00/15] Unified cross-architecture kernel-mode FPU API
Date: Fri, 29 Mar 2024 00:18:15 -0700
Message-ID: <20240329072441.591471-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_002446_192093_F0F0A3C2 
X-CRM114-Status: GOOD (  16.52  )
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
v3: https://lore.kernel.org/linux-kernel/20240327200157.1097089-1-samuel.holland@sifive.com/
v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v4:
 - Add missed CFLAGS changes for recov_neon_inner.c
   (fixes arm build failures)
 - Fix x86 include guard issue (fixes x86 build failures)

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit riscv ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

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

Samuel Holland (14):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86/fpu: Fix asm/fpu/types.h include guard
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
 arch/x86/include/asm/fpu/types.h              |  6 +-
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
 include/linux/fpu.h                           | 12 +++
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 +------
 lib/raid6/Makefile                            | 33 +++-----
 lib/test_fpu.h                                |  8 ++
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
 lib/test_fpu_impl.c                           | 37 +++++++++
 38 files changed, 348 insertions(+), 193 deletions(-)
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
