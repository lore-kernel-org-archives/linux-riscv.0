Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20007D3C922
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iadKBF5BIYP/xVfAJTqst+Ahb/6EcHSgSXUYZJS9QMQ=; b=Ed0UeGED0jcLIN
	2NekvfBSUQibXY0HHv7eMgl06T6w46q1YRCFMdbezi/CjUs8egbOkzC7hdv2pUOpxpftlo/vDndKv
	YU59iIYzJucc38OzWDW1sAu/ezR2rMMRLoK06FF4cP8ywI2zZESxegysebk0HDYakGX+mB3cwuinN
	c9UVeEW5vDtPXjy30A8yWBhB2TsRrV3P3BshML7K147sFij1pbeREbMa8v8I/paiim2BRC1u65r3c
	hNtTkosEdSBKiG26NMv+vrhEo8xXpZJ2lUMonIFnFp7Gm5+LFQfRQ85usMYUN6o8JE/W7tLDlwvVH
	k82exbtLntL2SMiiNZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpI-0000000Fc2R-1Rp8;
	Wed, 10 Dec 2025 16:14:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpE-0000000Fc0m-32bh
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-bd610f4425fso3834163a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383240; x=1765988040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GK9zmjBfxgr5slat9hfqbUZGOBRjwnlfuuFzR8VYgHI=;
        b=JqXusuM3Qgb/JiU+C3pen25wTKOyvomeZVhPi+P6eJCZZ5gXYjrJ1GFMh3L4oKWNiY
         bP2rZd4QF+sXtaHrqgRT+4GYZbbw1Mbeknd31zbAipZR8bgN6ZvLmAzjyt703L4VSXwM
         S3efjjd4cmJlnNmPRO/e6qZFSQYsL5dk5SE0EZILZdRxMxVYeFp/LGof+0hc8zhYv5Ra
         hOghzAbnRZDOc86vUDJdLs0RDLqJXh7eW/TTlufgjmM84fgI85PwM9liK2Y2TTWCjX9g
         jBOsufIZzycR18H8uwFmU7sJX2PNUiTi6/pSDvK9Zx048OhO1Uhaxr+DbwtKapjwqPNS
         rmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383240; x=1765988040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GK9zmjBfxgr5slat9hfqbUZGOBRjwnlfuuFzR8VYgHI=;
        b=XQVPEWLK1ZTyI/0T8szY+rvTT5CrlReW8/7c8XBsqt2GPg81ITDDJjJ/aZdT16kCGh
         sGn6sCR4iG40rhh/fgslv3paaBo0nbJ/dyo7ibKL8QV3vEkDvnQTuTOzGJL4tLpFybB5
         ixhXY7kdtsEx1j0dfO6U3IpLIgUhLlFw9zRWhWnFVkM4TbmKhFsOtelDwmsxkgwcpkkN
         s/R6NFg/IGmjJauXBRQJ7NoDWdJ5K11KpVRjL9QvyOJzTW6C5zWPyOx1laQae0fLFmni
         IJxRZnlpAVTv4elvZvLnjha+u0t+GJzVjFZZGEIwZ6ELIKm8y0Ll/nqJuBxJpqjh5hvm
         0afw==
X-Gm-Message-State: AOJu0YzDJKI6rWire/c48WxEsXOfJlXEuxddROK92s+9Id+q9rhEfsvX
	mPvJpbb4aCrZHmb7La4bkjCzGtbQNWfhVq+LG3eJnItW6ta9l0aYg1Nmg5ljJjElgLc=
X-Gm-Gg: ASbGncvmHlAT7Ys3vNGEGKfJyicWDTbYIbt6VoZLmHxual/Uj/H2Yu6w0CZfuyoksEz
	jPdf4wR4fgM7HEKmrNQ89kD604IWUz92/squCMzq7umaDya59RehJ4wTFHm7Cs5U0VcnFjjkWSC
	IkJoROHkoSTvJ+N6dfXAG00W+XuTVm3OaJLZqmrCGzM/npn4ESCKacQOhFlZ9eznhVlcnx/QYAy
	v+oRyNUzX+V5IKd4BvB0NjHynFVxAFus/Erp/HtrxAyo2cndeFcRwiUUtaTtKNxBTurmeRnkeCb
	pdE4rkUgY7FVIKddKjG1bNOIuVdeRhuuMKIhLkYMg9+PKjibJBUA3eWuVPwH3HooVsvrmFVBU/e
	sNJZbCmqrN7oWb5xhX5nlU0WTmyd7agRGuVxP+hcRj18A9V2H+qMwKm+6pkWBqnyDGhWykydFKZ
	J4p2K7wl6fGC5IeAGbBdPmFZt3T2A4R4lCxA2cQxZYuOdfwiLeUQ23oug3Up3pYQOobPxHeIz78
	WqdMPyr/dJAEawXt1wWSYI=
