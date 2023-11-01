Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF171C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 22:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QP3nR+Oplytw3ZN38rVQADmyvHpGowUj9p8d5v5LhWw=; b=Kdlmzv9xoMliv6bP1WMKg8XxO9
	9dNKUIvxqObaumhkRZB+Rbv/KXgMGsMiu44kd7U2sI4gaGcgM0acMQQqBco9k5Z7aCKW6+nU0MVYi
	Xe4sWyry0C87NNmYVf2eopRWN+XjS5F0PrJ9P4TRpuoQwmBLkve3OET1apEZhh7RMnSAAnc6/qiGi
	KrNCz4wbI2Un2us9n+jGtvwq0jKctJjSk0gzg06eS6aaMqpgMXo/R7/tlNWzmyyTxQpLGvnbG9DnB
	XGN2sH7pJTiy4o7ttAJCEFMRIfd+epxX+diwx/UmTE5rveRtKNlt0JbWtLsGv/2NelF/+Ww2U2itt
	rE/iKKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyJnl-008DnB-0t;
	Wed, 01 Nov 2023 22:35:05 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyJnh-008DlM-36
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 22:35:03 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5af16e00fadso6181307b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698878099; x=1699482899; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrvOLECZXxSaWjRNpKGTaiE8FNIaCo3DEHHzsR8PGo=;
        b=Y7FVLg9uRM3k8sa5rupVUKF1s7vSFf6R/qtTfM4wWD42ez4OthzC36VIj81VB5rKhk
         9EyD4/8W9/IAOYqPzsenUbjXO2+jvzGghMukJyaonrK2baeUPO4Fajo9RNJLmVI2+iSe
         p4q7b7A++Qucv+pg4T8D0p/ehsvS6e+KmpUiey5pcAUSkYO4cJthNKCyz9zu0LMDw2e0
         MmuoJgcgGuogCebL7Iq2MGEQ0uJfBMiuxUf/9ARgs2nZvNJaoPwsFiKMwJUHeIerYpzY
         IdcxCv75+48Ka1CP8DS39Nv1ZyEFn9auheZuu7XucfjiA34dr+mjKChgUwhlXFCPXXL5
         CW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698878099; x=1699482899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVrvOLECZXxSaWjRNpKGTaiE8FNIaCo3DEHHzsR8PGo=;
        b=AhYAdeqRKP/wLEQlfeI59eJzcxrZ1tZHuWwpH0+L2JOUncXcZ57P0HLqn1YXBoVPh9
         emSXoKzI8eyTSitxa/DxcfXBB1y84npHSf/vrEJ/fRr2asey53GsxOhfW2a+JeNZyqaW
         pPIq8YkhmMVwm/UgaAXEPW8jT0yrUi9faJ2BQa4EWy1aHd39tPmHhMrouXtuaZJha9FP
         AyyJb6ijIctN7G/4pgVCl7tFXAng3fuzMFtqzAb56Hr5niwrNrqixA/zdG9bDUL3GLoW
         cj5vOUy+OWXCMCeNhI4VW4o95s2PssJTVHOCpTg90BJSdfuABBfkl6BqM8gm3+77GHcI
         chSQ==
X-Gm-Message-State: AOJu0YzB/Bu4Efkn0YYwbFk2NyT0i8LPwly8ICXgbx6VnVvUNZYd8kNs
	T4gi3BT5Qgfv2NcdS1dNTP89f5SwJkw=
X-Google-Smtp-Source: AGHT+IGD6UN3MOOerdMFLEmny4gzkak60wHqIVXKsA4NlWLNqw1UJj00i84usFlUQuEsQ45Qnt2ok92VRKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9214:0:b0:5a7:bbdb:6b39 with SMTP id
 j20-20020a819214000000b005a7bbdb6b39mr350826ywg.3.1698878099514; Wed, 01 Nov
 2023 15:34:59 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:34:58 -0700
In-Reply-To: <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com> <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com> <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com> <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
Message-ID: <ZULSkilO-tdgDGyT@google.com>
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_153502_037695_410A50A8 
X-CRM114-Status: GOOD (  26.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 01, 2023, Paolo Bonzini wrote:
> On 11/1/23 17:36, Sean Christopherson wrote:
> > > > "Allow" isn't perfect, e.g. I would much prefer a straight KVM_GUEST_MEMFD_USE_HUGEPAGES
> > > > or KVM_GUEST_MEMFD_HUGEPAGES flag, but I wanted the name to convey that KVM doesn't
> > > > (yet) guarantee hugepages.  I.e. KVM_GUEST_MEMFD_ALLOW_HUGEPAGE is stronger than
> > > > a hint, but weaker than a requirement.  And if/when KVM supports a dedicated memory
> > > > pool of some kind, then we can add KVM_GUEST_MEMFD_REQUIRE_HUGEPAGE.
> > > I think that the current patch is fine, but I will adjust it to always
> > > allow the flag, and to make the size check even if !CONFIG_TRANSPARENT_HUGEPAGE.
> > > If hugepages are not guaranteed, and (theoretically) you could have no
> > > hugepage at all in the result, it's okay to get this result even if THP is not
> > > available in the kernel.
> > Can you post a fixup patch?  It's not clear to me exactly what behavior you intend
> > to end up with.
> 
> Sure, just this:
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 7d1a33c2ad42..34fd070e03d9 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -430,10 +430,7 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  {
>  	loff_t size = args->size;
>  	u64 flags = args->flags;
> -	u64 valid_flags = 0;
> -
> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> -		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
> +	u64 valid_flags = KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
>  	if (flags & ~valid_flags)
>  		return -EINVAL;
> @@ -441,11 +438,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
>  	if (size < 0 || !PAGE_ALIGNED(size))
>  		return -EINVAL;
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
>  	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
>  		return -EINVAL;
> -#endif

That won't work, HPAGE_PMD_SIZE is valid only for CONFIG_TRANSPARENT_HUGEPAGE=y.

#else /* CONFIG_TRANSPARENT_HUGEPAGE */
#define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
#define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
#define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })

...

>  	return __kvm_gmem_create(kvm, size, flags);
>  }
> 
> Paolo
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
