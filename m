Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B9EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 17:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E8560C4D
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 17:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60E8560C4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBtPXBitl/jHw9EWqMYtF8oJF/bYPBXVzOGPoJpRAGI=; b=mIAKNn744OCTq0
	qGWzpoSJTUqPDzk+xPxdtWDkpkXFxHJe8kPuY4V7LBD0IKOu0rWtXtUe/dLgbYQmJT4RLIbGERJef
	FUumgVo0kMwbwfA92lQTd37YTU/bKwgaQfyUg/xlbeDGwOwVvOmNwaFpfUdT7CfhQyr+MSB0JUPg0
	GZLJiBK7LttOFuYckq6HK7ROasu3/MJyLORbQqik31kKe5j/UwWxAnjLJ/tnQpD4lTyc8y/AzkPYq
	zs4Z2h8X/M6cp/PVvq/H/JQDaOk0pdEh5W2uga4kn6ePUTxORy/tb2yqMCituFmSTX00XTfNOfkE+
	TlkfgCgzYqHO++A77u0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlaPV-00BJkw-IU; Fri, 12 Nov 2021 17:32:21 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlaPS-00BJkV-DD
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 17:32:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id y7so9087563plp.0
 for <linux-riscv@lists.infradead.org>; Fri, 12 Nov 2021 09:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=27qMKBfE9SqMjFa/icnG6O/UTntPosZR3vJbadVwXiU=;
 b=DBQ0ibsXf4NCyq/ULPbu87OnYXRMaFgFxH2//Z2XWW+RPZit6fCT/wKWNJO0D46CCW
 yczk2B8vylVOesxhHRI3usqwHj6EiKmiB8CageWaFyA8rfbfdrqW/qi0GJGypRf51Onk
 N1nDaq0EI7xl8ePvhPjauoemaXwATNstKGZs9Ychd2//EVsTd6cDNQjoDUA7ubv81eIE
 +xDZ6DBUhca2dutRNEbUoK8QuPWmhYhTXmEsF9fYbaETrukV/K1uiDMfH4wOHJn0NQvn
 gumVMslOVDaI4iYQf55BLxMa3riZ0YT0He4OgHznowCuKn6p4rL6VwSB41+qR841/uVD
 tMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=27qMKBfE9SqMjFa/icnG6O/UTntPosZR3vJbadVwXiU=;
 b=55pvIsxm5lnyQ5Tw3XBIkbtFWlG75XOtdIcSJPbwXkPIDSYhtk+smtBVP3YB9YweIB
 g6BB5eXCJN2YWcSDbqcBFQ88Q6/W7cIgKFlZVf66/g2/TXeROMq/VqW6bDCs0Q4YIadM
 icRHKdhPpIcs/3p7MSbLJETrFTVxRW6qghanmsyVOcb5J1KwqosILrwnsMgL0D55Q5PN
 FojLpf9gmbTqyum1K/1Tc7pQ2WTYHScJgoNLF2m++nZZs7Bc11K7mqqp2zVdD+R14VDk
 ttoL2UQEQvrZUO9dHTo8osjqP9Cw1ddwZX8yIB0xcOjrSJjoWRXPLrLuRF+UkPqvLBVP
 0W0A==
X-Gm-Message-State: AOAM5315fTIKDE0adI2JLH8/yfUHpM1c1CaTYWmTyxD4y2mgRfcbpZ+G
 OmOFOSQVwZ3pWY5RCcenRxJLLQ==
X-Google-Smtp-Source: ABdhPJyCrQVPmwKxTW3NnqjcUyZvA7sND1qbR7JaJBjlXHJLK/zwjPmnEk+sQQDvZrmwkXt2pmGiBw==
X-Received: by 2002:a17:902:b941:b0:143:ae25:ba1a with SMTP id
 h1-20020a170902b94100b00143ae25ba1amr2737346pls.66.1636738336342; 
 Fri, 12 Nov 2021 09:32:16 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a11sm6862342pfh.108.2021.11.12.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 09:32:15 -0800 (PST)
Date: Fri, 12 Nov 2021 09:32:15 -0800 (PST)
X-Google-Original-Date: Fri, 12 Nov 2021 09:32:02 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.16 Merge Window, Part 1
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-109b0503-bc7c-4da8-8621-28aec8d9df59@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_093218_521598_B0AA49BF 
X-CRM114-Status: GOOD (  13.47  )
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

