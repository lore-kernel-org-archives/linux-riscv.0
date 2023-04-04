Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD0C7EE25
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 12:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIMzm7Dt+ZhCkqiSLTOOo6rkTb4BgcrbxFSEbMZueXg=; b=nuMA/MhHhdpqBv
	xawunlgbx2RTV/f/fAN3rZnybZEpgOwG8Vl6UVND8ZRboc3oelsfuZeYBvntEmGhyEOISO/gXLr6I
	h5icv07KGB1IpDC+eSSHMZODhiojwfIf80GfaDpbQmrHyA3Jt/y5YZLKQU6eAsNbcccZ9xc/3+Vmq
	sDV/SUz9yP5nZgKyXXgjnHcHzgPSBNJ6E3nrmb5DFNs3CfDpFPvsZEDQisRbiEtUhIkFyZ4495VWY
	BhEgx+wjsQ+bgZv8miAFfuuN5rdiojZ9KA6VDJcyhGAdCH50lyiqp+T+dq5qXJcMew/+Y6QyCMsN8
	1g9JyY1oj3BRdmaipJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg2D-001KPR-0y;
	Tue, 04 Apr 2023 12:45:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjg26-001KE5-1k
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 12:45:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o32so18935393wms.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680612302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MXMBkctdCNamTY4/FVKOjXwTK55nCk5S+UOpQBzIuNY=;
        b=cQK6SQigMrU5ZclT/SAzDUDNUx7G+zulB7wTJ18ksnSdps9RLER9IzWTcQaLyZTRG3
         c07CwbGg+ztxGesd6k6dP1i+nUPMRAdlhgJmDWQwAQJrpUMtCGtjWmWAE9qIkoG/aOrU
         s+0EYX+UIPAvhKlv9WxVpZMBIDlygJuIGNiciBrJRkQNHGhQShp6n6pItSYgFSSzFCzP
         CBPV2utCFiUo8agmfHcvCe4JXCOhLBOhqbLbbrrxCLxWKlZCPFNUfUufGTjBl5nPo0mw
         86KGi7UMT92gcWaDJhnT8KA0Z/BUaYmqdFSAokEnKN5GxAZEV1CqUidOk1nYm/yFwhBK
         SQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680612302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXMBkctdCNamTY4/FVKOjXwTK55nCk5S+UOpQBzIuNY=;
        b=6ee0uWRcFGMMCWrC6VAyXkL3fAn5uYkS4VV9jDO5/yA+DeErga2Iw24EIXKRUHx+LV
         lfbvN5AUrSWj9bj5c2ax9AYHKgfhRn8ozP402pf1Wgvs8W7SWI67giJfQyjI0AdjQhNG
         NAb+4fRw3g3x31DG1TiDGYbKbhvo6Jwc8m+4+LWdWoEhBBleV/GFnDwYUyG6qBkEv3sK
         qcdDWdj+Rd4c+eJTASnKy7493Y0rEOLDihxAdhw4JMx3kNe61Uz7u1dBqm6BmOusJIw1
         BDUyNULv6oFdAJIKk38iJXCddTA9mgMkqLlXbs1u1RN3CedhxXS/i04Ytyj3MlrMUxjd
         pKhA==
X-Gm-Message-State: AAQBX9eEs6zUtJJN65RGcgI98qI4udVUnSh9Q5P2AJy0S6IlseQIkyqo
	/J0Gniu7MskjxclDcDt1LMEOOg==
X-Google-Smtp-Source: AKy350aDJ46ZgM3LAhDRaWhOi0JYsuXRrdzSU7xKZnzjSo9zv76g9zVQGxJRs03rEThYo0moqj7p5g==
X-Received: by 2002:a1c:f708:0:b0:3f0:49a3:5878 with SMTP id v8-20020a1cf708000000b003f049a35878mr2049616wmh.12.1680612301923;
        Tue, 04 Apr 2023 05:45:01 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m17-20020a7bcb91000000b003ed1ff06faasm15015161wmi.19.2023.04.04.05.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:45:01 -0700 (PDT)
Date: Tue, 4 Apr 2023 14:45:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] RISC-V: KVM: Implement guest external interrupt
 line management
