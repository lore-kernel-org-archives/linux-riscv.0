Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CFAEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoJxI9k+/tdUNVUqXV5z8+yPGs3E/yoztiYS/b3d4bk=; b=UZxkpJKnHFPdnc
	i0w9y1d9FbmynXftZBtFXwN5qJR3sr9u88QFEPfiuObYQeLw4IsBwBFL8E4c0RwIT0jkEXalZNPhO
	FsISxI12XQiEwYxjMdKsrNc9Zmwz02enbySjquE8JaLp4I1HO4NCe5EH755RJMn67hHoQiOxab4nv
	TgyUykkk8L16dAwTIYGry9EfHxxVAgMZ0X14wTZN+yw5M8qK6MGUzEqeSxm26JtNIiTHndZtg3U8X
	95wRsKyg330NJXMeewytVwlKforq1iTlGUvUlCNC8hzxdwZPtY8w4fQunqb6zxYgFAdUOQKT2d4YH
	c7VkO706G60y39Vs4l4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Yv-005gEz-03;
	Wed, 19 Jul 2023 06:21:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Yt-005gE2-1o
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IQV8O6VkoZMK+uzlvNWBITxOlq3iVkMNabGAT3CedZ4=; b=lV4EXzlwzlsaBvM+aYWfhysxYN
	tlXHN1rPFzIHE3KoLU/8BXrE++pxqJLBU4iPZ/l7CBK3a/Ily8UMjaWZHr/sNWFS/b7FaQEG3/j8k
	EMA9T8TArBZtNoTsAd75woz6Cd2Da3o3HSRz6zlB1cbKZcs2R/ewatTgXbwkbGdV9ZsLjABmSs+0z
	ciklp3PSUAkIM6h6QodD/gGd+C+yuilProErtLwadQIQBtuL+DlFZ55R+48nGwMw30aqZjwl7puHv
	1KTNmVc4Qvc/kwhaurVwC47bWyHqIiYPPJmHSGYF690MYG7jeWX9XhemLNu8mYR8zqHulobvbjFxq
	LM673jDg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfTp-00BGi1-0S
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 07:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689666640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQV8O6VkoZMK+uzlvNWBITxOlq3iVkMNabGAT3CedZ4=;
	b=ae8z2YoMLuk9Yo9dhNeMlS9IzML7pU7nsGML6tLhl9oqoL5VpVm6WZUV3BvDA/5FhNLbrE
	4gmGUdUPMaj/FSp33L0NHC0EcDeUVwxuqjBs7XNQutck9P0E5SWmdSq91GlKWDUsAX6mWT
	SAl3vkMJHK1FIDfrTDC0j1GgkzxQj/Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689666643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IQV8O6VkoZMK+uzlvNWBITxOlq3iVkMNabGAT3CedZ4=;
	b=aAPlebrcak80M/JHgC934kDx0deWecyLvziQ1fXHgnw8JpWfAF21UDPTtBUU06HmJf6lDF
	960olEOpOHAGCh/HelWc8cwD31ScmxIML6yySd+yaV3PdKjSDhPhTvz7IbrmI9VaqIWedh
	4e2hZb1SBdCUkYYperzD2WoTNHnoiRU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-_42qBIsBNW-AFE4Yt1thuQ-1; Tue, 18 Jul 2023 03:50:38 -0400
X-MC-Unique: _42qBIsBNW-AFE4Yt1thuQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1b8a57b4012so5812555ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 00:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689666637; x=1692258637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQV8O6VkoZMK+uzlvNWBITxOlq3iVkMNabGAT3CedZ4=;
        b=WIYVilFPzMt164XdUhcUPKsJooLNUWL0fpsTXeL0Hw97/Ora7UDwAd8y78aaBx/9xE
         5Nq1kr3Fw5DNLYYkHofK3sr8+f3BLy0hlxuQTfp1lmix8TIDgKAJc6wuOwqk1oNCxfwf
         OXZEaBzZ3X6U38ZmEinJmglFbRmUaGFX10UXemKPS8PtzyeBmYofnUhzYU9WmdAsOxuO
         3T0YNdzT9dugx/w2BySayrdumMKRxVa6Nmll+RfS5t2Ey1+ll1inv44LbOaNeN/uLBsy
         4uDhQ2I4gnwo/ec+CKwobotuZ0DDrDiQFKywf4K6yL1qgwO1KiKdc//8ep6vVaOB/ak6
         laVg==
X-Gm-Message-State: ABy/qLZ3WTME4OjzjJlDjqOOoWDFRsIlI9FHd+m7stAahuCY5+VXP9ik
	wPPR5WIPgmu2Jxb5aW2/m/cKlZzMKvAyltSsr5igxvtaiTZEX1sVVA2E+2dW1X8QT9t3KjrkznW
	nGxPQgGWEK8BmETqzqPwf2Dg/w3wT
X-Received: by 2002:a05:6a20:a111:b0:133:6e3d:728a with SMTP id q17-20020a056a20a11100b001336e3d728amr11334201pzk.6.1689666637195;
        Tue, 18 Jul 2023 00:50:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFD2KNTmEnZo1x3FiDeADMJZauRC0v1yUa82OuIn2vMpvvXR2PsgNf3c6C22aGrV8c2mvw/Zg==
