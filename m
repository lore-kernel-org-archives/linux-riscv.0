Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DC3C38159
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 03:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DfkRT75Uwd88iQWIuj5mMaA/qySL97k1yK6XqNx7KzE=; b=42edRbEO5Moqg3
	gzOpuvWxnBZ7sNIjqSjdjEgljZB88exLAQoyb+rCP1hLt56Sl8DGQm+BoARNLtwLwjkWoqIoiRoM3
	3TIoXuMbewV9AjOI6n6hASJPM5zPhn41sj5jwRTlRtadD0arQvT9noUYduanjC5NcU4G5iiBI95E6
	tuLJdhGegy6gLJsa4NKNe0PC97oBQbTqj6JNZOVPIRU+5PRdoryZJzCCI+ZaDmru8WXNztYsFoJws
	n4ZFHcL7dfd5LGvfBnwfQmoz3WdW8UVnlhi75HzNIsEtgnszFM/12R/7VGEmvMESpIvwH4asPyHy+
	ruhkfGbQkS/m8g+Nk0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIi6R-008EGE-Fs; Fri, 20 Jan 2023 03:30:07 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIi6N-008EE8-1E
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 03:30:05 +0000
Received: by mail-vs1-xe33.google.com with SMTP id j185so4348933vsc.13
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 19:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qIGU2jk/GigaohMZTY2F1GZI3REwpBY06mdsjtIY06Y=;
        b=HhgKOWYz1ZH126ecEwD4r8yCCChAWLnn1ip/V9xWYSeyvC9BOiJgmWSGe+1Q5D7rFU
         379NYtgdEU3obGAaSooGfjGcOHA/W6Lst+ul5lMjsgspgXX0vb8xbEm4R7/C7jEGhCzA
         iWq9PA62+o21vQgzIU+YsLIRBghiUjNv1ONbRaC4qrHjKJovaXdBG2PGTLHV9p/J0Jd9
         l6JJe6WIushSkbgxER0+6A8Uw9hLJv3Oaad7dFC8+htg30KYI2MbQejrWKNUsL4N47qa
         OhHHsFfYFxYEWsq99kVQ5Ahidn5AtgjHaB/tWki/VrEHRU92gFaAHYT2akt9updo0pMu
         ePyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIGU2jk/GigaohMZTY2F1GZI3REwpBY06mdsjtIY06Y=;
        b=zIxoHUo/fLcbB8nwjldUECnHiX4KCCHAo0J5ccoXaf1yT3BvkzwJYz8lSGoWA+D26q
         obfp/VQgpV3pj+MNkPp+jeL+byYIkShnrI8bVqDyveEHOCz3OoPCT3Qth4DZU2P9TlMg
         Tywz7JqsJWKVI8p9WJwQHAWBCa0JGXJtkIrBAjaz89W5SSYHQTXNFjok/fo+IvZr/s+O
         6oQQc7eluWOPtY3dXft0Ov7mVREpKnbgVwwC5nFEyF6dhV3zUHB2OOGSSwNAcYyLuOtv
         sYmArzh+CRbagM9OM7FVSE7ZsKZvHUXPHTlSpAJZwRBelbLRNSdhcyUPSrxbXSQhRswX
         9alQ==
X-Gm-Message-State: AFqh2koPSoVB2mRpKhhClsfXvgAh3bDOuYLDf1kvHoNSX48Uei4uSaTH
	xJP5rDzcb19KSHOaDu0hGxyIcdBE4FNUjlW6xX83NQ==
X-Google-Smtp-Source: AMrXdXvFh3VWQxO8K5J7n+k5TUU3i7BK7pE2i+nYu9NC5R5iI5zRmfRM0xCXQkjJjhGh4PSUM6MgE7LltvBJ3RXS7dA=
X-Received: by 2002:a67:f506:0:b0:3d3:c767:4570 with SMTP id
 u6-20020a67f506000000b003d3c7674570mr2027595vsn.85.1674185399975; Thu, 19 Jan
 2023 19:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20230103141221.772261-1-apatel@ventanamicro.com> <CAK9=C2X+BOVxvjkP=SHYywkFxh+4BnAbZ5_uH6rNJ_vB8_3mkg@mail.gmail.com>
