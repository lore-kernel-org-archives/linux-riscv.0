Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB2BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jan 2022 07:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7yCsKpWpy2LVD2qVGA6emBjsqCHeSNn7Bsak5XUIOtQ=; b=b1DEk+j+Y+f8xrbBtoluZztGsi
	8ON4NnYFpPWP3N2zKaI/rpaq/IlfHzQyNU/pf5mAkMHjEYx4DRlALIDesYhS9a0Up99VmYpA3E9B+
	66b7BzacUa4+XkU5d6drWt/4phx7yFw+X91DAHCVGMYl9ZmdVJlft2y26y+4EzPJHvp/LvP1u4Alq
	xNV2kdICTpJOXYzSDKYd+RIyxC6Qg2ToFwAtI+AWPkj8aMohtuOABSMB+PCRytQ82wFbMr+vts2wl
	/46OHZ2jLJzeY62zA+NfI14RRIR5FDVGHpr1Isb0FSsuB5cO7REaTmNKkWlZfGsDthi9Xo2v4jFeH
	P7fLe+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n50xw-00E5mk-0m; Wed, 05 Jan 2022 07:44:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n50xs-00E5lJ-9K
 for linux-riscv@lists.infradead.org; Wed, 05 Jan 2022 07:44:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id s15so34494481pfk.6
 for <linux-riscv@lists.infradead.org>; Tue, 04 Jan 2022 23:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=A3wdFSkYtrxxWNdjfnKErq6n+0VkONg5lu4TYdUcr9w=;
 b=iK4QbLNs5F6X8PEry6d1n6oS2MNsS9haHDlKMjXe1hYAKGc+QwrKWkJt6Aqf37FZ4i
 y9LWjHO+s6KDrZ5Lb20GM3OryagelJOi092AuyJbPpmgJKNpaeY4g3QidbHG8GfqX5Kb
 4v9v0WEmrcD2eJ9nvt59tZ6hhFKYEdOzyv8JvV2YY7oR13APbf1Jqc05mgyC+vYeVZ0m
 cgfSZGmMYgikB2MVE3LggP+SznMFsDi2AGu7TPgQDA6Nov/32Pajd80dHR0G62AJSTxC
 BdMJiGj01PwGAj9MDNAob751j7Lso87BQikEqClezQROLLaITHwiYp9fmlekT3WL/dd/
 gwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=A3wdFSkYtrxxWNdjfnKErq6n+0VkONg5lu4TYdUcr9w=;
 b=KqScpZRHwIHUJ5+apH4yLlmgfVTLtLuMACSdx5j1a4nvI3q06QcWxrCW+A9tdeuHGs
 LHJMjmqgv87++Ef1cmvRefMzhry9wyPr8rXwMRC8MIvanuHeIDbkZLXsoTXRS3Mj1t5V
 cAxQVsaDEnljdUBTehbyG/A6D3EmsjyJI/8KJLVa3Nq94OB2cVbS78GUc8ILiyO+y4mv
 tj33HefBroTbDQMGAI/XFNeUmQISQ00NPeo2ntTE43qqHn72iBTpZ4WGZpm3YBlBz21v
 sjk2hhvj8SrvI/joRxnl1nO4L7rrUlbku1b1NarFd1c4avAEEhkL9A3PgS3zaS3Ha9rY
 3KvQ==
X-Gm-Message-State: AOAM531CT3eorlgcIi8dlUiS6e1FH0v9HWcZ6ekp3zOzD8/0W+liev9z
 75I5M1S9LhlXaT7FI2y0GGKI7dVIpZxF2wqohtbOJQ==
X-Google-Smtp-Source: ABdhPJzLjiAQBtOpCaJmj4D7q2eBy6NcpQMoUEhEjf4eD77L5Ed8O/QfkC5RenzsPAtyhbiTWyPT0pNsYRWeFXw7DoI=
X-Received: by 2002:a05:6a00:2493:b0:4bb:7b30:ead with SMTP id
 c19-20020a056a00249300b004bb7b300eadmr54835289pfv.78.1641368638440; Tue, 04
 Jan 2022 23:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-8-atishp@rivosinc.com>
 <CAKddAkCkbHLQS2XzH=+uz4gJG=ECMRZfd0P_5r48O0v0NT2yVQ@mail.gmail.com>
In-Reply-To: <CAKddAkCkbHLQS2XzH=+uz4gJG=ECMRZfd0P_5r48O0v0NT2yVQ@mail.gmail.com>
From: Eric Lin <eric.lin@sifive.com>
Date: Wed, 5 Jan 2022 15:43:46 +0800
Message-ID: <CAPqJEFp8Bss6ND1AmZRPLTJJSTSiPacvSe9y-EgLwfBwTrf8Yg@mail.gmail.com>
Subject: Re: [v5 7/9] RISC-V: Add sscofpmf extension support
To: atish.patra@wdc.com, atishp@rivosinc.com, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_234408_400691_3AD7A2FF 
X-CRM114-Status: GOOD (  39.21  )
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

