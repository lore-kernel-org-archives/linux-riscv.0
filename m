Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFC5C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:50:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527F064E22
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 14:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 527F064E22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X7GHQiQZYgBJO/DPHakt4YvBrUKIz76qMp3NS2XTiPI=; b=dRQZpiZUokMzGPLTUko1G3bwc
	t6JHNMcfp0gGOLCanlfFAbQ+fzoXoGpqhU0yeLbY2kXmQOeEEWptL0geqMz1BCpwtdiHIUZHc6XZ3
	O77rdPXa38T01KcFhbG4fmgI1sx47PoT39aLzUBqrXjf2d6A1bSV7YWVpH65kSR+x7vgx/rOQoF2L
	fA2l7ATlCY7I1YalSRXA9TfTvSjmj523EVZkWfOVCuxLDq+varb5SNF1PN8czOAQOrzvN9bY3aF19
	93ITe2Lj0XMR5LqxUBG1YZEwcJZHvRa6z8tg0UxTp/IMgQHYzsNkAfpFd1DPbCm4opd8CKpc/pcRl
	0h8b+khRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtyS-005WNj-Ga; Thu, 18 Mar 2021 14:50:08 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtyN-005WMx-2t
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 14:50:07 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1VJT3grTzkbMB;
 Thu, 18 Mar 2021 22:48:25 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 18 Mar 2021 22:49:55 +0800
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
To: Dmitry Vyukov <dvyukov@google.com>
CC: syzbot <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>, Albert Ou
 <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Thomas Gleixner
 <tglx@linutronix.de>
References: <00000000000056b18b05bd7c6511@google.com>
 <CACT4Y+brvecfGUk7H7-mcJ82NxbEuETv+js0nRxpV7zc1AZH5w@mail.gmail.com>
 <c82390e5-33f6-75f6-6b93-c618537413e5@huawei.com>
 <CACT4Y+ZpfAiQKagp5xr0HY85SRr2h6pe10emm4_B5RLfVraN9A@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <093ff4d1-3977-1085-404f-ec46a3b1d8f0@huawei.com>
Date: Thu, 18 Mar 2021 22:49:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+ZpfAiQKagp5xr0HY85SRr2h6pe10emm4_B5RLfVraN9A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_145003_522887_F336FD96 
X-CRM114-Status: GOOD (  13.25  )
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


On 2021/3/18 22:11, Dmitry Vyukov wrote:
> On Thu, Mar 18, 2021 at 1:21 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> On 2021/3/14 18:47, Dmitry Vyukov wrote:
>>> On Sun, Mar 14, 2021 at 11:14 AM syzbot
>>> <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com> wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=15a35756d00000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0b708b31626cc
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=005654dd9b8f26bd4c07
>>>> userspace arch: riscv64
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com
>>>>
>>>> ==================================================================
>>>> BUG: KASAN: slab-out-of-bounds in riscv_intc_irq+0x24/0xcc drivers/irqchip/irq-riscv-intc.c:24
>>>> Read of size 8 at addr ffffffe00c963bd0 by task kworker/1:1/4388
>>>>
>>>> CPU: 1 PID: 4388 Comm: kworker/1:1 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>> Hardware name: riscv-virtio,qemu (DT)
>>>> Workqueue: events nsim_dev_trap_report_work
>>>> Call Trace:
>>>> [<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
>>>>
>>>> Allocated by task 76347056:
>>>> (stack is not available)
>>>>
>>>> Last potentially related work creation:
>>> There seems to be some issue with riscv stack unwinder.
>>> This does not have stacks.
>> Hi, could you test with the following  patch about the no stack
>> issue(from v5.11-rc4), I made a mistake when do some cleanup...
>>
>> https://lore.kernel.org/linux-riscv/ce5b3533-b75d-c31c-4319-9d29769bbbd5@huawei.com/T/#t
> Hi Kefeng,
>
> Please see:
> http://bit.do/syzbot#no-custom-patches
>
> Is a unit-test for this possible? Fuzzing is not a replacement for unit testing.

ok, I mean that the issue about stack unwinder which may cause by my 
previous patch,

if some one want the stack back, it could try the bugfix.

> .
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
