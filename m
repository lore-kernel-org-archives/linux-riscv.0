Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC41C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNKK193xTw9ktlSnmQCoHkzDvHmaxwYrlZmBY9XR0K0=; b=tLj7mQfx+6Wzgm
	Jhc0YFQxu9Kec919o3rmShwAoMhYX3wz457f7vR8FwfIS+DlgieuTqSvBMaK/b8sPVBzlQhGb030v
	Oa7rWfdZlBmJGedAkQ/n/U9zZqYAWZ01Iu5UnUNZyDzsxffsw8UDhyRtOcnA8TV5BSHlVyg5KBwuD
	tClPATzPL9LgmgXrkLC/QLEM7GrNs/qJdACBDsntfifItDYLAhzYEm6zewfMPcN/sxmIYX+hVe1sY
	Lr47PLPtgV3QaHlmetxR87ETKSOkLBJzombyqZcH07GWkl4jCUz2LFqfa0684SWNRrzIpz6FuPOJF
	/TVy13OydXX/RycAPrgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHh5-006ZuA-Ry; Wed, 16 Feb 2022 10:37:55 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHh2-006Zrc-8t
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 10:37:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id s1so1780142ioe.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Feb 2022 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pN9JYDOrzujGng7ZER6xyWI6CgQWXz9WnMXVqwu2nsA=;
 b=hRGOhZEqubA2zsEfdxpguDnmajVfN/3uyhhdGBVRzjaozDyIBwu5lVCqnBv1h+HCv5
 F2SIIdcLfAKqJx5gYKoHxlv/PwwxJH7qA4exu02oEcjBqCYPcEoDVxf9FN1F2AuMrEn2
 zqKMXSAIZ1nW90AYX0nnIOUMza4o1j+brDI8L7DXHMDRRIoopzakZnHHNWE/hgCaSXGz
 WJzdnB/4S8msDUfUweGcT+tjH8K9IhZsLxvopded+LTIE7gl+qXsVcnwgwpQU+7i3Qbr
 83xkaF/pp5JaJ+1uoA8UvBfwmU7e2+z4pwL1r/hWZ9qg6dDtle3Wx4C2UAoDFORlDISN
 rPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pN9JYDOrzujGng7ZER6xyWI6CgQWXz9WnMXVqwu2nsA=;
 b=JsGgwbYbAZ4I2rNwzQXPCxB0QJpdEL4FjtxAPZKQqOyLpaLQGErzarUOIEXBFkq1JF
 q66/ucRneF9UMUUy7SNhspAtUinmbnOq1PtPhH2VkgGLo7VDPaOtBdNe3TlSxOO/4uhl
 dxDps+5hTUTnCqKpfpdH6uYI8Sm2SmBlLSFs5yFRcEd2e9wTphHAt+uiHVL7O6kPr4fD
 FzB5xvUoFarY4wpDwaFjV7kQolpR0TPpkS66CaGFo/B99UcdTyD7a63SV5wxZwb18655
 176k7oV/DK8fWiTuMsy99s77kgBMGqHqjNcSTv4eb9+QONR1IYV74/S71zvk5UGOcxpU
 C28w==
X-Gm-Message-State: AOAM530228eEsB00HCiTM188FBPAaw6V51MUv0kHCfgt4k31I1xnysCA
 0XHwuaD7sXrthe5avRZAq0foYL8b33ZMLFgkDvb5nQ==
X-Google-Smtp-Source: ABdhPJwldGUf7FvIQ7rrVP0SPiqSh3RoVrBRg7SghIXsHqFA00zV2YWfeC99XNB6QCSfxyQoDA+WrSW4CcOIetUOwM0=
X-Received: by 2002:a02:6308:0:b0:30e:7e14:848b with SMTP id
 j8-20020a026308000000b0030e7e14848bmr1218612jac.139.1645007867380; Wed, 16
 Feb 2022 02:37:47 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
 <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
In-Reply-To: <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 16 Feb 2022 11:37:36 +0100
Message-ID: <CANp29Y4WMhsE_-VWvNbwq18+qvb1Qc-ES80h_j_G-N_hcAnRAw@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
 linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_023752_351750_F41C1310 
X-CRM114-Status: GOOD (  31.35  )
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

Hi Alex,

On Wed, Feb 16, 2022 at 5:14 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Hi Dmitry,
>
> On 2/15/22 18:12, Dmitry Vyukov wrote:
> > On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> >> Hi Aleksandr,
> >>
> >> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> >>> Hello,
> >>>
> >>> syzbot has already not been able to fuzz its RISC-V instance for 97
> >> That's a longtime, I'll take a look more regularly.
> >>
> >>> days now because the compiled kernel cannot boot. I bisected the issue
> >>> to the following commit:
> >>>
> >>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> >>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> >>> Date:   Fri Oct 29 06:59:27 2021 +0200
> >>>
> >>>      riscv: Fix asan-stack clang build
> >>>
> >>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> >>> enabled. In the previous message syzbot mentions
> >>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> >>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> >>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> >>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> >>> For convenience, I also duplicate the .config file from the bot's
> >>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> >>>
> >>> Can someone with KASAN and RISC-V expertise please take a look?
> >> I'll take a look at that today.
> >>
> >> Thanks for reporting the issue,
> >
>
> I took a quick look, not enough to fix it but I know the issue comes
> from the inline instrumentation, I have no problem with the outline
> instrumentation. I need to find some cycles to work on this, my goal is
> to fix this for 5.17.

Thanks for the update!

Can you please share the .config with which you tested the outline
instrumentation?
I updated the syzbot config to use KASAN_OUTLINE instead of KASAN_INLINE,
but it still does not boot :(

Here's what I used:
https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138

--
Best Regards,
Aleksandr

>
> Sorry about the delay,
>
> Alex
>
>
> >
> >
> >>> --
> >>> Best Regards,
> >>> Aleksandr
> >>>
> >>>
> >>> On Tue, Jan 18, 2022 at 11:26 AM syzbot
> >>> <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
> >>>> Hello,
> >>>>
> >>>> syzbot found the following issue on:
> >>>>
> >>>> HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
> >>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
> >>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> >>>> dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
> >>>> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> >>>> userspace arch: riscv64
> >>>>
> >>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >>>> Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/a0769218-c84a-a1d3-71e7-aefd40bf54fe%40ghiti.fr.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
