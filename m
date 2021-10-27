Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404A2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:08:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A3760F38
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 05:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9A3760F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2Ed5iZ/NONg31kDhy/ttKkzqnQG3MCsxcA11jQifwY=; b=xMVvQYNG7J2Ph3
	nGRrCO5kYc71/PyZsbUEf66gHxsVNZEHlTpLml53efG+T6+DIpUJgM4BV3gJN3PPzdOeZ+Q9SAVKQ
	DpUGuQK6Ffv/9aVKWAdaDjAU2uZuW58s+I33sorVIw5xpVMKbSY/XfC55P7YOR31Q44fdL99O3ECp
	EMJamyPr7RTiEKQxdCpLHuVlUm2u5ck6GWuieDnGMHksnW8Upj3qBjpyeaImKgps+rwMtp7M2JdYi
	3qvizNK5J0SoTA+q8bqxUGdqFhrSnSegPbyMExfo6qYre8nvNUykHGQRWN7vrCyf0vXGDYESmmEra
	ftYWzu8iV7vkg2Buyo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfbAr-003t0R-7M; Wed, 27 Oct 2021 05:08:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfbAo-003szR-55
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 05:08:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 131-20020a1c0489000000b0032cca9883b5so3833670wme.0
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 22:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LJS/brQNo0A+LkLN5FqqyanpOzcRmHdv/6JPXTmm6gM=;
 b=KQW2OGokYWRJVNVe36ZB7kEkTEocjz98Ek9M2mkOpbOc4YYxTnhVV/7sKKnIW80cUO
 YyAKXjFk/CtB8fBnksqjNAlTMfrDttqhv3bSdUd56wGuSmMBYjY3GY9+AH/AklQoPmT1
 s9ZGyJkE8Z+OtAvEfEj1gk8uDGdA00M82yQ13wZhQ4zk6Si8IYNs22tgD1zIj8zsDGZ/
 BPRRrGUxKNb5xgglhjIkvWnw5QSW2j/R1BVysYv2uBrBVQ5ZsG259CC0sxwGB+1hwYHj
 hiJ7VeKoRvxi2/HlqR0/CDXYeV8ZsbcxwWJqW8hGiaa8jMti1CtKmQz4PtrAHDwzBUsV
 J7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LJS/brQNo0A+LkLN5FqqyanpOzcRmHdv/6JPXTmm6gM=;
 b=E45q0cNr4TkSnzUFZK43/2LrSMDMMht/BQYBkH6BDJ0NJbfV56sEySP5HHpQYDDfeh
 MW4uG2+lSWvVFigbrAs+HF0mJwn/QbDeMPwj4XFkVEzaHkIV1YbnhpFDbfRiG+E6l+zN
 j4MRIwhJTxpgPyIgh/lNUWNIpR4q4l7nou4Q7MwmQ8zgnz2xNRpL4Yy70wRncB1rZSnv
 8zX0UU7fb6EVaBMLiO549EZtYUCTHTKNZL0UPNhkdDfCGcw0WptgrSYyGv3oIS9Q+uov
 HfMJ9FNOiwMq4fxBTlURyXaYmldQCXpEHhp1U9xJeIRAZIOVrmPEvx6Q8zJwPNLUwrsE
 aBVg==
X-Gm-Message-State: AOAM530SomJhlEVQ+06o/TcFb5+5qy+nU73Rs0sNU+Ijn+7K8uoX7JSl
 PKoVf1RUNwlKeTNCWrOWk+KsQ2p0fJMAsXAsk6nyWA==
X-Google-Smtp-Source: ABdhPJxp1Xh4ACmDZb/EIk7dzPSyZXUmE9Gh5FiHJDQ+nohMkou7rJATHrJ6+wvPDIyrWc7PROtJPYicEpMdqwv2saA=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr3286146wmc.176.1635311304078; 
 Tue, 26 Oct 2021 22:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211012095857.1314214-1-anup.patel@wdc.com>
 <mhng-63e8dc0c-278d-46e3-a617-abe1d68fcc6d@palmerdabbelt-glaptop>