Hi Atish,

>
> From: Atish Patra <atish.patra@wdc.com>
>
> The sscofpmf extension allows counter overflow and filtering for
> programmable counters. Enable the perf driver to handle the overflow
> interrupt. The overflow interrupt is a hart local interrupt.
> Thus, per cpu overflow interrupts are setup as a child under the root
> INTC irq domain.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h   |   8 +-
>  arch/riscv/include/asm/hwcap.h |   1 +
>  arch/riscv/kernel/cpufeature.c |   1 +
>  drivers/perf/riscv_pmu_sbi.c   | 218 +++++++++++++++++++++++++++++++--
>  include/linux/perf/riscv_pmu.h |   2 +
>  5 files changed, 222 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index e4d369830af4..8518eb0014bc 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -63,6 +63,7 @@
>  #define IRQ_M_TIMER            7
>  #define IRQ_S_EXT              9
>  #define IRQ_M_EXT              11
> +#define IRQ_PMU_OVF            13
>
>  /* Exception causes */
>  #define EXC_INST_MISALIGNED    0
> @@ -151,6 +152,8 @@
>  #define CSR_HPMCOUNTER30H      0xc9e
>  #define CSR_HPMCOUNTER31H      0xc9f
>
> +#define CSR_SSCOUNTOVF         0xda0
> +
>  #define CSR_SSTATUS            0x100
>  #define CSR_SIE                        0x104
>  #define CSR_STVEC              0x105
> @@ -212,7 +215,10 @@
>  # define RV_IRQ_SOFT           IRQ_S_SOFT
>  # define RV_IRQ_TIMER  IRQ_S_TIMER
>  # define RV_IRQ_EXT            IRQ_S_EXT
> -#endif /* CONFIG_RISCV_M_MODE */
> +# define RV_IRQ_PMU    IRQ_PMU_OVF
> +# define SIP_LCOFIP     (_AC(0x1, UL) << IRQ_PMU_OVF)
> +
> +#endif /* !CONFIG_RISCV_M_MODE */
>
>  /* IE/IP (Supervisor/Machine Interrupt Enable/Pending) flags */
>  #define IE_SIE         (_AC(0x1, UL) << RV_IRQ_SOFT)
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 368ab0f330c8..417e0840647a 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -50,6 +50,7 @@ extern unsigned long elf_hwcap;
>   * available logical extension id.
>   */
>  enum riscv_isa_ext_id {
> +       RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c70eeec17f5b..3eedfb9ecd48 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -71,6 +71,7 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>         }
>
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA(sscofpmf, sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>         __RISCV_ISA_EXT_DATA("", "", RISCV_ISA_EXT_MAX),
>  };
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index f078d423a89a..ff8692ac43a5 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -11,8 +11,13 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/perf/riscv_pmu.h>
>  #include <linux/platform_device.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of_irq.h>
> +#include <linux/of.h>
>
>  #include <asm/sbi.h>
> +#include <asm/hwcap.h>
>
>  union sbi_pmu_ctr_info {
>         unsigned long value;
> @@ -33,6 +38,7 @@ union sbi_pmu_ctr_info {
>   * per_cpu in case of harts with different pmu counters
>   */
>  static union sbi_pmu_ctr_info *pmu_ctr_list;
> +static unsigned int riscv_pmu_irq;
>
>  struct pmu_event_data {
>         union {
> @@ -450,33 +456,223 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>         return 0;
>  }
>
> +static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
> +{
> +       int idx = 0;
> +       struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
> +       unsigned long cmask = 0;
> +       union sbi_pmu_ctr_info *info;
> +
> +       /* We should only stop the used hardware counters */
> +       for_each_set_bit(idx, cpu_hw_evt->used_event_ctrs, RISCV_MAX_COUNTERS) {
> +               info = &pmu_ctr_list[idx];
> +               if (info->type != SBI_PMU_CTR_TYPE_FW)
> +                       cmask |= (1 << idx);
> +       }
> +       /* No need to check the error here as we can't do anything about the error */
> +       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP, 0, cmask, 0, 0, 0, 0);
> +}
> +
> +/**
> + * This function starts all the used counters in two step approach.
> + * Any counter that did not overflow can be start in a single step
> + * while the overflowed counters need to be started with updated initialization
> + * value.
> + */
> +static inline void pmu_sbi_start_overflow_mask(struct riscv_pmu *pmu,
> +                                              unsigned long ctr_ovf_mask)
> +{
> +       int idx = 0;
> +       struct cpu_hw_events *cpu_hw_evt = this_cpu_ptr(pmu->hw_events);
> +       struct perf_event *event;
> +       unsigned long flag = SBI_PMU_START_FLAG_SET_INIT_VALUE;
> +       unsigned long ctr_start_mask = 0;
> +       uint64_t max_period;
> +       struct hw_perf_event *hwc;
> +       u64 init_val = 0;
> +
> +       ctr_start_mask = cpu_hw_evt->used_event_ctrs[0] & ~ctr_ovf_mask;
> +
> +       /* Start all the counters that did not overflow in a single shot */
> +       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, 0, ctr_start_mask,
> +                 0, 0, 0, 0);
> +
> +       /* Reinitialize and start all the counter that overflowed */
> +       while (ctr_ovf_mask) {
> +               if (ctr_ovf_mask & 0x01) {
> +                       event = cpu_hw_evt->events[idx];
> +                       hwc = &event->hw;
> +                       max_period = riscv_pmu_ctr_get_width_mask(event);
> +                       init_val = local64_read(&hwc->prev_count) & max_period;
> +                       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, idx, 1,
> +                                 flag, init_val, 0, 0);
> +               }
> +               ctr_ovf_mask = ctr_ovf_mask >> 1;
> +               idx++;
> +       }
> +}
> +
> +static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
> +{
> +       struct perf_sample_data data;
> +       struct pt_regs *regs;
> +       struct hw_perf_event *hw_evt;
> +       union sbi_pmu_ctr_info *info;
> +       int lidx, hidx, fidx;
> +       struct riscv_pmu *pmu;
> +       struct perf_event *event;
> +       struct cpu_hw_events *cpu_hw_evt = dev;
> +       unsigned long overflow;
> +       unsigned long overflowed_ctrs = 0;
> +
> +       fidx = find_first_bit(cpu_hw_evt->used_event_ctrs, RISCV_MAX_COUNTERS);
> +       event = cpu_hw_evt->events[fidx];
> +       if (!event) {
> +               csr_clear(CSR_SIP, SIP_LCOFIP);
> +               return IRQ_NONE;
> +       }
> +
> +       pmu = to_riscv_pmu(event->pmu);
> +       pmu_sbi_stop_all(pmu);
> +
> +       /* Overflow status register should only be read after counter are stopped */
> +       overflow = csr_read(CSR_SSCOUNTOVF);
> +
> +       /**
> +        * Overflow interrupt pending bit should only be cleared after stopping
> +        * all the counters to avoid any race condition.
> +        */
> +       csr_clear(CSR_SIP, SIP_LCOFIP);
> +
> +       /* No overflow bit is set */
> +       if (!overflow)
> +               return IRQ_NONE;
> +
> +       regs = get_irq_regs();
> +
> +       for_each_set_bit(lidx, cpu_hw_evt->used_event_ctrs, RISCV_MAX_COUNTERS) {
> +               struct perf_event *event = cpu_hw_evt->events[lidx];
> +
> +               /* Skip if invalid event or user did not request a sampling */
> +               if (!event || !is_sampling_event(event))
> +                       continue;
> +
> +               info = &pmu_ctr_list[lidx];
> +               /* Firmware counter don't support overflow yet */
> +               if (!info || info->type == SBI_PMU_CTR_TYPE_FW)
> +                       continue;
> +
> +               /* compute hardware counter index */
> +               hidx = info->csr - CSR_CYCLE;
> +               /* check if the corresponding bit is set in sscountovf */
> +               if (!(overflow & (1 << hidx)))
> +                       continue;
> +
> +               /*
> +                * Keep a track of overflowed counters so that they can be started
> +                * with updated initial value.
> +                */
> +               overflowed_ctrs |= 1 << lidx;
> +               hw_evt = &event->hw;
> +               riscv_pmu_event_update(event);
> +               perf_sample_data_init(&data, 0, hw_evt->last_period);
> +               if (riscv_pmu_event_set_period(event)) {
> +                       /*
> +                        * Unlike other ISAs, RISC-V don't have to disable interrupts
> +                        * to avoid throttling here. As per the specification, the
> +                        * interrupt remains disabled until the OF bit is set.
> +                        * Interrupts are enabled again only during the start.
> +                        * TODO: We will need to stop the guest counters once
> +                        * virtualization support is added.
> +                        */
> +                       perf_event_overflow(event, &data, regs);
> +               }
> +       }
> +       pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
> +
> +       return IRQ_HANDLED;
> +}
> +
>  static int pmu_sbi_starting_cpu(unsigned int cpu, struct hlist_node *node)
>  {
>         struct riscv_pmu *pmu = hlist_entry_safe(node, struct riscv_pmu, node);
> +       struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
>
>         /* Enable the access for TIME csr only from the user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x2);
>
>         /* Stop all the counters so that they can be enabled from perf */
> -       sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -                 0, GENMASK_ULL(pmu->num_counters - 1, 0), 0, 0, 0, 0);
> +       pmu_sbi_stop_all(pmu);
> +
> +       if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> +               hw_events->irq = riscv_pmu_irq;