X-Received: by 2002:a05:6a20:a111:b0:133:6e3d:728a with SMTP id q17-20020a056a20a11100b001336e3d728amr11334171pzk.6.1689666636842;
        Tue, 18 Jul 2023 00:50:36 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id x53-20020a056a000bf500b00684ca1b45b9sm973422pfu.149.2023.07.18.00.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 00:50:36 -0700 (PDT)
Message-ID: <0b2b367e-30c7-672e-f249-e4100c4dff5f@redhat.com>
Date: Tue, 18 Jul 2023 15:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 06/11] KVM: arm64: Implement
 __kvm_tlb_flush_vmid_range()
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
 <20230715005405.3689586-7-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-7-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_085045_850479_71E5297A 
X-CRM114-Status: GOOD (  20.50  )
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

Hi Raghavendra,

On 7/15/23 08:54, Raghavendra Rao Ananta wrote:
> Define  __kvm_tlb_flush_vmid_range() (for VHE and nVHE)
> to flush a range of stage-2 page-tables using IPA in one go.
> If the system supports FEAT_TLBIRANGE, the following patches
> would conviniently replace global TLBI such as vmalls12e1is
> in the map, unmap, and dirty-logging paths with ripas2e1is
> instead.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_asm.h   |  3 +++
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>   arch/arm64/kvm/hyp/nvhe/tlb.c      | 30 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hyp/vhe/tlb.c       | 23 +++++++++++++++++++++++
>   4 files changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 7d170aaa2db4..2c27cb8cf442 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>   	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_read_vmcr,
> @@ -229,6 +230,8 @@ extern void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu, phys_addr_t ipa,
>   extern void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
>   					 phys_addr_t ipa,
>   					 int level);
> +extern void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +					phys_addr_t start, unsigned long pages);
>   extern void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu);
>   
>   extern void __kvm_timer_set_cntvoff(u64 cntvoff);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index a169c619db60..857d9bc04fd4 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -135,6 +135,16 @@ static void handle___kvm_tlb_flush_vmid_ipa_nsh(struct kvm_cpu_context *host_ctx
>   	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va(mmu), ipa, level);
>   }
>   
> +static void
> +handle___kvm_tlb_flush_vmid_range(struct kvm_cpu_context *host_ctxt)
> +{
> +	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> +	DECLARE_REG(phys_addr_t, start, host_ctxt, 2);
> +	DECLARE_REG(unsigned long, pages, host_ctxt, 3);
> +
> +	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
> +}
> +
>   static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
>   {
>   	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> @@ -327,6 +337,7 @@ static const hcall_t host_hcall[] = {
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa_nsh),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid),
> +	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
>   	HANDLE_FUNC(__kvm_flush_cpu_context),
>   	HANDLE_FUNC(__kvm_timer_set_cntvoff),
>   	HANDLE_FUNC(__vgic_v3_read_vmcr),
> diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
> index b9991bbd8e3f..09347111c2cd 100644
> --- a/arch/arm64/kvm/hyp/nvhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
> @@ -182,6 +182,36 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
>   	__tlb_switch_to_host(&cxt);
>   }
>   
> +void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t start, unsigned long pages)
> +{
> +	struct tlb_inv_context cxt;
> +	unsigned long stride;
> +
> +	/*
> +	 * Since the range of addresses may not be mapped at
> +	 * the same level, assume the worst case as PAGE_SIZE
> +	 */
> +	stride = PAGE_SIZE;
> +	start = round_down(start, stride);
> +
> +	/* Switch to requested VMID */
> +	__tlb_switch_to_guest(mmu, &cxt, false);
> +
> +	__flush_tlb_range_op(ipas2e1is, start, pages, stride, 0, 0, false);
> +
> +	dsb(ish);
> +	__tlbi(vmalle1is);
> +	dsb(ish);
> +	isb();
> +
> +	/* See the comment in __kvm_tlb_flush_vmid_ipa() */
> +	if (icache_is_vpipt())
> +		icache_inval_all_pou();
> +
> +	__tlb_switch_to_host(&cxt);
> +}
> +
>   void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
>   {
>   	struct tlb_inv_context cxt;
> diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
> index e69da550cdc5..4ed8a1786812 100644
> --- a/arch/arm64/kvm/hyp/vhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/vhe/tlb.c
> @@ -138,6 +138,29 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
>   	dsb(nsh);
>   	__tlbi(vmalle1);
>   	dsb(nsh);
> +
> +	__tlb_switch_to_host(&cxt);
> +}
> +
> +void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +				phys_addr_t start, unsigned long pages)
> +{
> +	struct tlb_inv_context cxt;
> +	unsigned long stride;
> +
> +	/*
> +	 * Since the range of addresses may not be mapped at
> +	 * the same level, assume the worst case as PAGE_SIZE
> +	 */
> +	stride = PAGE_SIZE;
> +	start = round_down(start, stride);
> +

Is there lack of switch VMID to guest?
	__tlb_switch_to_guest(mmu, &cxt, false);

Thanks,
Shaoqin

> +	dsb(ishst);
> +	__flush_tlb_range_op(ipas2e1is, start, pages, stride, 0, 0, false);
> +
> +	dsb(ish);
> +	__tlbi(vmalle1is);
> +	dsb(ish);
>   	isb();
>   
>   	__tlb_switch_to_host(&cxt);

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
