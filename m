Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5673C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WrTAc6Q+2O0SnSDTtRiJzePAv+/4RjuIlrY9aPvopJM=; b=ORCLJoHofe/A5D
	U1VAtX33GCHy7KkHte8mb+brMUVlT+VFWIMdiHhaiEZNApZLkRjUEgra/4/J4OaYtMWn9AKNGAh92
	lP6tZzA4YDRdZ5f4c06AfLS94yaZfcJ/pSbf7fqv+1TNwvNg6vkIbj0Wzkky8uRTD/zK6J9w11i6W
	c2KaWeRmC7a57yi+Kqu56flxSqNg8ElX+/2+2yabrOKeJoMYhp659y50P6+Mf2MsXu2sDBlMn0ToU
	wgWRhA1cKT0XB/1kNUIArR/w4H41/c1bDzVMbXkKsXRj2iATpIkiwvMaBPV7Fc2Tt5+GhuwsQxaGN
	WeU5uT2c5V3pDyOlLccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTq-0000000AuMV-0XSC;
	Wed, 27 Mar 2024 20:02:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTM-0000000Atx3-1xvB
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dddbe47ac1so8986015ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569719; x=1712174519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=K5OR07MWGqI5RjmBKl1qG67Ra9xo39s50E9YBx88ew5j3b6KIZZwgEwGRgyHRGAaim
         fLtL59xoc0WL0CpUC5VBj9WlxsVLScAVpcCSVTw7O98Rb4dGpop7PQtIp8M+YYxVZ+VM
         JKgLvdtkSugZ/I9fAm9eiNDtd1JCkWsUnIa60VdoEYs0AyojV1ccnac0R/fGgAcN8dzq
         YOMuPl32fcJyu9PqoZ4Af0Efn1ynVf+1lPydOhJCfAExFGbVj0YVs96IuKw6M37el+oP
         rUkbB1vbe43jgFQGiR/JkxlwDMdbAaYoXIvLcUTct5n/QRO5UAOsW0zPJgM/CRGqTWza
         OXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569719; x=1712174519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IfyGhgpaDuL/FUm+Bqequ3n7X/gQ/Scu0/x5tn5zB10=;
        b=kLcnuAeuEnHqVAqIlDi91PIwSeeAkC4OKfsbg6rJOvaQ6OtDEYsmix5PZvZ7MuHp6H
         gL1E8h84jtsIxz94y8mHef67SLCQpv7tMcaN6TwFxnrvgUuqJga5wJ3ByZgwpmk2wVA9
         E6OSRSuNmOcnctYGQPiW3Q0MKdjRZlzSZBy2+uP2ZluvmR2ckWlzmCy/8+LsLWJRv1jk
         DyE+PGWwRevXCwAlShZMNGynlVohtnxexq8o0/6v3x1kNnX2h4qgSnRCcrrRJ/O8dBuI
         sD7lZZSZOqmS6aD/bgkTKlLDVJv9p1jejEaSG84B8RDyFt19NwDw6nfJ6+jWpQgyYnlc
         FDjw==
X-Forwarded-Encrypted: i=1; AJvYcCWVVcRR+Qb8ju4b1qhbC0XRNuLjLfiJ3uArKbOpJqZvOglL5bevSg3fRZxjeOPmmzJ2go1/rMV2h3PyEZlSjzxJocRRziQ7Il/rLXRlcgjR
X-Gm-Message-State: AOJu0Yw2TgRQnGvFTE2IYAwUucEEvCXblIMCjqYGhV3nad4xG38xjW4s
	nB35igxpOS/qZGlKo3UefToV0Hz2dNSazRvxLkj0DTbury00Y3bbe/dh7esZAqE=
X-Google-Smtp-Source: AGHT+IEARU4E/EcVAHx8vARVbt2kMjNg+KIZramOtQSdDofKvpaWh4CU2DiZjPQFyzvcMxh9ySg0ww==
X-Received: by 2002:a17:902:d2cc:b0:1e0:e011:e3cb with SMTP id n12-20020a170902d2cc00b001e0e011e3cbmr442983plc.15.1711569718923;
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:01:58 -0700 (PDT)
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
Subject: [PATCH v3 00/14] Unified cross-architecture kernel-mode FPU API
Date: Wed, 27 Mar 2024 13:00:31 -0700
Message-ID: <20240327200157.1097089-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_130208_674667_91F893AB 
X-CRM114-Status: GOOD (  16.62  )
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
v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
