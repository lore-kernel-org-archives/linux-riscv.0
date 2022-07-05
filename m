Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66123C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XD1YTvOGdZ+JYLy3aC2cmIm4HlUni2oCkm9vFULR92E=; b=N2IBmUY7q9Y/Tg
	nZjYjNp/2HcdLGmANuNxKXT5en7hk3fvGpmV0GEgLP15qBmarqIBBFkClyqOvPFI5vbsnEIUbwRq4
	ADNeNUZiFJQZLf0GMW4sE0a+o6A7PwAFLCUrWmWYdUDheIF+FI1bkPBN5BHa+qY9qiBn6ZPlOFFR0
	V7Nm7N+42Iz0ctcoq+pxJhvLi97y8Vb98Uw7HlU0OeWsYKqAcKNfcU5o3J8/PhJyJC+7OQZPnw0XG
	KCLLJx/tCEKz+khqR9ck32Q/86lyaNiOc1ffEbeLf4EyScwLo5rvTQTMUaAyejpLeLZIx/QP4H+c2
	3Gsell3P96Q+XGi6UyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8bcj-00EqcP-HG; Tue, 05 Jul 2022 06:01:25 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8bcg-00EqYy-Gb
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 06:01:24 +0000
Received: by mail-lj1-x235.google.com with SMTP id u14so13254139ljh.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Jul 2022 23:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mO1q+AWOSmLKTy8jFw+7zUucWH/oMAIflCU4/IXPUEQ=;
        b=nydiw4CsMIXOqQF0Q0V7VG9j5KEtagzaxVeGzpQx5ZnwqPEenxq2dLenDT/yQWGkek
         RdN81TPW7gNccq3WGqvyCo6cfsGsJDWl+1jDYGH6ZMCU9b/QW1ePa927WeMVHwARTTZp
         SOxazPY0DnnCmGmTIYPYB4a4g0VYpaoYBXaJhvBC5R3Lu1E6/qhkWHVpZHbvITwp7lHP
         DGUQDb6+h2qkU3IU3+mxkmle+ID7HzGRGpR+hLmn1jQmggxSqTV3oh/rEeTkZpCyu2QN
         LxrDu+XcMaRT7oGo2vttmEiAIKWZzcyWQyz+rbnQJfyM6G7Wd89jKefqs6bVkYmILaaq
         wXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mO1q+AWOSmLKTy8jFw+7zUucWH/oMAIflCU4/IXPUEQ=;
        b=h5hvTCcpX++NSEfsfScTMz+y9eoCu3FsJoTIC/66cNsIqOuwE6UuM1O8Q2ctC5HRch
         lhnSgIABw3iSRHE6AenvZpRrleGOOAv9ugZf+wDuwYIkQmFJYuE4Gu8eKRnpN3ItWREv
         hHTxlE+Sj4o2FoRUCzW3zDOqUJC2E9WyCrcgkVABzFiFlPWuFf9kN7sMWWGk4oBphAgL
         GFSn8MiLRBUTDBenTi43VmO3nAtjK9NjPRbXg0x9kadx99OZHYXW7isTjHqz+BHebgRE
         7PsRkPMdmIfDfNGa0FDt4iKYHKgU9CUiaNd3QbzrKYRZ5CZiZtCzZw0sWE+4jN9VcCi/
         BNKQ==
X-Gm-Message-State: AJIora9Zod5Xb1IBdCyAUsQOwchrZ3pEUVNwxWJUsJcXPNTzhnWKMffN
	8i9lLBKM9RVm+fZ454CKhVt7/x9rtycW7t8IQbU7Sg==
X-Google-Smtp-Source: AGRyM1sXsXu70dFHDJMygyKu5nMBdFdft7e+/mqDfFUNTdkdr/Bvx1qGPyCW17qsE4pgNzTfuWe3aNAZHrbToYA4x44=
X-Received: by 2002:a05:651c:12cb:b0:25b:fa3f:c3f with SMTP id
 11-20020a05651c12cb00b0025bfa3f0c3fmr15115234lje.364.1657000878771; Mon, 04
 Jul 2022 23:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220418105305.1196665-1-apatel@ventanamicro.com>
