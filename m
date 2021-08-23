Return-Path: <SRS0=1I3Q=NO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B06BC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 14:53:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90EE6112F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Aug 2021 14:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D90EE6112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqPQyjE2koRtI9xNJiL7uBRs9PL1L2id4I7zSRr+/t8=; b=lpmfUIVEhH2YH0
	dyc4UbdTExcIg7oA0kquwe7YqeWMpMc1jtukycmDVJvIqdWItr2jcm5Zq5kJrji9b+xmzuQoT/Sya
	ZGtB9MNUtPML2ar21vr08iNjx0hihuQ6GTbJoHDMWrMQ21weYhqiMhDpPJPKJTa/9bFA+BJOhHe79
	x0wbCYYAUsgdHervB+ZNuaxJpYZV9mG/3V47RDbJTfRuHOZ44mD8Uzm2KXfwKwY52JpFuCiRxarJU
	GFVNfYRuMfx6rvGCLSQgLiYsalRX0XVZdtx7jQWTIiAJkxHVcftymFl4vjmsNN5FxvHvY+uq5WEVn
	av7cEjjfU6RXArJ98eCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIBJl-00HJG2-6s; Mon, 23 Aug 2021 14:52:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIBJS-00HJ9U-J0; Mon, 23 Aug 2021 14:52:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC250613D0;
 Mon, 23 Aug 2021 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629730353;
 bh=95kSV68n0dpCCRUmMY5PPrmt84oo0wFMRjTfsjZdteg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ik7GtlWL3XwZ6jqLY8wD2dMPkqgIADw9+NOe1Mw5Y9wL8Ob1L1ZWO55L8QppisdbM
 jRutPdbSED+7HzgxY5p7UqIxkqo7sV3d+DokWvYAnWL07BEyC6Co5Qyn55QZoRMLNa
 feDAaHy5RcNjkEFxYgjtQM24FqzUXGPPhI1lwyANIWvlbXDR0xTPGuHBMXDJx1ovKK
 Ly93dRR3jtoGZCR271SrqRHy4l1rU1KxApzZdoQZ+kyslZfHy+Bz5iEQ39/1tHo8j2
 Jx6GXTFn1SWeGIZtN1/iHz73LBrRrTzlzKHXoCaTx7/RZljk1jUt/UeXL1SUD8itXh
 narNQBH53/f5Q==
Received: by mail-ed1-f46.google.com with SMTP id z19so2076949edi.9;
 Mon, 23 Aug 2021 07:52:33 -0700 (PDT)
X-Gm-Message-State: AOAM532ArnMv/ifY/EgJXAhq8skSEpD1YBSmBBvl11Fp2D1UTDVz2fKo
 SAsvSQhKY1O4v1kL3/pFifeclsWgVIdhz+c4DA==
X-Google-Smtp-Source: ABdhPJy1bCMbL4YGtSLOxVSdg1ups6Ob2RljDGjUf8dlwlp/X6+ZF3IAe5w4+7XIcmdRLOHvmaJrv6lkF74HB0qCbkE=
X-Received: by 2002:aa7:c487:: with SMTP id m7mr18233689edq.62.1629730352256; 
 Mon, 23 Aug 2021 07:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be>
 <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
In-Reply-To: <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 23 Aug 2021 09:52:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
Message-ID: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King <linux@armlinux.org.uk>, Nicolas Pitre <nico@fluxnic.net>, 
 Ard Biesheuvel <ardb@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Frank Rowand <frowand.list@gmail.com>, 
 Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 kexec@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_075234_707850_F9BC6D4B 
X-CRM114-Status: GOOD (  28.41  )
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

On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > This patch series adds generic support for parsing DT properties related
> > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > cleanups.  It is an evolution of the combination of [1] and [2].
> >
> > The DT bits look fine to me. How do you expect this to be merged? I'm
> > happy to take it if arch maintainers can ack it.
>
> I had hoped you could take the series...

My current thought is I'll take 2-5, 7 and 8 given that's what I have
acks for and the others can be applied independently.

> > > The series consists of 6 parts:
> > >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> > >      to avoid duplicating elf core header reservation later.
> > >   2. Patch 2 prepares the visibility of variables used to hold
> > >      information retrieved from the DT properties.
> > >   3. Patches 3-5 add support to the FDT core for handling the
> > >      properties.
> > >      This can co-exist safely with architecture-specific handling, until
> > >      the latter has been removed.
> >
> > Looks like patch 5 doesn't have any dependencies with the series?
>
> Indeed. So you can take it independently.
>
> > >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> > >      riscv.
> >
> > I thought this should be applied for 5.14?
>
> Me too, but unfortunately that hasn't happened yet...

Buried in the middle of this series is not going to encourage it to be
picked up as a fix.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
