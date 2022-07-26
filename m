Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81385C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 08:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwPUvNAmtOV5goEk9LBDJ6MwDV8bLN3chtqQlaDryL4=; b=s5UnovZDgdZI5b
	bxxUJCnm/drRn63yr201myjQbQ4i43pLwC1rJNKfYM/MhIQ28cwdCDOxERyFZTUshlLcOURysw4L2
	Zvd2W9sWRVSBwkhuW5XvDGjS5IN+p//J/ubiROAsXo3j4sza43gyR4jIMiiOG07TuEmzZNzSbElVD
	dz/NvoYzm8CUsIOUT/gffXd68/0JC2nM1BWp90GA8atRXuKz82UP1IZ1Ysx35llawrPSChwv9lmXs
	4MtmIvb1It8pYWkRd7GBx7hfpBAzuvrIeRxXng8rfrMgF1XrBZQkp316DyMuVD5GoWrWk7ARfrEjd
	/PaKPezhB7bJS5D81HTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFey-009x0o-JR; Tue, 26 Jul 2022 08:11:20 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFe4-009w9O-2c
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 08:10:26 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-31f443e276fso16239037b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 01:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jjVH0LRyKsPLAGZ03a5O8AhToHuTUcLbwfDz1yPqOlk=;
        b=Q2WlV6127P/FIOpihtg6o0xC4U+5rRSXWqL1vzxx4Drh2clcpSe2yUYqwLu5jvdo5r
         CETG3PLjA1jE+5G7lhpK14GzuQPMBAnfq2LqywzHSKVXttzxhew1Pd5+UiA/ayY6esYn
         q0qEeq9x2eDFPN4YybeG+PVedlkDQWHAWuYaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jjVH0LRyKsPLAGZ03a5O8AhToHuTUcLbwfDz1yPqOlk=;
        b=KYq3mLfEZKEsR19AINuE9b+UmqApI3ipOEuwPrjAgimb5wX0w+LxDIH2N+1XICtVa0
         s/awU2eJgHRM161oQJ4CDJfQUHaN6xARuudNSlEMNh9/t84QYK9W9avDoF4Vf8k1Jgme
         IOnYwyEsK/q1B7S//M37soyjTZeGH7j0f3VDaHnypCp63IGOPHNRcJLTctBwyznhpzZ3
         KuuURsZ3XszwCdi1dVUwWW4i1AyzsC7S54ztARGiZZBFp0VZfJcQ79bY4Bs3oblg1Kmu
         b2KMaqPlR4/KZX2AYnnZ9d+q1luLjZIBLR+lec/JZ6W63N4hdvhDM3j10UBIf2uWsxza
         IM2Q==
X-Gm-Message-State: AJIora+kUf2FFpu8fdZJETHIi+Vc0vKfpGU8YuqDaQDIm+oxX8eh8zmT
	/hritxingy28ufi9Fu5YdSdPJJo1ZajR3Q44iDJv
X-Google-Smtp-Source: AGRyM1uTheeiEPbmY+0HDoT9HYdyHDQf8+Qa8e9tyMEDk1B07jnrOuaPJSd0uddg9beWSG6SzO+cZHW/2cgBq6oF2rs=
X-Received: by 2002:a0d:f0c7:0:b0:31e:e814:e7d6 with SMTP id
 z190-20020a0df0c7000000b0031ee814e7d6mr9561147ywe.340.1658823021050; Tue, 26
 Jul 2022 01:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220715175155.3567243-1-mail@conchuod.ie> <20220715175155.3567243-2-mail@conchuod.ie>
In-Reply-To: <20220715175155.3567243-2-mail@conchuod.ie>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 01:10:10 -0700
Message-ID: <CAOnJCULXZ1DXXsY=s+eMhqvmdwHvnurHT-Ozhq6UDd5AX0hHsA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: topology: move store_cpu_topology() to
 shared code
To: Conor Dooley <mail@conchuod.ie>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Zong Li <zong.li@sifive.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jonas Hahnfeld <hahnjo@hahnjo.de>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Heiko Stuebner <heiko@sntech.de>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Rob Herring <robh@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brice Goglin <Brice.Goglin@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_011024_465636_71472A3D 
X-CRM114-Status: GOOD (  27.54  )
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

On Fri, Jul 15, 2022 at 10:53 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> arm64's method of defining a default cpu topology requires only minimal
> changes to apply to RISC-V also. The current arm64 implementation exits
> early in a uniprocessor configuration by reading MPIDR & claiming that
> uniprocessor can rely on the default values.
>
> This is appears to be a hangover from prior to '3102bc0e6ac7 ("arm64:
> topology: Stop using MPIDR for topology information")', because the
> current code just assigns default values for multiprocessor systems.
>
> With the MPIDR references removed, store_cpu_topolgy() can be moved to
> the common arch_topology code.
>
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm64/kernel/topology.c | 40 ------------------------------------
>  drivers/base/arch_topology.c | 19 +++++++++++++++++
>  2 files changed, 19 insertions(+), 40 deletions(-)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 869ffc4d4484..7889a00f5487 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -22,46 +22,6 @@
>  #include <asm/cputype.h>
>  #include <asm/topology.h>
>
> -void store_cpu_topology(unsigned int cpuid)
> -{
> -       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> -       u64 mpidr;
> -
> -       if (cpuid_topo->package_id != -1)
> -               goto topology_populated;
> -
> -       mpidr = read_cpuid_mpidr();
> -
> -       /* Uniprocessor systems can rely on default topology values */
> -       if (mpidr & MPIDR_UP_BITMASK)
> -               return;
> -
> -       /*
> -        * This would be the place to create cpu topology based on MPIDR.
> -        *
> -        * However, it cannot be trusted to depict the actual topology; some
> -        * pieces of the architecture enforce an artificial cap on Aff0 values
> -        * (e.g. GICv3's ICC_SGI1R_EL1 limits it to 15), leading to an
> -        * artificial cycling of Aff1, Aff2 and Aff3 values. IOW, these end up
> -        * having absolutely no relationship to the actual underlying system
> -        * topology, and cannot be reasonably used as core / package ID.
> -        *
> -        * If the MT bit is set, Aff0 *could* be used to define a thread ID, but
> -        * we still wouldn't be able to obtain a sane core ID. This means we
> -        * need to entirely ignore MPIDR for any topology deduction.
> -        */
> -       cpuid_topo->thread_id  = -1;
> -       cpuid_topo->core_id    = cpuid;
> -       cpuid_topo->package_id = cpu_to_node(cpuid);
> -
> -       pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
> -                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> -                cpuid_topo->thread_id, mpidr);
> -
> -topology_populated:
> -       update_siblings_masks(cpuid);
> -}
> -
>  #ifdef CONFIG_ACPI
>  static bool __init acpi_cpu_is_threaded(int cpu)
>  {
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 0424b59b695e..0e2c6b30dd69 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -841,4 +841,23 @@ void __init init_cpu_topology(void)
>                 return;
>         }
>  }
> +
> +void store_cpu_topology(unsigned int cpuid)
> +{
> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
> +
> +       if (cpuid_topo->package_id != -1)
> +               goto topology_populated;
> +
> +       cpuid_topo->thread_id = -1;
> +       cpuid_topo->core_id = cpuid;
> +       cpuid_topo->package_id = cpu_to_node(cpuid);
> +
> +       pr_debug("CPU%u: package %d core %d thread %d\n",
> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
> +                cpuid_topo->thread_id);
> +
> +topology_populated:
> +       update_siblings_masks(cpuid);
> +}
>  #endif
> --
> 2.37.1
>

LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>



--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
