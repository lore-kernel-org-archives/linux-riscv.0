Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1DAEB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yWWdVD1OnM8JfhQmYdSbdKge7jj4IExuAaIEOdSVZqw=; b=hhwdc2isKge34vn5VJ8a3PaUnA
	WgcDiHpdZYT9qODWgqwAHpNii+4RrEqC+bEF0rJ1NrorE+7Dm7dbb78o4SrdW+pwSjDsd6rm2xAoE
	RpLiybqCZ6u+cqmofU9KyhgUqHwNiN2FCkbnQA/oH4dkOcVpKEcEGlYpin9RvUd9qIpmwo4JoS9kb
	IZGsbnM65M0X88MFfnEgb+Ny7WJoOD1OM+huLYXaH+eUgy7O3NHvtcbzZZGDGL4arWnLxYxk8GcJU
	2oN3AMxmvD7zeyDr012yBPZV+vkGbl0hQHTaZPflRM6uiivZE9Qe/szP4Ruzro9ahwHZRYXvaf7U9
	AGEII9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BNJ-009C1E-0S;
	Tue, 13 Jun 2023 21:16:25 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BNF-009Byy-1f
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 21:16:24 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-651427a2b74so3507760b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 14:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686690978; x=1689282978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zoXsbeVfXLLEsjLQrLANrMHnuV7SIcBeWtBPaSlJE0U=;
        b=zQ7R5o0craf7u+8BFUd0XqKzaiFd07QQ12Eidv2oX82/8xpvNaNd5d3F1TCTk6N0Hu
         7fMAmHEwJDyPmDip2pmYEeWftlaTmP5dIu41ZGeOFz45S21m6tXwg30hbcF3thUzi676
         vzpD724q+62Lf8U9Gs9MKk4E/8JtwMR99WvwZB1LR98kFvEt6ayHb9QgvMry583OCgJV
         lblJoGrE/X04cAdDQliEfEc/u/0GX09ErJvgFy+LvpVV5l8d0IOk2DTITEBHELAeAkNh
         50M+uJ4OhYkQVSE9h6BW4mKFbmJK1/oUtMREUc0flhuMb3gVbi/lwRS/0faB5gRn/RtF
         ddZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686690978; x=1689282978;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoXsbeVfXLLEsjLQrLANrMHnuV7SIcBeWtBPaSlJE0U=;
        b=DiWc9onjDbuxKckl406AcmMQe3zN9uhlz2S2e7Vb+FxbIPIl6i8Lo5AwZRkkj+8bxV
         waYCtTierJmmeOu6WzTPGhwtBUKj25VAZkHIAwAaKsZZ5PnSWZSmFSfrexIMfi6PyO/n
         a8+9YEARpYiDAZjVfgavIVQLK8voSLkMwoc/lJKUPTOm07GA/4ub664gjtIIkBCsd1zw
         K7hj/u8mrAlvNmaQnVAukedd7r4QKUnRdPXMK9AwvJKLtutpDrZM7pVqX8cbMvQFLhfG
         LJj6IZxFbL7O8p2VPQQGJxeh/RALqkatxc+eVnByPNoh57S5q/XdXSPb5cbMKKBVc2Zw
         btqQ==
X-Gm-Message-State: AC+VfDxVQNivagGFlSU4LxwiVOuXSUsYA4SwiwVWCOElbsWAu2DWRhZA
	1xTmvsIq8+ebe74/2yLjCI5N46tfIC8=
X-Google-Smtp-Source: ACHHUZ7p7HWyWa7uo6JIcTCl2qEWne7t8Z1pA5sTVB2E6o4i4fbc3cAgW8yVZwQOXwCLEQAIaBcF/pXVJrY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2d1d:b0:63a:ff2a:bf9f with SMTP id
 fa29-20020a056a002d1d00b0063aff2abf9fmr9201pfb.2.1686690978636; Tue, 13 Jun
 2023 14:16:18 -0700 (PDT)
Date: Tue, 13 Jun 2023 14:16:16 -0700
In-Reply-To: <20230315101606.10636-1-wei.w.wang@intel.com>
Mime-Version: 1.0
References: <20230315101606.10636-1-wei.w.wang@intel.com>
Message-ID: <ZIjcoOaexz5YAyWT@google.com>
Subject: Re: [PATCH RESEND v2] KVM: move KVM_CAP_DEVICE_CTRL to the generic check
From: Sean Christopherson <seanjc@google.com>
To: Wei Wang <wei.w.wang@intel.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_141621_549403_19F04AF7 
X-CRM114-Status: GOOD (  18.22  )
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

+<everyone else>

Please use scripts/get_maintainer.pl to generate the To/Cc lists.  This may be
trivial, but it still needs eyeballs from the relevant maintainers.

On Wed, Mar 15, 2023, Wei Wang wrote:
> KVM_CAP_DEVICE_CTRL allows userspace to check if the kvm_device
> framework (e.g. KVM_CREATE_DEVICE) is supported by KVM. Move
> KVM_CAP_DEVICE_CTRL to the generic check for the two reasons:
> 1) it already supports arch agnostic usages (i.e. KVM_DEV_TYPE_VFIO).
> For example, userspace VFIO implementation may needs to create
> KVM_DEV_TYPE_VFIO on x86, riscv, or arm etc. It is simpler to have it
> checked at the generic code than at each arch's code.
> 2) KVM_CREATE_DEVICE has been added to the generic code.
> 
> Link: https://lore.kernel.org/all/20221215115207.14784-1-wei.w.wang@intel.com
> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/arm64/kvm/arm.c       | 1 -
>  arch/powerpc/kvm/powerpc.c | 1 -
>  arch/riscv/kvm/vm.c        | 1 -
>  arch/s390/kvm/kvm-s390.c   | 1 -
>  virt/kvm/kvm_main.c        | 1 +
>  5 files changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 3bd732eaf087..96329e675771 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -202,7 +202,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = vgic_present;
>  		break;
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_USER_MEMORY:
>  	case KVM_CAP_SYNC_MMU:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 4c5405fc5538..185efed23896 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -526,7 +526,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ENABLE_CAP:
>  	case KVM_CAP_ONE_REG:
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_IMMEDIATE_EXIT:
>  	case KVM_CAP_SET_GUEST_DEBUG:
>  		r = 1;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 65a964d7e70d..6efe93b282e1 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -57,7 +57,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  	switch (ext) {
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_USER_MEMORY:
>  	case KVM_CAP_SYNC_MMU:
>  	case KVM_CAP_DESTROY_MEMORY_REGION_WORKS:
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 39b36562c043..7b097b5253ca 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -556,7 +556,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_ENABLE_CAP:
>  	case KVM_CAP_S390_CSS_SUPPORT:
>  	case KVM_CAP_IOEVENTFD:
> -	case KVM_CAP_DEVICE_CTRL:
>  	case KVM_CAP_S390_IRQCHIP:
>  	case KVM_CAP_VM_ATTRIBUTES:
>  	case KVM_CAP_MP_STATE:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index d255964ec331..71cc63640173 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4523,6 +4523,7 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  #endif
>  	case KVM_CAP_BINARY_STATS_FD:
>  	case KVM_CAP_SYSTEM_EVENT_DATA:
> +	case KVM_CAP_DEVICE_CTRL:
>  		return 1;
>  	default:
>  		break;
> -- 
> 2.27.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
