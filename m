Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED59FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 05:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVgJK+bze/J8eDfj89Q1BgY9xZgKum3OLjzpcB1Khxg=; b=ENQR+ufwX2F+o/
	pkFKbR0EpfJMOCzyEqo8i2tmaahPLBX+QhIvuL/BtHlN8nXNWK3f3HdalxcyXWTGKZRBaIUX28szt
	xv5UvaqOdw/3Ny8rFfTb9anUkP7hdeiHx8pw4FeH/OdO2I/JGUcz+u9ZmXtEb7dFfF8I9FsJ8Z/8r
	QDnP5dBo1/vVhoztnOs6RhOOgX+uyuhHvXycXzzSBNIxMbiW+dLH/aFp2K5jGLXumyOK1m5ZNpvDP
	9+Q9OSdSxNPBE8i14n3QMWFfV5omaSmSZw8usLzM7rTldwwSv1jsleVB369vYIzYUBDbCMeLNPG8Q
	IZceHVhzq/ExdpHVktdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9gxx-000KZq-AP; Tue, 18 Jan 2022 05:23:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9gxv-000KZM-3L
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 05:23:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso1601575wma.1
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 21:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HArCxtgmaAUtHv2EkJWX43r7m5jT88idzjgN10lSzvg=;
 b=FcJ24fjHTLf6zTemywoAEeEZLg6z+KppHcW/fWc6qgOGHMMNMEqHHUC5SyxgB604+e
 zbXFg3KFkIgMU1O8oiPpWkEy9/IIToAVrwuvYmilDXt5GKlTLpdbrJBs+rbuolJyZo3z
 At3TgzqbV790Mi2jwBrMmsFLUDjUvPRMGeUfKSVvIY3JGbI6WGINj8ut9Ii4b7eUaOA2
 Al9JuXkOX0B9kZIg01sX/lHbp33fBj3HrRcgIeg7S5Ve3likMCmkbw80MAzXoLJhy6m7
 YwDAofQn+PgCA+9s/w9gGcvimGfBp2TMLpBqN1pD5ENVuUEMnbC5xHomoNqMSy4jhars
 IrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HArCxtgmaAUtHv2EkJWX43r7m5jT88idzjgN10lSzvg=;
 b=M6fnAah2N5kHPhLiI9DlPJNDvv9nsFPY4jSMtxT7d0RRWp5T1rWlkTw9PLYjmRyAqw
 sllNKFrVe9X+h1BPfV9btpd0HskPs6K4cWiYwRMnxOrsj9a++NgCpbVVgekzcfkPBfO6
 2c/Z3vm+2sM5gfKRIIBXL2adarbPB7UBH5ApS0gHtfGzrxnOM0Cj5s6E/M8nG9Bz8hCo
 3Den4tx7jusQrOJt2TSytjoSlWg35sZI/+pArldszQxWe4Uh7M5PV9O8Q+juSleGmS/3
 yVeG2MoVRKwatwC9bYkNQdq0OiO3sTNaz7PPK60IyhHI1e+XTQ/6aUcNDUTIE7/g+AV7
 +tOw==
X-Gm-Message-State: AOAM532vMV5gQFfqN0fUAdcpyjfJ44wdSCqpkkvz9GZBk9QZkMq1F8fS
 Yj3vRruxuvMalyUs2NZSbOm1tpTXM9iOj/yRh7iWSQ==
X-Google-Smtp-Source: ABdhPJwVRwrzMl6GQKLqAhaaYxifwRl1R0tSpKmmp7g+cj5TnMk/du5kPQdyodgo5wPc4OgUfyMIIN9wiCdS3n/J/bM=
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr22252928wrx.346.1642483409473; 
 Mon, 17 Jan 2022 21:23:29 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-5-atishp@rivosinc.com>
In-Reply-To: <20211225054647.1750577-5-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 10:53:17 +0530
Message-ID: <CAAhSdy3RGxM5w8eQ-s0n0-__-S-GgRi98+cO89kRfAFN99a9eA@mail.gmail.com>
Subject: Re: [v5 4/9] RISC-V: Add a simple platform driver for RISC-V legacy
 perf
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_212331_180875_68F5E757 
X-CRM114-Status: GOOD (  41.08  )
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

