Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DC7C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYjO8NrCAAJFlQIa5AMY+jKcueqn7KlHP0yoGmvmj1g=; b=AQgmUpnNg/s3T5
	5aZa8wqUkG7nhDtJBU1V1ctkLHBKtY37wA13nWrlvz2GaSaGNJTUIOHpOKTHTQO1/qsq/EjcSHNIQ
	u5u6Rqy+M5QXoXSov6OD/dqJC+SjS2uHHY8BDklm1ZxXn+aePoo8uuCUEFCEr2ILOORH5NcmR5K0X
	zTNET+Jl2Pvy2u/Nr4Rv7K504CvRWeuG5P266DxxlmXPvy6BOnZgQz+eJAaCVwyvyZdvwcVESneLx
	4kIA9aep1HV18ZVjG+mlQmGG2L+fLTWAsUB59gEGam7ebj6S1lHzf5Mz7ITcRkDp1VwPgCuG4mT/Z
	1ZvceVbMMDQEYYF18Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXaM-00EZ5h-Mo; Mon, 13 Feb 2023 12:05:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXaI-00EZ4B-5j
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 12:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676289923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LWwnaVVkHZ3TxJmod/JcejUfCO6MlIwBZ7PTsYBSbh0=;
	b=VzNheLmbzJCsnqCRQg+KLzt353UOvXUl05xdpY+UzS93XoodXSQc/x8xwgMxpnNHcnwKfg
	tSWnbQfXIwXb39AuaOeF4MYOozcSyRFhqazm2TKuDqWm/XOIOF70yR/p2YDwjVjGhSsb0D
	AJWr6bVXpD3izisLDjBhCMpEY9fF9p4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-TGfbFTp2M8WUTwqnfEDVHw-1; Mon, 13 Feb 2023 07:05:19 -0500
X-MC-Unique: TGfbFTp2M8WUTwqnfEDVHw-1
Received: by mail-wm1-f70.google.com with SMTP id b19-20020a05600c4e1300b003e10d3e1c23so8695295wmq.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 04:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LWwnaVVkHZ3TxJmod/JcejUfCO6MlIwBZ7PTsYBSbh0=;
        b=2K+stlzq2XjqEmrm/nq118r6dgVgHbXho4zeyHae7kXXhj3/1LJp4ZSNK6FMcH3/jq
         iSgy6Z1cU8Mpr0OK8jl8oh2LO4rJW2Y8V8bNRB3/lCzZNYZRPuooWeibnb3xDJY2leoQ
         siJ0md4tZsQnc44kj/GrlDahE9mYbrFBYQy0RCP6jWPXgtgVOpa+IBK/G2Tjd7SKI8qK
         2h+HA4heEU3XXHeQTsOAwvSFQaAq8TTDYVtGN47GyRzhCGgRheTWBjfCuZcVEy9/QoE5
         sOmlmYIhxpnw7NOT6QAbGzJlvjoTkGtJOqdl3W6t5XbeTtwJOep7r3d+87XcRYG3oV3M
         OMQg==
X-Gm-Message-State: AO0yUKX/21aAG+Pwn7vGhngftkUTCfLXFolJsiNUGfiaL+uuhb+9JOQh
	+v9hKoM2GGXEHZDn3n//wdbtYXQmA4OY0uy7rnqHOFC3yOQ9sHF4T0CDWoYz4T2C2OjYO6PA29M
	c8e6O0tkrqVy0TcRs+W9+cW42afBq
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id i4-20020a05600c070400b003dfd8c5ec18mr19163996wmn.13.1676289918369;
        Mon, 13 Feb 2023 04:05:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/TvfuGOjSTFiefa5UXGSPN6E8+yK5KOhZR7JAxIR0Nqy6UHZc73gYlaZp/IBbv/pX2T70tdA==
X-Received: by 2002:a05:600c:704:b0:3df:d8c5:ec18 with SMTP id i4-20020a05600c070400b003dfd8c5ec18mr19163980wmn.13.1676289918082;
        Mon, 13 Feb 2023 04:05:18 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:6d00:5870:9639:1c17:8162? (p200300cbc7056d00587096391c178162.dip0.t-ipconnect.de. [2003:cb:c705:6d00:5870:9639:1c17:8162])
        by smtp.gmail.com with ESMTPSA id y9-20020adfee09000000b002c550eb062fsm5407008wrn.14.2023.02.13.04.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:05:17 -0800 (PST)
Message-ID: <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
Date: Mon, 13 Feb 2023 13:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
To: Deepak Gupta <debug@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
References: <20230213045351.3945824-1-debug@rivosinc.com>
 <20230213045351.3945824-12-debug@rivosinc.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230213045351.3945824-12-debug@rivosinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_040526_359097_5D227C58 
X-CRM114-Status: GOOD (  22.18  )
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

On 13.02.23 05:53, Deepak Gupta wrote:
> maybe_mkwrite creates PTEs with WRITE encodings for underlying arch if
> VM_WRITE is turned on in vma->vm_flags. Shadow stack memory is a write-
> able memory except it can only be written by certain specific
> instructions. This patch allows maybe_mkwrite to create shadow stack PTEs
> if vma is shadow stack VMA. Each arch can define which combination of VMA
> flags means a shadow stack.
> 
> Additionally pte_mkshdwstk must be provided by arch specific PTE
> construction headers to create shadow stack PTEs. (in arch specific
> pgtable.h).
> 
> This patch provides dummy/stub pte_mkshdwstk if CONFIG_USER_SHADOW_STACK
> is not selected.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   include/linux/mm.h      | 23 +++++++++++++++++++++--
>   include/linux/pgtable.h |  4 ++++
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 8f857163ac89..a7705bc49bfe 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1093,6 +1093,21 @@ static inline unsigned long thp_size(struct page *page)
>   void free_compound_page(struct page *page);
>   
>   #ifdef CONFIG_MMU
> +
> +#ifdef CONFIG_USER_SHADOW_STACK
> +bool arch_is_shadow_stack_vma(struct vm_area_struct *vma);
> +#endif
> +
> +static inline bool
> +is_shadow_stack_vma(struct vm_area_struct *vma)
> +{
> +#ifdef CONFIG_USER_SHADOW_STACK
> +	return arch_is_shadow_stack_vma(vma);
> +#else
> +	return false;
> +#endif
> +}
> +
>   /*
>    * Do pte_mkwrite, but only if the vma says VM_WRITE.  We do this when
>    * servicing faults for write access.  In the normal case, do always want
> @@ -1101,8 +1116,12 @@ void free_compound_page(struct page *page);
>    */
>   static inline pte_t maybe_mkwrite(pte_t pte, struct vm_area_struct *vma)
>   {
> -	if (likely(vma->vm_flags & VM_WRITE))
> -		pte = pte_mkwrite(pte);
> +	if (likely(vma->vm_flags & VM_WRITE)) {
> +		if (unlikely(is_shadow_stack_vma(vma)))
> +			pte = pte_mkshdwstk(pte);
> +		else
> +			pte = pte_mkwrite(pte);
> +	}
>   	return pte;

Exactly what we are trying to avoid in the x86 approach right now. 
Please see the x86 series on details, we shouldn't try reinventing the 
wheel but finding a core-mm approach that fits multiple architectures.

https://lkml.kernel.org/r/20230119212317.8324-1-rick.p.edgecombe@intel.com

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
