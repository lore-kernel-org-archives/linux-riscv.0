Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D26FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 05:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KxYfjsHWTjYcsi00hynUYg7Or5inN5iF1OVRNV6Pnc=; b=JfgVigGASpZsUy
	W7SMQmISRF7biP4wiZ1jaI/ZvjTgLdYKW8tpoSHfGk8ggOwrO0ULiaU3/weu0+SsKuHEfpJJ8cusM
	qYa7MKnDkjRZclHuT+4yruaK/LVmnW1w9zJjTqhYxpgL5HCEObae0yvFH2JRJTbB7Y57A512DfnZI
	qwy/Uz3KCYgL3sw1/1lSilZ6VS6khnqhpR9IUqu3TDJSdpPQds6maW5GJ5tPki5xP6hg3N01ZI/P/
	kTejVHXn7Aeojp1Dtv+akeZcNwY5kCPDAK+YqG3hqFk5kL40wrfRJ+1Tae9MfnGLRahhvBjZ/ijzK
	5qbleC4i7z8iPdHjlL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my65b-008fsD-Ir; Fri, 17 Dec 2021 05:47:31 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my65Y-008fqv-4M
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 05:47:29 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id x32so3188799ybi.12
 for <linux-riscv@lists.infradead.org>; Thu, 16 Dec 2021 21:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BwdXAZqwcOgfTzbPvhOiD7YDfbOTo8m/P9qk7qvdRbg=;
 b=TbJ8b6Q1XadCQi/ETXO7KnR0eVyxVPo6CYumNoLxIIHHsWte48o341tqjtH/OZIKz1
 D+yS5qpJMo9NJYArpISYebQHEghellf1QZRJq/vkFJfRf8fIv8WO2io3c2Az6JqJXRFZ
 oH7HEaBC/awQW4WTz17249wf3AtN3MwJMqYso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BwdXAZqwcOgfTzbPvhOiD7YDfbOTo8m/P9qk7qvdRbg=;
 b=Zq5+o2g4K7evutwVe7+o1rCx9mDmsmaSDAnvmquTDd2+0Ho0tdnY0OYAkmX+qo/Psb
 osdSSuWe8ja4fP9cqD9naY08zxesvxHfvf+DPYe9M6XEfJGLYsq9GVCiCYkCmDksSbXk
 gxAIHmFXCQfPyHB+Qaarr3E7Vza4i7uG9K45Ni7p6FtTQaDFxf/MCrFTqYKY2o/MkYO4
 DCS9rq1uuqX7Ob7ZnW4zDsdQ0vy7yM3Hw1QDMRK4yuRy7nBtZliTBKuUe+ZRGNWnpGRw
 cjyOQFkiLzJ5MVMQOr4ogCX8iiEcLkofVrIhh6wU+V7G9QD5/oVT/IOYbnPqZXtYh4m5
 SgZQ==
X-Gm-Message-State: AOAM530TuusljhnGxXXKojeJ1cLHHYMXtUPYXm/ETK2nLwxJML9rR+wz
 SZprgfOnJSy5tKRh8SXzGTwl8oiAI6f4w1vJKR9I
X-Google-Smtp-Source: ABdhPJym0ejx2zDX2ah9KB9aFnBYNo3/Jeu0eMo9QzZYrU+lCsv59ObD5++THmdkCuYRNxANRZg8W5NhsjmGjXossFA=
X-Received: by 2002:a25:2450:: with SMTP id k77mr2228286ybk.121.1639720046870; 
 Thu, 16 Dec 2021 21:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20211129075451.418122-1-anup.patel@wdc.com>
 <20211129075451.418122-3-anup.patel@wdc.com>
In-Reply-To: <20211129075451.418122-3-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 16 Dec 2021 21:47:16 -0800
Message-ID: <CAOnJCU+Yft5EjgUUCi=nW79pYSGYPWB1ew5iyTjViFvGGQxQCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] RISC-V: KVM: Add VM capability to allow userspace
 get GPA bits
To: Anup Patel <anup.patel@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_214728_372213_52ABD0AC 
X-CRM114-Status: GOOD (  21.37  )
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

On Mon, Nov 29, 2021 at 12:10 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The number of GPA bits supported for a RISC-V Guest/VM is based on the
> MMU mode used by the G-stage translation. The KVM RISC-V will detect and
> use the best possible MMU mode for the G-stage in kvm_arch_init().
>
> We add a generic VM capability KVM_CAP_VM_GPA_BITS which can be used by
> the KVM userspace to get the number of GPA (guest physical address) bits
> supported for a Guest/VM.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/kvm_host.h | 1 +
>  arch/riscv/kvm/mmu.c              | 5 +++++
>  arch/riscv/kvm/vm.c               | 3 +++
>  include/uapi/linux/kvm.h          | 1 +
>  4 files changed, 10 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 37589b953bcb..ae5d238607fe 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -221,6 +221,7 @@ void kvm_riscv_stage2_free_pgd(struct kvm *kvm);
>  void kvm_riscv_stage2_update_hgatp(struct kvm_vcpu *vcpu);
>  void kvm_riscv_stage2_mode_detect(void);
>  unsigned long kvm_riscv_stage2_mode(void);
> +int kvm_riscv_stage2_gpa_size(void);
>
>  void kvm_riscv_stage2_vmid_detect(void);
>  unsigned long kvm_riscv_stage2_vmid_bits(void);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 9ffd0255af43..9b6d6465094f 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -760,3 +760,8 @@ unsigned long kvm_riscv_stage2_mode(void)
>  {
>         return stage2_mode >> HGATP_MODE_SHIFT;
>  }
> +
> +int kvm_riscv_stage2_gpa_size(void)
> +{
> +       return stage2_gpa_bits;
> +}

The ioctl & the underlying stage2_gpa_bits has bits.
Maybe rename the function to kvm_riscv_stage2_gpa_bits as well ?

> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb18af34a4b5..6f959639ec45 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -82,6 +82,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>         case KVM_CAP_NR_MEMSLOTS:
>                 r = KVM_USER_MEM_SLOTS;
>                 break;
> +       case KVM_CAP_VM_GPA_BITS:
> +               r = kvm_riscv_stage2_gpa_size();
> +               break;
>         default:
>                 r = 0;
>                 break;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 1daa45268de2..469f05d69c8d 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1131,6 +1131,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
>  #define KVM_CAP_ARM_MTE 205
>  #define KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM 206
> +#define KVM_CAP_VM_GPA_BITS 207
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> --
> 2.25.1
>

Other than that, it looks good to me.

Reviewed-by: Atish Patra <atishp@rivosinc.com>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
