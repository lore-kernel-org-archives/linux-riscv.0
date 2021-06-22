Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B615C2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 04:49:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004FD601FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 04:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 004FD601FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPUC70c74TfIdz1AIyleVR1zdfYAx0guXCiLok6iHrQ=; b=CK60nGZ4403b7S
	hze5JrJm5nT5rOwZ+o4i/+RLxjwUtOlIFtU4UmdeVwmh0sHsAZeBfKG/dWCJW6Kz4QU7pRuIBwzpc
	EJbCR9TJHb8QuZjiQ0d7tbIJs8JNSgmJfYSMLmD1hiN35Nqr5coKWaOLelRL8mK/qHw735OJjh/Nk
	sNfxBpnCtWShGeZ9v7kxyTnZ5Aza5jXuVr0e7NYNNHCSQ8/EY6DbyVexcvuRIIJRhub8rZmANs3lk
	5CHM+vluviNiocilOY+8dgMfqzFxo16szikOitRDymIU9oWx4x6/98t0p6eBDypMj+RWjNBAfgaV8
	Om5QGoqSB6G1XYUvpHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvYLm-005eVa-6u; Tue, 22 Jun 2021 04:49:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvYLk-005eUi-0g
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 04:49:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id n7so22004346wri.3
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jun 2021 21:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LZDUAnqEXjRVZWh1a1xJ1KodfKynosGX+MGHfcnE+kU=;
 b=bH4f1th7fB3/XSYd6w/iVmgPpxVgsJ3aJmbLqWedYwp9i75zoJ/imdZCICERT9g3fF
 YULFqKNz6F/epgqr5mdJIh8/upyxVLtWGUfYbRCK/VCu95PPVKJPY4c6VsKfGmpqKBSt
 fln5qvXh9p+ilYo7R3rYscL4zn+fiFxs6ol9N82k4JbR0NeYyqMJ573O18CNCM+YGeoN
 xADdUH/x4BzN63KiLgP5XXLurHCsRxXwOPZEwIUXZeyVOQUewlaS2srVZxhuWXsz/28o
 ENV3xIu69pdHqngak3AEYJSHE07V/kUTq+c8mhLcDhI25noNGdNYh/sJLGE9WQeawOhQ
 WU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LZDUAnqEXjRVZWh1a1xJ1KodfKynosGX+MGHfcnE+kU=;
 b=lq18MZ4DSzISdULwFp0GFzPD6e7Ma3B4MbEueGOIjACGpJVPy/5Ctv5zITEgCMp5bo
 6k2+RKmycd8pzJ5I3EHGIwnKMdEKIb+vSaxbfw2HKi/YHXcwO1sT5tHkqKrnguGpglZ6
 tQzqmMP+k4eql7OKOI1I06LOK0z5czlN+eK04x/T5Cm6Qh9t2AwdxAL+Yv/+pwMphz8V
 oo/64zcXFO5ZYTHhKefxyJbTEIY2NSq+mNUXZEZsEd/XBF8aqmOwEwetnQDMDHp2+yyr
 GjEPjgDJrdcBEUziBJI1HXS2OpwRdiHczDklY/TNSthcf2HuMmn6kLE+QjNA9+uA53or
 RgNw==
X-Gm-Message-State: AOAM5324Bv3qHBTHnJrbZYWtWg+gD73iRWNaVmIabHihIG48or4YHWHV
 Ce9jDPdjcMkvy0fm0ahhWR8lOL6XTPsBT3/DFso5VA==
X-Google-Smtp-Source: ABdhPJwH28VdMClZV5cXRWjOAW5ajVp3FB9zxBUuvaVaxTUHQtU/5jIhNmSJ1wgDKuI5HeKx8JSfTJqVrJOC3H7w8IY=
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr2226740wrz.144.1624337362425; 
 Mon, 21 Jun 2021 21:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210610052221.39958-1-anup.patel@wdc.com>
In-Reply-To: <20210610052221.39958-1-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Jun 2021 10:19:11 +0530
Message-ID: <CAAhSdy00KAqg37PCAGwNXt_2HTpxGY68yTPNHDEbrSwdiLa2jw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] RISC-V CPU Idle Support
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_214924_137342_8A13CF1C 
X-CRM114-Status: GOOD (  24.65  )
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

Hi Palmer,

