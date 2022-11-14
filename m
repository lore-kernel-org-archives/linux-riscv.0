Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D0C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 03:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Y7Dd4YW5LbchDkSmG7en7jC0R5Nh9x9SHQIJKUYQ6o=; b=kBIv1NC1/qxAPJ
	4pY0+Jl9IpERNKPuCIWBbb/0GuRCHAYtF/zrRDs2SZ+KYxHslfyffBLOK2hU+8Ph8p5g5T3ncGFD/
	6JaZyKMmyVsvMJFge8srOGPtENFpOxwc1xgKL+2q2cjQaBwsb73Ui3Ot10eSbtfV0wt0DKemqbcFG
	+HF2VA7Q78gRdL8sbTKKeng2UO5HpnCj5+AnLg+FRXmTSZeFMM/9kgSkNo6OPjbkhAbexIvk9fVQp
	3MZ/jhT3ps4ykMh5UjWRq+wSo1UYnqtCFoPFhnbEJsnWe0Sr7MKnMXHuQT6f4rbBjmTCJmy0mk8mX
	PvilVc61XHhLF+AOsbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouQAS-00FjUD-83; Mon, 14 Nov 2022 03:29:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouQAH-00FjLo-Fn; Mon, 14 Nov 2022 03:29:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC24B23A;
	Sun, 13 Nov 2022 19:29:30 -0800 (PST)
Received: from [10.162.40.16] (unknown [10.162.40.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76BB43F534;
	Sun, 13 Nov 2022 19:29:14 -0800 (PST)
Message-ID: <86fbdc8c-0dcb-9b8f-d843-63460d8b1d6a@arm.com>
Date: Mon, 14 Nov 2022 08:59:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Content-Language: en-US
To: Yicong Yang <yangyicong@huawei.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
 punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
 darren@os.amperecomputing.com, yangyicong@hisilicon.com,
 huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
 guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
 xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
 Barry Song <v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>,
 Mel Gorman <mgorman@suse.de>
References: <20221028081255.19157-1-yangyicong@huawei.com>
 <20221028081255.19157-3-yangyicong@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20221028081255.19157-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_192941_610375_4A9FC672 
X-CRM114-Status: GOOD (  12.46  )
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



On 10/28/22 13:42, Yicong Yang wrote:
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/*
> +	 * TLB batched flush is proved to be beneficial for systems with large
> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
> +	 * is cheap on small systems which may not need this feature. So use
> +	 * a threshold for enabling this to avoid potential side effects on
> +	 * these platforms.
> +	 */
> +	if (num_online_cpus() <= CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
> +		return false;
> +
> +#ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
> +	if (unlikely(this_cpu_has_cap(ARM64_WORKAROUND_REPEAT_TLBI)))
> +		return false;
> +#endif

should_defer_flush() is immediately followed by set_tlb_ubc_flush_pending() which calls
arch_tlbbatch_add_mm(), triggering the actual TLBI flush via __flush_tlb_page_nosync().
It should be okay to check capability with this_cpu_has_cap() as the entire call chain
here is executed on the same cpu. But just wondering if cpus_have_const_cap() would be
simpler, consistent, and also cost effective ?

Regardless, a comment is needed before the #ifdef block explaining why it does not make
sense to defer/batch when __tlbi()/__tlbi_user() implementation will execute 'dsb(ish)'
between two TLBI instructions to workaround the errata.

> +
> +	return true;
> +}
> +
> +static inline void arch_tlbbatch_add_mm(struct arch_tlbflush_unmap_batch *batch,
> +					struct mm_struct *mm,
> +					unsigned long uaddr)
> +{
> +	__flush_tlb_page_nosync(mm, uaddr);
> +}
> +
> +static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> +{
> +	dsb(ish);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
