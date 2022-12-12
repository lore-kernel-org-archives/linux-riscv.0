Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09CAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 23:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lgKMp67ap7ItQMeJZjPhU8Ib4zIB7Uq3bDt3OWbhzA=; b=2ycVxVgxdHXkSM
	bQPTmZrNHWrgBMITXby9EKHbRhdl0UPnnKpkOVzquI4OxE2/Ucvqis2g2pwBxffCP3JqDMssQxBNC
	TyuGnMEIqjaBvgjye0A/44HL3L/PEhzmmLo1gz+ESpLkuTtLv5PceC3N4+2jYFpVwDalcI4A7Pk0Y
	z5UpUil2Q/8rvXKSAtNCUbPI9+zW6De9mFZR0Fkkki+uwo9z/uI9usC+cN2SvIxug/9DBhloGB2Pl
	ZOF0YVo1fyMrq6CqifMY1IvD8zGh/sp2e8YYASY3wcZIYFoOjxKQ12HN4LxY0pSlYgWw0JbwhgL6+
	azQ7VPpjxllKZ+Gz7sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4s1L-0070RE-O9; Mon, 12 Dec 2022 23:15:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4s19-00706X-NI
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 23:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670886926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y59dQxuBZvH2dJ+QaunSC7VWD6qA2LCOofme/uP6yrs=;
	b=cKPz7PQQEdk294SkAM5FWQCNFoqN+k/Wh7PLCnojrbMpkWbAquRKzMJxNVT43Gvk0bZy2Q
	wYbDzwTYO4nQ1iZhPWRC6VksqVhQu15hueOziy+jY8HwaHxfpePI+gZcLgUi/CAdKVwuax
	L6elkoY8y/+NNack4iPXSK2uWJxQpB8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-7-62buKRxBOnadZbmGYXIeNA-1; Mon, 12 Dec 2022 18:15:25 -0500
X-MC-Unique: 62buKRxBOnadZbmGYXIeNA-1
Received: by mail-wr1-f70.google.com with SMTP id w11-20020adfbacb000000b002418a90da01so2587184wrg.16
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 15:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y59dQxuBZvH2dJ+QaunSC7VWD6qA2LCOofme/uP6yrs=;
        b=vzOnmamCtspQqVDc8u4pqfUF2Bd7i4rIay5v+WElBLYsLn1vHqjmbIiIvcrYs8nbUc
         u/K7idt0Z33qr0+9JORP7Et82FfKui97q6WhAd6FEnmjb23H1pn9BzQ5b97J+9O45w9U
         6DWmKW53vYOVnXMs+PilSspfh7o5JDm81PsrgF8wYfhNUT+rM8QwEJTp2EcwDuSTdCDs
         owM5sZgDRWoiyINT6adG1UG7+4F5/3n+A/xpcq8ZYCT69basto4+2fTL3duF6xJ9gFAn
         iUueWqRVCp5cQ8C8yydWZUwYKP4tW/m/la8ZnLGzyH+lvjLLVEN0/dPpN/Y3kp0Re4ah
         N+Ow==
X-Gm-Message-State: ANoB5pmMmbVacxmxqc48AMoUTVUJaNYtwuYbJUnHPUW2YB6m+7V1cY93
	S6zIXamtioU7QYIzl09WEFrpgRD5mUQq2gRaKBqHMvClGrCaTwEE37vRe26VEm8PsFPqlRGBBQM
	m9GcKG6UkHyHyl2Y2bzT2f9MK6FaH
X-Received: by 2002:a05:600c:4f05:b0:3cf:674a:aefe with SMTP id l5-20020a05600c4f0500b003cf674aaefemr14677232wmq.22.1670886924312;
        Mon, 12 Dec 2022 15:15:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf69Du0IJa2CIROeqUOCPZXYcdHcFYucdO6uTVaYAPa30ljZoIeQ8u4jZT85a4ufCPYPRVLQBg==
X-Received: by 2002:a05:600c:4f05:b0:3cf:674a:aefe with SMTP id l5-20020a05600c4f0500b003cf674aaefemr14677202wmq.22.1670886924043;
        Mon, 12 Dec 2022 15:15:24 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id a12-20020a05600c348c00b003d070e45574sm10730652wmq.11.2022.12.12.15.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 15:15:23 -0800 (PST)
Message-ID: <b0e8eb55-c2ee-ce13-8806-9d0184678984@redhat.com>
Date: Tue, 13 Dec 2022 00:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to
 sp->shadow_mmu_page
To: David Matlack <dmatlack@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit
 <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>,
 Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Yu Zhao <yuzhao@google.com>,
 Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>,
 Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>,
 Krish Sadhukhan <krish.sadhukhan@oracle.com>,
 Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20221208193857.4090582-1-dmatlack@google.com>
 <20221208193857.4090582-5-dmatlack@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221208193857.4090582-5-dmatlack@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_151527_911127_098C5257 
X-CRM114-Status: GOOD (  22.01  )
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

On 12/8/22 20:38, David Matlack wrote:
> Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
> allows the TDP MMU code to not care about this field, which will be used
> in a subsequent commit to move the TDP MMU to common code.
> 
> No functional change intended.

Let's use a bit of the role instead.

Paolo

> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>   arch/x86/kvm/mmu/mmu.c          | 1 +
>   arch/x86/kvm/mmu/mmu_internal.h | 2 +-
>   arch/x86/kvm/mmu/tdp_mmu.c      | 3 ---
>   arch/x86/kvm/mmu/tdp_mmu.h      | 5 ++++-
>   4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 355548603960..f7668a32721d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -2180,6 +2180,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
>   
>   	sp->gfn = gfn;
>   	sp->role = role;
> +	sp->shadow_mmu_page = true;
>   	hlist_add_head(&sp->hash_link, sp_list);
>   	if (sp_has_gptes(sp))
>   		account_shadowed(kvm, sp);
> diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> index e32379c5b1ad..c1a379fba24d 100644
> --- a/arch/x86/kvm/mmu/mmu_internal.h
> +++ b/arch/x86/kvm/mmu/mmu_internal.h
> @@ -52,7 +52,7 @@ struct kvm_mmu_page {
>   	struct list_head link;
>   	struct hlist_node hash_link;
>   
> -	bool tdp_mmu_page;
> +	bool shadow_mmu_page;
>   	bool unsync;
>   	u8 mmu_valid_gen;
>   
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> index 7ccac1aa8df6..fc0b87ceb1ea 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.c
> +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> @@ -133,8 +133,6 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
>   	if (!refcount_dec_and_test(&root->tdp_mmu_root_count))
>   		return;
>   
> -	WARN_ON(!is_tdp_mmu_page(root));
> -
>   	/*
>   	 * The root now has refcount=0.  It is valid, but readers already
>   	 * cannot acquire a reference to it because kvm_tdp_mmu_get_root()
> @@ -279,7 +277,6 @@ static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
>   	sp->role = role;
>   	sp->gfn = gfn;
>   	sp->ptep = sptep;
> -	sp->tdp_mmu_page = true;
>   
>   	trace_kvm_mmu_get_page(sp, true);
>   }
> diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
> index 0a63b1afabd3..18d3719f14ea 100644
> --- a/arch/x86/kvm/mmu/tdp_mmu.h
> +++ b/arch/x86/kvm/mmu/tdp_mmu.h
> @@ -71,7 +71,10 @@ u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
>   					u64 *spte);
>   
>   #ifdef CONFIG_X86_64
> -static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return sp->tdp_mmu_page; }
> +static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
> +{
> +	return !sp->shadow_mmu_page;
> +}
>   #else
>   static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
>   #endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
