Return-Path: <SRS0=1I3Q=NO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EDDC43214
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 15:22:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CCA6121E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 15:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88CCA6121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKTPzuOfXP17K9jBzblSrNSo0PMq3gabHAq1Elp8sL0=; b=OgW9WNToyYwcBk
	/k07bc7kJ76T5d2Hz/svVtXDqj+0xXbXAEpnHgwKL5QJRLrCf9GNgBrMhwGJkA1F5X+U7peFkgXN6
	36N38i/Qk2Vn7ocuB7pfo+APJgleodZX9/zsGeINhYVn0FpHB8GtD7GYgkfJoCJOG8tkUtnvHC4f1
	xvTOWXJu/dT27SVFNRk97RMGEXgm0LmpjKNGQ1fpmhk4/14ykALvCjYD/Ib1ZxEnq3qGAZkumU75V
	88xx1AdktZRvom6j/xPw/h3reV7WTq8VyEsDSVlayTJ8ZKqaKkneDkVhjwD8i4kuc/ttHDwI0+tgW
	z3p0Jb+ntQ34oSPVfGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIBkv-00HPsY-1u; Mon, 23 Aug 2021 15:20:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIBkW-00HPjW-Ae; Mon, 23 Aug 2021 15:20:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9C6061406;
 Mon, 23 Aug 2021 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629732031;
 bh=qreQnG9EH+SLqs9cxYafKtRpnrXgjkJipzrUHxRm8AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RGjW/286CluzlorhZhA12uBlEH3uhRoRK1S/j3K064/Shsa1wyggzEKZ+qBLhJnq4
 gRNV2wTAu/HjHiWh2f8lDroX68ilJ+YROIaiewKam0s1N8A50OJJWefyUImpM5E2eF
 23BcN2czeN9GNVN/lCJogN+4552M5+pHKvniKKEJEUx8otTEcVGWHyeI3OR3rj1qMi
 Hi+i0DsYD+9xTYJ7MrtjEFxhLsW1VCy64kf+eN2MBlr4L1PcNpyAXM2UcO+pR7vBQY
 FLye4cqCOX/Qx8AxadC/oQ1G2/s7ZAxLxG8DqtLBtsk0QFfiMvLtb9egfLJszfwr1w
 PQAw/Rb0cjfWQ==
Date: Mon, 23 Aug 2021 18:20:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>,
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, kexec@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header
 reservation
Message-ID: <YSO8tJxbuADEeL7I@kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
 <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
 <YRn9DHlB/pdNPJyP@kernel.org>
 <CAMuHMdVdqR7gw+2O2v=qv_BB=+X2wEXN9jXV=np=jRayadwj7g@mail.gmail.com>
 <YSOeGzowhV/R9QS/@kernel.org>
 <CAL_JsqLMv4fKebJEOv=7UXvy_qqut0N42psS-PSgRMU-qhiFLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqLMv4fKebJEOv=7UXvy_qqut0N42psS-PSgRMU-qhiFLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_082032_450412_038A4F29 
X-CRM114-Status: GOOD (  35.09  )
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

On Mon, Aug 23, 2021 at 09:44:55AM -0500, Rob Herring wrote:
> On Mon, Aug 23, 2021 at 8:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Mon, Aug 23, 2021 at 12:17:50PM +0200, Geert Uytterhoeven wrote:
> > > Hi Mike,
> > >
> > > On Mon, Aug 16, 2021 at 7:52 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > > On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> > > > > Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> > > > > occupied by an elf core header described in the device tree.
> > > > > As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> > > > > mips_reserve_vmcore(), the latter needs to check if the memory has
> > > > > already been reserved before.
> > > >
> > > > Doing memblock_reserve() for the same region is usually fine, did you
> > > > encounter any issues without this patch?
> > >
> > > Does it also work if the same region is part of an earlier larger
> > > reservation?  I am no memblock expert, so I don't know.
> > > I didn't run into any issues, as my MIPS platform is non-DT, but I
> > > assume arch/arm64/mm/init.c:reserve_elfcorehdr() had the check for
> > > a reason.
> >
> > The memory will be reserved regardless of the earlier reservation, the
> > issue may appear when the reservations are made for different purpose. E.g.
> > if there was crash kernel allocation before the reservation of elfcorehdr.
> >
> > The check in such case will prevent the second reservation, but, at least
> > in arch/arm64/mm/init.c:reserve_elfcorehdr() it does not seem to prevent
> > different users of the overlapping regions to step on each others toes.
> 
> If the kernel has been passed in overlapping regions, is there
> anything you can do other than hope to get a message out?

Nothing really. I've been thinking about adding flags to memblock.reserved
to at least distinguish firmware regions from the kernel allocations, but I
never got to that.
 
> > Moreover, arm64::reserve_elfcorehdr() seems buggy to me, because of there
> > is only a partial overlap of the elfcorehdr with the previous reservation,
> > the non-overlapping part of elfcorehdr won't get reserved at all.
> 
> What do you suggest as the arm64 version is not the common version?

I'm not really familiar with crash dump internals, so I don't know if
resetting elfcorehdr_addr to ELFCORE_ADDR_ERR is a good idea. I think at
least arm64::reserve_elfcorehdr() should reserve the entire elfcorehdr area
regardless of the overlap. Otherwise it might get overwritten by a random
memblock_alloc().

> Rob

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
