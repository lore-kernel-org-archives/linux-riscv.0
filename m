Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A0AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Apr 2022 14:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQ5/OebXb/2O77OIXYKffo2SFK0lfzASV1CIBTp5h/8=; b=J+yr7vXdy4WiDQ
	ZVitWyCsMSjnTtVbfGoa/Wj4V9LdCRz6tnMFQvW/ywpVsMCoCGsskwmF5US6kOuJF2Ktlropnjs6U
	0wwXYX9q6p+Q5PgaFUNWduL2jbOKh9od9kfTU/wOGED502O5pYxBGffyizD7TSMdHjb0tPiNyrowa
	xfOqRDZbau2z5GEmoNrh7yq/RQgkngwx91TNgQlKdXUL9rv1VsoFdHv2F8hdV7OTmJJGIxlYLDgCI
	eUODC8rWXhiR828TgVTQXwEBWjsmhb7rGrZ9KiYxEEgkLiSCvkZvJGOkjyrZ772Q7Ki3vRlJ9qlV0
	W2AtMNCjiOMgEdvbqgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nizTf-009rbw-3h; Mon, 25 Apr 2022 14:14:11 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nizTb-009ra4-UZ
 for linux-riscv@lists.infradead.org; Mon, 25 Apr 2022 14:14:09 +0000
Received: by mail-lj1-x234.google.com with SMTP id l19so5391261ljb.7
 for <linux-riscv@lists.infradead.org>; Mon, 25 Apr 2022 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8D+pks1GFQ5YyPwAFgL3FkCx021NEMaCoEqCvexljR4=;
 b=o5yHSni7byMq9Mrb1tFx49HsuhpnGjLxECFuj4lPhHigsZkEfQ5XC+y9Q4kq+7AKxR
 LN981iJ5nTQXs1KWNB/9AnpmW/uzDr5TiomFJBA9v+FuJ81uwssrElWcB/flb4VWj5vr
 xoOhWzUbFs78dkNRXf5N7dbexgO64Ewws5ZntoktFq1VblsNLHgbahwlOKulQS0qOYc7
 VLLI3xbyny4aMSAcRozZ9hMIIjBkBsGG7pLzI5qTOwXq41J7knrxkNUiNK+FyVSJ6oXK
 jGCGCslHJauXbW+nkV6Qw5/zEGpqtmc6RoAE7z0/oGVW71IJ4zhaYJW5n8n81yBZXQ2H
 N5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8D+pks1GFQ5YyPwAFgL3FkCx021NEMaCoEqCvexljR4=;
 b=wTAYgXSObYeGQ9AKk3ejLB/+T+x6e+P4IuK71cLXqD5Haa2KOzxIWxlNXnkjhGpIC3
 9WbDa+kI/9T6XjvAUphV4iwEJ/h8tWC1RRK6zMs4seq/8qO4Ww0WbuRYfQASAWna1rSk
 SOhCqUNrAQPgRWY1TMectoJZQ9XA1a+jF3lsKAiHlO5+V98VEwxlqCKyMUX8bP4Kv0j3
 5vseVyQo8u5uizDFyABoBZ6wD/59ae/EvZgoQzs+f4TmMEsldF711bcfEZXotLg/lMgQ
 1P2BZHNeVgl2h63rS4PpgP7o1gPmE7yFSO7rdMgbPpdL6r0mZk52xWDNK2v6N6FGqf1t
 Bryg==
X-Gm-Message-State: AOAM533Zr29xmopF9CdlU6cChVaoFtu8PmBlamky7cjc6FxxCzQuR4xt
 RZ0uLHKO5zEeop53j9HjKV3C4rRAEeuKPUEiFQCThg==
X-Google-Smtp-Source: ABdhPJwCAqzqIHox5d9Fipy+SZTjtLhmdrSkjUgWcJvdgeg9P4Xd8L/xFYISPzRrvadDQs5OUppkb3ifg3SYQwhg6qI=
X-Received: by 2002:a2e:8799:0:b0:24f:ada:4b2d with SMTP id
 n25-20020a2e8799000000b0024f0ada4b2dmr5914438lji.260.1650896045459; Mon, 25
 Apr 2022 07:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220422211055.9278-1-palmer@rivosinc.com>
 <CAMuHMdV7d4XfStMiSmU3eZBb3mdHdsvqJZff358Rf3Cb-Kzx+Q@mail.gmail.com>
 <CAK9=C2WTY8+-98XuxRYTaRe4aVJufaB5wr35KRoTKEttUM7JzQ@mail.gmail.com>
 <CAMuHMdV4aZ1U2CGjSOSvFsq-rHKq34wyS-TMvR=7kX68YQHFjQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV4aZ1U2CGjSOSvFsq-rHKq34wyS-TMvR=7kX68YQHFjQ@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Apr 2022 19:43:54 +0530
Message-ID: <CAK9=C2X5qvWEwwMJK52+UFC8DJBDbZBPY0_iXVHdBA0Y5Ps19w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow the used to downgrade to sv48 when HW
 supports sv57
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_071408_023130_9123EE5D 
X-CRM114-Status: GOOD (  35.66  )
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

On Mon, Apr 25, 2022 at 7:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Anup,
>
> On Mon, Apr 25, 2022 at 3:14 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > On Mon, Apr 25, 2022 at 6:12 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Apr 22, 2022 at 11:42 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
> > > > Similar to the previous patch, this allows a dt-selected downgrade to
> > > > sv48 on systems that support sv57 in case users don't need the extra VA
> > > > bits and want to save memory or improve performance.
> > > >
> > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > ---
> > > > This is on top of the patches from Alex's set that I dropped.
> > >
> > > You mean "[PATCH v3 13/13] riscv: Allow user to downgrade to sv39
> > > when hw supports sv48 if !KASAN"?
> > > 20211206104657.433304-14-alexandre.ghiti@canonical.com
> > >
> > > For both: "DT describes hardware, not software policy"?
> >
> > It is possible that HW is designed to support both Sv48 and Sv39 but
> > there is some errata due to which Sv48 does not work correctly ?
>
> In that case, I assume the software has to disable Sv48 on its own?
> Fixed hardware should use a different compatible value, so software
> will know when the issue is fixed, and the feature can be used.
> How else is DTB backwards-compatibility supposed to work?

Usually, HW vendors will use different names for incrementally
improving implementations so they will tend to create separate
dts/dtsi files for newer implementations with some sharing via
common dtsi files.

>
> > We should allow users to downgrade the MMU mode, due to
> > their own reasons. In fact, users can also disable an extension
> > by not showing it in the DT ISA string.
>
> That sounds like a software policy, too.
> What is wrong with a kernel command line option?

The MMU modes are detected very early and even before the kernel
command-line is parsed.

> If you want it in your DTB, you can add it to chosen/bootargs.

If HW vendor describe complete details in DT and disables few
things in chosen/bootargs then it means there is some issue with
those things disabled via chosen/bootargs.

A HW vendor might never want to advertise broken extensions in
their implementation so the ISA string and various HART features
in DT will be set based on working functionality on real hardware.

Regards,
Anup

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
