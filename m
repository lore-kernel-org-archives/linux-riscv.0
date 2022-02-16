Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71334C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Feb 2022 03:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV8qPN2q8+iAcSRQ9O7sIgDbKfxF3fczkPhaNUQCzHA=; b=oiirMIhROu0X/N
	j2gYYeQXcBIEvozTP4fO4DsbdCUYRswLAvjU9MzyLjuItWyb5oKtm1rTA/9JDoDHfG+rKJ1+kvNYA
	4wS1pqhcuzHt6ttYG0G8+PmW5a9LCkfkVAlB2EhNZm8RltGVXc+TRk3N9k0fcfQHyrd03rclwsAlL
	r58DzbqcJTeztuMcelNNhsNMjGGFKONeWxdso8W2BLw2LZoct5gfi6CvMGk7tjENT4k3M/ApSeesz
	8SyWy0RIBMGZNImj65dDvtSL14R/oP9LIgAUuKh0rRInq2sjuaz3Es6/CTzVrCZmgC1ZB798XL4NZ
	Tsx7GiMd+qoATjMe2DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKAxK-005Pie-Ro; Wed, 16 Feb 2022 03:26:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKAxH-005PhI-2V
 for linux-riscv@lists.infradead.org; Wed, 16 Feb 2022 03:26:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 d14-20020a05600c34ce00b0037bf4d14dc7so636836wmq.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 19:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwhFIm2pjxqH4S1QMmhp69WD0Yx/q3G7DzS41sze+Fs=;
 b=riYhJ/NFDeUTP+27duj6KaHVTshaiOQWoiNe0wD5HsocnEG4P2zjeu1WJJDyF+7tg8
 HCeN+YgLtAuAqFdXC5u5r4J1kreE47Ve+t4e9Tzc3e/bR6dW6cfCEx+AULlAjs0UFA7b
 5iYtqizK/2DbwQ3MdQzFC5ShahlfHXfxfbRTyv3sjEKEHhbO96isAQ/oJlBBafJ4RfO6
 Ik2sa+YCrQVXyZRleWwPOmZS9xfiQMBjan/DE793V7AulbEAwpf909pO0yRuMLybh51Z
 HNPSzg49iXmvLcs5NFrZBcGz1w3jwq6ATwFOagq0fPdiZtS5k3qPuXa39lc6+Ewfq3Uz
 nhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwhFIm2pjxqH4S1QMmhp69WD0Yx/q3G7DzS41sze+Fs=;
 b=afupZsi1Up2UkhIZOwFCHnHQhTX2SKg/JKxe2qCwE5B/Q5GfdqrA2toPnwyxuUjQxr
 rbbkoyBX8dTq+2elzy7CZBou/xvTecNsdd1tJfta5Mlw/oSZJXkYGw59JocKhPoFDtVH
 MpRwrhgeF7gQH1FhnKzQbkeyPN+yd/JZv0SJsjEw5WYJxhAkZviSqXS8GOhEtLzijxFv
 ByCoONPSN9KxLAc5oliAS4twNkzlyK0Eoy3vl3O6LIHqJGMTkhgyL1SjDn2Fpkr8Jsw+
 pS53EyMupY0R2/fBUYDEHJAc3jw1ERBgdMM942uaEgj1pq/ngWKC6opYKK7LXOaGs9nx
 Wc7Q==
X-Gm-Message-State: AOAM532mflvZ/03kklGDL3+G0RurETFo62rYY850eiRY/HKxwgjz+d4W
 sbav4hClpe3RRInGt6Q/pGThwHoC+g3NahM7klnK+A==
X-Google-Smtp-Source: ABdhPJyRrOhHG9NugLem/Yuo2TIr9R5jqud/r7I7SljQVLpVr4bWltjwldVI0/2cSoJTehq0BS93uj6Y8dpcZ9dYSY0=
X-Received: by 2002:a7b:cf16:0:b0:37b:c4c9:96c6 with SMTP id
 l22-20020a7bcf16000000b0037bc4c996c6mr683144wmg.59.1644981969162; Tue, 15 Feb
 2022 19:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Feb 2022 08:55:55 +0530
Message-ID: <CAAhSdy0PfCegu9vQY76pD-cLfP_S1xnyWARdinG4jbuJ_eVQkg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
To: Chao Gao <chao.gao@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 KVM General <kvm@vger.kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, kevin.tian@intel.com, 
 Thomas Gleixner <tglx@linutronix.de>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 David Hildenbrand <david@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, 
 Bharata B Rao <bharata@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 kvmarm@lists.cs.columbia.edu, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_192611_145836_C081E7A8 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Feb 16, 2022 at 8:46 AM Chao Gao <chao.gao@intel.com> wrote:
>
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
>
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
>
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup


> ---
>  arch/arm64/kvm/arm.c       |  2 +-
>  arch/mips/kvm/mips.c       |  2 +-
>  arch/powerpc/kvm/powerpc.c |  2 +-
>  arch/riscv/kvm/main.c      |  2 +-
>  arch/s390/kvm/kvm-s390.c   |  2 +-
>  arch/x86/kvm/x86.c         |  2 +-
>  include/linux/kvm_host.h   |  2 +-
>  virt/kvm/kvm_main.c        | 16 +++-------------
>  8 files changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..092d09fb6a7e 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -140,7 +140,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 2ad0ccd202d5..30c817f3fa0c 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -423,7 +423,7 @@ int kvm_arch_hardware_setup(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return kvmppc_core_check_processor_compat();
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 2e5ca43c8c49..992877e78393 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -20,7 +20,7 @@ long kvm_arch_dev_ioctl(struct file *filp,
>         return -EINVAL;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 577f1ead6a51..0053b81c6b02 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -252,7 +252,7 @@ int kvm_arch_hardware_enable(void)
>         return 0;
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         return 0;
>  }
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 9b484ed61f37..ffb88f0b7265 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11509,7 +11509,7 @@ void kvm_arch_hardware_unsetup(void)
>         static_call(kvm_x86_hardware_unsetup)();
>  }
>
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>  {
>         struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index f11039944c08..2ad78e729bf7 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1413,7 +1413,7 @@ int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
>  int kvm_arch_hardware_setup(void *opaque);
>  void kvm_arch_hardware_unsetup(void);
> -int kvm_arch_check_processor_compat(void *opaque);
> +int kvm_arch_check_processor_compat(void);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 83c57bcc6eb6..ee47d33d69e1 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5643,22 +5643,14 @@ void kvm_unregister_perf_callbacks(void)
>  }
>  #endif
>
> -struct kvm_cpu_compat_check {
> -       void *opaque;
> -       int *ret;
> -};
> -
> -static void check_processor_compat(void *data)
> +static void check_processor_compat(void *rtn)
>  {
> -       struct kvm_cpu_compat_check *c = data;
> -
> -       *c->ret = kvm_arch_check_processor_compat(c->opaque);
> +       *(int *)rtn = kvm_arch_check_processor_compat();
>  }
>
>  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>                   struct module *module)
>  {
> -       struct kvm_cpu_compat_check c;
>         int r;
>         int cpu;
>
> @@ -5686,10 +5678,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         if (r < 0)
>                 goto out_free_1;
>
> -       c.ret = &r;
> -       c.opaque = opaque;
>         for_each_online_cpu(cpu) {
> -               smp_call_function_single(cpu, check_processor_compat, &c, 1);
> +               smp_call_function_single(cpu, check_processor_compat, &r, 1);
>                 if (r < 0)
>                         goto out_free_2;
>         }
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
