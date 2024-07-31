Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED399C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gu399+gNONJmYJCtjvAqlUolyMyu1zNFRbjfbqCtHT8=; b=IRAxpkiquFvDEY
	D71h5xhARV9bLSzK8cVyrduijoCxsKzaO5gROr4tgbytC++JS30Ebwewqe3ClO2yzIAQr+3C8mm2a
	OvlCYdo1vxhEup6j7/C4WblqHoBgNixq+hiFGa1mApjf4zjjqFjGvueNoCi+OCRryeOj81RSPsMSA
	wC+c3oQ4vVT8KfEgiJkoex8ib6ehsgZmSna8itmI01uhU37vEUPK2FCx1+4E3Eq6d5kqnPzAPzYC3
	Zj7AjE9xmsdizTV403vke6mD6w2L2136mxVsnAw7FPg43ZbZbw+FT5nng7NNTa+RuwKxM7NT5WyFX
	XNIkBqQn8zruZGsNgYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4R4-00000000GRv-0lMV;
	Wed, 31 Jul 2024 08:11:50 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4Qr-00000000GLh-2CIs
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 08:11:39 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a7ab76558a9so119820166b.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722413496; x=1723018296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=DCmH8AkwM9DTKyHwPG4H2f1g5EQKqLYQTVcbQcy2+0jcZ4M2Tcq1SNMsJ0vl9xucdX
         OkBVzSPlu9XxIaDCAhFj+0+pbinqBDuknWAFU/ptNknPPyoQZA++l8pc1ok88tcuzS8s
         bunsYBlMUnc+4RqWzGE4aAS8ntlElvX4K0/euyACk0/6SK/ZUvFAQOj3ZCj7qhvfJz3R
         BMJ/SPT1d1eyFD2Y+lk+KnXheJ7bJGN+pfC8uXUVeyVUJaztKWNAWyVPheXKX7zT4kI1
         uOfZWe9dT3WVeTAt4CPtdWMi/DB7y1WypFkd/R+hnAOfKfDKaDniTpCBpn5Vd8bKLB3Q
         L/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722413496; x=1723018296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i19l7d1eZbhVp7fQ4bZoRAfF6lLDsSZcH8bPmRvWiA=;
        b=EjjW3qKlidREA1tnlVHRDtMzOmZGJLAKF+EhNL6B3bWGCnNzIM3qwDThv3uSvuuE63
         4GQYhxAIFI41VZAA0icJMpl1/+cmQcjwP2rndyI+Cvl2Js2LZR/jxizub/B3KZhL9m8a
         SBXqLm4cPpLEqRMCveluWpM/POBiSViCfVKNUsHCHJk9sUxOiFym++HVUGYd1xQXyPOB
         RQ4yiGLbLGxHAJrjOXEaKZh0nu7OKqKrS8kH0naAjbkXF7WnzxWBAm2RWIMXAFu992P+
         2DRu8QaZWhdjVtj6QESa8iJsFjhh5hH/aAhlYN4vdvJcPLsvH2pRKd4jPZHj2/6A4VkL
         plBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKDD3CnPm32fZw1nuDwkNPdsX9V9rfVTFIqozwM6++mqCMxy2SU+RlGl/50vDtVDQ8xMoVSLvLNlCGUs6I/Opyi0JbKXwPIY/K4EHANOi1
X-Gm-Message-State: AOJu0Yyl5W3iWVc1HTBpYbV/oiJ40mJMu+2vDALVnslrtEfjSnqZuczp
	unarLrWYwuz5j/E1GrzGOwmwgCpCv7gKTs+zp3C33E5Sc95XF5YoLZkEFjjY+9o=
X-Google-Smtp-Source: AGHT+IEAM3rgFV5Nss1oeOJc4d0T/p6GjpLY5HpQ/UfV3bepvtCwNBml7jly3uQHrfiUKxZe0LrJkQ==
X-Received: by 2002:a17:907:60cb:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a7d88c437b8mr269366466b.2.1722413495475;
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8361sm734690366b.207.2024.07.31.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 01:11:35 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:11:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 56/84] KVM: RISC-V: Mark "struct page" pfns dirty iff
 a stage-2 PTE is installed
Message-ID: <20240731-0456655970f6ae99f907de43@orel>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-57-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240726235234.228822-57-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_011137_595955_1BD6AB8D 
X-CRM114-Status: GOOD (  17.51  )
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

On Fri, Jul 26, 2024 at 04:52:05PM GMT, Sean Christopherson wrote:
> Don't mark pages dirty if KVM bails from the page fault handler without
> installing a stage-2 mapping, i.e. if the page is guaranteed to not be
> written by the guest.
> 
> In addition to being a (very) minor fix, this paves the way for converting
> RISC-V to use kvm_release_faultin_page().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/riscv/kvm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b63650f9b966..06aa5a0d056d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		goto out_unlock;
>  
>  	if (writable) {
> -		kvm_set_pfn_dirty(hfn);
>  		mark_page_dirty(kvm, gfn);
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, false, true);
> @@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> +	if ((!ret || ret == -EEXIST) && writable)
> +		kvm_set_pfn_dirty(hfn);
> +
>  	spin_unlock(&kvm->mmu_lock);
>  	kvm_set_pfn_accessed(hfn);
>  	kvm_release_pfn_clean(hfn);
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
