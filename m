Return-Path: <SRS0=KDuJ=NA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2680BC4338F
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 11:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F6D60EE9
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Aug 2021 11:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90F6D60EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWtUJjnky+8fzsz65iMpK6QJh8096Ck5xOBeNqeZseQ=; b=pxlz5SLwZ5NsDU
	z0L1K4pjAiD42FjxoWbsCXE2OKSdmx1W0Ly8XcmYh/JRHO6bbJ3oczWwbgshSs3KAZQQl+7i54PWh
	Ju/B51cq3dQgVPK1U7H+TwuLwtGnLbF28Uh8FT+2DZ0fbBrq+B37EvqekwvItbtEfkvzyzj2pFoPG
	4bHF8bj7/77iRjIFEORG3wF+0tcWYp1hBdsfHUb5p4JmeBkHs3DTjl4yZvudVFwjjNIxfx0gIXS+h
	fBuqukiz2TICsctMwpgIVIoQT6KPhIErd0IwbJjpDvMcYLlSSlLtVuEbaMCEVE1ahaQVjCIiZ4gYX
	+H98GM0AdvUzZVCkiJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD30q-000H0W-Rd; Mon, 09 Aug 2021 11:00:08 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD30o-000Gzi-2s
 for linux-riscv@lists.infradead.org; Mon, 09 Aug 2021 11:00:08 +0000
Received: by mail-ua1-f47.google.com with SMTP id x21so2819222uau.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 Aug 2021 04:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rCa+8aMH9lvrldDtJTsQzoAwywDdjdFTQK8ubSieS/Y=;
 b=k2GzgWqa/E4yAJLvDJgUPe/8kg6XT/zKRJfccaa7eVX8gl2OmiwGuSmlXucFZi8DsI
 AUluxcvFmQ54dUcWN79ed/RL564Emktw6LSWBIroAmawiQHGUahQI3UEkOWokYm55H5L
 ARS5P8yJOD4ldHxVxKZdfKDAXYP/E8wWCXUq1Cd3Thx9WhDkzjtzQ8txBsowfsgn6Btr
 EOHLRlIIhnyUH6HzB0FPdP1GpCAhyIW03ToMoJdFB5BifOq9Vc3MMwAK4XyLy7MM5SL+
 Na50TY+172xAEiajdQ4catfRiuCsbbu3nxHuNEP7Qvv7cF8lJ/TeBOcCU5wyMKE9iNn8
 TYPA==
X-Gm-Message-State: AOAM532EmGT5VcoVTLrl8pQNKXW+3FsVT36igQyb7wpTHKnlYBd7PpM6
 F0SyxVx/++8XJo4FibqNusUM9TXkirkojrT5EN4=
X-Google-Smtp-Source: ABdhPJyzDIPE3tsvO4qcGGsTg9uBsU8k/CFcUQfTTC+SWZI+D9cqB89hcO9ltBZOMwDA8wciAXmJoysCLpv3MeXn4E8=
X-Received: by 2002:a9f:31ad:: with SMTP id v42mr2393402uad.58.1628506805059; 
 Mon, 09 Aug 2021 04:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
 <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
 <20210805023024.GA12312@x1>
 <CANBLGcwczBsc-mfU2t9=7No7KhHfBFHFzGy=5hdyEE+4VN8ksg@mail.gmail.com>
 <CAOnJCU+-orqjP5dND0QNh+08UhXitS=LPpg1VpnBcp=6YJU7EQ@mail.gmail.com>
In-Reply-To: <CAOnJCU+-orqjP5dND0QNh+08UhXitS=LPpg1VpnBcp=6YJU7EQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Aug 2021 12:59:53 +0200
Message-ID: <CAMuHMdW=HUKz-9gd6R2Sh4tu5uLrjNPhdScZMi5ev+n-B4yYsw@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
To: Atish Patra <atishp@atishpatra.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Drew Fustini <drew@pdp7.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Jack Zhu <jack.zhu@starfivetech.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_040006_151038_B0B0C28B 
X-CRM114-Status: GOOD (  56.69  )
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

