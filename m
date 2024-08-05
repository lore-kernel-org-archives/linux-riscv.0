Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B50C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdXqk5i+PCWQIRevdVArFGmhBmnBoyM+RGiqoZOqBC4=; b=PtNnyOmhY2QPjH
	iZn02kzH4oecVIb5QaeqJRJhSSGEb7PAiBE6vgOvtyFajbLNg4syK1gQ9YYXfEzcTGqMG9urrzpIz
	9RXQ59y51SpCJ+uhkJOydXULphzJMNu2HOJx/9cPNvZyMgo19uDCVhP8agtQjtc+AL8OPZMzsJp6n
	WNaqxxwqn2DzKbOTU4+rbEmgniiyimOdNOw2VAWo+oMjR35lh1UbmJoByfUGSPEXWsek4E+DjesJp
	ExNPWz581qYC8K8l2Qm91I/KZqDQk75tUYCp6n6va8JIjc6JcNeg9aic5NiXJNoY691Vsfxvo+d41
	9ZLKTTiyB3grwiYwhiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb75i-0000000HY1f-0NpA;
	Mon, 05 Aug 2024 23:26:14 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb75b-0000000HY0A-0v32
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 23:26:11 +0000
Date: Mon, 5 Aug 2024 23:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1722900362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+mfeo2RqmDWupNPy1ZQ9DQzaW41XBFzcKm+dZAjG39w=;
	b=nsqM4WvIeqvYHal0R7bad4sl2RiCqdaEThtnF1PVGpbpIk6TP7/CSQ1lcdBlex5IzcKPCb
	7g4CjFX6c6eUuhlGombjt0+/nOmNqPRG0qjhofrleHk8DYNXPAn7Q/OhxjYef93ialM8P+
	YvQTTQKWBorXAs+vuLMxHvrpEon2vKo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
Message-ID: <ZrFfgzRbiqT-Zi2O@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-55-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-55-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_162607_566622_072B16E4 
X-CRM114-Status: GOOD (  18.08  )
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

[+cc Fuad]

Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
the page as dirty out of the critical section") that restructuring
around the MMU lock was helpful for reuse (presumably for pKVM), but I
lack the context there.

On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> page/folio dirty after it has been written back can make some filesystems
> unhappy (backing KVM guests will such filesystem files is uncommon, and

typo: s/will/with/

> the race is minuscule, hence the lack of complaints).  See the link below
> for details.
> 
> This will also allow converting arm64 to kvm_release_faultin_page(), which
> requires that mmu_lock be held (for the aforementioned reason).
> 
> Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/mmu.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 22ee37360c4e..ce13c3d884d5 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>  	}
>  
>  out_unlock:
> +	if (writable && !ret)
> +		kvm_set_pfn_dirty(pfn);

I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
a reference.

> +	else
> +		kvm_release_pfn_clean(pfn);
> +
>  	read_unlock(&kvm->mmu_lock);
>  
>  	/* Mark the page dirty only if the fault is handled successfully */
> -	if (writable && !ret) {
> -		kvm_set_pfn_dirty(pfn);
> +	if (writable && !ret)
>  		mark_page_dirty_in_slot(kvm, memslot, gfn);
> -	}
>  
> -	kvm_release_pfn_clean(pfn);
>  	return ret != -EAGAIN ? ret : 0;
>  }
>  
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

-- 
Thanks,
Oliver

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
