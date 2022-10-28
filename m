Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A0BECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 02:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WduLlgA00SZ8LRVhTxe+WNY4QPmMbvOt7oC3GvQDKgQ=; b=BiD74inkOKAxZf
	q5rWpVq6pf0ESUOsbBjcLQeOQ4/W2Fa9W6fJzGl8LDORGi3VM9+fITsydIg8EAhKVfbtlkXA7dnKG
	FX9zA2P6BafAXNS6wkv822XPGspT5C2q2vuTp96U4uFv450oSbTwutLum5eO8PGUgUX/WUb8c/db0
	ievtFPSeUrrybZi0wBTvmayEIJxDAmfMdca7h06ITne+kQAspUWFEYKXHy/PWRAxE2EkXsNeNeSQW
	aqhmL1g0SiM/kUfYQLObOgrP4GhXI2woPNiLnxLxZrE7U7n2kgCK5R0pj8SM4KCxaD5cLJgp3vGRS
	hevq+Gjnh3J1Xxc/Qqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooEu6-00FUKj-Rb; Fri, 28 Oct 2022 02:15:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooEtR-00FU7A-OM; Fri, 28 Oct 2022 02:14:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BAF523A;
	Thu, 27 Oct 2022 19:14:48 -0700 (PDT)
Received: from [192.168.0.146] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD67A3F445;
	Thu, 27 Oct 2022 19:14:32 -0700 (PDT)
Message-ID: <8a3ade4c-1714-5ffd-ed57-02ab0509725b@arm.com>
Date: Fri, 28 Oct 2022 07:44:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>,
 Punit Agrawal <punit.agrawal@bytedance.com>
Cc: Yicong Yang <yangyicong@huawei.com>, yangyicong@hisilicon.com,
 corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
 huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
 guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-mm@kvack.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com,
 xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
 Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>,
 Mel Gorman <mgorman@suse.de>, catalin.marinas@arm.com, will@kernel.org,
 linux-doc@vger.kernel.org
References: <20220921084302.43631-1-yangyicong@huawei.com>
 <20220921084302.43631-3-yangyicong@huawei.com>
 <168eac93-a6ee-0b2e-12bb-4222eff24561@arm.com>
 <8e391962-4e3a-5a56-64b4-78e8637e3b8c@huawei.com>
 <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
 <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com> <87o7tx5oyx.fsf@stealth>
 <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAGsJ_4zrGfPYAXGW0g3Z-GF4vT7GD0xDjZn1dv-qruztEQTghg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_191445_897623_A7B2A7F7 
X-CRM114-Status: GOOD (  21.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/28/22 03:25, Barry Song wrote:
> On Fri, Oct 28, 2022 at 3:19 AM Punit Agrawal
> <punit.agrawal@bytedance.com> wrote:
>>
>> [ Apologies for chiming in late in the conversation ]
>>
>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>>
>>> On 9/28/22 05:53, Barry Song wrote:
>>>> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>>>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>>>>> [...]
>>>>>>
>>>>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>>>>> +{
>>>>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>>>>> +    if (num_online_cpus() <= 4)
>>>>>> It would be great to have some more inputs from others, whether 4 (which should
>>>>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>>>>> is optimal for an wide range of arm64 platforms.
>>>>>>
>>>> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
>>>> with 5,6,7
>>>> cores.
>>>> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
>>>> this patch.
>>>>
>>>> so it seems safe to have
>>>> if (num_online_cpus()  < 8)
>>>>
>>>>> Do you prefer this macro to be static or make it configurable through kconfig then
>>>>> different platforms can make choice based on their own situations? It maybe hard to
>>>>> test on all the arm64 platforms.
>>>> Maybe we can have this default enabled on machines with 8 and more cpus and
>>>> provide a tlbflush_batched = on or off to allow users enable or
>>>> disable it according
>>>> to their hardware and products. Similar example: rodata=on or off.
>>> No, sounds bit excessive. Kernel command line options should not be added
>>> for every possible run time switch options.
>>>
>>>> Hi Anshuman, Will,  Catalin, Andrew,
>>>> what do you think about this approach?
>>>>
>>>> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
>>>> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
>>>>
>>>> I do believe we need it based on the expensive cost of tlb shootdown in arm64
>>>> even by hardware broadcast.
>>> Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
>>> with CONFIG_EXPERT and for num_online_cpus()  > 8 ?
>> When running the test program in the commit in a VM, I saw benefits from
>> the patches at all sizes from 2, 4, 8, 32 vcpus. On the test machine,
>> ptep_clear_flush() went from ~1% in the unpatched version to not showing
>> up.
>>
>> Yicong mentioned that he didn't see any benefit for <= 4 CPUs but is
>> there any overhead? I am wondering what are the downsides of enabling
>> the config by default.
> As we are deferring tlb flush, but sometimes while we are modifying the vma
> which are deferred, we need to do a sync by flush_tlb_batched_pending() in
> mprotect() , madvise() to make sure they can see the flushed result. if nobody
> is doing mprotect(), madvise() etc in the deferred period, the overhead is zero.

Right, it is difficult to justify this overhead for smaller systems,
which for sure would not benefit from this batched TLB framework.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
