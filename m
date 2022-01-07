Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FD9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ast055ZC/nVT5hQ7yIr3qCpnW1XSvzsqXAizF3DVVR4=; b=G+dzggn63tsALE
	C5mOwrP42L5z52zHFIa/L/Dt4voW9jlttzSUVntv1a11BLrmlUbt7bE0rSeRlP7mrMDb4PuAg2VS+
	IhpV9Ch3HS+jK7sbj/pSdaBJQT6Fo4p33jO0j9HfTP50gZVk9ITD7T75Xj3prH5wGOyz+8XqqTmzD
	H99k8Yq6cXWT7kp2eoQTIonv9mTIACnB8zXTfIwom1AnqzqLhUCefkwtEyQNM6EZapOFAW0jNtsGe
	sdLY2eFe05nZZPByfNzaCIF90OAZrOFLDOinZP2fFO+eiwqMyBf0TrjCPVib1buiHGDMet3bqYvkH
	mOMGEH92eudA+G2026OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qvg-004QJm-HW; Fri, 07 Jan 2022 15:13:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qvc-004QHm-VU
 for linux-riscv@lists.infradead.org; Fri, 07 Jan 2022 15:13:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id o3so11595550wrh.10
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jan 2022 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wRWXVVqeT2yMH9OFKjUKf879QdNlFXMuI2vDxLIhIrA=;
 b=VXk4WCQGziswu+VM2czJLmhqnzBpA8E4s5qdkyYPo91024Y5scQ0OB9NGgDWEZtkuL
 D5oictgbbCeLbWt5UlFvCBx662C9Dk/D+dPlewJ+xvDsbxmopmXeFikqEuYjujQ5pyMQ
 C9U4QQFEvqtPdNP32D6CsPONvcKTZa5ofgT4OcuBlCevakTQm4VL+yvtYB8J/9ZNQCO4
 LDgBS5A2ElHT6qZ9c3cv2zzc3joN27n9H63si+C3dPDGW+aTmuf6f+YsZDRU8z4K0BVI
 4b7ZMQVBywqnJ03QmLZzZ9+ryg3gAiDEY6n0BbyDWPUxePDBwdsxX4lJrA8t6o70Wz/s
 77eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wRWXVVqeT2yMH9OFKjUKf879QdNlFXMuI2vDxLIhIrA=;
 b=YvXNYOxOlKidj0YLn3/AI441POvd3UMk2Nc6Gy1cnr+CgPezJqZDTRL53Om7pGQEb3
 XZVE8AqfimvIgRzx7t+sCDQI0CX4Tpw4rtmpMa9Ot6T/YZuX3qym7vFONclx8vzTxGxo
 xRsHDOQmmoYtbbmnpeQwn99g1ahMJfJyQMjRCRqlMvK7haYJvPccsqEp+ZN2nHhpm0SP
 5c19hkj8q4hG65g0YmEvKUwvr9/7JceK5GArbcgKDEXQKgDaGGP0gYi0bwY+kzVW5hzh
 6Ue5F80tGInhcJ6w30VSv1W4zbGK2qqnqA55xby5GiJmx4A2qsEURsCsbSsrtCPQ8DL3
 IYog==
X-Gm-Message-State: AOAM533B6VU+6S0jNvhijibnsrwntF9vfhQL1P9WeJvx8agLGrNQYwru
 mEFRA/TuJK7DV1hv4owIPWHCvEvAgq0Ucenf1gJfAg==
X-Google-Smtp-Source: ABdhPJwub4Q3b54YQN6p3Bd75DoQbiRyO2WpWifkKFp5sCPoF/b8OV7ao9Za0hJKKOg4cnWb1f2uc0Ov5eCtAVDkn40=
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr54351490wrd.346.1641568394655; 
 Fri, 07 Jan 2022 07:13:14 -0800 (PST)
MIME-Version: 1.0
References: <20211228223057.2772727-1-atishp@rivosinc.com>
 <20211228223057.2772727-2-atishp@rivosinc.com>
In-Reply-To: <20211228223057.2772727-2-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Jan 2022 20:43:02 +0530
Message-ID: <CAAhSdy0S_uJR7jueEpvwMzt4k6yqh4_pS5qdBwyCTjeNwuLPDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] RISC-V: Avoid using per cpu array for ordered
 booting
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
X-CRM114-CacheID: sfid-20220107_071317_154209_A35E2E6F 
X-CRM114-Status: GOOD (  26.19  )
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

On Wed, Dec 29, 2021 at 4:01 AM Atish Patra <atishp@atishpatra.org> wrote:
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
>  arch/riscv/include/asm/cpu_ops_sbi.h | 25 +++++++++++++++++++++++++
>  arch/riscv/kernel/asm-offsets.c      |  3 +++
>  arch/riscv/kernel/cpu_ops_sbi.c      | 23 ++++++++++++++++++++---
>  arch/riscv/kernel/head.S             | 19 ++++++++++---------
>  4 files changed, 58 insertions(+), 12 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h
>
> diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
> new file mode 100644
> index 000000000000..90e2219f5eec
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpu_ops_sbi.h
> @@ -0,0 +1,25 @@
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
> +#endif /* ifndef __ASM_CPU_OPS_H */

s/__ASM_CPU_OPS_H /__ASM_CPU_OPS_SBI_H/

> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 253126e4beef..df0519a64eaf 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -12,6 +12,7 @@
>  #include <asm/kvm_host.h>
>  #include <asm/thread_info.h>
>  #include <asm/ptrace.h>
> +#include <asm/cpu_ops_sbi.h>
>
>  void asm_offsets(void);
>
> @@ -468,4 +469,6 @@ void asm_offsets(void)
>         DEFINE(PT_SIZE_ON_STACK, ALIGN(sizeof(struct pt_regs), STACK_ALIGN));
>
>         OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
> +       OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
> +       OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
>  }
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

s/paralle/parallel/

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

No need for the rc variable here.

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

Apart from minor nits above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
