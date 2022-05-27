Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E6C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 04:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/suZDn3RcvFPTNxu6AuEv3PAXaJ9s50cIOn0Nl0JEzc=; b=B/T9s+DPHkzHDn
	PA8+YvjQbS3+4PQ1B5F2oTCReDUKl1i1yQPya6ATKQ4ODnBNS/y1T+DO2YIU+6zMm9QAYkwgJRVJ0
	/8OHTbgqB/ewls5+rg8ywOSuDNE/Wh8+V12bg1ncOKUIzdBfKpuaY54EAJqiL0K6deaetTU5nUYtX
	hWjp+L5232JckKeiyLk8s6D2FnlKL8TX9Wf5+NsTz0vZFe7G8CE109gCgWwQ7CGZX7VdRvElQQlNj
	2yzPwdiGFc92XUOq8/GGJmEcyfc9V2A3OqUcqLrY35zcZYKxqqnYXH3wpEUmgk/4c0ubeTi9Wmou+
	I08YwJWleHbavDKj5Y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRcx-00GaTr-Td; Fri, 27 May 2022 04:31:07 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRcu-00GaSL-77
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 04:31:06 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t28so2972355pga.6
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 21:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XYes1esmPya3DIZza2UVxgQVJXUPok6oc9i7IGAxizo=;
        b=NuHdmoauIFfael2DzypDrUaB29wpEPtKw/ROCTuk/nnj5UBKhJ4xlHbTG51Wn4lhzq
         RZP5hgmj3F5dj0OYbu1IpUHppLPsWWZe7dpeH3XakLGvS3v5kgiZrzPBQ7dpsoR4r0q8
         2ANi0n6PAKb5ftlK3lRUy0uj2s3kgfNw4vf7RB0J12x2QUVZGeMEXS6yB8t9Bm5Jd9OB
         w9tHjv/gl/VaNC9uNtmFcRjLFc6AOHOHdB04ByBPKRQsS+LeJVwGfwIO9Q1R0ZeaVaZR
         0SXFnbw4jqvBbxWBldphQdW9z5GpaKQgAueS0w+UdmuS13hawnNS0TqYf2YUvloLucWm
         obXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XYes1esmPya3DIZza2UVxgQVJXUPok6oc9i7IGAxizo=;
        b=5qsDB/2oxLkrQ+LrkvdfT8iW511S0JpUHz4Oi/r8+F9yHF0ADRI21uN25Dw38HZiyA
         L/TvZxnYsKz8V60zlQi12/WDPhI1trtgrWrcYOB4tEmnB6wfBDtcJtODbI4FoVzU5dhG
         vzjcHttUtGtlhvKQfWubGWjgr0y9c+AIYQilU0yTc5M88qcr12HaiOW0rH2drcq+KT2e
         xmQJhm4+xLpKDigH3uD0p8cD8ubF4HDU5+fLiYMGYCg37ZpHu5biiycuOlnq6rHlRavV
         32/VZNtLcAEJMEC/JgspRJMqVpM7otYN6plPjzq/2UshrQrZOiyyUOqsLejBeVzTJfdm
         YCbw==
X-Gm-Message-State: AOAM530g0PWCvtPbQX4dXXoDqeq3+mj7vzxPDtMG7CEorJ04lqhw5XEl
	wEg/vplKxhJn9MrLk8V3p2NTlQ==
X-Google-Smtp-Source: ABdhPJwhizjW/dU14hRf3XegG/dTVMUKoHEBKrF3ct6aOAhptm7KfdgWndSaEoBJPsBSZ9Qe+jYOlw==
X-Received: by 2002:a63:4666:0:b0:3fa:287f:b714 with SMTP id v38-20020a634666000000b003fa287fb714mr21732464pgk.398.1653625862015;
        Thu, 26 May 2022 21:31:02 -0700 (PDT)
Received: from sunil-laptop ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902bf4b00b0016392bd5060sm402240pls.142.2022.05.26.21.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:31:01 -0700 (PDT)
Date: Fri, 27 May 2022 10:00:55 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
	linux-efi <linux-efi@vger.kernel.org>,
	Sunil V L <sunil.vl@gmail.com>
Subject: Re: [PATCH V2 4/5] riscv: cpu: Support for 64bit hartid
Message-ID: <20220527043055.GA6225@sunil-laptop>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
 <20220526101131.2340729-5-sunilvl@ventanamicro.com>
 <CAOnJCU+eutRHEEgXi8od+xY+0AyWj117MDwjY-hFVO3ZDjf1bg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+eutRHEEgXi8od+xY+0AyWj117MDwjY-hFVO3ZDjf1bg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_213104_315838_64F0639D 
