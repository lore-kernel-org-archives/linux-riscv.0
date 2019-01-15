Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D215C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6E120866
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 15:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cuk7PqZV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6E120866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ih70p9QirML0NsTJKA6o8JYLN4piMg2WS0f5GoIEu2s=; b=Cuk7PqZVMFJBoc
	oEQK51F8VaioK8oEGZoIs0MPu7Yr5cjYWfM9GI51iMNcdAFbex6i5gfl9niKtt8Za0RoIcMfJtILA
	5Gebdlo0dyg15FNnNfZhJ9vODcWR3mSZUbtaUQnyl41MP73L9OGs+F9LC8h8RxN7eOxjGT5m+Cops
	TXybsh1bKQlsyPmfibhLsPskYxu3bJsPo2uYxHrZOT3u/A82+0nEuMBvdqNxUAmve3lRw+7kRnM+L
	rwjREumxfIjYSiVaKYhi9KcinYfHA6ncuEDaPHyN5beutg+O3htho9E2vlYkyo2pD99GxczzY/e1l
	cWiTua6WcyRzCeOBGCUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjQlD-0003aO-SY; Tue, 15 Jan 2019 15:36:15 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjQlB-0003Zr-UR; Tue, 15 Jan 2019 15:36:13 +0000
Date: Tue, 15 Jan 2019 07:36:13 -0800
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Message-ID: <20190115153613.GC26443@infradead.org>
References: <1547280987-7630-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547280987-7630-1-git-send-email-guoren@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, palmer@sifive.com,
 linux-kernel@vger.kernel.org, Mao Han <mao_han@c-sky.com>,
 Guo Ren <ren_guo@c-sky.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 12, 2019 at 04:16:27PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <ren_guo@c-sky.com>
> 
> max_low_pfn should be pfn_size not byte_size.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Mao Han <mao_han@c-sky.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  arch/riscv/mm/init.c      | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index fc8006a..5463e67 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -174,7 +174,7 @@ static void __init setup_bootmem(void)
>  	BUG_ON(mem_size == 0);
>  
>  	set_max_mapnr(PFN_DOWN(mem_size));
> -	max_low_pfn = memblock_end_of_DRAM();
> +	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());

I know it is used just above, but can we please just switch this
code to use >> PAGE_SHIFT instead of PFN_DOWN, which just horribly
obsfucates what is going on?

>  
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	setup_initrd();
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 1d9bfaf..658ebf6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -28,7 +28,8 @@ static void __init zone_sizes_init(void)
>  	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
>  
>  #ifdef CONFIG_ZONE_DMA32
> -	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
> +	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
> +			(unsigned long) PFN_PHYS(max_low_pfn)));
>  #endif

Same comment as above here, plus I think we should just use
memblock_end_of_DRAM directly, e.g. something like:

static const phys_addr_t max_dma32_addr = 4UL * SZ_1G;

	max_zone_pfns[ZONE_DMA32] =
		min(memblock_end_of_DRAM(), max_dma32_addr) >> PAGE_SHIFT;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