The following changes since commit 3f2401f47d29d669e2cb137709d10dd4c156a02f:

  RISC-V: Add hypervisor extension related CSR defines (2021-10-04 04:54:55 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-mw1

for you to fetch changes up to ffa7a9141bb70702744a312f904b190ca064bdd7:

  riscv: defconfig: enable DRM_NOUVEAU (2021-10-27 14:36:09 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.16 Merge Window, Part 1

* Support for time namespaces in the VDSO, along with some associated
  cleanups.
* Support for building rv32 randconfigs.
* Improvements to the XIP port that allow larger kernels to function
* Various device tree cleanups for both the SiFive and Microchip boards
* A handful of defconfig updates, including enabling Nouveau.

There are also various small cleanups.

----------------------------------------------------------------
Dimitri John Ledkov (1):
      riscv: set default pm_power_off to NULL

Heinrich Schuchardt (1):
      riscv: defconfig: enable DRM_NOUVEAU

Kefeng Wang (1):
      riscv/vdso: Drop unneeded part due to merge issue

Krzysztof Kozlowski (11):
      dt-bindings: mmc: cdns: document Microchip MPFS MMC/SDHCI controller
      riscv: dts: microchip: drop duplicated nodes
      riscv: dts: microchip: fix board compatible
      riscv: dts: microchip: drop duplicated MMC/SDHC node
      riscv: dts: microchip: drop unused pinctrl-names
      riscv: dts: microchip: use vendor compatible for Cadence SD4HC
      riscv: dts: sifive: use only generic JEDEC SPI NOR flash compatible
      riscv: dts: sifive: fix Unleashed board compatible
      riscv: dts: sifive: drop duplicated nodes and properties in sifive
      riscv: dts: microchip: add missing compatibles for clint and plic
      riscv: dts: sifive: add missing compatible for plic

Palmer Dabbelt (3):
      Merge remote-tracking branch 'palmer/riscv-vdso-cleanup' into for-next
      Merge tag 'for-riscv' of https://git.kernel.org/pub/scm/virt/kvm/kvm.git into for-next
      Merge tag 'riscv-sifive-dt-5.16' of git://gitolite.kernel.org/pub/scm/linux/kernel/git/krzk/linux into for-next

Randy Dunlap (1):
      riscv: add rv32 and rv64 randconfig build targets

Tong Tiangen (1):
      riscv/vdso: Add support for time namespaces

Vineet Gupta (1):
      riscv: mm: don't advertise 1 num_asid for 0 asid bits

Vitaly Wool (1):
      riscv: remove .text section size limitation for XIP

 .../devicetree/bindings/mmc/cdns,sdhci.yaml        |   1 +
 arch/riscv/Kconfig                                 |   1 +
 arch/riscv/Makefile                                |  10 +
 .../dts/microchip/microchip-mpfs-icicle-kit.dts    |  18 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi  |  40 +---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         |   2 +-
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  10 +-
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |   7 +-
 arch/riscv/configs/32-bit.config                   |   2 +
 arch/riscv/configs/64-bit.config                   |   2 +
 arch/riscv/configs/defconfig                       |   7 +-
 arch/riscv/include/asm/page.h                      |   2 +
 arch/riscv/include/asm/pgtable.h                   |   6 +-
 arch/riscv/include/asm/syscall.h                   |   1 +
 arch/riscv/include/asm/vdso.h                      |  13 +-
 arch/riscv/include/asm/vdso/gettimeofday.h         |   7 +
 arch/riscv/kernel/head.S                           |  12 +
 arch/riscv/kernel/reset.c                          |  12 +-
 arch/riscv/kernel/syscall_table.c                  |   1 -
 arch/riscv/kernel/vdso.c                           | 261 +++++++++++++++++----
 arch/riscv/kernel/vdso/vdso.lds.S                  |   6 +-
 arch/riscv/kernel/vmlinux-xip.lds.S                |  10 +-
 arch/riscv/mm/context.c                            |   8 +-
 arch/riscv/mm/init.c                               |   7 +-
 24 files changed, 311 insertions(+), 135 deletions(-)
 create mode 100644 arch/riscv/configs/32-bit.config
 create mode 100644 arch/riscv/configs/64-bit.config

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
