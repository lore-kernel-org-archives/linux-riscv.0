Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7097C432BE
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 11:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8065F6128A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 11:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8065F6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2YYTIRIdlSUH36YyDE/Nc9QujW/DRvzty14M7v43hk=; b=MqPw70/AlxZ/DX
	Tf+RC71QD6cOl9Upqyp7DvT2SMDmUU+fpFktz3PfEq2HxWktLsOlqHvm8kaI5IslTRGdQJxAuPZRi
	06U++lv4JkEnnr1E9IL+QsBcCVERcEp7lzPxSards6wYU8r02lXhDqnwWsJhP2uIZgn0WMV2fXrre
	eN1AHh8Q2uO6BifOzYvFBXswrd+jkeiqLlspb72ofZOyYPsJUVzLolr6I6uHFSNsdySZr62dQVr7f
	I6Zl+EjPaTCG7+tMcCTepChRlxQYjajDFLn+csUN9luxGLyEWbB+BH2tyaX9zGtIGeRVjpXogzs0C
	9En4LSAbTX94PF4ApVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIV2e-002rlr-Qs; Tue, 24 Aug 2021 11:56:32 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIV1v-002rV2-PT; Tue, 24 Aug 2021 11:55:49 +0000
Received: by mail-vk1-f179.google.com with SMTP id 1so5432980vkk.1;
 Tue, 24 Aug 2021 04:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XfgeSNPVMKWrfXyFj8jprqwXpb9tNGH+Wb+KqyJb9gQ=;
 b=XZ6L1C7VvvD/9oCbymfgBgEQEwUhouDcRR7v+F42Fd00rU3DHhcmtYVAApcwKCYLkK
 fQl0XDrWzlzWK+KjXmVd8xFu5gK/U6OHGnm67308fVPsulpnBC6C7eS9CA4sZkclm3s3
 tKXSuCPWS/YrRvWJLUZLUSZocWtwzfmhTeJJMN4kwK+qWpUKUwdl3zA9Nyn/uOY/Ol5y
 Ax1xCccMbpqqJdF7XNRPLKM3i4hlZVldWuhFsx6Bj3zaJ309BP2LpjW3GnMxVk5yn+D8
 OLqmt2MlH6+Hd3UDPTSSuVquixrj1lV6kUflpSNS6QKqFDlqUxa5i4I2hsWMJyM3B/d7
 gjqw==
X-Gm-Message-State: AOAM531+NySZBNoQ6LZL7uFMu0A33k4WA56oj8FYTKrvjs66o32/IDkp
 /HVb9eJ8hV91yGyWhBoA/eazFINYVlWFQFEvlpY=
X-Google-Smtp-Source: ABdhPJyF2wRPCJa9TS8UTuYi45dG+oebI6qeiCjlOVZk/DVs/Dyj3ugAf0SqlejD7IoDmVPYRh8sFRN0eHUzW9fAJ6o=
X-Received: by 2002:a05:6122:809:: with SMTP id 9mr295247vkj.4.1629806145488; 
 Tue, 24 Aug 2021 04:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be>
 <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
 <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
In-Reply-To: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 13:55:34 +0200
Message-ID: <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Baoquan He <bhe@redhat.com>, 
 Vivek Goyal <vgoyal@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 kexec@lists.infradead.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_045547_877381_B6A843EC 
X-CRM114-Status: GOOD (  38.45  )
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

On Mon, Aug 23, 2021 at 4:52 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > > This patch series adds generic support for parsing DT properties related
> > > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > > cleanups.  It is an evolution of the combination of [1] and [2].
> > >
> > > The DT bits look fine to me. How do you expect this to be merged? I'm
> > > happy to take it if arch maintainers can ack it.
> >
> > I had hoped you could take the series...
>
> My current thought is I'll take 2-5, 7 and 8 given that's what I have
> acks for and the others can be applied independently.

Note that Palmer did ack patch 6, so you can include it.

Russell: any thoughts about patch 9?

Thanks!

> > > > The series consists of 6 parts:
> > > >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> > > >      to avoid duplicating elf core header reservation later.
> > > >   2. Patch 2 prepares the visibility of variables used to hold
> > > >      information retrieved from the DT properties.
> > > >   3. Patches 3-5 add support to the FDT core for handling the
> > > >      properties.
> > > >      This can co-exist safely with architecture-specific handling, until
> > > >      the latter has been removed.
> > >
> > > Looks like patch 5 doesn't have any dependencies with the series?
> >
> > Indeed. So you can take it independently.
> >
> > > >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> > > >      riscv.
> > >
> > > I thought this should be applied for 5.14?
> >
> > Me too, but unfortunately that hasn't happened yet...
>
> Buried in the middle of this series is not going to encourage it to be
> picked up as a fix.

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
