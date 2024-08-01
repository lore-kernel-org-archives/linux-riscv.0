Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03739C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 07:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LtEkDomjNu3rCcGbYz/VY06tJp5iGd/eGIL4IQws34=; b=v17s9r5zAmh0Yo
	BRUCNqKjcUKreK64VAmHt6AEcEm1tofPXjMwb4rTtLgTa50IDpXK1nWN9ykA4jfRZOMIqgyopYDR0
	0k1B8G/HaGq0iGoqqfLtQUin1nlGxjn2udx5SA3fZXNoJYJuvww2GBc5Opfex5GovbOrK118XEs4K
	LSl0HBiatx1SP7o4P/O09X084M08vLGTOM3/tYDqCy+BeCiSK632NJVde3tm3bUENKHPt2zexxY5R
	4ZWbXPLkVhsTGsNU9MfJVNnZDHrFxkEg2ffvr/Vm1pW2WG6eD2UM/7sxDR9ilaFgNmW/hlgbbHUDA
	rU41QN/3qEKl0ohkQTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQLS-00000004Blu-0HDE;
	Thu, 01 Aug 2024 07:35:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZQKx-00000004Bdh-3gKM;
	Thu, 01 Aug 2024 07:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8D90CE11E0;
	Thu,  1 Aug 2024 07:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C540CC4AF0A;
	Thu,  1 Aug 2024 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722497697;
	bh=4fAL4cODCnjl0NV8qGw/Qqudnit/5hoHCsZrciMhbUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hm6lqGrnGLdGUt29ZxrQ9cGwGC5e/My8adr9xG8pGwOWvxzaIy2wVVZecHcsaS7MD
	 2vhxDp5qw6P6jWSVDdYpSlndt26lYMY/9L3hrdQVP6XL1jiOwA3de3PchwMF07I1N4
	 2YEHskiwTzLI1+iwXeDgxTjbuc9HN0GjQyrYNiG+t6NhVrrxrlXYCf8VJMbSS/9yNs
	 oHiP/3JEHHEyg0SbxiUkt+heXZ9wY3Uvo6jOHCc4TGv31tTJIER/7SKgCRJbrwGHtk
	 ninurOs1MqcQM+fogPcJEhZWkju/RfarTKElxrf4Eq/YQ9RcoW3WZjBJcrAerVNRjv
	 rukvhfzurLf/A==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
In-Reply-To: <20240726235234.228822-3-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com>
Date: Thu, 01 Aug 2024 13:04:43 +0530
Message-ID: <yq5aikwku25o.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_003500_118881_9CA7D5F5 
X-CRM114-Status: GOOD (  15.98  )
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

Sean Christopherson <seanjc@google.com> writes:

> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> writing guest memory without marking the gfn as dirty in the memslot could
> result in userspace failing to migrate the updated page.  Ideally (maybe?),
> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> and presumably the only use case for copy MTE tags _to_ the guest is when
> restoring state on the target.
>
> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/guest.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index e1f0ff08836a..962f985977c2 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  
>  	mutex_lock(&kvm->slots_lock);
>  
> +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
>

is this equivalent to kvm_follow_pfn() with kfp->pin = 1 ? Should all
those pin request fail if kvm->nr_memslots_dirty_logging != 0? 


>  	while (length > 0) {
>  		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
>  		void *maddr;
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
