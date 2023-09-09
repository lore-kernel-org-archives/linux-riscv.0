Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2EEEB580
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JZ5MIs0J+vCSjSq5uOcQcsYVtKl8RAQPVzolrxRbte4=; b=Y9lgzR/psg8bi+
	x3OI/HVW9M9DZq23K2d7xZIRCxSeJpUyZuLsqVCbKgHzXB+I658piF1vOphU2acdO2RnWSJ6ZugYM
	W6hztIcpm3ANeun4QpJq4NxgLXtYZ14e8R10M01QflxScSaoG6ICNM1tQD2SJ0CosdP1G2K3ZVu+S
	7SKAMuazVbhO8LqgN1tLNetSKnW5NPDrMpsx712V4ONBkwc4jnTxbwc0lk8zNnQ3a7bOSCUexnG6y
	gNqGC1xfB97Nfiefd5Jj9sULKIuEllS1dAdhfmi2DAKR3qBrTFOkt1e3vsOszEu3VU9x32bLcSevT
	L0ANiacbzMVYZ20PygQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeyuF-00FYlD-1X;
	Sat, 09 Sep 2023 14:25:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeyuB-00FYkp-2O
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 14:25:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf5c314a57so22286735ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 Sep 2023 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694269544; x=1694874344; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D95G51GYdXlh9Qcl1z+wb6iLPnwzfRsoa1uIKAB9sfc=;
        b=gt5Dsx18d3j6NCGb+DZn/9qoyeIkWK3aMiQUvHvKun/d7+jF+5iVLOpUSkd9CqK+LS
         6Mw7Ld8BZCyShocwxcChdj9C0jGb2rMLEYZiqU25gPeWO8AFC6Ukx8t5LtyVPrZWhr5y
         I0mqlktmHDFFAsGtpIzZIMy0zaBfk699Ulzz1VOBNwQdrN83MKQ35t00GUK+KteT6qA9
         uarmKZLi41t9Mgv1lcHrh2fhBB1D/LGJVeeqCTADfsdYubHivEGwchXgxn7075iH7ubW
         Ch6xWaym3DlWE7Pzt7YrPwqmn+2KdSjt4Qriq7FkMylqCwAStNY7Zhp1NluPwyJ/PwvQ
         Xxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694269544; x=1694874344;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D95G51GYdXlh9Qcl1z+wb6iLPnwzfRsoa1uIKAB9sfc=;
        b=sCJE7GkRdx/VJBYOkwqkGJFO/rDNqL/gBpnhduM1CV1shwbqrPwoVD22BIjS8H+bw5
         0n+G+gaYsb6SMqiNXCJxU/HoaQpiMvgvmexov/Yi+79Y3a/bO1hBAGxMLs7LdaOP8i9w
         nHu8GZsCm2YaiAN9o7q35JoJxRvQG+gMMPQniqWi4QRtX2Bh/IHyw4OZyiX4E7ArAv8k
         Sam0cVbttwEQtTI2RpCBKBk4RhWYLYWnpDuDoxDdRjZLomVPFwMwZyALKbCnHEzlaNws
         z8MK3edDNy5cAuCb5kMnEA6Xf+QrHGxWsa8vyo25xceWY4gX+qSYsNtoreNBjOcen6h2
         8dGQ==
X-Gm-Message-State: AOJu0YwyPOQ1y+33rzLHIcqB7oInXrvvLlU0gt2O5czR2eXs//+qAwzN
	SKnSOtDOI5avpxMLerQgJxFy5vX4BOBJWkQbVL4=
X-Google-Smtp-Source: AGHT+IGOxTrco6qxSbGsbf8eLATPHqV1DgdcxiLOULTUHYT4485WQpNeBBjQWK/TmYagcmQz0Zb3CQ==
X-Received: by 2002:a17:902:f546:b0:1be:e851:c070 with SMTP id h6-20020a170902f54600b001bee851c070mr5222934plf.22.1694269544139;
        Sat, 09 Sep 2023 07:25:44 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b001b53c8659fesm3326320plb.30.2023.09.09.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 07:25:43 -0700 (PDT)
