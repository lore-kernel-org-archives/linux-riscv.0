Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277FAEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 00:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXvYtNgCBxoQpFQ980cr26yERO7c0jlmDr9k3pgMmKQ=; b=debewR2aB1Yr7b
	eK/FZN25oj6OhOK1ZAJ9yiw8Y8AKbiAYRpV23lECHe+SHkffj0DJYB3D0MDOLngdsQJmBiDxlw0/8
	XXYs6TjH/HtoP9jXOhnicwcPWM/JQDOW2MdrUXYXYnIzOXOMOC0na9rIarjw+MdxJE9U3BNWzYy1Y
	hDUvM05fZkzCvaC8OySW5wytfB5lxlzx/oEokKlOh7dw6xsVr77i0AwF4nC7lclK97R+6W4rIEhzE
	CEtAvvkDGrZhi5yVgSY973XzkGV/RJsgPb4v67MygcdqeAkdDtToPIllEFoZyp7WiOm0dBQW0nnej
	EmbcJAbWgIbjKEPG5hUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqSY-00ET0r-1L;
	Wed, 05 Jul 2023 00:33:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqSV-00ESzX-1S
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 00:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688517206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sznGK6ZukwvfWp0A8i4mc61vcYJsrjsNcN47/Lw0qI8=;
	b=PXzkMPIf0yIvMAUpmJV/Ej811/yYJOFFFVllCclJD9Z1L+bf494twoGRkHMWq9nM73mwKX
	wjVl3wz96CyuAvPXVFDjNbTare6r0nayNGiwksAyFUKYyE3A7IdVOvfnrXxtA5nDlZo3dJ
	zbw0RD5pOJnJZSytbj93kPFvVVkPdxE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-2Abhw3QVNpWQg60fw-tGcw-1; Tue, 04 Jul 2023 20:33:23 -0400
X-MC-Unique: 2Abhw3QVNpWQg60fw-tGcw-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5578082558eso5912687a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 17:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688517202; x=1691109202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sznGK6ZukwvfWp0A8i4mc61vcYJsrjsNcN47/Lw0qI8=;
        b=fLWCQkTdsPGyAfRfpcZ3p72lLwlLF4aVdqo2BZIEYiH+xGRptJz5M5tSdAA4SVCf6d
         cO/AL1qh6SHbCxdFPvy13vFEuE/Xp/B9G0DedxSTho8SGbLC5L8hRZKzHGe8mJYHAYbg
         Asz7W/xld7P2WL4b5HHkh97DueOzSc2av8pR7rDZuzrlp4tY2Hv2f+EPHfjWYafWV3es
         SAj+Osh0Ld40RWSD4Vs17mw6eVos/XM/Rog8t/vyqWYthxQyAxnjqDJQl8GZ51v3A9KJ
         EmMuJIPWoh8bt2W6GuFJPfSSQXyXV2UcXRV3mmb88d9wxL6eKms73OQSQMqhz+BpGJhK
         1FuA==
X-Gm-Message-State: ABy/qLanMFmZKl/53dpS9Pu/qLosdRyKzM18OUVQBxIehVY9GZR+R94G
	d+7K0KQwFEzXQNaEqorhSPyc+/OmFcaVQt1+rbjLY7LxKaGqQU6WRezPAFG0n6ukYpm30/wgc+z
	g07yPbMp9QjeyIsBR54W+ehNcwqvy
X-Received: by 2002:a05:6a20:1601:b0:12f:4d11:5f74 with SMTP id l1-20020a056a20160100b0012f4d115f74mr2599836pzj.58.1688517202480;
        Tue, 04 Jul 2023 17:33:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFvypcLwb/KPkwH9ar4hG3nsZmNacj2rbML5ruL00tj8y35B6pCwD/DI8RaK0glisLwI/suTQ==
X-Received: by 2002:a05:6a20:1601:b0:12f:4d11:5f74 with SMTP id l1-20020a056a20160100b0012f4d115f74mr2599827pzj.58.1688517202196;
        Tue, 04 Jul 2023 17:33:22 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b001ac897026cesm17766726plh.102.2023.07.04.17.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:33:21 -0700 (PDT)
Message-ID: <6b8dd9cd-784c-b9e1-73de-6c84deba9426@redhat.com>
Date: Wed, 5 Jul 2023 10:33:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 08/11] KVM: arm64: Implement
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-9-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-9-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_173327_562774_B73BB1C6 
X-CRM114-Status: GOOD (  13.09  )
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
> Implement kvm_arch_flush_remote_tlbs_range() for arm64
> to invalidate the given range in the TLB.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/mmu.c              | 7 +++++++
>   2 files changed, 10 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 81ab41b84f436..343fb530eea9c 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1081,6 +1081,9 @@ struct kvm *kvm_arch_alloc_vm(void);
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
> index d0a0d3dca9316..c3ec2141c3284 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -92,6 +92,13 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
