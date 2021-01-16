Return-Path: <SRS0=IOE3=GT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52747C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 17:55:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32B722472
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32B722472
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wngN50x9/BFPXm8VI1ohqZv7/p2+w9ZWtkg+xSU0qw8=; b=M2Q/YwseU3gea6ymn1OB0uplMV
	e8odcKmMnlYcl+bBRmicqH6+86IWwbg4mNuXVN9gxcrTmTCQa6+H3ISwwmcS4vWaXwPIZ0PKJNDpx
	wRDW/21fHWbcFhljOaTOFYsEm1FSb9qdgZhL5FlGHI+LgpaqA3b40xWOtUNktAWQ8A/eJvWwj9j4x
	GGBWXzwAhJbyw/bMisDhEWQE3Q45rKE8tn7BKp/z7/qkOh6EYmomO4PV1VZWeK1QqUtDlq2+FJ2vV
	q7WUfhaLC3KkfXNcPdZ4CNSOYu+OwRmO//ATowHc57gUwpSrJlNR2SVO438o1SZl7/UMIh0nUsNXO
	FLdoTsBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0pmt-0004IA-ET; Sat, 16 Jan 2021 17:54:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0pmq-0004H9-04
 for linux-riscv@lists.infradead.org; Sat, 16 Jan 2021 17:54:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id u11so2059937plg.13
 for <linux-riscv@lists.infradead.org>; Sat, 16 Jan 2021 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=Y8HqPepn9WlqKtTg6LT12iZGQnoJuCc7icVZrw7iHr8=;
 b=WSvbX8ccuLP8EsMehmK8NRenisQwSFaYZUBIi1ewXTfcle1BO/5NSVrFbbkhxsnfxL
 OFaqH2Vnj0eCafQ7wOutosTUKaBiE/YznxLkMJI2IYjVIZtuF5KnDXDwl7PziTKR+xhD
 t+bgbydGss6TGZ8k05L7nYe+625+uhmTeScWEhJFK4546M+j0oKqGB9GS+gda/Dpf7Yi
 r2jaO734wIbEy4vOl5gwRq1aJ4zEz1wi++QEF3Z4wqgWZILLLEcy5LW02WrhGdHFzTJP
 LHfne6bwL4NFjLW0V5TcT8Fp9NGEqFF5c96x4/RmgK325tbNoBzUozJ05H90sRhTL/AO
 oRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=Y8HqPepn9WlqKtTg6LT12iZGQnoJuCc7icVZrw7iHr8=;
 b=AWXoQfL8KZlI1M8JYAoNcHxCskdEuA+ptZJ/2yWFSu90AX0NfwZUAIPyZGh0YS59xF
 BhHbvnmdAkVy8yjkk6XqE/4KJ+O/lHskb5jGTopGVmkRA9yVbISedtCFXuo8QmfSHEEu
 Z84a8yr+pfeYE/ZPi5FqjWg9/exKOf/ZWsVzHW2CfidZva/zQ55C7VJeU4xSo3sMguFU
 fv+PwSUd1CHaHkjFJ+7+Tq4aIgo/debmROe3oqsq7+ifjP3YcXfZJFm+8x48hP1LGLMs
 1VeH80+1/tmHu/UMYJf+89dx+7e2WJGsEA82hBsThs6Zd0MZ+7ifLUb2HfKZd07M9aJ1
 FnHw==
X-Gm-Message-State: AOAM533vlLzFZrrrnTsLV+IlxqbXrgAzGMeHbDodzL/MuA5482TfCxX8
 IuOUPup8QRPiOiXyR6+SW4gFlWe9iU6ezA==
X-Google-Smtp-Source: ABdhPJyTTvoEexuZjgEW4hG5HxSuQRlEdnpgW3WAcvUTA5kjDTBX8iycczPrxIekPnRwntn7HLVPMA==
X-Received: by 2002:a17:902:eb03:b029:db:c0d6:5845 with SMTP id
 l3-20020a170902eb03b02900dbc0d65845mr18267527plb.76.1610819691941; 
 Sat, 16 Jan 2021 09:54:51 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j6sm6816080pjd.33.2021.01.16.09.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 09:54:51 -0800 (PST)
