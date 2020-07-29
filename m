Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AC0C433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA00720829
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NEqifnlE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MveV1PJb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA00720829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wCQcVqioofXnC2qLgiA6SczfXi9FMlmHpn9rLzT4cdA=; b=NEqifnlESQcvmGRrdH/cL04Z5Y
	VC5Y7g/8oZbG9rvDwKHvSqjNDRNiLS+WsNaJIBWiV3oyQruevgSLNlx2HrCnLOmPsiAsiIjI6W/3M
	3T/H+vEe7ziT+KKTMtDn4aafRZKdmr/EHaRUo5mGzkJIlGwRD7M+39g7P5gnp7F5a0ZpKuI00OgDL
	RcZ+DaQEntm1L56XNlpBaXqDUlTiQ0xWFeo0f8KuVI9EqRtH2N8C0lzuT3yR/yofWU8WCzyZOYAnE
	RUrR87rJDMGrChmNCQqA7NGOJMnVGpqfp0GiAkjBfnQelSyu3PbNytnXxmarbsFB32I3qhNQhEVHn
	roIicMdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0vd9-0004tX-Ds; Wed, 29 Jul 2020 23:37:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0vd5-0004qV-8W
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 23:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596065819; x=1627601819;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vaQcXC9di+Mc2s5KFNyp48HQd4ruw9ElPp3ceNLFrRM=;
 b=MveV1PJbdghxwAE1hLlS+5U4bo16dJKRO6DOVPhOYHuESW+JtAQqY8ZB
 7SFnCSuEAPFgocLz8Pz4P92ze8+c3CUIc3QQvIKtMC2wCbN+0OCI2jbUF
 VNEreH3gSKUemnwFV0icekKM53pgDffHn4CIsxwraOk2o+HCmG6IH64TK
 Egh0l+XdL8PrbyZfFF4fbLLI32UHldld4ndOaktPuDQxHUURQLasTInIH
 22hzBSF/it5Iqivg0vD80lyahxVI9w2kIfz/a97UZSrNzwNp5qWAfdPOt
 KgdNlt3cp3NX121kcFr2b4egZzfwDWE02nFnxDkn2vqMArhY7LSlJ2fWB w==;
IronPort-SDR: cZCUDb42miM0xULzei6RkloDP2bq6UIa6jv1slRjda92wyfjRDhMg8vftQ2TawtN+62KW5E8JN
 1klsKXl8vQ7QY9OoVWNgxdymfZpJCgGHCc4G34FItS0qlr84Y6syf22Nml2lSWb5R9VHOWMcJD
 Pzt9qHDYEeVcfbtX4AHLUKQkscesfWGH3XXqv7xWa8DrJQDamyyjXE9jAmOTymBpaeuboGpTY+
 9yB49j0PLpu5R8Jcl6HcDWHQej3Sbk2LiBQio7Kyg0rXcJvPcUbFgN0wlN8EKsUYzrRxnqDGhM
 d1A=
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="253037245"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2020 07:36:51 +0800
IronPort-SDR: vMzf6lXvF83Cr1WG3Z5+fuU7SzFxDDOFU9WtT/9QJpGNoH39CVSe62H8aTWrxLiw5kDOIIl+tt
 NOMW8KUGrnFLWDVBDCt27Du+owYCqDy4c=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 16:24:21 -0700
IronPort-SDR: cAK8YKv/xIcCDLCbQUt9z+oLhL3d8kz5nSiNkpu01AvlXXn7xtw5AUB4sT7uOC4yMr40YkMZMx
 TXsgvfR+HvPg==
