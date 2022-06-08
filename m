Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60312C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yTsCkDvVjBZd4WSaE5CyGZCgMEU3oMBLXOMwGUkAX4k=; b=qPY+y8khbTxc/I
	c08cQNpyNMokXDIab92gFRysXxopC07+npjO88Sw1sH3tsP7IKoLXI2NQ6RPmPosifn8n6W+qWRFh
	TRDT9FXXitM+UmSaoAzNS5bTf7789PgYq9oAZ62diZ5cEnRkK8O9Hlkp2C6O+tNMlCDW1buWl1+9E
	vDPwEB9MeEvEa93jy72NMTTsQZYsdFw2KVwEneBmkmvjflN8uyXhtBPyvpEUE4zi2TbGJ2V2VnpTH
	mSMYP5MbI9I7UXHUTHR5zPnEZ+ee2dEFswEZPUipxfcvG3oynsC374SFV56jlwVxKidXDM7DbSwNb
	BjfR7b+Hhu5Nd2hAM7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysFb-00CSIj-1a; Wed, 08 Jun 2022 09:45:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nysFO-00CSBv-V4; Wed, 08 Jun 2022 09:45:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 24596619F7;
	Wed,  8 Jun 2022 09:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE36C3411C;
	Wed,  8 Jun 2022 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654681503;
	bh=eC3ZU1sGIhjzZLCps+HxX1Ppe0DIJdW2BceBVl9oo+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pktPbLEeaAky17dLmb9pivTEyBK0H2sS17eVHHPAHPk0YF+9j8rR3HysSNKYOmSr8
	 HRYG0xkAuXKuaHXofsU4P4oTPA5VxDxGZpRnW1qIvvzTFCfjD4/DwbaFa6AOXlZNZE
	 HplT8LIBYvTvIej8PCkNSNXyr2NMJndntFXg/CJEHkzPr7/2Z9PbQveTolHDq8qGRg
	 3Hh7FFYid6joddofVPduvwi9PvHOVyg58QN9Xwmo27Upu79Ntyg8BDUueh1eaZAuc3
	 kH7BOwB7rhOZUlw+oE1QrCIASkeUfQvxfMMp9Dv/04dHQzIcK5+8NcHs3vW5y9b43+
	 P1Zl9+X0RcLMw==
Date: Wed, 8 Jun 2022 12:44:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org,
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org,
	akpm@linux-foundation.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, paulmck@kernel.org,
	keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	chenzhou10@huawei.com, vijayb@linux.microsoft.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] mm: Ratelimited mirrored memory related warning
 messages
Message-ID: <YqBvjDavqUdLgmuo@kernel.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-4-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607093805.1354256-4-mawupeng1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_024507_084750_3AE09A50 
X-CRM114-Status: GOOD (  19.14  )
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

On Tue, Jun 07, 2022 at 05:38:02PM +0800, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> If system has mirrored memory, memblock will try to allocate mirrored
> memory firstly and fallback to non-mirrored memory when fails, but if with
> limited mirrored memory or some numa node without mirrored memory, lots of
> warning message about memblock allocation will occur.
> 
> This patch ratelimit the warning message to avoid a very long print during
> bootup.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  mm/memblock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index e4f03a6e8e56..b1d2a0009733 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -327,7 +327,7 @@ static phys_addr_t __init_memblock memblock_find_in_range(phys_addr_t start,
>  					    NUMA_NO_NODE, flags);
>  
>  	if (!ret && (flags & MEMBLOCK_MIRROR)) {
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		flags &= ~MEMBLOCK_MIRROR;
>  		goto again;
> @@ -1384,7 +1384,7 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>  
>  	if (flags & MEMBLOCK_MIRROR) {
>  		flags &= ~MEMBLOCK_MIRROR;
> -		pr_warn("Could not allocate %pap bytes of mirrored memory\n",
> +		pr_warn_ratelimited("Could not allocate %pap bytes of mirrored memory\n",
>  			&size);
>  		goto again;
>  	}
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
