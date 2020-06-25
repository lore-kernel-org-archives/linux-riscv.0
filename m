Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D01FC433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D90A206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wt1svctb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="d0yaUiyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D90A206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FLpPcoxkaW9ng2xaUs4MHkZcrcz73wRTPLMNPPzYgWE=; b=wt1svctbFyuEye5C/3Hf+s7/XB
	OW52Slnly01Xhil0mb6v1Xm2Tva0cZYD/F4nk59um347jfB3kKXXU4chQ3Dyj0EJrPDpTwSuleyJv
	x5x2ZFaYQQ3C+X72UVfOt2TNjMnmQ+OYdRhuVZPtUQAl/7noUIeGm56xJSzZV98z3c1hFSb4tkh/k
	7fe4aurhjqo7OPkr95gCnIa8vz0A3z+3mwEpAA3KR7pt+GU77lIEJT1EZNKON1OucAXxo0d0zqRcV
	b43vbDg8n7mJazDSqDZ2G3f0CSo6ySqxEB0jmo+k9nBqkZ9Un2+1+ESs+Q4mJxM5YneAFDHIH7ViJ
	dtqu4j+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolxs-0006Ll-FX; Fri, 26 Jun 2020 10:52:12 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojkd-0002Se-E4; Fri, 26 Jun 2020 08:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160265; x=1624696265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Actmweta7JvIwPn5FyNaOGyF4xBrvFSmD2/FxpPF7ts=;
 b=d0yaUiyVx106YIKkAaIVnpy3j2lbuXweiQ+rHZGeOyHW7+wl7ycc9ywd
 35+xDuoWpVimWqpyem8yYnD/6Q+L9t99IK1BmDPGO2Saev2P6zFUvmOTb
 VyogezJ7QDCgTJA11p4pXbshuqzxQntGZu2MbQuFpEG9qV1JX6MJ9mae/
 KpQrK47KYOleR2tAYwnAU0psASO46Jt3E7KfO3cbcSBF/Y5YHN3UVmzyt
 UVXYF8U+oMirY/An5pVurVsMx4Vuw1xHMKcZ27cfDDwtavC6WJB19Vt5h
 /KEX1dwNO5aNJ0oGhpOYZxEt/9+9z1hFFeRnDtG1T3xWhoXPNzi0FrLNm g==;
IronPort-SDR: N9VAyhvUegOeDXJv3Gnv5tKdMXQTppy/GSOTioT/KJCduhpNP6+4t5DTbDelGx6y7bZGj8hURx
 oaRT32UqttYPdIARY+5dFlTmk4Lj33zGL2iAiEe8/ZkyvPUV7B1X1INXG652nOXa2wU+pTFNKD
 CslZjxSN6R+j78IW0gPnXGNFRZ43mwcdzLG+lHdQUVUvw7gD5i1Wsn/X3VlC8IxaUWtb8gmQPZ
 W3gUJ/Jvp+EBbUW39UZyeJKiBtZKZ37qjYFHBqLVukXR7bM/NciAXRHLju2Qv82//gZk75acz3
 aFY=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966110"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:54 +0800
IronPort-SDR: k4cEHXcNdLshOfBpj3E8qCmjaJPv2AcCZ+TeZjDAxjFrsH9n+9D7T3M5jfh8ZxiSGItYIZuIC0
 r8IrgVCCUsANPpeaVcLvBRN77t4cbSz3w=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:23 -0700
IronPort-SDR: FXpnazvcnQ8cmE9w2UPNHENcSiBq+pwdMl3n1nIRzHJWRPIAQ/SqZrnrr12Upi1JF6ROlOt85K
 Cly+SYaDK0nw==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 00/11] Add UEFI support for RISC-V 
Date: Thu, 25 Jun 2020 16:45:05 -0700
Message-Id: <20200625234516.31406-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
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
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V.

Linux kernel: 5.8-rc2
U-Boot: master
OpenSBI: master

Patch 1-6 are preparatory patches that fixes some of the geric efi and riscv issues.

Patch 7-9 adds the efi stub support for RISC-V which was reviewed few months back.
http://lists.infradead.org/pipermail/linux-riscv/2020-April/009586.html

Patch 10 just renames arm-init code so that it can be used across different
architectures. Patch 11 adds the runtime services for RISC-V.

The patches can also be found in following git repo.
https://github.com/atishp04/linux/tree/uefi_riscv_5.9_v1

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

Changes from previous version:
1. Added full ioremap support. 
2. Added efi runtime services support. 
3. Fixes mm issues

Anup Patel (1):
RISC-V: Move DT mapping outof fixmap

Atish Patra (10):
efi: Fix gcc error around __umoddi3 for 32 bit builds
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
drivers/firmware/efi/libstub/alignedmem.c     |   2 +-
drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++++++
drivers/firmware/efi/riscv-runtime.c          | 141 ++++++++++++++++++
include/linux/pe.h                            |   3 +
31 files changed, 796 insertions(+), 66 deletions(-)
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