WDCIronportException: Internal
Received: from jpf009043.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.210])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jul 2020 16:36:52 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v4 0/9] Add UEFI support for RISC-V
Date: Wed, 29 Jul 2020 16:36:26 -0700
Message-Id: <20200729233635.14406-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_193659_471020_229F381A 
X-CRM114-Status: GOOD (  21.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Yash Shah <yash.shah@sifive.com>, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: 5.8-rc7 + 1 exception vector setup patch (queued for for-next) 
U-Boot: v2020.07 
OpenSBI: master

This series depends on early setup of exeception vector patch
http://lists.infradead.org/pipermail/linux-riscv/2020-July/001207.html

Patch 1-3 are generic riscv feature addition required for UEFI support.
Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
https://www.spinics.net/lists/linux-efi/msg19144.html
Patch 8 just renames arm-init code so that it can be used across different
architectures. Patch 11 adds the runtime services for RISC-V.

The working set of patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.9_v4

The patches have been verified on Qemu/HiFive unleashed using bootefi command in
U-Boot for both RV32 and RV64.

For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
beyond 1G of physical memory for RV32.

Runtime services have been verified with fwts. Here is the snippet of the result.

***********************************************************************
This test run on 16/07/20 at 17:54:53 on host Linux fedora-riscv
5.8.0-rc5-00015-g5e61441080fd-dirty #938 SMP Thu Jul 16 14:50:11 PDT 2020
riscv64.

Command: "fwts uefirtvariable".
Running tests: uefirtvariable.

uefirtvariable: UEFI Runtime service variable interface tests.
Test 1 of 9: Test UEFI RT service get variable interface.
SKIPPED: Test 1, Skipping test, SetVariable runtime service is not supported on
this platform.

Test 2 of 9: Test UEFI RT service get next variable name interface.
The runtime service GetNextVariableName interface function test.
SKIPPED: Test 2, Skipping test, SetVariable runtime service is not supported on
this platform.

...

Test 4 of 9: Test UEFI RT service query variable info interface.
SKIPPED: Test 4, Not support the QueryVariableInfo UEFI runtime interface:
cannot test.

ADVICE: Firmware also needs to check if the revision of system table is correct
or not. Linux kernel returns EFI_UNSUPPORTED as well, if the FirmwareRevision of
system table is less than EFI_2_00_SYSTEM_TABLE_REVISION.

...
***********************************************************************

Currently, U-Boot EFI implementation returns EFI_UNSUPPORTED for set_variable
service. That's why all tests have been skipped but I manually verified that the
value is returned from U-Boot not kernel :).

EDK2 can boot quite far into Linux with the current series. However, it crashes
before userspace because of a possible memory corruption by EDK2.

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
arch/riscv/include/asm/efi.h                  |  56 +++++++
arch/riscv/include/asm/fixmap.h               |  16 +-
arch/riscv/include/asm/io.h                   |   1 +
arch/riscv/include/asm/mmu.h                  |   2 +
arch/riscv/include/asm/pgtable.h              |   5 +
arch/riscv/include/asm/sections.h             |  13 ++
arch/riscv/kernel/Makefile                    |   5 +
arch/riscv/kernel/efi-header.S                | 104 +++++++++++++
arch/riscv/kernel/efi.c                       | 105 +++++++++++++
arch/riscv/kernel/head.S                      |  17 ++-
arch/riscv/kernel/head.h                      |   2 -
arch/riscv/kernel/image-vars.h                |  51 +++++++
arch/riscv/kernel/setup.c                     |  17 ++-
arch/riscv/kernel/vmlinux.lds.S               |  22 ++-
arch/riscv/mm/init.c                          |  90 ++++++++---
arch/riscv/mm/ptdump.c                        |  48 +++++-
drivers/firmware/efi/Kconfig                  |   3 +-
drivers/firmware/efi/Makefile                 |   4 +-
.../firmware/efi/{arm-init.c => efi-init.c}   |   0
drivers/firmware/efi/libstub/Makefile         |  10 ++
drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++++++
drivers/firmware/efi/riscv-runtime.c          | 143 ++++++++++++++++++
include/linux/pe.h                            |   3 +
28 files changed, 825 insertions(+), 41 deletions(-)
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
