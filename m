Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01379EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdbKhdyIkdXcGinjO/AimO/Cdqhqu0Bk2E/YOkwDoJk=; b=jYht9db/o8fJ2s
	gM7fUyc7dMmr2XbAaiigzCwH+zd0vCuL5Wc7VyxFSv8BkZ0GjBDbIZHEkITUmXHwFRj/TYFYm6Xgj
	UbP0Kz1dw+8QZTLxWWC0UeI0wZmal2fpYPp1giVy/bCo3pmnDg6CMR8FXtJVuMuZTwdoEpZg9/FvJ
	IyvsWmU8bnw1nRCT+npe9BJT5iE6iRpbXaqD5fTAoJuh+BAGrZd58jmmK6VCgH/djSHd6hnuSIzbB
	toBVcRV2+A4aONv2Z8zcjrSvK9kDcHNMTbb5sKwJKOL807VkPwzVcLxLuxVzZsXSlECcSQI84ZQnK
	ESZEFsf5KsJI26PYyF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzKt-0057vu-0v;
	Wed, 19 Jul 2023 05:02:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzKr-0057vK-1i
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=48OfsAs+5NoliWawjnL6mrqynpB+mYbsWNJ2N0teO4w=; b=DOIH9Ci2k+jwmoCx0qDbAQBt0m
	T5IblWLpL0uAcgXuzpyWfUJze6MMq/DGhI5PfUintg0SuVfiqGPU0pr8KMLDi+Zy7G5doz5nU43CN
	Y6G7VXmpitG3WeZs0JraEWatdluPiDfbNJTpC3l2ibqxNHTWK/CdPSUE/Av6WvfkjAKOqDbCUYcNk
	o9GUndwksU67A3cmOLbOiUmhvsUBWKwL6Cj7pgaVKnsATaWM1TLwbo3Q0NpuoVOL1HRrMr5VuM+Pp
	/x4pfI4ZdPlABz54E5sn6oOB62Ygrr0NydL6o17HpDnYG4zq6W6vSUpA06WslnD4R06P/zinwC0Mr
	z5h2rxZA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgH2-00BJZS-1P
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 08:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689669568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48OfsAs+5NoliWawjnL6mrqynpB+mYbsWNJ2N0teO4w=;
	b=ZcNcd7BUBnlW5ef07InP4qh+CXmP3//x42h+6KkHe8zJOK0n9oT9g0y6W/ehB+qHMatmcw
	Kf0/QgsUyWPFa8xrIeo741jLcPHKMcKOuRT/pD7KMZ08fjj2lXPIs25ToXrdu6zX7iyncC
	ZauNHXYSMNIJlWS18hN+GSvlY76wO7Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689669695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=48OfsAs+5NoliWawjnL6mrqynpB+mYbsWNJ2N0teO4w=;
	b=MrbnCpCS7bp9A5WQ7/1FJF9khDEPX8Cy43YH5ZUxg09srKqM2YMNN0pEC8SgCPDLyklu1l
	9CtEq23y3xp7Q2a0nfbPmZ+iqtCdoOSPyFZ0wxn8qZOQXlRx11wePL+cn61jHLQx6AAMcE
	qy+T/n/nGGFb9mnUsMx0Nrk+OTGDSiI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-VSntmr5iPMm8I3oirb-AUQ-1; Tue, 18 Jul 2023 04:39:27 -0400
X-MC-Unique: VSntmr5iPMm8I3oirb-AUQ-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-543c2538071so743630a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 01:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689669566; x=1692261566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48OfsAs+5NoliWawjnL6mrqynpB+mYbsWNJ2N0teO4w=;
        b=et0Bcle87qbcaPJedRhkveygxqM8iHK5xBuqolr1e8Y68Stac6o3HO23XhTvxM0HAX
         kjDuiKu9SwUTngYNI9MNhAqxQ3BoZHLvPZ7bDutc+5mvvvZRmpUePUo2T/t8z5C1kgr0
         7IL9GYYoPrkpP/fMwqPO6hpDA91L8ZA4amQeB5u01HC/rmHj1nPuIW7gB9YLxkWDjmy8
         YRJWOpQpaf9Mkdw3O5dpeYgntZkqZkwmCZWRQwEojD0uIAlcarXAbE6WUuneTErlGPz7
         QXrXU89ZeKc1EJtQZDzD1Sp05vmP94yDcErxe9PjmuzHR06HseyQ4jJubavurY+pU2y6
         H+Og==
