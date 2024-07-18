Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857A0C3DA63
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byQAi1hm7j3/IAYt+Wb2gRUEUGsSGywbJ6asGGqiEBU=; b=ubeYiiQB5DPx8o
	IiufMgDbTj7IJrr09TjaTG7wzLRhXJfzNDeiO2TAcdCrLcg+XqM/NplL+st6HJqOdYt0M1x1JJCK0
	W+sEtNffaGHsYm5MBRgXlhqehBQYts0dH+r28UvPCs+JiYYqSYgY47NTS7PP7R+5LD7Es4g2jTlr1
	7/ButTRuGnJRUVO6EqD+7bv3frG0CG6dWU9LSW2g92zIzoYqQ4gaLRLgmRNmmX5+/EpXSHdQ4j++Q
	797Y1XWBsuJXtMos4SxoOhhMqzv8aBSIPuelC2chF+Ss2xLIZJ181vbkq1I/ME30vll6A9PH5P0hH
	ARXqtm6bReRFgUfB8qDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUdk-000000003aY-2w5F;
	Thu, 18 Jul 2024 17:10:00 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUdg-000000003ZJ-4BwH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 17:09:58 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-44953ab0e2bso3201381cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721322595; x=1721927395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0oZIFGo3b+JV9w2PKJcAfLvpOGjnV19xdselgMBeOOw=;
        b=TC/KFhoIe/aDbpUa3TcHGXWATHd82455g3L6JDN1YEZOyFp0ZQ1+o9gvN4kiu64l4D
         8O/aTiK00gqn9vmIEocsJqWxwqrtiNc5vTd6xtib5OP1O2uYNVjidFsxbfIuKlGaMBFh
         ep8ZdolSvMV2zYxAopngkaRLze/cLqI7BClaGRSgRq5+eTUhWSIK4p07DwSTVmB024gr
         g59/4Hz14PM+XkKBluZlYG4ism+SDjhEu7lKRi2Fd4Rt3hkhrzj0TspD2CDzshejNZT7
         A1vRF0pGGTZIxd1Fq3TI8h5WBaaB29XH8e71Pov0LGlvOAWnhX+q4+yA8IwtTQYhhXZ2
         aFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721322595; x=1721927395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0oZIFGo3b+JV9w2PKJcAfLvpOGjnV19xdselgMBeOOw=;
        b=pcSFn21gaKPl9kKzI63ebemS4OuBXF5l3S2MAku3hkTjeogj4XtmF05VMhm5h6X6qq
         K22TeX4KIAP20W+laS58OYIEQo4f/FE60ZaFluvoNr3oGRvLNXUzd2w8XVzKL8d3Y0Xq
         9cgu4WThNe740xAD6CCbwCFButNcrPgODVYXTEOvL8hS1oPV2P2cPUZUvDj40Tb+6l9y
         ihxEOtlVHMG/2pDWtLGzrQxdslnvP7BJMl+n24h8dEV6bK7hjJBpNBZ2mmN8GNvrHKap
         pIUynzkHDoqxmHinXJlNeCD5k+C1FjytbZw4oMyD59qjQUXqu4+XqMQwvI0jkNwSIprk
         k60g==
X-Forwarded-Encrypted: i=1; AJvYcCW3XHX//+P7TJxsX/kINueAQft7l3aLmhWG310HhflXErjsAXkxWjpdsyTQ7URUYzlNuWBXYJGPDjaxK0Xxavbe0MVOJNFpUn/rzrPCOdrY
X-Gm-Message-State: AOJu0Yx75wg1BPnQ5kRjE5fXzSgOcygEvQu7z8kyuDLh4D//8qa2uSeh
	hFsnVKuJIqsqdX+8ncKDeTvafPTDvF9NFUYjsrXpr+Mxo49qt1PwnB1n8GOLbQw=
X-Google-Smtp-Source: AGHT+IHrzZA/m6pVbTgjevfoe8nzNI8qw8J1MyZZNmpIu3/V95B0K8fx3QqerirmL3TlDD78U4x6Ww==
X-Received: by 2002:a05:622a:103:b0:447:e692:8b31 with SMTP id d75a77b69052e-44f969b9a3emr16945791cf.37.1721322595207;
        Thu, 18 Jul 2024 10:09:55 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f96a02d2csm4369571cf.43.2024.07.18.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:09:54 -0700 (PDT)
Date: Thu, 18 Jul 2024 12:09:53 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org
Subject: Re: [PATCH 2/2] riscv: KVM: add basic support for host vs guest
 profiling
Message-ID: <20240718-f39bdec648fc285ffe46cc3e@orel>
References: <cover.1721271251.git.zhouquan@iscas.ac.cn>
 <fbf8a9fcca05a1b554ac0d01b0c46fbb6263c435.1721271251.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbf8a9fcca05a1b554ac0d01b0c46fbb6263c435.1721271251.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_100957_067859_10A6C909 
X-CRM114-Status: GOOD (  23.22  )
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

On Thu, Jul 18, 2024 at 07:23:51PM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> For the information collected on the host side, we need to
> identify which data originates from the guest and record
> these events separately. This can be achieved by having
> KVM register perf callbacks.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/kvm_host.h |  6 ++++++
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/main.c             | 12 ++++++++++--
>  arch/riscv/kvm/vcpu.c             |  7 +++++++
>  4 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index d96281278586..b7bbe1c0c5dd 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -285,6 +285,12 @@ struct kvm_vcpu_arch {
>  	} sta;
>  };
>  
> +/* TODO: A more explicit approach might be needed here than this simple one */

Can you elaborate on this concern?

> +static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
> +{
> +	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
> +}
> +
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>  
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
> index 17e21df36cc1..c9d291865141 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -222,6 +222,13 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
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

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
