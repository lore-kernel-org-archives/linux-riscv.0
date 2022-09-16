Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90276C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 05:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BvivBEqmj0XxRg7hvEQJJJLFWttWW/yb4aXStiyH5k=; b=1yqwYmD+3qHeVp
	3hcqkS+Yxt6ZDmBeTgwP6XmbKxvrobmsI4KVPa9a2RIVbMR2iEA12dBkc2lwgRcn29gA/CFwNAguA
	NwyYNDW63VvPbo1yccs2jQMCCy+0ltTPxtpIsFX5wbsL2HyqqPKB77U5W6RxfQBDgjFdkkxdEbo9S
	Ak0UY791PTzzQQRkg5Nj2m0BwxV1ww2Rco2fn9bLMYUCA1Z7X83OrqMJ9p9bk8akWiwiN2pF4vym1
	LQ+6Y/I4Hb2iWv+90inUD5ogA3YF6TDLT3nbhVLLn05xyHsA8V6t2viFpRZkrRvdRM8t1r3q9UizA
	g7NRsjLDi1Pn60Kapung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3aQ-0083Eo-2k; Fri, 16 Sep 2022 05:08:22 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ3aE-00833I-7a
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 05:08:11 +0000
Received: by mail-il1-x135.google.com with SMTP id d16so10803867ils.8
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 22:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yP5XHXLcK+UX9e2N5YzbTl9a4h8ihKkfwEUan36DPrg=;
        b=yAWumhzewMa3eEP3CnaMNUvAKmgC8eanQ3L4jWiwdGCcIzPkhFrQzQw0wwV9+O9C/s
         pWA8px3RR32jSQRkZ724RUliMw1N1pJV7uypHBZtXw/s45KvAkUFFBkjDay0fezO6Q1H
         n/OjWEaMaEvHTgl1WjFIQhvNgjxtHZeYZXfVlqejl77Y0na9OV31a8qO4TRydLDh9b1J
         NF1Fubd/swhKTWFgEXpw3HK96R4pCPPNOYmiQOe7Bp9RLaM6/LZ/umsF8xY1IvG5Kb40
         CBEv7FTQftTVcumiWuAZRwOn7ym/68hjz6J2lRqkwYLZ2FbLbPgjYRH/Tm0ZHhOzbqfn
         INxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yP5XHXLcK+UX9e2N5YzbTl9a4h8ihKkfwEUan36DPrg=;
        b=B8XdGl/dxGvUiejKumpd6ilf6nF/ypu/IPxwQ6koWIpyGczdBHAf9Sq9toxogYCTao
         P89vZS689HgW5FjVzLpkHSPWdako0XQY+QbZwoVEs7q9DQ91Azpl8vuvl/nfA//sl6LW
         rbKGlwpxFP4WfBOEOCPAHRMzNBmcKBY3j65EszbzEqYw6lcDJnPncyO6L2kFG3CcncYM
         LBKSj0f/uQcY+Kgz6OY4cg+taeUFbniKATiv7hKwA/ZrAhOTb+tSp6q99tgFvlIGr1hV
         YkR4sUR3Pwiob7KIcHOs2o3jXN4PIfNoHKZjqw40eflWWCKxl2XQ1OL2ykaHiRo3vMiN
         QIIg==
X-Gm-Message-State: ACrzQf34qKUfZeHkejufsp2vVmaqD1BNmnLmBIxSxQmKPc9LOV3eFg/Z
	7z3cj2iMnpWoHhIJbgRK9raMA0BzM59ygKFbxKhvbQ==
X-Google-Smtp-Source: AMsMyM5GqgO04FmX/wur2Jt+8ypcoEU8eotcYd1jKm89jw9hQAj1ZhLfSUj5pD6zTUMTtw3xNbjyMSejcFd/JFYW8jo=
X-Received: by 2002:a05:6e02:164d:b0:2f1:869c:c45b with SMTP id
 v13-20020a056e02164d00b002f1869cc45bmr1488365ilu.212.1663304885797; Thu, 15
 Sep 2022 22:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220504074807.3616813-1-aik@ozlabs.ru>
In-Reply-To: <20220504074807.3616813-1-aik@ozlabs.ru>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 16 Sep 2022 10:37:53 +0530
Message-ID: <CAAhSdy0hxHjQkVj8TLPh4j=vBrX1QoZcJXNeRBPtf5ozdjQaTQ@mail.gmail.com>
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform dependent
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: kvm-ppc@vger.kernel.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Alex Williamson <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_220810_303592_E55F0F82 
X-CRM114-Status: GOOD (  17.89  )
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

On Wed, May 4, 2022 at 1:18 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> When introduced, IRQFD resampling worked on POWER8 with XICS. However
> KVM on POWER9 has never implemented it - the compatibility mode code
> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
> XIVE mode does not handle INTx in KVM at all.
>
> This moved the capability support advertising to platforms and stops
> advertising it on XIVE, i.e. POWER9 and later.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
>
> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

>
> ---
>  arch/arm64/kvm/arm.c       | 3 +++
>  arch/mips/kvm/mips.c       | 3 +++
>  arch/powerpc/kvm/powerpc.c | 6 ++++++
>  arch/riscv/kvm/vm.c        | 3 +++
>  arch/s390/kvm/kvm-s390.c   | 3 +++
>  arch/x86/kvm/x86.c         | 3 +++
>  virt/kvm/kvm_main.c        | 1 -
>  7 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 523bc934fe2f..092f0614bae3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SET_GUEST_DEBUG:
>         case KVM_CAP_VCPU_ATTRIBUTES:
>         case KVM_CAP_PTP_KVM:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..0f3de470a73e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_READONLY_MEM:
>         case KVM_CAP_SYNC_MMU:
>         case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 875c30c12db0..87698ffef3be 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>                 break;
>  #endif
>
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +               r = !xive_enabled();
> +               break;
> +#endif
> +
>         case KVM_CAP_PPC_ALLOC_HTAB:
>                 r = hv_enabled;
>                 break;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index c768f75279ef..b58579b386bb 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_READONLY_MEM:
>         case KVM_CAP_MP_STATE:
>         case KVM_CAP_IMMEDIATE_EXIT:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_NR_VCPUS:
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 156d1c25a3c1..85e093fc8d13 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SET_GUEST_DEBUG:
>         case KVM_CAP_S390_DIAG318:
>         case KVM_CAP_S390_MEM_OP_EXTENSION:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_SET_GUEST_DEBUG2:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 0c0ca599a353..a0a7b769483d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_SYS_ATTRIBUTES:
>         case KVM_CAP_VAPIC:
>         case KVM_CAP_ENABLE_CAP:
> +#ifdef CONFIG_HAVE_KVM_IRQFD
> +       case KVM_CAP_IRQFD_RESAMPLE:
> +#endif
>                 r = 1;
>                 break;
>         case KVM_CAP_EXIT_HYPERCALL:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70e05af5ebea..885e72e668a5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4293,7 +4293,6 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>  #endif
>  #ifdef CONFIG_HAVE_KVM_IRQFD
>         case KVM_CAP_IRQFD:
> -       case KVM_CAP_IRQFD_RESAMPLE:
>  #endif
>         case KVM_CAP_IOEVENTFD_ANY_LENGTH:
>         case KVM_CAP_CHECK_EXTENSION_VM:
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