X-Gm-Message-State: ABy/qLZeYnO7OfICPLDGxvlsGIEth/ecWuvRzBbkKeR+fWzKKz/2vqr0
	b3Q20VhVU11kIw7S7gK6jthPXO0sCtI/W5ED0/G3z5JGz58LOi1Rmxiehsy7c2/6FRfrF0VV/JV
	HkfjeL97xhTVlhLJiG9AaLlryEIjY
X-Received: by 2002:a05:6a21:338e:b0:123:149b:a34f with SMTP id yy14-20020a056a21338e00b00123149ba34fmr11522155pzb.1.1689669565971;
        Tue, 18 Jul 2023 01:39:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFn6VTd9NoeqQyeoZ4mz9lw2meP9X5GlAOs2CSTs0WWxzf4uI+E1rzir2tOn6PnHRRKr5e2eQ==
X-Received: by 2002:a05:6a21:338e:b0:123:149b:a34f with SMTP id yy14-20020a056a21338e00b00123149ba34fmr11522141pzb.1.1689669565640;
        Tue, 18 Jul 2023 01:39:25 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id p9-20020a639509000000b0055bbc746272sm1140176pgd.17.2023.07.18.01.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 01:39:25 -0700 (PDT)
Message-ID: <148fecc6-7ad5-1039-4466-7c1e5a9df911@redhat.com>
Date: Tue, 18 Jul 2023 16:39:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 07/11] KVM: arm64: Define kvm_tlb_flush_vmid_range()
To: Raghavendra Rao Ananta <rananta@google.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-8-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-8-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_094136_883308_E74473E5 
X-CRM114-Status: GOOD (  16.45  )
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



On 7/15/23 08:54, Raghavendra Rao Ananta wrote:
> Implement the helper kvm_tlb_flush_vmid_range() that acts
> as a wrapper for range-based TLB invalidations. For the
> given VMID, use the range-based TLBI instructions to do
> the job or fallback to invalidating all the TLB entries.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_pgtable.h | 10 ++++++++++
>   arch/arm64/kvm/hyp/pgtable.c         | 20 ++++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 8294a9a7e566..5e8b1ff07854 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -754,4 +754,14 @@ enum kvm_pgtable_prot kvm_pgtable_stage2_pte_prot(kvm_pte_t pte);
>    *	   kvm_pgtable_prot format.
>    */
>   enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte);
> +
> +/**
> + * kvm_tlb_flush_vmid_range() - Invalidate/flush a range of TLB entries
> + *
> + * @mmu:	Stage-2 KVM MMU struct
> + * @addr:	The base Intermediate physical address from which to invalidate
> + * @size:	Size of the range from the base to invalidate
> + */
> +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t addr, size_t size);
>   #endif	/* __ARM64_KVM_PGTABLE_H__ */
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index aa740a974e02..5d14d5d5819a 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -670,6 +670,26 @@ static bool stage2_has_fwb(struct kvm_pgtable *pgt)
>   	return !(pgt->flags & KVM_PGTABLE_S2_NOFWB);
>   }
>   
> +void kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t addr, size_t size)
> +{
> +	unsigned long pages, inval_pages;
> +
> +	if (!system_supports_tlb_range()) {
> +		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +		return;
> +	}
> +
> +	pages = size >> PAGE_SHIFT;
> +	while (pages > 0) {
> +		inval_pages = min(pages, MAX_TLBI_RANGE_PAGES);
> +		kvm_call_hyp(__kvm_tlb_flush_vmid_range, mmu, addr, inval_pages);
> +
> +		addr += inval_pages << PAGE_SHIFT;
> +		pages -= inval_pages;
> +	}
> +}
> +
>   #define KVM_S2_MEMATTR(pgt, attr) PAGE_S2_MEMATTR(attr, stage2_has_fwb(pgt))
>   
>   static int stage2_set_prot_attr(struct kvm_pgtable *pgt, enum kvm_pgtable_prot prot,

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
