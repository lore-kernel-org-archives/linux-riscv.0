Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B122C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 11:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WHCklMCvAz2pglBevd6+FeP+tP3yswxejl2/MtKRRw=; b=hMMAdDNnTsvn5d
	D0ewRymYB8LxMXZ6yB+uLK8EP+ozfoJYbvzs1HhWInotlXEUCgPt0xZfMjnS6GZwZjVY3jdKH3OMa
	uV5W4FbH1h7+Gz6jc1jKI/WmLnMDW3Fp6Rn/I79cQTzMW4wKSjq7tJU+PIh8GfwYvOgrV5lUIjqq9
	O/4q8oxWiuWORvQ1EIsgzku1nAauRsQ4DYZ8u36tibpof7JVVkPNHJEc4I6SrcAh21gARxgaPdwtx
	4xMlxHnDp1ucbDnlbTnSUbdTAy6aB4QqpjBB+bCeWL1CB470juH41aCPc2toWwtF4Zm/bPviBlu9v
	FRpro2p7LNy4L+YIy8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIme-006oD0-Dk; Wed, 16 Feb 2022 11:47:44 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKImc-006oBZ-13
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 11:47:43 +0000
Received: by mail-il1-x135.google.com with SMTP id p11so1237547ils.1
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 03:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zQ426YIiyZCGwhq/0eYvVXz0if/mrj+i3L6Ot4o8TMs=;
 b=JIL+GG0b+7KSzYQSWUZZrMWM3fw2AyPiHDkjuA2EE9M+LKX4rQMVlT/wknhTiJ0WuE
 WgtSP9X+ECI07ds8ZFCfiOxxa0tWz5YJqgILqYLFshVs5FKr6VQsirwNzB5I7eAnI3Ig
 wqXDQOThdIHLVztqbp7z6HFe3vmNT7LdplFQCVoe2hSlFDsWCZjFZ+VkRaEVX0xqj8Kt
 PkS6w+CtiZvhemwHv4GCRpcl2OOr+PgCG8STri+twucrasQLiCTBh45oe/TbEfKEidJn
 kEg0d4Cdb8Q5OtxUDu9/rTALWOlq2q6F5dIdBz2l1xn4oVlZEIuguXidsluQqVScuo62
 yL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zQ426YIiyZCGwhq/0eYvVXz0if/mrj+i3L6Ot4o8TMs=;
 b=lZ75QdskMtYRXlvnSsHAD5Ufl6RM2nhBgPpPquNma9QGkzMq5zJ0iZ32rWIQ69cdAl
 Av59bJ9dqYKEvtKa67q1ugF6o+vdgeXvwvFXQlhRp/O0Ugk4v3pL6BaQtfEhwfc0dpf8
 oHoizqmQuguTyohGLVi4DEGLornX1Jgeapkg3aVbu/ZPSlN8QTjmHuotw05P1jQE37ip
 brvCE0EO5l515xccM4u9FHdQ+iCJCoDiXJWyrZ4ndJ+plTybWfEp2LcUYERFBVkT3fPQ
 zAKGqg1H7Rgp6u9UqCZHSfKOlkEk0qEfpsAFkSAcruKOlJajD8ECh84gefYEtVA2ymU6
 o0QA==
X-Gm-Message-State: AOAM531RY9e+Ve2xJflmLkTZwVJgxGdG7ZNvxTR4xsRNHcs2llR3mO/X
 Mprk7y+2JTekD8bpXwx7Tvx8dS15qkutKP0Y0iVoCg==
X-Google-Smtp-Source: ABdhPJxBxcojfZQiGRhL1YR5+APqlUxK3g0mHoFIko75FR8EFALv0P+mJQ05ENPC4Ur2do36wutUQVXdcawoMYGoIP8=
X-Received: by 2002:a05:6e02:1bc5:b0:2be:ebbe:1879 with SMTP id
 x5-20020a056e021bc500b002beebbe1879mr1528527ilv.127.1645012059881; Wed, 16
 Feb 2022 03:47:39 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
 <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
 <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
In-Reply-To: <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 16 Feb 2022 12:47:28 +0100
Message-ID: <CANp29Y4ujmz901aE9oiBDx9dYWHti4-Jw=6Ewtotm6ck6MN9FQ@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034742_104889_6D059E29 
X-CRM114-Status: GOOD (  37.28  )
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

On Wed, Feb 16, 2022 at 11:37 AM Aleksandr Nogikh <nogikh@google.com> wrote:
>
> Hi Alex,
>
> On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >
> > Hi Dmitry,
> >
> > On 2/15/22 18:12, Dmitry Vyukov wrote:
> > > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > > <alexandre.ghiti@canonical.com> wrote:
> > >> Hi Aleksandr,
> > >>
> > >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> > >>> Hello,
> > >>>
> > >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> > >> That's a longtime, I'll take a look more regularly.
> > >>
> > >>> days now because the compiled kernel cannot boot. I bisected the issue
> > >>> to the following commit:
> > >>>
> > >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> > >>>
> > >>>      riscv: Fix asan-stack clang build
> > >>>
> > >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > >>> enabled. In the previous message syzbot mentions
> > >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > >>> For convenience, I also duplicate the .config file from the bot's
> > >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > >>>
> > >>> Can someone with KASAN and RISC-V expertise please take a look?
> > >> I'll take a look at that today.
> > >>
> > >> Thanks for reporting the issue,
> > >
> >
> > I took a quick look, not enough to fix it but I know the issue comes
> > from the inline instrumentation, I have no problem with the outline
> > instrumentation. I need to find some cycles to work on this, my goal is
> > to fix this for 5.17.
>
> Thanks for the update!
>
> Can you please share the .config with which you tested the outline
> instrumentation?
> I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
> but it still does not boot :(
>
> Here's what I used:
> https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138

Update: it doesn't boot with that big config, but boots if I generate
a simple one with KASAN_OUTLINE:

make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
./scripts/config -e KASAN -e KASAN_OUTLINE
make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

And it indeed doesn't work if I use KASAN_INLINE.

>
> --
> Best Regards,
> Aleksandr
>
> >
> > Sorry about the delay,
> >
> > Alex
> >
> >
> > >
> > >
> > >>> --
> > >>> Best Regards,
> > >>> Aleksandr
> > >>>
> > >>>
> > >>> On Tue, Jan 18, 2022 at 11:26 AM syzbot
> > >>> <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
> > >>>> Hello,
> > >>>>
> > >>>> syzbot found the following issue on:
> > >>>>
> > >>>> HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
> > >>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
> > >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
> > >>>> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > >>>> userspace arch: riscv64
> > >>>>
> > >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > >>>> Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> > --
> > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/a0769218-c84a-a1d3-71e7-aefd40bf54fe%40ghiti.fr.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
