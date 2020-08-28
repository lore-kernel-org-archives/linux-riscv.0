Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014CEC433E7
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC4C4207DF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 17:21:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXl55Y5g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="eOLdnASN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC4C4207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sY1RqLX45EjCdGzkSyQlODLn/9AITxPBpNogbnBTzAI=; b=AXl55Y5gId0HCPH5my/WpqZr18
	8b3RbhNzSDmERLi93uipZvEjoqixdCJuQ9vHZ0pnKW1QuHAED6rcuZa1j72eWJdScssrQlRb45BZ2
	5idvSRi0ZchbEx8KdvIcR+pZ5tHBVApBKZrx4XdrARjQ5lCNI3o9EiNGpXUz1oT/yGHheuQ7WN4vc
	BLN1cT0THnZPYN/WDeNs2L35ZQkDZGBfm6VmPU/c0r7iJEruPRkjdCg5hvgbt9coNpFz0N/kgEjhC
	8c1xcc2/Gb4ey400A03kM1PMD3GraP6if8VbgIzcSbfxy+HN5I/wI03I6nBexnU978x3A1bFm4Xcf
	yFVJSlBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBi3V-0006Qb-Vf; Fri, 28 Aug 2020 17:20:50 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBi3R-0006Nw-TB
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 17:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598635246; x=1630171246;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gHenN6fwJGp5BObIYNPC3TZqcQqp7idU10NNnHU1wyQ=;
 b=eOLdnASNpS8waNFLfP+HeFBkqQfmZy/FIuJMQ2+BaXnPlQXoTHLNngR7
 uQBw8oj+DrbLTJyh7gnDnxB8hgai8Waz3fiWXywTM5Q9RGg93bhbz6Zvw
 y1AT6Byv16THSMdGdLZDRZJFROGY9dQdJ8HgLwvTRxdywCFf+I2sSIN5m
 OHnNSWI8riY0S6a82Q5IisNLK5anEAel33sf5VTVeq4ZV8xRwOmhVdv/l
 3giXXsG0wtFfWHEF30uMovfIz6yjc6xlV523e0ernTkezeNMmEqluzqMl
 cX7KMkZ28s4m0lR8xYfaHgySVkN+yx/804XOKgazkJR/YFHa8RXygTl+b Q==;
IronPort-SDR: 8KsObkFFwJT1F3YQ8qWrOSU7ZQ3pKI1zD9NMn3PDQDEvECjMByTg6Ya6dhrEX/ZJwsHx5p/2Lt
 96hX6uMqC+pJk3iIXx5mUjcjoGj/Yo4rTfTJLvoAaqdiCEQp2J2tCVb71QrfZaJSGISDjGHNPg
 gB5aGZF5ioHZmlW8tTW9EwkKSriLLJUm4m6J5ou7pYCLNzODcbJB0l6scLbNf0jICyxTI/qG+M
 v0EGle/IFAdPEl8DoREPfUgP27q2ntIHAUT3qm7Ry075yih7qnvDJf6Q1jI6fGYjjRDtnaZIv1
 CP8=
X-IronPort-AV: E=Sophos;i="5.76,364,1592841600"; d="scan'208";a="150414069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2020 01:20:43 +0800
IronPort-SDR: 6qPpkwPhiMx4YI8sucQ9bHfU6O+RhlmbPtLeYt1e+oSqZ+2yBh2dBfvClVFdllIc/5lLiCeOUJ
 aO90xEI/uUwQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 10:08:14 -0700
IronPort-SDR: ldEYICpeaM843o92uGCkExcLgncDIk+5aq2ei6+za4TuMPcSGbsH5252HtlnN6bcwl8Uf7E4Dj
 xbTV4ZcaT/5A==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.137])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2020 10:20:41 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/9] Add UEFI support for RISC-V
