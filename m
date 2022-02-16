Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93245C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 04:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOz2ZOC9ibfiXM18hAb4Ewdz+b5k0KUKT5F/XBAi2x8=; b=qzqdlgReoBibjb
	mDJQo21zcFHlKJVCLQzSnULLIObNIFoBxQYCV6MoaHk+hycydZQ2iYPNiIrFsqKHr0/tWum3fTIzB
	n4oj5bj8i4o24pQcLq2LoSbCzTqBcM70Ip/efGsXV/R35jBppSL0rvionqMpqwJojl3C28u8ncAtl
	uYLEbdtsjf+IpgNYxb7bVOr7aKIoS8Os9dSulCqE+A7UrD1/9YC+G19p5cKV7wF6zoyU5p7IiT8Yl
	wQbh9w9PqRssAe9+t3ePiLDj2kEkG4OGJY4/mw5HzEKjQCIFPAlZe2VjORhAk9R9zR2GmZDwxxpZH
	0U5t3cEBuOHyY9Wxv/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKBiU-005UMB-U6; Wed, 16 Feb 2022 04:14:58 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKBiQ-005UJN-VV
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 04:14:57 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by mail.gandi.net (Postfix) with ESMTPSA id B6207240002;
 Wed, 16 Feb 2022 04:14:48 +0000 (UTC)
Message-ID: <a0769218-c84a-a1d3-71e7-aefd40bf54fe@ghiti.fr>
Date: Wed, 16 Feb 2022 05:14:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance
Content-Language: en-US
To: Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Aleksandr Nogikh <nogikh@google.com>, linux-riscv@lists.infradead.org,
 kasan-dev <kasan-dev@googlegroups.com>, palmer@dabbelt.com,
 syzbot <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com>,
 LKML <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com
References: <00000000000038779505d5d8b372@google.com>
 <CANp29Y7WjwXwgxPrNq0XXjXPu+wGFqTreh9gry=O6aE7+cKpLQ@mail.gmail.com>
 <CA+zEjCvu76yW7zfM+qJUe+t5y23oPdzR4KDV1mOdqH8bB4GmTw@mail.gmail.com>
 <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CACT4Y+arufrRgwmN66wUU+_FGxMy-sTkjMQnRN8U2H2tQuhB7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_201455_365622_C269A9F2 
X-CRM114-Status: GOOD (  18.34  )
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

Hi Dmitry,

On 2/15/22 18:12, Dmitry Vyukov wrote:
> On Wed, 2 Feb 2022 at 14:18, Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
>> Hi Aleksandr,
>>
>> On Wed, Feb 2, 2022 at 12:08 PM Aleksandr Nogikh <nogikh@google.com> wrote:
>>> Hello,
>>>
>>> syzbot has already not been able to fuzz its RISC-V instance for 97
>> That's a longtime, I'll take a look more regularly.
>>
>>> days now because the compiled kernel cannot boot. I bisected the issue
>>> to the following commit:
>>>
>>> commit 54c5639d8f507ebefa814f574cb6f763033a72a5
>>> Author: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>>> Date:   Fri Oct 29 06:59:27 2021 +0200
>>>
>>>      riscv: Fix asan-stack clang build
>>>
>>> Apparently, the problem appears on GCC-built RISC-V kernels with KASAN
>>> enabled. In the previous message syzbot mentions
>>> "riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU
>>> Binutils for Debian) 2.35.2", but the issue also reproduces finely on
>>> a newer GCC compiler: "riscv64-linux-gnu-gcc (Debian 11.2.0-10)
>>> 11.2.0, GNU ld (GNU Binutils for Debian) 2.37".
>>> For convenience, I also duplicate the .config file from the bot's
>>> message: https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
>>>
>>> Can someone with KASAN and RISC-V expertise please take a look?
>> I'll take a look at that today.
>>
>> Thanks for reporting the issue,
>

I took a quick look, not enough to fix it but I know the issue comes 
from the inline instrumentation, I have no problem with the outline 
instrumentation. I need to find some cycles to work on this, my goal is 
to fix this for 5.17.

Sorry about the delay,

Alex


>
>
>>> --
>>> Best Regards,
>>> Aleksandr
>>>
>>>
>>> On Tue, Jan 18, 2022 at 11:26 AM syzbot
>>> <syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com> wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    f6f7fbb89bf8 riscv: dts: sifive unmatched: Link the tmp451..
>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=1095f85bb00000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=522544a2e0ef2a7d
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=330a558d94b58f7601be
>>>> compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
>>>> userspace arch: riscv64
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+330a558d94b58f7601be@syzkaller.appspotmail.com
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