In-Reply-To: <mhng-63e8dc0c-278d-46e3-a617-abe1d68fcc6d@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 27 Oct 2021 10:38:12 +0530
Message-ID: <CAAhSdy2GxKNMqwYMBU2fNn0NLMHKB2pRRvDCiidX32s39AY=_A@mail.gmail.com>
Subject: Re: [PATCH v9 0/8] RISC-V CPU Idle Support
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
 Atish Patra <Atish.Patra@wdc.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 liush <liush@allwinnertech.com>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_220826_268905_E53B9190 
X-CRM114-Status: GOOD (  34.58  )
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

On Wed, Oct 27, 2021 at 5:18 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Tue, 12 Oct 2021 02:58:49 PDT (-0700), Anup Patel wrote:
> > This series adds RISC-V CPU Idle support using SBI HSM suspend function.
>
> This all generally looks good to me, I'm just not sure what the spec
> status is.  If one of you guys says it's frozen then that's good enough
> for me, please just either point me to something where that's been
> publicly said or just post here.

Atish is following up on the SBI spec process so maybe he can provide
an update on that ?

>
> > The RISC-V SBI CPU idle driver added by this series is highly inspired
> > from the ARM PSCI CPU idle driver.
> >
> > At high-level, this series includes the following changes:
> > 1) Preparatory arch/riscv patches (Patches 1 to 3)
> > 2) Defines for RISC-V SBI HSM suspend (Patch 4)
> > 3) Preparatory patch to share code between RISC-V SBI CPU idle driver
> >    and ARM PSCI CPU idle driver (Patch 5)
> > 4) RISC-V SBI CPU idle driver and related DT bindings (Patches 6 to 7)
> >
> > These patches can be found in riscv_sbi_hsm_suspend_v9 branch at
> > https://github.com/avpatel/linux
> >
> > Special thanks Sandeep Tripathy for providing early feeback on SBI HSM
> > support in all above projects (RISC-V SBI specification, OpenSBI, and
> > Linux RISC-V).
> >
> > Changes since v8:
> >  - Rebased on Linux-5.15-rc5
> >  - Fixed DT schema check errors in PATCH7
> >
> > Changes since v7:
> >  - Rebased on Linux-5.15-rc3
> >  - Renamed cpuidle-sbi.c to cpuidle-riscv-sbi.c in PATCH6
> >
> > Changes since v6:
> >  - Fixed error reported by "make DT_CHECKER_FLAGS=-m dt_binding_check"
> >
> > Changes since v5:
> >  - Rebased on Linux-5.13-rc5
> >  - Removed unnecessary exports from PATCH5
> >  - Removed stray ";" from PATCH5
> >  - Moved sbi_cpuidle_pd_power_off() under "#ifdef CONFIG_DT_IDLE_GENPD"
> >    in PATCH6
> >
> > Changes since v4:
> >  - Rebased on Linux-5.13-rc2
> >  - Renamed all dt_idle_genpd functions to have "dt_idle_" prefix
> >  - Added MAINTAINERS file entry for dt_idle_genpd
> >
> > Changes since v3:
> >  - Rebased on Linux-5.13-rc2
> >  - Fixed __cpu_resume_enter() which was broken due to XIP kernel support
> >  - Removed "struct dt_idle_genpd_ops" abstraction which simplifies code
> >    sharing between ARM PSCI and RISC-V SBI drivers in PATCH5
> >
> > Changes since v2:
> >  - Rebased on Linux-5.12-rc3
> >  - Updated PATCH7 to add common DT bindings for both ARM and RISC-V
> >    idle states
> >  - Added "additionalProperties = false" for both idle-states node and
> >    child nodes in PATCH7
> >
> > Changes since v1:
> >  - Fixex minor typo in PATCH1
> >  - Use just "idle-states" as DT node name for CPU idle states
> >  - Added documentation for "cpu-idle-states" DT property in
> >    devicetree/bindings/riscv/cpus.yaml
> >  - Added documentation for "riscv,sbi-suspend-param" DT property in
> >    devicetree/bindings/riscv/idle-states.yaml
> >
> > Anup Patel (8):
> >   RISC-V: Enable CPU_IDLE drivers
> >   RISC-V: Rename relocate() and make it global
> >   RISC-V: Add arch functions for non-retentive suspend entry/exit
> >   RISC-V: Add SBI HSM suspend related defines
> >   cpuidle: Factor-out power domain related code from PSCI domain driver
> >   cpuidle: Add RISC-V SBI CPU idle driver
> >   dt-bindings: Add common bindings for ARM and RISC-V idle states
> >   RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt machine
> >
> >  .../bindings/arm/msm/qcom,idle-state.txt      |   2 +-
> >  .../devicetree/bindings/arm/psci.yaml         |   2 +-
> >  .../bindings/{arm => cpu}/idle-states.yaml    | 228 ++++++-
> >  .../devicetree/bindings/riscv/cpus.yaml       |   6 +
> >  MAINTAINERS                                   |  14 +
> >  arch/riscv/Kconfig                            |   7 +
> >  arch/riscv/Kconfig.socs                       |   3 +
> >  arch/riscv/configs/defconfig                  |  15 +-
> >  arch/riscv/configs/rv32_defconfig             |   8 +-
> >  arch/riscv/include/asm/asm.h                  |  17 +
> >  arch/riscv/include/asm/cpuidle.h              |  24 +
> >  arch/riscv/include/asm/sbi.h                  |  27 +-
> >  arch/riscv/include/asm/suspend.h              |  35 +
> >  arch/riscv/kernel/Makefile                    |   2 +
> >  arch/riscv/kernel/asm-offsets.c               |   3 +
> >  arch/riscv/kernel/cpu_ops_sbi.c               |   2 +-
> >  arch/riscv/kernel/head.S                      |  18 +-
> >  arch/riscv/kernel/process.c                   |   3 +-
> >  arch/riscv/kernel/suspend.c                   |  86 +++
> >  arch/riscv/kernel/suspend_entry.S             | 123 ++++
> >  drivers/cpuidle/Kconfig                       |   9 +
> >  drivers/cpuidle/Kconfig.arm                   |   1 +
> >  drivers/cpuidle/Kconfig.riscv                 |  15 +
> >  drivers/cpuidle/Makefile                      |   5 +
> >  drivers/cpuidle/cpuidle-psci-domain.c         | 138 +---
> >  drivers/cpuidle/cpuidle-psci.h                |  15 +-
> >  drivers/cpuidle/cpuidle-riscv-sbi.c           | 626 ++++++++++++++++++
> >  drivers/cpuidle/dt_idle_genpd.c               | 177 +++++
> >  drivers/cpuidle/dt_idle_genpd.h               |  50 ++
>
> Some of the patches that touch drivers/cpuidle don't have Acks from the
> subsystem maintainers.  I'm OK taking this through the RISC-V tree, but
> I'd prefer to have acks first.  I'm also fine doing something like a
> shared tag between the trees, if that's better for folks.

The patches which touch the PSCI cpuidle driver have been already
reviewed by Ulf Hansson. Also, the DT bindings have been already
reviewed by Rob Herring.

I have addressed previous comments from Rafael and I was hoping
if Rafael can review it again.

Regards,
Anup

>
> >  29 files changed, 1474 insertions(+), 187 deletions(-)
> >  rename Documentation/devicetree/bindings/{arm => cpu}/idle-states.yaml (74%)
> >  create mode 100644 arch/riscv/include/asm/cpuidle.h
> >  create mode 100644 arch/riscv/include/asm/suspend.h
> >  create mode 100644 arch/riscv/kernel/suspend.c
> >  create mode 100644 arch/riscv/kernel/suspend_entry.S
> >  create mode 100644 drivers/cpuidle/Kconfig.riscv
> >  create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.c
> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.c
> >  create mode 100644 drivers/cpuidle/dt_idle_genpd.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
