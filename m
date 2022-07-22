Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B10AC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1reH1DnSX+k0Bso9euO0u7C9K9L4p4xK2pffuJQlZA=; b=LPsBlsxbxxc3vA
	cqO2TiWL1Wg5V4vMml0DlzjwnHGGAy5+k0J8gFTuCuOfyt7/AwBoyTrl6C7rRpuqw27zPvtlAzEQ5
	UQTqesF2MdNDSf9kaRhBAvtwygKmKiskuGYvGhB2hSgVOk8xYx/L7IyfZzxuTb50tUaI40B1QnxBk
	oyJQDwRdQdCx+Tckhxm/2+SrO1ih/ivVHLZzgtUEb/Uw0zMzIqPQrsF7YiiqNBSQQindLotwmER7g
	YW88mCE1srdQrNY48nvf/ebn13oP1FmIUuSqS5NJznq2wzqTvyY0+9NBmVfYZUykkMTou7hoz8vmL
	FE1E2uaMH8YzWPAKx6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEyY4-009W1R-Em; Fri, 22 Jul 2022 19:42:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEyXs-009Vt2-6Y; Fri, 22 Jul 2022 19:42:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2276F61EFF;
	Fri, 22 Jul 2022 19:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C568C341CA;
	Fri, 22 Jul 2022 19:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658518959;
	bh=YWzIul9hGbwyzj2QABvAP1bl4Le92NfHp2dc2pubYJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h8zN0U/XN5NU2wFfkFyroujrtY/386+7fCTYjcuMUkmD4XIGlpSn7ZnU4ZolmV/x1
	 eCezEU3aHdNDxS3SqdB3SnELmLCsbL2IewKbYyRbHxs3sjPnt48iaNXde+SaB+BCh0
	 HI3d477Tf2sEvehgNwadjad+rH80Q3SJgzmHVzgb+0JdTSt2+xwtrIpNgPKScXu1hp
	 8v/K+ewAaSFvpGGDZjLIFiHnjB6CLM+QiPngj3CcyDQVmVcqaqJ1r6N2TihxNN+9/6
	 uL8UA+9uwHwH7CpGbkqFW8moMpd9btIOgLwly2ylF5WLM1Qa+GdcZMipgiYLnKguaI
	 fjlW0z2gG4eTg==
Received: by mail-vs1-f54.google.com with SMTP id 125so5221248vsd.5;
        Fri, 22 Jul 2022 12:42:39 -0700 (PDT)
X-Gm-Message-State: AJIora+1RJaRuTYAsRcgH3Uq+QQLsz6aT+qdAK2iuvf5XfSgbqFnco7L
	6MmwKFQ6jGqc6gbO8oeD8v4M4dT6tG6NgpY0/g==
X-Google-Smtp-Source: AGRyM1sYSLwcS2d5BKZ605LbIBDuQ7FVSSV1zuVCvhEy9wn82CnrWQCs9eT+2Zp2gVSOkp8hHljE+zkArm7bYaXLsO0=
X-Received: by 2002:a67:d194:0:b0:357:8ea:5554 with SMTP id
 w20-20020a67d194000000b0035708ea5554mr641848vsi.0.1658518958470; Fri, 22 Jul
 2022 12:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
 <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014>
 <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com> <alpine.DEB.2.21.2207222006140.48997@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2207222006140.48997@angie.orcam.me.uk>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Jul 2022 13:42:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-_m2=yiD4qeSoXD-Uhh_r+kmC1qK50t8Tads-i+iJqw@mail.gmail.com>
Message-ID: <CAL_JsqK-_m2=yiD4qeSoXD-Uhh_r+kmC1qK50t8Tads-i+iJqw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Stafford Horne <shorne@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um@lists.infradead.org, 
	PCI <linux-pci@vger.kernel.org>, 
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_124244_357414_6ED90C2E 
X-CRM114-Status: GOOD (  22.60  )
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

On Fri, Jul 22, 2022 at 1:23 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Fri, 22 Jul 2022, Rob Herring wrote:
>
> > > Maybe the right thing to do here is actually to make the default
> > > definitions of these macros non-zero, or to add some sort of ARCH_
> > > flavor of them and move that non-zero requirement closer to where it
> > > comes from?  From the look of it any port that uses the generic port I/O
> > > functions and has 0 for these will be broken in the same way.
> > >
> > > That said, I'm not really a PCI guy so maybe Bjorn or Maciej has a
> > > better idea?
> >
> > >From fu740:
> >                        ranges = <0x81000000  0x0 0x60080000  0x0
> > 0x60080000 0x0 0x10000>,      /* I/O */
> >                                  <0x82000000  0x0 0x60090000  0x0
> > 0x60090000 0x0 0xff70000>,    /* mem */
> >                                  <0x82000000  0x0 0x70000000  0x0
> > 0x70000000 0x0 0x1000000>,    /* mem */
> >                                  <0xc3000000 0x20 0x00000000 0x20
> > 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
> >
> > So again, how does one get a 0 address handed out when that's not even
> > a valid region according to DT? Is there some legacy stuff that
> > ignores the bridge windows?
>
>  It doesn't matter as <asm/pci.h> just sets it as a generic parameter for
> the platform, reflecting the limitation of PCI core, which in the course
> of the discussion referred was found rather infeasible to remove.  The
> FU740 does not decode to PCI at 0, but another RISC-V device could.  And I
> think that DT should faithfully describe hardware and not our software
> limitations.

Let me ask this another way. When would a 0 memory or i/o address ever
work? It doesn't seem this s/w limitation has anything specific to
Risc-V. Given pci_iomap_range() rejects 0, I can't see how it could
ever work. Maybe only for legacy ISA? So should the generic defaults
just be what Risc-V is using instead of 0?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
