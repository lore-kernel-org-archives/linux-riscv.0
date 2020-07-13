Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCA2C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 12:22:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BDD20738
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 12:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gjed7xHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BDD20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vyV13tXaPTH5dcmkwI1RTEpE+V08+Q16gcNJrEpTbi4=; b=gjed7xHjz5fueBQLn4ikjci31
	clbZ7V88PQP5zrfsAzqicYD8hgXM/JHKlUYHjdAlk+PEHbTAQTNgTNxGbTV+AAvP7pd8UnrbrVeiP
	DOD0h9hsu0glgeIs/Ly0KDI83ItmxOXgHvkrX/Pa5t0zHiSuWD9xjATI9Eb32/i0C5eT38EGpnGLi
	vySA1/910JLd0brT3J8t2HvxUhrq6NLr9LNPAy41e5SqZNEP/DJhxP+oHjbSfdiR3dwlJB+Uqaoox
	v0qZt+v7upGDYbs/CHyxOd4oAne54+Ul8e8ire2sEfva0b9YA72n28cg9q8M7UZPhUdPANuipf7WO
	Miw9aazTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juxT9-0006uK-Nh; Mon, 13 Jul 2020 12:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juxT7-0006tQ-Lk
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 12:22:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E83530E;
 Mon, 13 Jul 2020 05:21:56 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA0163F887;
 Mon, 13 Jul 2020 05:21:54 -0700 (PDT)
Date: Mon, 13 Jul 2020 13:21:48 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
Message-ID: <20200713122148.GA51007@lakrids.cambridge.arm.com>
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710135706.537715-6-hch@lst.de>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_082201_768330_B2EEA5E0 
X-CRM114-Status: GOOD (  17.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 10, 2020 at 03:57:05PM +0200, Christoph Hellwig wrote:
> Add helpers to wraper the get_fs/set_fs magic for undoing any damange
> done by set_fs(KERNEL_DS).  There is no real functional benefit, but this
> documents the intent of these calls better, and will allow stubbing the
> functions out easily for kernels builds that do not allow address space
> overrides in the future.

> diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
> index 191e75a6bb249e..30471549e1e224 100644
> --- a/arch/m68k/include/asm/tlbflush.h
> +++ b/arch/m68k/include/asm/tlbflush.h
> @@ -13,13 +13,13 @@ static inline void flush_tlb_kernel_page(void *addr)
>  	if (CPU_IS_COLDFIRE) {
>  		mmu_write(MMUOR, MMUOR_CNL);
>  	} else if (CPU_IS_040_OR_060) {
> -		mm_segment_t old_fs = get_fs();
> -		set_fs(KERNEL_DS);
> +		mm_segment_t old_fs = force_uaccess_begin();
> +

This used to set KERNEL_DS, and now it sets USER_DS, which looks wrong
superficially.

If the new behaviour is fine it suggests that the old behaviour was
wrong, or that this is superfluous and could go entirely.

Geert?

Mark.

>  		__asm__ __volatile__(".chip 68040\n\t"
>  				     "pflush (%0)\n\t"
>  				     ".chip 68k"
>  				     : : "a" (addr));
> -		set_fs(old_fs);
> +		force_uaccess_end(old_fs);
>  	} else if (CPU_IS_020_OR_030)
>  		__asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));

> +/*
> + * Force the uaccess routines to be wired up for actual userspace access,
> + * overriding any possible set_fs(KERNEL_DS) still lingering around.  Undone
> + * using force_uaccess_end below.
> + */
> +static inline mm_segment_t force_uaccess_begin(void)
> +{
> +	mm_segment_t fs = get_fs();
> +
> +	set_fs(USER_DS);
> +	return fs;
> +}
> +
> +static inline void force_uaccess_end(mm_segment_t oldfs)
> +{
> +	set_fs(oldfs);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
