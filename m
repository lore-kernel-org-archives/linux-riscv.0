Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C2C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 15:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YK058Q5OXDh+Cl89IwintQaeeWGUVykO5+xyAXn38c=; b=ko+CqG0ZVtPgeG
	/eXyYEy7DqFmMhQ3N9EDyYRY4o6TEpOwZQSKLPn51QY8jzbRuCGnmdvooFxC2gQPhqvtSq6BbtoNy
	cm0slVgl4g4j02q/ly5+HyVJin55aoBrDNhzJXIjcelslDuIQmn/iplJ/Mc28rKrtFD0DT+1aaXGi
	SzCY4k6klLmx8TdWEPO/4lj8hTgBkHcimOznsdqUebLj9+Iy1DimZ541T/UXwtmpBhb49V9FWuUpX
	ZGg0kqET8P5lyBXSp9jmInuos/IuM1X83Jy8Iucj8978ax8r3GmPgLTef/Kih1mA7F1B1/pdX6QpK
	YKxHY+Ucp6avC+hXsDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrq7-00EPDY-1d;
	Fri, 21 Jul 2023 15:14:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrq4-00EPC3-1F
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689952479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BrJmJjnrV3+4TK5GKS3+EEIdaYEFXLT6GE196jD6rfg=;
	b=FTerqROHSr49FG3IuuTeRzk+ckFCPi2WY2dTAu8BnwSXNn295IHo2p3YHI+yytyl4fP7kx
	YkpcOn9Oe9vIVsHBUovkSU2q8zwNBp5YJ5bp2YHTA33eq9hsiEcOqxEXCFq6IQ3tmqyovQ
	oUaCsV88IgyKp0XeM2Y2RUA37S0SPiA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-FftGq9KxNMCU8PIjuC3HOA-1; Fri, 21 Jul 2023 11:14:37 -0400
X-MC-Unique: FftGq9KxNMCU8PIjuC3HOA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-4fb7d06a7e6so2074814e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 08:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689952475; x=1690557275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrJmJjnrV3+4TK5GKS3+EEIdaYEFXLT6GE196jD6rfg=;
        b=HDJxBmUCU22eeilIW5gGwfNqrV9Du2ZdwSzrZ0MTMD3+X6lPM03YsrCXFaY1vqCfK7
         1MvkSsBi84JqU/a1oWa55ZciIY+tD/wZQgkQfuT3v0/vHlLoT5mQE6deZBvBSWF1oRHl
         Fxk8UqRIa2kdi15HgEtErg1UqQSYSd/kwLXg8dRP5ylUNfDLnsa4M8Ot6m05Mm8rmPAs
         3He0hgSHV83VeJtB9c4KG0as2ChaO5IZHFNOP/VKWYQdCYLFAN+RmNxOB2cXbgnOltuP
         REO+HSjrim2ZLFRnNRIzKnnmxTSnxXnkYL4MeoBJznhhYYJAhFq0KrpkRoI/KIeBXBt2
         2ieQ==
X-Gm-Message-State: ABy/qLb9Tep/N3g2l+Q+i/Zeq/yXM5xxZqDoTu9oZr1sClwwD3KdlOoP
	yNubqccEx27zS608GRLP6ccQcmSQ7gl/+aIwsf0ViM6GN0Tsr40QdU4C7a/RuhkCFjB5j6qFneH
	gfvmPaQY6ZYLMFhq3rtsxECsxM2O/
X-Received: by 2002:a05:6512:1150:b0:4f8:661f:60a4 with SMTP id m16-20020a056512115000b004f8661f60a4mr1702780lfg.41.1689952475224;
        Fri, 21 Jul 2023 08:14:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY792MHWkKnplUr0Vx4lx09FEkAsdfsZuVIi7WtMfQ0gFs1YquUiOv8dJt4JtZPtFNMSuP/g==
X-Received: by 2002:a05:6512:1150:b0:4f8:661f:60a4 with SMTP id m16-20020a056512115000b004f8661f60a4mr1702736lfg.41.1689952474795;
        Fri, 21 Jul 2023 08:14:34 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id l23-20020a056402345700b00521d2cf5f3bsm2224721edc.96.2023.07.21.08.14.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 08:14:34 -0700 (PDT)
Message-ID: <75f13a8a-132f-99ee-d3c6-24a12f2f23d5@redhat.com>
Date: Fri, 21 Jul 2023 17:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH v11 18/29] KVM: selftests: Drop unused
 kvm_userspace_memory_region_find() helper
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>,
 Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>,
 Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>,
 Wang <wei.w.wang@intel.com>, Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-19-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230718234512.1690985-19-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_081440_509066_EB0051B4 
X-CRM114-Status: GOOD (  14.58  )
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

On 7/19/23 01:45, Sean Christopherson wrote:
> Drop kvm_userspace_memory_region_find(), it's unused and a terrible API
> (probably why it's unused).  If anything outside of kvm_util.c needs to
> get at the memslot, userspace_mem_region_find() can be exposed to give
> others full access to all memory region/slot information.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   .../selftests/kvm/include/kvm_util_base.h     |  4 ---
>   tools/testing/selftests/kvm/lib/kvm_util.c    | 29 -------------------
>   2 files changed, 33 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 07732a157ccd..6aeb008dd668 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -753,10 +753,6 @@ vm_adjust_num_guest_pages(enum vm_guest_mode mode, unsigned int num_guest_pages)
>   	return n;
>   }
>   
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -				 uint64_t end);
> -
>   #define sync_global_to_guest(vm, g) ({				\
>   	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
>   	memcpy(_p, &(g), sizeof(g));				\
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 9741a7ff6380..45d21e052db0 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -586,35 +586,6 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
>   	return NULL;
>   }
>   
> -/*
> - * KVM Userspace Memory Region Find
> - *
> - * Input Args:
> - *   vm - Virtual Machine
> - *   start - Starting VM physical address
> - *   end - Ending VM physical address, inclusive.
> - *
> - * Output Args: None
> - *
> - * Return:
> - *   Pointer to overlapping region, NULL if no such region.
> - *
> - * Public interface to userspace_mem_region_find. Allows tests to look up
> - * the memslot datastructure for a given range of guest physical memory.
> - */
> -struct kvm_userspace_memory_region *
> -kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
> -				 uint64_t end)
> -{
> -	struct userspace_mem_region *region;
> -
> -	region = userspace_mem_region_find(vm, start, end);
> -	if (!region)
> -		return NULL;
> -
> -	return &region->region;
> -}
> -
>   __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
>   {
>   

Will queue this.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
