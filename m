Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B398EC07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 03:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C7316044F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 03:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C7316044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/8AouxQzIMDCzNrDEDRrqWqMLLCBNkQAHyODeeucGw=; b=fyopoyKsHHrmxd
	ndJ6oQwNG3DaKfuGgs+0A/+cbwR4hQGpmt66/6wD9L9vNrBx3zDMikGsnJbjgmnbfmRAWg4m4OgL8
	e05gpj28B84XQkDIwfzrMjhFI2yWmPUzn4andvM3lM6vA7/MyXlJGsgixiFzF8Hv7EnDi9/BFs28R
	9ysDO6C0ffhR2ugpT8IG1tpSa/YcOp/760A1vE/UkcYIHVRqKu+n0rqWyQJkU3zecBq2J4EPjyhjU
	rSM38Re6zJs68OMt+DA9Uny2iSq6uvjB2j+ZQ3manyjB4CFeBXsXVdRVRwKJVpjmvpJyNomfwN/D2
	suV2IZjRZoF5E85e4orQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1L6z-00G1Ye-0y; Thu, 08 Jul 2021 03:54:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1L6w-00G1Xr-4b
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 03:54:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so15794232wmq.1
 for <linux-riscv@lists.infradead.org>; Wed, 07 Jul 2021 20:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZWa3MSZDHv15RjZ0z5EeC98vQiHtGeO/uXKzI8GzBFw=;
 b=XTCFr7170JgT/QHOQKK4OIXt9x5YcaLpXvKfdNAjUQNxxHB4+We8I/BYK5sweWKUdx
 Khde29SVANgVGQ07/jlLHi3Ly55pBIp8Ua3RStYF8B1eijhyS191g1LYWDJQ/q36y1CM
 Wes7FduTI10HEzdpBC2LDQpPCXfEcdbbUquQiuQ/8ElzBvkZP/4kiAXg2NAowGpEU46V
 eWawf+2L92tBhiinHxhQDUhPvQyGpuA/OR2mlD1+GBPqpY9lI9GParrCwTjfEnN1A50h
 r/bIRHfzvU9DpzKoEw0USBUyKhBe3k1N3As3CrGHEGCIiEqjXJJjf2MwSyx0mDfwRFZ4
 QGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZWa3MSZDHv15RjZ0z5EeC98vQiHtGeO/uXKzI8GzBFw=;
 b=WMSMhXEfeu0dTJXJGzcSk9HT+7b+LMnFhMK7FA4eCOWQMopvW+T86XRS2IoWjaO2vE
 Oumh2e7E8lpyyv5PcE9Alh/Dte8PN2t1HDkBcUS1gehv6z9Vwd/EURIReWFV43IRQkE/
 oUVaByaaerY7FlPL3rtymjHMSv4NR7i+CIwgb6C6vBgwGjwSOHqgjDzyfbnWrZOuzGXy
 wGJ/tEmyfGLMUiPsJDlUI3tiloQYFvBsFtubkYDULwtHrzfbLBpzI8iBZ/xVSqczVq2B
 ZRpgr74sCWPVP2ojXBwUU0rFsKN/V02FuBJ55kcm8IbfFozs756QUyBSq4mTbK17rN6z
 depQ==
X-Gm-Message-State: AOAM533sY9leUCVBRyucXg9tCIfAa95Y0iv+MX1BlkL6ZUY5hRBNMlWN
 +MFlQWYL7Gir6EElB0qTZLofr6ANEwf+lMWBcl1axQ==
X-Google-Smtp-Source: ABdhPJx5pjQOButJOiL0ZDCL2KfyzjM7GnKT+FRKBaTw9/Vh+a8HUsBlndetR7xxCwd82zoAhU9bMDNtRcpg2p3RqNQ=
X-Received: by 2002:a05:600c:3399:: with SMTP id
 o25mr30069191wmp.3.1625716440637; 
 Wed, 07 Jul 2021 20:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy00KAqg37PCAGwNXt_2HTpxGY68yTPNHDEbrSwdiLa2jw@mail.gmail.com>
 <mhng-baa27714-d293-409b-9c07-6b2d1043bfad@palmerdabbelt-glaptop>
