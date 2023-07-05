Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E7BEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 00:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyhT6BxjNtOfXp7fqqeQr3J1aO2pvf8TnYg/j5VYg4E=; b=M5KoKtbrdOa+bT
	5ml7CuGcjtSyixwGLt6L8svmrX9hXOOyu9kwL8gVS6lL1vLkS84FoFeyZo+z1Ukva3pSu//euGUrx
	NQ030cfHxIqCiCP1N3+MRi+OsZ15K018dnzBZMH/GOPGvNiLp5ZuLJVY9vqwoqbEeOuIDfwt5hljW
	xia33vUphASHQZw+dCL60WElEmqj42AfK12GD8FRqVKaJs6xbGa9dEG9V/nBCfAxE9BMTPQp4ksDZ
	t787aAyEks7fy3O7DDHsotvHKMdBZVHFd+5RJ/WiAhj3eK4MLwFO/XMqB5N9wvZKdw7gusiPRKpsC
	QYKZ6SJVqAPMx6Tsv5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqC2-00ERga-2b;
	Wed, 05 Jul 2023 00:16:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqC0-00ERfc-0v
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 00:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688516183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SkAZyyid+TuVBgM2gukzJung09m0x/Qh1dXoAlys9U8=;
	b=iot5C22wz8TWVPAKolCOj87pRD8NOgpqrbf08X9x45wKZRZTQk1PChN+GmSWR7ymM0MnVN
	izCqFfJDOczz6hwI6VIzLkf32QY6CXA52g92Gbi5dK1MJKqEtvYDCjoPgAT+1tR2MDJ4q+
	chzCZLU1Qfhb9PBBnb1jYCtj71+87QY=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-CYa1QOebOSG6Wsp6465m7Q-1; Tue, 04 Jul 2023 20:16:19 -0400
X-MC-Unique: CYa1QOebOSG6Wsp6465m7Q-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1b817cda09bso57804935ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 17:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688516178; x=1691108178;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SkAZyyid+TuVBgM2gukzJung09m0x/Qh1dXoAlys9U8=;
        b=KrQLc9nYWd3PiLQxE8+4plOavjOnQitLxRA0KGokaj+l6TThG9fZ2hW7gAgmL45Cll
         Bet8GP14PFVqT8l4O4lXMfIF0eQF4/cR1070uaXgotmfyo4lsY3LD2kHkVtwPmst8XAR
         U3vqubuBhRwsQCKp2cUmD7C8ToUi1sGUoOZFj4hGoa1Xz/FRvLvEoWZGnzsYcznju/NR
         XxD1zysEsQn8kLJDwcMP0GBbP4gtGH/OjXc8Jf6RQ+47iOPgwAtv1wT5VwV1F4xIZODS
         T5NRozxHQuhEZMuXP59fhDy/EoJO/75ocH2HA2yef1b+9C65AWWdC9OcmXYXlkp/j2Xb
         Qv4w==
X-Gm-Message-State: ABy/qLZI3pJmiDqR2WxzDLJmXi8NHUn/6AN8aEphgISsNfzI9Flh52hS
	F4rtuYyX/PGIIT62VNOCcNC0fClpg4wfs5MxLZ1f0g51RSkSutUglgOAIorZOMU6zqCWhyBsvFI
	7m7qn8PiVTs1UclrdTkXkLu4MVDol
X-Received: by 2002:a17:902:c246:b0:1b2:4df5:c00e with SMTP id 6-20020a170902c24600b001b24df5c00emr8586344plg.35.1688516178352;
        Tue, 04 Jul 2023 17:16:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxsbyRmK1tUjQahKVu906wMoMLPOgJpr3TZVMF26AFyBgnJ9Dxug0OgWJAOZMZgIu565qNEA==
X-Received: by 2002:a17:902:c246:b0:1b2:4df5:c00e with SMTP id 6-20020a170902c24600b001b24df5c00emr8586333plg.35.1688516178049;
        Tue, 04 Jul 2023 17:16:18 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e80f00b001b876d5b23esm7537227plg.144.2023.07.04.17.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:16:17 -0700 (PDT)
Message-ID: <ca6146e0-2f76-c72e-ce8a-11bf9bd3f353@redhat.com>
Date: Wed, 5 Jul 2023 10:16:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 06/11] KVM: arm64: Implement
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-7-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-7-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_171624_395470_32291524 
X-CRM114-Status: GOOD (  19.32  )
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

On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> Define  __kvm_tlb_flush_vmid_range() (for VHE and nVHE)
> to flush a range of stage-2 page-tables using IPA in one go.
> If the system supports FEAT_TLBIRANGE, the following patches
> would conviniently replace global TLBI such as vmalls12e1is
         ^^^^^^^^^^^^
         conveniently
> in the map, unmap, and dirty-logging paths with ripas2e1is
> instead.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/include/asm/kvm_asm.h   |  3 +++
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>   arch/arm64/kvm/hyp/nvhe/tlb.c      | 30 ++++++++++++++++++++++++++++++
>   arch/arm64/kvm/hyp/vhe/tlb.c       | 28 ++++++++++++++++++++++++++++
>   4 files changed, 72 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 43c3bc0f9544d..60ed0880cc9d6 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -69,6 +69,7 @@ enum __kvm_host_smccc_func {
>   	__KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
>   	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>   	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>   	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>   	__KVM_HOST_SMCCC_FUNC___vgic_v3_read_vmcr,
> @@ -225,6 +226,8 @@ extern void __kvm_flush_vm_context(void);
>   extern void __kvm_flush_cpu_context(struct kvm_s2_mmu *mmu);
>   extern void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu, phys_addr_t ipa,
>   				     int level);
> +extern void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
> +					phys_addr_t start, unsigned long pages);
>   extern void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu);
>   
>   extern void __kvm_timer_set_cntvoff(u64 cntvoff);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 728e01d4536b0..a19a9299c8362 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -125,6 +125,16 @@ static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *host_ctxt)
>   	__kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
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
> @@ -316,6 +326,7 @@ static const hcall_t host_hcall[] = {
>   	HANDLE_FUNC(__kvm_flush_vm_context),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
>   	HANDLE_FUNC(__kvm_tlb_flush_vmid),
> +	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
>   	HANDLE_FUNC(__kvm_flush_cpu_context),
>   	HANDLE_FUNC(__kvm_timer_set_cntvoff),
>   	HANDLE_FUNC(__vgic_v3_read_vmcr),
> diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
> index 978179133f4b9..213b11952f641 100644
> --- a/arch/arm64/kvm/hyp/nvhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
> @@ -130,6 +130,36 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
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
> +	/* See the comment below in __kvm_tlb_flush_vmid_ipa() */
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
> index 24cef9b87f9e9..3ca3d38b7eb23 100644
> --- a/arch/arm64/kvm/hyp/vhe/tlb.c
> +++ b/arch/arm64/kvm/hyp/vhe/tlb.c
> @@ -111,6 +111,34 @@ void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu,
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
> +	dsb(ishst);
> +
> +	/* Switch to requested VMID */
> +	__tlb_switch_to_guest(mmu, &cxt);
> +
> +	__flush_tlb_range_op(ipas2e1is, start, pages, stride, 0, 0, false);
> +
> +	dsb(ish);
> +	__tlbi(vmalle1is);
> +	dsb(ish);
> +	isb();
> +
> +	__tlb_switch_to_host(&cxt);
> +}
> +
>   void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
>   {
>   	struct tlb_inv_context cxt;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
