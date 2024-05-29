Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D4C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 21:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zjTk7guFFizfLZI3ywdjskpVOmcdu08+yBoMrQuI3Yk=; b=xZpuWeSYoEWE7Tp2c9j6ldsSZ7
	g9t5+IZ+2LNCahyIY9+3wdlZ1eduGcHYTaAe/KLVUFHLPS3YGIqLwo84PVNvv+QtlyV3YfNGsuGe2
	34gDZCDsH1zslYU+eE/DXyWvM1TMtl48oDAGOmpRxYYPaTL6Jmi6iXC8mAKqc42XPS2aqk6h7/Ezw
	C9vEx8KMcwkmpQ37RzF9DaxEd0OZDaiSUDDkZrClal2JypuZfvsINyvJUN7b81/h6dGgSvOhzGOxG
	VNwsR9803FRA+k6zUzFJokKk6GCdtXDdF7Y2n/wOdhQZ0UhFWHhOu2IcDbuAWYWbtULamwMNuKf/0
	QlFkfGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRH1-00000005e2j-11dW;
	Wed, 29 May 2024 21:55:55 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRGx-00000005e0a-21wL
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 21:55:52 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-66348aafadcso214484a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717019749; x=1717624549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=0zBxsdjGBWKf7TCVl9ikOXUBvH7Zyl+4K/7m/gRMbamtCx9xKdJpGmeWFpVfaj7Vqm
         x2H2rtMCiZVCwyCXIGrKBxTEf4WDIIYW5X6NOlh+nGvHEjkXRoY52siJVZCbQMEsL9lf
         VNdj81X9o7NWoOlX0TmGHq70jcgLCbT0kfn5S1GOC17uIijekPKpkfZHhN1czm5HGkdU
         PX7PsY+IVlPSiEcDYFvmnJs8aJUDBMbTP9Xzn/DNYQtAdoPJW6CYPwiIwDbIkYuonoQg
         vKbsZxPyf0WP/4OFUpqmH4pRVt2l+vQhTit+4ty/MzvXxvNlA9n/9eVEXFyZW7bQ2HML
         dvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019749; x=1717624549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R0O8RdWVLc2UjPDSDGViR160MauFo82inRxl7GpP6bk=;
        b=LQTRQCn/Eu5DxechVScyrBpoi+iih5V70ANCbQRoewqQ/lGgArHHfKHXvJT7X1JnXO
         5LQb/ibsSvImPla/SvQGHhWccztXCV5WR0Now+D2PaSpXtOC0vgHdxnShX589hXvJs8p
         RwhkUme6M7K4jqV2mwqCe58So43MAwr5mwY45clLdhnC3dFl1E+y8aWSOnJYGu8gNvza
         oi4S4cgP1E2HpqucXvt163Dr50LKpoen8yGCGGsfAXzT/xcWJvY5eH7etLnsD8rCOc95
         qJWTEraSt9jn0LJMl9HUmq22oUeMRcxO+sk/N6+ZUxfZ5ZGyaGe1sHUo9P8EHRFlhYyp
         gvbw==
X-Forwarded-Encrypted: i=1; AJvYcCUcGPBSGPOGazFaqzsIwy83H/Naa6xxw0B72+4ob/5/3J9f7vxvWW+iE9qb21VqxzVBA86RH+YD5q1o5wJKjKVJ6kMWziq6+I7N8hEzzXuM
X-Gm-Message-State: AOJu0YwBzMDc0zP4HLNyKWsx9IxtlKQe0mgYKsXVQpj5OhQjNEF5Zv5o
	+BO6FaTT698WVUnnRsixtdzfm1JKYfkXb/rWqXxZck0Fj8uL7odr3yvQXQz9tv/wCHHY2dF5zef
	jBA==
X-Google-Smtp-Source: AGHT+IGx3SrykKCWRo4963j21qgI5u7l1D5l4vFz5cSTor42JO4rQICXW/WPSO9JICYG6TRZvTrpM8pyR8k=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:308:b0:65c:f515:1590 with SMTP id
 41be03b00d2f7-6bfdaf2b2f6mr480a12.11.1717019747924; Wed, 29 May 2024 14:55:47
 -0700 (PDT)
Date: Wed, 29 May 2024 14:55:46 -0700
In-Reply-To: <20240529180510.2295118-5-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-5-jthoughton@google.com>
Message-ID: <ZlekYljG7KJwblUj@google.com>
Subject: Re: [PATCH v4 4/7] KVM: Move MMU lock acquisition for
 test/clear_young to architecture
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
X-CRM114-CacheID: sfid-20240529_145551_547471_FAFB3AEC 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
> For implementation mmu_notifier_{test,clear}_young, the KVM memslot
> walker used to take the MMU lock for us. Now make the architectures
> take it themselves.

Hmm, *forcing* architectures to take mmu_lock is a step backwards.  Rather than
add all of this churn, what about adding CONFIG_KVM_MMU_NOTIFIER_LOCKLESS, e.g.

static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn,
							 unsigned long start,
							 unsigned long end,
							 gfn_handler_t handler)
{
	struct kvm *kvm = mmu_notifier_to_kvm(mn);
	const struct kvm_mmu_notifier_range range = {
		.start		= start,
		.end		= end,
		.handler	= handler,
		.on_lock	= (void *)kvm_null_fn,
		.flush_on_ret	= false,
		.may_block	= false,
		.lockless	= IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_LOCKLESS),
	};

	return __kvm_handle_hva_range(kvm, &range).ret;
}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