Date: Sat, 09 Sep 2023 07:25:43 -0700 (PDT)
X-Google-Original-Date: Sat, 09 Sep 2023 07:23:02 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.6 Merge Window, Part 2 (try 2)
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-2cae48f5-f42a-4432-b0e2-bc1ee3e01ce5@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_072548_025801_7E5C011E 
X-CRM114-Status: GOOD (  24.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-6.6-mw1'
The following changes since commit e0152e7481c6c63764d6ea8ee41af5cf9dfac5e9:

  Merge tag 'riscv-for-linus-6.6-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-09-01 08:09:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.6-mw2-2

for you to fetch changes up to c6a906cce61a8015b622707f9c12003f90673399:

  soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met (2023-09-08 11:25:29 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.6 Merge Window, Part 2 (try 2)

* The kernel now dynamically probes for misaligned access speed, as
  opposed to relying on a table of known implementations.
* Support for non-coherent devices on systems using the Andes AX45MP
  core, including the RZ/Five SoCs.
* Support for the V extension in ptrace(), again.
* Support for KASLR.
* Support for the BPF prog pack allocator in RISC-V.
* A handful of bug fixes and cleanups.

----------------------------------------------------------------
None of these are super critical so no big deal if it's too late, but I do feel
pretty bad that Prabhakar's been pushing on the DMA stuff for a long time and
figured it'd be better to send this out even if it's late.

The diffstat looks good this time and nobody's mentioned any issues (at least
that I can see) so I think this one is looking better, but apologies in
advance if something else has gone off the rails.  The BPF docs merge conflict
is also gone, so I just have the internal one in libstub for KASLR.  I think I
got that correct, but here's the blurb from yesterday:

I resolved the libstub conflict as part of mergeing in the patch set.  The
actual conflict also looks pretty straight-forward: we refactored some KASLR
handling out to shared code, but there was also a new argument added.  I
resolved it when picking up the patch series, but after talking to some of the
Arm folks I'm not quite sure that was the right way to go.  So it won't show up
when actually merging, but figured I'd say something anyway as end up doing
that sort of "fix a conflict when merging a patch set" from time to time.

----------------------------------------------------------------
Alexandre Ghiti (5):
      riscv: Introduce virtual kernel mapping KASLR
      riscv: Dump out kernel offset information on panic
      arm64: libstub: Move KASLR handling functions to kaslr.c
      libstub: Fix compilation warning for rv32
      riscv: libstub: Implement KASLR by using generic functions

Andy Chiu (1):
      RISC-V: Add ptrace support for vectors

Arnd Bergmann (2):
      riscv: dma-mapping: only invalidate after DMA, not flush
      riscv: dma-mapping: skip invalidation before bidirectional DMA

Evan Green (2):
      RISC-V: Probe for unaligned access speed
      RISC-V: alternative: Remove feature_probe_func

Lad Prabhakar (11):
      riscv: dma-mapping: switch over to generic implementation
      riscv: asm: vendorid_list: Add Andes Technology to the vendors list
      riscv: errata: Add Andes alternative ports
      riscv: mm: dma-noncoherent: nonstandard cache operations support
      dt-bindings: cache: andestech,ax45mp-cache: Add DT binding documentation for L2 cache controller
      cache: Add L2 cache management for Andes AX45MP RISC-V core
      soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
      riscv: Kconfig: Select DMA_DIRECT_REMAP only if MMU is enabled
      riscv: Kconfig.errata: Drop dependency for MMU in ERRATA_ANDES_CMO config
      riscv: Kconfig.errata: Add dependency for RISCV_SBI in ERRATA_ANDES config
      soc: renesas: Kconfig: For ARCH_R9A07G043 select the required configs if dependencies are met

Palmer Dabbelt (6):
      Merge patch series "RISC-V: Probe for misaligned access speed"
      Merge patch series "riscv: dma-mapping: unify support for cache flushes"
      Merge patch series "Add non-coherent DMA support for AX45MP"
      Merge patch "RISC-V: Add ptrace support for vectors"
      Merge patch series "riscv: Introduce KASLR"
      Merge patch series "bpf, riscv: use BPF prog pack allocator in BPF JIT"

Puranjay Mohan (4):
      bpf: make bpf_prog_pack allocator portable
      riscv: extend patch_text_nosync() for multiple pages
      riscv: implement a memset like function for text
      bpf, riscv: use prog pack allocator in the BPF JIT

 .../bindings/cache/andestech,ax45mp-cache.yaml     |  81 ++++++++
 Documentation/riscv/hwprobe.rst                    |  11 +-
 MAINTAINERS                                        |   7 +
 arch/arm64/include/asm/efi.h                       |   2 +
 arch/riscv/Kconfig                                 |  28 ++-
 arch/riscv/Kconfig.errata                          |  21 ++
 arch/riscv/errata/Makefile                         |   1 +
 arch/riscv/errata/andes/Makefile                   |   1 +
 arch/riscv/errata/andes/errata.c                   |  66 +++++++
 arch/riscv/errata/thead/errata.c                   |   8 -
 arch/riscv/include/asm/alternative.h               |   8 +-
 arch/riscv/include/asm/cpufeature.h                |   2 +
 arch/riscv/include/asm/dma-noncoherent.h           |  28 +++
 arch/riscv/include/asm/efi.h                       |   2 +
 arch/riscv/include/asm/errata_list.h               |   5 +
 arch/riscv/include/asm/page.h                      |   3 +
 arch/riscv/include/asm/patch.h                     |   1 +
 arch/riscv/include/asm/vendorid_list.h             |   1 +
 arch/riscv/include/uapi/asm/ptrace.h               |  13 +-
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/alternative.c                    |  24 +--
 arch/riscv/kernel/copy-unaligned.S                 |  71 +++++++
 arch/riscv/kernel/copy-unaligned.h                 |  13 ++
 arch/riscv/kernel/cpufeature.c                     | 104 ++++++++++
 arch/riscv/kernel/image-vars.h                     |   1 +
 arch/riscv/kernel/patch.c                          | 114 ++++++++++-
 arch/riscv/kernel/pi/Makefile                      |   2 +-
 arch/riscv/kernel/pi/cmdline_early.c               |  13 ++
 arch/riscv/kernel/pi/fdt_early.c                   |  30 +++
 arch/riscv/kernel/ptrace.c                         |  79 ++++++++
 arch/riscv/kernel/setup.c                          |  25 +++
 arch/riscv/kernel/smpboot.c                        |   3 +-
 arch/riscv/mm/dma-noncoherent.c                    | 103 +++++++++-
 arch/riscv/mm/init.c                               |  36 +++-
 arch/riscv/mm/pmem.c                               |  13 ++
 arch/riscv/net/bpf_jit.h                           |   3 +
 arch/riscv/net/bpf_jit_comp64.c                    |  60 ++++--
 arch/riscv/net/bpf_jit_core.c                      | 106 ++++++++--
 drivers/Kconfig                                    |   2 +
 drivers/Makefile                                   |   1 +
 drivers/cache/Kconfig                              |  11 ++
 drivers/cache/Makefile                             |   3 +
 drivers/cache/ax45mp_cache.c                       | 213 +++++++++++++++++++++
 drivers/firmware/efi/libstub/Makefile              |   4 +-
 drivers/firmware/efi/libstub/arm64-stub.c          | 117 ++---------
 drivers/firmware/efi/libstub/efistub.h             |   8 +
 drivers/firmware/efi/libstub/kaslr.c               | 159 +++++++++++++++
 drivers/firmware/efi/libstub/riscv-stub.c          |  33 ++--
 drivers/soc/renesas/Kconfig                        |   5 +
 include/uapi/linux/elf.h                           |   2 +
 kernel/bpf/core.c                                  |   8 +-
 51 files changed, 1440 insertions(+), 216 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
 create mode 100644 arch/riscv/errata/andes/Makefile
 create mode 100644 arch/riscv/errata/andes/errata.c
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 arch/riscv/kernel/copy-unaligned.S
 create mode 100644 arch/riscv/kernel/copy-unaligned.h
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c
 create mode 100644 drivers/cache/Kconfig
 create mode 100644 drivers/cache/Makefile
 create mode 100644 drivers/cache/ax45mp_cache.c
 create mode 100644 drivers/firmware/efi/libstub/kaslr.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
