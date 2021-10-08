Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEEFC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 15:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B68E60F93
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 15:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B68E60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jSomtSvqFzLnkAy+AhoOh0EYCm27JY5gkrpLJja5VCo=; b=jl2yVTiXjdkb3g
	O0knwFyvKlsI3pN/fWSFWDkvSkrj7F1LgbkqsCwv3X34FL49F4Qp9GhHxIvU8JI+G4md6Rm7Up7Pa
	+g7XhjakahkyADkGEAUbSidIk6W7WWjt56JOtoMrzYvAeiHRjLkxH6q6tlSPRCal6J4Hmp9pcHqmN
	n0conlsu1gfR0sn6gHptOJw2e6t4gWax+ZKsy2Trlz9pU8VZHSzLZUt8YA5ijTSHbOrsmDC/wcVyY
	vQxq1OD7bzfZvkWNnz6iXpoZkS2eUen6zfHDi+X1mbw3lVgqPUbqAiHkJOCqUpwG45gJ8ocDwKQbY
	euRi7Y3VJXDj233OsV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYrO6-003Bnu-F8; Fri, 08 Oct 2021 15:02:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYrO3-003Blb-Mj
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 15:02:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q19so8000423pfl.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b5kFCA4Sqv5n1pkMZ9QWFD00Hw1HCcSsDCNRLCbAoi4=;
 b=O09XgIIyJxGU1JScsnBpGbcucFHriU2sIXhS13J3MwOvptL4vOdqESyqdeY4KUw7c2
 MMCAZGmdxruj+jlMyfWBWm2YDYx8R9Hq8C0VwUIt6fJ0LWv8SEPYp6XUH55p2Tiynufm
 NG/krSNN0zkCIlY2oykqsGdbvuogk+N5ah4Xb8MYlcaP1H/EL/UiPVyTKBf3KJnJbzUy
 PHCKWLsQpiMUE0wtFC19oWJJqWG8h1sUD+INjQfl2RUgKACZaws64IoZjqGWbnr1cQDh
 RkHcZv+50y80LGArbSBEY/dBemW55lPLyJ8jFMHzApxIiVKSYjMT+wPs/+1RYTXpW7Z/
 PeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b5kFCA4Sqv5n1pkMZ9QWFD00Hw1HCcSsDCNRLCbAoi4=;
 b=L1fVMv4OCEr6/1DKaPQkIij+QoGO3gTbzTZrgecebNobkWQwDFrLZ4rjCjvkiitU31
 8W3hMFSoQXY5TYO3D3rMXwRgdFxcFxGASexHBbZAj37zONSbWspU0iE4mpGVuvFufbBy
 iI2Z4uv/1J1JcEzw8+oxGN9Z2gGPpFHiQ/PFbMovCwRahR2Y2BsjAZyT9vBedc5/Y5tH
 eFf+8nEM7AeRA4GXLlKdSXpWApVSLPi62Tnu2BZ+5Q0q1AAhvaGcR/i21rHuBG/olmeF
 tqhrsNfyT0Vyl+D4j3SrbfwwVZ2aMEEbP1f3Kb9YD0g7X7hQZ98h8+Cu2GAcrJj6IWtB
 cBSg==
X-Gm-Message-State: AOAM530IbYkDVJNZcxcRiMqC9qnMBGFoDs98yjn9oc9GIHqR8twg1nyQ
 EYRC1yNjR5w/4YJ+R5H+hEi+vg==
X-Google-Smtp-Source: ABdhPJzQztT1vkshWbvA2jei1IGYww+ulxT3Z83ojh7KiFGMvo+cG5AF5glXll1PBSYxOr4R5LyFrQ==
X-Received: by 2002:a63:e10d:: with SMTP id z13mr5055836pgh.375.1633705328605; 
 Fri, 08 Oct 2021 08:02:08 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id e8sm3167677pfn.45.2021.10.08.08.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:02:08 -0700 (PDT)