Date: Sat, 16 Jan 2021 09:54:51 -0800 (PST)
X-Google-Original-Date: Sat, 16 Jan 2021 09:54:46 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.11-rc4
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-6a7bf03f-5e44-4fa0-a205-0fba77454f24@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_125456_156727_23A22869 
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.11-rc4

for you to fetch changes up to e557793799c5a8406afb08aa170509619f7eac36:

  RISC-V: Fix maximum allowed phsyical memory for RV32 (2021-01-15 21:35:48 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.11-rc4

There are a few more fixes than a normal rc4, largely due to the bubble
introduced by the holiday break:

* A fix to return -ENOSYS for syscall number -1, which previously
  returned an uninitialized value.
* A fix to time_init() to ensure of_clk_init() has been called, without
  which clock drivers may not be initialized.
* A fix to the sifive,uart0 driver to properly display the baud rate.  A
  fix to initialize MPIE that allows interrupts to be processed during
  system calls.
* A fix to avoid erronously begin tracing IRQs when interrupts are
  disabled, which at least triggers suprious lockdep failures.
* A workaround for a warning related to calling smp_processor_id() while
  preemptible.  The warning itself is suprious on currently availiable
  systems.
* A fix to properly include the generic time VDSO calls.  A fix to our
  kasan address mapping.  A fix to the HiFive Unleashed device tree,
  which allows the Ethernet PHY to be properly initialized by Linux (as
  opposed to relying on the bootloader).
* A defconfig update to include SiFive's GPIO driver, which is present
  on the HiFive Unleashed and necessary to initialize the PHY.
* A fix to avoid allocating memory while initializing reserved memory.
* A fix to avoid allocating the last 4K of memory, as pointers there
  alias with syscall errors.

There are also two cleanups that should have no functional effect but do
fix build warnings:

* A cleanup to drop a duplicated definition of PAGE_KERNEL_EXEC.
* A cleanup to properly declare the asm register SP shim.
* A cleanup to the rv32 memory size Kconfig entry, to reflect the actual
  size of memory availiable.

----------------------------------------------------------------
Andreas Schwab (1):
      riscv: return -ENOSYS for syscall -1

Atish Patra (4):
      riscv: Trace irq on only interrupt is enabled
      RISC-V: Do not allocate memblock while iterating reserved memblocks
      RISC-V: Set current memblock limit
      RISC-V: Fix maximum allowed phsyical memory for RV32

Damien Le Moal (3):
      riscv: Fix kernel time_init()
      riscv: Fix sifive serial driver
      riscv: Enable interrupts during syscalls with M-Mode

Guo Ren (1):
      riscv: Fixup CONFIG_GENERIC_TIME_VSYSCALL

Kefeng Wang (3):
      riscv: Drop a duplicated PAGE_KERNEL_EXEC
      riscv: cacheinfo: Fix using smp_processor_id() in preemptible
      riscv: stacktrace: Move register keyword to beginning of declaration

Nick Hu (1):
      riscv: Fix KASAN memory mapping.

Sagar Shrikant Kadam (3):
      dts: phy: fix missing mdio device and probe failure of vsc8541-01 device
      dts: phy: add GPIO number and active state used for phy reset
      riscv: defconfig: enable gpio support for HiFive Unleashed

 arch/riscv/Kconfig                                 |  6 ++++--
 .../riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  2 ++
 arch/riscv/configs/defconfig                       |  2 ++
 arch/riscv/include/asm/pgtable.h                   |  1 -
 arch/riscv/include/asm/vdso.h                      |  2 +-
 arch/riscv/kernel/cacheinfo.c                      | 11 +++++++++-
 arch/riscv/kernel/entry.S                          | 24 ++++++++++++----------
 arch/riscv/kernel/setup.c                          | 24 ++++++++++++----------
 arch/riscv/kernel/stacktrace.c                     |  5 ++---
 arch/riscv/kernel/time.c                           |  3 +++
 arch/riscv/kernel/vdso.c                           |  2 +-
 arch/riscv/mm/init.c                               | 16 +++++++++++++--
 arch/riscv/mm/kasan_init.c                         |  4 ++--
 drivers/tty/serial/sifive.c                        |  1 +
 14 files changed, 68 insertions(+), 35 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
