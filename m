Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26202C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdNsrMXkGkf3HpoDHFcuj3E+LOIo8HTz83JpCrYCEYo=; b=JIEQaRTP3uevVT
	nczVqERa4GNuXoZsgQrPictng/VUxeAlpNq4xtk0qcayIg/RLG9kzgMYEpFaQhDdAK2sN1o1MNJuQ
	YcZNERmHYU9H9lJJrs7N7tw5me9YYt3hxORRmtlp36uT9BOGAa9gjZl2iO4FP0dLl8OlQlimjFWqM
	rAlSU2+pElFJ+2aD37RKtcYjHRyAWECfVS0jul0piFhN7hYJvNqEaE0YxlYcLPjPv8e3Q/Y0Gl00z
	eRi2B1WHs3b9Bgvzd+sJ3S+fF7EVCcEKakmRw878oZ5KEfATprAmUSmVnNzrRP0UoHrY69Of4vNTI
	zo0ZtiLyjwePjR9Llytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcHd-00Fcq9-B1; Mon, 13 Feb 2023 17:06:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRcHY-00Fcoj-La
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 17:06:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 05734611B4;
	Mon, 13 Feb 2023 17:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6596AC433D2;
	Mon, 13 Feb 2023 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676307981;
	bh=bNVKiFGzFNcgLu9Ct0qPxdKZ+t9ooRo2mpmfqxrFIyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mdo34bAownW6S8yU6TMr0sLxud3egcvCKiOFv9SCMu85L4jQV31fV4tQVQZbHmEYW
	 03GA6Xb/el6HMKuPSJRvPus5nsqgj5VvfZwF5rTnwEFkVhyStRjkC+rCAnd1IrrVoU
	 5YWy3sVXhXX3Suj2SNcCpxKFi91utbQj29uASxSI8g29PTw62OGTBDP/5lxZ9kqGHd
	 MpLyat2v78cnZm0NASAJlU+zoUXDqt8xUXuMLqClEdAAF1MK9/Ogqb4qtDOKE259vm
	 740uYWf3+ybPO2xJlE3kDuL6X54oM5/UUPI/gok5CGe7GTBjGPawMW4Xz184qTvJDM
	 YYy4yiTA2GXvQ==
Date: Mon, 13 Feb 2023 19:06:11 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Conor Dooley <conor@kernel.org>, mcgrof@kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 8/8] kbuild, PCI: microchip: comment out MODULE_LICENSE
 in non-modules
Message-ID: <Y+puA2V5BoH/Cbr2@unreal>
References: <20230210164749.368998-1-nick.alcock@oracle.com>
 <20230210164749.368998-9-nick.alcock@oracle.com>
 <Y+aMh5e9bWaTphiZ@spud>
 <871qmx1fv5.fsf@esperi.org.uk>
 <Y+akw9VBjg9oZ7QV@spud>
 <Y+kx3fb2Lzlg+u5+@unreal>
 <87k00ly25v.fsf@esperi.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k00ly25v.fsf@esperi.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_090625_924026_24BF21FF 
X-CRM114-Status: GOOD (  38.72  )
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

