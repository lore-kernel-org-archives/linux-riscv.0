Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE50C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Apr 2022 18:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lXhB22kjXj1U1EbnguJpes3KsRq60DVsL6u8DelHPhc=; b=OenrFdz39klY1+3KmQ8fq032e4
	e+TLtGXFgwgatX0XgvIE4Oe6vzHYBkDx554SFfZeq4azYx/h93aH+NIA0Vf3FAgkYY7oeWhhjSwHu
	hEH7HDEeA22U2ACNMdzK5g+NY83O9iWS79fszwyCJbJm9LlwW0iHC1eARd8ZNirGDvUXD+weovX0z
	T0Cu2YUJPdTz9UZCpBzDMRAhSU0yg3Q75/N1QfgUtLDjRCinNX4w4bKFuqrv7f9oC29G5smpRj/i8
	Q8AQASX1MgmS4oPO9X9JApp6pW/2ezpSi62l0QtkokvmHDNlBCK3IcB2ASJ5CWdJnq+TR+64PaBRr
	6x/ZJs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naMAq-006slb-Jk; Fri, 01 Apr 2022 18:39:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naMAm-006skH-Te
 for linux-riscv@lists.infradead.org; Fri, 01 Apr 2022 18:39:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id bx5so3159767pjb.3
 for <linux-riscv@lists.infradead.org>; Fri, 01 Apr 2022 11:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=UUpRwvWU3uzIY9akgrfvRv+/WSVKa7HyF5aV+QFu1po=;
 b=IgF2TA1aF0OrplQ/Rawp8uU8q4QN2pNzNwlx+f/PMkcIsNy7NJI+tskgwXrtHvGWpV
 lVb09x84BNcnvWV0A2U0lmP8OCuteY7vNH6e/50LdGp3QR1E/rKRUk0ssKfxMB2/XvCN
 CLqGBi78pFJ1maXIC7WECr6eWriKvTdJfA++ZZt88SceW3y3c1teh46gcZVIJutkqt6u
 Digoj2qDqmOrdf11I/UX/sZD1329puBY/vRAM3ZICYDneBGohnWsnRcMmUrH4dM0dwkv
 XmdG9hGBE4NENsrWLQsoUXem67qr+azG/54BR4CrkLO8IqCZFfS2jBna9kmNgWT9XUI8
 nxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UUpRwvWU3uzIY9akgrfvRv+/WSVKa7HyF5aV+QFu1po=;
 b=5M1eg14fq+xE6NJWmMT9dq/8wvjeA4FdYVFxeYgCpB2suv4dLFK/a3+aa/CErWEe6I
 dErWF8Nd4gwWy7W3qR2MRW1nZc+OPMvWv+jWmC0YqbCwhOjFCjWNDIXmJrSazibazvMC
 aJ241jLGD3VVKZkQ46Z68UK8+k6aRpxlUM6oh3brU6p1zoLhbL280VXY3o1Zsp6BTFiV
 WQJBkru1o6Ig0mAVHSDX2f5xfS5b1/uemBtSkTrW9HncEJxhxjWyULrL5rJWL2WaExh7
 jo7lgsj59NlnhO6qYm/3sI9oIDMESmMSJG6Tc8/HaT3uSg+X0GbeZYvPKaMGBxF4shsT
 QEGw==
X-Gm-Message-State: AOAM533mpHzHjC/dKc9tEqxWaY08R1PgdDblKN8Ra5+O+HvKEXxtqkuJ
 R8sNCPkxBge74lLx4pa6OSTUgQ==
X-Google-Smtp-Source: ABdhPJzAjjzA6zKZ0LzuSBwarhjN+Kc2YYfhvv4EFoVHW53bpNwlQdMXNmPYHLdTOvXTpseMGnv7JA==
X-Received: by 2002:a17:90b:1201:b0:1c9:ec7a:7f5c with SMTP id
 gl1-20020a17090b120100b001c9ec7a7f5cmr13345048pjb.101.1648838339427; 
 Fri, 01 Apr 2022 11:38:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 o14-20020a056a0015ce00b004fab49cd65csm3699896pfu.205.2022.04.01.11.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 11:38:58 -0700 (PDT)
