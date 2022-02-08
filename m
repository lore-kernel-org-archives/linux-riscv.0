Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2CFC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 06:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dz3cvODXJBbEYdbqlvm0zZBrmMnz0KmtCpRdVJpipT4=; b=yvzZJyGnBu6idF
	EKrx8NBSypm2mgvEZVCYgLPWw8ozhSrx2/ksNcFe/mn8Xk/RLHrXPrGTkK9oOgrlrY4paHoQxVDsK
	rsb3AGhgsLk1VmJ5VLcja/A1Y/ecQEUCyFmrRiswR8Ls+uwV6TAtgSIwMeMFlAPMG1YrtmZJ6sTMS
	8+FJo04Nanoew/LzVgit6m/g4FrRoWAhPCCsRicKHyeUHYsBVrvYU7D8LdJQnfNAlGrU/nHKyoDKX
	uy/Hc/3rNlRlQZgr1b/Fny7gXjsBJF60g7aH8OkIOhyCQPdC9wMjYRBcuWcj034FGXhlstREmEoXd
	ZYhpaBetvAqmxZae2jfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHJxb-00CeJO-SQ; Tue, 08 Feb 2022 06:26:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHJxO-00CeFP-2F; Tue, 08 Feb 2022 06:26:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DFB0615E6;
 Tue,  8 Feb 2022 06:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CC7C340F8;
 Tue,  8 Feb 2022 06:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644301588;
 bh=HIuCEKBnx2neFGe2TzYeuJVUlLTSD+WZPGwlgjCCuXU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T9v/Dz0S1HpzoAwIBZvdu5DREqs+MdQzq9y55DHTQDwk2sn3pmvKSlv+GpfgCVTvV
 WfRWeusIuQzCfT2yyD8t04yJ/s3vViOSbz0a9Z/f5ayoUux9/YwxA7AfmFvKsbIriM
 CUvjWc1SmMF2pjmXGoFdMzwGfgyxP41s59LNfmalvMXvTGHrB8IjXJaPwKpz3rODn2
 WzkmTp8eIJmPjzo4yqOJPBsA8fAyVcKPNXUBBre2JNUrieVwuelVz/VrsbrB7pXbas
 HK9f03shLil5H84Uzil62wV17maN1jN99Fs7UheuvIyLIHRiwucQDztUqSCdWPvfBR
 25twB4iSaCk5g==
Received: by mail-vk1-f179.google.com with SMTP id l14so9172830vko.12;
 Mon, 07 Feb 2022 22:26:28 -0800 (PST)
X-Gm-Message-State: AOAM532TWKxPT1iqKWLz4Z47D0n5SSqPbVi+gHlYx2PUgBlaMdUGA0DL
 MXLF+h4H9acXM6Zz0Nw0SRA5tpY6vPS06HN7Srs=
X-Google-Smtp-Source: ABdhPJzacuJptpzsvQJRUnvzBbBzr1u57gJ0wQqQFKPI58LeRRTunUkd1GGEazbj4/xQPLofWtoVqwCs4xjOKh2E+nk=
X-Received: by 2002:a05:6122:1c5:: with SMTP id h5mr1217423vko.2.1644301587245; 
 Mon, 07 Feb 2022 22:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
In-Reply-To: <20220126114452.692512-9-apatel@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Feb 2022 14:26:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRLcqQ8ZjKwWNmARtaraVW7dD5Hp5=iv+4kHYENvB2gWg@mail.gmail.com>
Message-ID: <CAJF2gTRLcqQ8ZjKwWNmARtaraVW7dD5Hp5=iv+4kHYENvB2gWg@mail.gmail.com>
Subject: Re: [PATCH v10 8/8] RISC-V: Enable RISC-V SBI CPU Idle driver for
 QEMU virt machine
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Pavel Machek <pavel@ucw.cz>, 
 Rob Herring <robh+dt@kernel.org>, Sandeep Tripathy <milun.tripathy@gmail.com>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pm@vger.kernel.org, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_222630_208962_C93222E6 
X-CRM114-Status: GOOD (  19.59  )
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

On Wed, Jan 26, 2022 at 7:51 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> We enable RISC-V SBI CPU Idle driver for QEMU virt machine to test
> SBI HSM Supend on QEMU.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/Kconfig.socs           | 3 +++
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  3 files changed, 5 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 6ec44a22278a..f4097a815201 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -36,6 +36,9 @@ config SOC_VIRT
>         select GOLDFISH
>         select RTC_DRV_GOLDFISH if RTC_CLASS
>         select SIFIVE_PLIC
> +       select PM_GENERIC_DOMAINS if PM
> +       select PM_GENERIC_DOMAINS_OF if PM && OF
> +       select RISCV_SBI_CPUIDLE if CPU_IDLE
>         help
>           This enables support for QEMU Virt Machine.
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index a5e0482a4969..b8c882b70b02 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_SIFIVE=y
>  CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_PM=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
rv32_defconfig would be removed. I think you could delete this part.
https://lore.kernel.org/linux-riscv/20220201150545.1512822-9-guoren@kernel.org/T/#u

I would Cc you in the patch, and you could track the progress.

> index d1b87db54d68..6f9a7c89bff9 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -20,6 +20,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_ARCH_RV32I=y
>  CONFIG_SMP=y
>  CONFIG_HOTPLUG_CPU=y
> +CONFIG_PM=y
>  CONFIG_CPU_IDLE=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=m
> --
> 2.25.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
