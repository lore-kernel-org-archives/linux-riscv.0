Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71E3C433E8
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E962063A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:41:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0aivC4fL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="H5qGfVGg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75E962063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2yRCq09oUBgzh9OXgbYWNZloBqQbXMy6AHwwsVfiYmI=; b=0aivC4fLVy1Rk37mH0A3/8G2aW
	PKUYTF01aVmzNDFVSoBSRM15zeGrx0MSFXbFQH6MC+W1naKUXTZpC/J9f5vtSPQ29Xtma5Qljm6ss
	dEI2XgmzrZv6vIQISAnI7KKOpACQrVIgOO+6/U2iOkfkKkX6zdOHBoNYSXrWSt3fFU3MzyKpttDt0
	Czbc1mVe/+5srZ7Nmp6itd0jur50KhsDrALK5Uf33Bi5HtJ9vlAkrHaAAlXiJnkRbytGMX3t62Jib
	JcGOqBVNtcSA9AoFrxIU7iNy6p3mDlfb9xQG+ZUpnCcJiN2wanFc8MWFg0UkaliImKDL16wBtmF+d
	ePVqDUmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwDV9-0007fZ-G0; Thu, 16 Jul 2020 23:41:19 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwDV6-0007dh-A7; Thu, 16 Jul 2020 23:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594942876; x=1626478876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kUG/HMv0nJnrst7Sns7/AKTyFHl/1SzBX+Bwh+vDZlA=;
 b=H5qGfVGgZIOthgQ4rd7XyHCXuj5X2z2Lp3Oot69SjfPvdwsG7EGEF8Jh
 OBAWn6v9M01SxBuREQiMqix3bgBD/l1KEd2lnrMKomFMogFvRBBAfAZ8M
 i1x7q4TCCIoCORY1tqNljUlJA1GOyjuy6UdVIaLc/l7PfR3PQVdUKO2MR
 lRVMiyuZoJW3zIdmpNxYzn8rFMHKTLVTNs1zUCOcDzGVOj/1tjoJqodaW
 oBT6GbPE/NfZaFz1bGT1DpGf7mNfd+AAINmd/eIMa4TK+sHrcRZ9y5OO+
 Eu9Gm+Iw/mMp2Ga3Bv78DSKFiiwTlF6afmf5gmq3p4QogfuYNl6YgRNn5 w==;
IronPort-SDR: sFgpCx6Ktu99oKoLCCWw6HInM7B9cDrynGumj2tQAiR+jwINjqE3jHbZT3y3wDCKUq2vYTeDq+
 0w9sXYQbQQ50PADWJrCAof4FlEZ4PgSJP1/eQKZJyggw0oSsp3Ck0tl00aP2CZTH9rJYxfg7q3
 NgV66KiXstYcyaTW0Zc9uIelKsgsYFOKlSG8938ZM+5KiaBHg69uYZodRS6XPdfKzc970qV3xI
 85wVrpyyKBYgh6NSnKHx35HG8a6U90p6wKtTjMLSzrpUWwebZZ3Wb6tMEOznMbcpd210jvD7oa
 +RE=
X-IronPort-AV: E=Sophos;i="5.75,360,1589212800"; d="scan'208";a="142782162"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2020 07:41:13 +0800
IronPort-SDR: BjpxrRfP86oDPA0f+zB6xcfVZCqOlMDfyAXcoS2sNHctSJjbbPWRZ0U314bk3FgbSKfXKhAjSo
 rbW60gzsFVyoANKriRBGuXvCtxSYwiTTc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 16:29:36 -0700
IronPort-SDR: 2hT8GNbz2MtsskMAQMxU6lttS0NTqNVxNsn5ZJD2clmQGd0fWs1xQw22jaruo3+STJ4pgyDaD0
 otrAU2Kc14/Q==
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.54])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Jul 2020 16:41:12 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v3 0/9] Add UEFI support for RISC-V
Date: Thu, 16 Jul 2020 16:40:55 -0700
Message-Id: <20200716234104.29049-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_194116_510410_5C994FAD 
X-CRM114-Status: GOOD (  20.68  )
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
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: 5.8-rc5 + "mm & exception handing fixes" series
U-Boot: master
OpenSBI: master

This series depends on earlier mm fixes series

http://lists.infradead.org/pipermail/linux-riscv/2020-July/001208.html

Patch 1-3 are generic riscv feature addition required for UEFI support.
Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
https://www.spinics.net/lists/linux-efi/msg19144.html
Patch 8 just renames arm-init code so that it can be used across different
architectures. Patch 11 adds the runtime services for RISC-V.

The working set of patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.9_v3

The patches have been verified on Qemu using bootefi command in U-Boot for both
RV32 and RV64.

For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
beyond 1G of physical memory for RV32.

EDK2 can boot quite far into Linux with current series. Currently, we are seeing
some traps from drivers (spi/network). At first glance, they don't seem to be
caused by efi. I thought it is better to get some early feedback on the series
while EDK2 issue is being debugged.

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
service. That's why all tests have been skipped but I manually verified the value
returned from U-Boot not kernel :).

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
arch/riscv/include/asm/pgtable.h              |   4 +
arch/riscv/include/asm/sections.h             |  13 ++
arch/riscv/kernel/Makefile                    |   5 +
arch/riscv/kernel/efi-header.S                | 104 +++++++++++++
arch/riscv/kernel/efi.c                       | 105 +++++++++++++
arch/riscv/kernel/head.S                      |  17 ++-
arch/riscv/kernel/head.h                      |   2 -
arch/riscv/kernel/image-vars.h                |  51 +++++++
arch/riscv/kernel/setup.c                     |  16 +-
arch/riscv/kernel/vmlinux.lds.S               |  22 ++-
arch/riscv/mm/init.c                          | 100 ++++++++----
arch/riscv/mm/ptdump.c                        |  48 +++++-
drivers/firmware/efi/Kconfig                  |   3 +-
drivers/firmware/efi/Makefile                 |   4 +-
.../firmware/efi/{arm-init.c => efi-init.c}   |   0
drivers/firmware/efi/libstub/Makefile         |  10 ++
drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++++++
drivers/firmware/efi/riscv-runtime.c          | 143 ++++++++++++++++++
include/linux/pe.h                            |   3 +
28 files changed, 823 insertions(+), 51 deletions(-)
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
