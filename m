Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD158C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM3SqppZgZ3D766I2vxizyipbFvitykRNFbc18QuKps=; b=yd6+7dRMDOxDbL
	Pp8cpb4sudmlSDMOZKrAdC/mYdefe8p+hMiCWj0CQyB1/q0eBQWwj5P2ROERHbsigUeVAFiuYnwxr
	1dtv9ArXS/XSBzIFi1O+/A0hjA12ZfBuSAT6KqGdEUYA+nWrZAlRqvBxJJpQjSLPrvE+/xWDvepU2
	5CSD9rdpgKMosZhIKzyIJqVfJIiLetieGvsgNl8p/tDsmDu8cHWVQWiLwWRBxQSRubSe5hEKYdIhg
	TetopvSIZruQtyeieEjEnw1Urfh05aDJ8eesJv2AsnBtMzTgdxsAbBvvJsESCPWEC0ZI/QAp7+JrI
	npIvMkIPHVZJ6wV5sTmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFsX-00A8R8-54; Tue, 26 Jul 2022 08:25:21 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFsG-00A8DY-Bo
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 08:25:06 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-31e7ca45091so134570997b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Jul 2022 01:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u20KlUAmw1kDfZJYPrtgWu0maTb4gYVBZ+IbRF1JvEE=;
        b=mt0xWT9AaEmPRaO9nj0ITVI3ErFd3h7ew6KYgFqujT/YEWTewblOLAD5bpd/2wnkWS
         1LmJNJZTi2ZpbO61MEVpsUVMuQ9y5AQEdQZjQCaMyXex7alUGtxRdsZh+TRaMKtbczBC
         r20L1q+eE/xyq4J+JMG4HGkpO2JWBoi+AkliI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u20KlUAmw1kDfZJYPrtgWu0maTb4gYVBZ+IbRF1JvEE=;
        b=YwLd7w/YGZwS1QbtP9tG6CjaY6wf8HvLdwpQWQXW72S95/oJIF/2whnh4NK2O1pI1q
         M2qjEpg9ZbCZvl+vbfbJg3nkscLIU/9xjDFS4P5KHDdzwOtGOhgCJ+ANcDMymVe9nfq9
         up3BUQ1vpbOroXIsrJ8lDoMDSxxGIcNg6zGEwaDHstAwXUpSft3ExvSwiQ87Y4l3CeE2
         uTunxS8p7kHKhzhaBwu4awCkGuSrS/2jDwWuW/T8JOMoX8/ZNcFXP9J7Ur6IiMl2Yjia
         i4oiKSrYglop++EJkDS6eWZKTdnhceqFpAO93yhqQn7jWovLJRrUKDO/WyPRZGydoerw
         ERMA==
X-Gm-Message-State: AJIora8l4Qz8wRyTmO9P2wNK0+BYRCvnEQYqvUynul9UzKfzC40Y/O90
	U/JM6yfxCB8gg7Up2sFRrtTQT7GQ59Qnclo/d7Q6
X-Google-Smtp-Source: AGRyM1u5aIwACT1nstyxr3rIFFS4rT25rmUqxDVLJlgqKvpU+mYyCXdwhhmbjTMWnum3s80jeaI1rEteNWRMjzykZz4=
X-Received: by 2002:a81:1e95:0:b0:31f:3665:6ed0 with SMTP id
 e143-20020a811e95000000b0031f36656ed0mr4484057ywe.400.1658823903339; Tue, 26
 Jul 2022 01:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220715175155.3567243-1-mail@conchuod.ie> <20220715175155.3567243-3-mail@conchuod.ie>
In-Reply-To: <20220715175155.3567243-3-mail@conchuod.ie>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 26 Jul 2022 01:24:52 -0700
Message-ID: <CAOnJCUKm9Hg2LCuCsrg27zr0i8_RyJcW=EDKa+OSBvJOno6_yA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: topology: fix default topology reporting
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
X-CRM114-CacheID: sfid-20220726_012504_477495_52786CA1 
X-CRM114-Status: GOOD (  21.19  )
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
> RISC-V has no sane defaults to fall back on where there is no cpu-map
> in the devicetree.
> Without sane defaults, the package, core and thread IDs are all set to
> -1. This causes user-visible inaccuracies for tools like hwloc/lstopo
> which rely on the sysfs cpu topology files to detect a system's
> topology.
>
> On a PolarFire SoC, which should have 4 harts with a thread each,
> lstopo currently reports:
>
> Machine (793MB total)
>   Package L#0
>     NUMANode L#0 (P#0 793MB)
>     Core L#0
>       L1d L#0 (32KB) + L1i L#0 (32KB) + PU L#0 (P#0)
>       L1d L#1 (32KB) + L1i L#1 (32KB) + PU L#1 (P#1)
>       L1d L#2 (32KB) + L1i L#2 (32KB) + PU L#2 (P#2)
>       L1d L#3 (32KB) + L1i L#3 (32KB) + PU L#3 (P#3)
>
> Adding calls to store_cpu_topology() in {boot,smp} hart bringup code
> results in the correct topolgy being reported:
>
> Machine (793MB total)
>   Package L#0
>     NUMANode L#0 (P#0 793MB)
>     L1d L#0 (32KB) + L1i L#0 (32KB) + Core L#0 + PU L#0 (P#0)
>     L1d L#1 (32KB) + L1i L#1 (32KB) + Core L#1 + PU L#1 (P#1)
>     L1d L#2 (32KB) + L1i L#2 (32KB) + Core L#2 + PU L#2 (P#2)
>     L1d L#3 (32KB) + L1i L#3 (32KB) + Core L#3 + PU L#3 (P#3)
>
> CC: stable@vger.kernel.org
> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
> Link: https://github.com/open-mpi/hwloc/issues/536
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/riscv/Kconfig          | 2 +-
>  arch/riscv/kernel/smpboot.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 205c1e2f539c..7ffac8818060 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -52,7 +52,7 @@ config RISCV
>         select COMMON_CLK
>         select CPU_PM if CPU_IDLE
>         select EDAC_SUPPORT
> -       select GENERIC_ARCH_TOPOLOGY if SMP
> +       select GENERIC_ARCH_TOPOLOGY
>         select GENERIC_ATOMIC64 if !64BIT
>         select GENERIC_CLOCKEVENTS_BROADCAST if SMP
>         select GENERIC_EARLY_IOREMAP
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index f1e4948a4b52..b4d5524b1077 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -49,6 +49,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         unsigned int curr_cpuid;
>
>         curr_cpuid = smp_processor_id();
> +       store_cpu_topology(curr_cpuid);
>         numa_store_cpu_info(curr_cpuid);
>         numa_add_cpu(curr_cpuid);
>
> @@ -161,9 +162,9 @@ asmlinkage __visible void smp_callin(void)
>         mmgrab(mm);
>         current->active_mm = mm;
>
> +       store_cpu_topology(curr_cpuid);
>         notify_cpu_starting(curr_cpuid);
>         numa_add_cpu(curr_cpuid);
> -       update_siblings_masks(curr_cpuid);
>         set_cpu_online(curr_cpuid, 1);
>
>         /*
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