On Thu, Jun 10, 2021 at 10:52 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> This series adds RISC-V CPU Idle support using SBI HSM suspend function.
> The RISC-V SBI CPU idle driver added by this series is highly inspired
> from the ARM PSCI CPU idle driver.
>
> At high-level, this series includes the following changes:
> 1) Preparatory arch/riscv patches (Patches 1 to 3)
> 2) Defines for RISC-V SBI HSM suspend (Patch 4)
> 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
>    and ARM PSCI CPU idle driver (Patch 5)
> 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
>
> These patches can be found in riscv_sbi_hsm_suspend_v7 branch at
> https://github.com/avpatel/linux
>
> Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
> support in all above projects (RISC-V SBI specification, OpenSBI, and
> Linux RISC-V).
>
> Changes since v6:
>  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
>
> Changes since v5:
>  - Rebased on Linux-5.13-rc5
>  - Removed unnecessary exports from PATCH5
>  - Removed stray ";" from PATCH5
>  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
>    in PATCH6
>
> Changes since v4:
>  - Rebased on Linux-5.13-rc2
>  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
>  - Added MAINTAINERS file entry for dt_idle_genpd
>
> Changes since v3:
>  - Rebased on Linux-5.13-rc2
>  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
>  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
>    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
>
> Changes since v2:
>  - Rebased on Linux-5.12-rc3
>  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
>    idle states
>  - Added "additionalProperties = false" for both idle-states node and
>    child nodes in PATCH7
>
> Changes since v1:
>  - Fixex minor typo in PATCH1
>  - Use just "idle-states" as DT node name for CPU idle states
>  - Added documentation for "cpu-idle-states" DT property in
>    devicetree/bindings/riscv/cpus.yaml
>  - Added documentation for "riscv,sbi-suspend-param" DT property in
>    devicetree/bindings/riscv/idle-states.yaml
>
> Anup Patel (8):
>   RISC-V: Enable CPU_IDLE drivers
>   RISC-V: Rename relocate() and make it global
>   RISC-V: Add arch functions for non-retentive suspend entry/exit
>   RISC-V: Add SBI HSM suspend related defines
>   cpuidle: Factor-out power domain related code from PSCI domain driver
>   cpuidle: Add RISC-V SBI CPU idle driver
>   dt-bindings: Add common bindings for ARM and RISC-V idle states
>   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine

Can you please review this series ?

It would be nice to consider this series for Linux-5.14.

Regards,
Anup

>
>  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  MAINTAINERS                                   |  14 +
>  arch/riscv/Kconfig                            |   7 +
>  arch/riscv/Kconfig.socs                       |   3 +
>  arch/riscv/configs/defconfig                  |  13 +-
>  arch/riscv/configs/rv32_defconfig             |   6 +-
>  arch/riscv/include/asm/asm.h                  |  17 +
>  arch/riscv/include/asm/cpuidle.h              |  24 +
>  arch/riscv/include/asm/sbi.h                  |  27 +-
>  arch/riscv/include/asm/suspend.h              |  35 +
>  arch/riscv/kernel/Makefile                    |   2 +
>  arch/riscv/kernel/asm-offsets.c               |   3 +
>  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
>  arch/riscv/kernel/head.S                      |  18 +-
>  arch/riscv/kernel/process.c                   |   3 +-
>  arch/riscv/kernel/suspend.c                   |  86 +++
>  arch/riscv/kernel/suspend_entry.S             | 123 ++++
>  drivers/cpuidle/Kconfig                       |   9 +
>  drivers/cpuidle/Kconfig.arm                   |   1 +
>  drivers/cpuidle/Kconfig.riscv                 |  15 +
>  drivers/cpuidle/Makefile                      |   5 +
>  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
>  drivers/cpuidle/cpuidle-psci.h                |  15 +-
>  drivers/cpuidle/cpuidle-sbi.c                 | 626 ++++++++++++++++++
>  drivers/cpuidle/dt_idle_genpd.c               | 177 +++++
>  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>  29 files changed, 1472 insertions(+), 185 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>  create mode 100644 arch/riscv/include/asm/suspend.h
>  create mode 100644 arch/riscv/kernel/suspend.c
>  create mode 100644 arch/riscv/kernel/suspend_entry.S
>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>  create mode 100644 drivers/cpuidle/cpuidle-sbi.c
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
