Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F47DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 22:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CvGe5VjdWBymvYW1L5wmnXL51nIyKjpZAqCkRhDVt4=; b=WyvvZzo/swKRNQ
	W2zN04hlur5WaIPjL2s5Nye1/exhneX7J3pAGKYK0h0cMes5S1ztm5Kil19gBtQXaQw8he1wRPXUD
	nKNqLwfFNDlrtOoD32cZukVHQqa7LKWCo9OsnBMATjXDzFtizHFEqKiwp5l+ReEl5Nm1zDNjKhzEf
	RR6jIDmny3KeOQw9oWycgRiViO+1OEJbP/iVMRV4ABnNkJDZdsbUyGqZGrUDxX+13FMRWyk6R5vtl
	VXfQzaXjMsa63ko3kXcfhiCQBd5B4pxI/roMFrEUtxr8RixMLxWRxA+R6ZDrzqGIAMe42FXj8i9pB
	H26RxzK9bpy5uZ3WAWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF18A-00C3jd-MU; Fri, 22 Jul 2022 22:28:22 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF17z-00C3dk-0N; Fri, 22 Jul 2022 22:28:13 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 0E55392009D; Sat, 23 Jul 2022 00:28:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0992892009C;
	Fri, 22 Jul 2022 23:28:06 +0100 (BST)
Date: Fri, 22 Jul 2022 23:28:05 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Rob Herring <robh@kernel.org>
cc: Palmer Dabbelt <palmer@dabbelt.com>, Bjorn Helgaas <bhelgaas@google.com>, 
    Stafford Horne <shorne@gmail.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, 
    linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
    linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
    linux-um@lists.infradead.org, PCI <linux-pci@vger.kernel.org>, 
    "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
In-Reply-To: <CAL_JsqK-_m2=yiD4qeSoXD-Uhh_r+kmC1qK50t8Tads-i+iJqw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2207222325010.48997@angie.orcam.me.uk>
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com> <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014> <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com> <alpine.DEB.2.21.2207222006140.48997@angie.orcam.me.uk>
 <CAL_JsqK-_m2=yiD4qeSoXD-Uhh_r+kmC1qK50t8Tads-i+iJqw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_152811_240828_7C7E6FF1 
X-CRM114-Status: GOOD (  16.40  )
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

On Fri, 22 Jul 2022, Rob Herring wrote:

> > > So again, how does one get a 0 address handed out when that's not even
> > > a valid region according to DT? Is there some legacy stuff that
> > > ignores the bridge windows?
> >
> >  It doesn't matter as <asm/pci.h> just sets it as a generic parameter for
> > the platform, reflecting the limitation of PCI core, which in the course
> > of the discussion referred was found rather infeasible to remove.  The
> > FU740 does not decode to PCI at 0, but another RISC-V device could.  And I
> > think that DT should faithfully describe hardware and not our software
> > limitations.
> 
> Let me ask this another way. When would a 0 memory or i/o address ever
> work? It doesn't seem this s/w limitation has anything specific to
> Risc-V. Given pci_iomap_range() rejects 0, I can't see how it could
> ever work. Maybe only for legacy ISA? So should the generic defaults
> just be what Risc-V is using instead of 0?

 Absolutely, cf.: 
<https://lore.kernel.org/lkml/alpine.DEB.2.21.2202260044180.25061@angie.orcam.me.uk/>.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
