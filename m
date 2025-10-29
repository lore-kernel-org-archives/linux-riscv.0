Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D12CCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dYVELVJjXBJoTG54xVhDFehjdexylsVUWHxc4WkTIsA=; b=DNtAOg0CJLqn2z
	b5zPMWoUn2QNgdE3U9ZV084pFtI/oiQPK3lD7xrlzdEtBTEnVfUH0IOKvRtH05HugbNYDvSAECrPj
	96U99Q1svGAow6T7QS7ozRpUznvuV+maUG8BqOb16DBhCXTgUWPqEQCT/wX5n+IMDDlmcJhYfzFw9
	x66aW25RvPH+PdWh/1UQy2iU7RM/Mp/NZdGJ0KCAyFbcoBpv869b+C7QS7mQk9G7wK46IwedsXs7i
	zWlfk850YBcfnb8APuKY3739scMtle7afSJKI/XV0wWob8Y6d7Eyp6xl7SeO2mJT6S15ib1SzHpi5
	N7LIY4BcT/ys7GY6QsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4KY-00000000xqW-3SWq;
	Wed, 29 Oct 2025 11:27:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4KX-00000000xpS-0HTT
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:06 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso7658263a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737224; x=1762342024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/A6oM3VT03v+OO6JYlGjLYI0SFwHFSmDU7wY8ZWBxg=;
        b=SC2bl+4wUXGaDvVUKjhsGNalg3H+ZUvG60PbCYokGP8VR9ayHx8GC5qErXtLbbj+H7
         5qzP2cZ+Se4ntokK5GmB0HXyJwnVlrdL71bC1qP8vBuuhVg/e7JfQQQU3sKJWApXopYs
         u6JuHnWHsUqdkjpsllqPhB0eAgDbo3troWvs2Tn/aml+LeEdJC7KDVlGCPSQTL9F3kcn
         XwUjERlnOFyRtba7E86K/NKEbA+wkBmpKXqZH+ArSOalfMZ+p408U+eSZRqCtbWTWjCv
         XmcA2hxOIOrAQT7yMJX+Sa6MupyxXQYXbicIjjP6dB858OP7byoKrtr+lNX1AS4ZGTNA
         Kf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737224; x=1762342024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/A6oM3VT03v+OO6JYlGjLYI0SFwHFSmDU7wY8ZWBxg=;
        b=Vi41gHk1ghvEaIT1RyrMN1yZYK5oAEjvdO0tIqCp1nt/B/XcQfGPBwQP5pP7F4TXO3
         /tb9n9XtBRJkwwQHp4qYPG1yEElKj5vQe6jRMTyFJYDVYCDc6vAQED1VEzmgvx6FxMcz
         KNNfjvd2eLgERqXXq1JmYKy0GNBl1UT1wPxStEB6hoW2Dj2b+kIkCKIZCCuOx0fAwnGE
         tz8isVDSTtLXZioseAbQu9/dp+YvMHWiCr0dR1AOzfG3xTQPR7yp7GxXuaMY3wcrJBrn
         jwq4nwRo9+7o5tyY+zRaHEaNT7y0UOotfB8wgULBIZXYrC9S/vB81d06ishGDF6Unk5C
         f7MA==
X-Gm-Message-State: AOJu0Yzq5nbJKomxVZNQSVJGFo6sY1rM23YHBos7/mY4eCBQM5iJ0gFT
	os1/4YWRDMPvpBSS4uLy6VH3ZQmsi0iWchKm0mhtKYTegsS0Q1UtZVOgv/6sarlGguhL6OH+DQ+
	OyHuFSqHDQw==
