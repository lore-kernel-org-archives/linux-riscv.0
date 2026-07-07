Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7372AC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 02:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Y37xRl2vgZu+Mg70ZecrToHNhkC0agrNrKaXgCSTag=; b=kpeqThFUzI0K3I
	2gURWDovXhqd67UFWottG5UB6uKDs+f/T6xrUbbyyaukyU7Gj16weRtwewxLK41hjBaYAqFti3vR3
	PktNYB9WMeGoBXhdfq/Xs63skoTmE69l3BzgcbLwfNjHJ0yUeIc1Uhip5F4sCiOBtXn3Zd+I6hwGu
	pFsMy6SbY0aNTkA3QtVYMG1PFDRzyL7/Cx+y/ttbwbYxEw9qaUXFjtJq+E9qAS6+Ha+JJ/P/+dO+3
	evq6E1BBXi/pr7v/VCUqNOcuXLO1C/qC3kH+33syONJDlFnA42Od6YzvoOdJyPYZQOUFV9RNNGRiF
	qR+3KD4Fur5RJs5D1wKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvpm-0000000DxLS-1u10;
	Tue, 07 Jul 2026 02:46:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvpj-0000000DxKi-3klR
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 02:46:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cacd69a9c0so31182315ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jul 2026 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783392410; x=1783997210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=i9g2H85BeGPj9TDwT9OofetdT89vG9VS/IPjJq1t0xkM6JM7o9q57tBxtkNhISBYt/
         nB2X/PI6ljNkrB011b3xD8+tOlxm66+wGs2YoS2W6anjxo9PinrDPb4dmLiyJ3D5NnLs
         Yv8fWCIo6L/aB7Q9LwAuynm1NKD4tGnRgvyD0oUrQynb1nVzJSllsO0CgbfW6+Lt2Vds
         wcxDiz3JIyXEKVEKqLaSuU8yLHaXGOg40LsUfylK9gOHDVXogIEHlhfdbEeUUSpa/izS
         jRA2AOjCoCArzgFbx8FTsQytBdZA7w7dDJ41yK0ActZ6R1suPxcY2vmAkGlW/8y3PVFv
         OQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783392410; x=1783997210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=eHnLDSIwSv4fAs+Oq0IAD34pevlSckSlxHnLeRc1tK17/5LrJ+NEoN5kfXcx2OcKUC
         xBwwIMaKcaHszb63AX5W5chWZqVroU94B8wXhm0UvtUwWePAR8uHOBFKtMI3ftNBh6DP
         MPsBRnf/xDsWPSEpyoIeTCPDl35Z+x3eifSdLjjWHxdQN7XfpyGATfWnLysNP/nOXSEj
         sD0QVnPkBvaQ7/BAuvJ53SQ0vUZDzWfFYXwmO1WLtoCUek1/Lp6VKPZ/xm1rbaALHEhJ
         5Wb2yuWLQGG8bj4QRZjavDTXeyfG1E7upLfoUJ6xoCcNGqEyoD+APC/iRTMnZ/MHZ/Ph
         ESDw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6KFogyC9Vau9HCllH1xIRGgYBk9R6AuUqXI9BYlUHbmDVogDHHks3nL+JQfLrPlGCSKXRzel6Cf3iQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpKr3OTtjGpsQ8IMRWC/codcUAHXnmgjnOSP6r7PdChWMd7htO
	fUptwRXtwYsF+yro/p8kC5pyojbcUeb9t3aenUNoNkw0H6MwIaCs5XEV
X-Gm-Gg: AfdE7ckthK2ApMEalQAbgAJlseCqeYcHbF3HpJK3AiYe5W3A+KNxHun1GJYwUqvn0mL
	8A7Qe5rcLCSfM9ka6+dsWfOqx2hO0/hv9fdbbGsi9Cq3faiZZLxCH2stLel0Lggqr2GfAFfiE5M
	klqZ8qQUkk01fYzJh1QJ/NQyPLMN+27X0wEauvyqYnIEgjD/wH0vUqGfi3WTGiSQofYFT/j+GoI
	sGf48EqROeV8FYQAJR4MKXcMWWH+6uE018XkztI8J/7Opixbugv97bF7UoaGQ14rrKKJeOIdNUw
	kABVz3opmHedgUW6UKRr+c+Vu6uMevQ/bIkdyi2Swi2kMU0h1a1b3h4mbbHdWY0U12Cd30I+AXN
	E4IucPSV6qXTTDOLccBaDgeez6bCrCBGibDa80orHhKFc4EUsqlXCaZieINjtqZlD