Message-ID: <znn7ibu4r6ivsfb3sqoandhpvqkfwr6w4q4z6vwcwqiviya5bk@dsa3f5dk7m6l>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403093310.2271142-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_054506_587799_DCA204A7 
X-CRM114-Status: GOOD (  37.00  )
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

On Mon, Apr 03, 2023 at 03:03:10PM +0530, Anup Patel wrote:
> The RISC-V host will have one guest external interrupt line for each
> VS-level IMSICs associated with a HART. The guest external interrupt
> lines are per-HART resources and hypervisor can use HGEIE, HGEIP, and
> HIE CSRs to manage these guest external interrupt lines.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_aia.h |  10 ++
>  arch/riscv/kvm/aia.c             | 241 +++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c            |   3 +-
>  arch/riscv/kvm/vcpu.c            |   2 +
>  4 files changed, 255 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
> index 1de0717112e5..0938e0cadf80 100644
> --- a/arch/riscv/include/asm/kvm_aia.h
> +++ b/arch/riscv/include/asm/kvm_aia.h
> @@ -44,10 +44,15 @@ struct kvm_vcpu_aia {
>  
>  #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
>  
> +extern unsigned int kvm_riscv_aia_nr_hgei;
>  DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
>  #define kvm_riscv_aia_available() \
>  	static_branch_unlikely(&kvm_riscv_aia_available)
>  
> +static inline void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
> +{
> +}
> +
>  #define KVM_RISCV_AIA_IMSIC_TOPEI	(ISELECT_MASK + 1)
>  static inline int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu,
>  					       unsigned long isel,
> @@ -119,6 +124,11 @@ static inline void kvm_riscv_aia_destroy_vm(struct kvm *kvm)
>  {
>  }
>  
> +int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
> +			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
> +void kvm_riscv_aia_free_hgei(int cpu, int hgei);
> +void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable);
> +
>  void kvm_riscv_aia_enable(void);
>  void kvm_riscv_aia_disable(void);
>  int kvm_riscv_aia_init(void);
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index d530912f28bc..1264783e7c4d 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -7,11 +7,46 @@
>   *	Anup Patel <apatel@ventanamicro.com>
>   */
>  
> +#include <linux/bitops.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/kvm_host.h>
> +#include <linux/percpu.h>
> +#include <linux/spinlock.h>
>  #include <asm/hwcap.h>
>  
> +struct aia_hgei_control {
> +	raw_spinlock_t lock;
> +	unsigned long free_bitmap;
> +	struct kvm_vcpu *owners[BITS_PER_LONG];
> +};
> +static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
> +static int hgei_parent_irq;
> +
> +unsigned int kvm_riscv_aia_nr_hgei;
>  DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
>  
> +static int aia_find_hgei(struct kvm_vcpu *owner)
> +{
> +	int i, hgei;
> +	unsigned long flags;
> +	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
> +
> +	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +
> +	hgei = -1;
> +	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
> +		if (hgctrl->owners[i] == owner) {
> +			hgei = i;
> +			break;
> +		}
> +	}
> +
> +	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> +
> +	return hgei;
> +}
> +
>  static void aia_set_hvictl(bool ext_irq_pending)
>  {
>  	unsigned long hvictl;
> @@ -55,6 +90,7 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
>  
>  bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
> +	int hgei;
>  	unsigned long seip;
>  
>  	if (!kvm_riscv_aia_available())
> @@ -72,6 +108,10 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
>  		return false;
>  
> +	hgei = aia_find_hgei(vcpu);
> +	if (hgei > 0)
> +		return (csr_read(CSR_HGEIP) & BIT(hgei)) ? true : false;

nit: return !!(csr_read(CSR_HGEIP) & BIT(hgei)) is a bit less verbose.

> +
>  	return false;
>  }
>  
> @@ -343,6 +383,144 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
>  	return KVM_INSN_EXIT_TO_USER_SPACE;
>  }
>  
> +int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
> +			     void __iomem **hgei_va, phys_addr_t *hgei_pa)
> +{
> +	int ret = -ENOENT;
> +	unsigned long flags;
> +	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
> +
> +	if (!kvm_riscv_aia_available())
> +		return -ENODEV;
> +	if (!hgctrl)
> +		return -ENODEV;

nit:

if (!kvm_riscv_aia_available() || !hgctrl)
   return -ENODEV;

> +
> +	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +
> +	if (hgctrl->free_bitmap) {
> +		ret = __ffs(hgctrl->free_bitmap);
> +		hgctrl->free_bitmap &= ~BIT(ret);
> +		hgctrl->owners[ret] = owner;
> +	}
> +
> +	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> +
> +	/* TODO: To be updated later by AIA in-kernel irqchip support */
> +	if (hgei_va)
> +		*hgei_va = NULL;
> +	if (hgei_pa)
> +		*hgei_pa = 0;
> +
> +	return ret;
> +}
> +
> +void kvm_riscv_aia_free_hgei(int cpu, int hgei)
> +{
> +	unsigned long flags;
> +	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
> +
> +	if (!kvm_riscv_aia_available() || !hgctrl)
> +		return;
> +
> +	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +
> +	if (hgei > 0 && hgei <= kvm_riscv_aia_nr_hgei) {
> +		if (!(hgctrl->free_bitmap & BIT(hgei))) {
> +			hgctrl->free_bitmap |= BIT(hgei);
> +			hgctrl->owners[hgei] = NULL;
> +		}
> +	}
> +
> +	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> +}
> +
> +void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable)
> +{
> +	int hgei;
> +
> +	if (!kvm_riscv_aia_available())
> +		return;
> +
> +	hgei = aia_find_hgei(owner);
> +	if (hgei > 0) {
> +		if (enable)
> +			csr_set(CSR_HGEIE, BIT(hgei));
> +		else
> +			csr_clear(CSR_HGEIE, BIT(hgei));
> +	}
> +}
> +
> +static irqreturn_t hgei_interrupt(int irq, void *dev_id)
> +{
> +	int i;
> +	unsigned long hgei_mask, flags;
> +	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
> +
> +	hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);
> +	csr_clear(CSR_HGEIE, hgei_mask);
> +
> +	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +
> +	for_each_set_bit(i, &hgei_mask, BITS_PER_LONG) {
> +		if (hgctrl->owners[i])
> +			kvm_vcpu_kick(hgctrl->owners[i]);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int aia_hgei_init(void)
> +{
> +	int cpu, rc;
> +	struct irq_domain *domain;
> +	struct aia_hgei_control *hgctrl;
> +
> +	/* Initialize per-CPU guest external interrupt line management */
> +	for_each_possible_cpu(cpu) {
> +		hgctrl = per_cpu_ptr(&aia_hgei, cpu);
> +		raw_spin_lock_init(&hgctrl->lock);
> +		if (kvm_riscv_aia_nr_hgei) {
> +			hgctrl->free_bitmap =
> +				BIT(kvm_riscv_aia_nr_hgei + 1) - 1;
> +			hgctrl->free_bitmap &= ~BIT(0);
> +		} else
> +			hgctrl->free_bitmap = 0;
> +	}
> +
> +	/* Find INTC irq domain */
> +	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
> +					  DOMAIN_BUS_ANY);
> +	if (!domain) {
> +		kvm_err("unable to find INTC domain\n");
> +		return -ENOENT;
> +	}
> +
> +	/* Map per-CPU SGEI interrupt from INTC domain */
> +	hgei_parent_irq = irq_create_mapping(domain, IRQ_S_GEXT);
> +	if (!hgei_parent_irq) {
> +		kvm_err("unable to map SGEI IRQ\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* Request per-CPU SGEI interrupt */
> +	rc = request_percpu_irq(hgei_parent_irq, hgei_interrupt,
> +				"riscv-kvm", &aia_hgei);
> +	if (rc) {
> +		kvm_err("failed to request SGEI IRQ\n");
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static void aia_hgei_exit(void)
> +{
> +	/* Free per-CPU SGEI interrupt */
> +	free_percpu_irq(hgei_parent_irq, &aia_hgei);
> +}
> +
>  void kvm_riscv_aia_enable(void)
>  {
>  	if (!kvm_riscv_aia_available())
> @@ -357,21 +535,79 @@ void kvm_riscv_aia_enable(void)
>  	csr_write(CSR_HVIPRIO1H, 0x0);
>  	csr_write(CSR_HVIPRIO2H, 0x0);
>  #endif
> +
> +	/* Enable per-CPU SGEI interrupt */
> +	enable_percpu_irq(hgei_parent_irq,
> +			  irq_get_trigger_type(hgei_parent_irq));
> +	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
>  }
>  
>  void kvm_riscv_aia_disable(void)
>  {
> +	int i;
> +	unsigned long flags;
> +	struct kvm_vcpu *vcpu;
> +	struct aia_hgei_control *hgctrl = this_cpu_ptr(&aia_hgei);
> +
>  	if (!kvm_riscv_aia_available())
>  		return;
>  
> +	/* Disable per-CPU SGEI interrupt */
> +	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
> +	disable_percpu_irq(hgei_parent_irq);
> +
>  	aia_set_hvictl(false);
> +
> +	raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +
> +	for (i = 0; i <= kvm_riscv_aia_nr_hgei; i++) {

I guess this should start at i = 1, but in this case it doesn't
matter since hgctrl->owners[0] should always be NULL.

> +		vcpu = hgctrl->owners[i];
> +		if (!vcpu)
> +			continue;
> +
> +		/*
> +		 * We release hgctrl->lock before notifying IMSIC
> +		 * so that we don't have lock ordering issues.
> +		 */
> +		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
> +
> +		/* Notify IMSIC */
> +		kvm_riscv_vcpu_aia_imsic_release(vcpu);
> +
> +		/*
> +		 * Wakeup VCPU if it was blocked so that it can
> +		 * run on other HARTs
> +		 */
> +		if (csr_read(CSR_HGEIE) & BIT(i)) {
> +			csr_clear(CSR_HGEIE, BIT(i));
> +			kvm_vcpu_kick(vcpu);

Doing all this outside the lock makes me wonder what happens when 'vcpu'
is no longer the owner at the time of kvm_riscv_vcpu_aia_imsic_release()
or kvm_vcpu_kick(). Even if the calls on the wrong vcpu are just noise,
then don't we still need to confirm that we release/kick the real owner
before we return from this function?

It appears safe to call kvm_vcpu_kick() while holding the lock and
hgei_interrupt() does that. So, since there's currently no
implementation of kvm_riscv_vcpu_aia_imsic_release(), I'm not sure what
lock ordering issues we need to avoid.

> +		}
> +
> +		raw_spin_lock_irqsave(&hgctrl->lock, flags);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
>  }
>  
>  int kvm_riscv_aia_init(void)
>  {
> +	int rc;
> +
>  	if (!riscv_isa_extension_available(NULL, SxAIA))
>  		return -ENODEV;
>  
> +	/* Figure-out number of bits in HGEIE */
> +	csr_write(CSR_HGEIE, -1UL);
> +	kvm_riscv_aia_nr_hgei = fls_long(csr_read(CSR_HGEIE));
> +	csr_write(CSR_HGEIE, 0);
> +	if (kvm_riscv_aia_nr_hgei)
> +		kvm_riscv_aia_nr_hgei--;
> +
> +	/* Initialize guest external interrupt line management */
> +	rc = aia_hgei_init();
> +	if (rc)
> +		return rc;
> +
>  	/* Enable KVM AIA support */
>  	static_branch_enable(&kvm_riscv_aia_available);
>  
> @@ -380,4 +616,9 @@ int kvm_riscv_aia_init(void)
>  
>  void kvm_riscv_aia_exit(void)
>  {
> +	if (!kvm_riscv_aia_available())
> +		return;
> +
> +	/* Cleanup the HGEI state */
> +	aia_hgei_exit();
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 6396352b4e4d..b0b46f48f31e 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -116,7 +116,8 @@ static int __init riscv_kvm_init(void)
>  	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>  
>  	if (kvm_riscv_aia_available())
> -		kvm_info("AIA available\n");
> +		kvm_info("AIA available with %d guest external interrupts\n",
> +			 kvm_riscv_aia_nr_hgei);
>  
>  	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>  	if (rc) {
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 30acf3ebdc3d..eace51dd896f 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -249,10 +249,12 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  
>  void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_aia_wakeon_hgei(vcpu, true);
>  }
>  
>  void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_aia_wakeon_hgei(vcpu, false);
>  }
>  
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
