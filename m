Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AAEEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0HqOMXORQewlJS0Gq2YRJa48FgQATsI86gOJ+mM/GE=; b=HMl5N7YpAXKFcU
	FNotUZ3/SDLINoANXLwVcl/yCVSDEvKVktbLljZvFhTGEjPhcuoAJXxmDQmf+/5SYHzxYBkyptu2t
	xvEmLVeTv1F1YIvaMx4nwzYJ230NBn4dsRqXWtbmzGcHeD18x6JNBql9bTA6roZ4t2ZqJs+PN8MLE
	TlFXXjxxRayTMHU43I62eavyt6yNcgv+terRosRSjlH4kbyv9/toKPLjgeubdxspDze0TxrhV7VAC
	RIMjk2K8ngLnS1/6sCkUEuty60iChCHhg5fAQfOm/tiZv9mbErMnieQiw7ucECiQDEvsBr2ZyUgC2
	ieM1nZVSx6w6+yuJvHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ES-005VLG-2F;
	Wed, 19 Jul 2023 06:00:16 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ER-005VJW-0N
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RvSmM7MQhdDXRVA2Uryq4YVNwYFzTKNqJe4q9sLr7I8=; b=qp0YBbPA+mEdcyrGs0TDI7dcsA
	fCpKoH1M4/r6G0ks5kZ4Q52y+Ag1Ir49CCyD5LTdu7+VmZN1kaMXmolTBK5P0NMD5Hd5cgvX83mxV
	+oOoVPjM5XLRq6Q63IhucIuy/o2eY9M29/+nkBmY6bPgo7rpRi0G+LmOdZqfPnaSW8B8kCXs9LMCu
	hcy8pthHkZ938pm6oS91Y4NBOxPh2abEry9mi2pz0dCYUdshZQ2YW0jmhhbtnenvJTrNuuuxp1OKy
	J9ORxX0FdERRNCgzMIpvcVT8AU8WfJ+3vNzd27DyKdW0867i4wxGmGZIiRveJoOB+LE/W6Dt1yrmR
	xLiY8Edg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLe5i-00BDJj-1g
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 06:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689661300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvSmM7MQhdDXRVA2Uryq4YVNwYFzTKNqJe4q9sLr7I8=;
	b=B2dgonFpE7SM7Z+2R3VYzFpfSEUOvoKM3VvmV6GV/rImT+pba9BkKfOj32JzLqkUuXAw7P
	HdNmpj0gSSrVODGdqJ0jFaDCPW6sNf+tlWptiOb36umD3v9AeuHCqH8LMcOe4oblzEjMXa
	MkBLxqthngysHhf/Ldi8s/sZwLOJ5HM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689661304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RvSmM7MQhdDXRVA2Uryq4YVNwYFzTKNqJe4q9sLr7I8=;
	b=EZqHAB3ZRa1Ds7Kv7BhsIFlLPvLR9ZXPoaIKhsSp76/BJyaUDKEI0B164PXZYOc2h/XYR6
	+BF7B/+xu5UMaC9xcuQ4qxD0xphkCsk2sEev7d/OcSw4PrjVL6IQvqI6wmJADlM7AMGWr/
	I5zm3q2UY44Wph7+VVdWApTF2R+vUqQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-mk7lK3oUMoKu1zfkoAT67A-1; Tue, 18 Jul 2023 02:21:38 -0400
X-MC-Unique: mk7lK3oUMoKu1zfkoAT67A-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1b86c700cc5so7356415ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 23:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689661297; x=1690266097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RvSmM7MQhdDXRVA2Uryq4YVNwYFzTKNqJe4q9sLr7I8=;
        b=jUSONB3Wx458R5qHzczs27QPk3Kpheq9WMHhXei2HtHHEG1Cg3+6SIpYCnlLkL59mK
         76r39th1ZL5aTwG8ZO7Z3icYDfEjHaTVJ1gr3Op196Xdpc8Ru7UZD58ccbsXUpeXuo6U
         iR5bVf6Wll46FkM1zaxZDi3gWtQSflVkblME0Z5vdbZgh6xqHhLgFZcVWrfC0f0VCMY0
         VmGkH5cm2UVPwJdUas/g4tVV1ix4zwUwZBFtNqBtdTxGVecsdV6SIolgZ6VxV7y4ADWS
         ljF5r8l8ila3VlWJ/XfH6SU+BjhLVlnGhszMW8hnM5asBouYL/Lr1xD/sofniXp3uj4q
         TEjQ==
