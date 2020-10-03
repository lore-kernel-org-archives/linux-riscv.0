Return-Path: <SRS0=eDvz=DK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419C4C4363D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 17:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1FC206B8
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2020 17:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K883x4pq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="TtfeTiM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1FC206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CeC7J0kUdhD51PVcD2GqzvGj8LCmtiLRmginPbZ3s7s=; b=K883x4pqcwmfTMUlPJv9k5i3h
	3CpaGWD4LIJV50iX6IEWhksJMHU1eZRl451ZhTuMZcEtZMc9FW1tavIkFZ6rQEo6K0nDFpw2qvMpV
	k0Fx+XO7s1MlC2xoaxtR5CDq9Eey/GJRoGr52y/KNfV0RNc1FtEFILsyW33I5OIgjPp+WLKIu6hMx
	f8tfSUta8OoBnvNcDJO0vXtJ77gLYZf9uY+2d8Apy/GhXb0tl8IJwpVD8oko8EME56n4rGz/GBB2d
	poXZjEdmF9P4IMZznkbWgBftm7hEF8Mg+39GfXt9y2HwFPmFJ8S6AOj+tApjjOHkKUtv+IoTiBhS4
	9FU3OYU0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOlPO-0001X7-DO; Sat, 03 Oct 2020 17:33:22 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOlPM-0001We-NQ
 for linux-riscv@lists.infradead.org; Sat, 03 Oct 2020 17:33:21 +0000
Received: by mail-io1-xd42.google.com with SMTP id d197so4915758iof.0
 for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2020 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MK5uVqASqRoyPGix1z3iLbSJV9eTUDiTtMGnbaIWbDE=;
 b=TtfeTiM6Bu8KDOBYg+UOw+aUjK4K8FSO1lNVk6VODxoFEX7bIGz4XyPR76AWYvEuoj
 KYB4bunpwahtwP/KBoROWdvDiVxUxRv0hn74b4gmAbuaI76fm/QubP643BltlIZsKUyW
 8eKAlmSUnTL8Mug9u7Kq23GJuGNcKWoUG1nQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MK5uVqASqRoyPGix1z3iLbSJV9eTUDiTtMGnbaIWbDE=;
 b=YB/KL0bxncJhE9486PKbbYaX4OLdGvSBX/Rd5P1jsKtPPE4x7Chgm0/A+ZlJp+VuDQ
 n6L1mdd/XuIUSnQ0U71eWnSOsEtEO+gr9ox42rqgaeml1B51oJqxlDIABrnv2dytje4L
 Oz7u07QSnF4g9LNoECXNbjFBOL2IU1pQvr1qxBnX6T+wan/n26SHpK+dGqs3nvaU5o+f
 fJpwhVQ2YWwmBQ0QC0c9tI5wBSRcQJv4S6bhvY76rlvvBk/kvSKe35+4HyBmIJ8USASh
 /xsD33IJO5/pkgsF1mzSojyzKZNPmkpZsCDmntAbG3guOkRt+OKVALw9n0x7pSFeUkYA
 Rgaw==
X-Gm-Message-State: AOAM532HPhUbhDYF3y0XxWTpMgA+dB3tArBB8lHoDg1wwukvkNbos4fH
 imqeSEEYnMek/zVuczf7j3cOMKtMJ0pID/8gAQ+O
X-Google-Smtp-Source: ABdhPJxF5XjTpqjoAoetC0Qpvrxi7mQ4ZOXBEKnuOWzzvzBGYi8KHxY9YWAPoSOX74+9heXweJg8YKy8lpzGfOA3olM=
X-Received: by 2002:a05:6602:18a:: with SMTP id
 m10mr5823189ioo.174.1601746398592; 
 Sat, 03 Oct 2020 10:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <bug-209317-8243@https.bugzilla.kernel.org/>
 <bug-209317-8243-E6Z0ICootN@https.bugzilla.kernel.org/>
 <20200928111341.7eaa98a8@oasis.local.home>
 <67278555f143564677878cc849155393a93c018a.camel@wdc.com>
In-Reply-To: <67278555f143564677878cc849155393a93c018a.camel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 3 Oct 2020 10:33:07 -0700
Message-ID: <CAOnJCUJgzWkKixYyFCrqbNF2ONgB_RUOSTB9BhT5D0stnf=vUw@mail.gmail.com>
Subject: Re: [Bug 209317] ftrace kernel self test failure on RISC-V on 5.8,
 regression from 5.4.0
To: Alan Kao <alankao@andestech.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_133320_782471_F0ACFD96 
X-CRM114-Status: GOOD (  18.99  )
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
 "bugzilla-daemon@bugzilla.kernel.org"
 <bugzilla-daemon@bugzilla.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, Atish Patra <Atish.Patra@wdc.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Alan and Zong,
I initially suspected ftrace is broken between v5.6 & v5.7 as Kolin pointed out.
I couldn't find any reason how the HSM patch is related. Zong's ftrace
patching code was also merged in that release.
However, I was able to reproduce the issue in the older kernel(v5.4)
as well on both Qemu & Unleashed hardware.
Here are the steps:

mount -t debugfs none /sys/kernel/debug/
cd /sys/kernel/debug/tracing
echo function_graph > current_tracer
echo function > current_tracer

It works for the first time with function_graph but writing any other
tracer crashes immediately.
Can you take a look to check if the bug is in ftrace infrastructure code ?

On Mon, Sep 28, 2020 at 10:25 AM Atish Patra <Atish.Patra@wdc.com> wrote:
>
> On Mon, 2020-09-28 at 11:13 -0400, Steven Rostedt wrote:
> > On Sat, 26 Sep 2020 22:02:35 +0000
> > bugzilla-daemon@bugzilla.kernel.org wrote:
> >
> > > https://bugzilla.kernel.org/show_bug.cgi?id=209317
> > >
> > > --- Comment #4 from Colin Ian King (colin.king@canonical.com) ---
> > > Issue still in 5.9-rc6
> > >
> >
> > Atish,
> >
> > As the issues bisects down to your commit, care to take a look at
> > this.
> > (And take ownership of this bug)
> >
>
> Yes. I am already looking into this. Colin informed me about the bug
> over the weekend.
>
> I couldn't change the ownership as I am not part of the editbugs group.
> I have sent an email to helpdesk@kernel.org for access.
>
> > -- Steve
>
> --
> Regards,
> Atish
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
