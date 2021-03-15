Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1423C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 16:56:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7436364F36
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 16:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7436364F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OSOV8qePwZRJt/2pUFq2G3l3gZwyQRZxguacgGerBcI=; b=dSMQTrRKMfr/WaPnDmYUxr9D0
	kSwWkfvMM81TqpkkXTf2IjhIhAaV04DBC1DZpT4Gqbn6sqFJQYKUo4kPPMBt1G0BQbYMBMEVlWKfC
	0pT0GTkVr8v0JBqFxO1Ry5Ky0cjuLOIQ5y6fyTHCBi+iHwWrJSD5n+SM5VPFhFOeC8CsE6RJTatJQ
	9cx+tCXfZrpHegC7VrB+b7eqm7IoumYNo9R8nr0W0pNXwcnYjfFTLlsn+zueihHDLRHxSmjsR4Kjn
	d2JXiDbD840lwc1plccGwlMdyEji02uqdtWwT90jbLtdxFu2WS5jHl+alUXruEH6dXq1zMWm8Vl+8
	ASl80Tdqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqVU-00GPKR-Lw; Mon, 15 Mar 2021 16:55:53 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqVL-00GPJr-CF
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 16:55:45 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lLqV7-0007HK-4n; Mon, 15 Mar 2021 16:55:29 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Alex Ghiti <alex@ghiti.fr>,
 syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>,
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
 <f9318e58-5d3f-f548-3dbf-a5cb87406a94@codethink.co.uk>
 <CACT4Y+bYDU-4MYotLfqgkGpz487aC8xQ0dqaNLwf76d1yyF-Vw@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <a0449f4a-4d54-6f38-1bc3-7c5170d24b86@codethink.co.uk>
Date: Mon, 15 Mar 2021 16:55:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+bYDU-4MYotLfqgkGpz487aC8xQ0dqaNLwf76d1yyF-Vw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_165543_590512_7B0529DC 
X-CRM114-Status: GOOD (  29.10  )
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

On 13/03/2021 07:20, Dmitry Vyukov wrote:
> On Fri, Mar 12, 2021 at 9:12 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:

>>> Still no luck for the moment, can't reproduce it locally, my test is
>>> maybe not that good (I created threads all day long in order to trigger
>>> the put_user of schedule_tail).
>>
>> It may of course depend on memory and other stuff. I did try to see if
>> it was possible to clone() with the child_tid address being a valid but
>> not mapped page...
>>
>>> Given that the path you mention works most of the time, and that the
>>> status register in the stack trace shows the SUM bit is not set whereas
>>> it is set in put_user, I'm leaning toward some race condition (maybe an
>>> interrupt that arrives at the "wrong" time) or a qemu issue as you
>>> mentioned.
>>
>> I suppose this is possible. From what I read it should get to the
>> point of being there with the SUM flag cleared, so either something
>> went wrong in trying to fix the instruction up or there's some other
>> error we're missing.
>>
>>> To eliminate qemu issues, do you have access to some HW ? Or to
>>> different qemu versions ?
>>
>> I do have access to a Microchip Polarfire board. I just need the
>> instructions on how to setup the test-code to make it work on the
>> hardware.
> 
> For full syzkaller support, it would need to know how to reboot these
> boards and get access to the console.
> syzkaller has a stop-gap VM backend which just uses ssh to a physical
> machine and expects the kernel to reboot on its own after any crashes.
> 
> But I actually managed to reproduce it in an even simpler setup.
> Assuming you have Go 1.15 and riscv64 cross-compiler gcc installed
> 
> $ go get -u -d github.com/google/syzkaller/...
> $ cd $GOPATH/src/github.com/google/syzkaller
> $ make stress executor TARGETARCH=riscv64
> $ scp bin/linux_riscv64/syz-execprog bin/linux_riscv64/syz-executor
> your_machine:/
> 
> Then run ./syz-stress on the machine.
> On the first run it crashed it with some other bug, on the second run
> I got the crash in schedule_tail.
> With qemu tcg I also added -slowdown=10 flag to syz-stress to scale
> all timeouts, if native execution is faster, then you don't need it.

I have built the tools and got it to start.

It would be helpful for the dashboard to give the qemu version and
how it was launched (memory, cpus etc)

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