Date: Fri, 28 Aug 2020 10:20:27 -0700
Message-Id: <20200828172036.8056-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_132046_248111_280F618C 
X-CRM114-Status: GOOD (  18.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Ingo Molnar <mingo@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: v5.9-rc2 
U-Boot: v2020.07 
OpenSBI: master

Patch 1-3 are generic riscv feature addition required for UEFI support.
Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
https://www.spinics.net/lists/linux-efi/msg19144.html
Patch 8 just renames arm-init code so that it can be used across different
architectures.
Patch 9 adds the runtime services for RISC-V.

The working set of patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v7

The patches have been verified on following platforms:
1. Qemu (both RV32 & RV64) for the following bootflow
   OpenSBI->U-Boot->Linux
   EDK2->Linux
2. HiFive unleashed using (RV64) for the following bootflow
   OpenSBI->U-Boot->Linux
   EDK2->Linux

Thanks Abner & Daniel for all work done for EDK2.
The EDK2 instructions are available here.
https://github.com/JohnAZoidberg/riscv-edk2-docker/

Note:
1. Currently, EDK2 RISC-V port doesn't support OVMF package. That's why
EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER should be enabled to load initrd via
commandline until OVMF patches are available.

2. For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
beyond 1G of physical memory for RV32.

3. Runtime services have been verified with fwts on EDK2.

***********************************************************************
[root@fedora-riscv ~]# fwts uefirtvariable
Running 1 tests, results appended to results.log
Test: UEFI Runtime service variable interface tests.                        
  Test UEFI RT service get variable interface.            1 passed             
  Test UEFI RT service get next variable name interface.  4 passed             
  Test UEFI RT service set variable interface.            7 passed, 1 warning  
  Test UEFI RT service query variable info interface.     1 passed             
  Test UEFI RT service variable interface stress test.    2 passed             
  Test UEFI RT service set variable interface stress t..  4 passed             
  Test UEFI RT service query variable info interface s..  1 passed             
  Test UEFI RT service get variable interface, invalid..  5 passed             
  Test UEFI RT variable services supported status.        1 skipped 

Test           |Pass |Fail |Abort|Warn |Skip |Info |
uefirtvariable |   25|     |     |    1|    1|     |
Total:         |   25|    0|    0|    1|    1|    0|

***********************************************************************

Changes from v6->v7:
1. Fixed build error reported on linux-next for patch2.

Changes from v5->v6:
1. Fixed the static declaration for pt_ops.
2. Added Reviewed/Acked-by.

Changes from v4->v5:
1. Late mappings allocations are now done through function pointers.
2. EFI run time services are verified using full linux boot and fwts using EDK2.

Changes from v3->v4:
1. Used pgd mapping to avoid copying DT to bss.

Changes from v2->v3:
1. Fixed few bugs in run time services page table mapping.
2. Dropped patch 1 as it is already taken into efi-tree.
3. Sent few generic mmu fixes as a separate series to ease the merge conflicts.

Changes from v1->v2:
1. Removed patch 1 as it is already taken into efi-tree.
2. Fixed compilation issues with patch 9.
3. Moved few function prototype declaration to header file to keep kbuild happy.

Changes from previous version:
1. Added full ioremap support.
2. Added efi runtime services support.
3. Fixes mm issues

Anup Patel (1):
RISC-V: Move DT mapping outof fixmap

Atish Patra (8):
RISC-V: Add early ioremap support
RISC-V: Implement late mapping page table allocation functions
include: pe.h: Add RISC-V related PE definition
RISC-V: Add PE/COFF header for EFI stub
RISC-V: Add EFI stub support.
efi: Rename arm-init to efi-init common for all arch
RISC-V: Add EFI runtime services
RISC-V: Add page table dump support for uefi

arch/riscv/Kconfig                            |  25 +++
arch/riscv/Makefile                           |   1 +
arch/riscv/configs/defconfig                  |   1 +
arch/riscv/include/asm/Kbuild                 |   1 +
arch/riscv/include/asm/efi.h                  |  56 +++++
arch/riscv/include/asm/fixmap.h               |  16 +-
arch/riscv/include/asm/io.h                   |   1 +
arch/riscv/include/asm/mmu.h                  |   2 +
arch/riscv/include/asm/pgtable.h              |   5 +
arch/riscv/include/asm/sections.h             |  13 ++
arch/riscv/kernel/Makefile                    |   5 +
arch/riscv/kernel/efi-header.S                | 104 ++++++++++
arch/riscv/kernel/efi.c                       | 105 ++++++++++
arch/riscv/kernel/head.S                      |  17 +-
arch/riscv/kernel/head.h                      |   2 -
arch/riscv/kernel/image-vars.h                |  51 +++++
arch/riscv/kernel/setup.c                     |  18 +-
arch/riscv/kernel/vmlinux.lds.S               |  22 +-
arch/riscv/mm/init.c                          | 191 +++++++++++++-----
arch/riscv/mm/ptdump.c                        |  48 ++++-
drivers/firmware/efi/Kconfig                  |   3 +-
drivers/firmware/efi/Makefile                 |   4 +-
.../firmware/efi/{arm-init.c => efi-init.c}   |   0
drivers/firmware/efi/libstub/Makefile         |  10 +
drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++
drivers/firmware/efi/riscv-runtime.c          | 143 +++++++++++++
include/linux/pe.h                            |   3 +
28 files changed, 901 insertions(+), 67 deletions(-)
create mode 100644 arch/riscv/include/asm/efi.h
create mode 100644 arch/riscv/include/asm/sections.h
create mode 100644 arch/riscv/kernel/efi-header.S
create mode 100644 arch/riscv/kernel/efi.c
create mode 100644 arch/riscv/kernel/image-vars.h
rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
create mode 100644 drivers/firmware/efi/riscv-runtime.c

--
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
