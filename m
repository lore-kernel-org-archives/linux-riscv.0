Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8C3C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKdPPXVCMwZvfnvdx8ZGcTs/4wYeNLl8OWRF55cApeg=; b=HZbG/vEn7G5HId
	4QFfknWN491G44efZ5mnxbM08YpH9yweChbXG/Cvih1TWVkMGeXawGSUyBTNKJQpREg4czpNKs+Go
	VHs+G7YHtVkzTSgTMWoNvUCYa2D8QbwenLILJP9fEt09fmZCTr1B7p9xz4wIJCagpDQ4G0XsuOkyk
	9ybUEp8OOv4iH8zqVZUPYCSyxiiKQxOgL6UyNN5lOrPGB4GF3mkdoVKVi0J4Ji4uNeRrf0n3DYJV2
	fPl/RtEh7E4LKA+BndaXiUJKS+6ezBSVR3fMM/0BG+5Ii8ai2x86oopMBds39to4jOaujBZtI/xPv
	BQaaHleN0KzpEzM1vYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexkR-0000000DB3M-23n9;
	Fri, 16 Aug 2024 14:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexjm-0000000DAu8-417F;
	Fri, 16 Aug 2024 14:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7A2U5jBb4fa8wsHitP/PsHDQN4o/IfPfOJr2WRbJDxI=; b=lRbomYLSV54AcMEUe1+LFzTdB8
	uYPzCgclleabI+esVEaLIBleSfR8Wq+CekppE0VM0jzDbz1TzhBj3cFyVFmYJErkA/n7zY7vdz8vH
	7hQ0wnc322zafqA8ZUJ9NDneWB/PCXtNOCcwTdRvXX6hMsCkcDmge7/Xhj39URdFgEYfxwofc10Q1
	swibqJ66LkCOFaEp6E+5Xgp8Zh8S9S38towEwZY6lmMqLKWek2JkFNlXsUYOSdLj7SBOtM0tQMkWf
	JcOxSE75xlyleWmxczIZOccEIiUu5DWCTG5lVApn+bbstR14iBCTMkCcDXKvKAA667bYcAnuHm1Ib
	QMK0HzGA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sexjj-00000008gQF-3IL2;
	Fri, 16 Aug 2024 14:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86B8162201;
	Fri, 16 Aug 2024 14:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB462C32782;
	Fri, 16 Aug 2024 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723817723;
	bh=Vz/Wd2ZHxd37E7Z0jSyjIj1PL80f2VReLdIf3pbBvs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JxVO7wAtRgR3wjIOsJUIjXS2USfhU7zrVsQm/fbKiR8FAWdQgsH64NTt9c+ih7wP+
	 2Z/pzjMIJyO642Ql97Q0NCnFMlw4ZezSUjP4I+QLOOvzWJ2cftmh5LiHoPu1ZmCgQT
	 jylgxGPKmN05Qy5EVkQGFATEvXd5MjadYxB5SC5YqHY82zxZzUENZIIjq6CyGowaiq
	 wp88L/pVHpgwDYmlrOhaaZ4U5jgLPl/75SlAnmwnieaKsjlXzU9UcosG+sZbdVwqU2
	 r4YzyaIq+wVNKDJrfAq4FnDKN32n3O0Fz0SXI6oRbbfpmWl2fopnM1N1exUamVEiHi
	 hixkCwa4jfzVA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sexjc-004IRp-BE;
	Fri, 16 Aug 2024 15:15:20 +0100
Date: Fri, 16 Aug 2024 15:15:19 +0100
Message-ID: <86h6bkzh8o.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 14/40] KVM: arm64: Manage GCS access and registers for guests
In-Reply-To: <20240801-arm64-gcs-v10-14-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
	<20240801-arm64-gcs-v10-14-699e2bd2190b@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: broonie@kernel.org, catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net, akpm@linux-foundation.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, arnd@arndb.de, oleg@redhat.com, ebiederm@xmission.com, shuah@kernel.org, rick.p.edgecombe@intel.com, debug@rivosinc.com, ardb@kernel.org, Szabolcs.Nagy@arm.com, kees@kernel.org, hjl.tools@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, fweimer@redhat.com, brauner@kernel.org, thiago.bauermann@linaro.org, ross.burton@arm.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_151528_161360_C073283B 
X-CRM114-Status: GOOD (  32.68  )
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

