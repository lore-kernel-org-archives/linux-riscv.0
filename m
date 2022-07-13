Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA83C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 01:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Zweb2kGuWjNHnP6QiB9Ujq9lB5A04bbEzXkxZylDS0=; b=g6X2bcysAOWrEP
	bcPeN8iqmHNcjaZ7cPaU9p/ibA5RE7Om4r0NkvBZiobr3P5cnSQ67y24oyJ/Eary3lg0qaZk4fwfs
	1LgwtbzkY4rQgyv5q9Lin2timCG9yGtr061th4/137Krf178YZY6ga02mE7U+j6PJ2sQdMJjHP2z7
	Pn30/vcCM0UbfGQEpUf7lBm8ZDuJkaTUG+Rt8YaAOyM2W5f41f6iasDYHLwry0sd7IRz/0fS7ONaN
	XGvHHsDoAyRdYoL+83yED30W6jo7j4F/kpiGtyfNG/H4E1SsqDnmX+J3/RvDaO9pC13588tTOLaxQ
	nlxCg5yPDhZeJ5njGA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR9b-00GNSI-Kq; Wed, 13 Jul 2022 01:27:03 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBR9X-00GNMF-RG
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 01:27:01 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31d85f82f0bso62761137b3.7
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 18:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0Dy+Rmcjm8hkXGU4nfEHBrtA1yQ8VRvv++C+zBI3stA=;
        b=AGQh/f2q3qa6iXyE58orKUemPvszcwkcBLBJaMXz97hOSpcp+xbP7A3WISXnxCsi8J
         qmti94NwVRMdkhLPb7Z519Z0uOxjAs5mZNcLNPJvbRUUe/1d1SNmD9qM8pguS+3NHhry
         JpctM7lg5p9sbx/qoRaUQlI3PyLT5G7Eckt1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0Dy+Rmcjm8hkXGU4nfEHBrtA1yQ8VRvv++C+zBI3stA=;
        b=eG1TyT3RIUScGl+UuUFgrigNvbNGjkU9OoO39PW1ihOFNz4RvW9NPj2MpOD+LiyKrd
         JRi4iTyrPd4BIZfCsqRYJjbZC+tSxYfPMY/83H++onwLPwPTQhbWERbhMLgSkO1KQ/V0
         7onkur0Fz1U9NZe5vmEvY3T6ELNkFKmkoSP4f2MqTz7ALAbCHbSu/qR5Uo/ruRzOt6FP
         S/3xZi6VWIQ3jhdjSCiNQtGreJYs0rbQ//8FeMrTW/cgScy8+m4q71PXqE5HE86kBD2t
         fr5YWvlyJSDE/rG06nF/I1q/9W/RZwq0MDlrY/zL8SZhIj9yInefSMgVij6pxhx7vs/u
         Mocw==
X-Gm-Message-State: AJIora9F8ayxggPbzoQVkWgHvF18K+RtB7pI4JbBuxBlHyeKtIjKO5OG
	Gf9R545SmK4drmiVrtaMzR8+Cc3LvGsS5S7jCk55
X-Google-Smtp-Source: AGRyM1v39Ct4gOMX9HbMyTm32hNI7oUAX2ibL1Ztp+G3+AyDL2If/7+ku58GCT5aQ/SwsU7B4sIB2VVl18XrQB/dNRc=
X-Received: by 2002:a81:653:0:b0:31d:2a21:734 with SMTP id 80-20020a810653000000b0031d2a210734mr1435894ywg.14.1657675612674;
 Tue, 12 Jul 2022 18:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220707145248.458771-1-apatel@ventanamicro.com> <20220707145248.458771-4-apatel@ventanamicro.com>
In-Reply-To: <20220707145248.458771-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 12 Jul 2022 18:26:41 -0700
Message-ID: <CAOnJCU++MsxgPyGqumWMLrB7ihDk3UmzwwD_voW0Rfnf-BVPWQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_182659_909006_5AC346CD 
X-CRM114-Status: GOOD (  17.84  )
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

On Thu, Jul 7, 2022 at 7:53 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The in-kernel AIA IMSIC support requires on-demand mapping / unmapping
> of Guest IMSIC address to Host IMSIC guest files. To help achieve this,
> we add kvm_riscv_stage2_ioremap() and kvm_riscv_stage2_iounmap()
> functions. These new functions for updating G-stage page table mappings
> will be called in atomic context so we have special "in_atomic" parameter
> for this purpose.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/mmu.c              | 18 ++++++++++++++----
>  2 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 59a0cf2ca7b9..60c517e4d576 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -284,6 +284,11 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
>  void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
>                                unsigned long hbase, unsigned long hmask);
>
> +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> +                            phys_addr_t hpa, unsigned long size,
> +                            bool writable, bool in_atomic);
> +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
> +                             unsigned long size);
>  int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>                          struct kvm_memory_slot *memslot,
>                          gpa_t gpa, unsigned long hva, bool is_write);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index b75d4e200064..f7862ca4c4c6 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -343,8 +343,9 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
>         kvm_flush_remote_tlbs(kvm);
>  }
>
> -static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> -                         unsigned long size, bool writable)
> +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> +                            phys_addr_t hpa, unsigned long size,
> +                            bool writable, bool in_atomic)
>  {
>         pte_t pte;
>         int ret = 0;
> @@ -353,6 +354,7 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>         struct kvm_mmu_memory_cache pcache;
>
>         memset(&pcache, 0, sizeof(pcache));
> +       pcache.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0;
>         pcache.gfp_zero = __GFP_ZERO;
>
>         end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
> @@ -382,6 +384,13 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>         return ret;
>  }
>
> +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa, unsigned long size)
> +{
> +       spin_lock(&kvm->mmu_lock);
> +       gstage_unmap_range(kvm, gpa, size, false);
> +       spin_unlock(&kvm->mmu_lock);
> +}
> +
>  void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>                                              struct kvm_memory_slot *slot,
>                                              gfn_t gfn_offset,
> @@ -517,8 +526,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>                                 goto out;
>                         }
>
> -                       ret = gstage_ioremap(kvm, gpa, pa,
> -                                            vm_end - vm_start, writable);
> +                       ret = kvm_riscv_gstage_ioremap(kvm, gpa, pa,
> +                                                      vm_end - vm_start,
> +                                                      writable, false);
>                         if (ret)
>                                 break;
>                 }
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
