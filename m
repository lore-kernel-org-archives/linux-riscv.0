Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BDFC10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5eLpWjh+uV5SgRq6/zppQjOkVgpGoZfec82KNalanOA=; b=In5Bs8p+uAN7Eh
	sVFwzHHbhdqDGQLpNfOJF5m04cw+z9tobnYS9HvjvEsUO5cMdr+Z1dllhIeQglu9T3sLIrbitPsKV
	SDfnIvOc51BsfW3bRNb18wSj9yN6ZA1/YzcXfnEAq1JOuyHN0/tjnmf98D3guivGzV3Kdfgl35HVH
	me4xd05om8i/fUyz55+dAzqqTlVr7KpZO8D61UiI3TUfsr18j/kwGzG1SHi6LtLHtqUlPFPK7Tqfw
	PUxplbqfpaJI3+g7t6LihltI9WaKkvcDCEfBXd6FdZlFi4VO6NFJh5uT8n/EI4FJJ2EtpP1iGd0Sc
	gOwzWge9grkvK4yWyimQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpL-00EnPe-1Z;
	Fri, 08 Dec 2023 05:55:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpI-00EnNG-0x
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d075392ff6so14023415ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014903; x=1702619703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIC4glHzB+IOAGM7YCu4gQFdGXeLpWj/I7OZVSGOh7k=;
        b=dctx+L6xOCYkO4f4zF2odE+2TYqRp+19eu/qQLjXXdCchQVEimIcOwA1NR8bmXZWNb
         9Jy2pwR/RJIv5zgayJHFBTnhy/RNzyU40aV31eiVFVEq936D+kGn1VqKUIGUKAQpPbhr
         t5f75zFC8RDKkbFq+jLEhAUUprSa/uCS4fHaJqHZWRqjvUidma2QEwQ3Mu4MpQndWogP
         ViOaGFfA8PZ4k6kgNJ2CANJcu3YjwuzytltFmCPTgZGbyVkUJzirmGIMg737Jj6h8FfJ
         LkqtGi6Or7jQrndvAd8RcFoRq58WfQDIO9P/yo916egcLFmOQWgS8WaGN4Ls19tKpLaK
         oS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014903; x=1702619703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIC4glHzB+IOAGM7YCu4gQFdGXeLpWj/I7OZVSGOh7k=;
        b=eaZQ/dOVACMqUWcbWeMq1wT2Yp08UsAjKc8KY2re4Ns4E1kzcNEb21Iab1qJw/XCAm
         9Hm3hY2nbHyKCuCAXSLBqje6H5koFdd9nlUVX2w50X2ygiQADbxmXo0YZJcpRgWhIlQS
         FViXLWrlBUihVcOC4WA6AA8ZU34RGhE8FJglWBvVm03rKH7RM9d9VUf7KSPLlVKfBa04
         4+JACwJ6n0HPGO+GwiF0HyktG2WXFsMOg0ZwbPVQd3uTE07eqR2IIwG86kwGGdMx5TWs
         L2pSrRr6XafoH4+JB8j0/TOt27n1CePbaqiqtUbm344PwYXJseNUj1T3K6RrAM0WeS7A
         vtog==
X-Gm-Message-State: AOJu0Yz3avw9iY9jlkoPG92R3ElIBjK6EVuj/DS/rGqO2H9vyzi5EH88
	SHCze4BkFu0LD7aFzZEWCMYtlA==
X-Google-Smtp-Source: AGHT+IHobgnIbAqUwh0qy5g87XS9Ops6tA3mZ0Tbbi2vny+WXvVENlMrplaMBh4oGzh2rC3HGh0NRQ==
X-Received: by 2002:a17:902:c20c:b0:1d0:6ffd:610c with SMTP id 12-20020a170902c20c00b001d06ffd610cmr481032pll.46.1702014902890;
        Thu, 07 Dec 2023 21:55:02 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:02 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 00/12] Unified cross-architecture kernel-mode FPU API
Date: Thu,  7 Dec 2023 21:54:30 -0800
Message-ID: <20231208055501.2916202-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215504_428485_A6CA3683 
X-CRM114-Status: GOOD (  11.54  )
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

This series supersedes my earier RISC-V specific series[1].

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

[1]: https://lore.kernel.org/linux-riscv/20231122030621.3759313-1-samuel.holland@sifive.com/


Samuel Holland (12):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Makefile                                      |  4 ++
 arch/Kconfig                                  |  9 +++++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++++
 arch/arm/include/asm/fpu.h                    | 17 +++++++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++++-
 arch/arm64/include/asm/fpu.h                  | 17 +++++++++
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 ++-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 ++-
 arch/powerpc/include/asm/fpu.h                | 28 ++++++++++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 ++
 arch/riscv/include/asm/fpu.h                  | 26 +++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 ++++++++++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 ++++++++++
 arch/x86/include/asm/fpu.h                    | 13 +++++++
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 33 +----------------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +-----------------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +-----------------
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 ++-----------
 lib/raid6/Makefile                            | 31 ++++------------
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 +++----------------
 lib/test_fpu_impl.c                           | 35 ++++++++++++++++++
 32 files changed, 255 insertions(+), 185 deletions(-)
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
