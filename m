Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A994C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:12:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423D964FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 15:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423D964FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lhg7O7E1ZCF3KGZBYsXY2SdVQqE46jtb3EY+zUJQsx4=; b=TuC/p0KFiTKMiCQlm5BHohyY7
	KmwKhmqxHMNGomyAlzNuv1yL1itjRsE+oF3K/JMxh+BLWXj62OMZ6if75PsTOa8DmV346jv4lD1xJ
	l+7WRm7MQBA8RiOujqTxktYZoKQiIEEgt2lDh5cBD9lzZhA7p8uznZ6rMr9ovqDBNlyA368tJL1pU
	Sz08xZUGBztMpVOE6yqu4zIceMLRgMpUltZlraS9R09Mj8Kr+EODHicltcqtfqO04T59IgTbyA4QL
	H12doiEkJuX//YeGUfqHjhdIbKKw1TEiq5E11gkhW1m+j/tOY5e3QS+UiWXxVotuA9shQ6DwEBvmv
	HLYBpTfqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjSw-00BkTf-4R; Fri, 12 Mar 2021 15:12:38 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjSo-00BkSj-5Z
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 15:12:34 +0000
Received: by mail-qt1-x82c.google.com with SMTP id m7so3947262qtq.11
 for <linux-riscv@lists.infradead.org>; Fri, 12 Mar 2021 07:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DyVA826gppINawo6JgubiSmdPww/CYUYD3ZLTreGL7w=;
 b=tFIPJ65LRLgMpSVeSNRpM8lnfe4GIOvvKUmAS2ffAt4BqlpwZzmsUJp8II5/zBMwis
 cOPn6EbxtDmAJ+nF+0rYGQM0vB54z6nphsAeGTIwmou/7bS5LxrA5JOCKDWibqTGnrF+
 +mnudZ5uLnoWP2U+klQHtE/ryW6mL+VSbSrEOoh5ojpJz8NGr6Eb6C2CJApFNKS10m4B
 qjPzjIur3t13eWO4cAZD8xNreEa0zHkKeKIY6jX9JzNxlvsh2yDV12rYBcVZu/QkavsK
 S+uArISOesJRuK945yajvP+42q31ll6jvo/fXOL8Zv5yra8KTUyS6bV7dPjv+lj/AByk
 LAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DyVA826gppINawo6JgubiSmdPww/CYUYD3ZLTreGL7w=;
 b=iD31d4jgGRoUCAcwXNwk8C1e7QgoUSET0lxWSczYyrb0V+A0Iblgm0yMXgJOytlKW0
 jHqqV6qz9z0SM8xufenctJD0wF+qQV/dUAL/xLJqkaD+uYPrbjBHEPRjSoppwADWrCu8
 DPEnLoQuAEfGCRDR8tiAuS2xFeqxPE/Oghkkb+D/f5WBp4NCju67UF7xdudi5s9X66kJ
 GLzBIbLTgNzcYf5xigBcvezt7ybrV8qtud1D7HO7/McHX/hDQbTLtlDoTWLpXdsrK3fZ
 xZCPLMirKxNxl5vs9sCCTr6CqyYg73k3ReD4HmSV4kHwJxhWCeystGTXXeLfbRsYfgLL
 B+yw==
X-Gm-Message-State: AOAM530dRDR/O2yHcXpZbwR4uTmkeEig7KtgNUORBx+t915lV2k/iq2R
 UQcNhVR6qH/h8gu4eLt2rRm70JIxt1WQRzYn21xDTQ==
X-Google-Smtp-Source: ABdhPJwQnq4SHt4jNFkKya1RPA8rCmYvSKLKR6cbeKiCaLk98KpYapZE6HW4dXSQU0ZB86atJ10H2EVRBgfv4aMmhak=
X-Received: by 2002:ac8:4558:: with SMTP id z24mr1159749qtn.66.1615561948503; 
 Fri, 12 Mar 2021 07:12:28 -0800 (PST)
MIME-Version: 1.0
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
 <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
In-Reply-To: <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 12 Mar 2021 16:12:16 +0100
Message-ID: <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210312_151231_702517_AB88F46A 
X-CRM114-Status: GOOD (  24.55  )
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

On Fri, Mar 12, 2021 at 2:50 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 10/03/2021 17:16, Dmitry Vyukov wrote:
> > On Wed, Mar 10, 2021 at 5:46 PM syzbot
> > <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
> >>
> >> Hello,
> >>
> >> syzbot found the following issue on:
> >>
> >> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
> >> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=1212c6e6d00000
> >> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
> >> dashboard link: https://syzkaller.appspot.com/bug?extid=e74b94fe601ab9552d69
> >> userspace arch: riscv64
> >>
> >> Unfortunately, I don't have any reproducer for this issue yet.
> >>
> >> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> >> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> >
> > +riscv maintainers
> >
> > This is riscv64-specific.
> > I've seen similar crashes in put_user in other places. It looks like
> > put_user crashes in the user address is not mapped/protected (?).
>
> I've been having a look, and this seems to be down to access of the
> tsk->set_child_tid variable. I assume the fuzzing here is to pass a
> bad address to clone?
>
>  From looking at the code, the put_user() code should have set the
> relevant SR_SUM bit (the value for this, which is 1<<18 is in the
> s2 register in the crash report) and from looking at the compiler
> output from my gcc-10, the code looks to be dong the relevant csrs
> and then csrc around the put_user
>
> So currently I do not understand how the above could have happened
> over than something re-tried the code seqeunce and ended up retrying
> the faulting instruction without the SR_SUM bit set.

I would maybe blame qemu for randomly resetting SR_SUM, but it's
strange that 99% of these crashes are in schedule_tail. If it would be
qemu, then they would be more evenly distributed...

Another observation: looking at a dozen of crash logs, in none of
these cases fuzzer was actually trying to fuzz clone with some insane
arguments. So it looks like completely normal clone's (e..g coming
from pthread_create) result in this crash.

I also wonder why there is ret_from_exception, is it normal? I see
handle_exception disables SR_SUM:
https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/riscv/kernel/entry.S#L73

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
