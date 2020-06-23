Return-Path: <SRS0=OENr=AE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA21C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:10:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC2B2073E
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w76G50hR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC2B2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fQGV3K6YVfEfoTYa6xKgxmKN6tkn8KxVonFZTBagX1A=; b=w76G50hRNQ6/9GjuTqrBEWJs/
	DaU9781xYKW0/BZ8foE9z07kQqXHUL6MadyYSilqKXh4NYWcoKAUh2eYynUKIgYUpDwM2hv6W1qrS
	5vvllxty2jz6sTrHljhfRYD9khNuFpzaQxqXP+bcETO2Olw/DCQJXfpvVz807UpAKpY6lMU42dcs7
	B5PBGqMW3hT8PAD74VI0x8aEU3oW+EqjGLXx5LIoik02C2jbGHH1/oO7f2uUjOVG1KPghU7r+9dlW
	OXOnxxjLiXt5Tt3f7PXYI91R0Ba6fZVhjLjG55LNh9a6MusDHuRb/5mxbwo06qMla0FCfnIw6ChfJ
	6685oyvdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnkZW-0008MC-Qa; Tue, 23 Jun 2020 15:10:50 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkZU-0008L4-IP
 for linux-riscv@lists.infradead.org; Tue, 23 Jun 2020 15:10:49 +0000
Received: by mail-oi1-f193.google.com with SMTP id x202so19130226oix.11
 for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2020 08:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3hP5oHCaXN75NyHCf5KFlr6OfUoup3sO+AZV8gc4Ew=;
 b=AwwqrZ96S5OsliRlAjISpNC0ppVEeNOxedv/XNfaYlLdMVPraRLDevDtVGXihe60Ny
 2E8L1hlc3vuXhX7g/1rSTgvnYw5lnva/DYVdyBpN0iFpB2HOeUj2rbmYqiGRX3bSCest
 v6u1zO8DOetiQ0OhQZ1n6+EpTcc2yaPnP3eHz1WmYBq2/MH5PHderSXyQOVQlmvqP6C3
 p7vosinGO9I8n0yymbRNwPfbWDpO/+QWMvwU6lMV+VFuOgkbDJ/8fI9m8JT6hmRQ+PlQ
 Ejkq5asC1JCDzM9kiqH6qYnfNML71tIW8Uld0nsjTcEw32lKWBeL5yI/xiC6dTPvGL46
 LJ9A==
X-Gm-Message-State: AOAM533wKoFc5Yw5uMXjUtyGVslelBqmYpMouV2k+brqHdK8N6ohH1o9
 D5ZY89ROdgy7CJWXC6IgKBhq5L4pi7X3u2VViBA=
X-Google-Smtp-Source: ABdhPJyMkETqC0ecO+nYMKp/yAnXV+zZmpZB18C1F0vSusrvzuvB6gCWdi/H0Rr7FMuveFd3rDJZddXRbL/a30K67so=
X-Received: by 2002:a54:4006:: with SMTP id x6mr16000968oie.148.1592925047111; 
 Tue, 23 Jun 2020 08:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172414.6662-1-ardb@kernel.org>
 <20200422172414.6662-3-ardb@kernel.org>
 <CAMuHMdXZM7XYBt=2dJFJi+xxe2HOh43KzSkxGoMqaaC_kc_P-g@mail.gmail.com>
 <CAMj1kXH3HgmqrEct1ANNNZqb3R+YNpvp+TDkjF7b=1MYFtNa3g@mail.gmail.com>
In-Reply-To: <CAMj1kXH3HgmqrEct1ANNNZqb3R+YNpvp+TDkjF7b=1MYFtNa3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Jun 2020 17:10:34 +0200
Message-ID: <CAMuHMdVjKQdZ=mMds_h+=ZOZTUZyf34Lu99xjyavtEG_mgRwUQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] efi/libstub: Make initrd file loader configurable
To: Ard Biesheuvel <ardb@kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hoi Ard,

On Tue, Jun 16, 2020 at 10:16 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Tue, 16 Jun 2020 at 09:55, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Apr 22, 2020 at 7:24 PM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > Loading an initrd passed via the kernel command line is deprecated: it
> > > is limited to files that reside in the same volume as the one the kernel
> > > itself was loaded from, and we have more flexible ways to achieve the
> > > same. So make it configurable so new architectures can decide not to
> > > enable it.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Thanks for your patch, which is now commit cf6b83664895a5c7
> > ("efi/libstub: Make initrd file loader configurable")!
> >
> > > --- a/drivers/firmware/efi/Kconfig
> > > +++ b/drivers/firmware/efi/Kconfig
> > > @@ -124,6 +124,17 @@ config EFI_ARMSTUB_DTB_LOADER
> > >           functionality for bootloaders that do not have such support
> > >           this option is necessary.
> > >
> > > +config EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER
> > > +       bool "Enable the command line initrd loader"
> > > +       depends on EFI_GENERIC_STUB
> > > +       default y
> > > +       help
> > > +         Select this config option to add support for the initrd= command
> > > +         line parameter, allowing an initrd that resides on the same volume
> > > +         as the kernel image to be loaded into memory.
> > > +
> > > +         This method is deprecated.
> >
> > So why the default y?
>
> Every time I try to disable something like this, someone pops out of
> the woodwork to explain how the feature is so vitally important for
> their highly bespoke and vertically integrated boot flow that it has
> to be enabled by default for absolutely everybody.
>
> But patches welcome :-)

Done
https://lore.kernel.org/linux-efi/20200623150935.32181-1-geert+renesas@glider.be/

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
