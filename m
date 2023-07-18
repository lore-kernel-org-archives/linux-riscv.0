Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86236C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dU+fbrdOqX0oEIMaVYj/K4PGyrtBvA6VZ1PvYQcpDI=; b=wy4ddhlXuspOd3
	ejUHn4ku0HMnZVdY5bkQAwrGrvEa4dBHjJraPMIvyjZ4beP4HSXRPRPfBb0T2FtgBt1Wj5b2Z9gxs
	KJ2QGWOTwU/HSkBAu5mkBC5rNatN+RhK/RszRKnh8CDRduV6uQwsEeataAhln4D90y9Ggyn87qgLW
	T7Xyo1LV00RB1J6puZ8ueCvf7ZfAimAEckHYmdkx9SxEv4XzpBRUKMDXAMCY2/jSQjK4On1Hgb6Jb
	wfqiELOexxixNA0tqwhYvB9qo3ykjNbqAqG5GU0Yj91is40r4rT2uF6Ufz7QgUuyXa6cmNAuhx6Fe
	+B86V67CVt9cc+ts/h5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2GC-006FB8-10;
	Wed, 19 Jul 2023 08:10:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2GA-006F9m-16
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 08:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FMvWdQ8jDtgrg4TmzvreNToMG0I25+6piVG21WnWmLI=; b=HdcUbaEVQ5npHtQSoeWbJ7NtZX
	Mbs9FdmAVG6PMDh6nXoR4SUrG1lzugD46an9DJwACLrJrjc0KllG8G06FHRCUpDxuVZtNG0xEBaE3
	8a+rzLDavinUw/g1nL4e1bWTuMs7R587iPhCd0jsp/lmK5w/OMbvKm5viEXLRRSRz3vBML1qy/gIB
	BoYFvvLybWYF1L3Mm7EmercCjdGAnbBwXZzLGGLWEDMNPp0K9MRoHyaGbMueBWL3mEH89aEg/AXiO
	Bou8KpvFAAdPiKZ80T2JEA5MLzNfLUYWHEPh8Oi1h+FwaYMlZo44006jMbhCZlslwuiGo6cov7cFY
	k6Wb0OAA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLihv-00BSff-33
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 11:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689679033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMvWdQ8jDtgrg4TmzvreNToMG0I25+6piVG21WnWmLI=;
	b=g3T1jU00h51yKRzlHF+nfa4bKMUt8c9XS/Z2umtjf+4ia/S7yR1nQUti9Zm3022UDEG4V5
	m4dI9/+Rya/PzODfY4mSlexlRFvALFIG5wgLUAAY69BQZVzcn6RcrmvsGfRVUTIQOh6KNt
	ULik3G+J45Zm0j/yTa+P1hsx2jSkZPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689679050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMvWdQ8jDtgrg4TmzvreNToMG0I25+6piVG21WnWmLI=;
	b=L9xr4MYOodcyu538OZ6qkkzAOUU0NKjcPfmnIKLbGjKq6p3I2z9aZxlOq3GWTFFBN/Hyax
	9XVeXeBqy4M33guNX5ddAkLXX9KPVr/nLzXo2LPDYdlu+CHc5MVVBdkkqBBN6Vo9AZ71ay
	e/2N22nx2pxciN+njQqG+mN+vdWeuk8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-Maf6cOCzMBKvrULsZ1OPKA-1; Tue, 18 Jul 2023 07:17:09 -0400
X-MC-Unique: Maf6cOCzMBKvrULsZ1OPKA-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-53fe625f145so1504221a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 04:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689679029; x=1690283829;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMvWdQ8jDtgrg4TmzvreNToMG0I25+6piVG21WnWmLI=;
        b=V+FFraJdIzZyRlPuUHqRC93xXmuopToGZ37TvYa55YtSJZ9AFizvd+MCFq862M3b7S
         RHWax4M3V70AtIAQX4o274z+ccaK/E624MjqeTwL0yXgCJDYOBCK/HrpO/NEmqV2KDRV
         9M/Yr/YZM3beJkKT4jVUHddii3WPk1gMpM9snU+/y3GVGRG3mJgy+QjxLeDAxvioKXpb
         l6ry1L2PteasJCZbTwYayF/XpCv+eMMHXd+hA1b/PzSH6DKlNYvsq1SWYCKqXO20CSqI
         9dgANm2TFKkJR88KxWpwB9WWQI0mojlPLYzu5R5yl4nn7PKwB6HzcdXA1rBm6CKIedrm
         Yzwg==
X-Gm-Message-State: ABy/qLYcu99H8Go6SA7pLuMIz9JYgXdsm9ck6IZ0wJn/xP/qcuNhg16P
	nQnr665nTsXSNnd4cg59EPF9O82QLy+P6pk0WUjyJjsNXLXW5z9IeNveXKZQYYKtGiMXJ+X11SI
	qTmUW+9FHGiHFRn5ITHQ9JY6dJvP6
X-Received: by 2002:a17:903:230b:b0:1b8:b0c4:2e3d with SMTP id d11-20020a170903230b00b001b8b0c42e3dmr11266961plh.4.1689679028952;
        Tue, 18 Jul 2023 04:17:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH5kvIm7BO6HgOwtAhzPPJqnxdHrdyX/BVtSHl74wvgT6sMhv7vpU6zAkVVa8mgoPsZbPZuzQ==
X-Received: by 2002:a17:903:230b:b0:1b8:b0c4:2e3d with SMTP id d11-20020a170903230b00b001b8b0c42e3dmr11266944plh.4.1689679028672;
        Tue, 18 Jul 2023 04:17:08 -0700 (PDT)
Received: from [10.72.112.40] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902eb1200b001a80ad9c599sm1576337plb.294.2023.07.18.04.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:17:08 -0700 (PDT)
Message-ID: <4f02d91a-acd8-afa5-03b0-fd8ec29328dd@redhat.com>
Date: Tue, 18 Jul 2023 19:17:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 09/11] KVM: arm64: Flush only the memslot after
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-10-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-10-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_121732_328427_17A81C9D 
X-CRM114-Status: GOOD (  14.10  )
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
> After write-protecting the region, currently KVM invalidates
> the entire TLB entries using kvm_flush_remote_tlbs(). Instead,
> scope the invalidation only to the targeted memslot. If
> supported, the architecture would use the range-based TLBI
> instructions to flush the memslot or else fallback to flushing
> all of the TLBs.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 387f2215fde7..985f605e2abc 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1082,7 +1082,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
>   	write_lock(&kvm->mmu_lock);
>   	stage2_wp_range(&kvm->arch.mmu, start, end);
>   	write_unlock(&kvm->mmu_lock);
> -	kvm_flush_remote_tlbs(kvm);
> +	kvm_flush_remote_tlbs_memslot(kvm, memslot);
>   }
>   
>   /**

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