On Thu, 01 Aug 2024 13:06:41 +0100,
Mark Brown <broonie@kernel.org> wrote:
> 
> GCS introduces a number of system registers for EL1 and EL0, on systems
> with GCS we need to context switch them and expose them to VMMs to allow
> guests to use GCS.
> 
> In order to allow guests to use GCS we also need to configure
> HCRX_EL2.GCSEn, if this is not set GCS instructions will be noops and
> CHKFEAT will report GCS as disabled.  Also enable fine grained traps for
> access to the GCS registers by guests which do not have the feature
> enabled.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h          |  8 +++++
>  arch/arm64/include/asm/vncr_mapping.h      |  2 ++
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 49 ++++++++++++++++++++++++------
>  arch/arm64/kvm/sys_regs.c                  | 12 ++++++++
>  4 files changed, 61 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index a33f5996ca9f..5818e4a1c2d1 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -446,6 +446,10 @@ enum vcpu_sysreg {
>  	GCR_EL1,	/* Tag Control Register */
>  	TFSRE0_EL1,	/* Tag Fault Status Register (EL0) */
>  
> +	/* Guarded Control Stack registers */
> +	GCSCRE0_EL1,	/* Guarded Control Stack Control (EL0) */
> +	GCSPR_EL0,	/* Guarded Control Stack Pointer (EL0) */
> +
>  	/* 32bit specific registers. */
>  	DACR32_EL2,	/* Domain Access Control Register */
>  	IFSR32_EL2,	/* Instruction Fault Status Register */
> @@ -517,6 +521,10 @@ enum vcpu_sysreg {
>  	VNCR(PIR_EL1),	 /* Permission Indirection Register 1 (EL1) */
>  	VNCR(PIRE0_EL1), /*  Permission Indirection Register 0 (EL1) */
>  
> +	/* Guarded Control Stack registers */
> +	VNCR(GCSPR_EL1),	/* Guarded Control Stack Pointer (EL1) */
> +	VNCR(GCSCR_EL1),	/* Guarded Control Stack Control (EL1) */
> +
>  	VNCR(HFGRTR_EL2),
>  	VNCR(HFGWTR_EL2),
>  	VNCR(HFGITR_EL2),
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index df2c47c55972..5e83e6f579fd 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -88,6 +88,8 @@
>  #define VNCR_PMSIRR_EL1         0x840
>  #define VNCR_PMSLATFR_EL1       0x848
>  #define VNCR_TRFCR_EL1          0x880
> +#define VNCR_GCSPR_EL1		0x8C0
> +#define VNCR_GCSCR_EL1		0x8D0
>  #define VNCR_MPAM1_EL1          0x900
>  #define VNCR_MPAMHCR_EL2        0x930
>  #define VNCR_MPAMVPMV_EL2       0x938
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index 4c0fdabaf8ae..ac29352e225a 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -16,6 +16,27 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>  
> +static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> +
> +	if (!vcpu)
> +		vcpu = container_of(ctxt, struct kvm_vcpu, arch.ctxt);
> +
> +	return vcpu;
> +}
> +
> +static inline bool ctxt_has_gcs(struct kvm_cpu_context *ctxt)
> +{
> +	struct kvm_vcpu *vcpu;
> +
> +	if (!cpus_have_final_cap(ARM64_HAS_GCS))
> +		return false;
> +
> +	vcpu = ctxt_to_vcpu(ctxt);
> +	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64PFR1_EL1, GCS, IMP);
> +}
> +
>  static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, MDSCR_EL1)	= read_sysreg(mdscr_el1);
> @@ -25,16 +46,10 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	ctxt_sys_reg(ctxt, TPIDR_EL0)	= read_sysreg(tpidr_el0);
>  	ctxt_sys_reg(ctxt, TPIDRRO_EL0)	= read_sysreg(tpidrro_el0);
> -}
> -
> -static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
> -{
> -	struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> -
> -	if (!vcpu)
> -		vcpu = container_of(ctxt, struct kvm_vcpu, arch.ctxt);
> -
> -	return vcpu;
> +	if (ctxt_has_gcs(ctxt)) {
> +		ctxt_sys_reg(ctxt, GCSPR_EL0) = read_sysreg_s(SYS_GCSPR_EL0);
> +		ctxt_sys_reg(ctxt, GCSCRE0_EL1)	= read_sysreg_s(SYS_GCSCRE0_EL1);
> +	}
>  }
>  
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
> @@ -79,6 +94,10 @@ static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  		if (ctxt_has_s1pie(ctxt)) {
>  			ctxt_sys_reg(ctxt, PIR_EL1)	= read_sysreg_el1(SYS_PIR);
>  			ctxt_sys_reg(ctxt, PIRE0_EL1)	= read_sysreg_el1(SYS_PIRE0);
> +			if (ctxt_has_gcs(ctxt)) {
> +				ctxt_sys_reg(ctxt, GCSPR_EL1)	= read_sysreg_el1(SYS_GCSPR);
> +				ctxt_sys_reg(ctxt, GCSCR_EL1)	= read_sysreg_el1(SYS_GCSCR);
> +			}
>  		}
>  	}
>  	ctxt_sys_reg(ctxt, ESR_EL1)	= read_sysreg_el1(SYS_ESR);
> @@ -126,6 +145,11 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),	tpidr_el0);
>  	write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),	tpidrro_el0);
> +	if (ctxt_has_gcs(ctxt)) {
> +		write_sysreg_s(ctxt_sys_reg(ctxt, GCSPR_EL0), SYS_GCSPR_EL0);
> +		write_sysreg_s(ctxt_sys_reg(ctxt, GCSCRE0_EL1),
> +			       SYS_GCSCRE0_EL1);
> +	}
>  }
>  
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
> @@ -157,6 +181,11 @@ static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt)
>  		if (ctxt_has_s1pie(ctxt)) {
>  			write_sysreg_el1(ctxt_sys_reg(ctxt, PIR_EL1),	SYS_PIR);
>  			write_sysreg_el1(ctxt_sys_reg(ctxt, PIRE0_EL1),	SYS_PIRE0);
> +
> +			if (ctxt_has_gcs(ctxt)) {
> +				write_sysreg_el1(ctxt_sys_reg(ctxt, GCSPR_EL1),	SYS_GCSPR);
> +				write_sysreg_el1(ctxt_sys_reg(ctxt, GCSCR_EL1),	SYS_GCSCR);
> +			}
>  		}
>  	}
>  	write_sysreg_el1(ctxt_sys_reg(ctxt, ESR_EL1),	SYS_ESR);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index c90324060436..ac98d3237130 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2446,6 +2446,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  	PTRAUTH_KEY(APDB),
>  	PTRAUTH_KEY(APGA),
>  
> +	{ SYS_DESC(SYS_GCSCR_EL1), NULL, reset_val, GCSCR_EL1, 0 },
> +	{ SYS_DESC(SYS_GCSPR_EL1), NULL, reset_unknown, GCSPR_EL1 },
> +	{ SYS_DESC(SYS_GCSCRE0_EL1), NULL, reset_val, GCSCRE0_EL1, 0 },
> +

