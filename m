Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81720C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEeszAYVgb0xorWvat5Eyugfum5+HV18LkFMRiNdfRE=; b=RBs8ZrNr8BBcOU
	g1XlRYqx6PH5c72kD2Y8j7Bo2OQZbQSLiDQeBxQFFGJ1+PrDtkLWeEORnxnxBf4kmrZDgEm29Py1M
	Dgg5gCF2TG+iPvmgm1FO+fQQdipdV+8fTqcB/U8oGdG6B3Qs7jcxPV+OsQoXxcMy1/N0FdWFTBlgt
	pjl51d8DdN/Gr790XB7RnUM/5cDaY7U5KhHlnSz7tvAaN7hqM3DXOo2EGuJ7yxhmeoDemMfOffkmc
	bft3F3wQbqu6AI7k//Hqni/ETh5/QxRuMluJCkOHsjF1JeXsXOZI9WlFoZ96nRR37M39D6nRdF6Eq
	bBPVyMBEGUlLdO3NvT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmlH-0000000D9bI-0p4X;
	Mon, 06 Jul 2026 17:05:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmlG-0000000D9ah-11r1
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 17:05:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 079F8407C7;
	Mon,  6 Jul 2026 17:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50E71F000E9;
	Mon,  6 Jul 2026 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357537;
	bh=cQC0CCHeb+nRGhmnTm+kOgmt7Ax4UHsY6IFI0qwAXtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=chRQfo145b1N+VAnSPczv2KbFSL6ecr5fFLtPTg+GMbs66bYXCrB/noGAcdOHke7T
	 oBM4shzfVLhLr4nRClwSi2NNJn1oGmdKa7aNwvkeNPpBa/bSXViMr+tchtscxr0eTP
	 p3VMjwJXI5+ctIkKJaC0rXwdhaLp78LU2w+IOTdm8PX3itepPIX6+HRasuk+jfgmgy
	 Kzb4petWMyYjafC1PFDt0JPeN9/eM8yJsI/H/O9D/j4+k0xPIYwboiT8FooyQRYc2H
	 acJZDEr9IgYYDkMWOz+Nxvu+AjnovDoNayplO0GRpp38U6khMFHtb3bGsmSVqMDcPz
	 A8Hyj5Yr2z7Eg==
Date: Mon, 6 Jul 2026 10:05:36 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] riscv: Enable resctrl filesystem for Ssqosid
Message-ID: <akvgYEMC1JPHfReR@x1>
References: <20260628-dfustini-atl-sc-cbqri-dt-v3-0-c9c1342fe3cf@kernel.org>
 <20260628-dfustini-atl-sc-cbqri-dt-v3-6-c9c1342fe3cf@kernel.org>
 <20260628213007.AE2CD1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260628213007.AE2CD1F000E9@smtp.kernel.org>
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

On Sun, Jun 28, 2026 at 09:30:07PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] RISCV_ISA_SSQOSID unconditionally selects the user-visible menuconfig RISCV_CBQRI, defeating its prompt and violating Kconfig best practices.
> --
> 
> commit 6a7bfcfac7becb358efe0bde0c988634f28e5326
> Author: Drew Fustini <fustini@kernel.org>
> 
> riscv: Enable resctrl filesystem for Ssqosid
> 
> This commit enables the resctrl filesystem for the RISC-V Ssqosid extension.
> It modifies the RISCV_ISA_SSQOSID config to select ARCH_HAS_CPU_RESCTRL and
> RISCV_CBQRI.
> 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ee586925f9722..9c28bcbc29dc9 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -594,6 +594,8 @@ config RISCV_ISA_SSQOSID
> >  	bool "Ssqosid extension support for supervisor mode Quality of Service ID"
> >  	depends on 64BIT
> >  	default n
> > +	select ARCH_HAS_CPU_RESCTRL
> > +	select RISCV_CBQRI
> 
> [Severity: Medium]
> Is it intentional to use select on RISCV_CBQRI here?
> 
> RISCV_CBQRI appears to be defined as a user-visible menuconfig:
> 
> drivers/resctrl/Kconfig:
> menuconfig RISCV_CBQRI
> 	bool "RISC-V CBQRI support"
> 	depends on RISCV && RISCV_ISA_SSQOSID
> 
> Using select on a user-visible symbol forces it on and overrides the prompt,
> which can create a confusing configuration experience where the option is
> visible but cannot be toggled.
> 
> Could this be addressed by either using "depends on" instead of select,
> or by making RISCV_CBQRI a hidden symbol without a prompt?

I'll make RISCV_CBQRI user-selectable in the next revision: drop the select
from RISCV_ISA_SSQOSID, make RISCV_CBQRI depend on RISCV_ISA_SSQOSID with
default y, and move select ARCH_HAS_CPU_RESCTRL onto it.

-Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
