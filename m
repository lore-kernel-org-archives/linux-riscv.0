Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCEEC282C1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 13:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1YYxDfvwUHviUOUikZcu7Q7byypjp+uRGTZmCUGFKo=; b=EIA0r/hZ9VB0jz
	0IJIf/U+WVAXtrU/N1alhXsc9fdWHKz48qaLcWngSw2AcDJZHNR2eA5Ev+TtxUe2jkEKXfhp5tucp
	9/jfsr+GJYk6Of+ry8iRggjbtRgc2teFlDCupDWMe8mZInbYiwwEUevbpaiv/57/2G6/peTel71J6
	5tmrjXm2xRSkqk4Bh2vwtgy9e/2rpP9y1lDo6RNFimc7azXQOGWDI2gy8BxW9jcyuAei3PIH+3MVi
	2SnHOYjaM28mN+7KoRkoMF6qTaoqvguqyyvtZgpKRw5YbCSpbA1+Cm2luYC6QKsVSCE78PWZSa/Bz
	xjvU2EnMXtn4a7Q2xB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tndoh-00000007V7L-2Fd5;
	Thu, 27 Feb 2025 13:20:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnd84-00000007NzG-211K
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 12:36:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2234daaf269so20844825ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 04:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740659799; x=1741264599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xtME809Eew76HgNd2VZgiOyw7ntFEPKx2r2sqfXdyNY=;
        b=oEhFoTEnn4AunPFGLkMWrDtkDqDYtzVdwddtGob0br5I00cM1uUqvoKIPD20aDrSi5
         t2ZfJa1OAM+WwlAwRfR9EcZnbnqwyHpwOjM3TEwiv3li1sV1Ca3fBJ+fSwycDRz85tp4
         6UcNCez7ygLT5OGK0ad5LdvWBsOb9tZHWQV0d4j2qMtDq3o6XMOqNtXzZ2H/nniAS3tB
         XrAy2lDoOwfzUmiX5oCa0p0h4MH3dLb6gTKwe0ykt5HJ/5vVSxzuGFx9zlYvGgi5yBaO
         SZJacgsobTMbM5SrXY4ioA7adfBWMDkokcwwQXhvjiwYJM3kwlpPJWvz/wZYdXqJGnWo
         JxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740659799; x=1741264599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtME809Eew76HgNd2VZgiOyw7ntFEPKx2r2sqfXdyNY=;
        b=MK7mWFFNPa9NBo3rBmt8hqTUN8TbVT5F8wX0DNM60hK3eoYJFHl9sOb+N+3U9F0BJ+
         86MlWI0H3qL4AjlLv/5XAGakWV+LrDs6gFVGuAhJmB5IcWb8kZIvot+EemVZ77FwtOZc
         /ePTEyxdR/wzmwLt3BqqCTz3c99SeCfqiF5Aq8bQ3jecxA3CRuKpponqCs9ZUyWa/kdV
         L87R1UZkXdearRxl0RGoQ64ExcdwelwacCPgSR0zZ6u1YLZqhTq0tAu+8qCadNZ3UIxb
         geCLPI6G+6Jxz3HeX2aiei0rfZ3gK96rkkLKCONiaenHxhWAqN5YJ1uv+AsA+g1oKBC+
         ddxQ==
X-Gm-Message-State: AOJu0Yz7Qsje33ao2PZN2KfdvfOJT+R/3rrKhuqvXgjy/vKSa1AVMflb
	QhWp37dQ4Sp8r9hx9FUJoxUlX/KKY9f1L9oIDgXobir1wkQXMkEb+1usrLhfhV8bxXesVMgOa1s
	7zUc=
X-Gm-Gg: ASbGncsY7sEHsnDsOwLp6K76pLCpR8Jmrj7efC7aMdlo2T0D6zE+EwpuOOhSsMOLiRB
	2EGpfiSN0dTzZHrxerp41HDvPv7aegiwNStOc44qKLNE1vWQitYOutUnTHxQ5gB/s03fjZYs+Wo
	I+b2q3oYrAMNYm5VOu0yrhbHQzVShYETkjok410zHMH9t4NP/Rf9AI+TVtukNakb/Oij/yETk0Z
	rygfrPnxpLD0jTvDewRSDzHdQTM3sBKCUkhH1VSFggPrvQ27zjbJSsw9Ecg0yVFd5xE5OCyfXph
	fmj7pPgf2T2pjtgAHJu2pfU6MuRDHVss2uMP
X-Google-Smtp-Source: AGHT+IH56tY+4vK57WuCNQiVCZOgB7TNFoVCq9IHBAMlZTCbUrlVJLG7r/B7T96EdJnPgpthhW1GjA==
X-Received: by 2002:a17:902:ecd0:b0:21f:542e:dd0a with SMTP id d9443c01a7336-22307e6586fmr197711655ad.41.1740659799030;
        Thu, 27 Feb 2025 04:36:39 -0800 (PST)
