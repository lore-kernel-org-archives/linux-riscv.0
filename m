Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911E6C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sRKnFFsbWyMfkVBRMroJ1oQbG8sSI9ekCLZvb9aBd0=; b=ed3bM/QeYQGeJE
	50+T26ylHQooqnB+N2lg0mURWUYyh3NfS3CckiwCvaWhGFA2ONPrP5kTJlGQR4aA2U8ewT0X0zHXU
	ezB4sc2hMsDMxrWEbv0MYHIkeBEHFGpyJfzQU2ASPD3K6R9u91pEAerHmICVIIeELp0HV87HlOxob
	cmMiPmB+68VOzXWMh4rHc4ZPExshwM19d1iqQOqixa5r0DW7j7446jqudtq/dKno3UV+oaXYDCd6/
	K1KACFTllp4QZWYkzc7ZKpJIFKmOkLTy54CRgWx4BBEw7vbam6dlc1FQip3YI2LXOre0rwAKqug+E
	TqLSgbnwUcX/nBATBSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0K1-005Xlf-21;
	Wed, 19 Jul 2023 06:06:01 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0K0-005Xki-0t
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=; b=oJHiz5aDUUsBv7GgdxbJe2kow2
	uJFVp1RJyiBMLzOzvJCaJAg9Ef+O/fec/SHTeYsAE8xSvtm6RTwqo+G6ylIeapnT/8vIMLPpqMlOp
	e6ibJWT/wzbLaKhjf/MvVUxp0KWxa8Cn487LnWDKV/uDoRR5HLSSxfgKkp6SuiK3PcLkWDWDH1/Ny
	PhtFhc7Lrnmo6UeWoO7ofezXdC4qSH9d1VUHSVSP/C97ogej5kR5GSEIgaD5CsO5ESJnUS+kRVmSw
	xd3HPFvd56lDaYMa2IiQE8wTviYX9fOXeuMq2jCqxqOYm7zUuaZ4bUR139NRnC2X82DmgL4L+dX4C
	UQwjJfZw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLiiH-00BSiD-33
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 11:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689679057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=;
	b=Na1vgKloy740OdgWskxt8P7Fosy1DDCe4VuZfVapyj54CMIewjcLhg0veSIPoibaAl/Mod
	e+ejvHFdP2PsHpbGyRPWjCbuJX/sHLZa4hgW7S8AVQfmOCdz6sAw1Ue9Nfi2OUj2jlvmum
	/7PRd9gk1acjmuHdeTHIVdBRI5RP2k0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689679073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=;
	b=go1wPAWWmlWap5uyAi639lFhxEi6OO5nik7iW3NlX/Jo9HZoQK8YE8xI0/sHgkewul5Xrv
	ZnMuDZUayWxuYHCe37NuQeSwi3x8dnvU3CoRbwnYg+GP4kuRpXin612OWS9IU/d6KD4DN2
	TV4Y7zctZ//u0+T68IpFGnYoMv88TJg=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-MjdczyanM5qao4OPC_DZrA-1; Tue, 18 Jul 2023 07:17:34 -0400
X-MC-Unique: MjdczyanM5qao4OPC_DZrA-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-553c68126f8so771629a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 04:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689679053; x=1692271053;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtPAFim1cDpcp/PLXUaQwLiMk8Vxwyxo/NiSi3JW/f0=;
        b=X0lNHI57y5pDAWe/aexa3RUm/d7RSCoopkHGepvF1gg/UCDYIeRPkGO7u34NO/33Gj
         WU3/X5wkoII8SuzRblqRXaJni+nvv6gkDqqsBonGNFc7gdOnOwH5CYU7IvQRDl34ofil
         imQq036GFCvNMMvUK8ABvxDBzI20Mx2IirPwEg3WTjIMsHpEkydTdqnByBMKazA1LMph
         pj4umunmxz8wd3hlgLoD3IV8fNH79t/ciaWFRXOpArXyfFq7SYWnrfGglC5Dq0tR4sbz
         Roe2koy844HhizDS3WNPMbH7mtXxcVFzffyk8anXHoV5AmH/BGbYi/8sVQumkL19Iqfw
         igcw==
X-Gm-Message-State: ABy/qLaJGUSor05RDAIFYW4NyvgQtIdnGb/6tPHKmFa8R7bET8jWpMgv
	P6vyMH+BuwSRDXEdYrSXbjsXUqtNr4Aci5xnVBIC/s8fAuifW5njvEfKRemvKClCWF138fTR3Qg
	5FXon853t3qQMOlhKTGOTpEyPE8cw
X-Received: by 2002:a05:6a20:3d07:b0:133:89e:bf1a with SMTP id y7-20020a056a203d0700b00133089ebf1amr12988289pzi.4.1689679053259;
        Tue, 18 Jul 2023 04:17:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlX4aGknKfPCjhtPs4zbhCwYUKXUWNkmQcI4lBrRW+0354cqKkBfpbN1eJEAJfM+P9UQWRbQ==
X-Received: by 2002:a05:6a20:3d07:b0:133:89e:bf1a with SMTP id y7-20020a056a203d0700b00133089ebf1amr12988260pzi.4.1689679052990;
        Tue, 18 Jul 2023 04:17:32 -0700 (PDT)
Received: from [10.72.112.40] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id k22-20020aa792d6000000b00682868714fdsm1369203pfa.95.2023.07.18.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:17:32 -0700 (PDT)
Message-ID: <a8a43069-ca4c-07e6-3b65-de749f295365@redhat.com>
Date: Tue, 18 Jul 2023 19:17:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 10/11] KVM: arm64: Invalidate the table entries upon a
 range
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
 <20230715005405.3689586-11-rananta@google.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20230715005405.3689586-11-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_121754_908433_271BFA0D 
X-CRM114-Status: GOOD (  16.80  )
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
> Currently, during the operations such as a hugepage collapse,
> KVM would flush the entire VM's context using 'vmalls12e1is'
> TLBI operation. Specifically, if the VM is faulting on many
> hugepages (say after dirty-logging), it creates a performance
> penalty for the guest whose pages have already been faulted
> earlier as they would have to refill their TLBs again.
> 
> Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
> If the system supports it, only the required range will be
> flushed. Else, it'll fallback to the previous mechanism.
> 
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 5d14d5d5819a..5ef098af1736 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -806,7 +806,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>   		 * evicted pte value (if any).
>   		 */
>   		if (kvm_pte_table(ctx->old, ctx->level))
> -			kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +			kvm_tlb_flush_vmid_range(mmu, ctx->addr,
> +						kvm_granule_size(ctx->level));
>   		else if (kvm_pte_valid(ctx->old))
>   			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
>   				     ctx->addr, ctx->level);

-- 
Shaoqin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
