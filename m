Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505EBC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+OjeoQsAbnLPbQpegiSGbTR3iBjiGH8e6YwLCQSuGg=; b=FhCmXTBGd13XlQ
	pJuiO7GyYXb5gpM7J0HX6SjH/1qI9PmCMx0P3p6PGNgttTyRHm05MRjNWaojTtsC/eD2i4hW9xFn4
	TC5d9xuL5AubrT68UfveS1SHeYSTAl5qcRBEILgNf/t/FxnQXqd43/oPVFQUD0vEkUiPxcvdA5Qi7
	k+KtQ54763S9HwG6vM6tfa1yLpii1I2qn1nYMRe8gsra/k+2XeVyxF6GvNBoqzCWSWLmafrG79X5Q
	F2JTg+L3nqi6WPDRZMZYxgQh72ttrth+gweORXnD0atfvzGGqeskUAiL/7CB3/vOWCYrTGk60TAmR
	e1dmKabMjiVom2ltaOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgknz-00000008zPN-1jPO;
	Wed, 21 Aug 2024 12:51:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgknw-00000008zOH-3Qq4
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 12:51:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a867a564911so69447266b.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724244671; x=1724849471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=raDu59AbuTAiHZu2m2E9hviyqY7JsE7FECBT8mn6n1o=;
        b=RLAnfka2NVD7nZPxlRf8JRowwwHX4iNY+P9UmcWOn82bxohspJ4OY7ImbQchjSPOzS
         zf/MWYpZGIvbgd9A4VbANwRNwkRNhHRd6beR+LkOrDIQ7gwMuIK/WlyioycmqJZ3oHDJ
         +OQG4wpr7W5uOf19j4j7RGxjYIjISvE+GyaHFORoWD/0yo0wCQRERzhIootpcJGjW60X
         YiXjwXc83nt7tYqqF1SWawEGxsy0MJzE2tzxYr7LxxJeoMuPgxhF6ZAcpmyVD5hcvM+1
         VdvAO8webYfu4hKqEOAXxHGKIpzReEbI/82d4kzy46CW4+ScM6dU69KvtSX6rCXjH7BS
         H9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244671; x=1724849471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=raDu59AbuTAiHZu2m2E9hviyqY7JsE7FECBT8mn6n1o=;
        b=pHwWlbVcMLeLPTHNS87AB6BDqbhy6gIm56o/j/YfHoAymshoLm/0A2X19F/mk8Bp+Z
         PwZs/PMRfsak6ElJPsU0GAUX6a5x5duL2iFnlCeEtvtY0+OJcK56uNFvVgsMc7eW1y3i
         FnOaNAxmftIO9+4dIjAtTKy6F7H9Z3MhFNaREDOxOoxcgKnPQTbjw0WCiEjNAS1kgblf
         cJvTXdGL9SnoSZSpoLF3LllvgnoV/siiD48PFAh7jUY3emLvcPjfFUiqM9Xbol4f9eQn
         ApJSDlTSBIZ3l7vtJb4yVfb0lwBGQdmcLcC48i2xMT9BhwnXQyLTO9DQbHcQS/qNTotN
         i+hA==
X-Forwarded-Encrypted: i=1; AJvYcCUaoNIU7xZoYkZ6mHansvasPVaWZSft5XJCdYnNFyG/7OCKRmhYkDiU1sVuehssUMT6kNufJyKs5wUn5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt00aeyuLFKxqzwLkWNbcQw3FRoWIss/I0vUtMdiDVoqJUGx8b
	PjdXqXWnk6PS00OWiAJCN00Kr2si6FftjcP8u9q+RHWsppPPWrYngdEz4E6c0B4=
X-Google-Smtp-Source: AGHT+IGMx+niZTB1tXBn3Y538ogJDgh4dcZ/uFfeMe6k354e5J0N3e8sWtPvtt2hfSLE4kakV9lvzw==
X-Received: by 2002:a17:907:7fac:b0:a86:817e:d27b with SMTP id a640c23a62f3a-a86817edc76mr63107466b.43.1724244670578;
        Wed, 21 Aug 2024 05:51:10 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfb69sm894459266b.88.2024.08.21.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:51:10 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:51:09 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: KVM: add basic support for host vs guest
 profiling
Message-ID: <20240821-5284bf727abbb08a379e1d06@orel>
References: <cover.1723518282.git.zhouquan@iscas.ac.cn>
 <7eb3e1a8fc9f9aa0340a6a1fb88a127b767480ea.1723518282.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7eb3e1a8fc9f9aa0340a6a1fb88a127b767480ea.1723518282.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_055112_886962_00BCE727 
X-CRM114-Status: GOOD (  23.16  )
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

On Tue, Aug 13, 2024 at 09:24:10PM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> For the information collected on the host side, we need to
> identify which data originates from the guest and record
> these events separately, this can be achieved by having
> KVM register perf callbacks.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/main.c             | 12 ++++++++++--
>  arch/riscv/kvm/vcpu.c             |  7 +++++++
>  4 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 2e2254fd2a2a..d2350b08a3f4 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -286,6 +286,11 @@ struct kvm_vcpu_arch {
>  	} sta;
>  };
>

Let's add the same comment here that arm64 has unless you determine
that 'any event that arrives while a vCPU is loaded is considered to be
"in guest"' is not true for riscv.

> +static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
> +{
> +	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
> +}
> +
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  
>  #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 26d1727f0550..0c3cbb0915ff 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -32,6 +32,7 @@ config KVM
>  	select KVM_XFER_TO_GUEST_WORK
>  	select KVM_GENERIC_MMU_NOTIFIER
>  	select SCHED_INFO
> +	select GUEST_PERF_EVENTS if PERF_EVENTS
>  	help
>  	  Support hosting virtualized guest machines.
>  
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index bab2ec34cd87..734b48d8f6dd 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -51,6 +51,12 @@ void kvm_arch_hardware_disable(void)
>  	csr_write(CSR_HIDELEG, 0);
>  }
>  
> +static void kvm_riscv_teardown(void)
> +{
> +	kvm_riscv_aia_exit();
> +	kvm_unregister_perf_callbacks();
> +}
> +
>  static int __init riscv_kvm_init(void)
>  {
>  	int rc;
> @@ -105,9 +111,11 @@ static int __init riscv_kvm_init(void)
>  		kvm_info("AIA available with %d guest external interrupts\n",
>  			 kvm_riscv_aia_nr_hgei);
>  
> +	kvm_register_perf_callbacks(NULL);
> +
>  	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
>  	if (rc) {
> -		kvm_riscv_aia_exit();
> +		kvm_riscv_teardown();
>  		return rc;
>  	}
>  
> @@ -117,7 +125,7 @@ module_init(riscv_kvm_init);
>  
>  static void __exit riscv_kvm_exit(void)
>  {
> -	kvm_riscv_aia_exit();
> +	kvm_riscv_teardown();
>  
>  	kvm_exit();
>  }
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8d7d381737ee..e8ffb3456898 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -226,6 +226,13 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
>  	return (vcpu->arch.guest_context.sstatus & SR_SPP) ? true : false;
>  }
>  
> +#ifdef CONFIG_GUEST_PERF_EVENTS
> +unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->arch.guest_context.sepc;
> +}
> +#endif
> +
>  vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>  {
>  	return VM_FAULT_SIGBUS;
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
