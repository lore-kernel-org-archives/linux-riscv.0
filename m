Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6690C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 14:52:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DD4C64E76
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 14:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DD4C64E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eBDWELHo1m5wsy378bc+YxKfOelRQW6t8+IydwTovxg=; b=ows9m2fr+IA+6/5GxJNvjS5Ic
	1ryAXkvBvgQ8rwS+FTCIvCELDdKtvGW9GKeX2DvBGNTRAxnaPBTnVOzS60MhAhEjRK91osHp44Sxq
	hryJkwqztV7/PFsmyT2NZzMYuy4YHOUttEbGY1Jj19duiOrzoDCUbibUX10eMDMnDsECrXNLH9i9k
	Deig6W+k67HvFQUQdo+qib3padgayZBqrbybaO2ZeBY8bGW0OoPsOD5902wV+KSRgboa49rsWmCnE
	CtzPccekolUTjw7ZcxLIpBRt2aDoRTKmXC9DKpYtZFMPGbCh2l43qm/JcQqvAhg8TW2Dpdobt3U8M
	olE91xrew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLoZd-00GBi4-3H; Mon, 15 Mar 2021 14:52:01 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLoPw-00G8I6-7t
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 14:42:06 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lLoPf-0004SH-9m; Mon, 15 Mar 2021 14:41:43 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 sock_ioctl
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, andrii@kernel.org,
 Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, David Miller <davem@davemloft.net>,
 John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>,
 kpsingh@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Song Liu <songliubraving@fb.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Yonghong Song <yhs@fb.com>
References: <00000000000096cdaa05bd32d46f@google.com>
 <CACT4Y+ZjdOaX_X530p+vPbG4mbtUuFsJ1v-gD24T4DnFUqcudA@mail.gmail.com>
 <CACT4Y+ZjVS+nOxtEByF5-djuhbCYLSDdZ7V04qJ0edpQR0514A@mail.gmail.com>
 <CACT4Y+YXifnCtEvLu3ps8JLCK9CBLzEuUAozfNR9v1hsGWspOg@mail.gmail.com>
 <ed89390a-91e1-320a-fae5-27b7f3a20424@codethink.co.uk>
 <CACT4Y+a1pQ96UWEB3pAnbxPZ+6jW2tqSzkTMqJ+XSbZsKLHgAw@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <bf2e19a3-3e3a-0eb1-ae37-4cc3b1a7af42@codethink.co.uk>
Date: Mon, 15 Mar 2021 14:41:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACT4Y+a1pQ96UWEB3pAnbxPZ+6jW2tqSzkTMqJ+XSbZsKLHgAw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_144200_701705_40273021 
X-CRM114-Status: GOOD (  21.82  )
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

On 15/03/2021 11:52, Dmitry Vyukov wrote:
> On Mon, Mar 15, 2021 at 12:30 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>>
>> On 14/03/2021 11:03, Dmitry Vyukov wrote:
>>> On Sun, Mar 14, 2021 at 11:01 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>>>>> On Wed, Mar 10, 2021 at 7:28 PM syzbot
>>>>> <syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com> wrote:
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> syzbot found the following issue on:
>>>>>>
>>>>>> HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
>>>>>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>>>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=122c343ad00000
>>>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=e3c595255fb2d136
>>>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=c23c5421600e9b454849
>>>>>> userspace arch: riscv64
>>>>>>
>>>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>>>
>>>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>>>> Reported-by: syzbot+c23c5421600e9b454849@syzkaller.appspotmail.com
>>>>>
>>>>> +riscv maintainers
>>>>>
>>>>> Another case of put_user crashing.
>>>>
>>>> There are 58 crashes in sock_ioctl already. Somehow there is a very
>>>> significant skew towards crashing with this "user memory without
>>>> uaccess routines" in schedule_tail and sock_ioctl of all places in the
>>>> kernel that use put_user... This looks very strange... Any ideas
>>>> what's special about these 2 locations?
>>>
>>> I could imagine if such a crash happens after a previous stack
>>> overflow and now task data structures are corrupted. But f_getown does
>>> not look like a function that consumes way more than other kernel
>>> syscalls...
>>
>> The last crash I looked at suggested somehow put_user got re-entered
>> with the user protection turned back on. Either there is a path through
>> one of the kernel handlers where this happens or there's something
>> weird going on with qemu.
> 
> Is there any kind of tracking/reporting that would help to localize
> it? I could re-reproduce with that code.

I'm not sure. I will have a go at debugging on qemu today just to make
sure I can reproduce here before I have to go into the office and fix
my Icicle board for real hardware tests.

I think my first plan post reproduction is to stuff some trace points
into the fault handlers to see if we can get a idea of faults being
processed, etc.

Maybe also add a check in the fault handler to see if the fault was
in a fixable region and post an error if that happens / maybe retry
the instruction with the relevant SR_SUM flag set.

Hopefully tomorrow I can get a run on real hardware to confirm.
Would have been better if the Unmatched board I ordered last year
would turn up.




-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
