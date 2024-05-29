Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F054C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 21:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TSd5KoYT2cuNmSOM2ciSE3pv+d/uLHIO5/xz89BLquM=; b=gMwYaHa5CcYj6NJsuG8pq98DJB
	rPT5ObhYQ0FPx/LH4VYMSHdrd/wMXJY7ZFoEaP5uj1UzcZfOaVHWGyeQZsfseLc+syI33v8H8h2Bd
	CH4SRIkCojSqFMxGRiF2AiwlC/d94EvzOJJbsQ9jvvzAK9vv8uYtP3WHieX84BF2h2x+gmuXQYE7H
	Sd6vL52YZQbdyBIQ1xfuN263ZEkpgbrgUUY2XmJu+FdRVWye1zOj9qd0we58izIhGUgQpbFImkQu2
	jlGMfKgDLMNzDOQMTMVDXa5Zo3HF5Rqu7307tAY1QR6UKq/zCMDoHqjfch2w2fktWcxp0yhaJx3NL
	qPD78+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRCm-00000005dSb-41Kc;
	Wed, 29 May 2024 21:51:32 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRCj-00000005dQT-3LJe
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 21:51:31 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-629f8a92145so3463087b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019486; x=1717624286; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZEwQSuDxXsJBbCguZar5+VKzM/izfp4n/7bUq7QabM=;
        b=MT+n20QzoWgxDnd+uOHaUFRbQL+MgiWC+HTEhePOXV4RC1mYTmwhRanGjzY4BoQl9N
         b+f3X3kJerWIaGfd64B1ndhqYswCyvrrxyLNKJTaG9ra2sPRWWLC/6yhYEl/C5kntOpT
         B/2tB0aJy5NksuILcBR+slnjbNxAI8WFdQ16/gr2N3D6rYnUEGNel3SE44p+zWfkT070
         jKB01GXvYmQZ/VcBRJhNtwE7EmydRhx6woOKEqeOvMKZjYCffACCZR4Nz52wJeJEYhBt
         ODbEKO7nFcw4FnB062Hf7ZJfAVGqWbj5irq658lksrYF0MpcyTfBlP7sMGQbkMLdU2Qj
         dt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019486; x=1717624286;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZEwQSuDxXsJBbCguZar5+VKzM/izfp4n/7bUq7QabM=;
        b=Crfi9Pq8o51o+xh5+AXZvSYqjAdMZT2qw7wkMZ6pG56aI1STfjujS8PKEZkxy1/B98
         aI1WKPfpP2AJHmYKV2J8yiDCFEObOvfHRiBR0Y4zIb8eIbEP+F2SdNl+PxQrfqBTxRYt
         vxCJiK4XeS/p4v0wBPdLLUMEsvkj6OXYDJSA0P8mpeYSdLkcOvH0YwamN1DBXUDSWAjy
         Zd0vszjir+GxndK4Xnhvb4XAUWCaRFV0GgsBC7/2gEw13XWp5OANJTZv7AJDa8KOEuTP
         Fa1GhftrssKjCYpC2CWx/mwyqqVVkZQjrrwEVJ3n+U89OsiRXsdp12P54yCve3xt7svq
         imkw==
X-Forwarded-Encrypted: i=1; AJvYcCVuyQTdh+npaGVpd3JFAQaxjx6iIGtszpskfiq7Kvk62CeOitiqQAn+mseBm74M9Hg/pD6JSKP90Sq1UpdEiijo/eT9ihLjpzustQzEYdSR
X-Gm-Message-State: AOJu0YxRfiVj6lnlbED4/cLML5BQBdSzwhCFjIpU1dePi2otdmtMLe7V
	TYf0VUchIMQ2j2Ar6zLYxdCLijS+f10hrxVvulM0Rvl5JWb0vYVsnSNwcoWP4/9oKqT4XAvdZm+
	LCQ==
X-Google-Smtp-Source: AGHT+IGqNZ2BbD8cAo2AnWXa3Pi0tfvxVmoPgtWnywK5+NXQgcmpZ6RBn86fT+8nIYtd+ZPLip7+OZUjHdQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:188e:b0:df7:8889:4795 with SMTP id
 3f1490d57ef6-dfa5a407dc6mr54800276.0.1717019486318; Wed, 29 May 2024 14:51:26
 -0700 (PDT)
Date: Wed, 29 May 2024 14:51:24 -0700
In-Reply-To: <20240529180510.2295118-4-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-4-jthoughton@google.com>
Message-ID: <ZlejXCYIuJ7_DlwL@google.com>
Subject: Re: [PATCH v4 3/7] KVM: Add lockless memslot walk to KVM
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Shaoqin Huang <shahuang@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Will Deacon <will@kernel.org>, Yu Zhao <yuzhao@google.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_145129_966172_D2A9953D 
X-CRM114-Status: GOOD (  13.38  )
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

On Wed, May 29, 2024, James Houghton wrote:
> @@ -686,10 +694,12 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
>  	return __kvm_handle_hva_range(kvm, &range).ret;
>  }
>  
> -static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
> -							 unsigned long start,
> -							 unsigned long end,
> -							 gfn_handler_t handler)
> +static __always_inline int kvm_handle_hva_range_no_flush(
> +		struct mmu_notifier *mn,
> +		unsigned long start,
> +		unsigned long end,
> +		gfn_handler_t handler,
> +		bool lockless)

Unnecessary and unwanted style change.

>  {
>  	struct kvm *kvm = mmu_notifier_to_kvm(mn);
>  	const struct kvm_mmu_notifier_range range = {
> @@ -699,6 +709,7 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
>  		.on_lock	= (void *)kvm_null_fn,
>  		.flush_on_ret	= false,
>  		.may_block	= false,
> +		.lockless	= lockless,

Why add @lockess to kvm_handle_hva_range_no_flush()?  Both callers immediately
pass %false, and conceptually, locking is always optional for a "no flush" variant.

>  	};
>  
>  	return __kvm_handle_hva_range(kvm, &range).ret;
> @@ -889,7 +900,8 @@ static int kvm_mmu_notifier_clear_young(struct mmu_notifier *mn,
>  	 * cadence. If we find this inaccurate, we might come up with a
>  	 * more sophisticated heuristic later.
>  	 */
> -	return kvm_handle_hva_range_no_flush(mn, start, end, kvm_age_gfn);
> +	return kvm_handle_hva_range_no_flush(mn, start, end,
> +					     kvm_age_gfn, false);
>  }
>  
>  static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
> @@ -899,7 +911,7 @@ static int kvm_mmu_notifier_test_young(struct mmu_notifier *mn,
>  	trace_kvm_test_age_hva(address);
>  
>  	return kvm_handle_hva_range_no_flush(mn, address, address + 1,
> -					     kvm_test_age_gfn);
> +					     kvm_test_age_gfn, false);
>  }
>  
>  static void kvm_mmu_notifier_release(struct mmu_notifier *mn,
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
