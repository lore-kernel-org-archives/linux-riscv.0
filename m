Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B70C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 06:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCb+aDpSJwAMFdXWUe14I5UVZm2YrN8QTTsBGqQ4v6g=; b=XitEPpVGlTy4Mv
	O5doFvj5JOpIEZfEKO0nHRituRi+gxmOf1uejzDGIbqfyVbWESjA9BLfpMRyqTJFUdv4Twp5TMykQ
	0aa+vNXzVXimX71+YVecp1F9E4vmrSEXnvXTyG80XOL8p7yxFX1NEVMI8q3l7dFVMjFNvrDN6w47o
	BEWy2fUuj0rGvIFdIwLJ0OdzCLBvJljdjws1oBZpoXsXGzBJCdS+LoDCTeH+9HtayPT8sxHd9ywrw
	uUT1HFJdgW26K34lYrGkjTGfOpcf/qKkRcneDSv5hrfABGSncvPXq8n/QuCpDJjq1IgWvwq3rD8i2
	e5Cmzbq+nZ5skGoWyppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHKGv-00ChgV-UZ; Tue, 08 Feb 2022 06:46:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHKGj-00Che7-Fo; Tue, 08 Feb 2022 06:46:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 234EDB81853;
 Tue,  8 Feb 2022 06:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE05EC340F9;
 Tue,  8 Feb 2022 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644302785;
 bh=2PAnZavsBCQOKNxqtrXZdWKUJUHNnqRJ7TmptXf/CRI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aZguFV60JHW+Wl0UK/7jImD5iZ2QyXQpzBt2ompSVpfx2aQhZEjUM/zO+w4OCyYjO
 Ui7QIfN2W+z7gDxc1JnzsBfKQGN5s/TidYc4jPISzyO16D28so+IP+DFawLRSyKpns
 MtBJstEnQ5981dxzm3YL8z19G7ENfBkuRCNzxN2IvUMLjf9TzEJzYjKtXmqCKZaGoc
 FfTw2C5fYhe90ThXnp9UV9mNdaSjUw/uHcSkovseC69NWwoCFUfXeZ5reXLThoqoGx
 bANovyFliDK25n3uatfa3UAFy5sf13833yXs/7YUhwTgdzfWinwP5Tis+yV2BuNVZp
 UTLCA4gjJG6bg==
Received: by mail-vs1-f52.google.com with SMTP id b2so2319621vso.9;
 Mon, 07 Feb 2022 22:46:25 -0800 (PST)
X-Gm-Message-State: AOAM532Ly+2GsQwGed+LG2C3/d0IfuOhd6S/v2HlrLGNHEIdWg8hCYIg
 NyPcXxQgfpCaXNFtXEGiYVFPlzwUk2E1tSIxO+M=
X-Google-Smtp-Source: ABdhPJwcITGI3/F3NjBB05kTSNDFumGOEbnmXBce8eySQQ05hqGWKQ34yPQabBtqVtUZuP1cB0KdFDlqpj6pHvBDoD4=
X-Received: by 2002:a67:e0d9:: with SMTP id m25mr1147574vsl.51.1644302784590; 
 Mon, 07 Feb 2022 22:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-9-apatel@ventanamicro.com>
In-Reply-To: <20220126114452.692512-9-apatel@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Feb 2022 14:46:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
Message-ID: <CAJF2gTQsSn1KBgX2bg2LiSUbCmbGD3oF5KcmK5gq2Dd49BWDBQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220207_224629_848922_E561DCE9 
X-CRM114-Status: GOOD (  18.74  )
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

Another question:

Have you put "idle-states {" in qemu's DTS? or how do you test your patches?

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
