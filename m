Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5E7C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 08:59:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DE06113C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 08:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0DE06113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TkIfbmcHdqo16lt2IXUt4vRTLlb51k2wqQoF+kjDopA=; b=O//YBooNE4GNIwu9wyK7rOKHG
	gwICc5wI9WZyHaDuFD/EZ9454sch4YFFYp/wyDmjXxxxLrl8aPzejIk6dtSxomSWPo7ABA8bU8SlC
	fMehpOcdRR9JSaK0q94bT2/ZLFJOEDAk1JpTRC8UoCdDHH5uTfMc8IPZJm2Bap7mk8hB00q/NGbOQ
	lCvhI8ng3X0chjkdcrK/ZRdgRIqy1gLWX/+KeS1JwBBq4FzPVmtMV5cxmJh0nuq2iYJqsLYfTAICz
	ll+0c/pFriCaAgFlUcoWePbZnm+Pf1dOF7ZaqXfU2wD54oY5V++jGppR3WkZxy+Wr2vh+RH34LzUW
	8ETexVmEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSFeG-00CQT3-Hu; Fri, 02 Apr 2021 08:59:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSFeB-00CQRK-Ry
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 08:59:22 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 184so4962946ljf.9
 for <linux-riscv@lists.infradead.org>; Fri, 02 Apr 2021 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HywOIhb5prU0SvgCATKvH+ZBrrrzKF5XQkM0MZqr0LA=;
 b=K58phw+IpQ//OZE32Gwyp+hDyT7tu3gNVxEMtandIn2kAiffLXdmEdS04bVlL12zRL
 3Ll05xL2x9/Gk+5wivRKbqrgR3LpQX0vyVTpJ69ZwbzSUeBmc2PKqPI6MKznUgBhI/Z5
 6ei4DP+DUVX4r6T4Cb+PdXQWv0olcT9mOewLrjdl4pA2deoUzXoSDrNBwAImjMo8/q/v
 RlMq/+aPVcFbNJQjRQ7XrCzv6wcTnjmm2dpsciA1HKIKMp+qf36tyl4KBeDJIK1iwFCc
 CBIe9O1zsPBiX7cYdtK+nVIP3tr2MzJS7DIaCW1+LORojLEFSCg9UKN1WXHWls0FqOkm
 Ks2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HywOIhb5prU0SvgCATKvH+ZBrrrzKF5XQkM0MZqr0LA=;
 b=ujiAfejrVFUxo8AXvOVtC7vhRqhsy5ri4ETbtH7FA+fuBN3GpPujhgV8Rw9ZSNYSNC
 4TM1A56qnMUiHdPMYERKHmSa+ZlIWtWe7oV1CSl6HfxQrzslWYeGL/E5bF+/hYDK51j1
 bkeS1jUrAQ0jcv0htO1saPZWLY9h2ILz2vxVxWs+7927licZWNQZHRJ7KbwQol9w9jff
 LQQE11GlbEBltkDi1rUxWyCzNqQrcjuJpZR+ajv/bkWGIvlxBkRLp4z9qgOiBXaV/ZMG
 I3xAKet6gp9W6PCreA54HM3h8p5rRFp9JjLp7+BrT/SA3xj+4M+HLDQKe0VFbP9e0nGV
 Z+2Q==
X-Gm-Message-State: AOAM530JL3IdEGygnWaHP+ue7Qh3+6QG/vpQF2aIvYWrA9GziiMQ/uXl
 gXbcyOHCef5dQlAezUtEf5OYdOkAhXuwrt4cPGE=
X-Google-Smtp-Source: ABdhPJw8cpfvx6+g3xC+Ja1aMlvho4dmtsu+dGUtAgfwKzdxVgHhaVnDtPlWS7DxXgJ74G2bNz/qvwTyG1+eZ5ifgLo=
X-Received: by 2002:a05:651c:384:: with SMTP id
 e4mr7528065ljp.500.1617353956993; 
 Fri, 02 Apr 2021 01:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2103302221590.18977@angie.orcam.me.uk>
 <mhng-08e5e4fb-8a42-4f7b-8ceb-ff549784100e@palmerdabbelt-glaptop>
 <CACT4Y+Z0PaAuUFrOBenztWkw8OV=J-qaeD1FASPM4ufcLg5a5A@mail.gmail.com>
In-Reply-To: <CACT4Y+Z0PaAuUFrOBenztWkw8OV=J-qaeD1FASPM4ufcLg5a5A@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 2 Apr 2021 11:58:40 +0300
Message-ID: <CAEn-LTqTXCEC=bXTvGyo8SNL0JMWRKtiSwQB7R=Pc4uhxZUruA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, macro@orcam.me.uk,
 Alex Ghiti <alex@ghiti.fr>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Linux API <linux-api@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_095920_544949_1015C8C2 
X-CRM114-Status: GOOD (  35.20  )
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

On Fri, Apr 2, 2021 at 11:43 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Apr 2, 2021 at 6:37 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Tue, 30 Mar 2021 13:31:45 PDT (-0700), macro@orcam.me.uk wrote:
> > > On Mon, 29 Mar 2021, Palmer Dabbelt wrote:
> > >
> > >> > --- /dev/null
> > >> > +++ b/arch/riscv/include/uapi/asm/setup.h
> > >> > @@ -0,0 +1,8 @@
> > >> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > >> > +
> > >> > +#ifndef _UAPI_ASM_RISCV_SETUP_H
> > >> > +#define _UAPI_ASM_RISCV_SETUP_H
> > >> > +
> > >> > +#define COMMAND_LINE_SIZE 1024
> > >> > +
> > >> > +#endif /* _UAPI_ASM_RISCV_SETUP_H */
> > >>
> > >> I put this on fixes, but it seemes like this should really be a Kconfig
> > >> enttry.  Either way, ours was quite a bit smaller than most architectures and
> > >> it's great that syzbot has started to find bugs, so I'd rather get this in
> > >> sooner.
> > >
> > >  This macro is exported as a part of the user API so it must not depend on
> > > Kconfig.  Also changing it (rather than say adding COMMAND_LINE_SIZE_V2 or
> > > switching to an entirely new data object that has its dimension set in a
> > > different way) requires careful evaluation as external binaries have and
> > > will have the value it expands to compiled in, so it's a part of the ABI
> > > too.
> >
> > Thanks, I didn't realize this was part of the user BI.  In that case we
> > really can't chage it, so we'll have to sort out some other way do fix
> > whatever is going on.
> >
> > I've dropped this from fixes.
>
> Does increasing COMMAND_LINE_SIZE break user-space binaries? I would
> expect it to work the same way as adding new enum values, or adding
> fields at the end of versioned structs, etc.
> I would assume the old bootloaders/etc will only support up to the
> old, smaller max command line size, while the kernel will support
> larger command line size, which is fine.
> However, if something copies /proc/cmdline into a fixed-size buffer
> and expects that to work, that will break... that's quite unfortunate
> user-space code... is it what we afraid of?
>
> Alternatively, could expose the same COMMAND_LINE_SIZE, but internally
> support a larger command line?

Looking at kernel commit history I see PowerPC switched from 512 to
2048, and I don't see complaints about the ABI on the mailing list.

If COMMAND_LINE_SIZE is used by user space applications and we
increase it there shouldn't be problems. I would expect things to
work, but just get truncated boot args? That is the application will
continue only to look at the initial 512 chars.

https://linuxppc-dev.ozlabs.narkive.com/m4cj8nBa/patch-1-1-powerpc-increase-command-line-size-to-2048-from-512

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