On Sat, Dec 25, 2021 at 11:17 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> The old RISC-V perf implementation allowed counting of only
> cycle/instruction counters using perf. Restore that feature by implementing
> a simple platform driver under a separate config to provide backward
> compatibility. Any existing software stack will continue to work as it is.
> However, it provides an easy way out in future where we can remove the
> legacy driver.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/Kconfig            |  10 +++
>  drivers/perf/Makefile           |   3 +
>  drivers/perf/riscv_pmu_legacy.c | 143 ++++++++++++++++++++++++++++++++
>  include/linux/perf/riscv_pmu.h  |   6 ++
>  4 files changed, 162 insertions(+)
>  create mode 100644 drivers/perf/riscv_pmu_legacy.c
>
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 03ca0315df73..6bd12663c8d3 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -66,6 +66,16 @@ config RISCV_PMU
>           PMU functionalities in a core library so that different PMU drivers
>           can reuse it.
>
> +config RISCV_PMU_LEGACY
> +       depends on RISCV_PMU
> +       bool "RISC-V legacy PMU implementation"
> +       default y
> +       help
> +         Say y if you want to use the legacy CPU performance monitor
> +         implementation on RISC-V based systems. This only allows counting
> +         of cycle/instruction counter and doesn't support counter overflow,
> +         or programmable counters. It will be removed in future.
> +
>  config ARM_PMU_ACPI
>         depends on ARM_PMU && ACPI
>         def_bool y
> diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> index 76e5c50e24bb..e8aa666a9d28 100644
> --- a/drivers/perf/Makefile
> +++ b/drivers/perf/Makefile
> @@ -11,6 +11,9 @@ obj-$(CONFIG_HISI_PMU) += hisilicon/
>  obj-$(CONFIG_QCOM_L2_PMU)      += qcom_l2_pmu.o
>  obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
>  obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
> +ifeq ($(CONFIG_RISCV_PMU), y)
> +obj-$(CONFIG_RISCV_PMU_LEGACY) += riscv_pmu_legacy.o
> +endif

RISCV_PMU_LEGACY already depends on RISCV_PMU.

Do you still need this "ifeq ()" check ?

>  obj-$(CONFIG_THUNDERX2_PMU) += thunderx2_pmu.o
>  obj-$(CONFIG_XGENE_PMU) += xgene_pmu.o
>  obj-$(CONFIG_ARM_SPE_PMU) += arm_spe_pmu.o
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
> new file mode 100644
> index 000000000000..8bb973f2d9f7
> --- /dev/null
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISC-V performance counter support.
> + *
> + * Copyright (C) 2021 Western Digital Corporation or its affiliates.
> + *
> + * This implementation is based on old RISC-V perf and ARM perf event code
> + * which are in turn based on sparc64 and x86 code.
> + */
> +
> +#include <linux/mod_devicetable.h>
> +#include <linux/perf/riscv_pmu.h>
> +#include <linux/platform_device.h>
> +
> +#define RISCV_PMU_LEGACY_CYCLE         0
> +#define RISCV_PMU_LEGACY_INSTRET       1
> +#define RISCV_PMU_LEGACY_NUM_CTR       2
> +
> +bool pmu_init_done;

This should be a static variable.

