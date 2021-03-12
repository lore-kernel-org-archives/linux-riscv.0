Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106CCC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 20:50:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 994C964F52
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 20:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 994C964F52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MgbuQLQH9fCa36wQIrjfMwsfmsBfV0a6GhubdCWguI4=; b=YVvlrvUlkDSssBJDSe5L3rGNA
	ABEnbqjXM+qZNV1KGt/6cp0qT+FF4JM63I4tfrr/tJq+bSxpiko2j4MG3ql058L+FJMjU0dAt0qWz
	NMquGiG8YugHfLH9ZNerjGEmRsC9GyjzrLg9epMvBVDcLTog4607Lq5pvsR7xM1B52cHR5IsK4anK
	+qNlJLOBc2Bg75lKfVXrp1PHllKBFpKc2wzKLcZ6eRHvPt8edYIaB6csGc9JOgh9xQTjQ467+Lufr
	CTX+R0i9YlRLLdpCe5rgHoH6mYcpf9gYhSEjrgPc8SVFkSZIzkp39hssQtuZoY3qG+GqD4kmgcRAV
	41/VTBCIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKoje-00CNrV-6l; Fri, 12 Mar 2021 20:50:14 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKojL-00CNoI-Im
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 20:50:11 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lKo9S-0008FC-Jt; Fri, 12 Mar 2021 20:12:50 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Alex Ghiti <alex@ghiti.fr>, Dmitry Vyukov <dvyukov@google.com>
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
 <795597a1-ec87-e09e-d073-3daf10422abb@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f9318e58-5d3f-f548-3dbf-a5cb87406a94@codethink.co.uk>
Date: Fri, 12 Mar 2021 20:12:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <795597a1-ec87-e09e-d073-3daf10422abb@ghiti.fr>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_205007_714432_7BD822E1 
X-CRM114-Status: GOOD (  38.55  )
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

On 12/03/2021 16:25, Alex Ghiti wrote:
> =

> =

> Le 3/12/21 =E0 10:12 AM, Dmitry Vyukov a =E9crit=A0:
>> On Fri, Mar 12, 2021 at 2:50 PM Ben Dooks <ben.dooks@codethink.co.uk> =

>> wrote:
>>>
>>> On 10/03/2021 17:16, Dmitry Vyukov wrote:
>>>> On Wed, Mar 10, 2021 at 5:46 PM syzbot
>>>> <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
>>>>>
>>>>> Hello,
>>>>>
>>>>> syzbot found the following issue on:
>>>>>
>>>>> HEAD commit:=A0=A0=A0 0d7588ab riscv: process: Fix no prototype for =

>>>>> arch_dup_tas..
>>>>> git tree:       =

>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>>>>> console output: =

>>>>> https://syzkaller.appspot.com/x/log.txt?x=3D1212c6e6d00000
>>>>> kernel config:  =

>>>>> https://syzkaller.appspot.com/x/.config?x=3De3c595255fb2d136
>>>>> dashboard link: =

>>>>> https://syzkaller.appspot.com/bug?extid=3De74b94fe601ab9552d69
>>>>> userspace arch: riscv64
>>>>>
>>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>>
>>>>> IMPORTANT: if you fix the issue, please add the following tag to =

>>>>> the commit:
>>>>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>
>>>> +riscv maintainers
>>>>
>>>> This is riscv64-specific.
>>>> I've seen similar crashes in put_user in other places. It looks like
>>>> put_user crashes in the user address is not mapped/protected (?).
>>>
>>> I've been having a look, and this seems to be down to access of the
>>> tsk->set_child_tid variable. I assume the fuzzing here is to pass a
>>> bad address to clone?
>>>
>>> =A0 From looking at the code, the put_user() code should have set the
>>> relevant SR_SUM bit (the value for this, which is 1<<18 is in the
>>> s2 register in the crash report) and from looking at the compiler
>>> output from my gcc-10, the code looks to be dong the relevant csrs
>>> and then csrc around the put_user
>>>
>>> So currently I do not understand how the above could have happened
>>> over than something re-tried the code seqeunce and ended up retrying
>>> the faulting instruction without the SR_SUM bit set.
>>
>> I would maybe blame qemu for randomly resetting SR_SUM, but it's
>> strange that 99% of these crashes are in schedule_tail. If it would be
>> qemu, then they would be more evenly distributed...
>>
>> Another observation: looking at a dozen of crash logs, in none of
>> these cases fuzzer was actually trying to fuzz clone with some insane
>> arguments. So it looks like completely normal clone's (e..g coming
>> from pthread_create) result in this crash.
>>
>> I also wonder why there is ret_from_exception, is it normal? I see
>> handle_exception disables SR_SUM:
> =

> csrrc does the right thing: it cleans SR_SUM bit in status but saves the =

> previous value that will get correctly restored.
> =

> ("The CSRRC (Atomic Read and Clear Bits in CSR) instruction reads the =

> value of the CSR, zero-extends the value to XLEN bits, and writes it to =

> integer registerrd.=A0 The initial value in integerregisterrs1is treated =

> as a bit mask that specifies bit positions to be cleared in the CSR. Any =

> bitthat is high inrs1will cause the corresponding bit to be cleared in =

> the CSR, if that CSR bit iswritable.=A0 Other bits in the CSR are =

> unaffected.")

I think there may also be an understanding issue on what the SR_SUM
bit does. I thought if it is set, M->U accesses would fault, which is
why it gets set early on. But from reading the uaccess code it looks
like the uaccess code sets it on entry and then clears on exit.

I am very confused. Is there a master reference for rv64?

https://people.eecs.berkeley.edu/~krste/papers/riscv-privileged-v1.9.pdf
seems to state PUM is the SR_SUM bit, and that (if set) disabled

Quote:
  The PUM (Protect User Memory) bit modifies the privilege with which =

S-mode loads, stores, and instruction fetches access virtual memory. =

When PUM=3D0, translation and protection behave as normal. When PUM=3D1, =

S-mode memory accesses to pages that are accessible by U-mode (U=3D1 in =

Figure 4.19) will fault. PUM has no effect when executing in U-mode


>> https://elixir.bootlin.com/linux/v5.12-rc2/source/arch/riscv/kernel/entr=
y.S#L73 =

>>
> =

> Still no luck for the moment, can't reproduce it locally, my test is =

> maybe not that good (I created threads all day long in order to trigger =

> the put_user of schedule_tail).

It may of course depend on memory and other stuff. I did try to see if
it was possible to clone() with the child_tid address being a valid but
not mapped page...

> Given that the path you mention works most of the time, and that the =

> status register in the stack trace shows the SUM bit is not set whereas =

> it is set in put_user, I'm leaning toward some race condition (maybe an =

> interrupt that arrives at the "wrong" time) or a qemu issue as you =

> mentioned.

I suppose this is possible. From what I read it should get to the
point of being there with the SUM flag cleared, so either something
went wrong in trying to fix the instruction up or there's some other
error we're missing.

> To eliminate qemu issues, do you have access to some HW ? Or to =

> different qemu versions ?

I do have access to a Microchip Polarfire board. I just need the
instructions on how to setup the test-code to make it work on the
hardware.

The config supplied takes /ages/ to boot on qemu even on my ryzen9.

-- =

Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