Global visibility for these registers? Why should we expose them to
userspace if the feature is neither present nor configured?

>  	{ SYS_DESC(SYS_SPSR_EL1), access_spsr},
>  	{ SYS_DESC(SYS_ELR_EL1), access_elr},
>  
> @@ -2535,6 +2539,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>  			     CTR_EL0_IDC_MASK |
>  			     CTR_EL0_DminLine_MASK |
>  			     CTR_EL0_IminLine_MASK),
> +	{ SYS_DESC(SYS_GCSPR_EL0), NULL, reset_unknown, GCSPR_EL0 },
>  	{ SYS_DESC(SYS_SVCR), undef_access },
>  
>  	{ PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
> @@ -4560,6 +4565,9 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
>  
>  		if (kvm_has_feat(kvm, ID_AA64MMFR3_EL1, TCRX, IMP))
>  			vcpu->arch.hcrx_el2 |= HCRX_EL2_TCR2En;
> +
> +		if (kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP))
> +			vcpu->arch.hcrx_el2 |= HCRX_EL2_GCSEn;
>  	}
>  
>  	if (test_bit(KVM_ARCH_FLAG_FGU_INITIALIZED, &kvm->arch.flags))
> @@ -4604,6 +4612,10 @@ void kvm_calculate_traps(struct kvm_vcpu *vcpu)
>  		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nPIRE0_EL1 |
>  						HFGxTR_EL2_nPIR_EL1);
>  
> +	if (!kvm_has_feat(kvm, ID_AA64PFR1_EL1, GCS, IMP))
> +		kvm->arch.fgu[HFGxTR_GROUP] |= (HFGxTR_EL2_nGCS_EL0 |
> +						HFGxTR_EL2_nGCS_EL1);

How can this work if you don't handle ID_AA64PFR_EL1 being written to?
You are exposing GCS to all guests without giving the VMM an
opportunity to turn it off. This breaks A->B->A migration, which is
not acceptable.

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
