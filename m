Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF86C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 02:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJ4EfHD32toaBbIjY8ytYArxHoeu6OlR8Ajd7r7QVr0=; b=hBBWcGw+Pgft1B
	vOOV2scq6XlPXXccdyeWIzv5Aji3kVtEEVUX3TxkK+emhhdwIuTP+ODVhDgfwRAD/uYmrTrC2K1Za
	+/5hyT2B8Iw4BeNZCtDVPj23+SCcagwszwEN67ICnM7YnnZNgEYxuTMRtvDiyujqWbnTYdtaogBTU
	oJN9eargGM0Kf45iY2HwMdX1pPuWxnSvzVq5DrVFcoWTtWn6iUiq5kHl1a516bEfoeWYdC74txTD/
	ck7MugTGiGhc0atH/jwlC3UBf7iOIyCkG5WyjHsPjz3Gk0YLr9QFvBxYj6QDXhutpnGzFIL9xIHx0
	JM0u5Lb58EnGFA+fuY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrWm0-00H89E-9B; Mon, 29 Nov 2021 02:52:08 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrWlm-00H85H-8j; Mon, 29 Nov 2021 02:51:56 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J2VF7406Dz8vgD;
 Mon, 29 Nov 2021 10:49:47 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 10:51:20 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 10:51:19 +0800
Message-ID: <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
Date: Mon, 29 Nov 2021 10:51:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Content-Language: en-US
To: <dennis@kernel.org>, <akpm@linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC: <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
 <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <davem@davemloft.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
 <bp@alien8.de>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_185155_107179_B9D2E1BB 
X-CRM114-Status: UNSURE (   3.92  )
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

Hi Dennis and all maintainers, any comments about the changes, many thanks.

On 2021/11/21 17:35, Kefeng Wang wrote:
> When support page mapping percpu first chunk allocator on arm64, we
> found there are lots of duplicated codes in percpu embed/page first
> chunk allocator. This patchset is aimed to cleanup them and should
> no funciton change, only test on arm64.
>
> Kefeng Wang (4):
>    mm: percpu: Generalize percpu related config
>    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>    mm: percpu: Add generic pcpu_fc_alloc/free funciton
>    mm: percpu: Add generic pcpu_populate_pte() function
>
>   arch/arm64/Kconfig             |  20 +----
>   arch/ia64/Kconfig              |   9 +--
>   arch/mips/Kconfig              |  10 +--
>   arch/mips/mm/init.c            |  14 +---
>   arch/powerpc/Kconfig           |  17 +---
>   arch/powerpc/kernel/setup_64.c |  92 +--------------------
>   arch/riscv/Kconfig             |  10 +--
>   arch/sparc/Kconfig             |  12 +--
>   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>   arch/x86/Kconfig               |  17 +---
>   arch/x86/kernel/setup_percpu.c |  66 ++-------------
>   drivers/base/arch_numa.c       |  68 +---------------
>   include/linux/percpu.h         |  13 +--
>   mm/Kconfig                     |  12 +++
>   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>   15 files changed, 165 insertions(+), 443 deletions(-)
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
