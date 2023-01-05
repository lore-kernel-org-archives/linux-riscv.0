Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0404AC3DA7D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txMpkHb1dBQzN2FuqqQXHQ/z1M/sC/6t8fOPDpgKSWg=; b=1cMRjsDAhrfvxG
	S8Z+6M2SzHAIwBLlz9/mUxS6uHN4YQ73y04T/4rMy6uzl3r3IX+gGVVkokPxo6f5sz3q15Gk5UubW
	fG/nc6v8SGb21j/TXbytS2FQOznlptguctmroddRK0hKu8B2naUmTbxQ5iabUgvN3dLUKuXv7iuxA
	Jgujxr6QUS5UNMGaGc7gD8A7FgtS7cRTCGLjoDO3pmfViym1CKT3NldyXxo1DIurM0FmyZ6DUtHum
	Xr2iMU3BJJSstVsplHPaVOjzchSDrBC7idkcuXXJWf1Ao+4O1Mi3IkTblrctJdGjERTLHr+nJgvXG
	ISyBkvidGM+UtS1p0Xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXOU-00EsVy-6u; Thu, 05 Jan 2023 21:03:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUlh-00DRLh-1h; Thu, 05 Jan 2023 18:15:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 292AE61BD1;
	Thu,  5 Jan 2023 18:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EDBC433D2;
	Thu,  5 Jan 2023 18:15:01 +0000 (UTC)
Date: Thu, 5 Jan 2023 18:14:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	will@kernel.org, anshuman.khandual@arm.com,
	linux-doc@vger.kernel.org, corbet@lwn.net, peterz@infradead.org,
	arnd@arndb.de, punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org, darren@os.amperecomputing.com,
	yangyicong@hisilicon.com, huzhanyuan@oppo.com, lipeifeng@oppo.com,
	zhangshiming@oppo.com, guojian@oppo.com, realmz6@gmail.com,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, Barry Song <21cnbao@gmail.com>,
	wangkefeng.wang@huawei.com, xhao@linux.alibaba.com,
	prime.zeng@hisilicon.com, Barry Song <v-songbaohua@oppo.com>,
	Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v7 2/2] arm64: support batched/deferred tlb shootdown
 during page reclamation
Message-ID: <Y7cToj5mWd1ZbMyQ@arm.com>
References: <20221117082648.47526-1-yangyicong@huawei.com>
 <20221117082648.47526-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117082648.47526-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_101509_204010_A9B48938 
X-CRM114-Status: GOOD (  23.87  )
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

On Thu, Nov 17, 2022 at 04:26:48PM +0800, Yicong Yang wrote:
> It is tested on 4,8,128 CPU platforms and shows to be beneficial on
> large systems but may not have improvement on small systems like on
> a 4 CPU platform. So make ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH depends
> on CONFIG_EXPERT for this stage and make this disabled on systems
> with less than 8 CPUs. User can modify this threshold according to
> their own platforms by CONFIG_NR_CPUS_FOR_BATCHED_TLB.

What's the overhead of such batching on systems with 4 or fewer CPUs? If
it isn't noticeable, I'd rather have it always on than some number
chosen on whichever SoC you tested.

Another option would be to make this a sysctl tunable.

>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  6 +++
>  arch/arm64/include/asm/tlbbatch.h             | 12 +++++
>  arch/arm64/include/asm/tlbflush.h             | 52 ++++++++++++++++++-
>  arch/x86/include/asm/tlbflush.h               |  5 +-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 10 ++--

Please keep any function prototype changes in a preparatory patch so
that the arm64 one only introduces the arch specific changes. Easier to
review.

> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +	/*
> +	 * TLB batched flush is proved to be beneficial for systems with large
> +	 * number of CPUs, especially system with more than 8 CPUs. TLB shutdown
> +	 * is cheap on small systems which may not need this feature. So use
> +	 * a threshold for enabling this to avoid potential side effects on
> +	 * these platforms.
> +	 */
> +	if (num_online_cpus() < CONFIG_ARM64_NR_CPUS_FOR_BATCHED_TLB)
> +		return false;

The x86 implementation tracks the cpumask of where a task has run. We
don't have such tracking on arm64 and I don't think it matters. As
noticed/described in this series, the bottleneck is the actual DSB
synchronisation (which sends a DVM Sync message to all the other CPUs
and waits for a DVM Complete response). So I think it makes sense not to
bother with an mm_cpumask(). What this patch aims to optimise is
actually the number of DSBs issued on an SMP system by
ptep_clear_flush().

The DVM is not an architected concept (well, it's part of AMBA AXI). I'd
be curious to know how such patch behaves on Apple's M1/M2 hardware. My
preference would be to have this always on for num_online_cpus() > 1 if
there's no overhead.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
