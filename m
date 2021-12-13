Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955FFC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Bsic6gVNcyfCt/sN25OCbPxRdqfbnYJbaavRfw8U1o=; b=UkOHAFpSNAMcJ4
	WVfy9UNKMWH3bwBajd/8GLdJVQ5XZABi8gJMkM1eDta1pdLeYSlHiYI+7/f4NmxsSYSoQk1wPKxYj
	4J1MGZQolNUb2uL6brjSoGcZutpQs9o8lKtTzUXfd2jB5RbimKdkjCgg9LGXw+0yjCZbYEBqOLvyu
	PEmr04ggkw6ZPXQX+i1VSZrOJ5ozV+Hdhvyxnymqvd4zlm4LaNUlZpWNsmmlzkM8hcF+M9Rrav98Y
	I+XBFA4ODsXZlUWIUrbDnxyodRcFLyIkePUm31jXhIh25sYdDnPwzqT3JlZZ4/EKsOMywxM25pXP6
	axW0HKDzwhPt1hLKpIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwklX-009YRq-JC; Mon, 13 Dec 2021 12:49:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwklU-009YPq-Ir
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 12:49:14 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso10854210wmh.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iO5vzlIer6fDLM0na/dQ5p5rFP8hEKcj8s5Xpjl6kgY=;
 b=1ZTTzXKH5Xq/6YAoxUA5Kc2BVqvi5x9kyiglHTiwHaKtzCjDFkO7M9lK8bk6atQBJ+
 mI4tnIZpWnIWJuoQSIuWgPlcnk85SiA9UMlOqgnpqNSpIl1Mp9Y+4og2J9cozSxm66hE
 pQO99cPml2YaizauvbEb0oq5FEAYAK8mm9UxWoDL2LQ1VRdrTd6bN+VsWt/T0ud2psaU
 3bP5GQzLiyJ7xGV4OSwo22T6XZ3V5UaE2S6f5seM2kzS6VYO2u7Z9BZvw2y6Nd4Avvtv
 RfPK/R2XtzFsI/Xo7i4UDvTPP6lH+4xGtalynCxhcv8ahJ0vxTfMbHY2uk5lifJ4a3cw
 fxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iO5vzlIer6fDLM0na/dQ5p5rFP8hEKcj8s5Xpjl6kgY=;
 b=KjiWZy1rhvfcZ+E9i5QnctEzzcJZm7JF2ECF9bTZAWuwwtZj5672VdB0NvB342IHwA
 6THajnbg/LoLmvMLkPukoVi8kMO46lQfiITv7RsCJf7t7MKy0w/9hqI6CyXIQ09CRdol
 CAkjld5wItc+sMyo1pYcLWcSfHk4KP6L57CFesAbPJeY4ZaFhQlKzlSePkUyzDS74hpF
 vXKMtFS92zJC4Y72qDhbFe1pATvULcDqNzjV7EoEsqcfTWSnUTiT7MWQds5ICpAWqw6V
 JZrRFkgmfGiU5ic1z6bN4bzmtelR2zqg0QAoYMDLzpf0XBcyYJTOdTP6koe/zpbxZneO
 EwLg==
X-Gm-Message-State: AOAM532CNBm/FWrNN6sDSbW3NyHdmSyf4wR7El5YYI71ryZlRYsBgywi
 lJR+ggeYDI44zfEyxYZ8CWmt/0wxuY3P5Z3jWbByzQ==
X-Google-Smtp-Source: ABdhPJw3LIWsqBsi9zA/gDWa8zURWNMqpMgPLjxX8qetHHIkurbkUF1StBBOKu/1WzjQfQfXd3TbSK1gUlnB9QAZhKY=
X-Received: by 2002:a7b:c256:: with SMTP id b22mr37111462wmj.176.1639399750405; 
 Mon, 13 Dec 2021 04:49:10 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-2-atishp@atishpatra.org>
In-Reply-To: <20211204002038.113653-2-atishp@atishpatra.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 18:18:59 +0530
Message-ID: <CAAhSdy2YsrGSk4P41hneNkJJg6je9fMYV9-py6vim=ZEexigOQ@mail.gmail.com>
Subject: Re: [RFC 1/6] RISC-V: Avoid using per cpu array for ordered booting
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_044912_635129_A0E5442B 
X-CRM114-Status: GOOD (  25.25  )
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

