Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38612C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 17:35:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D084D64E01
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 17:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D084D64E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=krJ95HluCL1nGS487S58xu0ZKzibY8ZGlibIHAkv79s=; b=N1hvmxKn6Z3/AK8YMh8Tg8mJG
	o9LR3RzILpktRn9rayUKYzr9rZgTdLJWmT5iDqRKRhqHv7DbIf1qbbDPdmFTvL/P0LifDmyq/07mA
	Wau9jK+aFZajODNl83QDm2GReD0A+UriIRjtrp/J8myFhn8M+m0cob76ZaXGH2vCfzRuKwMzRB3Ln
	G7K2ehoPBxrPj+PIQ3HeSzR6o25LxFyKqLmZVJX0cVxH5oJcjsuQXpD1CKZUtEa5R063e+aeAKR4C
	TgCIKW2UO/WjFethOyPlH17Sb/zbyTSAUB6uLQygd2F200V2dBx/LHKt8M2ZgUJ97xUmawCbWpOhr
	UbYUUbbow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKlgo-00C6C3-Lf; Fri, 12 Mar 2021 17:35:06 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKlgk-00C6BF-8N
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 17:35:04 +0000
Received: by mail-qv1-xf33.google.com with SMTP id cx5so4606012qvb.10
 for <linux-riscv@lists.infradead.org>; Fri, 12 Mar 2021 09:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0hmXxAjdRD0U+F/dWy2tB3crefQXhKAVgphSKNgBkZI=;
 b=LJKFyFZysUttEVg/EispgxcOMcKAWVL4b8RRreOAgmXiEXIZNORrkX3bGWMBCKeQwf
 D6DGD0e7WNL/yjBasxw/GSI1NwSx1+bbq7mRageKwoBPB+paA3PXQCMowrQMqJrO4TgR
 NIRHv+ZAE+UQJSVNbqBS2C0Pi3k+HnP2iUDQ5c5LrCz+9B8CRo4/dmmYQYXF6AgxIQkd
 vPjYS4F9KA85o09krYEhE7l66w4kPLQ1WJhYMlojcHB3BQxzRgZxccOXHhbgZYGWzAsn
 OA/kvorL4k8pHF5z8OogGbv6sTmmKUW8eeZHu9QtbIKQsV78d9W7a4GXVqQ4rSF/l0ip
 Q4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0hmXxAjdRD0U+F/dWy2tB3crefQXhKAVgphSKNgBkZI=;
 b=tvl2HvPemaIPVZuaipmdOHHUBiI8D/flo3vYWsyfUWflsLHJ4mj6X7Foxw8ONBQVpe
 JmnQl5v8D53RgfSW/m5rinhmbitATXcd4bs5g45dNKknnAsRqG4FdOEiXiGXhipDVEGC
 KMegmHcv19swbSr8dOjhGVORXPAEJZ57opcZwM+yf5S4sabtF0n141xfUOHXCjpZn+V/
 rNx+9BikC5NlG+iG6WYZiNMzClX5S+BSC/zA+lzqLo5Ru7wobNFay5OM6CmoJqy/w5ug
 4UdsESQQ8rEnY0WAvSEZZMYt/k3v5OkjGkzSEitzC5azNpaDwx9/vkpK4BwlykJm34Vd
 xVcQ==
X-Gm-Message-State: AOAM531km+GUoRJdcYSojexf/rjVH6L6MhvxGnShs/Do1e2Lf5vj2u/z
 7NPeYgAGYjgRWAhg8K/aA4JOmj+kgH+Ffrf1oz4vIQ==
X-Google-Smtp-Source: ABdhPJy0Ycg8McTa0upnBCtJshrTVqwY8X05iu/YLBxxC/1ebGERdoRiIZlCKLb5YeXDi109AUFJazSTl1hWW/r4NCE=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr13448301qva.18.1615570499546; 
 Fri, 12 Mar 2021 09:34:59 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
 <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
 <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
 <aa801bc7-cf6f-b77a-bbb0-28b0ff36e8ba@codethink.co.uk>
 <816870e9-9354-ffbd-936b-40e38e4276a4@codethink.co.uk>
 <4ce57c7e-6e5d-d136-0a81-395a4207ba44@codethink.co.uk>
In-Reply-To: <4ce57c7e-6e5d-d136-0a81-395a4207ba44@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 12 Mar 2021 18:34:48 +0100
Message-ID: <CACT4Y+ZJwJ9vcgCyabDUny0CnYmbHLRqU6m_KccdObS+7bBoGw@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Benjamin Segall <bsegall@google.com>, dietmar.eggemann@arm.com, 
 Juri Lelli <juri.lelli@redhat.com>, LKML <linux-kernel@vger.kernel.org>, 
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_173502_558161_726711FE 
X-CRM114-Status: GOOD (  39.09  )
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

