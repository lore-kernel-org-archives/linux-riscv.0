Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD1C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xBus/lLtbvDYI+bxMiYShQ381SLFIRaOQRb6hJueUK4=; b=27F6GXxlr21jHW
	NwpwM78G6znvrS6VzuctNnNhDNIBe+fS7t6jhGxJoCHOMMznM/rT6/2XoRlo48+F7T7YZb8krfHaE
	dBnDsXtm5SU1hkWj+O8B/uUPtZHGqer/dlT6ESKYiizhwACzVTxidnOirJ5JTHkIpvgQ6fH2EhQxy
	kyXFCEeiuasDZHuTKkK8uzayQinVsXcjLsCKwbBX4vGuhF5DYwNyMbxv6yb+sRylf96NtSpfeW6Od
	tHsDfaK+CgMfS3H+V0H5luvl2tOobi51mQsCOamYtznVMHA/KizgkZChipulILBa2fWVs9rpN+F9g
	DM9QyQ4x9FdoO/rBHXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0K4-005Xn6-1Q;
	Wed, 19 Jul 2023 06:06:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0K2-005Xla-03
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BqFBTcreB9uM7bVA+oKgdwOheFXwxzAShQOYP1vaHLs=; b=ZrP2C8vyd0X1O6HPS1QAZYIteL
	BH/q6XTXoyYdybzDQX0lJlA6AKuphq1lWOnFWBEMqPQPcOWbkUqHSA1M/14waumcUpojG8Wh5asZm
	VdABAgf8TODVJIRBthifWooruoW8AUbxkMyRMEgpiX9X38q3rAuakNi82SO5FPb/u7K/nQa9SKbmq
	mELgtHfs7JvZOtjDf60AtpV0FJexKUJNWaYI0Rp5sR/xjfbxuxkaF4nTHzowjdqpUsCrB8LGX0Awd
	ChW3Msu74CqsnPjsrvNMQXHgVnPOrRJLf2gfPWk1mC5v9cZ9uRDAgVs6OmaytRnKz9OYjyI54llzt
	CJjNnEZA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLigH-00BScf-1f
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 11:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689678942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqFBTcreB9uM7bVA+oKgdwOheFXwxzAShQOYP1vaHLs=;
	b=UoJkDCTCW3UbiMxhNVm7orufGMKqQxto60k8XmQ6T3l3WIMdcoid0v25kanO0d9DeMIlR6
	P/3NaRf6S0R59TyKYGHGnpdMI+o4AABukG080M3tH08A8oh6uiJX7mhaOmMblCSIVwClRB
	Chl+DOesqjiQ8nnB5d6vsPNhmdT89Ss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689678947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqFBTcreB9uM7bVA+oKgdwOheFXwxzAShQOYP1vaHLs=;
	b=HI/5HdXfIoDqjd1zdtUIrUuM7v1LXcNO8RSskVZuiTvAwwZffe4U1T63VH1t8++vpe5bcj
	M1gC58D3/TaH3wDWR6eA8sy5dSzt1iHU8LYSFFwziv8gC/6HGcC6YHPni1JFHtUxMlqOzX
	IMJyPg8sAFizd+X8ud0zRigbKu8zMOU=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-J8xPcl4yN3ickAYc6dHlTw-1; Tue, 18 Jul 2023 07:15:40 -0400
X-MC-Unique: J8xPcl4yN3ickAYc6dHlTw-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-66d7911409dso422444b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 04:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689678940; x=1690283740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqFBTcreB9uM7bVA+oKgdwOheFXwxzAShQOYP1vaHLs=;
        b=jtA0rc1rv4TiFWHSHfv/ID9Aqi2bfDjUtWt5TwMZp4oOWcacoliQyNixfM+Q0VoarI
         Zwwu2V4FjN0xY4DrtIvrm1h9VFR9cwTfnfAK/1eVpmO5Yq9kHN1ZofLaLAUednoGdrsK
         hMBBv1o+no0+WtCphjnF2WFw1NJay3BSSYkvGInEAUrkMVt8GBdtWySapL4kz5GgbgSv
         FXydE/q2KQ88AwzP1fzOHg3xRHm+aFRzzB15L/53TOAdu1yoRaQgWzBwEcxlkGELECGI
         NSNH5y5rBa0YOyyolDwCW4JqGUdVAW6jl7jOkxFbP1FMqO7I8B7laSurpzctR9DA1cJk
         V8uA==
X-Gm-Message-State: ABy/qLY4Zy4f7+fSPtarsp/JEeyKUnuFSDh02pdwM8qwtGVmazy5fmDv
	TSKGRpGyWYcr7RxDXa/vxucZV4tD17ykgaSqCcbKgiMVIgxRWg+ZnK5tmCa0dzOI/a5hCNA3UXY
	8eIwzoUXPTHbo6h7DjJ1881PNA2p7
X-Received: by 2002:a05:6a00:2d06:b0:679:a1f1:a5f8 with SMTP id fa6-20020a056a002d0600b00679a1f1a5f8mr11345526pfb.3.1689678939736;
        Tue, 18 Jul 2023 04:15:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEpw9FbepMwI4i8WQLrfFCcRWK4bQzZOcI8bUuVzeTHVwddSiiqvjUkmkgPmHYZSjCF3HQUxg==
X-Received: by 2002:a05:6a00:2d06:b0:679:a1f1:a5f8 with SMTP id fa6-20020a056a002d0600b00679a1f1a5f8mr11345498pfb.3.1689678939458;
        Tue, 18 Jul 2023 04:15:39 -0700 (PDT)
Received: from [10.72.112.40] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id s1-20020a63af41000000b00528db73ed70sm1476638pgo.3.2023.07.18.04.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:15:39 -0700 (PDT)
Message-ID: <5b2c03a5-5887-d951-6c3d-f71b49e683fc@redhat.com>
Date: Tue, 18 Jul 2023 19:15:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 08/11] KVM: arm64: Implement
 kvm_arch_flush_remote_tlbs_range()
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
 <20230715005405.3689586-9-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-9-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_121549_848064_B97A5959 
X-CRM114-Status: GOOD (  13.60  )
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
> Implement kvm_arch_flush_remote_tlbs_range() for arm64
> to invalidate the given range in the TLB.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/mmu.c              | 7 +++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7281222f24ef..52d3ed918893 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1114,6 +1114,9 @@ struct kvm *kvm_arch_alloc_vm(void);
>   #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
> +
>   static inline bool kvm_vm_is_protected(struct kvm *kvm)
>   {
>   	return false;
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 0ac721fa27f1..387f2215fde7 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -172,6 +172,13 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
>   	return 0;
>   }
>   
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
> +{
> +	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
> +				start_gfn << PAGE_SHIFT, pages << PAGE_SHIFT);
> +	return 0;
> +}
> +
>   static bool kvm_is_device_pfn(unsigned long pfn)
>   {
>   	return !pfn_is_map_memory(pfn);

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
