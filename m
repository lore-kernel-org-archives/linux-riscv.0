Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73CCC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LAQhbsihKwAJQKKdq/EdbWoQAJ3fO2So4RFT70f2/wc=; b=VBpv9zNNYwhC+7
	cF0UN3+ktbTy1KMQokjqWMKff12u93MwSzzt0TZWxl62cNWAdc1SI1KE+1T4Kxltn141YtfFhRRXK
	lxeR0OjIDCuRoezYLNQXhFnR9X/zISuiOS0HhIlfY7CTZIkDmRpit6ir80OJ7oEfQgY8PKkYx8oaL
	QslyUn65Sp/DNeBCSv1GgbhQpsHf2MOzzqHgJv7KOVACRt3IVsivtJrJp/NIIjW4cIJoJustSQNjD
	G7Qo2p81unJXqFxIK2rrWHHF+qoNNBAK/Z9nbhGne/PrmFbxmnIsxwAWPS7p+fISmlyz0dAeqbBPz
	HNO+XjLOWRjlKdaon50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPv1-00Ez5c-27;
	Wed, 13 Dec 2023 14:08:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPut-00Ez0y-20
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:08:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so73602235e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702476530; x=1703081330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4lrG4sG6YQ4BIE8GkwyCjrSGGxi/UC5oCrLRkXbQKg=;
        b=MlubJGYia6fe9BWGLuUlwgDtgwzDIMNRHDTrsnfCIPVnA/0ET1n+Ad+HS6RgDVjuo7
         Pyg6CU9YztBV1KJH6x78jhl/0n2W7InxOe0NIFtxmxJuSJ1yKHP1bryFdez2sIzFZ64a
         QWm+y9DsSVGBjVtopHhPUx1kuKQlD/YLspICHBKvhvoJV2dlJ/IgE1emY6yQv8Qhdd4D
         SXM3lCR3CRoVr/NHrT9W8RZ/QUf2O0Y6WzEmLio/3V51H49qV+AkwxXpXbLHz98BNBnz
         SfL69BOz551Y6tSECGy4VQubQOog/3Np3f//8icGpFv70GpVAWK481PHakO99T7d92OU
         xt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476530; x=1703081330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4lrG4sG6YQ4BIE8GkwyCjrSGGxi/UC5oCrLRkXbQKg=;
        b=F7itQ1UEZHPY3wReAniWYOSqVLSAsyWKeSL6sRmCmWpB3vssgmpvMk9WOslRipEXsd
         4qtvFRLhMxIVRA3wj9Aaf3+mpAy2DrZ4/3LDabtPpICvegj7N/hbW45QFG9+VEJTxQuS
         hxCPCOw0TSi0gMLl4/JuDlZPSeDpQw5okw3aHUNmWMYNAtEeKYfwWzGrrrg0aHBb6fhu
         mwhqle61B2L6mc7uSAJJ4qqj4dqXq4WfVd8A+5wqj7J/h82ZFqGINC7n6ujHC+xH1Rbe
         x3hU6SYa500jdcmsajuzS2SkSterDpZsR8P9ovITJxZrjjx7gOBqfq3fZ3sKBsNQ+asU
         5Lsg==
X-Gm-Message-State: AOJu0YygaUzpknxdoTxlgMBDcUyANAvwOhLjUSguyJaaiGi7HVHdQs4S
	tmReNpPWUdgHVejG0D9RxCWD+A==
X-Google-Smtp-Source: AGHT+IFgauWd5JriwtlECloTEhDNQTP3+kD2+Khl56+oF2aQ1LGAnudW9SV+lT5Ks1LMkyomAMD58w==
X-Received: by 2002:a05:600c:1d19:b0:40b:5e1d:83a0 with SMTP id l25-20020a05600c1d1900b0040b5e1d83a0mr4191978wms.52.1702476529934;
        Wed, 13 Dec 2023 06:08:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c46ba7b66sm11736461wmn.48.2023.12.13.06.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:08:49 -0800 (PST)
Date: Wed, 13 Dec 2023 15:08:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Greentime Hu <greentime.hu@sifive.com>, wchen <waylingii@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Minda Chen <minda.chen@starfivetech.com>, Samuel Holland <samuel@sholland.org>, 
	Sean Christopherson <seanjc@google.com>, Like Xu <likexu@tencent.com>, Peter Xu <peterx@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 08/11] KVM: riscv: selftests: Add guest helper to get
 vcpu id
Message-ID: <20231213-b02db86aaf7957be22b200f1@orel>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <02f6c9ccaaeb4ceb67137863e0317f62cef62496.1702371136.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02f6c9ccaaeb4ceb67137863e0317f62cef62496.1702371136.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_060851_697720_FE41593E 
X-CRM114-Status: GOOD (  18.67  )
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

On Tue, Dec 12, 2023 at 05:31:17PM +0800, Haibo Xu wrote:
> Add guest_get_vcpuid() helper to simplify accessing to per-cpu
> private data. The sscratch CSR was used to store the vcpu id.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/include/aarch64/processor.h | 4 ----
>  tools/testing/selftests/kvm/include/kvm_util_base.h     | 9 +++++++++
>  tools/testing/selftests/kvm/lib/riscv/processor.c       | 8 ++++++++
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/aarch64/processor.h b/tools/testing/selftests/kvm/include/aarch64/processor.h
> index c42d683102c7..16ae0ac01879 100644
> --- a/tools/testing/selftests/kvm/include/aarch64/processor.h
> +++ b/tools/testing/selftests/kvm/include/aarch64/processor.h
> @@ -226,8 +226,4 @@ void smccc_smc(uint32_t function_id, uint64_t arg0, uint64_t arg1,
>  	       uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5,
>  	       uint64_t arg6, struct arm_smccc_res *res);
>  
> -
> -
> -uint32_t guest_get_vcpuid(void);
> -
>  #endif /* SELFTEST_KVM_PROCESSOR_H */
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index a18db6a7b3cf..666438113d22 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -932,4 +932,13 @@ void kvm_selftest_arch_init(void);
>  
>  void kvm_arch_vm_post_create(struct kvm_vm *vm);
>  
> +void vm_init_vector_tables(struct kvm_vm *vm);
> +void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
> +
> +struct ex_regs;
> +typedef void(*exception_handler_fn)(struct ex_regs *);
> +void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handler_fn handler);

I think something happend on rebase since the above should be in a
different patch (and were for v3). I suggest checking your previous
and current version branches with git-range-diff after rebasing in
order to catch stuff like this.

Thanks,
drew

> +
> +uint32_t guest_get_vcpuid(void);
> +
>  #endif /* SELFTEST_KVM_UTIL_BASE_H */
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index efd9ac4b0198..39a1e9902dec 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -316,6 +316,9 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
>  	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.sp), stack_vaddr + stack_size);
>  	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
>  
> +	/* Setup sscratch for guest_get_vcpuid() */
> +	vcpu_set_reg(vcpu, RISCV_CSR_REG(sscratch), vcpu_id);
> +
>  	/* Setup default exception vector of guest */
>  	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
>  
> @@ -436,3 +439,8 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
>  
>  	handlers->exception_handlers[1][0] = handler;
>  }
> +
> +uint32_t guest_get_vcpuid(void)
> +{
> +	return csr_read(CSR_SSCRATCH);
> +}
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