Date: Fri, 01 Apr 2022 11:38:58 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Apr 2022 11:38:57 PDT (-0700)
Subject: Re: [PATCH v11 0/8] RISC-V CPU Idle Support
In-Reply-To: <CAL_JsqJm7kz1LTrTBMB3rd-K48e2584v6Nn3LwmnLzH8rk_D2w@mail.gmail.com>
CC: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, ulf.hansson@linaro.org,
 rjw@rjwysocki.net, 
 pavel@ucw.cz, milun.tripathy@gmail.com, atishp@atishpatra.org,
 Alistair Francis <Alistair.Francis@wdc.com>, liush@allwinnertech.com,
 anup@brainfault.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh+dt@kernel.org
Message-ID: <mhng-dda0f137-102d-480e-a67c-34eb713a24b1@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_113900_997061_5FFDF362 
X-CRM114-Status: GOOD (  32.52  )
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

On Fri, 01 Apr 2022 11:13:32 PDT (-0700), robh+dt@kernel.org wrote:
> On Wed, Mar 30, 2022 at 7:16 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 09 Feb 2022 21:49:39 PST (-0800), apatel@ventanamicro.com wrote:
>> > From: Anup Patel <anup.patel@wdc.com>
>> >
>> > This series adds RISC-V CPU Idle support using SBI HSM suspend function.
>> > The RISC-V SBI CPU idle driver added by this series is highly inspired
>> > from the ARM PSCI CPU idle driver.
>> >
>> > At high-level, this series includes the following changes:
>> > 1) Preparatory arch/riscv patches (Patches 1 to 3)
>> > 2) Defines for RISC-V SBI HSM suspend (Patch 4)
>> > 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
>> >    and ARM PSCI CPU idle driver (Patch 5)
>> > 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
>> >
>> > These patches can be found in riscv_sbi_hsm_suspend_v11 branch of
>> > https://github.com/avpatel/linux.git
>> >
>> > Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
>> > support in all above projects (RISC-V SBI specification, OpenSBI, and
>> > Linux RISC-V).
>> >
>> > Changes since v10:
>> >  - Rebased on Linux-5.17-rc3
>> >  - Typo fix in commit description of PATCH6
>> >
>> > Changes since v9:
>> >  - Rebased on Linux-5.17-rc1
>> >
>> > Changes since v8:
>> >  - Rebased on Linux-5.15-rc5
>> >  - Fixed DT schema check errors in PATCH7
>> >
>> > Changes since v7:
>> >  - Rebased on Linux-5.15-rc3
>> >  - Renamed cpuidle-sbi.c to cpuidle-riscv-sbi.c in PATCH6
>> >
>> > Changes since v6:
>> >  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
>> >
>> > Changes since v5:
>> >  - Rebased on Linux-5.13-rc5
>> >  - Removed unnecessary exports from PATCH5
>> >  - Removed stray ";" from PATCH5
>> >  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
>> >    in PATCH6
>> >
>> > Changes since v4:
>> >  - Rebased on Linux-5.13-rc2
>> >  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
>> >  - Added MAINTAINERS file entry for dt_idle_genpd
>> >
>> > Changes since v3:
>> >  - Rebased on Linux-5.13-rc2
>> >  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
>> >  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
>> >    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
>> >
>> > Changes since v2:
>> >  - Rebased on Linux-5.12-rc3
>> >  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
>> >    idle states
>> >  - Added "additionalProperties = false" for both idle-states node and
>> >    child nodes in PATCH7
>> >
>> > Changes since v1:
>> >  - Fixex minor typo in PATCH1
>> >  - Use just "idle-states" as DT node name for CPU idle states
>> >  - Added documentation for "cpu-idle-states" DT property in
>> >    devicetree/bindings/riscv/cpus.yaml
>> >  - Added documentation for "riscv,sbi-suspend-param" DT property in
>> >    devicetree/bindings/riscv/idle-states.yaml
>> >
>> > Anup Patel (8):
>> >   RISC-V: Enable CPU_IDLE drivers
>> >   RISC-V: Rename relocate() and make it global
>> >   RISC-V: Add arch functions for non-retentive suspend entry/exit
>> >   RISC-V: Add SBI HSM suspend related defines
>> >   cpuidle: Factor-out power domain related code from PSCI domain driver
>> >   cpuidle: Add RISC-V SBI CPU idle driver
>> >   dt-bindings: Add common bindings for ARM and RISC-V idle states
>> >   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
>> >
>> >  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
>> >  .../devicetree/bindings/arm/psci.yaml         |   2 +-
>> >  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
>> >  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
>> >  MAINTAINERS                                   |  14 +
>> >  arch/riscv/Kconfig                            |   7 +
>> >  arch/riscv/Kconfig.socs                       |   3 +
>> >  arch/riscv/configs/defconfig                  |   2 +
>> >  arch/riscv/configs/rv32_defconfig             |   2 +
>> >  arch/riscv/include/asm/asm.h                  |  27 +
>> >  arch/riscv/include/asm/cpuidle.h              |  24 +
>> >  arch/riscv/include/asm/sbi.h                  |  27 +-
>> >  arch/riscv/include/asm/suspend.h              |  36 +
>> >  arch/riscv/kernel/Makefile                    |   2 +
>> >  arch/riscv/kernel/asm-offsets.c               |   3 +
>> >  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
>> >  arch/riscv/kernel/head.S                      |  28 +-
>> >  arch/riscv/kernel/process.c                   |   3 +-
>> >  arch/riscv/kernel/suspend.c                   |  87 +++
>> >  arch/riscv/kernel/suspend_entry.S             | 124 ++++
>> >  arch/riscv/kvm/vcpu_sbi_hsm.c                 |   4 +-
>> >  drivers/cpuidle/Kconfig                       |   9 +
>> >  drivers/cpuidle/Kconfig.arm                   |   1 +
>> >  drivers/cpuidle/Kconfig.riscv                 |  15 +
>> >  drivers/cpuidle/Makefile                      |   5 +
>> >  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
>> >  drivers/cpuidle/cpuidle-psci.h                |  15 +-
>> >  drivers/cpuidle/cpuidle-riscv-sbi.c           | 627 ++++++++++++++++++
>> >  drivers/cpuidle/dt_idle_genpd.c               | 178 +++++
>> >  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>> >  30 files changed, 1484 insertions(+), 187 deletions(-)
>> >  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
>> >  create mode 100644 arch/riscv/include/asm/cpuidle.h
>> >  create mode 100644 arch/riscv/include/asm/suspend.h
>> >  create mode 100644 arch/riscv/kernel/suspend.c
>> >  create mode 100644 arch/riscv/kernel/suspend_entry.S
>> >  create mode 100644 drivers/cpuidle/Kconfig.riscv
>> >  create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
>> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
>> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.h
>>
>> Thanks, these are on for-next.
>
> For 5.18? You are not supposed to put new material into linux-next
> during the merge window.

Ya, I was aiming for these for 5.18 -- I know it's late, but I'd been 
trying to chase folks around for reviews and figured it was good enough.  
I just sent Linus a PR, it's not merged yet so if this is a problem I 
can re-spin it now.

Sorry!

>
> In any case, this now cause warnings on 'cpu-idle-states':
>
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu@0: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu@1: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu@100: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/cpu/idle-states.example.dtb:
> cpu@101: cpu-idle-states:0: [1, 2, 3, 4] is too long
> From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/cpus.yaml
>
> See commit 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
> for how to fix.
>
> Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