Date: Fri, 8 Oct 2021 15:02:04 +0000
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anup Patel <anup.patel@wdc.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH v3 5/5] RISC-V: Add SBI HSM extension in KVM
Message-ID: <YWBdbCNQdikbhhBq@google.com>
References: <20211008032036.2201971-1-atish.patra@wdc.com>
 <20211008032036.2201971-6-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211008032036.2201971-6-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_080215_753702_72F45225 
X-CRM114-Status: GOOD (  26.42  )
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

On Thu, Oct 07, 2021, Atish Patra wrote:
> SBI HSM extension allows OS to start/stop harts any time. It also allows
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..278b4d643e1b 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -133,6 +133,13 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>  	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
>  	struct kvm_cpu_context *reset_cntx = &vcpu->arch.guest_reset_context;
> +	bool loaded;
> +
> +	/* Disable preemption to avoid race with preempt notifiers */

Stating what the code literally does is not a helpful comment, as it doesn't
help the reader understand _why_ preemption needs to be disabled.

> +	preempt_disable();
> +	loaded = (vcpu->cpu != -1);
> +	if (loaded)
> +		kvm_arch_vcpu_put(vcpu);

Oof.  Looks like this pattern was taken from arm64.  Is there really no better
approach to handling this?  I don't see anything in kvm_riscv_reset_vcpu() that
will obviously break if the vCPU is loaded.  If the goal is purely to effect a
CSR reset via kvm_arch_vcpu_load(), then why not just factor out a helper to do
exactly that?

>  
>  	memcpy(csr, reset_csr, sizeof(*csr));
>  
> @@ -144,6 +151,11 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  
>  	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
>  	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
> +
> +	/* Reset the guest CSRs for hotplug usecase */
> +	if (loaded)
> +		kvm_arch_vcpu_load(vcpu, smp_processor_id());

If the preempt shenanigans really have to stay, at least use get_cpu()/put_cpu().

> +	preempt_enable();
>  }
>  
>  int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
> @@ -180,6 +192,13 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  
>  void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>  {
> +	/**
> +	 * vcpu with id 0 is the designated boot cpu.
> +	 * Keep all vcpus with non-zero cpu id in power-off state so that they
> +	 * can brought to online using SBI HSM extension.
> +	 */
> +	if (vcpu->vcpu_idx != 0)
> +		kvm_riscv_vcpu_power_off(vcpu);

Why do this in postcreate?

>  }
>  
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index dadee5e61a46..db54ef21168b 100644

...

> +static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_cpu_context *reset_cntx;
> +	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
> +	struct kvm_vcpu *target_vcpu;
> +	unsigned long target_vcpuid = cp->a0;
> +
> +	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
> +	if (!target_vcpu)
> +		return -EINVAL;
> +	if (!target_vcpu->arch.power_off)
> +		return -EALREADY;
> +
> +	reset_cntx = &target_vcpu->arch.guest_reset_context;
> +	/* start address */
> +	reset_cntx->sepc = cp->a1;
> +	/* target vcpu id to start */
> +	reset_cntx->a0 = target_vcpuid;
> +	/* private data passed from kernel */
> +	reset_cntx->a1 = cp->a2;
> +	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
> +
> +	/* Make sure that the reset request is enqueued before power on */
> +	smp_wmb();

What does this pair with?  I suspect nothing, because AFAICT the code was taken
from arm64.

arm64 has the smp_wmb() in kvm_psci_vcpu_on() to ensure that the vCPU sees the
request if the vCPU sees the change in vcpu->arch.power_off, and so has a
smp_rmb() in kvm_reset_vcpu().

Side topic, how much of arm64 and RISC-V is this similar?  Would it make sense
to find some way for them to share code?

> +	kvm_riscv_vcpu_power_on(target_vcpu);
> +
> +	return 0;
> +}
> +
> +static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
> +{
> +	if ((!vcpu) || (vcpu->arch.power_off))

Too many parentheses, and the NULL vCPU check is unnecessary.

> +		return -EINVAL;
> +
> +	kvm_riscv_vcpu_power_off(vcpu);
> +
> +	return 0;
> +}
> +

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
