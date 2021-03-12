Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97753C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:31:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E61E964FD9
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E61E964FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lg4lr82OBoBCR9fQI+So/vquYNFGO841zgvU/0/2MeI=; b=NLIZHKfRaZ4Az7f1munOROGtV
	/029CEAMwY9Gs6qQD1kuVflKwigf/l7Zx2/qQWLmrtWyoE6SQTqcCDYA9BBB+ft1SqISDuDylgiHW
	twJOdeFeSN4E5KHWAGx2oKmt4q3nmexUmNErST/2KPuMhGZsRGuJS4gR2DL4HJYviS2HQclD6mc1W
	1q0ZtlR0tVByOdPE03NAxYmCAg4P7Xl/fgaPj3iIIDPOo9bf5Gvu2gRzW6liSsm++QZEQxlsPJxwR
	WkT5t0hBtxapv29ySqQ3QxW81mIFnUjn1AMu5fvu6E/hFiVIzykp169ANkE/j1cGBGw+mKp5IkuFS
	IyI4mX/pA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkga-00Bz79-LC; Fri, 12 Mar 2021 16:30:48 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkc3-00Bx1P-TE
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 16:26:11 +0000
X-Originating-IP: 81.185.170.228
Received: from [192.168.43.237] (228.170.185.81.rev.sfr.net [81.185.170.228])
 (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 43254E0003;
 Fri, 12 Mar 2021 16:25:57 +0000 (UTC)
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Dmitry Vyukov <dvyukov@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>
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
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <795597a1-ec87-e09e-d073-3daf10422abb@ghiti.fr>
Date: Fri, 12 Mar 2021 11:25:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_162609_304597_D4D03EE7 
X-CRM114-Status: GOOD (  29.32  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



Le 3/12/21 =E0 10:12 AM, Dmitry Vyukov a =E9crit=A0:
> On Fri, Mar 12, 2021 at 2:50 PM Ben Dooks <ben.dooks@codethink.co.uk> wro=
te:
>>
>> On 10/03/2021 17:16, Dmitry Vyukov wrote:
>>> On Wed, Mar 10, 2021 at 5:46 PM syzbot
>>> <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
>>>>
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup=
_tas..
>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/li=
nux.git fixes
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1212c6e6d0=
0000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3De3c595255f=
b2d136
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3De74b94fe601a=
b9552d69
>>>> userspace arch: riscv64
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the c=
ommit:
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
> =

> I would maybe blame qemu for randomly resetting SR_SUM, but it's
> strange that 99% of these crashes are in schedule_tail. If it would be
> qemu, then they would be more evenly distributed...
> =

> Another observation: looking at a dozen of crash logs, in none of
> these cases fuzzer was actually trying to fuzz clone with some insane
> arguments. So it looks like completely normal clone's (e..g coming
> from pthread_create) result in this crash.
> =

> I also wonder why there is ret_from_exception, is it normal? I see
> handle_exception disables SR_SUM:

csrrc does the right thing: it cleans SR_SUM bit in status but saves the =

previous value that will get correctly restored.

("The CSRRC (Atomic Read and Clear Bits in CSR) instruction reads the =

value of the CSR, zero-extends the value to XLEN bits, and writes it to =

integer registerrd.  The initial value in integerregisterrs1is treated =

as a bit mask that specifies bit positions to be cleared in the CSR. Any =

bitthat is high inrs1will cause the corresponding bit to be cleared in =

the CSR, if that CSR bit iswritable.  Other bits in the CSR are =

unaffected.")

> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/riscv/kernel/entry=
.S#L73

Still no luck for the moment, can't reproduce it locally, my test is =

maybe not that good (I created threads all day long in order to trigger =

the put_user of schedule_tail).

Given that the path you mention works most of the time, and that the =

status register in the stack trace shows the SUM bit is not set whereas =

it is set in put_user, I'm leaning toward some race condition (maybe an =

interrupt that arrives at the "wrong" time) or a qemu issue as you =

mentioned.

To eliminate qemu issues, do you have access to some HW ? Or to =

different qemu versions ?


> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