X-Gm-Message-State: ABy/qLby3fce2oc8uxoK71p29snpI9muj9wP3C1U1hQzXtetJnHrs+n7
	Uw7l4URp4E0eGX+v5snYih4EaD4S5HOyXlvmdFinRnL8zlH5wWaOZOYPhYofAelRPJDKoV4yJ2+
	txojUCr9F5tVe7dtf1m9S3R7NZXu4
X-Received: by 2002:a17:902:da85:b0:1b8:9fc4:2733 with SMTP id j5-20020a170902da8500b001b89fc42733mr10753865plx.3.1689661297309;
        Mon, 17 Jul 2023 23:21:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGwK4O80e6YQEGnzMYTYf6ot+mFwRDf85YBN8hCoLDeCfJGnn+lZlhDjDiUb0dFs/RD5ECIfQ==
X-Received: by 2002:a17:902:da85:b0:1b8:9fc4:2733 with SMTP id j5-20020a170902da8500b001b89fc42733mr10753835plx.3.1689661296887;
        Mon, 17 Jul 2023 23:21:36 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c20d00b001b392bf9192sm941082pll.145.2023.07.17.23.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:21:36 -0700 (PDT)
Message-ID: <8987d68b-d62a-7a9b-3aa3-cd5cc7ad551c@redhat.com>
Date: Tue, 18 Jul 2023 14:21:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 05/11] arm64: tlb: Refactor the core flush algorithm of
 __flush_tlb_range
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
 Catalin Marinas <catalin.marinas@arm.com>, Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-6-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-6-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_072146_947769_2C77B4AC 
X-CRM114-Status: GOOD (  24.20  )
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