X-Gm-Gg: ASbGncvYjJodAKhSIhooTo+7TYsUh2jaIqaYSzk+ncyYepthSZIumzvpWCZqI7sHUO4
	KEwP+xuVBntQ2KtxseX8ifrISU8oT96atJDFEbjE6rsvbM2CSbhOTWpDGuZq/uS+P9JNDhWLX9N
	mX2sk01NDLJivXGcXRQN07wCMhbzZvSRy3H4q7MD/39Lrl8n9MEbteGmmCoC9bD1US9Lq24wjXQ
	9n25zxH+/ywaJ6XxVIA5zLknpi9ljnvJblkcev5ntt75xSjwWAzslANNmwfJRBCQzJcI2YJdW2p
	R/ZREIG2Uc2t9bvjl87yb9B0fDtdYqgcp8prbAfpBPlQ2TuJoB5LROe88QWm68JENBEufjk6/Y4
	/qyZK3Bx0jwq940kk9v/GPyo/bAadkE9GBSMYJ9LNbcTzcY0hjPhgEf5JAhwlNSUES7lcWULu8+
	ubvP322qzkIvJbyanNjW761cpEjy4r
X-Google-Smtp-Source: AGHT+IHpjKO2jUEb6+cQytmuQWp7mpQLNMuWE1ztXt3I54KFHlYNvHVC4AHhBNanzFdemT5w+k0ovA==
X-Received: by 2002:a17:90b:134b:b0:32d:db5b:7636 with SMTP id 98e67ed59e1d1-3403a28efb0mr2855484a91.27.1761737223563;
        Wed, 29 Oct 2025 04:27:03 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:03 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 00/10] Add RAS support for RISC-V architecture
Date: Wed, 29 Oct 2025 16:56:38 +0530
Message-ID: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042705_132213_D3C22A9E 
X-CRM114-Status: GOOD (  12.63  )
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

RAS stands for Reliability, Availability and Serviceability.

This series implements the RAS support for RISC-V architecture using
RISC-V RERI specification. It is conformant to ACPI platform error
interfaces (APEI). It uses the highest priority Supervisor Software
Events (SSE)[2] to deliver the hardware error events to the kernel.
The SSE implementation has already been merged in OpenSBI. Clement
has sent a patch series for its implemenation in Linux kernel.[5]

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
[2] SSE Section in OpenSBI v3.0: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0/riscv-sbi.pdf
[3] Qemu source (with RERI emulation support): https://github.com/ventanamicro/qemu.git (branch: dev-upstream)
[4] EDK2: https://github.com/ventanamicro/edk2.git (branch: dev-upstream)
[5] SSE Kernel Patches (v7): https://lore.kernel.org/all/20250908181717.1997461-1-cleger@rivosinc.com/

Changes in v2:
 - Made changes to be conformant with SSE v7 patches
 - Fixed some bot warnings

Himanshu Chauhan (10):
  riscv: Define ioremap_cache for RISC-V
  riscv: Define arch_apei_get_mem_attribute for RISC-V
  acpi: Introduce SSE in HEST notification types
  riscv: Add fixmap indices for GHES IRQ and SSE contexts
  riscv: conditionally compile GHES NMI spool function
  riscv: Add functions to register ghes having SSE notification
  riscv: Add RISC-V entries in processor type and ISA strings
  riscv: Introduce HEST SSE notification handlers
  riscv: Select HAVE_ACPI_APEI required for RAS
  riscv: Enable APEI GHES driver in defconfig

 arch/riscv/Kconfig                     |   1 +
 arch/riscv/configs/defconfig           |   3 +
 arch/riscv/include/asm/acpi.h          |  20 ++++
 arch/riscv/include/asm/fixmap.h        |   8 ++
 arch/riscv/include/asm/io.h            |   3 +
 drivers/acpi/apei/Kconfig              |   5 +
 drivers/acpi/apei/ghes.c               | 103 +++++++++++++++--
 drivers/firmware/efi/cper.c            |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c | 147 +++++++++++++++++++++++++
 include/acpi/actbl1.h                  |   3 +-
 include/linux/riscv_sbi_sse.h          |  16 +++
 11 files changed, 300 insertions(+), 12 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
