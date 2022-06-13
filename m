Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5F7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jun 2022 11:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vZyGCx2CPYKKh5xfzqw91LlTnV1gclNwycTJaWf1zGc=; b=3ST9VFMsFJPfBy
	tdJvanOqcVMaSyz2vn7XorTLSy16XbOQA1SOjk3aFFh2ZNdhHAORgo0BDoB5p7Osi1IDAIFvNQZeK
	8ojHl/SoaeCAckYwsrO1OPEOrotDHwwo5EANHOBwcxhBcChosI3cRb4Y/st0z6OwElKLTH/rMCt5Y
	H5AhtglRy/vcSmm6UmA6kM/iKTqpJ2pYzFVArhkKYvRyaMXHIz3CVOacWpjW5XSYRs+LTOv+i622g
	+y2XzN0PQ6k1rbyZ+zHqXYPxqrFiGRHuBXH6tOQ8fLu8UtzJeDot4ZiliNCtOgHRk7aGFnOIWUII9
	3VYVc5JZWFo9GnHCYhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0if4-003Nbu-Vm; Mon, 13 Jun 2022 11:55:15 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0ies-003NYG-Pf; Mon, 13 Jun 2022 11:55:04 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LM91S5pwBz1K9RY;
	Mon, 13 Jun 2022 19:53:00 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 19:54:56 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 13 Jun 2022 19:54:54 +0800
Message-ID: <fa1416be-f940-4c28-5c67-911e61ac024f@huawei.com>
Date: Mon, 13 Jun 2022 19:54:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 6/6] memblock: Disable mirror feature if kernelcore is
 not specified
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
CC: Wupeng Ma <mawupeng1@huawei.com>, <corbet@lwn.net>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <dvhart@infradead.org>, <andy@infradead.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<anshuman.khandual@arm.com>, <thunder.leizhen@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
References: <20220613082147.183145-1-mawupeng1@huawei.com>
 <20220613082147.183145-7-mawupeng1@huawei.com> <YqcZ4O3pwceVtKYm@kernel.org>
 <CAMj1kXGwOczo1bgftMX9xTf8fRkrVYq8BjXJ6=XPj_yarbDYrA@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAMj1kXGwOczo1bgftMX9xTf8fRkrVYq8BjXJ6=XPj_yarbDYrA@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_045503_078642_AC7023BD 
X-CRM114-Status: UNSURE (   7.98  )
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


On 2022/6/13 19:25, Ard Biesheuvel wrote:
> On Mon, 13 Jun 2022 at 13:05, Mike Rapoport <rppt@kernel.org> wrote:
>> On Mon, Jun 13, 2022 at 04:21:47PM +0800, Wupeng Ma wrote:
>>> From: Ma Wupeng <mawupeng1@huawei.com>
>>>
>>> If system have some mirrored memory and mirrored feature is not specified
>>> in boot parameter, the basic mirrored feature will be enabled and this will
>>> lead to the following situations:
>>>
>>> - memblock memory allocation prefers mirrored region. This may have some
>>>    unexpected influence on numa affinity.
>>>
>>> - contiguous memory will be split into several parts if parts of them
>>>    is mirrored memory via memblock_mark_mirror().
...
> Also, on second thought, I don't think marking as mirror is what
> should be affected by the policy. Instead, choose_memblock_flags()
> should take this into account, in a way that we could refine later if
> needed.
> .

The choose_memblock_flags() only solve the issue of memblock allocation, but

the memblock could be splitted and fragmentized, the kernel won't treat the

mirror memory as special if no mirrored_kernelcore for now, so I think 
we'd better

to add the check into memblock_mark_mirror().


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
