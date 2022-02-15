Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3CAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 17:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkajLBDB0manD9rUH3tnuE31W0NZNHw7/L53KycqSAg=; b=C/pCm8g+o0R69s
	H8b8NX0QtoInpydQwcHd3Datzid7zA9fBds6c+uXXoZ6hm1tXzLy/nHFgRW2Q/kLwqTCAT0HS6ynE
	0sy+976cVeEToM9J0hOkNbZlWUldNU+WcT/Iht+VowYwoZXPDKwBWMxlxp2z7iZ5lADEZoehCLS15
	KT+nLOaNLMW9gMhsz4W0G7Wqgd3pFXElkrQUGeNuBjc1BLc+PrYMuWH+PCdQtHZXHxQPLLjtiTv2b
	BnA7UjbWexcU/HQ4zVXeZse5EMHd0/8QV/jIhXQeAx/m3KBb9du1KkFfbrDyIev9QHHM7Y6zsRRXG
	GHmgZzwZhbz9BiRSbhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK1OA-003rRk-5K; Tue, 15 Feb 2022 17:13:18 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK1O6-003rOI-LB
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 17:13:16 +0000
Received: by mail-oi1-x234.google.com with SMTP id x24so1665551oie.9
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 09:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dkNaB6kzC0t6gTi2pQx30aeojCMITTvkle2ZzaYqdBM=;
 b=Tl08YyyCqUz7jPsZpEIFs7dcAC/J3b3HZaMGn2NtoxJdeiQj1zWTIhiXMGBdMH83VQ
 1PghJf9UK1UklkzjUbCFtG0ZVytd3YE5L/JU7Kj9Z9cs0Wvvd+DGV0TXm+DgvCOhGcRs
 VqO1dAL9k6fwlwYV03cAC0TdOdS+Q/ZQe65153sA+YsBU6iS7zg3OCu919enunaT31XZ
 6oWEyPxUX6PDYpqqXRNWTgCxfQoV6e0VL/fBBeLHnuF3Tf+jt5xEugirI7diCJWGCLov
 0y2Sg+P0c8WXjiAhxG6TJ0z3N43nJ9hDxYQULHaF9eUw6VZjJNwxw8XyTyxWSPqnnyu6
 bEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dkNaB6kzC0t6gTi2pQx30aeojCMITTvkle2ZzaYqdBM=;
 b=V9LkRompB2302JgvLGQGwX9P5hLivw6JIkBuCqHc0POdnFrkrRcPaKw4PDbYmoDPb/
 CUEHYxTMU932iPCvsem5SKaBULBNEWWUQFZCCUTIrGSOTvSdyhosUwegpgHFTOZyhbJo
 ny6ggPlnOUDBdjaDWj6foNV9TcNo9p/Wr5KOzVU36YLkQotBevhFJu8R1mLKExLCKoTi
 ipaxnzGL80ki/yWvyi73kXVdvbCw44KJkrg34duqyIig3tGkvj3ZdDjlU6Zb3T7w0Uwc
 Q5H3CJ7STb7IeepE3z7NwmwIGycT7zY/JlFtr6BUC3oleD201SkSxiuSX1PNt2z7kI0b
 HOEQ==
X-Gm-Message-State: AOAM5329rG7Epv+VEU26anQ4GmCoSoyDFmNwYHXrpD8oPa07K9jOXHgt
 nHI5/bpSlUCbgRkWQWBG0eaT4rZEAKUKzCOYI/o6nw==
X-Google-Smtp-Source: ABdhPJyF2d6aFudNgPHq5wPVAths+OUdollkoCVet7aNgbJuaRRSllKYLRFDUcSQY12kE4kPlhzrLKhEIuiY531pZK0=
X-Received: by 2002:a05:6808:3021:b0:2d4:40f3:6b30 with SMTP id
 ay33-20020a056808302100b002d440f36b30mr605011oib.31.1644945190003; Tue, 15
 Feb 2022 09:13:10 -0800 (PST)
MIME-Version: 1.0
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
In-Reply-To: <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 15 Feb 2022 18:12:58 +0100
Message-ID: <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, linux-riscv@lists.infradead.org, 
 kasan-dev <kasan-dev@googlegroups.com>, palmer@dabbelt.com, 
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>, 
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_091314_743861_0D07E902 
X-CRM114-Status: GOOD (  21.26  )
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

On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Hi Aleksandr,
>
> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
> >
> > Hello,
> >
> > syzbot has already not been able to fuzz its RISC-V instance for 97
>
> That's a longtime, I'll take a look more regularly.
>
> > days now because the compiled kernel cannot boot. I bisected the issue
> > to the following commit:
> >
> > commit 54c5639d8f507ebefa814f574cb6f763033a72a5
> > Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > Date:   Fri Oct 29 06:59:27 2021 +0200
> >
> >     riscv: Fix asan-stack clang build
> >
> > Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
> > enabled. In the previous message syzbot mentions
> > "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
> > Binutils for Debian) 2.35.2", but the issue also reproduces finely on
> > a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
> > 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
> > For convenience, I also duplicate the .config file from the bot's
> > message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> >
> > Can someone with KASAN and RISC-V expertise please take a look?
>
> I'll take a look at that today.
>
> Thanks for reporting the issue,

Hi Alex,

Do you have any updates on this? This is still blocking syzbot:
https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be

Do you use KASAN with clang or gcc? We can't boot riscv kernel with neither.


> > --
> > Best Regards,
> > Aleksandr
> >
> >
> > On Tue, Jan 18, 2022 at 11:26 AM syzbot
> > <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
> > > compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > > userspace arch: riscv64
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
