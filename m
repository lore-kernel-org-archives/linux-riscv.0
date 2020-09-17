Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A92C43464
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2082087D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 22:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJhmQ16a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="J9MD5w7F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2082087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyE35OcuSxDDNXrNe8G/jOgREnd0HtrdcwYw18FyXWg=; b=sJhmQ16aQo0VyccCm5mLRFkb/a
	ixr5lcxs38qHRQFdnrqdkGkSYLFrM42A6m3xqkWSAowaaWypfEHl3ZkLlPe8aIT8mq5hx+DwqoBiW
	DEnpEKPC7oxv+fEUzTmSvHbS3GehzNMEkNf03I/MMq7AsmafBL3THenWN4vsZ7eeb7tKfMXBppj0J
	lGivr1ZINltMCVI8p1x08VwOnPXRPp1hQwQqaXa1jkdByHZw4CU3kVZYt/hlmaNE2h4x/TY4SIpU5
	fGjMfxjzLkp9kgTTUflJG2xmRZp1XfLKdwJxRoVa+loob1YHPHax6cDZRc5+Alje+L7FMfVCJ3a6E
	j72ofn1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ2X9-0005hQ-Hh; Thu, 17 Sep 2020 22:37:43 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ2X5-0005fT-Uh
 for linux-riscv@lists.infradead.org; Thu, 17 Sep 2020 22:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600382259; x=1631918259;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hutlet2njpyeL/sMjQX6Uq1jHOVaORsRpw7WgDF3Mgk=;
 b=J9MD5w7FFlwrUDxi1vxE2OjCGmI2TJx9kqIXKncJ1YHaaTA5UPmr9UxM
 TjypLZO89FVn6FUaQO5XSLigP4bmkXHe8sOjxkvgV64G6iJeSIhKHnumm
 tb8ICJo2PSZLDwhTdPZM+2X95mJBUXLipNkbfpUf8hF2iFta0u5Ll8Bv2
 yzTsMf8Gjm01KT3y8iNF8chzQ2dDFWzUsbFjqx4jYVnPbLkklQWHbbPU3
 KflP85n5v77pD19kGRwlqQWC7jAje9TGfMy4cFfWhQlMfgSPdmOI8xilS
 027D+LlI0cb1OfXSSHDxXFh9DU+BOZ/RUxU3eXHg21w1mMhOpTpKfYcas A==;
IronPort-SDR: mG6KPenirTlqgVCuoVa2bPrdr4XDX6epRv3A+fdefbDhR3RWFRnttsUy1h9z+kyTokK2sS54oR
 EZIDFOgh6hvWnD7J0mDNgW/zGllZUcjaqIGUKjx77ZGqtEEwWNHN5wfEAnkdVWVkx1TQB+UwHX
 HA+UzMSfN64JGTC8961sEO61tAUsTUHAOztt3VZ1K7lraHdrwy5YXAQN9mW7NBglPHMdW/dBCy
 wEMo6tXabSQJGIrCtvJfa1OM7gELcW2B3O2FevCBc45eBBeTNT+0RLpggL9ZlPrNVMbDWrfPZg
 2ko=
X-IronPort-AV: E=Sophos;i="5.77,272,1596470400"; d="scan'208";a="257336248"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Sep 2020 06:37:36 +0800
IronPort-SDR: 8CbpaIt1q4yqb5vFLUB1RC8wWq9d7lxqxS9QalKP0a5W3DkhRj+SMobRmkuVYiAXFkp3kXjTm4
 ZOAJoQju6CbQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 15:23:50 -0700
IronPort-SDR: yWykapKjvrHxnljwC0B8/iCDlg/TVg2Bib8NUzBqJPFIDLrbpVBsz6wfyBOhzsCAftH8JyS+G2
 ODFBE7Y0TjIQ==
WDCIronportException: Internal
Received: from use204338.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.39])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Sep 2020 15:37:36 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] Add UEFI support for RISC-V
Date: Thu, 17 Sep 2020 15:37:09 -0700
Message-Id: <20200917223716.2300238-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_183740_234068_45C19D4B 
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
Cc: linux-efi@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Maxim Uvarov <maxim.uvarov@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Ard Biesheuvel <ardb@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Anup Patel <anup.patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: v5.9-rc5 
U-Boot: v2020.07 
OpenSBI: master

Patch 1-3 are generic riscv feature addition required for UEFI support.
Patch 4-5 adds the efi stub support for RISC-V which was reviewed few months back.
Patch 6 adds the runtime services for RISC-V.

The working set of patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v8

@Palmer: I have dropped the following 2 patches from last series (v7)
as this is already part of the shared efi-tree. I am assuming you are pulling
these two from there. The above github tree contains all the patches in order
as per Ard's suggestion.

87a1eeea8e7a include: pe.h: Add RISC-V related PE definition
76fdd4313434 efi: Rename arm-init to efi-init common for all arch

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

Changes from v7->v8:
1. Rebased on latest efi series[1].
2. Fixed efi-header for 32 bit.
3. Included RISC-V tweaks from Ard[2].
4. Removed the 2 patches(pe.h & arm init) from v7 as it is going through efi tree.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
[2] git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git

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

Atish Patra (6):
RISC-V: Add early ioremap support
RISC-V: Implement late mapping page table allocation functions
RISC-V: Add PE/COFF header for EFI stub
RISC-V: Add EFI stub support.
RISC-V: Add EFI runtime services
RISC-V: Add page table dump support for uefi

arch/riscv/Kconfig                        |  25 +++
arch/riscv/Makefile                       |   1 +
arch/riscv/configs/defconfig              |   1 +
arch/riscv/include/asm/Kbuild             |   1 +
arch/riscv/include/asm/efi.h              |  55 +++++++
arch/riscv/include/asm/fixmap.h           |  16 +-
arch/riscv/include/asm/io.h               |   1 +
arch/riscv/include/asm/mmu.h              |   2 +
arch/riscv/include/asm/pgtable.h          |   5 +
arch/riscv/include/asm/sections.h         |  13 ++
arch/riscv/kernel/Makefile                |   2 +
arch/riscv/kernel/efi-header.S            | 111 +++++++++++++
arch/riscv/kernel/efi.c                   |  96 +++++++++++
arch/riscv/kernel/head.S                  |  17 +-
arch/riscv/kernel/head.h                  |   2 -
arch/riscv/kernel/image-vars.h            |  51 ++++++
arch/riscv/kernel/setup.c                 |  18 +-
arch/riscv/kernel/vmlinux.lds.S           |  23 ++-
arch/riscv/mm/init.c                      | 191 ++++++++++++++++------
arch/riscv/mm/ptdump.c                    |  48 +++++-
drivers/firmware/efi/Kconfig              |   3 +-
drivers/firmware/efi/Makefile             |   2 +
drivers/firmware/efi/libstub/Makefile     |  10 ++
drivers/firmware/efi/libstub/efi-stub.c   |  11 +-
drivers/firmware/efi/libstub/riscv-stub.c | 109 ++++++++++++
drivers/firmware/efi/riscv-runtime.c      | 143 ++++++++++++++++
26 files changed, 891 insertions(+), 66 deletions(-)
create mode 100644 arch/riscv/include/asm/efi.h
create mode 100644 arch/riscv/include/asm/sections.h
create mode 100644 arch/riscv/kernel/efi-header.S
create mode 100644 arch/riscv/kernel/efi.c
create mode 100644 arch/riscv/kernel/image-vars.h
create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
create mode 100644 drivers/firmware/efi/riscv-runtime.c

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