X-Google-Smtp-Source: AGHT+IGstbrO0+5BpMtje1UosEaKFKisKVR08X0ctxWdXY/+pnwjDnVa8KRREZFQZNx5zce+1D4tow==
X-Received: by 2002:a05:7022:487:b0:119:e56b:9899 with SMTP id a92af1059eb24-11f295e9299mr2332077c88.0.1765383239496;
        Wed, 10 Dec 2025 08:13:59 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:13:59 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:41 -0800
Subject: [PATCH RFC 04/10] riscv: kconfig: Make extensions tristate
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-4-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=35513;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=MwDMgRQUj9IYUhivKXBxMhq2adjFQkiajg5twmoVRzo=;
 b=q1v3m9t/Zk143QzjSCsWMf9uV/IXAWQqc0YzQmcRkBGOb5m0iBtl6V3Fx4xfaeR2YlRO92/aJ
 4nCfsZjRpmcDpoe+lvFV9qO3WLGBapF6cdpUGvNk5edkzNCMdqb4Vev
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081400_825477_FB997F29 
X-CRM114-Status: GOOD (  19.24  )
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

Use a tristate for CONFIG_RISCV_ISA_* to signal the three states:
- y -> Hardware will be assumed to support the extension.
- m -> The kernel will detect at boot if the extension is supported by the
       hardware.
- n -> Hardware will be assumed to not support the extension.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.extensions                      | 259 ++++++++++++++-------
 arch/riscv/include/asm/asm-prototypes.h            |   2 +-
 arch/riscv/include/asm/barrier.h                   |   2 +-
 arch/riscv/include/asm/cmpxchg.h                   |   2 +-
 arch/riscv/include/asm/hugetlb.h                   |   2 +-
 arch/riscv/include/asm/kgdb.h                      |   2 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h           |   2 +-
 arch/riscv/include/asm/mmu.h                       |   2 +-
 arch/riscv/include/asm/mmu_context.h               |   4 +-
 arch/riscv/include/asm/page.h                      |   2 +-
 arch/riscv/include/asm/pgtable-64.h                |   2 +-
 arch/riscv/include/asm/processor.h                 |   2 +-
 arch/riscv/include/asm/simd.h                      |   2 +-
 arch/riscv/include/asm/uprobes.h                   |   2 +-
 arch/riscv/include/asm/vector.h                    |   2 +-
 arch/riscv/include/asm/xor.h                       |   2 +-
 arch/riscv/kernel/Makefile                         |   6 +-
 arch/riscv/kernel/head.S                           |   2 +-
 arch/riscv/kernel/kgdb.c                           |   2 +-
 arch/riscv/kernel/probes/decode-insn.c             |   2 +-
 arch/riscv/kernel/probes/uprobes.c                 |   2 +-
 arch/riscv/kernel/process.c                        |   2 +-
 arch/riscv/kernel/ptrace.c                         |  12 +-
 arch/riscv/kernel/signal.c                         |   2 +-
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |   2 +-
 arch/riscv/lib/Makefile                            |  14 +-
 arch/riscv/lib/strcmp.S                            |   2 +-
 arch/riscv/lib/strlen.S                            |   2 +-
 arch/riscv/lib/strncmp.S                           |   2 +-
 arch/riscv/lib/uaccess.S                           |   4 +-
 arch/riscv/mm/hugetlbpage.c                        |   2 +-
 lib/raid6/Makefile                                 |   4 +-
 lib/raid6/algos.c                                  |   4 +-
 34 files changed, 229 insertions(+), 134 deletions(-)