On Mon, Feb 13, 2023 at 04:13:00PM +0000, Nick Alcock wrote:
> [Modified resend: my MTA claimed not to send it but then sent it to some
>  recipients anyway, and then I was asked not to do some of the things
>  I'd offered after I sent it.]
> 
> On 12 Feb 2023, Leon Romanovsky told this:
> 
> > On Fri, Feb 10, 2023 at 08:10:43PM +0000, Conor Dooley wrote:
> >> On Fri, Feb 10, 2023 at 07:26:38PM +0000, Nick Alcock wrote:
> >> > On 10 Feb 2023, Conor Dooley said:
> >> > > FYI $subject seems wrong, this is a PCI patch AFAICT.
> >
> > <...>
> >
> >> > kbuild is present in every patch in the series because this is a
> >> > kbuild-driven change (the thing it disturbs is part of the build system,
> >> > the construction of modules.builtin*). This seems to be common practice
> >> > for kbuild-related treewide changes.
> >> 
> >> Okay, I'll take your word for it. It just looked/looks odd to me!
> >
> > It looks odd to me too. Please add SPDX tag in modules which don't have
> > it already, instead of commenting code.
> 
> Alas... nearly all of them *do* have it already, and in most cases it is
> different. Usually not *very* different, but different. In most cases it
> is more specific, e.g. drivers/soc/fujitsu/a64fx-diag.c, where we have
> MODULE_LICENSE("GPL") but SPDX says it's GPL-2.0-only, but then there
> are things like lib/packing.c, which throughout its history in the tree
> has combined // SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0
> and MODULE_LICENSE("GPL v2"); which are just not the same thing.
> 
> I commented the MODULE_LICENSEs out specifically because I wanted to
> avoid getting into hundreds of simultaneous license flamewars while
> trying to get *a different thing entirely* into the kernel (kallmodsyms,
> which depends on modules.builtin.objs being correct).
> 
> I still don't want to get into hundreds of simultaneous license
> flamewars or get my employer into legal hot water, so I think I'll leave
> things commented out and let individual maintainers decide whether they
> want to reconcile any contradictory info that may exist or not (and as
> noted *most* of these are conflicting.)
> 
> 
> This email is the closest thing I have to indicating what Luis would
> prefer (and the only reason I'm doing this is because I need it before
> Luis's modules.builtin.objs change can work):
> 
> <https://lore.kernel.org/linux-modules/Y5AgMuMu75gne6Ka@bombadil.infradead.org/>
> 
> Yes, Luis thinks we can just use SPDX, but given that they are usually
> different, making such a change seems well beyond my pay grade. Even in
> the PCI domain, we see (second column, MODULE_LICENSE: third: SPDX,
> sorry about the line lengths).
> 
> drivers/pci/controller/dwc/pcie-histb.c:		GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/controller/mobiveil/pcie-mobiveil-plat.c:	GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/controller/pci-tegra.c: 			GPL		// SPDX-License-Identifier: GPL-2.0+
> drivers/pci/controller/pci-versatile.c:			GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/controller/pcie-hisi-error.c:		GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/controller/pcie-microchip-host.c:		GPL		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/endpoint/pci-ep-cfs.c:			GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/endpoint/pci-epc-core.c:			GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/endpoint/pci-epc-mem.c:			GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/endpoint/pci-epf-core.c:			GPL v2		// SPDX-License-Identifier: GPL-2.0
> drivers/pci/hotplug/acpiphp_core.c:			GPL		// SPDX-License-Identifier: GPL-2.0+
> drivers/pci/hotplug/shpchp_core.c:			GPL		// SPDX-License-Identifier: GPL-2.0+
> 
> Not much in the way of consistency here: GPL sometimes means 2.0+ but
> sometimes it means 2.0. GPL v2 appears to consistently mean GPL-2.0, but
> if you look at other affected modules you soon see inconsistency:
> 
> drivers/powercap/powercap_sys.c: GPL v2		// SPDX-License-Identifier: GPL-2.0-only
> drivers/firmware/imx/imx-scu.c: GPL v2		// SPDX-License-Identifier: GPL-2.0+
> arch/x86/crypto/blake2s-glue.c: GPL v2		// SPDX-License-Identifier: GPL-2.0 OR MIT
> drivers/iommu/sun50i-iommu.c: Dual BSD/GPL	// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> 
> We even have
> 
> drivers/gpu/drm/drm_mipi_dsi.c: "GPL and additional rights" (header is
> non-SPDX -- a BSD license header with advertising clause!)
> 
> So SPDX is usually more precise than the MODULE_LICENSE, but is it more
> *accurate*? I have no idea, and I don't see how I could possibly know:
> going by the presence of advertising clauses that obviously nobody is
> obeying it doesn't seem like we can trust header comments to be any more
> accurate than MODULE_LICENSE. Best to just leave both in (and comment it
> out so it has no side-effects on the build any more, which is all I'm
> after).

You are overcomplicating things.

First, GPL == GPL v2.
Second, SPDX is the right one. License in module is needed to limit
EXPORT_SYMBOL* exposure.
Third, we have git log and git blame to audit and revert any change.
There is no need in leaving (even as commented) dead code.

Thanks

> 
> -- 
> NULL && (void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
