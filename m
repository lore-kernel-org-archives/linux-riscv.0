Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A247EC282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2cr4PqK/Re/d9q9+mLn2wlDHJH9syXsv8+gn/Kv/9Y=; b=pKpwIZHCsawa8D
	I5AQmqC11u9kXPIJ3qi3AwzIZd5F4m7/KZgOluRsHr0/8ab6x39v5DhM55RE+CF5eQQ3pvmOwCNkP
	MJduKOiFQj1vyqgWPLqeGXPUbabkXyREuqXHr4GIK/SuKsaACHKmAgJGXqnPtHG5hFPc3m0Hqp40y
	dMLO1dNuCugjCavSqhdq27gpYE+bTiTPXSuH1mxN8D4GdXzADACKIX19APqixjlSQcLB2ffxy75xV
	sxIKcUn+HTHKBK0bUcHWeKx9l2SEdfIoIM1VY3Ee+teiri0s+/VP4byNF2/8QdY2XRXIajbZ+N8zG
	TVH9z5ws4V3L7tcVGIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEa9-00000003b5b-2y0f;
	Mon, 17 Mar 2025 17:48:57 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDcb-00000003OSE-21p3
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:47:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDE4E441C3;
	Mon, 17 Mar 2025 16:47:20 +0000 (UTC)
Message-ID: <b7969702-5e88-4891-bd0e-8728562ff5f5@ghiti.fr>
Date: Mon, 17 Mar 2025 17:47:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] riscv: iommu: Support Svnapot
Content-Language: en-US
To: Xu Lu <luxu.kernel@bytedance.com>, akpm@linux-foundation.org,
 jhubbard@nvidia.com, kirill.shutemov@linux.intel.com, tjeznach@rivosinc.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250311122510.72934-1-luxu.kernel@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250311122510.72934-1-luxu.kernel@bytedance.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurddvhegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheplhhugihurdhkvghrnhgvlhessgihthgvuggrnhgtvgdrtghomhdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhhuhgssggrrhgusehnvhhiughirgdrtghomhdprhgtphhtthhopehkihhrihhllhdrshhhuhhtvghmohhvsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhjvgiinhgrtghhsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpdhrt
 ghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094725_654663_758CD985 
X-CRM114-Status: GOOD (  11.53  )
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

Hi Xu,

You did not +cc linux-mm on your series, it would be nice to have 
feedback from them. I'd say it would be easier to resend the whole 
patchset with them in +cc.

Thanks,

Alex

On 11/03/2025 13:25, Xu Lu wrote:
> According to the RISC-V IOMMU hardware spec, the IOMMU implementation
> has the same translation process as MMU and supports Svnapot standard
> extension as well. These patches add support for Svnapot in the IOMMU
> driver to make 64K also an available page size during DMA mapping.
>
> Changes in V2:
> 1. Supply more details about huge pte issue in follow_page_pte().
> 2. Fix some style problems.
>
> Xu Lu (4):
>    mm/gup: Add huge pte handling logic in follow_page_pte()
>    iommu/riscv: Use pte_t to represent page table entry
>    iommu/riscv: Introduce IOMMU page table lock
>    iommu/riscv: Add support for Svnapot
>
>   arch/riscv/include/asm/pgtable.h |   6 +
>   drivers/iommu/riscv/iommu.c      | 258 +++++++++++++++++++++++++------
>   include/linux/pgtable.h          |   8 +
>   mm/gup.c                         |  17 +-
>   4 files changed, 233 insertions(+), 56 deletions(-)
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
