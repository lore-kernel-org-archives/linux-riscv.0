Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A02CC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 22:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKad+QwLAu+lCb+hI7nz1M7MMYeDA9KFToimL6vbEjo=; b=o5gEAAM1MqIe/w
	QjedU3xLf1mgGXYhz2xnK0KE1Y0sIByKIdDdZCEsDxtPdCMXgUfna56w/uI4GqBo7WQweBWjKbSfx
	EvUvbnYkpzWK7uRoFdieesS72ag83wiFMiXdsDHdEJBe+w90tchdP1BET/SB6coJ7k7TmPezGe31e
	P96JUZTwzfohrlFoJDrRHo5sg3YhgDaUkMJLZ2f2KEcRP/Hn7jC7FT02rK3+7dhWtVeyxV5BFIjVY
	4uoGpmdPkbq2chduc6HvTgUSazzXaLRqIUuujo6yXbBl6dU25VHwAiV1iv9vc1CSD0ldJM62ao42U
	X3jO7/EVFZp8NgGFi4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4qtn-006XaN-Nd; Mon, 12 Dec 2022 22:03:47 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4qtb-006XWK-5N
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 22:03:37 +0000
Received: by mail-qk1-x729.google.com with SMTP id x18so5757686qki.4
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 14:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H8tNx4JMG+gKP0BZeEF6ikCYeMz41r++QkWX8vYlQZM=;
        b=fxTE10OGf3TVyQxMLoDuqEMEvCKCuX6oKKQscuWuJW8s4G4XvLTdmuezqay8Mg9JYm
         SjIqhlKCJR0Ww+iau0nkyCwnH23sgTOWqnOZvVoQPS4gyvJllvkixGnDaHuYM4MSpPUH
         vlJ5QwL4fXZJkiYDMnhBNhlnIqrbtZ9SwiH8+UXOIFOatiUaZvTURGeq3eeSOKyLuZAK
         He3GLK1W5lEJMqftamCtWkFaxkazZNUe3RGAfK7LbqQH1pwQ3zt3YGHNkoXzME6bNoHB
         S2ESaoEY+DI1mjVH8CgA7w+zhvFCLohTewNQOniHfIQ5HYoZ0uBPJGaY1xD8goR0I/Fi
         l7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8tNx4JMG+gKP0BZeEF6ikCYeMz41r++QkWX8vYlQZM=;
        b=6lnqbFxrBtW3IE45ne4N9eeU90tuHgOlGb7q3WEoIOIinWFEdFqEVHQKUOxMlRSr4R
         fn06/QRr7MUWIjBJv/JgpwYtU5sINPvjoS7TtIs5Iv2BpRtRnYDONjyBkKp/RjLW+6pp
         o5ofA471XE1D8RMxAKhVtUK0DD63CDsmyytFxIpVDIdAYpJ+hb210ivLTM3LS8jHJNu+
         LtMJvkIz7IPCIQ8GiS/XK22rKxt78cSUzUTv0nzF8AXuaK9p9LACh8Gupw5w6LJ026E/
         KCAHpfPCPn7jEBboCgW80wWo+eHGxvry+1FbSIdizV3WPQURKisQXd1DiZplVFgLB0DX
         yohA==
X-Gm-Message-State: ANoB5pkYZnDb3nyB4ZPqv2pNx0gJD41KNWfpZxhUmcjy0LTZLaAtSzKl
	dhDI1Zk3hB5rltkGoza54i8s7tDK/qcaJ4JOFJcVgg==
X-Google-Smtp-Source: AA0mqf6Lfo5iFMd62emQsE/GPr8MrnqXMWIYcSRSfcv9BTwdZvHpZDZvH+CRfINtutrDx+tvKeU8pqz46nZZZu5exoY=
X-Received: by 2002:a37:808:0:b0:6fe:d95e:3cae with SMTP id
 8-20020a370808000000b006fed95e3caemr8457916qki.768.1670882612067; Mon, 12 Dec
 2022 14:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-34-dmatlack@google.com>
