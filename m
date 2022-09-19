Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A2ECAAD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 02:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WstJv+WQEHJB76xD9oFHZEiyupNBd4vpp7Ve2781LDg=; b=CBmk3Q4AwcgEI6
	omG1IeSEEVs8ZpcmYdgpf34xovLPTj91h4vuajn99ouqfV3o/vP+nqQzlhIWN3MGu6bHT8m32ckL2
	wSKIEYLbHXWUviXRFq5WMP4MBglzc0NVn1cBMPfXrSN70dgwrjh27cMVwTEClgHBB41tpnAMY2sp7
	/orhDINtJqiBxchrg9G3o75LZlE/xCSPDhFBVMtyzuFt3tmRwMiNHMx7jb9nvPAF4JSzBT0P8sXi/
	BlzbFLCoAsVzzccghxkpZewm2oHH8ROvmrkNxBBXIxiUfHdoZyGYGfm/Brpz/jWOXCwVEUJCMtong
	kyxOjanmbGKBxbJGjMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa6oK-006FAQ-Bh; Mon, 19 Sep 2022 02:47:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa6o3-006Etv-Ex; Mon, 19 Sep 2022 02:46:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72BE613D5;
	Sun, 18 Sep 2022 19:46:50 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053413F5A1;
	Sun, 18 Sep 2022 19:46:34 -0700 (PDT)
Message-ID: <7403e6bb-0011-381b-a99e-cbd9d7b1a270@arm.com>
Date: Mon, 19 Sep 2022 08:16:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Nadav Amit <namit@vmware.com>, Barry Song <21cnbao@gmail.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Linux MM <linux-mm@kvack.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "peterz@infradead.org" <peterz@infradead.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>,
 "huzhanyuan@oppo.com" <huzhanyuan@oppo.com>,
 "lipeifeng@oppo.com" <lipeifeng@oppo.com>,
 "zhangshiming@oppo.com" <zhangshiming@oppo.com>,
 "guojian@oppo.com" <guojian@oppo.com>, "realmz6@gmail.com"
 <realmz6@gmail.com>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>,
 "prime.zeng@hisilicon.com" <prime.zeng@hisilicon.com>,
 Barry Song <v-songbaohua@oppo.com>, Mel Gorman <mgorman@suse.de>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <1e8642d5-0e2d-5747-d0d2-5aa0817ea4af@arm.com>
 <CAGsJ_4xD4m-szM1Cm4N5ZRCODGC0fbW+BLBhy8g6+eK=aHPQNw@mail.gmail.com>
 <1125554b-c183-23c4-5516-95b918a761cc@arm.com>
 <CAGsJ_4zkRv7RYCB2SC0uydMSQWfwXs3-nkjxMoR7wgn2nt43gA@mail.gmail.com>
 <2AB9EC05-16B4-46F8-B716-53941C1C9A50@vmware.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <2AB9EC05-16B4-46F8-B716-53941C1C9A50@vmware.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_194647_575792_3419C1BA 
X-CRM114-Status: GOOD (  12.23  )
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



On 9/15/22 20:01, Nadav Amit wrote:
> 
> 
>> On Sep 14, 2022, at 11:42 PM, Barry Song <21cnbao@gmail.com> wrote:
>>
>>>
>>> The very idea behind TLB deferral is the opportunity it (might) provide
>>> to accumulate address ranges and cpu masks so that individual TLB flush
>>> can be replaced with a more cost effective range based TLB flush. Hence
>>> I guess unless address range or cpumask based cost effective TLB flush
>>> is available, deferral does not improve the unmap performance as much.
>>
>>
>> After sending tlbi, if we wait for the completion of tlbi, we have to get Ack
>> from all cpus in the system, tlbi is not scalable. The point here is that we
>> avoid waiting for each individual TLBi. Alternatively, they are batched. If
>> you read the benchmark in the commit log, you can find the great decline
>> in the cost to swap out a page.
> 
> Just a minor correction: arch_tlbbatch_flush() does not collect ranges.
> On x86 it only accumulate CPU mask.

Thanks Nadav for the clarification.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