X-Received: by 2002:a17:903:1a0e:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2ccbe618242mr29826855ad.20.1783392410361;
        Mon, 06 Jul 2026 19:46:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm3388815ad.30.2026.07.06.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 19:46:49 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Deepak Gupta <debug@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Message-ID: <akxm_sT7R9u4OIXo@inochi.infowork>
References: <20260706022046.214956-1-inochiama@gmail.com>
 <20260706022046.214956-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706022046.214956-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_194651_945134_36D08716 
X-CRM114-Status: GOOD (  28.43  )
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

On Mon, Jul 06, 2026 at 10:20:37AM +0800, Inochi Amaoto wrote:
> Hardware updating of PTE A/D bits is controlled through ADUE bit in
> henvcfg Expose the feature only if both Svadu and Svade are supported
> for VS-mode.
> 
> Allow the VMM to enable/disable this feature by change the ISA
> extension state in the guest.
> 
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c    | 77 +++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 504e73305343..7bbea8812d92 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
>  struct kvm_riscv_sbi_fwft {
>  	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
>  	struct kvm_riscv_sbi_fwft_feature pointer_masking;
> +	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
>  };
>  
>  /* If you need to interpret the index values, here is the key: */
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index ab39ac464ffd..01db40b53295 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -11,6 +11,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/cpufeature.h>
>  #include <asm/sbi.h>
> +#include <asm/kvm_nacl.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  
> @@ -94,6 +95,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>  	return false;
>  }
>  
> +static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
> +					       u64 flag)
> +{
> +	vcpu->arch.cfg.henvcfg &= ~flag;
> +}
> +
> +static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long value, u64 flag)
> +{
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
> +
> +	if (value == 0)
> +		cfg->henvcfg &= ~flag;
> +	else if (value == 1)
> +		cfg->henvcfg |= flag;
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if (!one_reg_access) {
> +		ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			ncsr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
> +	}
> +
> +	return SBI_SUCCESS;
> +}
> +

Hi, Anup,

The sashiko bot point out calling NACL helper is not safe here as
preemption is not allowed when calling this_cpu_ptr() and it is 
used by the NACL helper. Since I have no idea about how to fix it,
is it acceptable to use csr read/write directly here as other FWFT
feature?

Regards,
Inochi


The original reply from the bot is 

Is it safe to call ncsr_write() here without preemption disabled?

KVM handles SBI ecalls with preemption enabled. The ncsr_write() macro
evaluates nacl_shmem(), which relies on this_cpu_ptr(). Using this_cpu_ptr()
with preemption enabled will trigger a CONFIG_DEBUG_PREEMPT warning.

Could the thread be migrated to another CPU after computing the pointer but
before writing to it, resulting in per-CPU memory corruption by writing to
the NACL shared memory of another physical CPU?

Additionally, when NACL is disabled, it falls back to csr_write(), which
writes directly to the physical CPU's host CSRs (CSR_HENVCFG). Could this
leave the host with modified hardware state if the vCPU thread migrates?


> +static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long *value, u64 flag)
> +{
> +	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
>  {
>  	return misaligned_traps_can_delegate();
> @@ -137,6 +177,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
>  	return SBI_SUCCESS;
>  }
>  
> +static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
> +{
> +	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
> +		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
> +}
> +
> +static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
> +		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long value)
> +{
> +	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long *value)
> +{
> +	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
>  #ifndef CONFIG_32BIT
>  
>  static bool try_to_set_pmm(unsigned long value)
> @@ -246,6 +314,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  		.set = kvm_sbi_fwft_set_misaligned_delegation,
>  		.get = kvm_sbi_fwft_get_misaligned_delegation,
>  	},
> +	{
> +		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
> +		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
> +				 sizeof(unsigned long),
> +		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
> +		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
> +		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
> +		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
> +	},
>  #ifndef CONFIG_32BIT
>  	{
>  		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
> -- 
> 2.55.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
