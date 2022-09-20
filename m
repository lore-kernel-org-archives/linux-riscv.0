Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D2FECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RAF42OqqSObiliv59hvIkxvDlvy3kxxA3XlNHD99ek=; b=HgfJJTpvirgtVN
	vTagp18mNFjFYzVCvPZSlNp/Y27gCM4enI4o0fCmXJ9CgN66Dc9f2MiMRo2X+jPo/76gCn9jf5HNv
	2sGgByqWXrj4HlBIoN0ScGRvc9J7zlSToEnXi5x16TknVXnHFgzpcOHSmG5uLqKkrKmVb4A9Oygfq
	TgObozMjOX8wKuYbBMc6RN4Ru3QNRAYpTT9I6IY8jpVtXBMSWpxUsFocB15kuwN8lBlkCgwwHlRVq
	lYmW/7UjHxt17szIVBBbqFPyzyERRQVMpl77O9Kj0zNj6PNyBvHXx8gvc4LEyhV2QeDDmkMoipKEq
	JFz66hbuSlxoJbrFA0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYta-0021Rt-NR; Tue, 20 Sep 2022 08:46:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYt4-00212z-Gx; Tue, 20 Sep 2022 08:45:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6ED20106F;
	Tue, 20 Sep 2022 01:45:54 -0700 (PDT)
Received: from [10.163.57.146] (unknown [10.163.57.146])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE8EE3F73B;
	Tue, 20 Sep 2022 01:45:37 -0700 (PDT)
Message-ID: <8c4f103b-8f04-d0ad-b30a-2db7e52b36a3@arm.com>
Date: Tue, 20 Sep 2022 14:15:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/4] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org,
 corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
 yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
 zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, wangkefeng.wang@huawei.com,
 xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
 Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>,
 Mel Gorman <mgorman@suse.de>
References: <20220822082120.8347-1-yangyicong@huawei.com>
 <20220822082120.8347-5-yangyicong@huawei.com>
 <302febae-508c-d73e-8676-d51752946645@arm.com>
 <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAGsJ_4ywwFJFi+q3Ra5UE3twzS9eExtvuXgoGK-8u4c1ZdXCBw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_014550_710071_B4DACBE1 
X-CRM114-Status: GOOD (  13.00  )
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



On 9/20/22 09:09, Barry Song wrote:
> On Tue, Sep 20, 2022 at 3:00 PM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
>>
>> On 8/22/22 13:51, Yicong Yang wrote:
>>> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
>>> +{
>>> +     return true;
>>> +}
>>
>> This needs to be conditional on systems, where there will be performance
>> improvements, and should not just be enabled all the time on all systems.
>> num_online_cpus() > X, which does not hold any cpu hotplug lock would be
>> a good metric ?
> 
> for a small system, i don't see how this patch will help, e.g. cpus <= 4;
> so we can actually disable tlb-batch on small systems.

Do not subscribe ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH based on NR_CPUS ?
That might not help much as the default value is 256 for NR_CPUS.

OR

arch_tlbbatch_should_defer() checks on

1. online cpus			(dont enable batched TLB if <= X)
2. ARM64_WORKAROUND_REPEAT_TLBI (dont enable batched TLB)

> just need to check if we will have any race condition since hotplug will
> make the condition true and false dynamically.

If should_defer_flush() evaluate to be false, then ptep_clear_flush()
clears and flushes the entry right away. This should not race with other
queued up TLBI requests, which will be flushed separately. Wondering how
there can be a race here !

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