diff --git a/arch/riscv/Kconfig.extensions b/arch/riscv/Kconfig.extensions
index c9433209117d..e3ca147765b1 100644
--- a/arch/riscv/Kconfig.extensions
+++ b/arch/riscv/Kconfig.extensions
@@ -7,6 +7,11 @@
 
 # Base extensions
 
+config TOOLCHAIN_HAS_C
+	def_bool y
+	help
+	  Platform supports compressed instructions
+
 config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
@@ -17,21 +22,50 @@ config RISCV_ISA_C
 
 	  If you don't know what to do here, say Y.
 
+config TOOLCHAIN_HAS_F
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imaf)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imaf)
+	depends on AS_HAS_OPTION_ARCH
+
+config TOOLCHAIN_HAS_D
+	bool
+	default y
+	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64imad)
+	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imad)
+	depends on AS_HAS_OPTION_ARCH
+
 config FPU
 	bool "FPU support"
 	default y
+	depends on TOOLCHAIN_HAS_F
+	depends on TOOLCHAIN_HAS_D
+	select RISCV_ISA_F
+	select RISCV_ISA_D
 	help
 	  Say N here if you want to disable all floating-point related procedure
 	  in the kernel.
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_F
+	def_bool n
+	help
+	  Platform supports F
+
+config RISCV_ISA_D
+	def_bool n
+	help
+	  Platform supports D
+
 # Standard extensions
 
 config RISCV_ISA_SUPM
-	bool "Supm extension for userspace pointer masking"
+	tristate "Supm extension for userspace pointer masking"
 	depends on 64BIT
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
 	  Add support for pointer masking in userspace (Supm) when the
 	  underlying hardware extension (Smnpm or Ssnpm) is detected at boot.
@@ -39,15 +73,18 @@ config RISCV_ISA_SUPM
 	  If this option is disabled, userspace will be unable to use
 	  the prctl(PR_{SET,GET}_TAGGED_ADDR_CTRL) API.
 
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
+
 config RISCV_ISA_SVNAPOT
-	bool "Svnapot extension support for supervisor mode NAPOT pages"
+	tristate "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
-	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
-	  time and enable its usage.
-
 	  The Svnapot extension is used to mark contiguous PTEs as a range
 	  of contiguous virtual-to-physical translations for a naturally
 	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
@@ -56,30 +93,35 @@ config RISCV_ISA_SVNAPOT
 	  When optimizing for low memory consumption and for platforms without
 	  the Svnapot extension, it may be better to say N here.
 
-	  If you don't know what to do here, say Y.
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config RISCV_ISA_SVPBMT
-	bool "Svpbmt extension support for supervisor mode page-based memory types"
+	tristate "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
-	   Adds support to dynamically detect the presence of the Svpbmt
-	   ISA-extension (Supervisor-mode: page-based memory types) and
-	   enable its usage.
+	  The memory type for a page contains a combination of attributes
+	  that indicate the cacheability, idempotency, and ordering
+	  properties for access to that page.
+
+	  The Svpbmt extension is only available on 64-bit cpus.
+
+	  Select "m" for boot-time detection for portability.
 
-	   The memory type for a page contains a combination of attributes
-	   that indicate the cacheability, idempotency, and ordering
-	   properties for access to that page.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
 
-	   The Svpbmt extension is only available on 64-bit cpus.
+	  If you don't know what to do here, say m.
 
-	   If you don't know what to do here, say Y.
 
 config RISCV_ISA_ZAWRS
-	bool "Zawrs extension support for more efficient busy waiting"
-	depends on RISCV_ALTERNATIVE
-	default y
+	tristate "Zawrs extension support for more efficient busy waiting"
+	depends on NONPORTABLE || m
+	default m
 	help
 	  The Zawrs extension defines instructions to be used in polling loops
 	  which allow a hart to enter a low-power state or to trap to the
@@ -95,15 +137,19 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZABHA
-	bool "Zabha extension support for atomic byte/halfword operations"
+	tristate "Zabha extension support for atomic byte/halfword operations"
 	depends on TOOLCHAIN_HAS_ZABHA
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
 	  Enable the use of the Zabha ISA-extension to implement kernel
-	  byte/halfword atomic memory operations when it is detected at boot.
+	  byte/halfword atomic memory operations.
 
