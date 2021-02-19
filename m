Return-Path: <SRS0=LlRU=HV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4C8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E1CA64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Feb 2021 07:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E1CA64EC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Qb9L8M3jV6Pb6ApF6MSDA0FMisq3P3j4BnVoTB3Qxpc=; b=zNL1wBt4RkxXuu/3hxFcDVWLY
	S41qpUA6X2EZtWNZCmGJTnH9EDxcS+DPcUmDb5QCAlGJCEKS9yozmpZmioMPUq5Okzm7KFTly4YF/
	0auF0I3o6rRjqq041B3cClYiTtpWWPyYGINjoJiL7oVRSNIGc3s2OH6I83Yk4/PlG2xNX0Br0SkT/
	+QlHG+ocq9A6w/iXwBVVXuXoIM/pm0y1GDA6CQ3jFpcbfo11J+9XxpAxeNtGJ0SuMBDR02RAkN+JB
	EZtQ9YhClsACDYBTlCpf+eKk8oH4yFQA/sjEBObuKaG3U+bvw0Nj/K7pUeb0gxend2XR4z5il8TEi
	jqPKWDYrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lD00o-00037l-6m; Fri, 19 Feb 2021 07:15:38 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lD00k-00036U-Sf
 for linux-riscv@lists.infradead.org; Fri, 19 Feb 2021 07:15:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id o7so3161733pgl.1
 for <linux-riscv@lists.infradead.org>; Thu, 18 Feb 2021 23:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8lkt95sYDeUCTA7YkMKfu8hbBBB95/u7drARDDbQrSg=;
 b=tu8tprzG0VoPsS9SNZb6PNcZ6dgf6WslQym9zNsgOqjJAdjG5IGVSGTO4T+Rqx/46f
 mQwDxxXwf9K7lzB0Ry8T8iTt5PPiyEBYstOPltq1seJbkXVEYldKz/helr7mYm2s2uFy
 ypqYcu1IknYq2ozb2G5iNfDJ3jgBUTN4Dcbix+/lVWhL8m8GLb11Hw55lIY6l+PTCVBL
 GpNXbpgAnPibtThARk3KAKmxFBwLRqmJrqzV7Jw40n5K+lDVhE8/+Dfa4C8KwY7OpyCT
 AAKo8apgjTRu9XCCLHJA8E7PaevkKYrqGn3eItgnRfxwGOv9sM+qFxF36wpz59IrG/ty
 OjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8lkt95sYDeUCTA7YkMKfu8hbBBB95/u7drARDDbQrSg=;
 b=Uvnwv0ZQ5UZV2BuSdRdQ0YsNYTh2Yh0P1T/FIhvxr41fX7RK5nX4IKtktKLJM3TiTT
 RdM5p5rB6/8f6VhvFJGiTHG3wNWewrfQftmx9JMJ0YjEkf/6yAl0ATRRxmfz3AMCkGV2
 M+ymSTnWwEZHPOnkOIGdDvxypLPcBp64R0gRaJyQPasyJjH+sdBMWalXVV7L/XqACLb7
 6AGWUS/WjWgGQ2CiC6YLXxY1jP0DqevVOpo0SJgVS6+oAlaQgLrSksdtHHxUdqi9TC0p
 osnLoophTtpsBQCzn0EqPQqpHPofhtZ/QRJMl/w/TIPMPZspAXFCSMQeVZsvJBLL2DKq
 CAOw==
X-Gm-Message-State: AOAM530B0Jpk6ZqVFmah6HhhCXXKpcQPHdWjvA2ovMXFuYtnCz5MLQ2q
 FFOOtBUwcXlQxpwFmqOIolmi9HgJT7e6wNwY
X-Google-Smtp-Source: ABdhPJyz186f/9X/542mJSTspWidUwiw6l27WyxazjJrpOzIeAlv+wk5d3iznettXDozMVViz+tG5g==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr7519298pgf.141.1613718931884; 
 Thu, 18 Feb 2021 23:15:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x8sm7460978pjf.55.2021.02.18.23.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:15:31 -0800 (PST)
Date: Thu, 18 Feb 2021 23:15:31 -0800 (PST)
X-Google-Original-Date: Thu, 18 Feb 2021 22:32:08 PST (-0800)
Subject: Re: [PATCH v2] riscv: Cleanup setup_bootmem()
In-Reply-To: <20210209010151.85751-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-b8acf3e5-d496-4094-8b55-c7a6d5fa2dc5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210219_021535_263958_9A896FC1 
X-CRM114-Status: GOOD (  23.22  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Feb 2021 17:01:51 PST (-0800), wangkefeng.wang@huawei.com wrote:
> After the following patches,
>
>   commit de043da0b9e7 ("RISC-V: Fix usage of memblock_enforce_memory_limit")
>   commit 1bd14a66ee52 ("RISC-V: Remove any memblock representing unusable memory area")
>   commit b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
>
> some logic is useless, kill the mem_start/start/end and unneeded code.
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
> v2:
> - Update changelog and add RB.
>
>  arch/riscv/mm/init.c | 21 ++-------------------
>  1 file changed, 2 insertions(+), 19 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 0b86a1a12da2..241f22348403 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -108,34 +108,17 @@ void __init mem_init(void)
>
>  void __init setup_bootmem(void)
>  {
> -	phys_addr_t mem_start = 0;
> -	phys_addr_t start, dram_end, end = 0;
>  	phys_addr_t vmlinux_end = __pa_symbol(&_end);
>  	phys_addr_t vmlinux_start = __pa_symbol(&_start);
> +	phys_addr_t dram_end = memblock_end_of_DRAM();
>  	phys_addr_t max_mapped_addr = __pa(~(ulong)0);
> -	u64 i;
> -
> -	/* Find the memory region containing the kernel */
> -	for_each_mem_range(i, &start, &end) {
> -		phys_addr_t size = end - start;
> -		if (!mem_start)
> -			mem_start = start;
> -		if (start <= vmlinux_start && vmlinux_end <= end)
> -			BUG_ON(size == 0);
> -	}
>
> -	/*
> -	 * The maximal physical memory size is -PAGE_OFFSET.
> -	 * Make sure that any memory beyond mem_start + (-PAGE_OFFSET) is removed
> -	 * as it is unusable by kernel.
> -	 */
> +	/* The maximal physical memory size is -PAGE_OFFSET. */
>  	memblock_enforce_memory_limit(-PAGE_OFFSET);
>
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
> -	dram_end = memblock_end_of_DRAM();
> -
>  	/*
>  	 * memblock allocator is not aware of the fact that last 4K bytes of
>  	 * the addressable memory can not be mapped because of IS_ERR_VALUE

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
