Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECED5C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jun 2022 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yMdRFxhOA713MZlBPb0PpRsIcEp3EL9fs1uyl+xCqdA=; b=pnKpOZTG52QBm+
	LRXAystc7dtDTHK8CmJwd8KV7ZpWZ2cBmLk4ZUVg82p866mg2/EAvZzRLEGeURhkNahrThHBpgy+t
	pgQuj7vEX8hSvzGDFK/GM/+0NsqRrpDMc+hO/I4PBXFKKdOC4gssPKcRbBK6+z942YLx+ReFsXOyR
	zmWvSi3RkrSshApRv3RmUCbZ8z4pQH6YpQxfBN8MrRBZ6TQmTYZRQHsTF/HVfQ63N8XNWuPb2FnmT
	6BMNBAZeK3hiHxIk8WWRG/Eo00TN7S33VtVCOpdg0fqMPc9cPL/kqTNKmL3UIsxQ46gfkN1YpYuI8
	KDes7dXacUpCX6esl+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13fR-0090J2-4F; Tue, 14 Jun 2022 10:21:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o13f5-009091-Bo
	for linux-riscv@lists.infradead.org; Tue, 14 Jun 2022 10:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655202038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94Tijhs2krNsUh5sgMXTyng6F8TEy2CILJiweYDy2xE=;
	b=B/h8W3Uc6mWISxM8yGuxyrQGQtGxxeHyN7LAunT62e3Sq2IP0qzFTfaNu+pZc/bWBsazPQ
	Warwq1Vl0Gqno5yc5LcYwzTRIsJBQpol3WT5DfgKFaVlr2MIM5LcxDT71BiPM7X5iSU54s
	WC99wv/jdDzGthsBu8lTjRC68/xjezI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-oZmcGoKQNE-UgM_JJWpd_A-1; Tue, 14 Jun 2022 06:20:33 -0400
X-MC-Unique: oZmcGoKQNE-UgM_JJWpd_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50276811E76;
	Tue, 14 Jun 2022 10:20:31 +0000 (UTC)
Received: from localhost (ovpn-12-211.pek2.redhat.com [10.72.12.211])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A42CC52D63;
	Tue, 14 Jun 2022 10:20:29 +0000 (UTC)
Date: Tue, 14 Jun 2022 18:20:25 +0800
From: Baoquan He <bhe@redhat.com>
To: Wupeng Ma <mawupeng1@huawei.com>
Cc: corbet@lwn.net, will@kernel.org, ardb@kernel.org,
	catalin.marinas@arm.com, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, dvhart@infradead.org, andy@infradead.org,
	rppt@kernel.org, akpm@linux-foundation.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	paulmck@kernel.org, keescook@chromium.org, songmuchun@bytedance.com,
	rdunlap@infradead.org, damien.lemoal@opensource.wdc.com,
	swboyd@chromium.org, wei.liu@kernel.org, robin.murphy@arm.com,
	david@redhat.com, anshuman.khandual@arm.com,
	thunder.leizhen@huawei.com, wangkefeng.wang@huawei.com,
	gpiccoli@igalia.com, chenhuacai@kernel.org, geert@linux-m68k.org,
	vijayb@linux.microsoft.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 5/5] memblock: Disable mirror feature if kernelcore is
 not specified
Message-ID: <Yqhg6abZDGZSpJ7+@MiWiFi-R3L-srv>
References: <20220614092156.1972846-1-mawupeng1@huawei.com>
 <20220614092156.1972846-6-mawupeng1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220614092156.1972846-6-mawupeng1@huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_032039_507749_1327F1D8 
X-CRM114-Status: GOOD (  24.71  )
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

On 06/14/22 at 05:21pm, Wupeng Ma wrote:
> From: Ma Wupeng <mawupeng1@huawei.com>
> 
> If system have some mirrored memory and mirrored feature is not specified
> in boot parameter, the basic mirrored feature will be enabled and this will
> lead to the following situations:
> 
> - memblock memory allocation prefers mirrored region. This may have some
>   unexpected influence on numa affinity.
> 
> - contiguous memory will be split into several parts if parts of them
>   is mirrored memory via memblock_mark_mirror().
> 
> To fix this, variable mirrored_kernelcore will be checked in
> memblock_mark_mirror(). Mark mirrored memory with flag MEMBLOCK_MIRROR iff
> kernelcore=mirror is added in the kernel parameters.
> 
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  mm/internal.h   | 2 ++
>  mm/memblock.c   | 3 +++
>  mm/page_alloc.c | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index c0f8fbe0445b..ddd2d6a46f1b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -861,4 +861,6 @@ struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags);
>  
>  DECLARE_PER_CPU(struct per_cpu_nodestat, boot_nodestats);
>  
> +extern bool mirrored_kernelcore;
> +
>  #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/memblock.c b/mm/memblock.c
> index b1d2a0009733..a9f18b988b7f 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -924,6 +924,9 @@ int __init_memblock memblock_clear_hotplug(phys_addr_t base, phys_addr_t size)
>   */
>  int __init_memblock memblock_mark_mirror(phys_addr_t base, phys_addr_t size)
>  {
> +	if (!mirrored_kernelcore)
> +		return 0;

memblock_mark_mirror() is just a wrapper, maybe we should check this in
efi_find_mirror(). Otherwise, how do we explain the message printed out
at below in boot log if we don't mark mirror memory at all?

void __init efi_find_mirror(void)
{
......
	if (mirror_size)
                pr_info("Memory: %lldM/%lldM mirrored memory\n",
                        mirror_size>>20, total_size>>20);
}

> +
>  	system_has_some_mirror = true;
>  
>  	return memblock_setclr_flag(base, size, 1, MEMBLOCK_MIRROR);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e008a3df0485..10dc35ec7479 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -356,7 +356,7 @@ static unsigned long required_kernelcore_percent __initdata;
>  static unsigned long required_movablecore __initdata;
>  static unsigned long required_movablecore_percent __initdata;
>  static unsigned long zone_movable_pfn[MAX_NUMNODES] __initdata;
> -static bool mirrored_kernelcore __meminitdata;
> +bool mirrored_kernelcore __initdata_memblock;
>  
>  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
>  int movable_zone;
> -- 
> 2.25.1
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
