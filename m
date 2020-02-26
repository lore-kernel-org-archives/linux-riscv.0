Return-Path: <SRS0=fzfn=4O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3454C4BA06
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 01:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9616120732
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 01:11:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LkRiYv2T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="luZPJiao"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9616120732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4FvGeKob+xjEeaMY7cYhAEa7GHw2XfXPPNbEEsZjOU=; b=LkRiYv2Tvl8JUJ
	QyPXKhUaVVRXJ2fk8yp2g1Q+aykB4+oFr+kRwNa/bnap6z1oHcl0BA5eV/z+l/9lt9TL3dy4ZIbzo
	4xYh/k0fx8j8blaaiC/zKcYh/JcemuS9G97Zx/boeV23lwDlQ5925eCJrIQtLC4FQF4fhGmP8gm3o
	6mr8dhYng9uBcsMUXg1C+kBVniLGbmbDR8r+CkWNp0nVdwKtJtmCSkraC2ZSp9GO9LiPev00u+L59
	g/eiYn16LcOv4d+/e3wm9Vp4qw5Ur0MySl2HdFyMxeGYkJL6MrY1r0v/T+aJuu3S2WLOX26SrWF+I
	FjFeVtfBQfSzNPCs7QCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6lE4-0006mc-Ro; Wed, 26 Feb 2020 01:11:00 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6lE1-0006kU-PI
 for linux-riscv@lists.infradead.org; Wed, 26 Feb 2020 01:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1582679462; x=1614215462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NZg4u6V8Z0INJBN1XdeJcWgb0fnCl1aP4d5JfmKexCQ=;
 b=luZPJiao90Irnhc0+eE3E+wsqFIPOTPiJJypGS4gMGciGmCQGOksBkbf
 yu//iZgjCPRQb3tpIlaRdkof3PzCuRNiw65vjWuuCDMTdBvrxcLv7JskR
 FPEPp6XxV0moerMpSMIh0I8A3hRIV8/VC37DVfTCwf8MPyrEHuxEitCyS
 U/p3iXZxgi6PLe7llPvEUGOY0+oHiQx3CzhUF7Fv+FLEldu1yjHeMB1c7
 OMxiSh4c7mVisqMHrFjycxTm/na4mWT+Iep4XwIeHezYZA9LBPoJihOdm
 fI/Uan1ygjYx2cbXAQ7e2YMDn5COJrtx2eMYv6CXilfFExxV4pjYR6vCp w==;
IronPort-SDR: NndkviRkrhpzXwjmMNQIbpCdQTH392KN8m4JY698qwa46wQduIEYlrRwuWOLCWe4ZXu6ywLY20
 l17n32ALUQJZAJVGrfZa7CD7wsQia3UR0cp+ShzNYCPnB8zCkFtIc27VLFB9mf7B7Oo0vZ/vtN
 peJh4aGP1B0nTGzPmq+5Es2IkD56GhsNR2WVVUerVe8NA1nBFgK7f/XOs2hdhwJFNfnkcB1w7+
 bQt7XuDxX38TjjqlEYV6VL5bWvqCxPxTpOtT1lGkWwMnGDdkPeTHrK38RzB/A8SEQm2QiA2ZI5
 FtA=
X-IronPort-AV: E=Sophos;i="5.70,486,1574092800"; d="scan'208";a="232649045"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Feb 2020 09:10:51 +0800
IronPort-SDR: Qr/+PjqspBujIGACbcohIsgwkZv7bCDn9+O37OtbQ9AiDh6kzqifPl3nbiHQ5D5u8exUtoI49C
 c82h99LbQjJ7bHkcAVlrCI097QUMJvKmaEoZHwKiKV+5uCm2HyXdByx4rC3zXCgzAMRTNl8XB/
 n3IdJpMiKDMcNFdZoYdzZsqOp2JbEA8Jv25LC8s3ztXb0ag3cF8gPhGIGS5BZGjMxiZkgnX5Fx
 Q9q4Qwn3901Yg+Diz894mEcamDn59kDw7x9hTNVSZMzxR4BFUF2nnj/h/Kc/+w7cMGa101UnN1
 bZ4P8PHr4P+WFzC6orSvcoMw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 17:03:14 -0800