In-Reply-To: <20221208193857.4090582-34-dmatlack@google.com>
From: Ben Gardon <bgardon@google.com>
Date: Mon, 12 Dec 2022 14:03:20 -0800
Message-ID: <CANgfPd_069QPNby+mR4GuOWDNJtFk_=9EOffb0=2_V5TH-ZCDA@mail.gmail.com>
Subject: Re: [RFC PATCH 33/37] KVM: Move kvm_arch_flush_remote_tlbs_memslot()
 to common code
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Mingwei Zhang <mizhang@google.com>, Krish Sadhukhan <krish.sadhukhan@oracle.com>, 
	Ricardo Koller <ricarkol@google.com>, Jing Zhang <jingzhangos@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_140335_263798_80EF3D48 
X-CRM114-Status: GOOD (  28.55  )
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

On Thu, Dec 8, 2022 at 11:40 AM David Matlack <dmatlack@google.com> wrote:
>
> Move kvm_arch_flush_remote_tlbs_memslot() to common code and drop
> "arch_" from the name. kvm_arch_flush_remote_tlbs_memslot() is just a
> range-based TLB invalidation where the range is defined by the memslot.
> Now that kvm_flush_remote_tlbs_range() can be called from common code we
> can just use that and drop a bunch of duplicate code from the arch
> directories.
>
> Note this adds a lockdep assertion for slot_lock being held when calling
> kvm_flush_remote_tlbs_memslot(), which was previously only asserted on
> x86.

Besides the one lockdep assertion, is there any benefit to having this
wrapper function? Open-coding "kvm_flush_remote_tlbs_range(kvm,
memslot->base_gfn, memslot->npages);" is only a slightly longer line
and, IMO, just as readable. I'm happy to see this cleanup, but it
might be just as easy to drop the function.

