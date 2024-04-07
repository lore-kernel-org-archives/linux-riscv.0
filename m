Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3526CD128A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 07:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+gS0Jb6c/36x+pg7JdikHblkLiND7blV4TjWa69DNw=; b=kaxGTkeRVXoQwv
	4kC7hvY+cB7L3Ih0+Rm5hF5fC9i8EOBbk82xZDsLpSWmca8VW3hZ0MLEDS4m64DIZQsNuDGVWaotn
	HDnvvoNlqqwOWP9GShRlaoTIvPArZlNQdIqUOCQTtjYuHXhdy0SSsNg7nKtgfbpihHmG4yGMuTJjH
	fax/7OT8nuz7KkWmVWbOCjvMoepKdpKRj35NCnGku35Q7NGpM1KbHjtn9k40vyTfMQs9J5i1JngTK
	o7Yz8/1Q7Jfatibyj4tYACHf/NKjw4xbjGVKHWsx7RRprS7gf+7WXkAhLsiD9RsTt25k+3m4mZoEr
	J0Ypo/9Oj2PNExMiOnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtNI7-0000000C2V8-42zq;
	Sun, 07 Apr 2024 07:50:15 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtNI3-0000000C2Sg-1Or2;
	Sun, 07 Apr 2024 07:50:13 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC47C1yhVzwRPw;
	Sun,  7 Apr 2024 15:47:03 +0800 (CST)
Received: from dggpemm100001.china.huawei.com (unknown [7.185.36.93])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A70414010C;
	Sun,  7 Apr 2024 15:49:55 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Apr 2024 15:49:54 +0800
Message-ID: <4d45fffc-877a-4ad1-ad02-a33341e467e7@huawei.com>
Date: Sun, 7 Apr 2024 15:49:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] arch/mm/fault: accelerate pagefault when badaccess
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
CC: Russell King <linux@armlinux.org.uk>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <surenb@google.com>, <linux-mm@kvack.org>
References: <20240403083805.1818160-1-wangkefeng.wang@huawei.com>
 <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20240403134539.fde3a6c594f2d88409be30ed@linux-foundation.org>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm100001.china.huawei.com (7.185.36.93)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_005011_896750_14BA352C 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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



On 2024/4/4 4:45, Andrew Morton wrote:
> On Wed, 3 Apr 2024 16:37:58 +0800 Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
> 
>> After VMA lock-based page fault handling enabled, if bad access met
>> under per-vma lock, it will fallback to mmap_lock-based handling,
>> so it leads to unnessary mmap lock and vma find again. A test from
>> lmbench shows 34% improve after this changes on arm64,
>>
>>    lat_sig -P 1 prot lat_sig 0.29194 -> 0.19198
>>
>> Only build test on other archs except arm64.
> 
> Thanks.  So we now want a bunch of architectures to runtime test this.  Do
> we have a selftest in place which will adequately do this?

I don't find such selftest, and badaccess would lead to coredump, the
performance should not affect most scene, so no selftest is acceptable.
lmbench is easy to use to measure the performance.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
