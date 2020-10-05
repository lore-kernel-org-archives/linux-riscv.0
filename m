Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A0DC4363A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:09:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684DE2080A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 06:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x6bz3nNl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="E51RrDlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684DE2080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ub/hUzEqPtJdiAFp9X4MpJ0GcUzM6AysANPzi4Lie/g=; b=x6bz3nNlm1ODxlNrB9AuELTaz
	qB/sl/9abnXzfvg1McpwNBtomC8nk57Ob9FSCmJ/8xF92TCQN73zDHQ0SD6DCAc/fZ/keC007tlc9
	TIFd3Eqv2O3ZswRx6+bln95WqNVTyF3q9fPiNJUfYAxwZJ6/PKje8dm7zB+Wqd2SsqSutUfl1LRhg
	1JpP/qcHS8uJpzsOsPwifOr43S7LCf7qaU3eWyUpP9FqUFoYvlWRN4R7ICcfOJqNHDG/k30XgcMoV
	SiYWpjrlgXECEX3uiUU/KbPdSHqFNmtOM61qPybXuHMwc5FylDFDQ3THxNukCERvmo0+mLsIt+DhY
	NQfK4YBiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPJgH-0006eG-O0; Mon, 05 Oct 2020 06:09:05 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPJgD-0006cM-Kx
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 06:09:03 +0000
Received: by mail-oo1-xc44.google.com with SMTP id y127so158270ooa.5
 for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2020 23:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kCBZSxC/FP29fE/Ws6xfe29g7TtwaILzV+J6xbNF83k=;
 b=E51RrDlU/B7Rz6fpeRInPIXn4HInasbvRL4pKKymd2dcQpe0efRt9JyNXxpdYUtYFo
 C41xqCZzG+S/mP7rEklopnoOtGqxdk0u2qKfB8f3gYnqlq9IsGM6btrL8nfqZ6VWOhTI
 8QoVWB4xPXht0JfzYYbf+99UvOaDcFsqvwluBd7fi/NRoXagCE3t1NkvIWG7m3Rma7WO
 hN7i62VWuaplGRCq3bGw6++KeMq5kky/quOB39Z0K+f1hYxFJpQB77VtXVgq/1bdUJZp
 Ss2p9pKB6uWDBETHkhoptk4+0lkaeA5Re750lzIT6b4xd8aeW/vO1N9GqCnJkP3SLhmh
 GA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kCBZSxC/FP29fE/Ws6xfe29g7TtwaILzV+J6xbNF83k=;
 b=o0JmByNyMKGHIBYeZEInq3Nnci7s+bvkifm7YLKP73j7urh579PQ4mh87HIsH7abgC
 tjOLhIIHmtBmavtq/VyTxE1QyZ03D2YODcwPvbEbUe8ADxAY9eqaHd98C3c4Y+x/a6Qd
 5oI/8MfmVu+MvShHv/pLo+1jOmV24g9n8C6tbDPdmcoEZvW8V1wOlkcfjb1FwXmSMevD
 6+pIv4lhaDb9zm5T2PA3uWYfz4U61VWaoVCGFqhezyieIk8WO5zywRCZcotql47hNNEH
 vL5L6cO3GzJh/Vrg2lLZ+10BXurOu1Zc4pmnPhJJk0kKSkbybT/1N0WT2htv5o8om4BI
 X9Hw==
X-Gm-Message-State: AOAM530YhA7AWI9xRfondSMvR6LSsXcLXdyyanFcEDxgDLzlQcrStPbd
 QAddYPPy4RmLmiCxnPDLRvfmT8QCwoGpG30oFPQxcA==
X-Google-Smtp-Source: ABdhPJyG44xZDiuFnhuykPF2hZg98nAulIycavfPf6wp1BVpHn7Jor2dZopEoCwylvw9nHLhBu+TjjZxJYNMLujruzc=
X-Received: by 2002:a4a:4845:: with SMTP id p66mr10979199ooa.68.1601878137416; 
 Sun, 04 Oct 2020 23:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <bug-209317-8243@https.bugzilla.kernel.org/>
 <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
 <20200928111341.7eaa98a8@oasis.local.home>
 <67278555f143564677878cc849155393a93c018a.camel@wdc.com>
 <CAOnJCUJgzWkKixYyFCrqbNF2ONgB_RUOSTB9BhT5D0stnf=vUw@mail.gmail.com>
In-Reply-To: <CAOnJCUJgzWkKixYyFCrqbNF2ONgB_RUOSTB9BhT5D0stnf=vUw@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 5 Oct 2020 14:08:46 +0800
Message-ID: <CANXhq0qzi2LjYekG0yk876znrpk7tMo+-zT6wR77nhy89rm2kQ@mail.gmail.com>
Subject: Re: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_020901_965823_F459C53A 
X-CRM114-Status: GOOD (  23.18  )
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Alan Kao <alankao@andestech.com>,
 "bugzilla-daemon@bugzilla.kernel.org" <bugzilla-daemon@bugzilla.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Atish Patra <Atish.Patra@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

I can take out some time to take a look at it together, if anyone here
fixes it or has ideas, please share the information, thanks.

On Sun, Oct 4, 2020 at 1:33 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> Hi Alan and Zong,
> I initially suspected ftrace is broken between v5.6 & v5.7 as Kolin pointed out.
> I couldn't find any reason how the HSM patch is related. Zong's ftrace
> patching code was also merged in that release.
> However, I was able to reproduce the issue in the older kernel(v5.4)
> as well on both Qemu & Unleashed hardware.
> Here are the steps:
>
> mount -t debugfs none /sys/kernel/debug/
> cd /sys/kernel/debug/tracing
> echo function_graph > current_tracer
> echo function > current_tracer
>
> It works for the first time with function_graph but writing any other
> tracer crashes immediately.
> Can you take a look to check if the bug is in ftrace infrastructure code ?
>
> On Mon, Sep 28, 2020 at 10:25 AM Atish Patra <Atish.Patra@wdc.com> wrote:
> >
> > On Mon, 2020-09-28 at 11:13 -0400, Steven Rostedt wrote:
> > > On Sat, 26 Sep 2020 22:02:35 +0000
> > > bugzilla-daemon@bugzilla.kernel.org wrote:
> > >
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=209317
> > > >
> > > > --- Comment #4 from Colin Ian King (colin.king@canonical.com) ---
> > > > Issue still in 5.9-rc6
> > > >
> > >
> > > Atish,
> > >
> > > As the issues bisects down to your commit, care to take a look at
> > > this.
> > > (And take ownership of this bug)
> > >
> >
> > Yes. I am already looking into this. Colin informed me about the bug
> > over the weekend.
> >
> > I couldn't change the ownership as I am not part of the editbugs group.
> > I have sent an email to helpdesk@kernel.org for access.
> >
> > > -- Steve
> >
> > --
> > Regards,
> > Atish
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