-	  If you don't know what to do here, say Y.
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config TOOLCHAIN_HAS_ZACAS
 	bool
@@ -113,15 +159,19 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZACAS
-	bool "Zacas extension support for atomic CAS"
+	tristate "Zacas extension support for atomic CAS"
 	depends on TOOLCHAIN_HAS_ZACAS
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
 	  Enable the use of the Zacas ISA-extension to implement kernel atomic
-	  cmpxchg operations when it is detected at boot.
+	  cmpxchg operations.
 
-	  If you don't know what to do here, say Y.
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config TOOLCHAIN_HAS_ZBA
 	bool
@@ -132,16 +182,18 @@ config TOOLCHAIN_HAS_ZBA
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBA
-	bool "Zba extension support for bit manipulation instructions"
-	default y
+	tristate "Zba extension support for bit manipulation instructions"
+	depends on NONPORTABLE || m
+	default m
 	help
-	   Add support for enabling optimisations in the kernel when the Zba
-	   extension is detected at boot.
+	  The Zba extension provides instructions to accelerate the generation
+	  of addresses that index into arrays of basic data types.
 
-	   The Zba extension provides instructions to accelerate the generation
-	   of addresses that index into arrays of basic data types.
+	  Select "m" for boot-time detection for portability.
 
-	   If you don't know what to do here, say Y.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config TOOLCHAIN_HAS_ZBB
 	bool
@@ -152,18 +204,19 @@ config TOOLCHAIN_HAS_ZBB
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBB
-	bool "Zbb extension support for bit manipulation instructions"
-	depends on RISCV_ALTERNATIVE
-	default y
+	tristate "Zbb extension support for bit manipulation instructions"
+	depends on NONPORTABLE || m
+	default m
 	help
-	   Adds support to dynamically detect the presence of the ZBB
-	   extension (basic bit manipulation) and enable its usage.
+	  The Zbb extension provides instructions to accelerate a number
+	  of bit-specific operations (count bit population, sign extending,
+	  bitrotation, etc).
+
+	  Select "m" for boot-time detection for portability.
 
-	   The Zbb extension provides instructions to accelerate a number
-	   of bit-specific operations (count bit population, sign extending,
-	   bitrotation, etc).
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
 
-	   If you don't know what to do here, say Y.
+	  If you don't know what to do here, say m.
 
 config TOOLCHAIN_HAS_ZBC
 	bool
@@ -174,17 +227,18 @@ config TOOLCHAIN_HAS_ZBC
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBC
-	bool "Zbc extension support for carry-less multiplication instructions"
-	depends on RISCV_ALTERNATIVE
-	default y
+	tristate "Zbc extension support for carry-less multiplication instructions"
+	depends on NONPORTABLE || m
+	default m
 	help
-	   Adds support to dynamically detect the presence of the Zbc
-	   extension (carry-less multiplication) and enable its usage.
+	  The Zbc extension could accelerate CRC (cyclic redundancy check)
+	  calculations.
+
+	  Select "m" for boot-time detection for portability.
 
-	   The Zbc extension could accelerate CRC (cyclic redundancy check)
-	   calculations.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
 
-	   If you don't know what to do here, say Y.
+	  If you don't know what to do here, say m.
 
 config TOOLCHAIN_HAS_ZBKB
 	bool
@@ -196,61 +250,87 @@ config TOOLCHAIN_HAS_ZBKB
 
 config RISCV_ISA_ZBKB
 	tristate "Zbkb extension support for bit manipulation instructions"
-	depends on RISCV_ALTERNATIVE
 	depends on NONPORTABLE || m
 	default m
 	help
-	   Adds support to dynamically detect the presence of the ZBKB
-	   extension (bit manipulation for cryptography) and enable its usage.
+	  The Zbkb extension provides instructions to accelerate a number
+	  of common cryptography operations (pack, zip, etc).
 
-	   The Zbkb extension provides instructions to accelerate a number
-	   of common cryptography operations (pack, zip, etc).
+	  Select "m" for boot-time detection for portability.
 
-	   If you don't know what to do here, say Y.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	select RISCV_DMA_NONCOHERENT
 	select DMA_DIRECT_REMAP
 	help
