Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B42FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 00:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=URer0RulWsdJYF4d+R+pVIIy3qV0uLis8yBhaU1RPtM=; b=JVaf4noO9M6o4JixNE22aiUJ3I
	vq6dJcKEFCnNHDlo2Wx/thi9MMRO01mB0S8mRBtN1kI17XfEqPIkXL0Fz3LQN0Yx1mwFSI8bdxKJD
	5AqUL86R31ZZkLXvUeQpqTWJvNpk7hH1Axj99ToxWfn7buWzCzqNG+e9faipdnYJvj413Ki46ThY5
	94SExaZg8yXnXUgmpJB+7FQ6GjNZAMHqQaJIs78jFgACW6ek5GgZZUWTBDVHHJKKG2hIlceesKLGx
	E8CJynuW+jDIo9hCe1vzb+mgKGzULU4Dnsu6P5SuBpSIqUTieV8cvYUZZWlOPUiLs3OtUUxG+uQRU
	63OG4bLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZiUl-000BeO-CA; Thu, 31 Mar 2022 00:16:59 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZiUY-000Bah-BO
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 00:16:49 +0000
Received: by mail-pl1-x62d.google.com with SMTP id a16so5035919plh.13
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 17:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hV5Vaha8m52Fl/sbC+q84uMk9aQkw6LUqtUCcgndF8M=;
 b=CV+r1o6zChs5P5InM9X1qElR7wUi9znFVzk+BTEw9wbkC5GpnAL32a0JlFZ5IDVGEs
 VX2dMQ+caneEvjqT0ygPK6CJf2NcwPcVFDb9GtiAYvNrHg1ZDhFz72fD34Y1a8hbQ6RI
 nL2QkUrZrHGMidBFNqIBJdRoKs0Zy261sw1wIyJ9CJngYZCqaX+WVLtzebLvwAe2pHYw
 5Y5mAuJGZPm6WtoZzG7mpZahhtAS8MS8TSND9TArgR+796jXSrne0Lh6wgDOmPulJYNl
 ozTTy8BOxKZ1SSj/if+fYPGeZhmUpBi7gD2PZF1hx9FQk6uFLTkDrLwRMEv3o1Ggo8gH
 JDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hV5Vaha8m52Fl/sbC+q84uMk9aQkw6LUqtUCcgndF8M=;
 b=rYeU7p0tZUL6Xa0BjQUZAXJKC3GgZX+5TmxZIdNia1/Es8kxMdb9N74zYP7D7jiTjw
 PbUyQ6TBq4CAapLKOlD1A8l89KpYvw7+AJ+kGeTdNgajikJhtzo7rdcz2AUkZSyb4c79
 MM84LZwsZMkElf8RUMSovddPq7QWE8opoD9OYAwFJg0PWG4lyP7HWDHbWvYi1VdRVIcX
 sc0geAfBnDvZ9hJJVBOMwyIUZlQZLL8KIcG3YVLgt8ZAi7QlstR7gVybze735Ojt1mup
 IMWS1gKbyVeQV2LhIoeN7CFLy1+3ZkFLIxZGE2dmdQClhmQT+IvS1Qgi1pPZcMU24D8d
 l3hQ==
X-Gm-Message-State: AOAM5338IDg6JBE3AScH0vgXNy0c5CBSZrkJ6dUgBLGHT5WVRcMnLaDD
 z5WseuOsV/JIhF3nTO1csXsEvw==
X-Google-Smtp-Source: ABdhPJz3Vbz6dsNGCNsUCpmIHgTM0rvC4Z04UHGBv/6dn0xozsPKDxJlOJ9mtUs2fY8yqbbfl4uTuQ==
X-Received: by 2002:a17:903:206:b0:153:ebab:a52f with SMTP id
 r6-20020a170903020600b00153ebaba52fmr2479213plh.118.1648685805530; 
 Wed, 30 Mar 2022 17:16:45 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004f1111c66afsm27292172pfl.148.2022.03.30.17.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:16:44 -0700 (PDT)
Date: Wed, 30 Mar 2022 17:16:44 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 17:16:33 PDT (-0700)
Subject: Re: [PATCH v11 0/8] RISC-V CPU Idle Support
In-Reply-To: <20220210054947.170134-1-apatel@ventanamicro.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
 pavel@ucw.cz, robh+dt@kernel.org, 
 milun.tripathy@gmail.com, atishp@atishpatra.org,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 liush@allwinnertech.com, anup@brainfault.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-ed3c61a2-45a5-4cc4-b1ec-26e25f92c0a3@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_171646_498024_622213B8 
X-CRM114-Status: GOOD (  23.90  )
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

On Wed, 09 Feb 2022 21:49:39 PST (-0800), apatel@ventanamicro.com wrote:
> From: Anup Patel <anup.patel@wdc.com>
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
> These patches can be found in riscv_sbi_hsm_suspend_v11 branch of
> https://github.com/avpatel/linux.git
>
> Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
> support in all above projects (RISC-V SBI specification, OpenSBI, and
> Linux RISC-V).
>
> Changes since v10:
>  - Rebased on Linux-5.17-rc3
>  - Typo fix in commit description of PATCH6
>
> Changes since v9:
>  - Rebased on Linux-5.17-rc1
>
> Changes since v8:
>  - Rebased on Linux-5.15-rc5
>  - Fixed DT schema check errors in PATCH7
>
> Changes since v7:
>  - Rebased on Linux-5.15-rc3
>  - Renamed cpuidle-sbi.c to cpuidle-riscv-sbi.c in PATCH6
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
>
>  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
>  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>  MAINTAINERS                                   |  14 +
>  arch/riscv/Kconfig                            |   7 +
>  arch/riscv/Kconfig.socs                       |   3 +
>  arch/riscv/configs/defconfig                  |   2 +
>  arch/riscv/configs/rv32_defconfig             |   2 +
>  arch/riscv/include/asm/asm.h                  |  27 +
>  arch/riscv/include/asm/cpuidle.h              |  24 +
>  arch/riscv/include/asm/sbi.h                  |  27 +-
>  arch/riscv/include/asm/suspend.h              |  36 +
>  arch/riscv/kernel/Makefile                    |   2 +
>  arch/riscv/kernel/asm-offsets.c               |   3 +
>  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
>  arch/riscv/kernel/head.S                      |  28 +-
>  arch/riscv/kernel/process.c                   |   3 +-
>  arch/riscv/kernel/suspend.c                   |  87 +++
>  arch/riscv/kernel/suspend_entry.S             | 124 ++++
>  arch/riscv/kvm/vcpu_sbi_hsm.c                 |   4 +-
>  drivers/cpuidle/Kconfig                       |   9 +
>  drivers/cpuidle/Kconfig.arm                   |   1 +
>  drivers/cpuidle/Kconfig.riscv                 |  15 +
>  drivers/cpuidle/Makefile                      |   5 +
>  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
>  drivers/cpuidle/cpuidle-psci.h                |  15 +-
>  drivers/cpuidle/cpuidle-riscv-sbi.c           | 627 ++++++++++++++++++
>  drivers/cpuidle/dt_idle_genpd.c               | 178 +++++
>  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>  30 files changed, 1484 insertions(+), 187 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>  create mode 100644 arch/riscv/include/asm/cpuidle.h
>  create mode 100644 arch/riscv/include/asm/suspend.h
>  create mode 100644 arch/riscv/kernel/suspend.c
>  create mode 100644 arch/riscv/kernel/suspend_entry.S
>  create mode 100644 drivers/cpuidle/Kconfig.riscv
>  create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>  create mode 100644 drivers/cpuidle/dt_idle_genpd.h

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