>
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/arm64/kvm/arm.c     |  6 ------
>  arch/mips/kvm/mips.c     | 10 ++--------
>  arch/riscv/kvm/mmu.c     |  6 ------
>  arch/x86/kvm/mmu/mmu.c   | 16 +---------------
>  arch/x86/kvm/x86.c       |  2 +-
>  include/linux/kvm_host.h |  7 +++----
>  virt/kvm/kvm_main.c      | 17 +++++++++++++++--
>  7 files changed, 22 insertions(+), 42 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 0e0d4c4f79a2..4f1549c1d2d2 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1430,12 +1430,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
>                                         struct kvm_arm_device_addr *dev_addr)
>  {
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..ecd8a051fd6b 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -209,7 +209,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>         /* Flush slot from GPA */
>         kvm_mips_flush_gpa_pt(kvm, slot->base_gfn,
>                               slot->base_gfn + slot->npages - 1);
> -       kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +       kvm_flush_remote_tlbs_memslot(kvm, slot);
>         spin_unlock(&kvm->mmu_lock);
>  }
>
> @@ -245,7 +245,7 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
>                 needs_flush = kvm_mips_mkclean_gpa_pt(kvm, new->base_gfn,
>                                         new->base_gfn + new->npages - 1);
>                 if (needs_flush)
> -                       kvm_arch_flush_remote_tlbs_memslot(kvm, new);
> +                       kvm_flush_remote_tlbs_memslot(kvm, new);
>                 spin_unlock(&kvm->mmu_lock);
>         }
>  }
> @@ -997,12 +997,6 @@ int kvm_arch_flush_remote_tlb(struct kvm *kvm)
>         return 1;
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>  {
>         long r;
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index a8281a65cb3d..98bf3719a396 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -406,12 +406,6 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       kvm_flush_remote_tlbs(kvm);
> -}
> -
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free)
>  {
>  }
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 19963ed83484..f2602ee1771f 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6524,7 +6524,7 @@ static void kvm_rmap_zap_collapsible_sptes(struct kvm *kvm,
>          */
>         if (slot_handle_level(kvm, slot, kvm_mmu_zap_collapsible_spte,
>                               PG_LEVEL_4K, KVM_MAX_HUGEPAGE_LEVEL - 1, true))
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, slot);
> +               kvm_flush_remote_tlbs_memslot(kvm, slot);
>  }
>
>  void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
> @@ -6543,20 +6543,6 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
>         }
>  }
>
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot)
> -{
> -       /*
> -        * All current use cases for flushing the TLBs for a specific memslot
> -        * related to dirty logging, and many do the TLB flush out of mmu_lock.
> -        * The interaction between the various operations on memslot must be
> -        * serialized by slots_locks to ensure the TLB flush from one operation
> -        * is observed by any other operation on the same memslot.
> -        */
> -       lockdep_assert_held(&kvm->slots_lock);
> -       kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
> -}
> -
>  void kvm_mmu_slot_leaf_clear_dirty(struct kvm *kvm,
>                                    const struct kvm_memory_slot *memslot)
>  {
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 517c8ed33542..95ff95da55d5 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12574,7 +12574,7 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
>                  * See is_writable_pte() for more details (the case involving
>                  * access-tracked SPTEs is particularly relevant).
>                  */
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, new);
> +               kvm_flush_remote_tlbs_memslot(kvm, new);
>         }
>  }
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d9a7f559d2c5..46ed0ef4fb79 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1366,6 +1366,8 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *vcpu, bool usermode_vcpu_not_eligible);
>
>  void kvm_flush_remote_tlbs(struct kvm *kvm);
>  void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
> +void kvm_flush_remote_tlbs_memslot(struct kvm *kvm,
> +                                  const struct kvm_memory_slot *memslot);
>
>  #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>  int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
> @@ -1394,10 +1396,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
>                                         unsigned long mask);
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot);
>
> -#ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -                                       const struct kvm_memory_slot *memslot);
> -#else /* !CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
> +#ifndef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
>  int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log);
>  int kvm_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log,
>                       int *is_dirty, struct kvm_memory_slot **memslot);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 662ca280c0cf..39c2efd15504 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -388,6 +388,19 @@ void __weak kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pa
>         kvm_flush_remote_tlbs(kvm);
>  }
>
> +void kvm_flush_remote_tlbs_memslot(struct kvm *kvm, const struct kvm_memory_slot *memslot)
> +{
> +       /*
> +        * All current use cases for flushing the TLBs for a specific memslot
> +        * related to dirty logging, and many do the TLB flush out of mmu_lock.
> +        * The interaction between the various operations on memslot must be
> +        * serialized by slots_locks to ensure the TLB flush from one operation
> +        * is observed by any other operation on the same memslot.
> +        */
> +       lockdep_assert_held(&kvm->slots_lock);
> +       kvm_flush_remote_tlbs_range(kvm, memslot->base_gfn, memslot->npages);
> +}
> +
>  static void kvm_flush_shadow_all(struct kvm *kvm)
>  {
>         kvm_arch_flush_shadow_all(kvm);
> @@ -2197,7 +2210,7 @@ static int kvm_get_dirty_log_protect(struct kvm *kvm, struct kvm_dirty_log *log)
>         }
>
>         if (flush)
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
> +               kvm_flush_remote_tlbs_memslot(kvm, memslot);
>
>         if (copy_to_user(log->dirty_bitmap, dirty_bitmap_buffer, n))
>                 return -EFAULT;
> @@ -2314,7 +2327,7 @@ static int kvm_clear_dirty_log_protect(struct kvm *kvm,
>         KVM_MMU_UNLOCK(kvm);
>
>         if (flush)
> -               kvm_arch_flush_remote_tlbs_memslot(kvm, memslot);
> +               kvm_flush_remote_tlbs_memslot(kvm, memslot);
>
>         return 0;
>  }
> --
> 2.39.0.rc1.256.g54fd8350bd-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