In-Reply-To: <20220418105305.1196665-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 5 Jul 2022 11:31:07 +0530
Message-ID: <CAK9=C2VQPm=pLSRM_k+8MFGdfriNmP+PLgQtCHvUuRJDN77ZMg@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] RISC-V IPI Improvements
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_230122_597609_A11119EE 
X-CRM114-Status: GOOD (  21.63  )
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

Hi Marc and Thomas,

Just a friendly ping ...

On Mon, Apr 18, 2022 at 4:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series aims to improve IPI support in Linux RISC-V in following ways:
>  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
>     specific hooks. This also makes Linux RISC-V IPI support aligned with
>     other architectures.
>  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
>     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
>     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
>     IPIs without any assistance from M-mode runtime firmware.
>
> These patches were originally part of the "Linux RISC-V ACLINT Support"
> series but this now a separate series so that it can be merged independently
> of the "Linux RISC-V ACLINT Support" series.
> (Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)
>
> These patches are also a preparatory patches for the up-coming:
>  1) Linux RISC-V AIA support
>  2) KVM RISC-V TLB flush improvements
>  3) Linux RISC-V SWI support
>
> These patches can also be found in riscv_ipi_imp_v6 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v5:
>  - Rebased on Linux-5.18-rc3
>  - Used kernel doc style in PATCH3
>  - Removed redundant loop in ipi_mux_process() of PATCH3
>  - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
>  - Removed use of "this patch" in PATCH3 commit description
>  - Addressed few other nit comments in PATCH3
>
> Changes since v4:
>  - Rebased on Linux-5.17
>  - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI
>
> Changes since v3:
>  - Rebased on Linux-5.17-rc6
>  - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
>  - Simplified riscv_intc_hwnode() in PATCH2
>
> Changes since v2:
>  - Rebased on Linux-5.17-rc4
>  - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
>    a function which allows drivers to directly discover INTC fwnode
>
> Changes since v1:
>  - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2
>
> Anup Patel (7):
>   RISC-V: Clear SIP bit only when using SBI IPI operations
>   irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
>   genirq: Add mechanism to multiplex a single HW IPI
>   RISC-V: Treat IPIs as normal Linux IRQs
>   RISC-V: Allow marking IPIs as suitable for remote FENCEs
>   RISC-V: Use IPIs for remote TLB flush when possible
>   RISC-V: Use IPIs for remote icache flush when possible

Any further comments on this series ?

Regards,
Anup

>
>  arch/riscv/Kconfig                |   2 +
>  arch/riscv/include/asm/irq.h      |   4 +
>  arch/riscv/include/asm/sbi.h      |   2 +
>  arch/riscv/include/asm/smp.h      |  49 +++++---
>  arch/riscv/kernel/Makefile        |   1 +
>  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
>  arch/riscv/kernel/irq.c           |  21 +++-
>  arch/riscv/kernel/sbi-ipi.c       |  60 +++++++++
>  arch/riscv/kernel/sbi.c           |  11 --
>  arch/riscv/kernel/smp.c           | 164 +++++++++++++------------
>  arch/riscv/kernel/smpboot.c       |   5 +-
>  arch/riscv/mm/cacheflush.c        |   5 +-
>  arch/riscv/mm/tlbflush.c          |  93 +++++++++++---
>  drivers/clocksource/timer-clint.c |  41 +++++--
>  drivers/irqchip/irq-riscv-intc.c  |  60 ++++-----
>  include/linux/irq.h               |  11 ++
>  kernel/irq/Kconfig                |   4 +
>  kernel/irq/Makefile               |   1 +
>  kernel/irq/ipi-mux.c              | 197 ++++++++++++++++++++++++++++++
>  19 files changed, 567 insertions(+), 167 deletions(-)
>  create mode 100644 arch/riscv/kernel/sbi-ipi.c
>  create mode 100644 kernel/irq/ipi-mux.c
>
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
