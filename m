Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9477FC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 22:25:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D5C64FBB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 22:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D5C64FBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HILlYZiHfJgiJu/jnFTdkK7XjfiW+mCDvd5IbFgD8pg=; b=cnOulFpOCvhTrzjs3hRH9QcsM
	y37PPDv/0PIyRMLJZ7I1BWQs5DTaiK2vuyuiuyB3dHBepkGoxBY3vxnV5nEAHNUBVOt2fvbfxabLs
	7UbmLLcWqvIuf98oNt7T7c3vWRc60P/Awmg+BgStP53ribtjV/ABlYJLxTqYDW1dBegEj1mWk/Wpt
	fhkGOCh96axB/qdcGefC9vLfNTFPOhTQb/O6HxopExDIH3ZIHnED8qy4848uEehiNNwq5IP1X8OdQ
	bGnQVbWAnyp2/lUvXLOV0Rm+4hD5DvuzJjaQBs0iPpdBRTwI0qHf1brSka7JJtnWfjClqPcW4uedS
	TbMayimNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK7GY-007u4A-55; Wed, 10 Mar 2021 22:25:18 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK7GO-007u39-5y
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 22:25:10 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lK7Fq-0003X1-2e; Wed, 10 Mar 2021 22:24:34 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Dmitry Vyukov <dvyukov@google.com>,
 syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>,
 Benjamin Segall <bsegall@google.com>, dietmar.eggemann@arm.com,
 Juri Lelli <juri.lelli@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <dbdca868-7ef2-47b3-ac26-12fe61f3156a@codethink.co.uk>
Date: Wed, 10 Mar 2021 22:24:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_222508_438330_3E62A589 
X-CRM114-Status: GOOD (  27.13  )
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

On 10/03/2021 17:16, Dmitry Vyukov wrote:
> On Wed, Mar 10, 2021 at 5:46 PM syzbot
> <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1212c6e6d00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
>> dashboard link: https://syzkaller.appspot.com/bug?extid=e74b94fe601ab9552d69
>> userspace arch: riscv64
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
> 
> +riscv maintainers
> 
> This is riscv64-specific.
> I've seen similar crashes in put_user in other places. It looks like
> put_user crashes in the user address is not mapped/protected (?).

The unmapped case should have been handled.

I think this issue is that the check for user-mode access added. From
what I read the code may be wrong in

+	if (!user_mode(regs) && addr < TASK_SIZE &&
+			unlikely(!(regs->status & SR_SUM)))
+		die_kernel_fault("access to user memory without uaccess routines",
+				addr, regs);

I think the SR_SUM check might be wrong, as I read the standard the
SR_SUM should be set to disable user-space access. So the check
should be unlikely(regs->status & SR_SUM) to say access without
having disabled the protection.

Without this, you can end up with an infinite loop in the fault handler.

> 
>> Unable to handle kernel access to user memory without uaccess routines at virtual address 000000002749f0d0
>> Oops [#1]
>> Modules linked in:
>> CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>> Hardware name: riscv-virtio,qemu (DT)
>> epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>   ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>   ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>> epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>   gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>   t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>   s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>   a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>   a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>   s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>   s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>   s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>   s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>   t5 : ffffffc4043cafba t6 : 0000000000040000
>> status: 0000000000000120 badaddr: 000000002749f0d0 cause: 000000000000000f
>> Call Trace:
>> [<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>> [<ffffffe000005570>] ret_from_exception+0x0/0x14
>> Dumping ftrace buffer:
>>     (ftrace buffer empty)
>> ---[ end trace b5f8f9231dc87dda ]---
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> --
>> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000b74f1b05bd316729%40google.com.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
