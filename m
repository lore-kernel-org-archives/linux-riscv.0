Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F095C32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G48wH9W9YIvAPLZLSXYF+SebRplcNdCX+9Mj5b1aiWY=; b=rz6I4SyG1ksB5z
	pZUPOyWNXAQeRC+AnTgBQdYkbg7CbmPeI6kjsS57ZVBQ1vqOQo6/Mde/N3H0sbgRoYm3IJFCmY2Na
	G1aZrMDNUVy8ocI5JRuR6r8D14FObiJ86hegpCwUm3JBlbPR/4yspXiT4JE8djgqSvHV0/YnMaqb2
	wHx+ABl6LWXYzc8GS/ZsoebiH6xxa37cCsGahoDxvin8OFB4/OmWAaHENU4L6HvUGXA8WBo0KbjRO
	joZlXbxs8okW2vuuf7KvCk8+QNH5Ac1OG4SZnAcuf37WG8n8Xqt8n3kbGsHGuVHeGWbn+Df+j5eqw
	wNm1tND7RIjYuU3ADpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayD6-00BAit-F7; Wed, 21 Sep 2022 11:48:12 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayD3-00BAhJ-MZ
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 11:48:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id k10so8756124lfm.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/bkvkg6Y/dOHYzJXqWmZEeA+K66PQILGYp9YS1M0cwc=;
        b=D+kbMAIHUt/hAXJQ6YNcDB6QBMkRX0C8kmsmq3Zi7dg+BbSNqXSYABQsDRRaLoSn5l
         kCYvIKo7l4keR2NYazOrzeSfULco6eGEf+lmP7fiddz/byTQQbqX4vheOUm0TOFGwrPx
         HEjnlRmZGm2MeOv4/OjZNgwRihWw7TMJ6vqqRS0cqHujjc+r+RyPOgh6mxwDXxGEy5bZ
         qSvp5AropTw3Ibh8WO/8UurNMMQgjYFjBWJIUYrS8oIQ7VK8MTSJBfyCKcJ0zR1yZKn9
         3oj4Tv5qKdLeeOPbpTeBYvlE7JSv22TjcmYkRKTH3JDHR7xOIzi8mPUUKk54zpAnoQWW
         Xkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/bkvkg6Y/dOHYzJXqWmZEeA+K66PQILGYp9YS1M0cwc=;
        b=wq5GqETcKQcjNhbmCL0qg4Wn4YVmwWWBbFT85qRpltr2VMk2s+ir7u3SqJ7MOhtH74
         PvfOt2N4Db/5/1GW5SDYzu+B0dkC0Mbm0kzUMjcscboohyP1NRVl7bvywQ+N4hY4vIJ8
         5DyGvB1xLG+xNIy+De5QegJNXICUQaPxMIWi2WCFGm0vE9xjqTP7NUVj9HvXLgIaE6Mf
         KTTsjyGljcT9Op1StIqpWpDO4B1kFmuiML2dzJigc7JGQmY+KxGlHBK9WYrH9IQQf3N8
         yLtg/MgXvV3exT5afFdV6lr0a+SD0zBK/RmZCm2DwBoBMxL9h5IfdjR1LkMKhxST2+PD
         6vwQ==
X-Gm-Message-State: ACrzQf3rsas9bI/hUgDVX+inAMYrH6gviykkvoNbaoNbY9G202Zoj7JO
	xdIjr3feiHwgQcT64aBXdHMT2HCb/3MWW/2W+e09WA==
X-Google-Smtp-Source: AMsMyM4kPRwu7Whg21VqI/2ELsxh4kcFhn3kO6akAghoUVhGsD9+JwZdbUmGbgo1xU0h3C55Xlj95l76mF+xYgafF50=
X-Received: by 2002:a05:6512:a86:b0:499:f794:5cc2 with SMTP id
 m6-20020a0565120a8600b00499f7945cc2mr9323922lfu.100.1663760885551; Wed, 21
 Sep 2022 04:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220903161309.32848-1-apatel@ventanamicro.com>
In-Reply-To: <20220903161309.32848-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 Sep 2022 17:17:54 +0530
Message-ID: <CAK9=C2WxjFD27HhqCWEtyZSXFrwsqpWjqvU1HFwN5pAnbc0zmg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] RISC-V IPI Improvements
To: Marc Zyngier <maz@kernel.org>
Cc: Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_044809_767967_B3E4A0D7 
X-CRM114-Status: GOOD (  23.47  )
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

On Sat, Sep 3, 2022 at 9:43 PM Anup Patel <apatel@ventanamicro.com> wrote:
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
>  2) Linux RISC-V SWI support
>
> These patches can also be found in riscv_ipi_imp_v9 branch at:
> https://github.com/avpatel/linux.git
>
> Changes since v8:
>  - Rebased on Linux-6.0-rc3
>  - Use dummy percpu data as parameter for request_percpu_irq() in PATCH4.
>
> Changes since v7:
>  - Rebased on Linux-6.0-rc1
>  - Use atomic operations to track per-CPU pending and enabled IPIs in PATCH3.
>    (Note: this is inspired from IPI muxing implemented in
>     drivers/irqchip/irq-apple-aic.c)
>  - Made "struct ipi_mux_ops" (added by PATCH3) flexible so that
>    drivers/irqchip/irq-apple-aic.c can adopt it in future.
>
> Changes since v6:
>  - Rebased on Linux-5.19-rc7
>  - Added documentation for struct ipi_mux_ops in PATCH3
>  - Dropped dummy irq_mask()/unmask() in PATCH3
>  - Added const for "ipi_mux_chip" in PATCH3
>  - Removed "type" initialization from ipi_mux_domain_alloc() in PATCH3
>  - Dropped translate() from "ipi_mux_domain_ops" in PATCH3
>  - Improved barrier documentation in ipi_mux_process() of PATCH3
>  - Added percpu check in ipi_mux_create() for parent_virq of PATCH3
>  - Added nr_ipi parameter in ipi_mux_create() of PATCH3
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

Friendly, ping ?

Regards,
Anup

>
>  arch/riscv/Kconfig                |   2 +
>  arch/riscv/include/asm/irq.h      |   4 +
>  arch/riscv/include/asm/sbi.h      |   7 +
>  arch/riscv/include/asm/smp.h      |  49 ++++--
>  arch/riscv/kernel/Makefile        |   1 +
>  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
>  arch/riscv/kernel/irq.c           |  21 ++-
>  arch/riscv/kernel/sbi-ipi.c       |  60 ++++++++
>  arch/riscv/kernel/sbi.c           |  11 --
>  arch/riscv/kernel/smp.c           | 166 ++++++++++----------
>  arch/riscv/kernel/smpboot.c       |   5 +-
>  arch/riscv/mm/cacheflush.c        |   5 +-
>  arch/riscv/mm/tlbflush.c          |  93 ++++++++++--
>  drivers/clocksource/timer-clint.c |  42 +++--
>  drivers/irqchip/irq-riscv-intc.c  |  60 ++++----
>  include/linux/irq.h               |  18 +++
>  kernel/irq/Kconfig                |   5 +
>  kernel/irq/Makefile               |   1 +
>  kernel/irq/ipi-mux.c              | 244 ++++++++++++++++++++++++++++++
>  19 files changed, 630 insertions(+), 167 deletions(-)
>  create mode 100644 arch/riscv/kernel/sbi-ipi.c
>  create mode 100644 kernel/irq/ipi-mux.c
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
