Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651E7C4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usESwBj6rmgCRBrxkfN65J14HwhemesV8PCxC4rGJz8=; b=F4Xc/BG899jFGOXB6zWi9+qbEl
	N8P3TxHUbivWfPUaNlA2aCuvjVTZVl13867ZGw/O/ybyTlxXEJONq2yiv7Liw+2zZZ0I3zAwu/LDq
	He3ncZPR0FkQetNAnv8jZ2axrlw6lCqa1Yjo96bIUVo1Cu+Bl0g7iEuNG58sT3/6WjrcwpKWZfGvc
	+D+jUOj+kK1dLEXYA6aeD8KgswEa2hPk6y/TxuHSFuHL/HGJQW0FlfEBp9zvgCqTBWtF+VSWe+yy9
	wdpIcTugUdbuSMkzKVMTM97ZeX6/ng8sX7SLgYxrUXPQHvIoYW0NS+mrfzIciptjMSqBrhgDxvk9p
	zU20ThjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyr0r-00B5yr-0S;
	Fri, 03 Nov 2023 10:02:49 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyr0o-00B5xl-1z
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 10:02:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E11EC0002;
	Fri,  3 Nov 2023 10:02:36 +0000 (UTC)
Message-ID: <7fa25a76-4e4e-49c3-b0d1-fc34ed73a19a@ghiti.fr>
Date: Fri, 3 Nov 2023 11:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] riscv: Fix set_memory_XX() and set_direct_map_XX()
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231027143222.115588-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231027143222.115588-1-alexghiti@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_030246_805362_1F5071DF 
X-CRM114-Status: GOOD (  17.28  )
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


On 27/10/2023 16:32, Alexandre Ghiti wrote:
> Those 2 patches fix the set_memory_XX() and set_direct_map_XX() APIs, which
> in turn fix STRICT_KERNEL_RWX and memfd_secret(). Those were broken since the
> permission changes were not applied to the linear mapping because the linear
> mapping is mapped using hugepages and walk_page_range_novma() does not split
> such mappings.
>
> To fix that, patch 1 disables PGD mappings in the linear mapping as it is
> hard to propagate changes at this level in *all* the page tables, this has the
> downside of disabling PMD mapping for sv32 and PUD (1GB) mapping for sv39 in
> the linear mapping (for specific kernels, we could add a Kconfig to enable
> ARCH_HAS_SET_DIRECT_MAP and STRICT_KERNEL_RWX if needed, I'm pretty sure we'll
> discuss that).
>
> patch 2 implements the split of the huge linear mappings so that
> walk_page_range_novma() can properly apply the permissions. The whole split is
> protected with mmap_sem in write mode, but I'm wondering if that's enough,
> any opinion on that is appreciated.
>
> Changes in v2:
> - Fix rv32 build
> - Rebase on top of 6.6-rc6
> - Move the flush_tlb_all outside the mmap_lock
>
> Alexandre Ghiti (2):
>    riscv: Don't use PGD entries for the linear mapping
>    riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge
>      linear mappings
>
>   arch/riscv/mm/init.c     |  12 +-
>   arch/riscv/mm/pageattr.c | 270 +++++++++++++++++++++++++++++++++------
>   2 files changed, 236 insertions(+), 46 deletions(-)
>

Any feedback from anyone? That's a fix I'd like to see merged in 6.7, if 
no objection, I'll ask for Palmer to take it.

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
