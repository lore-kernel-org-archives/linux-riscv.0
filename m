Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFBFC07E96
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 20:59:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8088461CA0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 20:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8088461CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=DWtxtlKrwgRN5ayG1RKOeDUCZGcVlItgO3zW4ZpZTbs=; b=E0vU4nwaN7Mgue8C6dnFpwxkMX
	5HkJ9MP47mZzwY3TQAfoDBfd/Q8GPyQkHJzohXLPGiUTk/QUKG+lSduYncI+eYbiEltBomnqvRoh+
	0O91aiJCz6z2G1tUmsxtzHXFVRrHle7iZcjXIi2YIA7NOGXUwS4LPh4F7AwuHKTkP/z1a7yad5dMW
	J6/EtjPPIUSu7XBI/onpPPUK04zhbkslxV+2les8ZDkGHHV2ntzUxhhhx20SA3IFNfWdGeTH08hCc
	xprFhJItkOK4u1Cd7KsY1s2WW0qeNKtHJ2fySWY5WC7Tf6EiKf2RPouVSG6lKf4t0RJFvuwKpntcO
	m40B3qdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0sA8-00CpIA-Ai; Tue, 06 Jul 2021 20:59:24 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0sA5-00CpGx-7S
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 20:59:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id s13so9659107plg.12
 for <linux-riscv@lists.infradead.org>; Tue, 06 Jul 2021 13:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0PBoIcqbc65Ea7VP0qFC6aAUDYW+WwmHWgilnraPFf8=;
 b=bag2+61IEn5zv40WALO9seg3t+Bh91fFOJVgNqS2ojhXIWZao47sLkLmcRAjniRsnY
 GUa7BZqHypqGUwZrDw0RlN3eLhqykQfy0ktv6tC2tZ2W6KiwCc2GzVmiMrtiowk7NkDn
 Vl5Lz7Rujnw5Q0p2jLBH8nl+KL/9N/j0ejdI3ZcVZLNbQ7Jp01dMF24pordORzYJrYU9
 lvXbVbKpGmZxYMPJS/hxQ+05ehQt5LvofS/r56y/wOhNMqSUFoWJyvuoCwZp3CsNck7z
 dDCx3jBv3Zm1+LaSkNQ3VKzlLj/gPei5L01ZhhgBWXlw6ETiw671j8JDDIEt2yyiez85
 5cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0PBoIcqbc65Ea7VP0qFC6aAUDYW+WwmHWgilnraPFf8=;
 b=WrUiCg6S0XSqE6QVCkzDixslt9L5LDnRqf5AjRZ6xyNPMvETBZ8nMZK0Tqc5hIXdAe
 N/0sVsjs82d7jeA4r+BfiAKKwjcrWi+BAkC9JPNUyTSRe85C/lGEzLWykBI1Nad7R+Xn
 YFAdUyebzs7RgnYyLBgyvOdliSvXPUY7dcyfPJFNrzxrXtX+DaT2GhmpAKxhYU8Bqs5v
 ZPjUsbxdZxG0GsvScN24d/NGuXHFfHA0Ao8lrbThLs+kA2/ZpPM6EUxHr92z1d1QxTP5
 3L5fYPxDnXIdZ7NUcw/yrhPNQVo5oB3XAH0RnF9cd+uBBZcCAX8mQKZMvxJBKivTMi4r
 MsDQ==
X-Gm-Message-State: AOAM532meYzVExYF+3MGqvTWoguKpAKFHj9As5E5HeQYWWfB29zuCZLJ
 fiUzFP2KzOhRQsaZs9V4FPouuA==
X-Google-Smtp-Source: ABdhPJzzExInJYeXPhXIYEiGqFxMLYlqTWxOzHBELFSbWOSs+Pnp5HP64Icyydt2eV1nPtBl/uv8fg==
X-Received: by 2002:a17:90a:8417:: with SMTP id
 j23mr17733738pjn.168.1625605160144; 
 Tue, 06 Jul 2021 13:59:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g17sm20738691pgh.61.2021.07.06.13.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 13:59:19 -0700 (PDT)
Date: Tue, 06 Jul 2021 13:59:19 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Jul 2021 13:59:17 PDT (-0700)
Subject: Re: [PATCH v7 0/8] RISC-V CPU Idle Support
In-Reply-To: <CAAhSdy00KAqg37PCAGwNXt_2HTpxGY68yTPNHDEbrSwdiLa2jw@mail.gmail.com>
CC: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, ulf.hansson@linaro.org,
 rjw@rjwysocki.net, 
 pavel@ucw.cz, robh+dt@kernel.org, milun.tripathy@gmail.com,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 liush@allwinnertech.com, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: anup@brainfault.org
