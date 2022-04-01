Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7u4K40c8WdYZzrf6yTOr3W4q2qecNv41vUub6NmHhcA=; b=cl7WDKkUqnQ7aa
	87WqBIx11LhY7Dw0wG7ldcBXYoIG/y9bRBRLac8qUCBDNQtZETKiEu+Gw3PCBVXdTi8go9Mj7oND1
	gVYmiAbtFuMkavoFK3weRJ5sVkafNa7kCOjwUct2bMMmfP9VXFlqF1p2soreg2RWJZ41s6ufMIU0R
	IMdfr7lbDp3jH1tWrWpsn/0M2CNy4x50l93Ppm785nAsJau8cAiZuykcjNy1GPdzwmPrjZ4iSatDa
	/L9f2XvpSA9bSSLZaQqT72UsEBUbj+FETWRVmSzxth3I1fVXocZyDTsRk3TRtHMQSRWdkgJOsAu5z
	h4kJ0uH3FdWXdq96Vihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naMbl-006w7Y-Vk; Fri, 01 Apr 2022 19:06:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naMbi-006w6Q-Ax
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 19:06:52 +0000
Received: by mail-pl1-x62b.google.com with SMTP id i11so3238096plr.1
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=Vz0D530vr30ta3ikWYLt9XqGgn2wBZI9uNjfQxO4G/s=;
 b=WnguEqDv8FXg7Kf0mlgZrLn0Nw5DrrcmIoatP+xeUHHTQ7yKYOqn6hzrUHI6xufICk
 aXget21A20Ja3UXZewis8NDA8oG1qeKXeBjZQz/gNTOgAkOHXeqB5SEDNjGhi59UbkYR
 QIuPqR/O/fDRnK2JhxvW3aHu7zn/F0vzNUXckJWFjhmDiVPt0gSSL+Ql/1j8xuc8XbZO
 g9Qk2xeqYR46XuYvyBt/vpHWVfJO99FQPW8YFjL1ncf0zn0Q6/oy2GdDRaYbfjifCLVT
 xb3915/p6c7cQ7iqPRAKvaRC5jTR0VA6CDiFReKiLDMam/o78YUCRUcUH6vD+ZRmpUsn
 9eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=Vz0D530vr30ta3ikWYLt9XqGgn2wBZI9uNjfQxO4G/s=;
 b=76KasMR/w6o1WkzcLkPqvo3oH1dUqPgdcAcqS/LMc0k4hK09NpJSZZESUpvMaeLWLB
 j7/8g+AL71cwVx6LqjmDhdiJjdFF7xUGNvrnI/uKScL8x15Sswi/6XZMA4yZpYH1alHN
 AQOEYVW4yC5Fy07krL/ewwAX5DgFPx0+hlo/mwSmMvEObw/RuLkW2WQttZ0FXm/tOK3E
 rXbIoG9mnQtm45IOIyEhcElM/bv3Y2ra/q57XP4E2/VPNY2ieW1em4ALID5jLS8s00Ad
 CV3xh0Mfeea+48kT5wpMaWeX2y1Kn9UuYhveTuZ4HG+EpCeFRwLwgsZ9HLyngIpu7ZRH
 tkDA==
X-Gm-Message-State: AOAM530vnZogIQdz2G54Mo94f3RzOvTD/J2mIoIS3wP774iuOe9Bv6Aa
 FlO+i6lrYqZkjs2WPFw4xqDjUA==
X-Google-Smtp-Source: ABdhPJzeoYpBLYLINOMRn/4gs8t8dKLXMoK4zBd5wA9YzxZ14UTJEMRzA0E4FtbB2ALqh+ViJ+Bldg==
X-Received: by 2002:a17:903:41c8:b0:154:78a8:21 with SMTP id
 u8-20020a17090341c800b0015478a80021mr47840411ple.67.1648840008202; 
 Fri, 01 Apr 2022 12:06:48 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 b13-20020a056a00114d00b004c122b90703sm3867661pfm.27.2022.04.01.12.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 12:06:47 -0700 (PDT)
Date: Fri, 01 Apr 2022 12:06:47 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 12:06:45 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.18 Merge Window, Part 2
In-Reply-To: <mhng-149533f0-8756-4510-9724-e8e61f2e62c5@palmer-mbp2014>
CC: robh+dt@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-658e1e1b-38e0-4cc9-9f77-980caf39cb81@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_120650_641650_0F97DC71 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, 01 Apr 2022 11:52:32 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 01 Apr 2022 09:41:50 PDT (-0700), Palmer Dabbelt wrote:
>> merged tag 'riscv-for-linus-5.18-mw0'
>> The following changes since commit aa5b537b0ecc16992577b013f11112d54c7ce869:
>>
>>   Merge tag 'riscv-for-linus-5.18-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-03-25 10:11:38 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.18-mw1
>>
>> for you to fetch changes up to 1464d00b27b2e29a5556f6a4099cf083886e883f:
>>
>>   RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n (2022-03-31 17:19:27 -0700)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 5.18 Merge Window, Part 2
>>
>> This has a handful of new features
>>
>> * Support for CURRENT_STACK_POINTER, which enables some extra stack
>>   debugging for HARDENED_USERCOPY.
>> * Support for the new SBI CPU idle extension, via cpuidle and suspend
>>   drivers.
>
> Sorry, looks like there are some issues with this series that Rob
> pointed out.  I'm going to re-spin this PR without those, unfortunately
> they're towards the beginning.

Sorry for the confusion, but after talking to Rob on IRC: the plan is to 
send a Part 3, with a fix for the DT warnings on top of this -- that's 
much less scary that a rebase this late.

