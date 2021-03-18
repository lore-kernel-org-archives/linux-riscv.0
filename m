Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1F4C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 17:42:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE4064F10
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 17:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE4064F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mJM2+SVYy2rq2WYuWVv+hBSoepIXf/Pypn6iWfH4ugE=; b=EsJFDuEHAySjCxP8JTeL/7oxG
	O/k8/IWPp6//j9DAcwPhWkGxR6NubdllhCQ4wjXoZE/CMgITnlWIFgluouzRwW01R2b97CiBdg9cq
	nMvo9Xx3O9thHuvSlz0Xy2moJ9tfX1IxEj/cvdE819SoguNyLQqe6eCPpPfHt7JzMpySNoUzNyE/H
	SZbBS6mHoLImwLgPDHiP0QgisJW1aretsWaxeKyTw3I4pXp4bDd8OpeOGOO7V7Reqa+5H4Gu3yxTF
	bt76g0eRCHVzShzRzzSSodtdMVD9mMHwmYWIhTBdPHv9WElLSZfMr/sTpXiG7LoQ/TptziX5B4+u1
	1iJZSAPIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMwex-005lqq-Q3; Thu, 18 Mar 2021 17:42:11 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMwet-005lqC-2R
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 17:42:09 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lMwer-0004Gz-1n; Thu, 18 Mar 2021 17:42:05 +0000
Subject: Re: [PATCH] RFC: riscv: save the SR_SUM status over switches
To: Alex Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Terry Hu <kejia.hu@codethink.co.uk>,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Dmitry Vyukov <dvyukov@google.com>,
 Javier Jardon <javier.jardon@codethink.co.uk>
References: <20210318151010.100966-1-ben.dooks@codethink.co.uk>
 <d745046a-182a-2854-8fd4-d6f120aa3bce@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <451e8f69-248d-82fb-f368-e2972eea83c7@codethink.co.uk>
Date: Thu, 18 Mar 2021 17:42:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d745046a-182a-2854-8fd4-d6f120aa3bce@ghiti.fr>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_174207_200980_28FBD4E7 
X-CRM114-Status: GOOD (  40.90  )
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

On 18/03/2021 16:57, Alex Ghiti wrote:
> Hi Ben,
> =

> Le 3/18/21 =E0 11:10 AM, Ben Dooks a =E9crit=A0:
>> When threads/tasks are switched we need to ensure the old execution's
>> SR_SUM state is saved and the new thread has the old SR_SUM state
>> restored.
>>
>> The issue is seen under heavy load especially with the syz-stress tool
>> running, with crashes as follows in schedule_tail:
>>
>> Unable to handle kernel access to user memory without uaccess routines =