On 7/15/23 08:53, Raghavendra Rao Ananta wrote:
> Currently, the core TLB flush functionality of __flush_tlb_range()
> hardcodes vae1is (and variants) for the flush operation. In the
> upcoming patches, the KVM code reuses this core algorithm with
> ipas2e1is for range based TLB invalidations based on the IPA.
> Hence, extract the core flush functionality of __flush_tlb_range()
> into its own macro that accepts an 'op' argument to pass any
> TLBI operation, such that other callers (KVM) can benefit.
> 
> No functional changes intended.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/tlbflush.h | 109 +++++++++++++++---------------
>   1 file changed, 56 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index 412a3b9a3c25..f7fafba25add 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -278,14 +278,62 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
>    */
>   #define MAX_TLBI_OPS	PTRS_PER_PTE
>   
> +/* When the CPU does not support TLB range operations, flush the TLB
> + * entries one by one at the granularity of 'stride'. If the TLB
> + * range ops are supported, then:
> + *
> + * 1. If 'pages' is odd, flush the first page through non-range
> + *    operations;
> + *
> + * 2. For remaining pages: the minimum range granularity is decided
> + *    by 'scale', so multiple range TLBI operations may be required.
> + *    Start from scale = 0, flush the corresponding number of pages
> + *    ((num+1)*2^(5*scale+1) starting from 'addr'), then increase it
> + *    until no pages left.
> + *
> + * Note that certain ranges can be represented by either num = 31 and
> + * scale or num = 0 and scale + 1. The loop below favours the latter
> + * since num is limited to 30 by the __TLBI_RANGE_NUM() macro.
> + */
> +#define __flush_tlb_range_op(op, start, pages, stride,			\
> +				asid, tlb_level, tlbi_user)		\
> +do {									\
> +	int num = 0;							\
> +	int scale = 0;							\
> +	unsigned long addr;						\
> +									\
> +	while (pages > 0) {						\
> +		if (!system_supports_tlb_range() ||			\
> +		    pages % 2 == 1) {					\
> +			addr = __TLBI_VADDR(start, asid);		\
> +			__tlbi_level(op, addr, tlb_level);		\
> +			if (tlbi_user)					\
> +				__tlbi_user_level(op, addr, tlb_level);	\
> +			start += stride;				\
> +			pages -= stride >> PAGE_SHIFT;			\
> +			continue;					\
> +		}							\
> +									\
> +		num = __TLBI_RANGE_NUM(pages, scale);			\
> +		if (num >= 0) {						\
> +			addr = __TLBI_VADDR_RANGE(start, asid, scale,	\
> +						  num, tlb_level);	\
> +			__tlbi(r##op, addr);				\
> +			if (tlbi_user)					\
> +				__tlbi_user(r##op, addr);		\
> +			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT; \
> +			pages -= __TLBI_RANGE_PAGES(num, scale);	\
> +		}							\
> +		scale++;						\
> +	}								\
> +} while (0)
> +
>   static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   				     unsigned long start, unsigned long end,
>   				     unsigned long stride, bool last_level,
>   				     int tlb_level)
>   {
> -	int num = 0;
> -	int scale = 0;
> -	unsigned long asid, addr, pages;
> +	unsigned long asid, pages;
>   
>   	start = round_down(start, stride);
>   	end = round_up(end, stride);
> @@ -307,56 +355,11 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>   	dsb(ishst);
>   	asid = ASID(vma->vm_mm);
>   
> -	/*
> -	 * When the CPU does not support TLB range operations, flush the TLB
> -	 * entries one by one at the granularity of 'stride'. If the TLB
> -	 * range ops are supported, then:
> -	 *
> -	 * 1. If 'pages' is odd, flush the first page through non-range
> -	 *    operations;
> -	 *
> -	 * 2. For remaining pages: the minimum range granularity is decided
> -	 *    by 'scale', so multiple range TLBI operations may be required.
> -	 *    Start from scale = 0, flush the corresponding number of pages
> -	 *    ((num+1)*2^(5*scale+1) starting from 'addr'), then increase it
> -	 *    until no pages left.
> -	 *
> -	 * Note that certain ranges can be represented by either num = 31 and
> -	 * scale or num = 0 and scale + 1. The loop below favours the latter
> -	 * since num is limited to 30 by the __TLBI_RANGE_NUM() macro.
> -	 */
> -	while (pages > 0) {
> -		if (!system_supports_tlb_range() ||
> -		    pages % 2 == 1) {
> -			addr = __TLBI_VADDR(start, asid);
> -			if (last_level) {
> -				__tlbi_level(vale1is, addr, tlb_level);
> -				__tlbi_user_level(vale1is, addr, tlb_level);
> -			} else {
> -				__tlbi_level(vae1is, addr, tlb_level);
> -				__tlbi_user_level(vae1is, addr, tlb_level);
> -			}
> -			start += stride;
> -			pages -= stride >> PAGE_SHIFT;
> -			continue;
> -		}
> -
> -		num = __TLBI_RANGE_NUM(pages, scale);
> -		if (num >= 0) {
> -			addr = __TLBI_VADDR_RANGE(start, asid, scale,
> -						  num, tlb_level);
> -			if (last_level) {
> -				__tlbi(rvale1is, addr);
> -				__tlbi_user(rvale1is, addr);
> -			} else {
> -				__tlbi(rvae1is, addr);
> -				__tlbi_user(rvae1is, addr);
> -			}
> -			start += __TLBI_RANGE_PAGES(num, scale) << PAGE_SHIFT;
> -			pages -= __TLBI_RANGE_PAGES(num, scale);
> -		}
> -		scale++;
> -	}
> +	if (last_level)
> +		__flush_tlb_range_op(vale1is, start, pages, stride, asid, tlb_level, true);
> +	else
> +		__flush_tlb_range_op(vae1is, start, pages, stride, asid, tlb_level, true);
> +
>   	dsb(ish);
>   }
>   

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
