Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AD4C2B9F4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 22:01:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D84E60041
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 22:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D84E60041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bF2lDkCI/1AfLNTu5O0Dm74mnCgk8eYXVky76Idc09c=; b=J3k4+Io7lxc1K7
	JpG9PfAt7U/Ln8If7Lu9gkZU8SIR8ZSkxZ8OW/6XQAgovOg8b9cp92ZdXxOTaykfdTy4Uw0ENEz4X
	jqKbxiijXdBErHJJnWfr9VG3LWnTvMQiAYWO3czAMBQDrDht6NHrG2ny2t6aS9MAdAyIg7XAVev1I
	uaX1Lz1z01d0KefDRcT5K+2BcjxGN9jg0eIF6BKYHJ240C86DoeVa79qq+EcdJq8gaUYZltiiDocr
	wxljbaIlaTEn0Ropn4Vhy4liYTCWkYAjJWwT6nf3lJOh1cgBlusVbOl7KF+fcALkUWSqKrD53g1W/
	2LSCT3fLUgdSfImHXyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvoRr-008aOy-Po; Tue, 22 Jun 2021 22:00:47 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvoRo-008aOF-Th
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 22:00:46 +0000
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by linux.microsoft.com (Postfix) with ESMTPSA id AC28B20B83F8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 15:00:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AC28B20B83F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1624399242;
 bh=t0zy+aEJbbWfr+b93GwBhrR1JhR/zUqTNz5gXaWTwg0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SthROkxDDu/QhydPs+YRpFqCj5N7QPI564vrNLrGm2nU8AvseLaV1Hpft4Ul4nWkb
 jU9o73zefEx59IGK6yNySyKHHfaJtm+q76mAUOd4OS9rKIUBo8HEinBp76qGvYa+qL
 8ntS0oZORP+7/XTu1pGZr7lINneFoErlFY+KFfCg=
Received: by mail-pj1-f46.google.com with SMTP id k5so263008pjj.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 15:00:42 -0700 (PDT)
X-Gm-Message-State: AOAM532EsCHzLj94qp4S77ZOiaaJuYQfssMgyGZ840tkkul0p0mjb38o
 aXLoKxPnDpLx5hSACOyisU4big+QGr+kI4GgWeI=
X-Google-Smtp-Source: ABdhPJyv1SBZhrTityd2+MnaNiG0YScqu6u6GGO+94AaR/jITunJ/1zxDMO/c+aBvN9vVivCQaTUKtAo1Zcegix/+ug=
X-Received: by 2002:a17:902:e9d5:b029:124:926:7971 with SMTP id
 21-20020a170902e9d5b029012409267971mr13690483plk.19.1624399242143; Tue, 22
 Jun 2021 15:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-2-mcroce@linux.microsoft.com>
 <YNChl0tkofSGzvIX@infradead.org>
In-Reply-To: <YNChl0tkofSGzvIX@infradead.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Wed, 23 Jun 2021 00:00:06 +0200
X-Gmail-Original-Message-ID: <CAFnufp2UaAEq8FCxSeX5xCOZYu4wJ783gy35RZF-D626XiF8MQ@mail.gmail.com>
Message-ID: <CAFnufp2UaAEq8FCxSeX5xCOZYu4wJ783gy35RZF-D626XiF8MQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] riscv: optimized memcpy
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Emil Renner Berthing <kernel@esmil.dk>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_150045_112760_FDC2B2E0 
X-CRM114-Status: GOOD (  29.35  )
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

On Mon, Jun 21, 2021 at 4:26 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Jun 17, 2021 at 05:27:52PM +0200, Matteo Croce wrote:
> > +extern void *memcpy(void *dest, const void *src, size_t count);
> > +extern void *__memcpy(void *dest, const void *src, size_t count);
>
> No need for externs.
>

Right.

> > +++ b/arch/riscv/lib/string.c
>
> Nothing in her looks RISC-V specific.  Why doesn't this go into lib/ so
> that other architectures can use it as well.
>

Technically it could go into lib/ and be generic.
If you think it's worth it, I have just to handle the different
left/right shift because of endianness.

> > +#include <linux/module.h>
>
> I think you only need export.h.
>

Nice.

> > +void *__memcpy(void *dest, const void *src, size_t count)
> > +{
> > +     const int bytes_long = BITS_PER_LONG / 8;
> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> > +     const int mask = bytes_long - 1;
> > +     const int distance = (src - dest) & mask;
> > +#endif
> > +     union const_types s = { .u8 = src };
> > +     union types d = { .u8 = dest };
> > +
> > +#ifndef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
> > +     if (count < MIN_THRESHOLD)
>
> Using IS_ENABLED we can avoid a lot of the mess in this
> function.
>
>         int distance = 0;
>
>         if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
>                 if (count < MIN_THRESHOLD)
>                         goto copy_remainder;
>
>                 /* copy a byte at time until destination is aligned */
>                 for (; count && d.uptr & mask; count--)
>                         *d.u8++ = *s.u8++;
>                 distance = (src - dest) & mask;
>         }
>

Cool. What about putting this check in the very start:

        if (count < MIN_THRESHOLD)
                goto copy_remainder;

And since count is at least twice bytes_long, remove count from the check below?
Also, setting distance after d is aligned is as simple as getting the
lower bits of s:

        if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
                /* Copy a byte at time until destination is aligned. */
                for (; d.uptr & mask; count--)
                        *d.u8++ = *s.u8++;

                distance = s.uptr & mask;
        }

>         if (distance) {
>                 ...
>
> > +             /* 32/64 bit wide copy from s to d.
> > +              * d is aligned now but s is not, so read s alignment wise,
> > +              * and do proper shift to get the right value.
> > +              * Works only on Little Endian machines.
> > +              */
>
> Normal kernel comment style always start with a:
>

Right, I was used to netdev ones :)

>                 /*
>
>
> > +             for (next = s.ulong[0]; count >= bytes_long + mask; count -= bytes_long) {
>
> Please avoid the pointlessly overlong line.  And (just as a matter of
> personal preference) I find for loop that don't actually use a single
> iterator rather confusing.  Wjy not simply:
>
>                 next = s.ulong[0];
>                 while (count >= bytes_long + mask) {
>                         ...
>                         count -= bytes_long;
>                 }

My fault, in a previous version it was:

    next = s.ulong[0];
    for (; count >= bytes_long + mask; count -= bytes_long) {

So to have a single `count` counter for the loop.

Regards,
-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
