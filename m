Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7363ACAC5A5
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 01:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqG29Ehr+LNia37DEMTX6w/dXS794SMU/0h9elhMf9E=; b=X30UD9mGHyyj+K
	TTgoePrgGnoRIccZd+9dWULzKN5Dr7T906xv63G/FXTZj8nEgmI8O/ZZ1HtjjFIOvjHJ1KhGBZ8qf
	Ht0hg+huTZ2WJcr0nQOeDuzZcDwaF3adH6x/3hZ4Mo8NNEnKTOBerOUnGYsIiumxwGN9Fn+n0JDuG
	dQAWAdgXdE16WFG5IxJxR8WSS5lR9p6CibVF+GzAWY4T+a3bYYnrc9Z3InJClHhtDKYhcvT1n8YGX
	P3pam8jWQmPe78DtqSj8ir7+7CGaGOjZG3S5klBF+a7I1fdwNPzZIdBwrCxCvAJVTXaxJFYx2cp+l
	0RgEyKo6VzVBSvvO4oxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1b1Y-00000005DLw-0c61;
	Thu, 25 Sep 2025 01:43:56 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1b1U-00000005DJ2-1PUa;
	Thu, 25 Sep 2025 01:43:53 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cXGb80jBLzddVk;
	Thu, 25 Sep 2025 09:39:00 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D3111401E9;
	Thu, 25 Sep 2025 09:43:39 +0800 (CST)
Received: from [10.174.179.35] (10.174.179.35) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 25 Sep 2025 09:43:37 +0800
Message-ID: <8313b0c1-bf62-4257-951c-fd7e29193ae2@huawei.com>
Date: Thu, 25 Sep 2025 09:43:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mm: add PMD-level huge page support for
 remap_pfn_range()
To: David Hildenbrand <david@redhat.com>, <akpm@linux-foundation.org>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <vbabka@suse.cz>,
	<rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>, <ziy@nvidia.com>,
	<baolin.wang@linux.alibaba.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <anshuman.khandual@arm.com>,
	<yangyicong@hisilicon.com>, <ardb@kernel.org>, <willy@infradead.org>,
	<apopple@nvidia.com>, <samuel.holland@sifive.com>,
	<luxu.kernel@bytedance.com>, <abrestic@rivosinc.com>,
	<yongxuan.wang@sifive.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>
CC: <wangkefeng.wang@huawei.com>, <chenjun102@huawei.com>
References: <20250923133104.926672-1-yintirui@huawei.com>
 <20250923133104.926672-3-yintirui@huawei.com>
 <f8571506-30c0-4dc8-9995-41a6469f8fc7@redhat.com>
From: Yin Tirui <yintirui@huawei.com>
In-Reply-To: <f8571506-30c0-4dc8-9995-41a6469f8fc7@redhat.com>
X-Originating-IP: [10.174.179.35]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_184352_533870_137F1A98 
X-CRM114-Status: GOOD (  11.05  )
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



On 9/24/2025 5:50 PM, David Hildenbrand wrote:
>> Introduce pfnmap_max_page_shift parameter to control maximum page
>> size and "nohugepfnmap" boot option to disable huge pfnmap entirely.
> 
> Why? If an arch supports it we should just do it. Or what's the reason 
> behind that?
> 
There's no specific reason for this - it was just intended to provide an 
additional option. I'll remove it in the next version.

...
> Are you sure we can just entirely remove this block for ! 
> vma_is_anonymous(vma)?
>
Thank you for pointing this out!
There is definitely a problem with removing this block entirely for 
non-anonymous VMAs. I've also found some other problems. I'll fix all of 
them in the next version.

-- 
Best regards,
Yin Tirui


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
