Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA300C4741F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F181206CA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D22PqBwu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="TjFj1/11"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F181206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=zbbCc8srC6U6Fg5wWj0sDX151AmzJ3Bc3UPWpV/kjMw=; b=D22PqBwuFt8OJr0zs87Mex9hP
	0RruJS7VkppWrDIVLKqF6C+DgelDYU11dYcvzAAtFgR1BYWnJ2GGXCbxuX28mt11IBL3AxDngBEDt
	ikqwvF+3WEb6lM4dMtfSe9F+QOFyVOgz8Z+gJfWX7TbTnyxfB1KXyYtQ22+g+MvJEOqdrKkwoGmgu
	PB6gaSQ2LixJGtLWslp5eYReZ9qYp/WngpHXia39Fm1a7LCSUaJIUVreDSGPA/NsiVJU4U+gfEQYF
	5BZ7wnQDcs+Ec8yHTJwic2+ZMyTmPZcPY6lb/IMQ1yo7KznWQmME0tOPsI3UmZ6PnRi6jiCLetfF3
	f+/xixTiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaj9R-0005jI-B2; Thu, 05 Nov 2020 17:34:21 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaj9B-0005at-OU
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 17:34:09 +0000
Received: by mail-pj1-x1041.google.com with SMTP id f12so426397pjp.4
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 09:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=smObYvB7UrNcMPo3P/gpfiQDzpAY2JnzU7bqWocm15Q=;
 b=TjFj1/11pI29VIxZ1hX/0ytTD/fL3xmC/oL//nL63LWvJR5eahIyyvYJPYizEzEYbW
 +ZIL6Cuyh8F/whBD+ZbeZf4kMz8/xJOxHoG7r7oTfm7+TAWnnZ2GLA1Y1wcnVNxfz+j7
 z38KrSTxH7D4GKklTAbc+uTZDAs4B1P+6fWBT+USAe0xjB6giWYn4015KsT4/jFSSGiA
 Goa3O+kEbmKS6i/5UIsMV9JJiYbVtn+RhThQ4jKQOsMog2t3c3Hcq6qq0WxorJZQLk1Y
 RRsFPzzQlbeWAKHMGx1iePrEx52qWxy3gYNE97jw6b7Fo4yz1vEShr9rbZ5rqR35+W6q
 150A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=smObYvB7UrNcMPo3P/gpfiQDzpAY2JnzU7bqWocm15Q=;
 b=h5tZCdMeYsbScDgHOQk+WgmT5JgaqL/A5BfO+NlApIsn8JL64uC2/B1cMFacJ6bmm5
 MmgLFjkgdFwpPXgp0eorkjocvrrHBksHIchdD5YZiThWKUkku2EvpkFVBOyE7TM4oQeP
 nznnuFWaBQYDv1wIo1OyTjXZnKtBzuqbWaU/xlLD7LqdHMTDq1QzY71PDGUXdPrh1kop
 7eEqz46ZNFeu+WniYtpWKfaJCH6skwlmNktiZgZZmfIf/GFUUEWyTa4sUtaeG8AV414w
 USNR9ZvOl8d522M/WNr2+CxcSo7yXUZ5f6fW4+etnHn4yzHAxRFiQiaqf/EA1o2MNh/Y
 q42w==
X-Gm-Message-State: AOAM533MO2/iRyaWde/4oZVis0EgAzPFeSHDYyI8zn5pZvPhxjcLrRMV
 2GM4G9RYUYxqIR273aiCVGRQJw==
X-Google-Smtp-Source: ABdhPJyg49tn1L5mM+0reqlQrplb5ljU+nTGL0n2a4GRUYdECxV+5+PQYi+ME7A6CaDdqAfQjtjO/Q==
X-Received: by 2002:a17:902:8f88:b029:d6:d62c:e437 with SMTP id
 z8-20020a1709028f88b02900d6d62ce437mr3221904plo.73.1604597643292; 
 Thu, 05 Nov 2020 09:34:03 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h184sm3022962pfe.161.2020.11.05.09.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:34:02 -0800 (PST)
Date: Thu, 05 Nov 2020 09:34:02 -0800 (PST)
X-Google-Original-Date: Wed, 04 Nov 2020 14:28:21 PST (-0800)
Subject: Re: [PATCH v4 4/5] riscv: Add support pte_protnone and pmd_protnone
 if CONFIG_NUMA_BALANCING
In-Reply-To: <20201006001752.248564-5-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-325cf154-5f4d-41fc-8ad1-2a29a7068f33@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_123405_860172_6EFDCEF7 
X-CRM114-Status: GOOD (  20.91  )
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
Cc: wangkefeng.wang@huawei.com, david@redhat.com, catalin.marinas@arm.com,
 Jonathan.Cameron@huawei.com, Atish Patra <Atish.Patra@wdc.com>,
 zong.li@sifive.com, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arch@vger.kernel.org, justin.he@arm.com, anup@brainfault.org,
 rafael@kernel.org, steven.price@arm.com, greentime.hu@sifive.com,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 anshuman.khandual@arm.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rppt@kernel.org, akpm@linux-foundation.org,
 nsaenzjulienne@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 17:17:51 PDT (-0700), Atish Patra wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>
> These two functions are used to distinguish between PROT_NONENUMA
> protections and hinting fault protections.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 515b42f98d34..2751110675e6 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -183,6 +183,11 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
>  	return (unsigned long)pfn_to_virt(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
>  }
>
> +static inline pte_t pmd_pte(pmd_t pmd)
> +{
> +	return __pte(pmd_val(pmd));
> +}
> +
>  /* Yields the page frame number (PFN) of a page table entry */
>  static inline unsigned long pte_pfn(pte_t pte)
>  {
> @@ -286,6 +291,21 @@ static inline pte_t pte_mkhuge(pte_t pte)
>  	return pte;
>  }
>
> +#ifdef CONFIG_NUMA_BALANCING
> +/*
> + * See the comment in include/asm-generic/pgtable.h
> + */
> +static inline int pte_protnone(pte_t pte)
> +{
> +	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE)) == _PAGE_PROT_NONE;
> +}
> +
> +static inline int pmd_protnone(pmd_t pmd)
> +{
> +	return pte_protnone(pmd_pte(pmd));
> +}
> +#endif
> +
>  /* Modify page protection bits */
>  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  {

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