IronPort-SDR: 8c1x7BtrsxAIwmO/HJj0NItWFGgQptHN46p2vFlF3Dj4YVryIzkAyezvkjD4w+4OKeVG6wBjbw
 8we5DOedz8TXd8LiJGIOMqoMAe7mVePjj+N0dEuqplmQdnxTCnQDuUwPZGAL5hY9pQlAjl0uDd
 oOcdSrEzpiaCH7M16ZlzSZtC1j42Gtu0xwfQ0SAZDikmr6FZbmtLvE+5tZF1N9Z5rGK/eRbcvF
 InpgYh/KDO9rVWTbAFOFx+cNynVayRZCNSXqP3xW3Diqc6jsDixKYTx85DLJ9ieFlf537hbvIQ
 OMk=
WDCIronportException: Internal
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 25 Feb 2020 17:10:46 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] Add UEFI support for RISC-V 
Date: Tue, 25 Feb 2020 17:10:32 -0800
Message-Id: <20200226011037.7179-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_171057_858559_A5D42E33 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-efi@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Atish Patra <atish.patra@wdc.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, "Chang,
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 Michal Simek <michal.simek@xilinx.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, daniel.schaefer@hpe.com,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Alexios Zavras <alexios.zavras@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "leif@nuviainc.com" <leif@nuviainc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds UEFI support for RISC-V. Currently, only boot time
services have been added. Runtime services will be added in a separate
series. This series depends on some core EFI patches
present in current in efi-next and following other patches.

U-Boot: Adds the boot hartid under chosen node.
https://lists.denx.de/pipermail/u-boot/2020-February/401227.html

Linux kernel: SBI v0.2 and HSM extension support. This series is a mandatory
pre-requisite for UEFI support as only single core can boot EFI stub and
Linux via UEFI. All other cores are brought up using SBI HSM extension.
http://lists.infradead.org/pipermail/linux-riscv/2020-February/008513.html

OpenSBI: master (commit: ge3f69fc1e934)

Patch 1 just moves arm-stub code to a generic code so that it can be used
across different architecture.

Patch 3 adds fixmap bindings so that CONFIG_EFI can be compiled and we do not
have create separate config to enable boot time services. 
As runtime services are not enabled at this time, full generic early ioremap
support is also not added in this series.

Patch 4 and 5 adds the PE/COFF header and EFI stub code support for RISC-V
respectively.

The patches can also be found in following git repo.

https://github.com/atishp04/linux/tree/wip_uefi_riscv

The patches have been verified on Qemu using bootefi command in U-Boot.
Here is a boot log.

Atish Patra (5):
efi: Move arm-stub to a common file
include: pe.h: Add RISC-V related PE definition
RISC-V: Define fixmap bindings for generic early ioremap support
RISC-V: Add PE/COFF header for EFI stub
RISC-V: Add EFI stub support.

arch/arm/Kconfig                              |   2 +-
arch/arm64/Kconfig                            |   2 +-
arch/riscv/Kconfig                            |  21 +++
arch/riscv/Makefile                           |   1 +
arch/riscv/configs/defconfig                  |   1 +
arch/riscv/include/asm/Kbuild                 |   2 +-
arch/riscv/include/asm/fixmap.h               |  21 ++-
arch/riscv/include/asm/io.h                   |   1 +
arch/riscv/include/asm/sections.h             |  13 ++
arch/riscv/kernel/Makefile                    |   4 +
arch/riscv/kernel/efi-header.S                | 107 ++++++++++++++
arch/riscv/kernel/head.S                      |  15 ++
arch/riscv/kernel/image-vars.h                |  52 +++++++
arch/riscv/kernel/vmlinux.lds.S               |  27 +++-
drivers/firmware/efi/Kconfig                  |   6 +-
drivers/firmware/efi/libstub/Makefile         |  20 ++-
.../efi/libstub/{arm-stub.c => efi-stub.c}    |   7 +-
drivers/firmware/efi/libstub/riscv-stub.c     | 135 ++++++++++++++++++
include/linux/pe.h                            |   3 +
19 files changed, 420 insertions(+), 20 deletions(-)
create mode 100644 arch/riscv/include/asm/sections.h
create mode 100644 arch/riscv/kernel/efi-header.S
create mode 100644 arch/riscv/kernel/image-vars.h
rename drivers/firmware/efi/libstub/{arm-stub.c => efi-stub.c} (98%)
create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c

--
2.24.0