-	   Adds support to dynamically detect the presence of the ZICBOM
-	   extension (Cache Block Management Operations) and enable its
-	   usage.
+	  The Zicbom extension can be used to handle for example
+	  non-coherent DMA support on devices that need it.
+
+	  Select "m" for boot-time detection for portability.
 
-	   The Zicbom extension can be used to handle for example
-	   non-coherent DMA support on devices that need it.
+	  Select "y" for compile-time optimization. Only available with NONPORTABLE.
 
-	   If you don't know what to do here, say Y.
+	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOZ
 	bool "Zicboz extension support for faster zeroing of memory"
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
-	   Enable the use of the Zicboz extension (cbo.zero instruction)
-	   when available.
+	  Enable the use of the Zicboz extension (cbo.zero instruction)
+	  when available.
+
+	  The Zicboz extension is used for faster zeroing of memory.
 
-	   The Zicboz extension is used for faster zeroing of memory.
+	  Select "m" for boot-time detection for portability.
 
-	   If you don't know what to do here, say Y.
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config RISCV_ISA_ZICBOP
 	bool "Zicbop extension support for cache block prefetch"
 	depends on MMU
-	depends on RISCV_ALTERNATIVE
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
-	  Adds support to dynamically detect the presence of the ZICBOP
-	  extension (Cache Block Prefetch Operations) and enable its
-	  usage.
-
 	  The Zicbop extension can be used to prefetch cache blocks for
 	  read/write fetch.
 
-	  If you don't know what to do here, say Y.
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
+
+## Required extensions
+
+config TOOLCHAIN_HAS_ZICSR
+	def_bool y
+	help
+	  Platform supports explicit Zicsr
+
+config RISCV_ISA_ZICSR
+	def_bool y
+	help
+	  Platform supports explicit Zicsr
+
+config TOOLCHAIN_HAS_ZIFENCEI
+	def_bool y
+	help
+	  Platform supports explicit Zifencei
+
+config RISCV_ISA_ZIFENCEI
+	def_bool y
+	help
+	  Platform supports explicit Zifencei
 
 ## Vector options
 
@@ -263,16 +343,21 @@ config TOOLCHAIN_HAS_V
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_V
-	bool "VECTOR extension support"
+	tristate "VECTOR extension support"
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
 	select DYNAMIC_SIGFRAME
-	default y
+	depends on NONPORTABLE || m
+	default m
 	help
 	  Say N here if you want to disable all vector related procedure
 	  in the kernel.
 
-	  If you don't know what to do here, say Y.
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
 
 config RISCV_ISA_V_DEFAULT_ENABLE
 	bool "Enable userspace Vector by default"
diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index a9988bf21ec8..7896f24c9119 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -9,7 +9,7 @@ long long __lshrti3(long long a, int b);
 long long __ashrti3(long long a, int b);
 long long __ashlti3(long long a, int b);
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 
 #ifdef CONFIG_MMU
 asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n, bool enable_sum);
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 700ba3f922cb..64e91500d316 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -66,7 +66,7 @@ do {									\
 	___p1;								\
 })
 
