Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A96C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 06:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/V2KMjwMltMLNHlg3/4ixRocfzVOW7IVt5gLcFYKms=; b=NNjRy9ckMKfoLL
	iYl2zsDhStif+Ac+21FJe+OT1TJ66YydsX3INq/aXW8WMZ5YBD5hND0iKnOhqedZKjMF3GSa5BAgf
	hk4DK+Ev0iTX/62OjBo93Euq8GMKEKV4U8EOKFDPn17DfLa4OcJDgqrgmTxXSlteQ6NvB7aysefIk
	aez6iel/3Mk7b2MKIPggfZIu4emCQbAztokuuIgWHr8ePp3+q4AEMRb3FhcrOUPiF6iYGUN4mKN/x
	jHr0NfZa1GrbdLgMIlCEucoyB8Paz1l9yiIbs5PFeSNOhxLRPmX/q8NaBniaYMcpa66efFVvkrGqE
	qvDuHFMNKgFnkw2V08bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHJjL-00CbIH-8s; Tue, 08 Feb 2022 06:11:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHJj8-00CbEm-On; Tue, 08 Feb 2022 06:11:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B43B615CE;
 Tue,  8 Feb 2022 06:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DA1C340FB;
 Tue,  8 Feb 2022 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644300705;
 bh=98Jh+JdWit2Ec3uBZ9fZIIVMOmAGVkhi9qoKSGmN8mE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dkarkc84bxml1mYT97ga5a+lFTT5OA3SIThy/3q5pqmFTn+KKM8Wg/T9xSG65SqlF
 WLPC5nfYthRwdLylQ3ozJKWc5Tvp6yGUIofsIZlxG4v0KCS6gYJYZPIeo/F4MgOlTJ
 Q7H/dx9Mbl7Mn6qjOOUcEdADy2vJgJh+vOdGgX1ZZtLQZWWDJ2E8zNNoDMp0uLvrGS
 0fec9ZljUZ42rP+thwv1TLb4835/iY1wMkbYXnK1osqEJFPOXkcwjHqPwYaB1V0ROv
 gLVs9OBYLHSqGC7finXbpaw8HivhQcd0m0xpbpN7bV/shGYT8WaGdn+NO9dLe5h3kq
 sgjpEzPLES1QQ==
Received: by mail-vs1-f53.google.com with SMTP id t10so2255552vsp.8;
 Mon, 07 Feb 2022 22:11:45 -0800 (PST)
X-Gm-Message-State: AOAM533FlchMBryr/39nTO0IqFKlKHs5wRdfnMsRse0tTRYw0jy6p0gC
 JVAY2w4CqgHMIsMt5IfTA7xuKlPcaP6pENphfRk=
X-Google-Smtp-Source: ABdhPJyoKG0uf9goGLZSjJNhyKf+bvy86AJ6ENV92VZKmmSAQhXAV+vpsm1T7Vkj70pF26s11ZlBhJpkUaWtRESj8gk=
X-Received: by 2002:a67:ec4e:: with SMTP id z14mr1017480vso.8.1644300703865;
 Mon, 07 Feb 2022 22:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20220126114452.692512-1-apatel@ventanamicro.com>
 <20220126114452.692512-3-apatel@ventanamicro.com>
In-Reply-To: <20220126114452.692512-3-apatel@ventanamicro.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Feb 2022 14:11:32 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQPC0-VHdwayu96UTWY5GOePLZ5dCH1z8vhseLVztr3jQ@mail.gmail.com>
Message-ID: <CAJF2gTQPC0-VHdwayu96UTWY5GOePLZ5dCH1z8vhseLVztr3jQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/8] RISC-V: Rename relocate() and make it global
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
X-CRM114-CacheID: sfid-20220207_221146_902960_8E31F8F8 
X-CRM114-Status: GOOD (  22.18  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Wed, Jan 26, 2022 at 7:46 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The low-level relocate() function enables mmu and relocates
> execution to link-time addresses. We rename relocate() function
> to relocate_enable_mmu() function which is more informative.
>
> Also, the relocate_enable_mmu() function will be used in the
> resume path when a CPU wakes-up from a non-retentive suspend
> so we make it global symbol.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/head.S | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 2363b43312fc..5f4c6b6c4974 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -90,7 +90,8 @@ pe_head_start:
>
>  .align 2
>  #ifdef CONFIG_MMU
> -relocate:
> +       .global relocate_enable_mmu
> +relocate_enable_mmu:
>         /* Relocate return address */
>         la a1, kernel_map
>         XIP_FIXUP_OFFSET a1
> @@ -185,7 +186,7 @@ secondary_start_sbi:
>         /* Enable virtual memory and relocate to virtual address */
>         la a0, swapper_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif
>         call setup_trap_vector
>         tail smp_callin
> @@ -329,7 +330,7 @@ clear_bss_done:
>  #ifdef CONFIG_MMU
>         la a0, early_pg_dir
>         XIP_FIXUP_OFFSET a0
> -       call relocate
> +       call relocate_enable_mmu
>  #endif /* CONFIG_MMU */
>
>         call setup_trap_vector
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
