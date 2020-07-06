Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AD5C433DF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4417D2070C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFCIANPZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="E1r65tQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4417D2070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YerV9dCNpa9ZnFKHCtuAgDGSpm1aW4WrSWz58UCN2C4=; b=RFCIANPZI5F9vSeMAtAa2Qh32N
	vQsg2f8dIRm91Na9CgAji/vnLCpAUm6wELB2tdWXyhKM8bsY6cDGwpy/VfpgZNsToO/ETsj2RV9ns
	Dvgt+N8pb39ZCew0cUIXbY7HuV+p1u9VorEZAIsnvXSLasoLq1r0TEXhw7X9+UTeWvBTrG9EgKBRI
	gu+1GSYBuLzOJaPQ4QG2tHeRn1WEFpwwG0RlrmueCr0BOXuYHhc67yR+83mrjC5RbYk6FxnlRAmGe
	VXE9pACjLXGeXRAWbKmZ4uvVtlEgD395OhJjBsZcFSJn35se5QV1hOB0rA7fyK6brZfAPNj3g0bSr
	ejiBynQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUt3-0002cw-D3; Mon, 06 Jul 2020 17:26:37 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUsz-0002ZQ-NA
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056394; x=1625592394;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZPLqLkRmreTTViDZafKeWTDt0ftxitDjgDKfBWiyQY4=;
 b=E1r65tQDfSy73saB8TFgIUvIW0Z3exjbEBlsJImfQc5gx+G/75gLvYat
 3XnCl5/wZjIEx2k4QZwNRGzHsFvntUhaFijm6zu3ygjLa0fSfds8COtEw
 eJH53b4Y8rQyxjvswihW6U1i3rEHmo2GcajAiOkEYUDM5eJIZ6a/SRo7q
 c82iLUA1S+IqlYzRyCWEpveUontt6qRslrgSltq1Q5R27dpTNjdfppIWC
 1G2HlInw7fLd9UH5nxe1U9gFrk9QspxN9Fam43nOi/q97JQZI+iLuDttU
 ECE5o8hIC/OV51QwSFQAagnuSFdzEA4OmjGWy2cDWUWCnCtF14TPnqY5O A==;
IronPort-SDR: RCGbAUsgdYmQOn9l87pHxuPHKidvvu9Ibh+i+Z5cByd3rVVPRGEGDZMiH1xbci+WMVYyXID6bP
 XYpxtJtBmIKug/jBJP/+c9OvXwkP5dRV8SmAdJG/xD5FG04KQR/JKaQa4BH971mzP+2BKeFLL6
 7l4oQ3rgBiKVWm2BglkyabUoW2+/m31zxVlcOea+XRxlb3+ctl2lYgitnIL67daJQ59SuVC1L9
 I8nX/1EcnyV9muBRuzHUyYYPd2RePNTgcKTVTiPMv2iT31WcKy5SGkq3z40yLRgUvxcZugp9PU
 E9A=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930676"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:30 +0800
IronPort-SDR: xgRBCwfFslFxle98Wqp7TfoLImIyNWov7TMuIfRUhu4Lv8oJrafS/ebhrviDc7+ZwrfH55l/+W
 ukFeQkGwZ+GsIYANMo894W5IdhIrSuG08=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:10 -0700
IronPort-SDR: V8HiVNZoUcDsr9kkXV5f0VaUWHVCf3R8abrkby7eWCdFWxsmdW292u67WeRT3k8PV66FGKa2H2
 pfjT6DtMXfaA==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 00/11] Add UEFI support for RISC-V 
Date: Mon,  6 Jul 2020 10:25:58 -0700
Message-Id: <20200706172609.25965-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132634_232845_159DF89F 
X-CRM114-Status: GOOD (  17.72  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: 5.8-rc4
U-Boot: master
OpenSBI: master

Patch 1-6 are preparatory patches that fixes some of the geric efi and riscv issues.

Patch 7-9 adds the efi stub support for RISC-V which was reviewed few months back.
https://www.spinics.net/lists/linux-efi/msg19144.html

Patch 10 just renames arm-init code so that it can be used across different
architectures. Patch 11 adds the runtime services for RISC-V.

The patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.9_v2

The patches have been verified on Qemu using bootefi command in U-Boot for both
RV32 and RV64.

For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
beyond 1G of physical memory for RV32.

EDK2 can boot quite far into Linux with current series. Currently, we are seeing
some traps from drivers (spi/network). At first glance, they don't seem to be
caused by efi. I thought it is better to get some early feedback on the series
while EDK2 issue is being debugged.

That's why uefi runtime services are not actually well tested in RISC-V.
Any suggestions to test the efi run time services are appreciated. 

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

Atish Patra (10):
efi/libstub: Move the function prototypes to header file
RISC-V: Setup exception vector early
RISC-V: Add early ioremap support
RISC-V: Set maximum number of mapped pages correctly
riscv: Parse all memory blocks to remove unusable memory
include: pe.h: Add RISC-V related PE definition
RISC-V: Add PE/COFF header for EFI stub
RISC-V: Add EFI stub support.
efi: Rename arm-init to efi-init common for all arch
RISC-V: Add EFI runtime services

arch/riscv/Kconfig                            |  25 ++++
arch/riscv/Makefile                           |   1 +
arch/riscv/configs/defconfig                  |   1 +
arch/riscv/include/asm/Kbuild                 |   1 +
arch/riscv/include/asm/efi.h                  |  56 +++++++
arch/riscv/include/asm/fixmap.h               |  16 +-
arch/riscv/include/asm/io.h                   |   1 +
arch/riscv/include/asm/mmu.h                  |   2 +
arch/riscv/include/asm/pgalloc.h              |  12 ++
arch/riscv/include/asm/pgtable.h              |   4 +
arch/riscv/include/asm/sections.h             |  13 ++
arch/riscv/kernel/Makefile                    |   5 +
arch/riscv/kernel/efi-header.S                | 104 +++++++++++++
arch/riscv/kernel/efi.c                       | 106 +++++++++++++
arch/riscv/kernel/head.S                      |  27 +++-
arch/riscv/kernel/head.h                      |   2 -
arch/riscv/kernel/image-vars.h                |  51 +++++++
arch/riscv/kernel/setup.c                     |  16 +-
arch/riscv/kernel/smpboot.c                   |   1 -
arch/riscv/kernel/traps.c                     |   8 +-
arch/riscv/kernel/vmlinux.lds.S               |  22 ++-
arch/riscv/mm/init.c                          | 104 ++++++++-----
drivers/firmware/efi/Kconfig                  |   3 +-
drivers/firmware/efi/Makefile                 |   4 +-
.../firmware/efi/{arm-init.c => efi-init.c}   |   0
drivers/firmware/efi/libstub/Makefile         |  10 ++
drivers/firmware/efi/libstub/efi-stub.c       |  28 ++--
drivers/firmware/efi/libstub/efistub.h        |  16 ++
drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++++++
drivers/firmware/efi/riscv-runtime.c          | 141 ++++++++++++++++++
include/linux/pe.h                            |   3 +
31 files changed, 811 insertions(+), 82 deletions(-)
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