Received: from ventana-bhyve.. ([49.37.249.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bddsm13219135ad.140.2025.02.27.04.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:36:38 -0800 (PST)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v1 00/10] Add RAS support for RISC-V architecture
Date: Thu, 27 Feb 2025 18:06:18 +0530
Message-ID: <20250227123628.2931490-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_043640_529516_13C49193 
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series implements the RAS (Reliability, Availability and Serviceability)
support for RISC-V architecture using RISC-V RERI specification. It is conformant
to ACPI platform error interfaces (APEI). It uses the highest priority
Supervisor Software Events (SSE)[2] to deliver the hardware error events to the kernel.
The SSE implemetation has already been merged in OpenSBI. Clement has sent a patch series for
its implemenation in Linux kernel.[5]

The GHES driver framework is used as is with the following changes for RISC-V:
	1. Register each ghes entry with SSE layer. Ghes notification vector is SSE event.
	2. Add RISC-V specific entries for processor type and ISA string
	3. Add fixmap indices GHES SSE Low and High Priority to help map and read from
	   physical addresses present in GHES entry.
	4. Other changes to build/configure the RAS support

How to Use:
----------
This RAS stack consists of Qemu[3], OpenSBI, EDK2[4], Linux kernel and devmem utility to inject and trigger
errors. Qemu [Ref.] has support to emulate RISC-V RERI. The RAS agent is implemented in OpenSBI which
creates CPER records. EDK2 generates HEST table and populates it with GHES entries with the help of
OpenSBI.

Qemu Command:
------------
<qemu-dir>/build/qemu-system-riscv64 \
    -s -accel tcg -m 4096 -smp 2 \
    -cpu rv64,smepmp=false \
    -serial mon:stdio \
    -d guest_errors -D ./qemu.log \
    -bios <opensbi-dir>/build/platform/generic/firmware/fw_dynamic.bin \
    -monitor telnet:127.0.0.1:55555,server,nowait \
    -device virtio-gpu-pci -full-screen \ 
    -device qemu-xhci \
    -device usb-kbd \
    -blockdev node-name=pflash0,driver=file,read-only=on,filename=<edk2-build-dir>/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT_CODE.fd \
    -blockdev node-name=pflash1,driver=file,filename=<edk2-build-dir>/RiscVVirtQemu/RELEASE_GCC5/FV/RISCV_VIRT_VARS.fd \
    -M virt,pflash0=pflash0,pflash1=pflash1,rpmi=true,reri=true,aia=aplic-imsic \
    -kernel <kernel image> \
    -initrd <rootfs image> \
    -append "root=/dev/ram rw console=ttyS0 earlycon=uart8250,mmio,0x10000000"

Error Injection & Triggering:
----------------------------
devmem 0x4010040 32 0x2a1
devmem 0x4010048 32 0x9001404
devmem 0x4010044 8 1

The above commands injects a TLB error on CPU 0.

Sample Output (CPU 0):
---------------------
[   34.370282] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 1
[   34.371375] {1}[Hardware Error]: event severity: recoverable
[   34.372149] {1}[Hardware Error]:  Error 0, type: recoverable
[   34.372756] {1}[Hardware Error]:   section_type: general processor error
[   34.373357] {1}[Hardware Error]:   processor_type: 3, RISCV
[   34.373806] {1}[Hardware Error]:   processor_isa: 6, RISCV64
[   34.374294] {1}[Hardware Error]:   error_type: 0x02
[   34.374845] {1}[Hardware Error]:   TLB error
[   34.375448] {1}[Hardware Error]:   operation: 1, data read
[   34.376100] {1}[Hardware Error]:   target_address: 0x0000000000000000

References:
----------
[1] RERI Specification: https://github.com/riscv-non-isa/riscv-ras-eri/releases/download/v1.0/riscv-reri.pdf
[2] SSE Section in OpenSBI v3.0: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc3/riscv-sbi.pdf
[3] Qemu source (with RERI emulation support): https://github.com/ventanamicro/qemu.git (branch: dev-upstream)
[4] EDK2: https://github.com/ventanamicro/edk2.git (branch: dev-upstream)
[5] SSE Kernel Patches: https://lore.kernel.org/linux-riscv/649fdead-09b0-4f94-a6ff-099fc970d890@rivosinc.com/T/

Himanshu Chauhan (10):
  riscv: Define ioremap_cache for RISC-V
  riscv: Define arch_apei_get_mem_attribute for RISC-V
  acpi: Introduce SSE in HEST notification types
  riscv: Add fixmap indices for GHES IRQ and SSE contexts
  riscv: conditionally compile GHES NMI spool function
  riscv: Add functions to register ghes having SSE notification
  riscv: Add RISC-V entries in processor type and ISA strings
  riscv: Introduce HEST SSE notification handlers
  riscv: Add config option to enable APEI SSE handler
  riscv: Enable APEI and NMI safe cmpxchg options required for RAS

 arch/riscv/Kconfig                 |   2 +
 arch/riscv/include/asm/acpi.h      |  20 ++++
 arch/riscv/include/asm/fixmap.h    |   8 ++
 arch/riscv/include/asm/io.h        |   3 +
 drivers/acpi/apei/Kconfig          |   5 +
 drivers/acpi/apei/ghes.c           | 102 +++++++++++++++++---
 drivers/firmware/efi/cper.c        |   3 +
 drivers/firmware/riscv/riscv_sse.c | 147 +++++++++++++++++++++++++++++
 include/acpi/actbl1.h              |   3 +-
 include/linux/riscv_sse.h          |  15 +++
 10 files changed, 296 insertions(+), 12 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