In-Reply-To: <mhng-baa27714-d293-409b-9c07-6b2d1043bfad@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 7 Jul 2021 21:21:47 +0530
Message-ID: <CAAhSdy21kOR8f8=9R-1HQW4ncmVcJEFRjNWU1N+mLejAHgBcHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] RISC-V CPU Idle Support
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 liush <liush@allwinnertech.com>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_205402_267204_99597246 
X-CRM114-Status: GOOD (  29.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 7, 2021 at 2:29 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Mon, 21 Jun 2021 21:49:11 PDT (-0700), anup@brainfault.org wrote:
> > Hi Palmer,
> >
> > On Thu, Jun 10, 2021 at 10:52 AM Anup Patel <anup.patel@wdc.com> wrote:
> >>
> >> This series adds RISC-V CPU Idle support using SBI HSM suspend function.
> >> The RISC-V SBI CPU idle driver added by this series is highly inspired
> >> from the ARM PSCI CPU idle driver.
> >>
> >> At high-level, this series includes the following changes:
> >> 1) Preparatory arch/riscv patches (Patches 1 to 3)
> >> 2) Defines for RISC-V SBI HSM suspend (Patch 4)
> >> 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
> >>    and ARM PSCI CPU idle driver (Patch 5)
> >> 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
> >>
> >> These patches can be found in riscv_sbi_hsm_suspend_v7 branch at
> >> https://github.com/avpatel/linux
> >>
> >> Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
> >> support in all above projects (RISC-V SBI specification, OpenSBI, and
> >> Linux RISC-V).
> >>
> >> Changes since v6:
> >>  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
> >>
> >> Changes since v5:
> >>  - Rebased on Linux-5.13-rc5
> >>  - Removed unnecessary exports from PATCH5
> >>  - Removed stray ";" from PATCH5
> >>  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
> >>    in PATCH6
> >>
> >> Changes since v4:
> >>  - Rebased on Linux-5.13-rc2
> >>  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
> >>  - Added MAINTAINERS file entry for dt_idle_genpd
> >>
> >> Changes since v3:
> >>  - Rebased on Linux-5.13-rc2
> >>  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
> >>  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
> >>    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
> >>
> >> Changes since v2:
> >>  - Rebased on Linux-5.12-rc3
> >>  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
> >>    idle states
> >>  - Added "additionalProperties = false" for both idle-states node and
> >>    child nodes in PATCH7
> >>
> >> Changes since v1:
> >>  - Fixex minor typo in PATCH1
> >>  - Use just "idle-states" as DT node name for CPU idle states
> >>  - Added documentation for "cpu-idle-states" DT property in
> >>    devicetree/bindings/riscv/cpus.yaml
> >>  - Added documentation for "riscv,sbi-suspend-param" DT property in
> >>    devicetree/bindings/riscv/idle-states.yaml
> >>
> >> Anup Patel (8):
> >>   RISC-V: Enable CPU_IDLE drivers
> >>   RISC-V: Rename relocate() and make it global
> >>   RISC-V: Add arch functions for non-retentive suspend entry/exit
> >>   RISC-V: Add SBI HSM suspend related defines
> >>   cpuidle: Factor-out power domain related code from PSCI domain driver
> >>   cpuidle: Add RISC-V SBI CPU idle driver
> >>   dt-bindings: Add common bindings for ARM and RISC-V idle states
> >>   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
> >
> > Can you please review this series ?
> >
> > It would be nice to consider this series for Linux-5.14.
>
> I'd assumed this one was part of the 0.3.0 freeze.

Yes, SBI HSM suspend call is part of SBI v0.3.0 release.
(Refer, https://github.com/riscv/riscv-sbi-doc/releases/tag/v0.3.0)

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> >>
> >>  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
> >>  .../devicetree/bindings/arm/psci.yaml         |   2 +-
> >>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
> >>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
> >>  MAINTAINERS                                   |  14 +
> >>  arch/riscv/Kconfig                            |   7 +
> >>  arch/riscv/Kconfig.socs                       |   3 +
> >>  arch/riscv/configs/defconfig                  |  13 +-
> >>  arch/riscv/configs/rv32_defconfig             |   6 +-
> >>  arch/riscv/include/asm/asm.h                  |  17 +
> >>  arch/riscv/include/asm/cpuidle.h              |  24 +
> >>  arch/riscv/include/asm/sbi.h                  |  27 +-
> >>  arch/riscv/include/asm/suspend.h              |  35 +
> >>  arch/riscv/kernel/Makefile                    |   2 +
> >>  arch/riscv/kernel/asm-offsets.c               |   3 +
> >>  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
> >>  arch/riscv/kernel/head.S                      |  18 +-
> >>  arch/riscv/kernel/process.c                   |   3 +-
> >>  arch/riscv/kernel/suspend.c                   |  86 +++
> >>  arch/riscv/kernel/suspend_entry.S             | 123 ++++
> >>  drivers/cpuidle/Kconfig                       |   9 +
> >>  drivers/cpuidle/Kconfig.arm                   |   1 +
> >>  drivers/cpuidle/Kconfig.riscv                 |  15 +
> >>  drivers/cpuidle/Makefile                      |   5 +
> >>  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
> >>  drivers/cpuidle/cpuidle-psci.h                |  15 +-
> >>  drivers/cpuidle/cpuidle-sbi.c                 | 626 ++++++++++++++++++
> >>  drivers/cpuidle/dt_idle_genpd.c               | 177 +++++
> >>  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
> >>  29 files changed, 1472 insertions(+), 185 deletions(-)
> >>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> >>  create mode 100644 arch/riscv/include/asm/cpuidle.h
> >>  create mode 100644 arch/riscv/include/asm/suspend.h
> >>  create mode 100644 arch/riscv/kernel/suspend.c
> >>  create mode 100644 arch/riscv/kernel/suspend_entry.S
> >>  create mode 100644 drivers/cpuidle/Kconfig.riscv
> >>  create mode 100644 drivers/cpuidle/cpuidle-sbi.c
> >>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
> >>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
> >>
> >> --
> >> 2.25.1
> >>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
