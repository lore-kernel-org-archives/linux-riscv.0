Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB08AFA373E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoNvI0baXbcpqUWh//+nE4W3TWMLxngytvgJuuDVJ0w=; b=TCA0Wvur8snfbj
	Fi3AnzKjQr3GYIwyv5OvbqMNSK/TayyF2o1r91HJtS4ko68Civ/xzSci6LCwiS7t3cXycf5cWV/Bc
	Bh18NpCOuM6RWtfHnXdSfyAUzF8ztWmVPa0MNodnH9MaDFTrMeMmwI+zqzwFeiSXNMEJhVJEZ6v8y
	ek9Wto90wLAh80tdxN30s2kbXf/Au/U791jF5YdBZ8g41yZbP5r+aAEUrcoVg4AxC1dmvm4gcHa6G
	+7MFk9Q7dI5d2UKfwRQM8pCulER/inmTYdPfzAJdFtnvrxUhxtiiTJXQi5nSO83fOrvuMm3Xz1dzX
	SqmGWZ/8xRFLnJIdKRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0LD-00Cv7n-21; Thu, 27 Oct 2022 10:42:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo0Ky-00Cv2H-MZ; Thu, 27 Oct 2022 10:42:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF9221FB;
	Thu, 27 Oct 2022 03:42:12 -0700 (PDT)
Received: from [10.163.38.26] (unknown [10.163.38.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EF8D3F445;
	Thu, 27 Oct 2022 03:41:56 -0700 (PDT)
Message-ID: <ecd161db-b290-7997-a81e-a0a00bd1c599@arm.com>
Date: Thu, 27 Oct 2022 16:11:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
To: Barry Song <21cnbao@gmail.com>, Yicong Yang <yangyicong@huawei.com>
Cc: yangyicong@hisilicon.com, corbet@lwn.net, peterz@infradead.org,
 arnd@arndb.de, linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
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
Content-Language: en-US
In-Reply-To: <CAGsJ_4z=dZbrAUD9jczT08S3qi_ep-h+EK35UfayVk1S+Cnp2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_034212_792351_41B09267 
X-CRM114-Status: GOOD (  20.39  )
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



On 9/28/22 05:53, Barry Song wrote:
> On Tue, Sep 27, 2022 at 10:15 PM Yicong Yang <yangyicong@huawei.com> wrote:
>>
>> On 2022/9/27 14:16, Anshuman Khandual wrote:
>>> [...]
>>>
>>> On 9/21/22 14:13, Yicong Yang wrote:
>>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>>> +{
>>>> +    /* for small systems with small number of CPUs, TLB shootdown is cheap */
>>>> +    if (num_online_cpus() <= 4)
>>>
>>> It would be great to have some more inputs from others, whether 4 (which should
>>> to be codified into a macro e.g ARM64_NR_CPU_DEFERRED_TLB, or something similar)
>>> is optimal for an wide range of arm64 platforms.
>>>
> 
> I have tested it on a 4-cpus and 8-cpus machine. but i have no machine
> with 5,6,7
> cores.
> I saw improvement on 8-cpus machines and I found 4-cpus machines don't need
> this patch.
> 
> so it seems safe to have
> if (num_online_cpus()  < 8)
> 
>>
>> Do you prefer this macro to be static or make it configurable through kconfig then
>> different platforms can make choice based on their own situations? It maybe hard to
>> test on all the arm64 platforms.
> 
> Maybe we can have this default enabled on machines with 8 and more cpus and
> provide a tlbflush_batched = on or off to allow users enable or
> disable it according
> to their hardware and products. Similar example: rodata=on or off.

No, sounds bit excessive. Kernel command line options should not be added
for every possible run time switch options.

> 
> Hi Anshuman, Will,  Catalin, Andrew,
> what do you think about this approach?
> 
> BTW, haoxin mentioned another important user scenarios for tlb bach on arm64:
> https://lore.kernel.org/lkml/393d6318-aa38-01ed-6ad8-f9eac89bf0fc@linux.alibaba.com/
> 
> I do believe we need it based on the expensive cost of tlb shootdown in arm64
> even by hardware broadcast.

Alright, for now could we enable ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH selectively
with CONFIG_EXPERT and for num_online_cpus()  > 8 ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
