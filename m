Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD84C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0CD6105A
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 22:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE0CD6105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tsEcfMPIjO4geOkIu44YNdo2e/25GKUmFiEaJ5yqO8I=; b=FdktubBqGkUIRp2G2PtN46NqCN
	4lto15cNr3tUAslsUBQAlekD3e0TYEYLUsuBB+G8IaxFQ/amwHWJXlAIq9AF5jo8pGL8gaqVYyD7j
	wzgvDBGyHLj6EdeHPPZr5gm0i2AvHxOs1NPlQV1s0AJS37YYtP2PRitYpqyXOMege1pwQIrLW12ix
	Bwv26KPd5WeIjtSljjt75j5afPeTSQZVf4l3tw/dzo/FECZ1ihQGP96EHRm9sARMu5wSZKQLD8QmA
	EGY1goRH9xn+UyVezbH05C/P9om99LFlC50iKutEst8WC64ufUiNXQ8sPbEV+1tVkaTew59Wtvn3Z
	bI7ZM31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln7ho-008W9q-IB; Sat, 29 May 2021 22:45:20 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln7hZ-008W7Y-JH
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 22:45:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id l70so5422058pga.1
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Lpdx0Um03jUzqWO4AaIxjC3bK1N0jnixW+8FFlMlqMA=;
 b=sj3hzKzorWG43QKLPPjBiiTmSiEUHi97unt/f9AoqvyIidgde3OSve5K7/wqfstvxo
 pPAH6blRfLa+LT3yh/0pPtiauFlxY2wUUg+OM+hpz5VQW+Jz+So6ac7mgCcTyq8/ZFpy
 ce7xp2jx4510guVZDywugXiuIgtaOCDSYLZhHKuQJ6aQWmjUBHTKxA5pzbxoKsPpWoHm
 7vZ+GF6EcItYzrz6yrR5VUBVDcRGycWIg+/XYVCfFobvFHKiq4gaX6iSqyAPZEBrFACx
 5MgndjKNyarKhotIx8MNj6LAbQdHYPTf07NgtgwS3gNuvTOIFWw+delANS0yVVqtOYHN
 n1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Lpdx0Um03jUzqWO4AaIxjC3bK1N0jnixW+8FFlMlqMA=;
 b=g04qZ0be86QBzZVfBWulrfFGhUl18ICrOXb4EW1fEjDhHQyXCkh1pjm4anHlNpWJP1
 6fw+l1yFBJSps1MO9hNjm/RslzhsUbnA4nB3h9UXPMA8e5UDGyGKJj8hIO2i4ThcOW73
 AB5a9SWKoV9ik5VBVNl5OsDTB3lY3T42HsYES1JRopTpq29WPWzyASByvoPoXrydDAvj
 P0AfsNRAx+2KzvVUmSglS62iprw53/vYD6z1N/f4YKBpZVQlNopgsKJCbp7jZnqD0+xN
 tYyksDdsfWKZkMHtx/sciUzvo9IxHQbAyPGPlHZWv8Gf1mdBa7Gh+AUrGJqdj6fYIXnY
 govg==
X-Gm-Message-State: AOAM530PJJzvbWz4cqh+KkygORuCY09UQmEazG5snjFOPOsarEveiCSm
 um5p8NF2Oo+sYGnP1fTflkT7Pg==
X-Google-Smtp-Source: ABdhPJyWtP3MVhxRgO3jrnndKaQfJ0lHL6blo2oW0FRSpfHSJK4uH9cuYZsGnZQwwLYHURnmuoX7tA==
X-Received: by 2002:a05:6a00:16c9:b029:2df:c620:8156 with SMTP id
 l9-20020a056a0016c9b02902dfc6208156mr10214707pfc.40.1622328304768; 
 Sat, 29 May 2021 15:45:04 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gg10sm7221762pjb.49.2021.05.29.15.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 15:45:04 -0700 (PDT)
Date: Sat, 29 May 2021 15:45:04 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 15:38:54 PDT (-0700)
Subject: Re: [PATCH -next] riscv: mm: fix build errors caused by mk_pmd()
In-Reply-To: <20210524070220.793082-1-sunnanyong@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 wangkefeng.wang@huawei.com, sunnanyong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: sunnanyong@huawei.com
Message-ID: <mhng-4fb5ea1f-084a-4010-b4a6-d19423511720@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_154505_655852_55387246 
X-CRM114-Status: GOOD (  18.41  )
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

On Mon, 24 May 2021 00:02:20 PDT (-0700), sunnanyong@huawei.com wrote:
> With "riscv: mm: add THP support on 64-bit", mk_pmd() function
> introduce build errors,
> 1.build with CONFIG_ARCH_RV32I=y:
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> arch/riscv/include/asm/pgtable.h:513:9: error: implicit declaration of function 'pfn_pmd';
>  did you mean 'pfn_pgd'? [-Werror=implicit-function-declaration]
>
> 2.build with CONFIG_SPARSEMEM=y && CONFIG_SPARSEMEM_VMEMMAP=n
> arch/riscv/include/asm/pgtable.h: In function 'mk_pmd':
> include/asm-generic/memory_model.h:64:14: error: implicit declaration of function 'page_to_section';
>  did you mean 'present_section'? [-Werror=implicit-function-declaration]
>
> Use macro definition instead of inline function for mk_pmd
> to fix the above problems.It is similar to the mk_pte macro.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4b708ae08910..f35d9c90d4cb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -508,10 +508,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
>  	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>  }
>
> -static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
> -{
> -	return pfn_pmd(page_to_pfn(page), prot);
> -}
> +#define mk_pmd(page, prot)    pfn_pmd(page_to_pfn(page), prot)
>
>  static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  {

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
