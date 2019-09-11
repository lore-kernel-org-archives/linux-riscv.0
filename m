Return-Path: <SRS0=3S6Q=XG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFD8ECDE27
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 07:22:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6D12089F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 11 Sep 2019 07:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NN5H/vxJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6D12089F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=laHXx3T5zUcbND9aYgQeylhtP7zuMsX0FzVr5B7OFU4=; b=NN5H/vxJv3Ae1t
	SW+NRKxOgVcoIhr/XAk3MGudddLIGjP4ln8KVC+RiqiNmAU7uOZSgWzphmQ8P2Wq8yAlAoV/yX7XN
	uwfcfozqvrIeW9+lJMuT1oJD6bG1z487RbxHKkmD8XP8py1gfaHJfgY4Tt0LR0HTShG067zbnE9CK
	t74bmwE5LrY+0+GH9sv6Sj8L3bEWzI4ZTCZXB+2Q3iKdDomBgtJyo4oaJFb7aXg4/S92ohcKjM8df
	vL9cTFb/VMZfmZu3I9Mw4ySghPPSOBPpw6ylW9J77ic5C89BGDrB8Fy3MxqiILVofb/zMc/tl3o36
	uawFaXwJl1ckjfmFGNQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7wxv-00006f-88; Wed, 11 Sep 2019 07:22:59 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7wxr-00005y-Ub
 for linux-riscv@lists.infradead.org; Wed, 11 Sep 2019 07:22:57 +0000
Received: by mail-ot1-f66.google.com with SMTP id n7so21599665otk.6
 for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2019 00:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RApwx5LDSAMD4iHD35F9JLH9Ye8FG1fZvq9Vj2OH05c=;
 b=pa5V3bQN5LoRd6vhIniKlXelAwU0m5rFREqtunIEltsGTt0JNFPDeFqy7CmF7iYl05
 2/94EXjMaPGGrsmS/Uckm0+PRo5kYbzfeofV9Qd76yWxfV9pfkjyP61ab50OpFFl61XV
 Mjv+od3Tr5OSIxXirDa+fPH6Uo1b2l6i4T3krg5Ev9ERvd6k5oUtynvXL1t0aJ6/Yf6n
 A9rBe0F5D5ti6ds8FqnuDIxwKfm3VbcY1wEbJIE3V0Stf/z5Cyj2esLzRiaA64V9OjbP
 kdeKX8EjkCRAq5pVVosuA3GkVtaXlc07oXDYCskGTk9UC3vTcDfTSZJbLmuHVJOsXXiM
 oJJw==
X-Gm-Message-State: APjAAAUNvSOkC4X5SFbUPNa2p3UskjYX7Cck/nulIygdByyIijwuPFJi
 HiZQN9ykpkohR8+ctSGyF2ofAagm33BjHdtDR6E=
X-Google-Smtp-Source: APXvYqzJ0kqmlruLmnYW1QIj2Hu8GhX9jPrW0LH/6teXZ2G+NSopwZNP7ZZ3+RNfu4CiEf2Q9K0h0oNBROYBb360kdE=
X-Received: by 2002:a9d:5a06:: with SMTP id v6mr8353187oth.250.1568186574782; 
 Wed, 11 Sep 2019 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1908141328440.18249@viisi.sifive.com>
 <mhng-4eded486-d381-4822-abc5-4023bf7ba591@palmer-si-x1c4>
 <87mugbv1ch.fsf@igel.home>
In-Reply-To: <87mugbv1ch.fsf@igel.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Sep 2019 09:22:43 +0200
Message-ID: <CAMuHMdX9tDqN4jMwMrUc-0zhYBo5gAHTbjwORCwB=3zVi6kvgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: Make __fstate_clean() work correctly.
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190911_002255_985243_A84D369C 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andreas,

On Thu, Aug 15, 2019 at 12:37 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
> On Aug 14 2019, Palmer Dabbelt <palmer@sifive.com> wrote:
> > On Wed, 14 Aug 2019 13:32:50 PDT (-0700), Paul Walmsley wrote:
> >> On Wed, 14 Aug 2019, Vincent Chen wrote:
> >>> Make the __fstate_clean() function correctly set the
> >>> state of sstatus.FS in pt_regs to SR_FS_CLEAN.
> >>>
> >>> Fixes: 7db91e5 ("RISC-V: Task implementation")
> >>> Cc: linux-stable <stable@vger.kernel.org>
> >>> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> >>> Reviewed-by: Anup Patel <anup@brainfault.org>
> >>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> >>
> >> Thanks, I extended the "Fixes" commit ID to 12 digits, as is the usual
> >> practice here, and have queued the following for v5.3-rc.
> >
> > For reference, something like "git config core.abbrev=12" (or whatever you
> > write to get this in your .gitconfig)
> >
> >    https://github.com/palmer-dabbelt/home/blob/master/.gitconfig.in#L23
> >
> > causes git to do the right thing.
>
> Actually, the right setting is core.abbrev=auto (or leaving it unset).
> It lets git chose the appropriate length depending on the repository
> contents.  For the linux repository it will chose 13 right now.

Does that depend on the git version?
For me (git version 2.17.1), it still uses 12 when using the auto setting.

Should we update Documentation/process/submitting-patches.rst
to increase to e.g. 16 (which is what I've been using for quite a while)?
When can we expect old 12 hexit references to start breaking?

Thanks!

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
