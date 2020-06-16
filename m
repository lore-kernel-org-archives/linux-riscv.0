Return-Path: <SRS0=ePsx=75=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C64C433E2
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 08:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE2A2074D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2020 08:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g29/XKN6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y1zC8BcH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE2A2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xyM3Tp38UmkemihB3Xd2uNMAQGR+JNs/O828XRCE6Xs=; b=g29/XKN67gk7vdnpyVu1U7UiC
	PC62H527kA9K/mb86l8GX7bE5wsZjfKBxdbZgfHyhnvkTaZQ6XQ+ucbQKB0RGgXQKOdikKb8XKW4H
	ztWic2zHIC9Cpks7eo0F9IPBbp5tkfR4S4ME2IwbD945anj+w/pJoobsOJlve104AiPMeIVB76eO6
	rxfRFHqhIO8eK/ZTJYUop7oB62KxGA5Gp1E/hRvLmq9PIEBwpK64BetNdHaxjZpcIA5hxBLr5QtAm
	5q/hV7fr8dAfXHMG76AR6wRLbnqmvco3G2uqjEEGAD6ZiDBqmWruMPCjFyDmNcK64LUMxzK1rJcEt
	5weiuZ6BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl6lm-0006cT-4U; Tue, 16 Jun 2020 08:16:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl6li-0006bf-LB
 for linux-riscv@lists.infradead.org; Tue, 16 Jun 2020 08:16:32 +0000
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2884B2074D
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 08:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592295390;
 bh=zM0bjNs8fisP91Kce+QVAGhJeDSr7Rq/g+kEHGH1VNo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=y1zC8BcHYB5UOh/8AXGYMtfEwhXQ5UfZHXG1OYtVpMZMDROP3i2gx3roiLQAGttDv
 I948qG85GLYJnzPbRfF1ztdzRWzU+6vmpvLEcoP9jEVHqYca55kUXBNmf/BNQDKeJK
 +fdnDUbV5nxQMStoN0YEHVLDxPaHeH4ux4dIwjHY=
Received: by mail-ot1-f52.google.com with SMTP id d4so899440otk.2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Jun 2020 01:16:30 -0700 (PDT)
X-Gm-Message-State: AOAM5312gL9iZmwN92i4NV8PV1+wLlzS0m5FCuq7fT/4oNxVqtuG7d2U
 rUoJbsA1LukcFiyrdDgjkQ16saGjnxrY/xOXCsM=
X-Google-Smtp-Source: ABdhPJzEgdhWfPhyNgDCjzdpTHBrt2Mm2gVPfonS7qfRnMS8h+g4/1mnYJDFHD+/niYUHhVHX1hzvJVAOY6rmeGaE9c=
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr1469821oth.90.1592295389542; 
 Tue, 16 Jun 2020 01:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
 <20200422172414.6662-3-ardb@kernel.org>
 <CAMuHMdXZM7XYBt=2dJFJi+xxe2HOh43KzSkxGoMqaaC_kc_P-g@mail.gmail.com>
In-Reply-To: <CAMuHMdXZM7XYBt=2dJFJi+xxe2HOh43KzSkxGoMqaaC_kc_P-g@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Jun 2020 10:16:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH3HgmqrEct1ANNNZqb3R+YNpvp+TDkjF7b=1MYFtNa3g@mail.gmail.com>
Message-ID: <CAMj1kXH3HgmqrEct1ANNNZqb3R+YNpvp+TDkjF7b=1MYFtNa3g@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] efi/libstub: Make initrd file loader configurable
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_011630_716952_ADD59F4E 
X-CRM114-Status: GOOD (  18.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi <linux-efi@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020 at 09:55, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ard,
>
> On Wed, Apr 22, 2020 at 7:24 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > Loading an initrd passed via the kernel command line is deprecated: it
> > is limited to files that reside in the same volume as the one the kernel
> > itself was loaded from, and we have more flexible ways to achieve the
> > same. So make it configurable so new architectures can decide not to
> > enable it.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Thanks for your patch, which is now commit cf6b83664895a5c7
> ("efi/libstub: Make initrd file loader configurable")!
>
> > --- a/drivers/firmware/efi/Kconfig
> > +++ b/drivers/firmware/efi/Kconfig
> > @@ -124,6 +124,17 @@ config EFI_ARMSTUB_DTB_LOADER
> >           functionality for bootloaders that do not have such support
> >           this option is necessary.
> >
> > +config EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER
> > +       bool "Enable the command line initrd loader"
> > +       depends on EFI_GENERIC_STUB
> > +       default y
> > +       help
> > +         Select this config option to add support for the initrd= command
> > +         line parameter, allowing an initrd that resides on the same volume
> > +         as the kernel image to be loaded into memory.
> > +
> > +         This method is deprecated.
>
> So why the default y?
>

Hallo Geert,

Every time I try to disable something like this, someone pops out of
the woodwork to explain how the feature is so vitally important for
their highly bespoke and vertically integrated boot flow that it has
to be enabled by default for absolutely everybody.

But patches welcome :-)

