Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56DAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7E160F9D
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 14:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E7E160F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQXwDhctfGN3PfeznRRKoDoocQ32H0+KdU9oN+kzjyM=; b=u1okfN9M6QF6Jw
	AGveixoRyzTHmkYCuonLXLY9g9OwTJiuMORKduTeDm5+nIY5S/1LG5lf++KYZJDFeMd269JoHeAMV
	CllbBqGmLtLhyq+Rnq2z8DkgrZcRycdaw/3TUYezbOl6DNscO4p905/z9kPXtRMrmt8axxF9cbiwC
	jdMVeKk8hHxaZt4nYW8smYjyVErptuMo++Ko5qPqlZqO3fxolAaERn9bN+eU9xyW8/P0rvVBuW9qU
	8DQyNrxaXRMY3d0enIWdXXJH2E7FZzxfSX4karUYAENpoCHVZDMlFnN/HoiRwcqgs2Hdv0qkAZxiy
	yQEuLma08yaO4ImtEPEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf0cm-00Gd4J-8g; Mon, 25 Oct 2021 14:06:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf0ci-00Gd20-Es
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 14:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FblMqi74l2aNQDmIbjX/cagfl890xy4Kf5Rp2sw8Ik4=;
 b=iybnwA0ZadanTHPHXV9Sbz8JrJm508VE747MwvM0WjR6zQ0H7YDqd8ZruBnkQ8FFxyEkLe
 EgxdHniFGcd9Kn9JX9OlnRN8CIce0gmXIzCQlA1kEkpfoB6YZQAZlGvUeoCF65178Zytrj
 D7Zwzzcgb/nbyViN/FOhKcEzj6+6j48=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-iJOw8dIcPxOsSspDfiEUhw-1; Mon, 25 Oct 2021 10:06:46 -0400
X-MC-Unique: iJOw8dIcPxOsSspDfiEUhw-1
Received: by mail-ed1-f70.google.com with SMTP id
 w7-20020a056402268700b003dd46823a18so4137043edd.18
 for <linux-riscv@lists.infradead.org>; Mon, 25 Oct 2021 07:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FblMqi74l2aNQDmIbjX/cagfl890xy4Kf5Rp2sw8Ik4=;
 b=4tc7SFLiJyS97mwRqF2pdgqaytK3pzTDRwHfq3hiUq83J+NzSGCBss0ip7a/KhSuKI
 RqApU7B2WAtnPTtdA4tPsy46kySYUlgfWPRwyOOrtJO7XX2dYRNkxN5VeQTLKF3HvTno
 DSiAWGLZ4ihz9zmwqf62RJcjr91DrwZi44RdCmf3paMXIYOw/XnOgxfLvh35FXhxtpkD
 ENAEUjTVQQ7DC5AAjsCE/Pu5cE7q0IbHkoqSpipgcpBWckByTujnamoAR8JNqgG+SbNd
 yMbNefYsiRZ8JVTxNM1VNaR9aZ0XfxJeOJRx1l4LqCMFYJxj4at9MJJvU+MBwvQ6uxlH
 /K5A==
X-Gm-Message-State: AOAM5328lNRl+2I3QsgsogFAdzcHgna5TK56zDqaL4aXmOj65OnFrbXe
 xyY3Vu/MrV8LrmbmpaO3iSmANSTZAPt0mQioiaXUef+jjCV45IRjqIhDi4Dc51nSflfJvCCEgyf
 7lNS0/sIT9dabDnLo/YKw40iyHhHR
X-Received: by 2002:a50:fb02:: with SMTP id d2mr11770107edq.100.1635170804930; 
 Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ2X8dAbxM+1kv2smymvR7I3dtS7qD9GGOcFC9wjjp+md9MuSuvCzqRB05il5WqZEpIp8nlw==
X-Received: by 2002:a50:fb02:: with SMTP id d2mr11770084edq.100.1635170804745; 
 Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o3sm7472237eju.123.2021.10.25.07.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 07:06:44 -0700 (PDT)
Message-ID: <591073c1-b520-21de-8573-ddb83950e9f1@redhat.com>
Date: Mon, 25 Oct 2021 16:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 19/43] KVM: Add helpers to wake/query blocking vCPU
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-20-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211009021236.4122790-20-seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_070648_639387_A7056B18 
X-CRM114-Status: GOOD (  10.58  )
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

On 09/10/21 04:12, Sean Christopherson wrote:
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 7e8396f74010..addd53b6eba6 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -649,7 +649,6 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>   {
>   	struct arch_timer_cpu *timer = vcpu_timer(vcpu);
>   	struct timer_map map;
> -	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>   
>   	if (unlikely(!timer->enabled))
>   		return;
> @@ -672,7 +671,7 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>   	if (map.emul_ptimer)
>   		soft_timer_cancel(&map.emul_ptimer->hrtimer);
>   
> -	if (rcuwait_active(wait))
> +	if (kvm_vcpu_is_blocking(vcpu))
>   		kvm_timer_blocking(vcpu);
>   
>   	/*

So this trick is what you're applying to x86 too instead of using 
vmx_pre_block, I see.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