On Fri, Mar 12, 2021 at 5:36 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 12/03/2021 16:34, Ben Dooks wrote:
> > On 12/03/2021 16:30, Ben Dooks wrote:
> >> On 12/03/2021 15:12, Dmitry Vyukov wrote:
> >>> On Fri, Mar 12, 2021 at 2:50 PM Ben Dooks <ben.dooks@codethink.co.uk>
> >>> wrote:
> >>>>
> >>>> On 10/03/2021 17:16, Dmitry Vyukov wrote:
> >>>>> On Wed, Mar 10, 2021 at 5:46 PM syzbot
> >>>>> <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> syzbot found the following issue on:
> >>>>>>
> >>>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for
> >>>>>> arch_dup_tas..
> >>>>>> git tree:
> >>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >>>>>> console output:
> >>>>>> https://syzkaller.appspot.com/x/log.txt?x=1212c6e6d00000
> >>>>>> kernel config:
> >>>>>> https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> >>>>>> dashboard link:
> >>>>>> https://syzkaller.appspot.com/bug?extid=e74b94fe601ab9552d69
> >>>>>> userspace arch: riscv64
> >>>>>>
> >>>>>> Unfortunately, I don't have any reproducer for this issue yet.
> >>>>>>
> >>>>>> IMPORTANT: if you fix the issue, please add the following tag to
> >>>>>> the commit:
> >>>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> >>>>>
> >>>>> +riscv maintainers
> >>>>>
> >>>>> This is riscv64-specific.
> >>>>> I've seen similar crashes in put_user in other places. It looks like
> >>>>> put_user crashes in the user address is not mapped/protected (?).
> >>>>
> >>>> I've been having a look, and this seems to be down to access of the
> >>>> tsk->set_child_tid variable. I assume the fuzzing here is to pass a
> >>>> bad address to clone?
> >>>>
> >>>>   From looking at the code, the put_user() code should have set the
> >>>> relevant SR_SUM bit (the value for this, which is 1<<18 is in the
> >>>> s2 register in the crash report) and from looking at the compiler
> >>>> output from my gcc-10, the code looks to be dong the relevant csrs
> >>>> and then csrc around the put_user
> >>>>
> >>>> So currently I do not understand how the above could have happened
> >>>> over than something re-tried the code seqeunce and ended up retrying
> >>>> the faulting instruction without the SR_SUM bit set.
> >>>
> >>> I would maybe blame qemu for randomly resetting SR_SUM, but it's
> >>> strange that 99% of these crashes are in schedule_tail. If it would be
> >>> qemu, then they would be more evenly distributed...
> >>>
> >>> Another observation: looking at a dozen of crash logs, in none of
> >>> these cases fuzzer was actually trying to fuzz clone with some insane
> >>> arguments. So it looks like completely normal clone's (e..g coming
> >>> from pthread_create) result in this crash.
> >>>
> >>> I also wonder why there is ret_from_exception, is it normal? I see
> >>> handle_exception disables SR_SUM:
> >>> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/riscv/kernel/entry.S#L73
> >>>
> >>
> >> So I think if SR_SUM is set, then it faults the access to user memory
> >> which the _user() routines clear to allow them access.
> >>
> >> I'm thinking there is at least one issue here:
> >>
> >> - the test in fault is the wrong way around for die kernel
> >> - the handler only catches this if the page has yet to be mapped.
> >>
> >> So I think the test should be:
> >>
> >>          if (!user_mode(regs) && addr < TASK_SIZE &&
> >>                          unlikely(regs->status & SR_SUM)
> >>
> >> This then should continue on and allow the rest of the handler to
> >> complete mapping the page if it is not there.
> >>
> >> I have been trying to create a very simple clone test, but so far it
> >> has yet to actually trigger anything.
> >
> > I should have added there doesn't seem to be a good way to use mmap()
> > to allocate memory but not insert a vm-mapping post the mmap().
> >
> How difficult is it to try building a branch with the above test
> modified?

I don't have access to hardware, I don't have other qemu versions ready to use.
But I can teach you how to run syzkaller locally :)
I am not sure anybody run it on real riscv hardware at all. When
Tobias ported syzkaller, Tobias also used qemu I think.

I am now building with an inverted check to test locally.

I don't fully understand but this code, but does handle_exception
reset SR_SUM around do_page_fault? If so, then looking at SR_SUM in
do_page_fault won't work with positive nor negative check.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