> +
> +static int pmu_legacy_ctr_get_idx(struct perf_event *event)
> +{
> +       struct perf_event_attr *attr = &event->attr;
> +
> +       if (event->attr.type != PERF_TYPE_HARDWARE)
> +               return -EOPNOTSUPP;
> +       if (attr->config == PERF_COUNT_HW_CPU_CYCLES)
> +               return RISCV_PMU_LEGACY_CYCLE;
> +       else if (attr->config == PERF_COUNT_HW_INSTRUCTIONS)
> +               return RISCV_PMU_LEGACY_INSTRET;
> +       else
> +               return -EOPNOTSUPP;
> +}
> +
> +/* For legacy config & counter index are same */
> +static int pmu_legacy_event_map(struct perf_event *event, u64 *config)
> +{
> +       return pmu_legacy_ctr_get_idx(event);
> +}
> +
> +static u64 pmu_legacy_read_ctr(struct perf_event *event)
> +{
> +       struct hw_perf_event *hwc = &event->hw;
> +       int idx = hwc->idx;
> +       u64 val;
> +
> +       if (idx == RISCV_PMU_LEGACY_CYCLE) {
> +               val = riscv_pmu_ctr_read_csr(CSR_CYCLE);
> +               if (IS_ENABLED(CONFIG_32BIT))
> +                       val = (u64)riscv_pmu_ctr_read_csr(CSR_CYCLEH) << 32 | val;
> +       } else if (idx == RISCV_PMU_LEGACY_INSTRET) {
> +               val = riscv_pmu_ctr_read_csr(CSR_INSTRET);
> +               if (IS_ENABLED(CONFIG_32BIT))
> +                       val = ((u64)riscv_pmu_ctr_read_csr(CSR_INSTRETH)) << 32 | val;
> +       } else
> +               return 0;
> +
> +       return val;
> +}
> +
> +static void pmu_legacy_ctr_start(struct perf_event *event, u64 ival)
> +{
> +       struct hw_perf_event *hwc = &event->hw;
> +       u64 initial_val = pmu_legacy_read_ctr(event);
> +
> +       /**
> +        * The legacy method doesn't really have a start/stop method.
> +        * It also can not update the counter with a initial value.
> +        * But we still need to set the prev_count so that read() can compute
> +        * the delta. Just use the current counter value to set the prev_count.
> +        */
> +       local64_set(&hwc->prev_count, initial_val);
> +}
> +
> +/**
> + * This is just a simple implementation to allow legacy implementations
> + * compatible with new RISC-V PMU driver framework.
> + * This driver only allows reading two counters i.e CYCLE & INSTRET.
> + * However, it can not start or stop the counter. Thus, it is not very useful
> + * will be removed in future.
> + */
> +static void pmu_legacy_init(struct riscv_pmu *pmu)
> +{
> +       pr_info("Legacy PMU implementation is available\n");
> +
> +       pmu->num_counters = RISCV_PMU_LEGACY_NUM_CTR;
> +       pmu->ctr_start = pmu_legacy_ctr_start;
> +       pmu->ctr_stop = NULL;
> +       pmu->event_map = pmu_legacy_event_map;
> +       pmu->ctr_get_idx = pmu_legacy_ctr_get_idx;
> +       pmu->ctr_get_width = NULL;
> +       pmu->ctr_clear_idx = NULL;
> +       pmu->ctr_read = pmu_legacy_read_ctr;
> +
> +       perf_pmu_register(&pmu->pmu, "cpu", PERF_TYPE_RAW);
> +}
> +
> +static int pmu_legacy_device_probe(struct platform_device *pdev)
> +{
> +       struct riscv_pmu *pmu = NULL;
> +
> +       pmu = riscv_pmu_alloc();
> +       if (!pmu)
> +               return -ENOMEM;
> +       pmu_legacy_init(pmu);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver pmu_legacy_driver = {
> +       .probe          = pmu_legacy_device_probe,
> +       .driver         = {
> +               .name   = RISCV_PMU_LEGACY_PDEV_NAME,
> +       },
> +};
> +
> +static int __init riscv_pmu_legacy_devinit(void)
> +{
> +       int ret;
> +       struct platform_device *pdev;
> +
> +       if (likely(pmu_init_done))
> +               return 0;
> +
> +       ret = platform_driver_register(&pmu_legacy_driver);
> +       if (ret)
> +               return ret;
> +
> +       pdev = platform_device_register_simple(RISCV_PMU_LEGACY_PDEV_NAME, -1, NULL, 0);
> +       if (IS_ERR(pdev)) {
> +               platform_driver_unregister(&pmu_legacy_driver);
> +               return PTR_ERR(pdev);
> +       }
> +
> +       return ret;
> +}
> +late_initcall(riscv_pmu_legacy_devinit);
> +
> +void riscv_pmu_legacy_init(bool done)

I would suggest renaming riscv_pmu_legacy_init()
to riscv_pmu_legacy_skip_init().

Also, no need for "done" parameter.

> +{
> +       if (done)
> +               pmu_init_done = true;

I would also suggest renaming "pmu_init_done" to
"legacy_pmu_init_done" or something similar.

> +}
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 0d8979765d79..52672de540c2 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -22,6 +22,7 @@
>  #define RISCV_MAX_COUNTERS     64
>  #define RISCV_OP_UNSUPP                (-EOPNOTSUPP)
>  #define RISCV_PMU_PDEV_NAME    "riscv-pmu"
> +#define RISCV_PMU_LEGACY_PDEV_NAME     "riscv-pmu-legacy"
>
>  #define RISCV_PMU_STOP_FLAG_RESET 1
>
> @@ -58,6 +59,11 @@ unsigned long riscv_pmu_ctr_read_csr(unsigned long csr);
>  int riscv_pmu_event_set_period(struct perf_event *event);
>  uint64_t riscv_pmu_ctr_get_width_mask(struct perf_event *event);
>  u64 riscv_pmu_event_update(struct perf_event *event);
> +#ifdef CONFIG_RISCV_PMU_LEGACY
> +void riscv_pmu_legacy_init(bool init_done);
> +#else
> +static inline void riscv_pmu_legacy_init(bool init_done) {};
> +#endif
>  struct riscv_pmu *riscv_pmu_alloc(void);
>
>  #endif /* CONFIG_RISCV_PMU */
> --
> 2.33.1
>

Apart from minor comments above, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
