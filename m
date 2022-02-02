Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E4C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 13:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBTmVJr0yF54F6mc2UYbpW/nlQZhte1YbLpyZVHbp9I=; b=fxiTIUC2dAy0nx
	u8+acZWuaC891/+Ru6VNY2jo5LVRPsbEIR5DAzPjbWtBKgB6sT8isseQIbyoDAtueBWvjaXzXoS13
	V+6dzsjH9DVM81WS6JQ0sBdOnHYt3LTeIVgN4D3DY04GemS17NCvwtMfBHvhpICNFijOejChuHrvM
	CnKRHiNk5rfDOWgfiWz5f05SmgfuSC9xmKpVFTW91nPiTZURaPFJXBhfV+C2Y8bP5g6Ai+M1oWE8R
	lnYM6HU4pV6S2w/8Ko/pVCvrAMwxDxwsJpo9EyPku6ds049UQOzMZEage3cxxQiTC7CM9AbSAR4cX
	Fw5j6cwUw9/EOw4Uz9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFFXJ-00FKWK-Cg; Wed, 02 Feb 2022 13:19:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFFXG-00FKUj-8p
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 13:19:00 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F5353F07D
 for <linux-riscv@lists.infradead.org>; Wed,  2 Feb 2022 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643807929;
 bh=snnqrCI4qkz8Hro6Gqsu3aM3hUykyWW5o1MMGnMsu4c=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=BMuX1U50NYei+gExcEJCwUPseP/qvVfvdviixjVLhklBL9h1ksUyYHk2qJ4D9yGGr
 o3T3bpjSS7nUJFgbFS6wuUfO5Be914irJivSc8Bpyfi3crLJHUhC7QN6g+RN7knLkg
 ex0onBLxNzSdy9tYGUpEyjA84u0/FyVgZAlPqnYqb5Emf5FNRXL7kZwKzI9yf3iaHH
 CG0VODGcJh7ACIiJSwkygsi2dvaonv8PcDD3HQYdgyXrxlFPKY26LPRTPCXWvJpYbE
 wWIEY1YHR6YTtWKz1Cm/ZRKMAM6jxLZrIn4cMODmyGqcew2xWqlMWA5izJmxHf0qKd
 G9GpjXiikPRGA==
Received: by mail-ed1-f69.google.com with SMTP id
 bc24-20020a056402205800b00407cf07b2e0so10427719edb.8
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 05:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=snnqrCI4qkz8Hro6Gqsu3aM3hUykyWW5o1MMGnMsu4c=;
 b=0hKF9+vD/uQuTuURE9lFEH7Csk9h8dEIJIx0mwJ+qYJ3gDIrcFR0WHNBmowkoQIRZm
 VcG/9om8l713ex8FatRBbhIiBvP87EOUwYD4j0rNMEhcKD4NAXXF9z4HksO6dtfSNQDF
 6pB9GVc0IkxcmT8qpj30+9XLJLcrURPodAQwU86tTvdSHKTTizmvoFT5Z75DiTiMpI6U
 Xq5czdPubuJDp/NSNYBGhdpPD3l7h5g9GxE4hSg0gIXaatfmPD6BInd4is4UyNdxNjPk
 UibR2WREHkGo4xhrD6HZ0uHj6ApQXqlpOeL1uCugfLRJ3/8Tze+NhNOcBbPwaS5U7vCO
 oBdw==
X-Gm-Message-State: AOAM530zesqRlSS+AkOqcKslDLylZ8BV3B07lT2UQ7MSuXKN2o81938Q
 a6+RYCTp+aPL1zUWNmvBvmQQbr2L7Fa0EZlPA0O2OtRVwj5d2FvXZKmIhBSMDYS+1OhNtY9405s
 iMZMqpGYQMIgh6+v23N1ZbHsMFPDSBqHzsDRlZAwrZBDkBpur5/xb6b1RPD6l4g==
X-Received: by 2002:aa7:cd0b:: with SMTP id b11mr29885615edw.412.1643807928849; 
 Wed, 02 Feb 2022 05:18:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1dzhipSUYTihxVVzQkkaZnzEIXAFJlJAmh3uo9RR5PEKeTLa1FlnwjQssXcKFJZ5pmuz11A7eZFDgrYYhlPY=
X-Received: by 2002:aa7:cd0b:: with SMTP id b11mr29885596edw.412.1643807928661; 
 Wed, 02 Feb 2022 05:18:48 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
In-Reply-To: <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Wed, 2 Feb 2022 14:18:36 +0100
Message-ID: <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Aleksandr Nogikh <nogikh@google.com>
Cc: linux-riscv@lists.infradead.org, kasan-dev <kasan-dev@googlegroups.com>, 
 palmer@dabbelt.com, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_051858_482974_C7DA8992 
X-CRM114-Status: GOOD (  26.33  )
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

Hi Aleksandr,

On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
>
> Hello,
>
> syzbot has already not been able to fuzz its RISC-V instance for 97

That's a longtime, I'll take a look more regularly.

> days now because the compiled kernel cannot boot. I bisected the issue
> to the following commit:
>
> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> Date:   Fri Oct 29 06:59:27 2021 +0200
>
>     riscv: Fix asan-stack clang build
>
> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> enabled. In the previous message syzbot mentions
> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> For convenience, I also duplicate the .config file from the bot's
> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
>
> Can someone with KASAN and RISC-V expertise please take a look?

I'll take a look at that today.

Thanks for reporting the issue,

Alex

>
> --
> Best Regards,
> Aleksandr
>
>
> On Tue, Jan 18, 2022 at 11:26 AM syzbot
> <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
> > compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > userspace arch: riscv64
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com
> >
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > --
> > You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/00000000000038779505d5d8b372%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
