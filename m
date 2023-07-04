Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98233EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 23:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Zn4JqI7vhyYYGwYsgRjjnJ0un6aSz7QPXza3dWk1QI=; b=NEADzKqJuXw/+c
	8YX/Bt7NlxnSmaq128MpCyZA5scuSiPHFvSnFrughXUP02fytJmdruxvCs+GhV+h7CWxZH5lal+Tr
	QSHQHx6aIaOmzc+fINHVCPqjn+FFtbVWfg8Pf/MvYqfhCMtPhmh/sU4YqKx+TVwYSIb8dWtgEGMyF
	E3APEPlvLD6q7ZJruM5qiFjJB/MQGae67vHHtVxBz3+s38cnW1ZzkajQc5/lG+6PqzbBZC6H22XRq
	VV5ReUgj8cl420T0jkjBq66HzlPEz/tR15NLSZOL7hvKElbP4f2gltUQ57q2H9xBy/5l3ImfYvJDY
	mttmXMkwf/YQBOTlZLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGprA-00EPuW-1z;
	Tue, 04 Jul 2023 23:54:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGpr7-00EPtI-2e
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 23:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688514888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mna+dhhTYjAdqDBDtMfl56DYIGVzwso+E96k6VKVls0=;
	b=Wa7BrcOmPI0f7tqlo51bYXjgXNXvlWrpR9Yn8RyK5lQkryG8TZAvLg5aTNJq7F5DxXQqyU
	3H5SqjMo4qtmXoPGzv3Tcjy+OdlTQyfpzDtdxcf3cJ1kXqy9GGc9rAN13pr6tJoCM0i3vm
	6PcoiigxNosn48nd48SCpoXqYBepIKs=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-yIg77b8SNQiWHIZdHAPE1w-1; Tue, 04 Jul 2023 19:54:47 -0400
X-MC-Unique: yIg77b8SNQiWHIZdHAPE1w-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-563646e0628so4617245eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 16:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688514886; x=1691106886;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mna+dhhTYjAdqDBDtMfl56DYIGVzwso+E96k6VKVls0=;
        b=Nvba2If0R+onl/EGyIVui7ekOu2ALW5W5TNfBPkXqsKqI3GdK9u0uzwcHa7aBXiDAf
         Nn07qJs87LcqR+0UsJfz8xmBOdYidPQm7xBNl+zkjrPMDu4LUtPDGn5T5ehZmdFH1Ai1
         iTXhmwgUxozPXMooayzQgEHKchCmqoCCU/s1FY+sxZIt65EDo5YKZhoNvGfFB/c02woW
         wPpd8S6KcdOQtpx3jd08+UxVVlS/S5qN/aCQyBIYR1TP0UNiOGVUXACUwH0glDZ6oF7x
         veBheE2410pc4rrNXilYI/sSbt0sCdxtPoRQ2qg+u+oMF+vceC3wVWLrAsU/y9p13ukt
         0s8A==
X-Gm-Message-State: ABy/qLbkLeZ0XBW67oAeqX2kNpTMiDEzULQbn5H0SJq/vYQh2371iF6N
	/1tq5xQUC1wawrtDSGhsh1t9L3d1hQNkq5eG3/H0jwattgA0/jeuwz5ZvFF+VK/yHte9N/rzmf5
	IIxYOBga/bpcHa0aFKGzHviAdexeU
X-Received: by 2002:a05:6808:1a17:b0:3a3:a8ce:c659 with SMTP id bk23-20020a0568081a1700b003a3a8cec659mr9277930oib.1.1688514886561;
        Tue, 04 Jul 2023 16:54:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEnYXHnAZgQaIRTnEPMZWgHY6PvyvdCKGOrf+hZuU/jzXUZFjXk6Vz5A95OweIIvkeHyw48vA==
X-Received: by 2002:a05:6808:1a17:b0:3a3:a8ce:c659 with SMTP id bk23-20020a0568081a1700b003a3a8cec659mr9277900oib.1.1688514886348;
        Tue, 04 Jul 2023 16:54:46 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902c20200b001b03a7a40e7sm12047419pll.19.2023.07.04.16.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 16:54:45 -0700 (PDT)
Message-ID: <a0e4b07c-dea8-e45e-7bc8-588f8cbcb537@redhat.com>
Date: Wed, 5 Jul 2023 09:54:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 03/11] KVM: Allow range-based TLB invalidation
 from common code
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
 <20230621175002.2832640-4-rananta@google.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230621175002.2832640-4-rananta@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_165449_930209_83CB4E13 
X-CRM114-Status: GOOD (  12.49  )
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
> From: David Matlack <dmatlack@google.com>
> 
> Make kvm_flush_remote_tlbs_range() visible in common code and create a
> default implementation that just invalidates the whole TLB.
> 
> This paves the way for several future features/cleanups:
> 
>   - Introduction of range-based TLBI on ARM.
>   - Eliminating kvm_arch_flush_remote_tlbs_memslot()
>   - Moving the KVM/x86 TDP MMU to common code.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  3 +++
>   arch/x86/kvm/mmu/mmu.c          |  9 ++++-----
>   arch/x86/kvm/mmu/mmu_internal.h |  3 ---
>   include/linux/kvm_host.h        |  9 +++++++++
>   virt/kvm/kvm_main.c             | 13 +++++++++++++
>   5 files changed, 29 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
