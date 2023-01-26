Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A78C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKgtMgdxjLRYL8T9ExUmKls42amajaLPPstuTfw6C88=; b=08g8zJ6/eSaIzs
	TjZtkGPZKz5XtLDM3XdC1ILC+tpNyhoYa7YuyvdnImdxdAYVzvIWrXtLp8Q0v9oqVLSX0Z6EJVRq3
	sRP1N2+SV5ZP3yEebXv/ZpwnWTaVZxScMZ2rMVVAD1AfD5YLdAcKg9bZqgesMfzdFGZe5aFkaQn/C
	UkRnIcx7dgWCiThVvwT4UjcTYb8vxV+d/HxeNSfe7k3B6Ch2LW3VQFTQaTBLdrR/4fxOplvRCUcEC
	uUKEzV12IKODlyNtSi2MYxojDw8eufvQhf9QMitrbi+mYoxf5BA/C0poyj8P3SoF3BEB0un3KduHA
	ny97szb9eIIsoQWidfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4r2-00Bge4-3n; Thu, 26 Jan 2023 16:12:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4qs-00BgZo-9F
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 16:11:53 +0000
Received: by mail-ej1-x62d.google.com with SMTP id m2so5912339ejb.8
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 08:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTuRDxbfWg39Wdf8MzHmSvof5BdyBoYVZ4tVj9C0vdE=;
        b=k4zXl9wSOzT/hXYVF/RWS+MlEEKZ9rSwfiqCrVzT+5K427yb+3ngGAKiKmE3HZLGLp
         FIXsamU9iKhdxwfe5chNrwjiKnxYxZP7dzTdjDYdlOJ3pZBjYV4GUlIUUDfqzb1KOJY2
         RS50VQikH+FNvBbsKC0/bO5gOrhdpl26RbPfotICnImztHHhDzK1vryqLRcKSbaNSbOu
         otrkbjfn19peb5OMybSS0HrRC4ua3z9ZEXtj6FfyNSBwYtO9nblgJBq0F3fimk0CiIWP
         qlAhImj/EASE9ScORVLWT4MCwiJ7N5dY/qbUTEWVsOIvz3RvGbqyGYGX1lbt41Atlv2v
         7Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTuRDxbfWg39Wdf8MzHmSvof5BdyBoYVZ4tVj9C0vdE=;
        b=iT9ezat/9JU9PMmq3viEB/x3+hS+ubloPwjXe81VcvRqSEDKsKkbFgU+YBZm9ZvUZE
         DdG9XePq+3gcDExXGGmMwDC6wypHj9DPLdndEA2fp9iQgJU3D3ZZfkp5+PNoxYhpvi/M
         BdzpqDcCYc0P2SwPGUfoVQHXk0MHZ1Dm0avGR1o/n0Cmz3tLZRb3SBzAifjxZmpmu5jf
         5zhQU6YmB8UbGbBF/3H6CIxsI5W/5yqWc1DmeO+ZI0HiyzyBl2E2cd3cwEBqjUF3twUJ
         COqn72RsJih689KQxjqdhq0HZCaQloQkGlVn7CMs2b8zpMcH1OWDLmgImIJp4O5KAjgn
         GSJQ==
X-Gm-Message-State: AFqh2kodZbNtKBojTkdfhUXeoC6yoqdr9KC7ZShujqum05foDiF84F9u
	K3FF1O8+lAK6tbRUVBgtuViixg==
X-Google-Smtp-Source: AMrXdXsyyaq9WL28lgCMw2oKhC8d+T2NBMFe+cOw0CLF/8Noh23mi3z88nsbaVwyj37sqzNjaTmCvA==
X-Received: by 2002:a17:907:c712:b0:7ba:5085:869 with SMTP id ty18-20020a170907c71200b007ba50850869mr41788111ejc.9.1674749508793;
        Thu, 26 Jan 2023 08:11:48 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id z12-20020a17090655cc00b0084c6581c16fsm793123ejp.64.2023.01.26.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:11:48 -0800 (PST)
Date: Thu, 26 Jan 2023 17:11:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID
 mask defines
Message-ID: <20230126161147.6rewhfvlouqn4ual@orel>
References: <20230112140304.1830648-1-apatel@ventanamicro.com>
 <20230112140304.1830648-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230112140304.1830648-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_081150_382944_8F331ADC 
X-CRM114-Status: GOOD (  18.84  )
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

On Thu, Jan 12, 2023 at 07:33:00PM +0530, Anup Patel wrote:
> The hgatp.VMID mask defines are used before shifting when extracting
> VMID value from hgatp CSR value so based on the convention followed
> in the other parts of asm/csr.h, the hgatp.VMID mask defines should
> not have a _MASK suffix.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h | 8 ++++----
>  arch/riscv/kvm/mmu.c         | 3 +--
>  arch/riscv/kvm/vmid.c        | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index d608dac4b19f..36d580528f90 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -131,12 +131,12 @@
>  
>  #define HGATP32_MODE_SHIFT	31
>  #define HGATP32_VMID_SHIFT	22
> -#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
> +#define HGATP32_VMID		_AC(0x1FC00000, UL)
>  #define HGATP32_PPN		_AC(0x003FFFFF, UL)
>  
>  #define HGATP64_MODE_SHIFT	60
>  #define HGATP64_VMID_SHIFT	44
> -#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
> +#define HGATP64_VMID		_AC(0x03FFF00000000000, UL)
>  #define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
>  
>  #define HGATP_PAGE_SHIFT	12
> @@ -144,12 +144,12 @@
>  #ifdef CONFIG_64BIT
>  #define HGATP_PPN		HGATP64_PPN
>  #define HGATP_VMID_SHIFT	HGATP64_VMID_SHIFT
> -#define HGATP_VMID_MASK		HGATP64_VMID_MASK
> +#define HGATP_VMID		HGATP64_VMID
>  #define HGATP_MODE_SHIFT	HGATP64_MODE_SHIFT
>  #else
>  #define HGATP_PPN		HGATP32_PPN
>  #define HGATP_VMID_SHIFT	HGATP32_VMID_SHIFT
> -#define HGATP_VMID_MASK		HGATP32_VMID_MASK
> +#define HGATP_VMID		HGATP32_VMID
>  #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
>  #endif
>  
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 34b57e0be2ef..034746638fa6 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -748,8 +748,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
>  	unsigned long hgatp = gstage_mode;
>  	struct kvm_arch *k = &vcpu->kvm->arch;
>  
> -	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
> -		 HGATP_VMID_MASK;
> +	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
>  	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
>  
>  	csr_write(CSR_HGATP, hgatp);
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 6cd93995fb65..6f4d4979a759 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -26,9 +26,9 @@ void kvm_riscv_gstage_vmid_detect(void)
>  
>  	/* Figure-out number of VMID bits in HW */
>  	old = csr_read(CSR_HGATP);
> -	csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
> +	csr_write(CSR_HGATP, old | HGATP_VMID);
>  	vmid_bits = csr_read(CSR_HGATP);
> -	vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
> +	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>  	vmid_bits = fls_long(vmid_bits);
>  	csr_write(CSR_HGATP, old);
>  
> -- 
> 2.34.1
>

Could switch to GENMASK too at the same time :-)

Anyway,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
