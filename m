Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65901EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 00:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5t8BtPi4gaoabZLIULFoQPTeFCnDdv0MS5jHzyjgxU=; b=3V5x6eufMK3Gb8
	YX191l+73+qmaJ7hfruenN2/vf8Rp9fKnutWq8exTQ2cKu8rGKA5nQTkz03tnsLGMXngdisoG6Go2
	YVhGYAT0oqmJm2Fyxdm021uK1aWWtXNB2FgQevumtmYkKR3Apr5NI+9fN3ScIXv2nLNVqlKMrWFXk
	dbETfUJXPkLPDlHS2NlL/y/r9GgDbO5tvASQFz6pdY1srGQzSmIyntOpzg2sRMdPGLYSmNCDa1xmP
	BUf6lbBKQh1znq2WVonJGjED8DKgEyNfZbsI7N+WSBubtuOvLtsB41GN8wl/tPybjI6Z0jTVLc5/q
	fXf61BQzV6VM8VV6aG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqUh-00ETIM-2c;
	Wed, 05 Jul 2023 00:35:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqUf-00ETHB-1V
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 00:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688517340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9kggeUHVn+fybi/vP4cTbHO7AeLXxPNqVprkHx0Chh4=;
	b=O81tKq8fRI8p+KUS98bkZeL+2EcMSYw834SFyQqs681DLC7biTgM/aKdv09zVSncHYPypj
	0d05YEp+krPQE7WX3RCmlVn60sUrwF2IZ+dJLfDiC5WWgRRcqhySV09PK7AfLdmyj9QVK1
	4ODMTLBTUEgVU5UnGTvcrnzRi1HozLU=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-Wic5zBvlOaWcta_xrcFkPg-1; Tue, 04 Jul 2023 20:35:38 -0400
X-MC-Unique: Wic5zBvlOaWcta_xrcFkPg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-262d8993033so5936475a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 17:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688517338; x=1691109338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kggeUHVn+fybi/vP4cTbHO7AeLXxPNqVprkHx0Chh4=;
        b=Ok77djmAaV4P8p0gKQntMR8oOQOsc8u24NnGdJf7J0i0ASM9WkFTtbixl5icKLkn5v
         i40uUFqX6mhnQEtVKIb36kbVJU7PM0SaUgZDdVkJ0kZ0SS+wn3nFlgL4BTZ+cr4tMwO+
         Fz3DdRg0PTMO07PCLw5xXW3dO7+ds+Em8Xc9gT0b98OCqdRTI5m2ttJdtoF2tMgkE0No
         89QZXN/lY4xr80aQ6YxUM4Ks6rvhIo8FHpSNBXCmp8UvhwLV8llVqgXKUvoh9gOqFTDo
         pBha6/hVxY7V++RLeZnsapO9H+KxQmVsBc2q3L2oXcSLicBXWX+wSm49BnLTE3HDn4WF
         1OJg==
X-Gm-Message-State: ABy/qLbXTgSaYb6T+vdpRwuom4B20xqkMpFe+db9o8b9akewyjyjXN01
	SI2XO90dlkk2Juuq/p/n1BXBs3bNhFjuDAiFY77Hf5wWpTZkAG8VTD0JnwN902pP9PY2Xsi8w+K
	Q7wxP+F1vFPbOsCpbzUDzP1B9dXRg
X-Received: by 2002:a17:902:dac4:b0:1b8:9195:1dd8 with SMTP id q4-20020a170902dac400b001b891951dd8mr5383579plx.51.1688517337918;
        Tue, 04 Jul 2023 17:35:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG1dv3HBeoyb27A4Q9lu9hw82Tk11vqBX4veNPK7IWmCWzA4mOu6o5korMa8AFQToKad6zjdQ==
X-Received: by 2002:a17:902:dac4:b0:1b8:9195:1dd8 with SMTP id q4-20020a170902dac400b001b891951dd8mr5383559plx.51.1688517337630;
        Tue, 04 Jul 2023 17:35:37 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id ix6-20020a170902f80600b001b87f957ba5sm6601048plb.12.2023.07.04.17.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:35:37 -0700 (PDT)
Message-ID: <73a4655a-2c63-3209-1153-2fc816e8990e@redhat.com>
Date: Wed, 5 Jul 2023 10:35:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 09/11] KVM: arm64: Flush only the memslot after
 write-protect
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
 <20230621175002.2832640-10-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-10-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_173541_579560_B8E6137F 
X-CRM114-Status: GOOD (  13.28  )
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

On 6/22/23 03:50, Raghavendra Rao Ananta wrote:
> After write-protecting the region, currently KVM invalidates
> the entire TLB entries using kvm_flush_remote_tlbs(). Instead,
> scope the invalidation only to the targeted memslot. If
> supported, the architecture would use the range-based TLBI
> instructions to flush the memslot or else fallback to flushing
> all of the TLBs.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/arm64/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c3ec2141c3284..94f10e670c100 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -992,7 +992,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
>   	write_lock(&kvm->mmu_lock);
>   	stage2_wp_range(&kvm->arch.mmu, start, end);
>   	write_unlock(&kvm->mmu_lock);
> -	kvm_flush_remote_tlbs(kvm);
> +	kvm_flush_remote_tlbs_memslot(kvm, memslot);
>   }
>   
>   /**


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
