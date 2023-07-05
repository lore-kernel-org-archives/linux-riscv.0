Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1605EEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bH1fDk8JU0+Sxb/+S7d9hEqTwIGzD+PWeBLeosoen8=; b=NennhcpJT3bRdp
	l7zjX0NVxLoBNsEDb8YuQmf+gt8aQOIMEeJ4ezb48e29mB7+oOD3D0B4bFlSZpC+ad4cNu5uw12XV
	Bx/tzTG+Y/XfV+CsDK+sBT50YuYAaSfB9NElc90aseM+1Q6oubkZ9r3fwNoZnzAaZ7058YR+0uRJL
	Xr8/dkAy7w51Ors98s6XYlcLjcyWG84l7MHNy4lLugpjVzsiSS/ioAXnxYFDULZM/Eb4Mqye/TOAH
	j91fzLHra/CCUkRBgA/umg6gqTS6Zuz/mHDjN2XWQpV17rPNOeXlMldQj0eYwOONL2aMheMLUlBMy
	1UOmmW4eu5qgpKMQPCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqk6-00EUUh-04;
	Wed, 05 Jul 2023 00:51:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGqk0-00EUTC-1D
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 00:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688518290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05Y7FRqpionSiuOM6vbmN3tWEYWnCWQeWHLoVh2gOCU=;
	b=ff31dfAYVERqJhJ7S+5eF6w3+Q65AET1yMIV6LQVZsOq7ijAIBSdwj1wJaia537gNQQDpm
	tVq+ALb0JCnhdxBzwDNtaZptc6gbOJ+65epLmoqsMW9GgrrIv0pleOv2AYc2YjgE+kSlb2
	Et5eZevWYcTMNLW9VTcrp3pIxUxFBHI=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-8sM9tHs_M2WQDXfP7tjxig-1; Tue, 04 Jul 2023 20:51:29 -0400
X-MC-Unique: 8sM9tHs_M2WQDXfP7tjxig-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-576d63dfc1dso66346447b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688518289; x=1691110289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=05Y7FRqpionSiuOM6vbmN3tWEYWnCWQeWHLoVh2gOCU=;
        b=fXNd7neHGJoRhkFsvV/Ujtkl573RH96g9HcB+oBQJme9xmUQByTWQRBtT2oJ44m8qf
         mvh4xQo7bpB+lEngYeShUvviJm+5zh2Yf4oWuz1a48LS6cIWCJGByARqOicBnMW1xjo4
         1Vi6LG48pBxo5NrKe80pPxr+yyPLu5umyYQMyujQPp75iyoDlJko+ZHjNsS+kfPyPdDJ
         jV5cF24wyDnz8gqjd5CLYxLlWGVH06ljuDDThIcOQhhdVoYw03SQPttMDl2pIYqxr6SA
         MUMWd0OeJkpIMgeQeMXZRjVAx64fAA0dvpxB+B3KSukEQhGqSXMIRm/c757c/jVtbRBq
         39qg==
X-Gm-Message-State: ABy/qLZpCVjUasyaq+Z75c4DMU8hLGccoRW1ZYigu3auEhrUdOLGxukO
	sh4cKPxXz3NPCOZu/ANqUICLDh2tYRDekhiO/75cx1dCFk9NzsHwPednevYtssF3VGH//hNR5lo
	LOJWKzl+YxR3G0Zcc0P8pdlCc4lj3
X-Received: by 2002:a81:6643:0:b0:573:592a:6f7e with SMTP id a64-20020a816643000000b00573592a6f7emr15236902ywc.19.1688518289390;
        Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGNQHLeMCWSeIz0qJufd+RXKyUWMQNzzlL6WDmNr44iY2x5LiPzRok2Cx6uzmegN+Hqo8Q60A==
X-Received: by 2002:a81:6643:0:b0:573:592a:6f7e with SMTP id a64-20020a816643000000b00573592a6f7emr15236876ywc.19.1688518289160;
        Tue, 04 Jul 2023 17:51:29 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id j25-20020aa78dd9000000b006687b4f2044sm16074713pfr.164.2023.07.04.17.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 17:51:28 -0700 (PDT)
Message-ID: <fa99d4ea-7390-906e-b691-9fa838df2788@redhat.com>
Date: Wed, 5 Jul 2023 10:51:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 10/11] KVM: arm64: Invalidate the table entries
 upon a range
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
 <20230621175002.2832640-11-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-11-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_175132_489417_DE70F929 
X-CRM114-Status: GOOD (  16.06  )
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
> ---
>   arch/arm64/kvm/hyp/pgtable.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index df8ac14d9d3d4..50ef7623c54db 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -766,7 +766,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
>   	 * value (if any).
>   	 */
>   	if (kvm_pte_table(ctx->old, ctx->level))
> -		kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
> +		kvm_tlb_flush_vmid_range(mmu, ctx->addr,
> +					kvm_granule_size(ctx->level));
>   	else if (kvm_pte_valid(ctx->old))
>   		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu, ctx->addr, ctx->level);
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