X-CRM114-Status: GOOD (  34.18  )
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

On Thu, May 26, 2022 at 04:10:51PM -0700, Atish Patra wrote:
> On Thu, May 26, 2022 at 3:12 AM Sunil V L <sunilvl@ventanamicro.com> wrote:
> >
> > Adds support for 64bit hartid in riscv_of_processor_hartid()
> 
> The commit text is a bit misleading as you are adding support for XLEN
> hartid. For RV32, it is still 32bit.
> This applies to the entire series.

Thanks Atish. I somehow missed mentioning RV64 in this patch. Will
update and send.

Thanks
Sunil
> 
> >   - Separate return value and status code.
> >   - Make hartid variable type as unsigned long.
> >   - Update the callers.
> >
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/processor.h |  4 ++--
> >  arch/riscv/kernel/cpu.c            | 26 +++++++++++++++-----------
> >  arch/riscv/kernel/cpufeature.c     |  6 ++++--
> >  arch/riscv/kernel/smpboot.c        |  9 +++++----
> >  drivers/clocksource/timer-riscv.c  | 15 ++++++++-------
> >  drivers/irqchip/irq-riscv-intc.c   |  7 ++++---
> >  drivers/irqchip/irq-sifive-plic.c  |  7 ++++---
> >  7 files changed, 42 insertions(+), 32 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index 0749924d9e55..99fae9398506 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -75,8 +75,8 @@ static inline void wait_for_interrupt(void)
> >  }
> >
> >  struct device_node;
> > -int riscv_of_processor_hartid(struct device_node *node);
> > -int riscv_of_parent_hartid(struct device_node *node);
> > +int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
> > +int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
> >
> >  extern void riscv_fill_hwcap(void);
> >  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index ccb617791e56..477a33b34c95 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -14,37 +14,36 @@
> >   * Returns the hart ID of the given device tree node, or -ENODEV if the node
> >   * isn't an enabled and valid RISC-V hart node.
> >   */
> > -int riscv_of_processor_hartid(struct device_node *node)
> > +int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
> >  {
> >         const char *isa;
> > -       u32 hart;
> >
> >         if (!of_device_is_compatible(node, "riscv")) {
> >                 pr_warn("Found incompatible CPU\n");
> >                 return -ENODEV;
> >         }
> >
> > -       hart = of_get_cpu_hwid(node, 0);
> > -       if (hart == ~0U) {
> > +       *hart = (unsigned long) of_get_cpu_hwid(node, 0);
> > +       if (*hart == ~0UL) {
> >                 pr_warn("Found CPU without hart ID\n");
> >                 return -ENODEV;
> >         }
> >
> >         if (!of_device_is_available(node)) {
> > -               pr_info("CPU with hartid=%d is not available\n", hart);
> > +               pr_info("CPU with hartid=%lu is not available\n", *hart);
> >                 return -ENODEV;
> >         }
> >
> >         if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -               pr_warn("CPU with hartid=%d has no \"riscv,isa\" property\n", hart);
> > +               pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
> >                 return -ENODEV;
> >         }
> >         if (isa[0] != 'r' || isa[1] != 'v') {
> > -               pr_warn("CPU with hartid=%d has an invalid ISA of \"%s\"\n", hart, isa);
> > +               pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> >                 return -ENODEV;
> >         }
> >
> > -       return hart;
> > +       return 0;
> >  }
> >
> >  /*
> > @@ -53,11 +52,16 @@ int riscv_of_processor_hartid(struct device_node *node)
> >   * To achieve this, we walk up the DT tree until we find an active
> >   * RISC-V core (HART) node and extract the cpuid from it.
> >   */
> > -int riscv_of_parent_hartid(struct device_node *node)
> > +int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
> >  {
> > +       int rc;
> > +
> >         for (; node; node = node->parent) {
> > -               if (of_device_is_compatible(node, "riscv"))
> > -                       return riscv_of_processor_hartid(node);
> > +               if (of_device_is_compatible(node, "riscv")) {
> > +                       rc = riscv_of_processor_hartid(node, hartid);
> > +                       if (!rc)
> > +                               return 0;
> > +               }
> >         }
> >
> >         return -1;
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 1b2d42d7f589..49c05bd9352d 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -67,8 +67,9 @@ void __init riscv_fill_hwcap(void)
> >         struct device_node *node;
> >         const char *isa;
> >         char print_str[NUM_ALPHA_EXTS + 1];
> > -       int i, j;
> > +       int i, j, rc;
> >         static unsigned long isa2hwcap[256] = {0};
> > +       unsigned long hartid;
> >
> >         isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
> >         isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
> > @@ -86,7 +87,8 @@ void __init riscv_fill_hwcap(void)
> >                 DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >                 const char *temp;
> >
> > -               if (riscv_of_processor_hartid(node) < 0)
> > +               rc = riscv_of_processor_hartid(node, &hartid);
> > +               if (rc < 0)
> >                         continue;
> >
> >                 if (of_property_read_string(node, "riscv,isa", &isa)) {
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 622f226454d5..4336610a19ee 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -76,15 +76,16 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
> >  void __init setup_smp(void)
> >  {
> >         struct device_node *dn;
> > -       int hart;
> > +       unsigned long hart;
> >         bool found_boot_cpu = false;
> >         int cpuid = 1;
> > +       int rc;
> >
> >         cpu_set_ops(0);
> >
> >         for_each_of_cpu_node(dn) {
> > -               hart = riscv_of_processor_hartid(dn);
> > -               if (hart < 0)
> > +               rc = riscv_of_processor_hartid(dn, &hart);
> > +               if (rc < 0)
> >                         continue;
> >
> >                 if (hart == cpuid_to_hartid_map(0)) {
> > @@ -94,7 +95,7 @@ void __init setup_smp(void)
> >                         continue;
> >                 }
> >                 if (cpuid >= NR_CPUS) {
> > -                       pr_warn("Invalid cpuid [%d] for hartid [%d]\n",
> > +                       pr_warn("Invalid cpuid [%d] for hartid [%lu]\n",
> >                                 cpuid, hart);
> >                         continue;
> >                 }
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 1767f8bf2013..55142c27f0bc 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -101,20 +101,21 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
> >
> >  static int __init riscv_timer_init_dt(struct device_node *n)
> >  {
> > -       int cpuid, hartid, error;
> > +       int cpuid, error;
> > +       unsigned long hartid;
> >         struct device_node *child;
> >         struct irq_domain *domain;
> >
> > -       hartid = riscv_of_processor_hartid(n);
> > -       if (hartid < 0) {
> > -               pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
> > +       error = riscv_of_processor_hartid(n, &hartid);
> > +       if (error < 0) {
> > +               pr_warn("Not valid hartid for node [%pOF] error = [%lu]\n",
> >                         n, hartid);
> > -               return hartid;
> > +               return error;
> >         }
> >
> >         cpuid = riscv_hartid_to_cpuid(hartid);
> >         if (cpuid < 0) {
> > -               pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
> > +               pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> >                 return cpuid;
> >         }
> >
> > @@ -140,7 +141,7 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >                 return -ENODEV;
> >         }
> >
> > -       pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
> > +       pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> >                __func__, cpuid, hartid);
> >         error = clocksource_register_hz(&riscv_clocksource, riscv_timebase);
> >         if (error) {
> > diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> > index b65bd8878d4f..499e5f81b3fe 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -95,10 +95,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
> >  static int __init riscv_intc_init(struct device_node *node,
> >                                   struct device_node *parent)
> >  {
> > -       int rc, hartid;
> > +       int rc;
> > +       unsigned long hartid;
> >
> > -       hartid = riscv_of_parent_hartid(node);
> > -       if (hartid < 0) {
> > +       rc = riscv_of_parent_hartid(node, &hartid);
> > +       if (rc < 0) {
> >                 pr_warn("unable to find hart id for %pOF\n", node);
> >                 return 0;
> >         }
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index bb87e4c3b88e..4710d9741f36 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -317,7 +317,8 @@ static int __init plic_init(struct device_node *node,
> >         for (i = 0; i < nr_contexts; i++) {
> >                 struct of_phandle_args parent;
> >                 irq_hw_number_t hwirq;
> > -               int cpu, hartid;
> > +               int cpu;
> > +               unsigned long hartid;
> >
> >                 if (of_irq_parse_one(node, i, &parent)) {
> >                         pr_err("failed to parse parent for context %d.\n", i);
> > @@ -341,8 +342,8 @@ static int __init plic_init(struct device_node *node,
> >                         continue;
> >                 }
> >
> > -               hartid = riscv_of_parent_hartid(parent.np);
> > -               if (hartid < 0) {
> > +               error = riscv_of_parent_hartid(parent.np, &hartid);
> > +               if (error < 0) {
> >                         pr_warn("failed to parse hart ID for context %d.\n", i);
> >                         continue;
> >                 }
> > --
> > 2.25.1
> >
> 
> Otherwise, it looks good.
> 
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> 
> -- 
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
