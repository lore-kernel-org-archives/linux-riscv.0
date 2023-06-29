Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C4EEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teP1sHE9oxGZrytmNLiPFw2pv7RKoqRQTNvXSjtdOVg=; b=cT4uw5zxJQWzJN
	+KZJ01zaPysvuF7Ryb1uDk3Fm9AtqjQVcqe3v/RdKfa5Upf6SIppDNcT/2SqmrXb9adTpmpLblb9v
	Oax8rdCxgEVMk8HurT8UvZ6xVqnlxOzGH7Ehs2aGTbmLSTIyXj+miVB8yaivmj5mXM1NknlrTvmoS
	IK0dczkQlh1dlJKF5fRQp6X1m1XPR8VbMl2oZxJDZGL29UlUA3w3PcRZeAjaYYTPtWD6q4hS5LjG6
	iA0TMBfGJ+IIeAbzptyR4xMkZpFqmnFNB3+8e3jjb8a0D3c7E/KqGfhZfLfByqQ0z1FblW2ivYMtk
	gMzgRtc2qLdA0KtlpYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuYg-001XP3-2a;
	Thu, 29 Jun 2023 16:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEuYc-001XNc-0D;
	Thu, 29 Jun 2023 16:31:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53E4A61516;
	Thu, 29 Jun 2023 16:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38922C433C0;
	Thu, 29 Jun 2023 16:31:39 +0000 (UTC)
Date: Thu, 29 Jun 2023 17:31:36 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	mark.rutland@arm.com, ryan.roberts@arm.com, will@kernel.org,
	anshuman.khandual@arm.com, linux-doc@vger.kernel.org,
	corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com, yangyicong@hisilicon.com,
	huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
	guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
	Jonathan.Cameron@huawei.com, Barry Song <v-songbaohua@oppo.com>,
	Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [RESEND PATCH v9 2/2] arm64: support batched/deferred tlb
 shootdown during page reclamation/migration
Message-ID: <ZJ2x6DlmyA3kVh1n@arm.com>
References: <20230518065934.12877-1-yangyicong@huawei.com>
 <20230518065934.12877-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230518065934.12877-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_093146_144522_49AEFDD0 
X-CRM114-Status: GOOD (  15.50  )
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

On Thu, May 18, 2023 at 02:59:34PM +0800, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> on x86, batched and deferred tlb shootdown has lead to 90%
> performance increase on tlb shootdown. on arm64, HW can do
> tlb shootdown without software IPI. But sync tlbi is still
> quite expensive.
[...]
>  .../features/vm/TLB/arch-support.txt          |  2 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/include/asm/tlbbatch.h             | 12 ++++
>  arch/arm64/include/asm/tlbflush.h             | 33 ++++++++-
>  arch/arm64/mm/flush.c                         | 69 +++++++++++++++++++
>  arch/x86/include/asm/tlbflush.h               |  5 +-
>  include/linux/mm_types_task.h                 |  4 +-
>  mm/rmap.c                                     | 12 ++--

First of all, this patch needs to be split in some preparatory patches
introducing/renaming functions with no functional change for x86. Once
done, you can add the arm64-only changes.

Now, on the implementation, I had some comments on v7 but we didn't get
to a conclusion and the thread eventually died:

https://lore.kernel.org/linux-mm/Y7cToj5mWd1ZbMyQ@arm.com/

I know I said a command line argument is better than Kconfig or some
random number of CPUs heuristics but it would be even better if we don't
bother with any, just make this always on. Barry had some comments
around mprotect() being racy and that's why we have
flush_tlb_batched_pending() but I don't think it's needed (or, for
arm64, it can be a DSB since this patch issues the TLBIs but without the
DVM Sync). So we need to clarify this (see Barry's last email on the
above thread) and before attempting new versions of this patchset. With
flush_tlb_batched_pending() removed (or DSB), I have a suspicion such
implementation would be faster on any SoC irrespective of the number of
CPUs.

-- 
Catalin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