-#ifdef CONFIG_RISCV_ISA_ZAWRS
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZAWRS)
 #define smp_cond_load_relaxed(ptr, cond_expr) ({			\
 	typeof(ptr) __PTR = (ptr);					\
 	__unqual_scalar_typeof(*ptr) VAL;				\
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 8712cf9c69dc..0fee37752098 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -356,7 +356,7 @@ union __u128_halves {
 
 #endif /* CONFIG_64BIT && CONFIG_RISCV_ISA_ZACAS && CONFIG_TOOLCHAIN_HAS_ZACAS */
 
-#ifdef CONFIG_RISCV_ISA_ZAWRS
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZAWRS)
 /*
  * Despite wrs.nto being "WRS-with-no-timeout", in the absence of changes to
  * @val we expect it to still terminate within a "reasonable" amount of time
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 0872d43fc0c0..f2d8c33e3fea 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -16,7 +16,7 @@ bool arch_hugetlb_migration_supported(struct hstate *h);
 #define arch_hugetlb_migration_supported arch_hugetlb_migration_supported
 #endif
 
-#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#if IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT)
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, unsigned long sz);
diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index 78b18e2fd771..123d0c8ec15b 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -15,7 +15,7 @@
 #define BUFMAX                  2048
 static_assert(BUFMAX > NUMREGBYTES,
 	      "As per KGDB documentation, BUFMAX must be larger than NUMREGBYTES");
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 #define BREAK_INSTR_SIZE	2
 #else
 #define BREAK_INSTR_SIZE	4
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..6f6f646f9086 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -12,7 +12,7 @@
 
 #include <linux/types.h>
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 #include <asm/vector.h>
 #include <asm/kvm_host.h>
 
diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
index cf8e6eac77d5..14ce156c9ede 100644
--- a/arch/riscv/include/asm/mmu.h
+++ b/arch/riscv/include/asm/mmu.h
@@ -27,7 +27,7 @@ typedef struct {
 	unsigned long interp_fdpic_loadmap;
 #endif
 	unsigned long flags;
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 	u8 pmlen;
 #endif
 } mm_context_t;
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 8c4bc49a3a0f..83de55a905a6 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -20,7 +20,7 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
 {
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 	next->context.pmlen = 0;
 #endif
 	switch_mm(prev, next, NULL);
@@ -40,7 +40,7 @@ static inline int init_new_context(struct task_struct *tsk,
 
 DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
 
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 #define mm_untag_mask mm_untag_mask
 static inline unsigned long mm_untag_mask(struct mm_struct *mm)
 {
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index ffe213ad65a4..7bf143d68374 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -43,7 +43,7 @@
 
 #ifndef __ASSEMBLER__
 
-#ifdef CONFIG_RISCV_ISA_ZICBOZ
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZICBOZ)
 void clear_page(void *page);
 #else
 #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514..af949a2ae66e 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -106,7 +106,7 @@ enum napot_cont_order {
 #define napot_cont_mask(order)	(~(napot_cont_size(order) - 1UL))
 #define napot_pte_num(order)	BIT(order)
 
-#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#if IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT)
 #define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
 #else
 #define HUGE_MAX_HSTATE		2
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index da5426122d28..b22feac304f1 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -190,7 +190,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
 
 extern unsigned long signal_minsigstksz __ro_after_init;
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
 #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
 #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
diff --git a/arch/riscv/include/asm/simd.h b/arch/riscv/include/asm/simd.h
index adb50f3ec205..7730e4de1d4e 100644
--- a/arch/riscv/include/asm/simd.h
+++ b/arch/riscv/include/asm/simd.h
@@ -16,7 +16,7 @@
 
 #include <asm/vector.h>
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 /*
  * may_use_simd - whether it is allowable at this time to issue vector
  *                instructions or access the vector register file
diff --git a/arch/riscv/include/asm/uprobes.h b/arch/riscv/include/asm/uprobes.h
index 5008f76cdc27..b00d8ed95403 100644
--- a/arch/riscv/include/asm/uprobes.h
+++ b/arch/riscv/include/asm/uprobes.h
@@ -9,7 +9,7 @@
 
 #define MAX_UINSN_BYTES		8
 
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 #define UPROBE_SWBP_INSN	__BUG_INSN_16
 #define UPROBE_SWBP_INSN_SIZE	2
 #else
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index b61786d43c20..7a506c780874 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -9,7 +9,7 @@
 #include <linux/types.h>
 #include <uapi/asm-generic/errno.h>
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 
 #include <linux/stringify.h>
 #include <linux/sched.h>
diff --git a/arch/riscv/include/asm/xor.h b/arch/riscv/include/asm/xor.h
index 96011861e46b..c2b7cd7cfde4 100644
--- a/arch/riscv/include/asm/xor.h
+++ b/arch/riscv/include/asm/xor.h
@@ -5,7 +5,7 @@
 
 #include <linux/hardirq.h>
 #include <asm-generic/xor.h>
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 #include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/asm-prototypes.h>
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..a52f58810f16 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -80,8 +80,10 @@ obj-$(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)	+= vec-copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
-obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
-obj-$(CONFIG_RISCV_ISA_V)	+= kernel_mode_vector.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_V)),)
+obj-y				+= vector.o
+obj-y				+= kernel_mode_vector.o
+endif
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
 obj-$(CONFIG_SMP)		+= cpu_ops.o
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..61fec769ff3d 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -446,7 +446,7 @@ SYM_CODE_START_LOCAL(reset_regs)
 .Lreset_regs_done_fpu:
 #endif /* CONFIG_FPU */
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	csrr	t0, CSR_MISA
 	li	t1, COMPAT_HWCAP_ISA_V
 	and	t0, t0, t1
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 15fec5d1e6de..147fe3a24eb9 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -366,7 +366,7 @@ void kgdb_arch_exit(void)
 /*
  * Global data
  */
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 const struct kgdb_arch arch_kgdb_ops = {
 	.gdb_bpt_instr = {0x02, 0x90},	/* c.ebreak */
 };
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb9f..685a0be6542b 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -28,7 +28,7 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * Simulate instructions list:
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 	RISCV_INSN_REJECTED(c_jal,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index cc15f7ca6cc1..133f646019f1 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -11,7 +11,7 @@
 
 bool is_swbp_insn(uprobe_opcode_t *insn)
 {
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 	return (*insn & 0xffff) == UPROBE_SWBP_INSN;
 #else
 	return *insn == UPROBE_SWBP_INSN;
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 31a392993cb4..e3e501001916 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -176,7 +176,7 @@ void flush_thread(void)
 	fstate_off(current, task_pt_regs(current));
 	memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
 #endif
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	/* Reset vector state */
 	riscv_v_vstate_ctrl_init(current);
 	riscv_v_vstate_off(task_pt_regs(current));
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 8e86305831ea..02e310e7e2a2 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -25,10 +25,10 @@ enum riscv_regset {
 #ifdef CONFIG_FPU
 	REGSET_F,
 #endif
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	REGSET_V,
 #endif
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 	REGSET_TAGGED_ADDR_CTRL,
 #endif
 };
@@ -87,7 +87,7 @@ static int riscv_fpr_set(struct task_struct *target,
 }
 #endif
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 static int riscv_vr_get(struct task_struct *target,
 			const struct user_regset *regset,
 			struct membuf to)
@@ -155,7 +155,7 @@ static int riscv_vr_set(struct task_struct *target,
 }
 #endif
 
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 static int tagged_addr_ctrl_get(struct task_struct *target,
 				const struct user_regset *regset,
 				struct membuf to)
@@ -203,7 +203,7 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_fpr_set,
 	},
 #endif
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	[REGSET_V] = {
 		USER_REGSET_NOTE_TYPE(RISCV_VECTOR),
 		.align = 16,
@@ -214,7 +214,7 @@ static const struct user_regset riscv_user_regset[] = {
 		.set = riscv_vr_set,
 	},
 #endif
-#ifdef CONFIG_RISCV_ISA_SUPM
+#if IS_ENABLED(CONFIG_RISCV_ISA_SUPM)
 	[REGSET_TAGGED_ADDR_CTRL] = {
 		USER_REGSET_NOTE_TYPE(RISCV_TAGGED_ADDR_CTRL),
 		.n = 1,
diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 08378fea3a11..532d64f2f539 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -68,7 +68,7 @@ static long save_fp_state(struct pt_regs *regs,
 #define restore_fp_state(task, regs) (0)
 #endif
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 
 static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 {
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index b951d0f12482..0a94826726be 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -100,7 +100,7 @@ test_kprobes_branch_addr8:
 	.option pop
 SYM_FUNC_END(test_kprobes_branch)
 
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 
 SYM_FUNC_START(test_kprobes_c_j)
 	li a0, 0
@@ -196,7 +196,7 @@ SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_branch_addr6
 	RISCV_PTR test_kprobes_branch_addr7
 	RISCV_PTR test_kprobes_branch_addr8
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 	RISCV_PTR test_kprobes_branch_c_j_addr1
 	RISCV_PTR test_kprobes_branch_c_j_addr2
 	RISCV_PTR test_kprobes_c_jr_addr1
@@ -218,7 +218,7 @@ SYM_DATA_START(test_kprobes_functions)
 	RISCV_PTR test_kprobes_jalr
 	RISCV_PTR test_kprobes_auipc
 	RISCV_PTR test_kprobes_branch
-#ifdef CONFIG_RISCV_ISA_C
+#if IS_ENABLED(CONFIG_RISCV_ISA_C)
 	RISCV_PTR test_kprobes_c_j
 	RISCV_PTR test_kprobes_c_jr
 	RISCV_PTR test_kprobes_c_jalr
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..562e0a727423 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -15,7 +15,7 @@
 #include <asm/kvm_vcpu_vector.h>
 #include <asm/vector.h>
 
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 	unsigned long *isa = vcpu->arch.isa;
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index bbc031124974..0df8ba0d3b77 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -10,11 +10,17 @@ lib-y			+= strncmp.o
 endif
 lib-y			+= csum.o
 ifeq ($(CONFIG_MMU), y)
-lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_V)),)
+lib-y			+= uaccess_vector.o
+endif
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
-lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_ZICBOZ)),)
+lib-y			+= clear_page.o
+endif
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
-lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
-lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_V)),)
+lib-y			+= xor.o
+lib-y			+= riscv_v_helpers.o
+endif
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 65027e742af1..82ea8807f8b8 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -44,7 +44,7 @@ SYM_FUNC_START(strcmp)
  * The code was published as part of the bitmanip manual
  * in Appendix A.
  */