>> at virtual address 000000002749f0d0
>> Oops [#1]
>> Modules linked in:
>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted =

>> 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>> Hardware name: riscv-virtio,qemu (DT)
>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>> =A0 ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>> =A0 ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>> =A0 gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>> =A0 t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>> =A0 s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>> =A0 a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>> =A0 a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>> =A0 s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>> =A0 s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>> =A0 s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>> =A0 s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>> =A0 t5 : ffffffc4043cafba t6 : 0000000000040000
>> status: 0000000000000120 badaddr: 000000002749f0d0 cause: =

>> 000000000000000f
>> Call Trace:
>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>> Dumping ftrace buffer:
>> =A0=A0=A0 (ftrace buffer empty)
>> ---[ end trace b5f8f9231dc87dda ]---
>>
>> The issue comes from the put_user() in schedule_tail =

>> (kernel/sched/core.c)
>> doing the following:
>>
>> asmlinkage __visible void schedule_tail(struct task_struct *prev)
>> {
>> ...
>> =A0=A0=A0=A0=A0=A0=A0=A0 if (current->set_child_tid)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 put_user(task_pid_vnr(c=
urrent), current->set_child_tid);
>> ...
>> }
>>
>> the put_user() macro causes the code sequence to come out as follows:
>>
>> 1:=A0=A0=A0 __enable_user_access()
>> 2:=A0=A0=A0 reg =3D task_pid_vnr(current);
>> 3:=A0=A0=A0 *current->set_child_tid =3D reg;
>> 4:=A0=A0=A0 __disable_user_access()
>>
>> This means the task_pid_vnr() is being called with user-access enabled
>> which itself is not a good idea, but that is a seperate issue. Here we
>> have a function that /might/ sleep being called with the SR_SUM and if
>> it does, then it returns with the SR_SUM flag possibly cleared thus
>> causing the above abort.
>>
>> To try and deal with this, and stop the SR_SUM leaking out into other
>> threads (this has also been tested and see under stress. It can rarely
>> happen but it /does/ under load) make sure the __switch_to() will save
>> and restore the SR_SUM flag, and clear it possibly for the next thread
>> if it does not need it.
>>
>> Note, test code to be supplied once other checks have been finished.
> =

> Very nice, good catch !

Yes, this has taken about 3 days of work to find (thank you to Codethink
for not making me do more boring work).

I'll try and make a blog post, a talk and some of the tools/patches used
available for people to look at.

So far this patch has been running syz-stress under qemu-riscv64 for
about 2 hours without an issue. My heating bill might be a bit reduced
for today.

>>
>> There may be further issues with the mstatus flags with this, this
>> can be discussed further once some initial testing has been done.
> =

> Yes, that must be discussed, I don't have opinion right now but if this =

> is the only bit to save/restore, we may consider other options: disable =

> preemption, using __typeof(x) like suggested by Dmitry to avoid being =

> scheduled and maybe other options.

I had a go at the typeof, it made a lot of messy kernel warnings and I
am not sure if it will actually fully fix things as gcc may well move
things around anyway.

There really does need to be a fix for the amount of code that might
be executed under put_user(), but I think the correct thing to do is
to ensure that the flags are saved over the switch_to().

I'm not sure if disabling pre-emption is great either as there are now
kernel sections where the access is disabled for using the "unsafe"
versions of the user space access.

>>
>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>> Cc: Dmitry Vyukov <dvyukov@google.com>
>> Cc: Javier Jardon <javier.jardon@codethink.co.uk>
>> ---
>> =A0 arch/riscv/include/asm/processor.h | 1 +
>> =A0 arch/riscv/kernel/asm-offsets.c=A0=A0=A0 | 5 +++++
>> =A0 arch/riscv/kernel/entry.S=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 7 +++++++
>> =A0 3 files changed, 13 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/processor.h =

>> b/arch/riscv/include/asm/processor.h
>> index 021ed64ee608..e2398c6e7af9 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -35,6 +35,7 @@ struct thread_struct {
>> =A0=A0=A0=A0=A0 unsigned long s[12];=A0=A0=A0 /* s[0]: frame pointer */
>> =A0=A0=A0=A0=A0 struct __riscv_d_ext_state fstate;
>> =A0=A0=A0=A0=A0 unsigned long bad_cause;
>> +=A0=A0=A0 unsigned long flags;
> =

> I would not call it "flags", I'd rather use "status", named after =

> CSR_STATUS.

Ok, good idea. Not sure if it should be status or csr_status.

> =

>> =A0 };
>> =A0 #define INIT_THREAD {=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 \
>> diff --git a/arch/riscv/kernel/asm-offsets.c =

>> b/arch/riscv/kernel/asm-offsets.c
>> index 9ef33346853c..0036570752d9 100644
>> --- a/arch/riscv/kernel/asm-offsets.c
>> +++ b/arch/riscv/kernel/asm-offsets.c
>> @@ -29,6 +29,7 @@ void asm_offsets(void)
>> =A0=A0=A0=A0=A0 OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>> =A0=A0=A0=A0=A0 OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>> =A0=A0=A0=A0=A0 OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>> +=A0=A0=A0 OFFSET(TASK_THREAD_FLAGS, task_struct, thread.flags);
>> =A0=A0=A0=A0=A0 OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>> =A0=A0=A0=A0=A0 OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, =

>> thread_info.preempt_count);
>> =A0=A0=A0=A0=A0 OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kerne=
l_sp);
>> @@ -172,6 +173,10 @@ void asm_offsets(void)
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 offsetof(struct task_struct, thread.s[=
11])
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 - offsetof(struct task_struct, thread.ra)
>> =A0=A0=A0=A0=A0 );
>> +=A0=A0=A0 DEFINE(TASK_THREAD_FLAGS_RA,
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 offsetof(struct task_struct, thread.flags)
>> +=A0=A0=A0=A0=A0=A0=A0 - offsetof(struct task_struct, thread.ra)
>> +=A0=A0=A0 );
>> =A0=A0=A0=A0=A0 DEFINE(TASK_THREAD_F0_F0,
>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 offsetof(struct task_struct, thread.fs=
tate.f[0])
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 744f3209c48d..6137f6c2a2ad 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -417,7 +417,14 @@ ENTRY(__switch_to)
>> =A0=A0=A0=A0=A0 REG_S s9,=A0 TASK_THREAD_S9_RA(a3)
>> =A0=A0=A0=A0=A0 REG_S s10, TASK_THREAD_S10_RA(a3)
>> =A0=A0=A0=A0=A0 REG_S s11, TASK_THREAD_S11_RA(a3)
>> +=A0=A0=A0 /* save (and disable the user space access flag) */
>> +=A0=A0=A0 li=A0=A0=A0 s0, SR_SUM
>> +=A0=A0=A0 csrrc s1, CSR_STATUS, s0
> =

> I don't think that clearing SR_SUM is needed here since you restore its =

> value later on.

The restore I think requires the flag to have been cleared.

>> +=A0=A0=A0 REG_S s1,=A0 TASK_THREAD_FLAGS_RA(a3)
>> +
>> =A0=A0=A0=A0=A0 /* Restore context from next->thread */
>> +=A0=A0=A0 REG_L s0,=A0 TASK_THREAD_FLAGS_RA(a4)
>> +=A0=A0=A0 csrs=A0 CSR_STATUS, s0
>> =A0=A0=A0=A0=A0 REG_L ra,=A0 TASK_THREAD_RA_RA(a4)
>> =A0=A0=A0=A0=A0 REG_L sp,=A0 TASK_THREAD_SP_RA(a4)
>> =A0=A0=A0=A0=A0 REG_L s0,=A0 TASK_THREAD_S0_RA(a4)
>>
> =

> Again, very nice finding, well done :)
> =

> Alex
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =



-- =

Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
