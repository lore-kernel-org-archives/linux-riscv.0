Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9DEC433E9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:31:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B5164F9E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B5164F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UH3UlsBINqHGL8n/zxgLbsA0Rj9GEsY6MekOjmTaguc=; b=i/922jtUKw55FF6InZvA7xfa9
	vI4LqbSPTr/MUbZ95bvRejiYfF07w8lAIkmEa5YFmUQF9JT7Y78prHChf3+DEcbzq+oYC9ETbnPk2
	1uHIaXPy+qOnVlKooANOKudLln0XKx5wNBN8z0MSgYB3nHHtN97hGQi/usmy+7D2Nko5hVTSZjCfC
	aVLNyFwX3Xz97lD6UVNYZ8eb8vmv0sS5jFe/4lVpY//bTi/Ga0WiEPPY8xca5Uwf88gN6PKSWuxGe
	J4ET91/MeBVPwYcHjP0SLrbf60ZIZqc25pvrVqdjYcc7UUI8G9mJHTWRYJRkekgqHbMi81e9eV62m
	9aDQVJBXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkhJ-00BzS5-0h; Fri, 12 Mar 2021 16:31:33 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkgH-00BywL-5O
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 16:30:34 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lKkfp-0002Lt-Oj; Fri, 12 Mar 2021 16:30:01 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Benjamin Segall <bsegall@google.com>, dietmar.eggemann@arm.com,
 Juri Lelli <juri.lelli@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
 <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
 <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <aa801bc7-cf6f-b77a-bbb0-28b0ff36e8ba@codethink.co.uk>
Date: Fri, 12 Mar 2021 16:30:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_163029_274031_9BF0FC2E 
X-CRM114-Status: GOOD (  28.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/03/2021 15:12, Dmitry Vyukov wrote:
> On Fri, Mar 12, 2021 at 2:50 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> On 10/03/2021 17:16, Dmitry Vyukov wrote:
>>> On Wed, Mar 10, 2021 at 5:46 PM syzbot
>>> <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1212c6e6d00000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=e74b94fe601ab9552d69
>>>> userspace arch: riscv64
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>
>>> +riscv maintainers
>>>
>>> This is riscv64-specific.
>>> I've seen similar crashes in put_user in other places. It looks like
>>> put_user crashes in the user address is not mapped/protected (?).
>>
>> I've been having a look, and this seems to be down to access of the
>> tsk->set_child_tid variable. I assume the fuzzing here is to pass a
>> bad address to clone?
>>
>>   From looking at the code, the put_user() code should have set the
>> relevant SR_SUM bit (the value for this, which is 1<<18 is in the
>> s2 register in the crash report) and from looking at the compiler
>> output from my gcc-10, the code looks to be dong the relevant csrs
>> and then csrc around the put_user
>>
>> So currently I do not understand how the above could have happened
>> over than something re-tried the code seqeunce and ended up retrying
>> the faulting instruction without the SR_SUM bit set.
> 
> I would maybe blame qemu for randomly resetting SR_SUM, but it's
> strange that 99% of these crashes are in schedule_tail. If it would be
> qemu, then they would be more evenly distributed...
> 
> Another observation: looking at a dozen of crash logs, in none of
> these cases fuzzer was actually trying to fuzz clone with some insane
> arguments. So it looks like completely normal clone's (e..g coming
> from pthread_create) result in this crash.
> 
> I also wonder why there is ret_from_exception, is it normal? I see
> handle_exception disables SR_SUM:
> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/riscv/kernel/entry.S#L73

So I think if SR_SUM is set, then it faults the access to user memory
which the _user() routines clear to allow them access.

I'm thinking there is at least one issue here:

- the test in fault is the wrong way around for die kernel
- the handler only catches this if the page has yet to be mapped.

So I think the test should be:

         if (!user_mode(regs) && addr < TASK_SIZE &&
                         unlikely(regs->status & SR_SUM)

This then should continue on and allow the rest of the handler to
complete mapping the page if it is not there.

I have been trying to create a very simple clone test, but so far it
has yet to actually trigger anything.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