-#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)
 strcmp_zbb:
 
 .option push
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index eb4d2b7ed22b..ec2082991933 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -34,7 +34,7 @@ SYM_FUNC_START(strlen)
 /*
  * Variant of strlen using the ZBB extension if available
  */
-#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)
 strlen_zbb:
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index 062000c468c8..06bcc33f4529 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -47,7 +47,7 @@ SYM_FUNC_START(strncmp)
 /*
  * Variant of strncmp using the ZBB extension if available
  */
-#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
+#if IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)
 strncmp_zbb:
 
 .option push
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c..4579196fce6c 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -13,7 +13,7 @@
 	.endm
 
 SYM_FUNC_START(__asm_copy_to_user)
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy
@@ -41,7 +41,7 @@ SYM_FUNC_START(fallback_scalar_usercopy)
 SYM_FUNC_END(fallback_scalar_usercopy)
 
 SYM_FUNC_START(__asm_copy_to_user_sum_enabled)
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	ALTERNATIVE("j fallback_scalar_usercopy_sum_enabled", "nop", 0, RISCV_ISA_EXT_ZVE32X, CONFIG_RISCV_ISA_V)
 	REG_L	t0, riscv_v_usercopy_threshold
 	bltu	a2, t0, fallback_scalar_usercopy_sum_enabled
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 375dd96bb4a0..c15ca4769406 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -2,7 +2,7 @@
 #include <linux/hugetlb.h>
 #include <linux/err.h>
 
