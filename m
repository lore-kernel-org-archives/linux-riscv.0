Return-Path: <SRS0=7nvN=DM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A83C4727D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 18:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1AD20853
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2020 18:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIhPClXY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="D8ti+2Pu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1AD20853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YACDYiiPDLTO5hRDzIa+ugi4aoYk7S6nM+S+OaXlFZ4=; b=RIhPClXY1ow65O7/NIhBzLOFu
	D4XXcWuoB5RcS97Ny2svn+7k6EqfmKtl6MdRC1ITJGeSlJNglbXfvOaor34yNK6gq6AF3Z3KA0sdh
	Q3Pd/oZ/of0JuRpFbtAiv6GqkTkfTAJX3H24tR60XXbalDcHj4+FtnLBzXAeXeU48iSeXxk6TpRp4
	JOidKe15qyvvejlPd2yHL/6f8aEDs6fSu4yfooNqTElDhkNGkeNW+mGt6f8GZJhkbhXL+VRbaQQtU
	8Cp89+6uJYsfNYhCDwtUr5faRt0LO3+lIlgpWQb8nUgBGOg/rj+w1mHYuO974XDaklLVlHfRLAL0w
	7iFsKLYaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPVW8-0003Xf-Hm; Mon, 05 Oct 2020 18:47:24 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPVW5-0003Wh-VG
 for linux-riscv@lists.infradead.org; Mon, 05 Oct 2020 18:47:22 +0000
Received: by mail-io1-xd41.google.com with SMTP id k25so10293076ioh.7
 for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2020 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FY+LqDabhhgCzF/kHUiBASBrGmAFBGdYjQoHH5CUHuk=;
 b=D8ti+2Pu9A3A7OT9eu5u8g809BBk1hASH2RdiLyOGvjrIfeX7mcLWCLc2RBZLm2PDg
 KnQUmSkt41Tk+Km3Q92kCAsB5Nw+5z1uCG42UUt59OHSQ1ga51b3ESs6fegFK8mqig2G
 8OD2rZzjxIO1M5dYgWyIhSBpB4O7EdeF656Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FY+LqDabhhgCzF/kHUiBASBrGmAFBGdYjQoHH5CUHuk=;
 b=Ymv69RorpVtOQJwq059LjJhKuEN1H3Xu6i6aJfq34dWVZ5pW+e6or9t7NLEXzjkf8G
 wwQG63gMVInZSRh4dhaH1BkGUHhRSMg/HHSbs/NYtwOekc4w8Gahw+tDgBtKGcPzUBsf
 8+3D9V0T0OeHpdblfJl0x7N+FKVtAlscv/nMxX7zOdkkTGKLGNDD2hlEK5ZvwcKuKe83
 nNwO8JM5VXRmg7t7um1J9hsYZnaDM8x1QDjMLmZVi8DcQZn1JFS4ENAp7Fd3Ypg57PY1
 JrYArJwmGOkaCgLqQmu6RgU4sRveb81XoqX4Sfdmht92JcRbekTdf//C7m+LTDUOhi4M
 tnIA==
X-Gm-Message-State: AOAM5306FNBqjY9RhE7d6NdveF2E7a2ZvWS3gFA//iBFhlvvtYkuVyf4
 CtjR08nWBH8E802IhHHzbJH/iAZmb8J1tFa2RaRA
X-Google-Smtp-Source: ABdhPJwBWJVGjbpxIiKdfK3X5F9BKCLWk5LXkXrOV6AiTriAM780Wu2t637zT39lnDE4ZAH0aldf8qHoIsKQ3RUi+Pg=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr996172ios.113.1601923638595;
 Mon, 05 Oct 2020 11:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <bug-209317-8243@https.bugzilla.kernel.org/>
 <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
 <20200928111341.7eaa98a8@oasis.local.home>
 <67278555f143564677878cc849155393a93c018a.camel@wdc.com>
 <CAOnJCUJgzWkKixYyFCrqbNF2ONgB_RUOSTB9BhT5D0stnf=vUw@mail.gmail.com>
 <CANXhq0qzi2LjYekG0yk876znrpk7tMo+-zT6wR77nhy89rm2kQ@mail.gmail.com>
In-Reply-To: <CANXhq0qzi2LjYekG0yk876znrpk7tMo+-zT6wR77nhy89rm2kQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 5 Oct 2020 11:47:07 -0700
Message-ID: <CAOnJCULU7qy35vhiFcJKHFgbe+w5Gn2q_SskjjbjtM3X90uT_g@mail.gmail.com>
Subject: Re: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_144722_014349_88D96B5E 
X-CRM114-Status: GOOD (  28.20  )
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

On Sun, Oct 4, 2020 at 11:08 PM Zong Li <zong.li@sifive.com> wrote:
>
> Hi Atish,
>
> I can take out some time to take a look at it together, if anyone here
> fixes it or has ideas, please share the information, thanks.
>

Thanks. I observed this in case it helps.

Across kernels, the panic trace seems to point out the one of the
first two functions after patching is corrupted.
rcu_momentary_dyntick_idle or stop_machine_yield[1]

[1]https://elixir.bootlin.com/linux/v5.9-rc7/source/kernel/stop_machine.c#L213

I am suspecting nop was not replaced with the correct auipc+jalr pair?

> On Sun, Oct 4, 2020 at 1:33 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > Hi Alan and Zong,
> > I initially suspected ftrace is broken between v5.6 & v5.7 as Kolin pointed out.
> > I couldn't find any reason how the HSM patch is related. Zong's ftrace
> > patching code was also merged in that release.
> > However, I was able to reproduce the issue in the older kernel(v5.4)
> > as well on both Qemu & Unleashed hardware.
> > Here are the steps:
> >
> > mount -t debugfs none /sys/kernel/debug/
> > cd /sys/kernel/debug/tracing
> > echo function_graph > current_tracer
> > echo function > current_tracer
> >
> > It works for the first time with function_graph but writing any other
> > tracer crashes immediately.
> > Can you take a look to check if the bug is in ftrace infrastructure code ?
> >
> > On Mon, Sep 28, 2020 at 10:25 AM Atish Patra <Atish.Patra@wdc.com> wrote:
> > >
> > > On Mon, 2020-09-28 at 11:13 -0400, Steven Rostedt wrote:
> > > > On Sat, 26 Sep 2020 22:02:35 +0000
> > > > bugzilla-daemon@bugzilla.kernel.org wrote:
> > > >
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=209317
> > > > >
> > > > > --- Comment #4 from Colin Ian King (colin.king@canonical.com) ---
> > > > > Issue still in 5.9-rc6
> > > > >
> > > >
> > > > Atish,
> > > >
> > > > As the issues bisects down to your commit, care to take a look at
> > > > this.
> > > > (And take ownership of this bug)
> > > >
> > >
> > > Yes. I am already looking into this. Colin informed me about the bug
> > > over the weekend.
> > >
> > > I couldn't change the ownership as I am not part of the editbugs group.
> > > I have sent an email to helpdesk@kernel.org for access.
> > >
> > > > -- Steve
> > >
> > > --
> > > Regards,
> > > Atish
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >
> >
> > --
> > Regards,
> > Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
