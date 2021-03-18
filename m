Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A57C433E9
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:35:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7989F64F2B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7989F64F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qK4IV6CX2FiuP0ossSlb82U6FKruZwPDv8WI3rm+EIg=; b=maR3Sb+xFd2VgaMwezjvXp9Qf
	YUDT2QIqqROCHCFwvyOK5kSWuJhu0BDcWzk3z97FLnr9Yilqct+aHfUPW5GJkwXDRp4SEeFlUb+Hw
	gkiplp0qds//vyyxz73ajLOuslJMtpxX8sO2M+V+ptlVdfYqSJR5wRMOQH3615HzrXk0uWAIj374n
	acWAviw9RiBNyBhbQhFjqAz3SdI8VlviuLd4EagjuFP4QLNGDD1o8wKl2o04EJL43drc27rdhwtPb
	W2ThoqzV96/NHyG0fveo1pXzIfS095suktKhr6lKHsVyHivSRgoqBAgDJqbci8e6q9MecfAOAP8+P
	jgPT8TTJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtjd-005V8D-84; Thu, 18 Mar 2021 14:34:49 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtjZ-005V78-Ih
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 14:34:47 +0000
Received: by mail-qk1-x72e.google.com with SMTP id x10so2155418qkm.8
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 07:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9P1ao6toWArEDXhVPzBQlm+hipiV6rECWCdZqkLfmg=;
 b=Mb4zlDV5nxx6ZzQmQoL6InxaNiD6vsznXLAVzWpxsIp9+9+37xvHuAoBJ22jsSgGff
 kSgLBPW9GDLhV/eVGtwgJlAFQhijc65S/yjqMo5DiLlrfKnZI6bLZrGqW+zAELg739zq
 UizI4xGjr+zCwNw/6/QyNcTjoVQ+dq3cDRtVInOBvdqMJ3RsBVGk5WudeLRphwc5H7yB
 fgpEJ8NRMyY16V/sNzsd8jz7OJ30DNAFRYcZCOrQJ9BOQYTgf5qzT31evbJUGrDzD+NP
 zQCdU8RV5VB21IV0uEw2qHh1Dg7RdiN1poEJkV5PqOVMUHoLw91e3j5Chx3ucb1z3aSC
 ouvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9P1ao6toWArEDXhVPzBQlm+hipiV6rECWCdZqkLfmg=;
 b=mdnQmoc6POvNeIZgMaRTvLJh7lHVt4Mj0Ypi9flO4SqMWjhxXtxcNVZdwpSZoxjpO4
 7T3e3XD5Yg92W/x0ti0kgnvLLvQ44E3xK96GsYdySCWsfaQxH0gR8ngwpNdAliZ8i00L
 tVLsu9fpi3+zhK7oarrTL46fNgvOG0p1REbrf6WPp2HZywEdtBk3FOMbeNf1JelCXUMp
 NLMOoHz9Eu3TupVXigcLVIoASPO/7UpbEvn8gX5TrYMfGbOefRGT/Xh9SPsMSvYtXZ58
 ETECOx3GGnLwm0vnPXR9k7Y5Uv0xIkG8BMJPRn5wvjuPxm7q9+QOkGFURkN9vgTMQ4aG
 z+Cg==
X-Gm-Message-State: AOAM533FwuiOayT2z7qqX47bXVGUiRQxdJ8EnvEx5nqHialiesLmSjOW
 rTRUpLnxT4wp9kCSklKKnWbUBSSH2i5SbeVn3L9e7Q==
X-Google-Smtp-Source: ABdhPJzEyx6+HFdVSkLJJ6i06IJ87zYMxAGqhNO0hQ7jyzt4zIjjJrJNYktNaCPrI7oCtxf7JgaiwdxuM6mVl4749nU=
X-Received: by 2002:a05:620a:410f:: with SMTP id
 j15mr4661018qko.424.1616078081595; 
 Thu, 18 Mar 2021 07:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
 <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
 <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
 <795597a1-ec87-e09e-d073-3daf10422abb@ghiti.fr>
 <f9318e58-5d3f-f548-3dbf-a5cb87406a94@codethink.co.uk>
 <CACT4Y+bYDU-4MYotLfqgkGpz487aC8xQ0dqaNLwf76d1yyF-Vw@mail.gmail.com>
 <a0449f4a-4d54-6f38-1bc3-7c5170d24b86@codethink.co.uk>
In-Reply-To: <a0449f4a-4d54-6f38-1bc3-7c5170d24b86@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 18 Mar 2021 15:34:29 +0100
Message-ID: <CACT4Y+aEAs2zrTY453mK2UgtaG=-eOyXyWU0PBSybmP+sc809A@mail.gmail.com>
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Alex Ghiti <alex@ghiti.fr>, 
 syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>, 
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
X-CRM114-CacheID: sfid-20210318_143445_751790_8EE1B46C 
X-CRM114-Status: GOOD (  33.97  )
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

On Mon, Mar 15, 2021 at 5:55 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> > On Fri, Mar 12, 2021 at 9:12 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> >>> Still no luck for the moment, can't reproduce it locally, my test is
> >>> maybe not that good (I created threads all day long in order to trigger
> >>> the put_user of schedule_tail).
> >>
> >> It may of course depend on memory and other stuff. I did try to see if
> >> it was possible to clone() with the child_tid address being a valid but
> >> not mapped page...
> >>
> >>> Given that the path you mention works most of the time, and that the
> >>> status register in the stack trace shows the SUM bit is not set whereas
> >>> it is set in put_user, I'm leaning toward some race condition (maybe an
> >>> interrupt that arrives at the "wrong" time) or a qemu issue as you
> >>> mentioned.
> >>
> >> I suppose this is possible. From what I read it should get to the
> >> point of being there with the SUM flag cleared, so either something
> >> went wrong in trying to fix the instruction up or there's some other
> >> error we're missing.
> >>
> >>> To eliminate qemu issues, do you have access to some HW ? Or to
> >>> different qemu versions ?
> >>
> >> I do have access to a Microchip Polarfire board. I just need the
> >> instructions on how to setup the test-code to make it work on the
> >> hardware.
> >
> > For full syzkaller support, it would need to know how to reboot these
> > boards and get access to the console.
> > syzkaller has a stop-gap VM backend which just uses ssh to a physical
> > machine and expects the kernel to reboot on its own after any crashes.
> >
> > But I actually managed to reproduce it in an even simpler setup.
> > Assuming you have Go 1.15 and riscv64 cross-compiler gcc installed
> >
> > $ go get -u -d github.com/google/syzkaller/...
> > $ cd $GOPATH/src/github.com/google/syzkaller
> > $ make stress executor TARGETARCH=riscv64
> > $ scp bin/linux_riscv64/syz-execprog bin/linux_riscv64/syz-executor
> > your_machine:/
> >
> > Then run ./syz-stress on the machine.
> > On the first run it crashed it with some other bug, on the second run
> > I got the crash in schedule_tail.
> > With qemu tcg I also added -slowdown=10 flag to syz-stress to scale
> > all timeouts, if native execution is faster, then you don't need it.
>
> I have built the tools and got it to start.
>
> It would be helpful for the dashboard to give the qemu version and
> how it was launched (memory, cpus etc)

Hi Ben,

syzbot will show info about qemu version/args in "VM info" column then
this commit is deployed (should happen by tomorrow);
https://github.com/google/syzkaller/commit/4a3131941837f1fab321bcdfcac13ac4fb480684

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