In-Reply-To: <CAK9=C2X+BOVxvjkP=SHYywkFxh+4BnAbZ5_uH6rNJ_vB8_3mkg@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Jan 2023 08:59:47 +0530
Message-ID: <CAK9=C2Wwb2UwF=xs0gZ381e8HgCqHKEb0YepMAvYJuO2=zkhSg@mail.gmail.com>
Subject: Re: [PATCH v16 0/9] RISC-V IPI Improvements
To: Marc Zyngier <maz@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_193003_126206_C8A4BC05 
X-CRM114-Status: GOOD (  32.73  )
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

Hi Marc,

On Thu, Jan 12, 2023 at 5:47 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Hi Marc,
>
> On Tue, Jan 3, 2023 at 7:42 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > This series aims to improve IPI support in Linux RISC-V in following ways:
> >  1) Treat IPIs as normal per-CPU interrupts instead of having custom RISC-V
> >     specific hooks. This also makes Linux RISC-V IPI support aligned with
> >     other architectures.
> >  2) Remote TLB flushes and icache flushes should prefer local IPIs instead
> >     of SBI calls whenever we have specialized hardware (such as RISC-V AIA
> >     IMSIC and RISC-V SWI) which allows S-mode software to directly inject
> >     IPIs without any assistance from M-mode runtime firmware.
> >
> > These patches were originally part of the "Linux RISC-V ACLINT Support"
> > series but this now a separate series so that it can be merged independently
> > of the "Linux RISC-V ACLINT Support" series.
> > (Refer, https://lore.kernel.org/lkml/20211007123632.697666-1-anup.patel@wdc.com/)
> >
> > These patches are also a preparatory patches for the up-coming:
> >  1) Linux RISC-V AIA support
> >  2) Linux RISC-V SWI support
> >
> > These patches can also be found in riscv_ipi_imp_v16 branch at:
> > https://github.com/avpatel/linux.git
> >
> > Changes since v15:
> >  - Rebased on Linux-6.2-rc2
> >  - Added Reviewed-by and Tested-by tags to some of the patches.
> >
> > Changes since v14:
> >  - Minor fixes in commit description of PATCH3 (as suggested by tglx)
> >  - Don't disable parent IPI when CPU goes offline for SBI IPI driver and
> >    CLINT driver in PATCH4.
> >  - Include Apple AIC driver changes from Marc Z as PATCH9
> >
> > Changes since v13:
> >  - Included changes suggested by Marc Z in PATCH3
> >  - Use chained handlers in PATCH4
> >  - Added new PATCH8 to have empty irq_eoi() in RISC-V INTC driver. This
> >    avoids the unnecessary mask/unmask dance at time of handling interrupts.
> >
> > Changes since v12:
> >  - Rebased on Linux-6.1-rc7
> >  - Bring-back the IPI optimization in ipi_mux_send_mask() for PATCH3
> >  - Call ipi_mux_send() for one target CPU at a time in PATCH3
> >
> > Changes since v11:
> >  - Removed ipi_mux_pre/post_handle() callbacks in PATCH3
> >  - Removed sturct ipi_mux_ops in PATCH3
> >  - Removed parent_virq and data pointer from everywhere in PATCH3
> >  - Removed struct ipi_mux_control in PATCH3
> >  - Improved function signature of ipi_mux_send() callback in PATCH3
> >  - Used unsigned type with atomic operation in PATCH3
> >
> > Changes since v10:
> >  - Rebased on Linux-6.1-rc5
> >  - Drop the "!(pending & ibit)" check in ipi_mux_send_mask() of PATCH3
> >  - Disable local interrupts in ipi_mux_send_mask() of PATCH3 because we
> >    can be preempted while using a per-CPU temporary variable.
> >
> > Changes since v9:
> >  - Rebased on Linux-6.1-rc3
> >  - Updated header comment block of ipi-mux.c in PATCH3
> >  - Use a struct for global data of ipi-mux.c in PATCH3
> >  - Add per-CPU temp cpumask for sending IPIs in PATCH3
> >  - Drop the use of fwspec in PATCH3
> >  - Use static key for ipi_mux_pre_handle() and ipi_mux_post_handle()
> >    in PATCH3
> >  - Remove redundant pr_warn_ratelimited() called by ipi_mux_process()
> >    in PATCH3
> >  - Remove CPUHP thingy from ipi_mux_create() in PATCH3
> >
> > Changes since v8:
> >  - Rebased on Linux-6.0-rc3
> >  - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.
> >
> > Changes since v7:
> >  - Rebased on Linux-6.0-rc1
> >  - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
> >    (Note: this is inspired from IPI muxing implemented in
> >     drivers/irqchip/irq-apple-aic.c)
> >  - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
> >    drivers/irqchip/irq-apple-aic.c can adopt it in future.
> >
> > Changes since v6:
> >  - Rebased on Linux-5.19-rc7
> >  - Added documentation for struct ipi_mux_ops in PATCH3
> >  - Dropped dummy irq_mask()/unmask() in PATCH3
> >  - Added const for "ipi_mux_chip" in PATCH3
> >  - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
> >  - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
> >  - Improved barrier documentation in ipi_mux_process() of PATCH3
> >  - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
> >  - Added nr_ipi parameter in ipi_mux_create() of PATCH3
> >
> > Changes since v5:
> >  - Rebased on Linux-5.18-rc3
> >  - Used kernel doc style in PATCH3
> >  - Removed redundant loop in ipi_mux_process() of PATCH3
> >  - Removed "RISC-V" prefix form ipi_mux_chip.name of PATCH3
> >  - Removed use of "this patch" in PATCH3 commit description
> >  - Addressed few other nit comments in PATCH3
> >
> > Changes since v4:
> >  - Rebased on Linux-5.17
> >  - Includes new PATCH3 which adds mechanism to multiplex a single HW IPI
> >
> > Changes since v3:
> >  - Rebased on Linux-5.17-rc6
> >  - Updated PATCH2 to not export riscv_set_intc_hwnode_fn()
> >  - Simplified riscv_intc_hwnode() in PATCH2
> >
> > Changes since v2:
> >  - Rebased on Linux-5.17-rc4
> >  - Updated PATCH2 to not create synthetic INTC fwnode and instead provide
> >    a function which allows drivers to directly discover INTC fwnode
> >
> > Changes since v1:
> >  - Use synthetic fwnode for INTC instead of irq_set_default_host() in PATCH2
> >
> > Anup Patel (8):
> >   RISC-V: Clear SIP bit only when using SBI IPI operations
> >   irqchip/riscv-intc: Allow drivers to directly discover INTC hwnode
> >   genirq: Add mechanism to multiplex a single HW IPI
> >   RISC-V: Treat IPIs as normal Linux IRQs
> >   RISC-V: Allow marking IPIs as suitable for remote FENCEs
> >   RISC-V: Use IPIs for remote TLB flush when possible
> >   RISC-V: Use IPIs for remote icache flush when possible
> >   irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
> >
> > Marc Zyngier (1):
> >   irqchip/apple-aic: Move over to core ipi-mux
> >
> >  arch/riscv/Kconfig                |   2 +
> >  arch/riscv/include/asm/irq.h      |   4 +
> >  arch/riscv/include/asm/sbi.h      |   9 +-
> >  arch/riscv/include/asm/smp.h      |  49 +++++--
> >  arch/riscv/kernel/Makefile        |   1 +
> >  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
> >  arch/riscv/kernel/irq.c           |  21 ++-
> >  arch/riscv/kernel/sbi-ipi.c       |  77 +++++++++++
> >  arch/riscv/kernel/sbi.c           | 100 +++------------
> >  arch/riscv/kernel/smp.c           | 171 ++++++++++++------------
> >  arch/riscv/kernel/smpboot.c       |   5 +-
> >  arch/riscv/mm/cacheflush.c        |   5 +-
> >  arch/riscv/mm/tlbflush.c          |  93 +++++++++++---
> >  drivers/clocksource/timer-clint.c |  65 +++++++---
> >  drivers/irqchip/Kconfig           |   2 +
> >  drivers/irqchip/irq-apple-aic.c   | 161 ++---------------------
> >  drivers/irqchip/irq-riscv-intc.c  |  71 ++++++----
> >  include/linux/irq.h               |   3 +
> >  kernel/irq/Kconfig                |   5 +
> >  kernel/irq/Makefile               |   1 +
> >  kernel/irq/ipi-mux.c              | 207 ++++++++++++++++++++++++++++++
> >  21 files changed, 654 insertions(+), 401 deletions(-)
> >  create mode 100644 arch/riscv/kernel/sbi-ipi.c
> >  create mode 100644 kernel/irq/ipi-mux.c
> >
> > --
> > 2.34.1
> >
>
> Friendly ping ?

Any further comments on this series ?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