-#ifdef CONFIG_RISCV_ISA_SVNAPOT
+#if IS_ENABLED(CONFIG_RISCV_ISA_SVNAPOT)
 pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	unsigned long pte_num;
diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 5be0a4e60ab1..e71e86f8f0db 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -10,7 +10,9 @@ raid6_pq-$(CONFIG_ALTIVEC) += altivec1.o altivec2.o altivec4.o altivec8.o \
 raid6_pq-$(CONFIG_KERNEL_MODE_NEON) += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
 raid6_pq-$(CONFIG_S390) += s390vx8.o recov_s390xc.o
 raid6_pq-$(CONFIG_LOONGARCH) += loongarch_simd.o recov_loongarch_simd.o
-raid6_pq-$(CONFIG_RISCV_ISA_V) += rvv.o recov_rvv.o
+ifneq ($(filter y m,$(CONFIG_RISCV_ISA_V)),)
+raid6_pq-y += rvv.o recov_rvv.o
+endif
 
 hostprogs	+= mktables
 
diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index 799e0e5eac26..6830202249db 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -74,7 +74,7 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_lsx,
 #endif
 #endif
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	&raid6_rvvx1,
 	&raid6_rvvx2,
 	&raid6_rvvx4,
@@ -113,7 +113,7 @@ const struct raid6_recov_calls *const raid6_recov_algos[] = {
 	&raid6_recov_lsx,
 #endif
 #endif
-#ifdef CONFIG_RISCV_ISA_V
+#if IS_ENABLED(CONFIG_RISCV_ISA_V)
 	&raid6_recov_rvv,
 #endif
 	&raid6_recov_intx1,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