Message-ID: <mhng-baa27714-d293-409b-9c07-6b2d1043bfad@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_135921_344530_2B2F274C 
X-CRM114-Status: GOOD (  22.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 21 Jun 2021 21:49:11 PDT (-0700), anup@brainfault.org wrote:
> Hi Palmer,
>
> On Thu, Jun 10, 2021 at 10:52 AM Anup Patel <anup.patel@wdc.com> wrote:
>>
>> This series adds RISC-V CPU Idle support using SBI HSM suspend function.
>> The RISC-V SBI CPU idle driver added by this series is highly inspired
>> from the ARM PSCI CPU idle driver.
>>
>> At high-level, this series includes the following changes:
>> 1) Preparatory arch/riscv patches (Patches 1 to 3)
>> 2) Defines for RISC-V SBI HSM suspend (Patch 4)
>> 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
>>    and ARM PSCI CPU idle driver (Patch 5)
>> 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
>>
>> These patches can be found in riscv_sbi_hsm_suspend_v7 branch at
>> https://github.com/avpatel/linux
>>
>> Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
>> support in all above projects (RISC-V SBI specification, OpenSBI, and
>> Linux RISC-V).
>>
>> Changes since v6:
>>  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
>>
>> Changes since v5:
>>  - Rebased on Linux-5.13-rc5
>>  - Removed unnecessary exports from PATCH5
>>  - Removed stray ";" from PATCH5
>>  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
>>    in PATCH6
>>
>> Changes since v4:
>>  - Rebased on Linux-5.13-rc2
>>  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
>>  - Added MAINTAINERS file entry for dt_idle_genpd
>>
>> Changes since v3:
>>  - Rebased on Linux-5.13-rc2
>>  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
>>  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
>>    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
>>
>> Changes since v2:
>>  - Rebased on Linux-5.12-rc3
>>  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
>>    idle states
>>  - Added "additionalProperties = false" for both idle-states node and
>>    child nodes in PATCH7
>>
>> Changes since v1:
>>  - Fixex minor typo in PATCH1
>>  - Use just "idle-states" as DT node name for CPU idle states
>>  - Added documentation for "cpu-idle-states" DT property in
>>    devicetree/bindings/riscv/cpus.yaml
>>  - Added documentation for "riscv,sbi-suspend-param" DT property in
>>    devicetree/bindings/riscv/idle-states.yaml
>>
>> Anup Patel (8):
>>   RISC-V: Enable CPU_IDLE drivers
>>   RISC-V: Rename relocate() and make it global
>>   RISC-V: Add arch functions for non-retentive suspend entry/exit
>>   RISC-V: Add SBI HSM suspend related defines
>>   cpuidle: Factor-out power domain related code from PSCI domain driver
>>   cpuidle: Add RISC-V SBI CPU idle driver
>>   dt-bindings: Add common bindings for ARM and RISC-V idle states
>>   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
>
> Can you please review this series ?
>
> It would be nice to consider this series for Linux-5.14.

I'd assumed this one was part of the 0.3.0 freeze.

>
> Regards,
> Anup
>
>>
>>  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>>  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
>>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>>  MAINTAINERS                                   |  14 +
>>  arch/riscv/Kconfig                            |   7 +
>>  arch/riscv/Kconfig.socs                       |   3 +
>>  arch/riscv/configs/defconfig                  |  13 +-
>>  arch/riscv/configs/rv32_defconfig             |   6 +-
>>  arch/riscv/include/asm/asm.h                  |  17 +
>>  arch/riscv/include/asm/cpuidle.h              |  24 +
>>  arch/riscv/include/asm/sbi.h                  |  27 +-
>>  arch/riscv/include/asm/suspend.h              |  35 +
>>  arch/riscv/kernel/Makefile                    |   2 +
>>  arch/riscv/kernel/asm-offsets.c               |   3 +
>>  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
>>  arch/riscv/kernel/head.S                      |  18 +-
>>  arch/riscv/kernel/process.c                   |   3 +-
>>  arch/riscv/kernel/suspend.c                   |  86 +++
>>  arch/riscv/kernel/suspend_entry.S             | 123 ++++
>>  drivers/cpuidle/Kconfig                       |   9 +
>>  drivers/cpuidle/Kconfig.arm                   |   1 +
>>  drivers/cpuidle/Kconfig.riscv                 |  15 +
>>  drivers/cpuidle/Makefile                      |   5 +
>>  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
>>  drivers/cpuidle/cpuidle-psci.h                |  15 +-
>>  drivers/cpuidle/cpuidle-sbi.c                 | 626 ++++++++++++++++++
>>  drivers/cpuidle/dt_idle_genpd.c               | 177 +++++
>>  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>>  29 files changed, 1472 insertions(+), 185 deletions(-)
>>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>>  create mode 100644 arch/riscv/include/asm/suspend.h
>>  create mode 100644 arch/riscv/kernel/suspend.c
>>  create mode 100644 arch/riscv/kernel/suspend_entry.S
>>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>>  create mode 100644 drivers/cpuidle/cpuidle-sbi.c
>>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
>>
>> --
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
