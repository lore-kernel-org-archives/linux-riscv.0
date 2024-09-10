Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF51EDE9AB
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Sep 2024 19:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Oej9Ds51PCObnWPXmVDQvNDnlYMijzuBAOP2n45GCw=; b=wYyJ9nIsqckg1Y
	O0AAcUuBb53ZLi310vg0awB/684l5P8FgfT1e5K3d/Ckac6WgdL2enDH1c1bdnBm53frnV63kaU2I
	ITFOy5LV2wBgWnglciuH1hd8AzkWifrwVABKnLWnlW9C87YlXsEQ/E6daXCXCc+ZrBt4Th9nSXst3
	jsOSsQ8hzph525v8T1wi7uM3nv/nVONvNnZ4tCsPIt5QHAGQtr0JfDdII0YFwgd6bt9pKWdGDjy4x
	5XdsX630tbu8ZVN/88w/R5uHExO3LV84eDFcgvZnDzPlEv/odGhhZ1GGI8EJReiqdT0sfwgOrsAep
	10dOUoVsnZ2hfEQ4fvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so668-00000006p9R-3mx7;
	Tue, 10 Sep 2024 19:00:20 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so658-00000006ovB-0iSe
	for linux-riscv@lists.infradead.org;
	Tue, 10 Sep 2024 18:59:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDCA3FF803;
	Tue, 10 Sep 2024 18:59:09 +0000 (UTC)
Message-ID: <77d0f59f-554b-4cd9-ae1c-4c89a76058ef@ghiti.fr>
Date: Tue, 10 Sep 2024 20:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6] membarrier: riscv: Add full memory barrier in
 switch_mm()
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: WangYuli <wangyuli@uniontech.com>, stable@vger.kernel.org,
 sashal@kernel.org, parri.andrea@gmail.com, mathieu.desnoyers@efficios.com,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, paulmck@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
 brauner@kernel.org, arnd@arndb.de
References: <10F34E3A3BFBC534+20240909025701.1101397-1-wangyuli@uniontech.com>
 <2024091002-caution-tinderbox-a847@gregkh>
 <364e0e33-68ad-4f0c-86f1-f6a95def9a30@ghiti.fr>
 <2024091037-errant-countdown-4928@gregkh>
 <5d486ff8-2ab5-4ed5-a1da-c2817927b3a2@ghiti.fr>
 <2024091056-bogus-whoops-4bde@gregkh>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <2024091056-bogus-whoops-4bde@gregkh>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_115918_507934_1D88AD40 
X-CRM114-Status: GOOD (  20.98  )
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

On 10/09/2024 15:25, Greg KH wrote:
> On Tue, Sep 10, 2024 at 02:35:06PM +0200, Alexandre Ghiti wrote:
>> On 10/09/2024 13:58, Greg KH wrote:
>>> On Tue, Sep 10, 2024 at 01:31:04PM +0200, Alexandre Ghiti wrote:
>>>> Hi Greg,
>>>>
>>>> On 10/09/2024 09:32, Greg KH wrote:
>>>>> On Mon, Sep 09, 2024 at 10:57:01AM +0800, WangYuli wrote:
>>>>>> From: Andrea Parri <parri.andrea@gmail.com>
>>>>>>
>>>>>> [ Upstream commit d6cfd1770f20392d7009ae1fdb04733794514fa9 ]
>>>>>>
>>>>>> The membarrier system call requires a full memory barrier after storing
>>>>>> to rq->curr, before going back to user-space.  The barrier is only
>>>>>> needed when switching between processes: the barrier is implied by
>>>>>> mmdrop() when switching from kernel to userspace, and it's not needed
>>>>>> when switching from userspace to kernel.
>>>>>>
>>>>>> Rely on the feature/mechanism ARCH_HAS_MEMBARRIER_CALLBACKS and on the
>>>>>> primitive membarrier_arch_switch_mm(), already adopted by the PowerPC
>>>>>> architecture, to insert the required barrier.
>>>>>>
>>>>>> Fixes: fab957c11efe2f ("RISC-V: Atomic and Locking Code")
>>>>>> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
>>>>>> Reviewed-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>>>>>> Link: https://lore.kernel.org/r/20240131144936.29190-2-parri.andrea@gmail.com
>>>>>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>>>>> Signed-off-by: WangYuli <wangyuli@uniontech.com>
>>>>>> ---
>>>>>>     MAINTAINERS                         |  2 +-
>>>>>>     arch/riscv/Kconfig                  |  1 +
>>>>>>     arch/riscv/include/asm/membarrier.h | 31 +++++++++++++++++++++++++++++
>>>>>>     arch/riscv/mm/context.c             |  2 ++
>>>>>>     kernel/sched/core.c                 |  5 +++--
>>>>>>     5 files changed, 38 insertions(+), 3 deletions(-)
>>>>>>     create mode 100644 arch/riscv/include/asm/membarrier.h
>>>>> Now queued up, thanks.
>>>> The original patch was merged in 6.9 and the Fixes tag points to a commit
>>>> introduced in v4.15. So IIUC, this patch should have been backported
>>>> "automatically" to the releases < 6.9 right? As stated in the documentation
>>>> (process/stable-kernel-rules.html):
>>>>
>>>> "Note, such tagging is unnecessary if the stable team can derive the
>>>> appropriate versions from Fixes: tags."
>>>>
>>>> Or did we miss something?
>>> Yes, you didn't tag cc: stable at all in this commit, which is why we
>>> did not see it.  The documentation says that :)
>>
>> Ok, some patches seem to make it to stable without the cc: stable tag (like
>> the one below for example), so I thought it was not necessary.
> Yes, they do, because many maintainers and developers don't follow the
> normal rules, so we sweep the tree when we have a chance and do a "best
> effort" backport at times.
>
> But again, it is NOT guaranteed that this will happen, and even if it
> does, you will NOT get emails saying the attempt-at-backporting fails,
> if it fails, as obviously the developers involved weren't explicitly
> asking for it to be backported.
>
> So in short, just properly tag things for stable, and all will be fine.


Great, thank you, I'll make sure we tag the fixes to backport properly!

Thanks again,

Alex


>
> thanks,
>
> greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