>> * Profiling has been enabled in the defconfigs.
>>
>> but is mostly fixes and cleanups.
>>
>> ----------------------------------------------------------------
>> There are no merge conflicts.  I'm getting on allyesconfig warning in
>> drivers/misc/habanalabs, but that appears to just be a 32-bit problem (it's
>> happening on 32-bit x86 as well).  I've sent a patch for that, but I doubt it's
>> a RISC-V issue so I'm sending this at the same time.
>>
>> With that patch I get clean build that boot after my test merge.
>>
>> ----------------------------------------------------------------
>> Anup Patel (9):
>>       RISC-V: Enable CPU_IDLE drivers
>>       RISC-V: Rename relocate() and make it global
>>       RISC-V: Add arch functions for non-retentive suspend entry/exit
>>       RISC-V: Add SBI HSM suspend related defines
>>       cpuidle: Factor-out power domain related code from PSCI domain driver
>>       cpuidle: Add RISC-V SBI CPU idle driver
>>       dt-bindings: Add common bindings for ARM and RISC-V idle states
>>       RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
>>       RISC-V: Enable profiling by default
>>
>> Atish Patra (2):
>>       RISC-V: Fix a comment typo in riscv_of_parent_hartid()
>>       RISC-V: Declare per cpu boot data as static
>>
>> Bagas Sanjaya (1):
>>       Documentation: riscv: remove non-existent directory from table of contents
>>
>> Dmitry Vyukov (1):
>>       riscv: Increase stack size under KASAN
>>
>> Fangrui Song (1):
>>       riscv module: remove (NOLOAD)
>>
>> Kees Cook (1):
>>       riscv: Rename "sp_in_global" to "current_stack_pointer"
>>
>> Nikita Shubin (1):
>>       riscv: Fix fill_callchain return value
>>
>> Niklas Cassel (1):
>>       riscv: dts: canaan: Fix SPI3 bus width
>>
>> Palmer Dabbelt (3):
>>       RISC-V CPU Idle Support
>>       RISC-V: defconfig: Drop redundant SBI HVC and earlycon
>>       RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n
>>
>> Randy Dunlap (1):
>>       riscv: cpu.c: don't use kernel-doc markers for comments
>>
>> Wu Caize (1):
>>       RISC-V: module: fix apply_r_riscv_rcv_branch_rela typo
>>
>>  .../bindings/arm/msm/qcom,idle-state.txt           |   2 +-
>>  Documentation/devicetree/bindings/arm/psci.yaml    |   2 +-
>>  .../bindings/{arm => cpu}/idle-states.yaml         | 228 +++++++-
>>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   6 +
>>  Documentation/riscv/index.rst                      |   1 -
>>  MAINTAINERS                                        |  14 +
>>  arch/riscv/Kconfig                                 |   8 +
>>  arch/riscv/Kconfig.socs                            |   3 +
>>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts     |   2 +
>>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts    |   2 +
>>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts      |   2 +
>>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts    |   2 +
>>  arch/riscv/configs/defconfig                       |   5 +-
>>  arch/riscv/configs/nommu_k210_defconfig            |   1 -
>>  arch/riscv/configs/nommu_k210_sdcard_defconfig     |   1 -
>>  arch/riscv/configs/nommu_virt_defconfig            |   1 -
>>  arch/riscv/configs/rv32_defconfig                  |   5 +-
>>  arch/riscv/include/asm/asm.h                       |  26 +
>>  arch/riscv/include/asm/cpuidle.h                   |  24 +
>>  arch/riscv/include/asm/current.h                   |   2 +
>>  arch/riscv/include/asm/module.lds.h                |   6 +-
>>  arch/riscv/include/asm/suspend.h                   |  36 ++
>>  arch/riscv/include/asm/thread_info.h               |  10 +-
>>  arch/riscv/kernel/Makefile                         |   2 +
>>  arch/riscv/kernel/asm-offsets.c                    |   3 +
>>  arch/riscv/kernel/cpu.c                            |   6 +-
>>  arch/riscv/kernel/cpu_ops_sbi.c                    |   2 +-
>>  arch/riscv/kernel/head.S                           |  27 +-
>>  arch/riscv/kernel/module.c                         |   4 +-
>>  arch/riscv/kernel/perf_callchain.c                 |   2 +-
>>  arch/riscv/kernel/process.c                        |   3 +-
>>  arch/riscv/kernel/stacktrace.c                     |   6 +-
>>  arch/riscv/kernel/suspend.c                        |  87 +++
>>  arch/riscv/kernel/suspend_entry.S                  | 124 ++++
>>  drivers/cpuidle/Kconfig                            |   9 +
>>  drivers/cpuidle/Kconfig.arm                        |   1 +
>>  drivers/cpuidle/Kconfig.riscv                      |  15 +
>>  drivers/cpuidle/Makefile                           |   5 +
>>  drivers/cpuidle/cpuidle-psci-domain.c              | 138 +----
>>  drivers/cpuidle/cpuidle-psci.h                     |  15 +-
>>  drivers/cpuidle/cpuidle-riscv-sbi.c                | 627 +++++++++++++++++++++
>>  drivers/cpuidle/dt_idle_genpd.c                    | 178 ++++++
>>  drivers/cpuidle/dt_idle_genpd.h                    |  50 ++
>>  43 files changed, 1491 insertions(+), 202 deletions(-)
>>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>>  create mode 100644 arch/riscv/include/asm/suspend.h
>>  create mode 100644 arch/riscv/kernel/suspend.c
>>  create mode 100644 arch/riscv/kernel/suspend_entry.S
>>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>>  create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
>>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