On Sat, Dec 4, 2021 at 5:50 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atishp@rivosinc.com>
>
> Currently both order booting and spinwait approach uses a per cpu
> array to update stack & task pointer. This approach will not work for the
> following cases.
> 1. If NR_CPUs are configured to be less than highest hart id.
> 2. A platform has sparse hartid.
>
> This issue can be fixed for ordered booting as the booting cpu brings up
> one cpu at a time using SBI HSM extension which has opaque parameter
> that is unused until now.
>
> Introduce a common secondary boot data structure that can store the stack
> and task pointer. Secondary harts will use this data while booting up
> to setup the sp & tp.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpu_ops_sbi.h | 28 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpu_ops_sbi.c      | 23 ++++++++++++++++++++---
>  arch/riscv/kernel/head.S             | 19 ++++++++++---------
>  3 files changed, 58 insertions(+), 12 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h
>
> diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
> new file mode 100644
> index 000000000000..ccb9a6d30486
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpu_ops_sbi.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 by Rivos Inc.
> + */
> +#ifndef __ASM_CPU_OPS_SBI_H
> +#define __ASM_CPU_OPS_SBI_H
> +
> +#ifndef __ASSEMBLY__
> +#include <linux/init.h>
> +#include <linux/sched.h>
> +#include <linux/threads.h>
> +
> +/**
> + * struct sbi_hart_boot_data - Hart specific boot used during booting and
> + *                            cpu hotplug.
> + * @task_ptr: A pointer to the hart specific tp
> + * @stack_ptr: A pointer to the hart specific sp
> + */
> +struct sbi_hart_boot_data {
> +       void *task_ptr;
> +       void *stack_ptr;
> +};
> +#endif
> +
> +#define SBI_HART_BOOT_TASK_PTR_OFFSET (0x00)
> +#define SBI_HART_BOOT_STACK_PTR_OFFSET RISCV_SZPTR

Don't manually create these defines instead generate this
defines at compile time by adding entries in kernel/asm-offsets.c

> +
> +#endif /* ifndef __ASM_CPU_OPS_H */
> diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> index 685fae72b7f5..2e7a9dd9c2a7 100644
> --- a/arch/riscv/kernel/cpu_ops_sbi.c
> +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> @@ -7,13 +7,22 @@
>
>  #include <linux/init.h>
>  #include <linux/mm.h>
> +#include <linux/sched/task_stack.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/cpu_ops_sbi.h>
>  #include <asm/sbi.h>
>  #include <asm/smp.h>
>
>  extern char secondary_start_sbi[];
>  const struct cpu_operations cpu_ops_sbi;
>
> +/*
> + * Ordered booting via HSM brings one cpu at a time. However, cpu hotplug can
> + * be invoked from multiple threads in paralle. Define a per cpu data
> + * to handle that.
> + */
> +DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
> +
>  static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
>                               unsigned long priv)
>  {
> @@ -58,9 +67,17 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
>         int rc;
>         unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
>         int hartid = cpuid_to_hartid_map(cpuid);
> -
> -       cpu_update_secondary_bootdata(cpuid, tidle);
> -       rc = sbi_hsm_hart_start(hartid, boot_addr, 0);
> +       unsigned long hsm_data;
> +       struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
> +
> +       /* Make sure tidle is updated */
> +       smp_mb();
> +       bdata->task_ptr = tidle;
> +       bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
> +       /* Make sure boot data is updated */
> +       smp_mb();
> +       hsm_data = __pa(bdata);
> +       rc = sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
>
>         return rc;
>  }
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index f52f01ecbeea..40d4c625513c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -11,6 +11,7 @@
>  #include <asm/page.h>
>  #include <asm/pgtable.h>
>  #include <asm/csr.h>
> +#include <asm/cpu_ops_sbi.h>
>  #include <asm/hwcap.h>
>  #include <asm/image.h>
>  #include "efi-header.S"
> @@ -167,15 +168,15 @@ secondary_start_sbi:
>         la a3, .Lsecondary_park
>         csrw CSR_TVEC, a3
>
> -       slli a3, a0, LGREG
> -       la a4, __cpu_up_stack_pointer
> -       XIP_FIXUP_OFFSET a4
> -       la a5, __cpu_up_task_pointer
> -       XIP_FIXUP_OFFSET a5
> -       add a4, a3, a4
> -       add a5, a3, a5
> -       REG_L sp, (a4)
> -       REG_L tp, (a5)
> +       /* a0 contains the hartid & a1 contains boot data */
> +       li a2, SBI_HART_BOOT_TASK_PTR_OFFSET
> +       XIP_FIXUP_OFFSET a2
> +       add a2, a2, a1
> +       REG_L tp, (a2)
> +       li a3, SBI_HART_BOOT_STACK_PTR_OFFSET
> +       XIP_FIXUP_OFFSET a3
> +       add a3, a3, a1
> +       REG_L sp, (a3)
>
>         .global secondary_start_common
>  secondary_start_common:
> --
> 2.33.1
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