As I understand hw_events points to a per_cpu data, I think we should
use per_cpu(hw_events->irq, cpu) to store per cpu data.

Thanks.
Eric Lin

> +               csr_clear(CSR_IP, BIT(RV_IRQ_PMU));
> +               csr_set(CSR_IE, BIT(RV_IRQ_PMU));
> +               enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
> +       }
>
>         return 0;
>  }
>
>  static int pmu_sbi_dying_cpu(unsigned int cpu, struct hlist_node *node)
>  {
> +       if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> +               disable_percpu_irq(riscv_pmu_irq);
> +               csr_clear(CSR_IE, BIT(RV_IRQ_PMU));
> +       }
> +
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
>
>         return 0;
>  }
>
> +static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, struct platform_device *pdev)
> +{
> +       int ret;
> +       struct cpu_hw_events __percpu *hw_events = pmu->hw_events;
> +       struct device_node *cpu, *child;
> +       struct irq_domain *domain = NULL;
> +
> +       if (!riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return -EOPNOTSUPP;
> +
> +       for_each_of_cpu_node(cpu) {
> +               child = of_get_compatible_child(cpu, "riscv,cpu-intc");
> +               if (!child) {
> +                       pr_err("Failed to find INTC node\n");
> +                       return -ENODEV;
> +               }
> +               domain = irq_find_host(child);
> +               of_node_put(child);
> +               if (domain)
> +                       break;
> +       }
> +       if (!domain) {
> +               pr_err("Failed to find INTC IRQ root domain\n");
> +               return -ENODEV;
> +       }
> +
> +       riscv_pmu_irq = irq_create_mapping(domain, RV_IRQ_PMU);
> +       if (!riscv_pmu_irq) {
> +               pr_err("Failed to map PMU interrupt for node\n");
> +               return -ENODEV;
> +       }
> +
> +       ret = request_percpu_irq(riscv_pmu_irq, pmu_sbi_ovf_handler, "riscv-pmu", hw_events);
> +       if (ret) {
> +               pr_err("registering percpu irq failed [%d]\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int pmu_sbi_device_probe(struct platform_device *pdev)
>  {
>         struct riscv_pmu *pmu = NULL;
>         int num_counters;
> -       int ret;
> +       int ret = -ENODEV;
>
>         pr_info("SBI PMU extension is available\n");
>         /* Notify legacy implementation that SBI pmu is available*/
> @@ -488,13 +684,19 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>         num_counters = pmu_sbi_find_num_ctrs();
>         if (num_counters < 0) {
>                 pr_err("SBI PMU extension doesn't provide any counters\n");
> -               return -ENODEV;
> +               goto out_free;
>         }
>
>         /* cache all the information about counters now */
>         if (pmu_sbi_get_ctrinfo(num_counters))
> -               return -ENODEV;
> +               goto out_free;
>
> +       ret = pmu_sbi_setup_irqs(pmu, pdev);
> +       if (ret < 0) {
> +               pr_info("Perf sampling/filtering is not supported as sscof extension is not available\n");
> +               pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
> +               pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> +       }
>         pmu->num_counters = num_counters;
>         pmu->ctr_start = pmu_sbi_ctr_start;
>         pmu->ctr_stop = pmu_sbi_ctr_stop;
> @@ -515,6 +717,10 @@ static int pmu_sbi_device_probe(struct platform_device *pdev)
>         }
>
>         return 0;
> +
> +out_free:
> +       kfree(pmu);
> +       return ret;
>  }
>
>  static struct platform_driver pmu_sbi_driver = {
> @@ -544,8 +750,6 @@ static int __init pmu_sbi_devinit(void)
>         }
>
>         ret = platform_driver_register(&pmu_sbi_driver);
> -       if (ret)
> -               return ret;
>
>         pdev = platform_device_register_simple(RISCV_PMU_PDEV_NAME, -1, NULL, 0);
>         if (IS_ERR(pdev)) {
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
> index 52672de540c2..c7e2d689063a 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -29,6 +29,8 @@
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> +       /* Counter overflow interrupt */
> +       int             irq;
>         /* currently enabled events */
>         struct perf_event       *events[RISCV_MAX_COUNTERS];
>         /* currently enabled counters */
> --
> 2.33.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
