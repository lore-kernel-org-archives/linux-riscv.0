Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18C7C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jun 2022 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5B1LH0bs03pBJ8qzXHY89N9STtLxcnbAfBWrNHcvJw=; b=f4jR3MB49LKMr6
	BA0OO2WuvO1+JA78ilAcDNUuVXHNeLTWrWD8b67a6PR/DtnKIFo/UhW1HlScBcTpSlRmKYbSm/Oo1
	c6cGGBM7wHKcBPImQkZDYn8qnrFxwwJAQY17eE0kmPerhK+lRx1/P7Ib3Ti3wEQ/1wGsjKOCuaT3c
	bNbEHywXfIuG4t1/SDoROFyUKwsFkUfvMNONpAAagdbvB2nuP2W0Sv9K2dQ8jJfzHvbZ7aJUzmvAF
	2huFePMqjQ3OtgPbSIIYN85JDJt5nBHC/uQmO7SsokJgS50YHt/Vb7bOTIIHMS8PmhEGPXoshlj+I
	9A0XxMON8h2xc6eIP7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0PV4-00Gw3u-1d; Sun, 12 Jun 2022 15:27:38 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0PV0-00Gvzk-Ao; Sun, 12 Jun 2022 15:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655047654; x=1686583654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K9OFPqxGEwRGtxLzZ1331X/UMwPNJzjvhOLMaQmmGI4=;
  b=Xm7CtavjAj0kCzqlohvWwQqtHK5aSxuKnMZQC6n28ghWWkSQ+ncVWoBU
   H3UeE46gAtBxyxkyaV2efi4Y9twDjul2BXoFBcJW4+v1z7Rp2NX9hHLfF
   pn26nv9mALY46nP0eti0n+GcX6XxASanAQBCBYQV/ODJGzSBH9UKbouMx
   8knjTU5AJi9/nxwMvR37XcFyIBViovv7yVnbe5X6JrTQ+cpcCNfBdaana
   eK255wH8D8UeVQDINkhDxitFkx23IZdEhZ7dhKUvOUJxplyE1gGwe1CQb
   DsqBR7E9z16jlEEMC/ZgvxuY6EiSlv1U8fqMETsmB72LX+z2EoWGQwAz+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="279127710"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="279127710"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 08:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="685585081"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.132])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2022 08:27:26 -0700
Date: Sun, 12 Jun 2022 23:31:13 +0800
From: Liu Zhao <zhao1.liu@linux.intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	=?gb2312?B?o6w=?= Zhao Liu <zhao1.liu@linux.intel.com>,
	Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction
 emulation framework
Message-ID: <20220612153113.GA52224@liuzhao-OptiPlex-7080>
References: <20220610050555.288251-1-apatel@ventanamicro.com>
 <20220610050555.288251-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610050555.288251-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_082734_500133_2294B742 
X-CRM114-Status: GOOD (  28.29  )
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