On Thu, Aug 5, 2021 at 8:09 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Thu, Aug 5, 2021 at 1:13 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Thu, 5 Aug 2021 at 04:30, Drew Fustini <drew@pdp7.com> wrote:
> > > On Wed, Aug 04, 2021 at 02:13:47PM -0700, Palmer Dabbelt wrote:
> > > > On Wed, 04 Aug 2021 13:54:16 PDT (-0700), atishp@atishpatra.org wrote:
> > > > > On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > > > On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> > > > > > > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > > > > >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> > > > > > >> BeagleV Starlight JH7100 board [2].
> > > > > > >>
> > > > > > >> [1] https://github.com/starfive-tech/beaglev_doc
> > > > > > >> [2] https://github.com/beagleboard/beaglev-starlight
> > > > > > >>
> > > > > > >> Signed-off-by: Drew Fustini <drew@beagleboard.org>

> > > > > Given that beagleV starlight mass production is cancelled [1], are we
> > > > > still upstreaming the support for this ?
> > > >
> > > > I'm not sure, but I wasn't quite sure where to have that discussion.  I
> > > > figured that the boards exist so there's no reason to shoot this down, given
> > > > that it's just the vendor DT list.  At a bare minimum there's out of tree
> > > > support for this, so having the DT strings defined seems sane as that's a
> > > > defacto interface with bootloaders.
> > > >
> > > > Maybe this is more of a question for Drew: I think we were all OK working
> > > > through the issues with the first-run chip when there was going to be a lot
> > > > of them, but with such a small number produced I'm not sure if there's going
> > > > to be enough interested to take on all that effort.
> > > >
> > > > I'm not quite sure where we stand on support for this: at some point there
> > > > were some ideas floating around as to a way to support it without major
> > > > software changes (allocating into the non-caching regions).  If that pans
> > > > out then I'm fine handling this, at least from the RISC-V side, but if we're
> > > > going to have to go through all the ISA/SBI stuff then it's probably not
> > > > worth it.  Also not sure if there are a bunch of starfive-specific drivers
> > > > that would be needed to make this boot, in which case it's probably best to
> > > > wait for whatever comes next.
> > >
> > > I think that the discontinued beta prototype could be useful as a native
> > > build host for those of you that have it and don't have an Unmatched.

Exactly.  And there are ca. 300 boards out there (many more than
some other platforms supported by Linux), which won't disappear with
the blimp of an eye (unlike "proprietary" boards that tend to get
mass-destroyed when a project is cancelled).

> > Also according to this statement [1], they're still planning on
> > producing new boards with the JH7100 (same chip as on the BeagleV
> > prototype) at the end of Q3 and the JH7110 further in the future, so I
> > still think it'd make sense to support those.
> >
> > [1]: https://www.design-reuse.com/news/50402/starfive-open-source-single-board-platform-q3-2021.html
>
> > > The arch_sync_dma RFC from Atish [1] is key to the board running
> > > mainline. Most of the peripherals (USB, SD card, ethernet) are already
> > > supported by upstream Cadence and Synopsys drivers. However, the vendor
> > > kernel used ifdef's to flush the L2 cache at several points in those
> > > drivers and subsystem cores because the peripherals are on a non-cache
> > > coherent interconnect.
> > >
> > > Without the proposed solution from Atish that uses the non-cached DDR
> > > alias, then only serial console would work on mainline (assuming the
> > > system is running from a ramdisk that the vendor uboot loaded).
>
> We need the clock patches as well. If there is an agreed effort to
> upstream the clock patches
> and other bare minimum patches, I am happy to revise the DMA patches as well.

The main issue with the clock driver is that we do not have complete
documentation about the clock tree, so the tree implemented by the
driver is a bit ad-hoc.

However, I do think we already have a good separation between DT
bindings (incl. definitions) and clock driver.  Hence we can upstream
the DT and clock driver, and fill in the missing and correct the
existing parts of the clock driver later, without needing further
changes to the DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
