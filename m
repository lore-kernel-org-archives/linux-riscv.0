Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF46C61D99
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 02:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33x9rXYNTXOulXAKbc92UqwlGsJ5fVDx2e7S90DSpeQ=; b=EkWJsS/wncd2Sz
	sD0aSvOY3Kz7ro9H3IGLS6//qdx7zVz6+ddIC2zcXbcbcgYlMVqYc3+dXP1q2rG3WicvV2WaOxb4Q
	8K2twKmHgaJybgChNVemxi4FdGg8+e0joqULVh2XezD/PNKLP7KaCnmVSHoA8hXIrAhpiRCgEE6qQ
	g/jAaBgLYOVm+9y6nSDf1xVV7djdh4F7BfiOAfPX472eOqw8bg2TPzwpZI3DejYeDMCD16eO2y1uD
	yqkxTLNMcmFlbLF/Yj6omiQNOqDCmqP7dOOq/ELLdiG/Hr4M8kA6rUcFVF2Td/E7wO+5/DHl4O7e6
	2QY4IfVSVG9uqsgZU+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5zDf-003ZLd-1z;
	Thu, 23 Nov 2023 02:13:31 +0000
Received: from [2607:5300:203:b2ee::31e5] (helo=smtpout.efficios.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5zDa-003ZL2-2B
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 02:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1700705597;
	bh=/iv6gHY+vJGMSPrVKbAaM5xdtaRFsSNH4rODAL5Qm/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JUxXpa2kpeCMpLtm+AkR3IqmWuVsA+w1oQ5TgjRdq6z/uW/Tu+n+n7z5CISQm3T+l
	 y8i7ltnVNv7hzsy+n+ql7+sJyRDXXLfM2Knpq33vQEcej3wRJr+ERuAOnrZoMfLBGG
	 ZSjrxQrgYSOGvQgwUpjULsga43Sev4hTZ57xMDlvD7fa1YE0/s8hFYgPxMTnAoqb+x
	 lizz/2lYu5g/E8ahvsIYmAgGQo6OkP21vMbcPvEvbmQPcE6ESNDm2VAKKOHswDjCmr
	 2QzNCBlAyUZl/9cAUmLJT+Dig7Vs3TeJx0At3oHMphI2pf9IlsRIIMWuIX05NmnMpN
	 aIHHdxK0npN0A==
Received: from [IPV6:2606:6d00:100:4000:cacb:9855:de1f:ded2] (unknown [IPv6:2606:6d00:100:4000:cacb:9855:de1f:ded2])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4SbM8s2tjLz1dHp;
	Wed, 22 Nov 2023 21:13:17 -0500 (EST)
Message-ID: <790b8b57-43ac-447a-96b9-150e5b3a4237@efficios.com>
Date: Wed, 22 Nov 2023 21:13:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] membarrier: riscv: Provide core serializing command
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>,
 Andrea Parri <parri.andrea@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, rehn@rivosinc.com,
 paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, mmaas@google.com, hboehm@google.com,
 striker@us.ibm.com
References: <mhng-b720eb90-633f-498b-a487-0cfdc9f00ddd@palmer-ri-x1c9>
 <65e98129-0617-49ca-9802-8e3a46d58d29@efficios.com> <ZU0sliwUQJyNAH1y@andrea>
 <ZV6lxsRmuN7bYFnD@ghost>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
In-Reply-To: <ZV6lxsRmuN7bYFnD@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_181327_233761_9382FF2C 
X-CRM114-Status: GOOD (  13.87  )
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

On 2023-11-22 20:07, Charlie Jenkins wrote:
> On Thu, Nov 09, 2023 at 08:24:58PM +0100, Andrea Parri wrote:
>> Mathieu, all,
>>
>> Sorry for the delay,
>>
>>> AFAIR this patch implements sync_core_before_usermode which gets used by
>>> membarrier_mm_sync_core_before_usermode() to handle the uthread->kthread->uthread
>>> case. It relies on switch_mm issuing a core serializing instruction as well.
>>>
>>> Looking at RISC-V switch_mm(), I see that switch_mm() calls:
>>>
>>>    flush_icache_deferred(next, cpu);
>>>
>>> which only issues a fence.i if a deferred icache flush was required. We're
>>> missing the part that sets the icache_stale_mask cpumask bits when a
>>> MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked.
>>
>> [...]
>>
>>> The only part where I think you may want to keep some level of deferred
>>> icache flushing as you do now is as follows:
>>>
>>> - when membarrier MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is invoked,
>>>    call a new architecture hook which sets cpumask bits in the mm context
>>>    that tells the next switch_mm on each cpu to issue fence.i for that mm.
>>> - keep something like flush_icache_deferred as you have now.
>>>
>>> Otherwise, I fear the overhead of a very expensive fence.i would be too
>>> much when processes registering with MEMBARRIER_CMD_REGISTER_PRIVATE_EXPEDITED_SYNC_CORE
>>> and start doing fence.i on each and every switch_mm().
>>>
>>> So you'd basically rely on membarrier to only issue IPIs to the CPUs which are
>>> currently running threads belonging to the mm, and handle the switch_mm with
>>> the sync_core_before_usermode() for uthread->kthread->uthread case, and implement
>>> a deferred icache flush for the typical switch_mm() case.
>>
>> I've (tried to) put this together and obtained the two patches reported below.
>> Please let me know if this aligns with your intentions and/or there's interest
>> in a proper submission.

 >
 > This looks good to me, can you send out a non-RFC? I just sent out
 > patches to support userspace fence.i:
 > 
https://lore.kernel.org/linux-riscv/20231122-fencei-v1-0-bec0811cb212@rivosinc.com/T/#t.
 >
 > - Charlie
 >

Hi Andrea,

Yes, please send those as non-RFC patches. They align well with my 
intentions.

Thanks!

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
