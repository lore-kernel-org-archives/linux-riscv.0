Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7765CD3424
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy+NdXCO8cTBIaqEXRNP2YgotFrHVMryMcMtQHCMfws=; b=HUFVcGaqGgSzZH
	YOrakCPnx/I7ej1pMk+IfdwatPVAZYSzhtFJPvsNso2ZQ0tM7fQnNNoFPKmwegvTgxUh7V2roBF2H
	9oTWibknFhcjcu5rDaI2ex/lIrjdgySmF7ThNVQv/SUcyA+HRSsz+gQ3m4XHc4nRm47l1SgKyVPE7
	aBBukGGpfil+INq0JlJGQhKb1x+2EtififpeuAaS4Gm4/i3EVMSlitkxZiybkVEmbT20YX/GntP6O
	XkD79x3/o4M/2fmQcpX9Lr8Ov45pVxe5xcpsHxXMZpn2viEH3PicmP0mAeYE20HrNh7Bsf1an8Irz
	XU2/0X6uHa6XK6lJ6+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvg-00000000Dct-3bjz;
	Wed, 06 May 2026 08:48:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXvf-00000000Dba-1hgK;
	Wed, 06 May 2026 08:48:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D894860132;
	Wed,  6 May 2026 08:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A17C2BCC4;
	Wed,  6 May 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778057306;
	bh=IUO5lXUDkT4nvUBviJejZvM9e4p1qGcE/fMZ5yRqht4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyYTCfoLxt9bBadi2EzSMoURTPGCD/lKkFKebSQF7LnOtBPR7VpN5fo8iYNGExYVa
	 pzOx4fSjkWAUmltCJw7h9vFz4ijQnMvAm1HfN1G3MPdgeGBbcpUuo3/7au0nR0YPik
	 QP0PIXAdZ0urf5mL1ZHZpMfa3ImOrTwCrDGS6rGzzuXKml0O331yQiC2f/f/zdkqUb
	 icnkpvTei2+s4rP+rPmBhJDOyhpeHek2fYHa5d41MUUvOCZVLneiy8qWgxAQTW/q3p
	 aDLeYpf2toLXyU3+GN4x4R8CHJovyT4t6/+1ytZyodVy0KkHqIds6KcxOgk8aI6cBi
	 YCO2FlL2Ct/SA==
Date: Wed, 6 May 2026 10:48:20 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 2/2] irqchip/gic-v5: Add IWB to ACPI probe dependency
 control
Message-ID: <afsAVO+vTQp2r/EI@lpieralisi>
References: <20260505-gic-v5-acpi-iwb-probe-deferral-v1-0-b37b85998362@kernel.org>
 <20260505-gic-v5-acpi-iwb-probe-deferral-v1-2-b37b85998362@kernel.org>
 <875x51y6gi.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x51y6gi.ffs@tglx>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-acpi@vger.kernel.org, loongarch@lists.linux.dev, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 05, 2026 at 09:58:05PM +0200, Thomas Gleixner wrote:
> On Tue, May 05 2026 at 10:48, Lorenzo Pieralisi wrote:
> > On Arm GICv5 systems, wired IRQs routed to an IWB may require resolving
> 
> S/IRQs/interrupts/g
> 
> Changelogs are prose and not an acronym dump ground.
> 
> >  drivers/acpi/arm64/iort.c        | 22 +++++++++++++++++++---
> >  drivers/acpi/scan.c              |  1 +
> >  drivers/irqchip/irq-gic-v5-iwb.c |  5 +++++
> >  drivers/irqchip/irq-gic-v5.c     | 13 +++++++++++--
> >  include/linux/acpi_iort.h        |  3 ++-
> 
> I'm confused about the conglomerate of files affected by an irqchip
> change...

True, I can split the ACPI changes into a separate patch though on its
own it would not be that useful because the resulting code would have
no user - I will do what you and Rafael prefer.

Thanks,
Lorenzo

> Thanks,
> 
>         tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