On Fri, Jun 10, 2022 at 10:35:54AM +0530, Anup Patel wrote:
> Date: Fri, 10 Jun 2022 10:35:54 +0530
> From: Anup Patel <apatel@ventanamicro.com>
> Subject: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction
>  emulation framework
> X-Mailer: git-send-email 2.34.1
> 
> We will be emulating more system instructions in near future with
> upcoming AIA, PMU, Nested and other virtualization features.
> 
> To accommodate above, we add an extensible system instruction emulation
> framework in vcpu_insn.c.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_insn.h |  9 +++
>  arch/riscv/kvm/vcpu_insn.c             | 82 +++++++++++++++++++++++---
>  2 files changed, 82 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
> index 4e3ba4e84d0f..3351eb61a251 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_insn.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
> @@ -18,6 +18,15 @@ struct kvm_mmio_decode {
>  	int return_handled;
>  };
>  
> +/* Return values used by function emulating a particular instruction */
> +enum kvm_insn_return {
> +	KVM_INSN_EXIT_TO_USER_SPACE = 0,
> +	KVM_INSN_CONTINUE_NEXT_SEPC,
> +	KVM_INSN_CONTINUE_SAME_SEPC,
> +	KVM_INSN_ILLEGAL_TRAP,
> +	KVM_INSN_VIRTUAL_TRAP
> +};
> +
>  void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
>  int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  				struct kvm_cpu_trap *trap);
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index be756879c2ee..75ca62a7fba5 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -118,8 +118,24 @@
>  				 (s32)(((insn) >> 7) & 0x1f))
>  #define MASK_FUNCT3		0x7000
>  
> -static int truly_illegal_insn(struct kvm_vcpu *vcpu,
> -			      struct kvm_run *run,
> +struct insn_func {
> +	unsigned long mask;
> +	unsigned long match;
> +	/*
> +	 * Possible return values are as follows:
> +	 * 1) Returns < 0 for error case
> +	 * 2) Returns 0 for exit to user-space
> +	 * 3) Returns 1 to continue with next sepc
> +	 * 4) Returns 2 to continue with same sepc
> +	 * 5) Returns 3 to inject illegal instruction trap and continue
> +	 * 6) Returns 4 to inject virtual instruction trap and continue
> +	 *
> +	 * Use enum kvm_insn_return for return values
> +	 */
> +	int (*func)(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn);
> +};
> +
> +static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			      ulong insn)
>  {
>  	struct kvm_cpu_trap utrap = { 0 };
> @@ -128,6 +144,24 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
>  	utrap.sepc = vcpu->arch.guest_context.sepc;
>  	utrap.scause = EXC_INST_ILLEGAL;
>  	utrap.stval = insn;
> +	utrap.htval = 0;
> +	utrap.htinst = 0;
> +	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
> +
> +	return 1;
> +}
> +
> +static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +			      ulong insn)
> +{
> +	struct kvm_cpu_trap utrap = { 0 };
> +
> +	/* Redirect trap to Guest VCPU */
> +	utrap.sepc = vcpu->arch.guest_context.sepc;
> +	utrap.scause = EXC_VIRTUAL_INST_FAULT;
> +	utrap.stval = insn;
> +	utrap.htval = 0;
> +	utrap.htinst = 0;
>  	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>  
>  	return 1;
> @@ -148,18 +182,48 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> -static int system_opcode_insn(struct kvm_vcpu *vcpu,
> -			      struct kvm_run *run,
> +static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
> +{
> +	vcpu->stat.wfi_exit_stat++;
> +	kvm_riscv_vcpu_wfi(vcpu);
> +	return KVM_INSN_CONTINUE_NEXT_SEPC;
> +}
> +
> +static const struct insn_func system_opcode_funcs[] = {
> +	{
> +		.mask  = INSN_MASK_WFI,
> +		.match = INSN_MATCH_WFI,
> +		.func  = wfi_insn,
> +	},
> +};
> +
> +static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			      ulong insn)
>  {
> -	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
> -		vcpu->stat.wfi_exit_stat++;
> -		kvm_riscv_vcpu_wfi(vcpu);
> +	int i, rc = KVM_INSN_ILLEGAL_TRAP;
> +	const struct insn_func *ifn;
> +
> +	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
> +		ifn = &system_opcode_funcs[i];
> +		if ((insn & ifn->mask) == ifn->match) {
> +			rc = ifn->func(vcpu, run, insn);
> +			break;
> +		}
> +	}
> +
> +	switch (rc) {
> +	case KVM_INSN_ILLEGAL_TRAP:
> +		return truly_illegal_insn(vcpu, run, insn);
> +	case KVM_INSN_VIRTUAL_TRAP:
> +		return truly_virtual_insn(vcpu, run, insn);
> +	case KVM_INSN_CONTINUE_NEXT_SEPC:
>  		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
> -		return 1;
> +		break;

Hi Anup,
What about adding KVM_INSN_CONTINUE_SAME_SEPC and KVM_INSN_EXIT_TO_USER_SPACE
cases here and set rc to 1?
This is the explicit indication that both cases are handled.

> +	default:
> +		break;
>  	}
>  
> -	return truly_illegal_insn(vcpu, run, insn);
> +	return (rc <= 0) ? rc : 1;
>  }
>  
>  /**
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
