Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C134C4167D
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV/RKNPBA2Xlyy6+qp+/5Ptwnj/Ng+gmt8M2K2EUGxo=; b=YIeUGbXlYRsdAr
	5caNXpbgsyOSeR01aoc42NXy9e24bWC2UDx6YV/LjudAuQmft6/GAZCUBnSGk8I76jyg7J2Xv/A0s
	XcxzQn8QbMrc3w8MpQCCQd8ym/X3NTJqcIm1aVjyUlmIR0qYJh3nUal6GN7s4sUQOhUv+dIu4CgR/
	NW0/GwsWhJoegB7A5qHOCjhFv77gquxf82zlRSKVAijT1QgFNzjUjAyphYkWZbohfO4vvR/ebY3Ed
	zy6gVMnvimK6dmDlcYbziJWYSOE0sIKlOi3jiNSEm+JYGFCxQu9opx5YG0/jfk4X12HAncKsfVED2
	yXnbfrlW+99qwzl0pgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzx1T-00GFyn-2a;
	Mon, 06 Nov 2023 10:39:59 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzx1P-00GFwv-0z
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 10:39:58 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a8ada42c2aso49262377b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 02:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699267193; x=1699871993; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IP7Ako7Zwt1UjgwHJt9bCrv1N1+7f/8KEsqclU/31Lo=;
        b=HnZNCveWkxRX0XKvNkTDE383I4kcQhVXgKcInaT1AL6k6V0ld6xvX5eeutsjaBHcpM
         zl2Bbd+cliFCzEcFh2up5f/LkJzUQU2/1noOIklcN1r9f+LcDlRbCzKWOTnVOR5EI+Vb
         MzCBfS9DQjKgUUWwlCFwdZo0SwzEDuHd86DtpvJvcrqq86sAUg2y99NEIDLaMYVfDWCW
         Ohrv+RRMHP1jXBtgM7Ir1ADp8oIq5lAACKAQ+Z/zYNpp23WZbQxcSUkAPBFeUhJSbXHa
         RwMz3UfViwrmGa+hmSk9A8MWQ4OJokIIQaNa+X+xwUP2347MeBLu5GvvZknHQAuP8vy0
         KvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267193; x=1699871993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IP7Ako7Zwt1UjgwHJt9bCrv1N1+7f/8KEsqclU/31Lo=;
        b=e7KETn1eDSULMowv3MiCzUqm3vwMTireHiSCiiMAS8ugnUJK97sS/uZqhl4jYgAkKC
         LH3iRkBNkukzr/HEEV9hXbVp6N0OL8yt9KQFlnoRYl9j2/oxhSKgbC/dONhajcWckNje
         TUZft3dgYPR/o5rn6KgYV81cWgizY4iELOjTP9dzGZcvoRnzO54KsrAfiWY8GMMVkD/o
         OWlp2yq4a+B1pzxd/1Wr6ZsAzxKxJuemgbTILNOBGMyn+zkipbiDoYJJTA7bHFGX4iOy
         Zlaoe1cf5EVag/h664JwNSOSeGgMgQNc5nvwA6JN6sBQcwMoURfF17A7t1r+yal5NxAk
         tfLQ==
X-Gm-Message-State: AOJu0YzTNghJWk+tHwaVlF5kTnhPtjAG8JzIQMICJ3TKsGBKCHkQ4Wcr
	FUpUUbjzo5kGlmgIXt7IQnGQhSE7Tj03tI5vcffB5Q==
X-Google-Smtp-Source: AGHT+IF3rzQ5LOrId/XYQctH9B6CwyxTW0O3KUw3PMrr+bssM8YhYBIXogRP/nz1I462+uCjwm0FcVpnK+jerK57G6Q=
X-Received: by 2002:a25:e753:0:b0:d89:aa7e:aed9 with SMTP id
 e80-20020a25e753000000b00d89aa7eaed9mr25948223ybh.23.1699267193428; Mon, 06
 Nov 2023 02:39:53 -0800 (PST)
MIME-Version: 1.0
References: <20231105163040.14904-1-pbonzini@redhat.com> <20231105163040.14904-13-pbonzini@redhat.com>
In-Reply-To: <20231105163040.14904-13-pbonzini@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 6 Nov 2023 10:39:17 +0000
Message-ID: <CA+EHjTxCv7oHQbT-M76Q+rXdN26hCYUtD8FAORw8PSLP+P-JVQ@mail.gmail.com>
Subject: Re: [PATCH 12/34] KVM: Introduce per-page memory attributes
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_023955_345259_3F5588DE 
X-CRM114-Status: GOOD (  29.34  )
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

Hi,

...

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 96aa930536b1..68a144cb7dbc 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -256,6 +256,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
>  union kvm_mmu_notifier_arg {
>         pte_t pte;
> +       unsigned long attributes;
>  };
>
>  struct kvm_gfn_range {
> @@ -806,6 +807,10 @@ struct kvm {
>
>  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>         struct notifier_block pm_notifier;
> +#endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       /* Protected by slots_locks (for writes) and RCU (for reads) */

slots_locks -> slots_lock

Otherwise,
Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> +       struct xarray mem_attr_array;
>  #endif
>         char stats_id[KVM_STATS_NAME_SIZE];
>  };
> @@ -2338,4 +2343,18 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
>         vcpu->run->memory_fault.flags = 0;
>  }
>
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +{
> +       return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> +}
> +
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attrs);
> +bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> +                                       struct kvm_gfn_range *range);
> +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> +                                        struct kvm_gfn_range *range);
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>  #endif
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 59010a685007..e8d167e54980 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1220,6 +1220,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES 230
>  #define KVM_CAP_USER_MEMORY2 231
>  #define KVM_CAP_MEMORY_FAULT_INFO 232
> +#define KVM_CAP_MEMORY_ATTRIBUTES 233
>
>  #ifdef KVM_CAP_IRQ_ROUTING
>
> @@ -2288,4 +2289,16 @@ struct kvm_s390_zpci_op {
>  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
>  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
>
> +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd2, struct kvm_memory_attributes)
> +
> +struct kvm_memory_attributes {
> +       __u64 address;
> +       __u64 size;
> +       __u64 attributes;
> +       __u64 flags;
> +};
> +
> +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> +
>  #endif /* __LINUX_KVM_H */
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index ecae2914c97e..5bd7fcaf9089 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -96,3 +96,7 @@ config KVM_GENERIC_HARDWARE_ENABLING
>  config KVM_GENERIC_MMU_NOTIFIER
>         select MMU_NOTIFIER
>         bool
> +
> +config KVM_GENERIC_MEMORY_ATTRIBUTES
> +       select KVM_GENERIC_MMU_NOTIFIER
> +       bool
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7f3291dec7a6..f1a575d39b3b 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1211,6 +1211,9 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>         spin_lock_init(&kvm->mn_invalidate_lock);
>         rcuwait_init(&kvm->mn_memslots_update_rcuwait);
>         xa_init(&kvm->vcpu_array);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       xa_init(&kvm->mem_attr_array);
> +#endif
>
>         INIT_LIST_HEAD(&kvm->gpc_list);
>         spin_lock_init(&kvm->gpc_lock);
> @@ -1391,6 +1394,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
>         }
>         cleanup_srcu_struct(&kvm->irq_srcu);
>         cleanup_srcu_struct(&kvm->srcu);
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       xa_destroy(&kvm->mem_attr_array);
> +#endif
>         kvm_arch_free_vm(kvm);
>         preempt_notifier_dec();
>         hardware_disable_all();
> @@ -2397,6 +2403,200 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
>
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +/*
> + * Returns true if _all_ gfns in the range [@start, @end) have attributes
> + * matching @attrs.
> + */
> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attrs)
> +{
> +       XA_STATE(xas, &kvm->mem_attr_array, start);
> +       unsigned long index;
> +       bool has_attrs;
> +       void *entry;
> +
> +       rcu_read_lock();
> +
> +       if (!attrs) {
> +               has_attrs = !xas_find(&xas, end - 1);
> +               goto out;
> +       }
> +
> +       has_attrs = true;
> +       for (index = start; index < end; index++) {
> +               do {
> +                       entry = xas_next(&xas);
> +               } while (xas_retry(&xas, entry));
> +
> +               if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> +                       has_attrs = false;
> +                       break;
> +               }
> +       }
> +
> +out:
> +       rcu_read_unlock();
> +       return has_attrs;
> +}
> +
> +static u64 kvm_supported_mem_attributes(struct kvm *kvm)
> +{
> +       if (!kvm)
> +               return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +
> +       return 0;
> +}
> +
> +static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
> +                                                struct kvm_mmu_notifier_range *range)
> +{
> +       struct kvm_gfn_range gfn_range;
> +       struct kvm_memory_slot *slot;
> +       struct kvm_memslots *slots;
> +       struct kvm_memslot_iter iter;
> +       bool found_memslot = false;
> +       bool ret = false;
> +       int i;
> +
> +       gfn_range.arg = range->arg;
> +       gfn_range.may_block = range->may_block;
> +
> +       for (i = 0; i < KVM_ADDRESS_SPACE_NUM; i++) {
> +               slots = __kvm_memslots(kvm, i);
> +
> +               kvm_for_each_memslot_in_gfn_range(&iter, slots, range->start, range->end) {
> +                       slot = iter.slot;
> +                       gfn_range.slot = slot;
> +
> +                       gfn_range.start = max(range->start, slot->base_gfn);
> +                       gfn_range.end = min(range->end, slot->base_gfn + slot->npages);
> +                       if (gfn_range.start >= gfn_range.end)
> +                               continue;
> +
> +                       if (!found_memslot) {
> +                               found_memslot = true;
> +                               KVM_MMU_LOCK(kvm);
> +                               if (!IS_KVM_NULL_FN(range->on_lock))
> +                                       range->on_lock(kvm);
> +                       }
> +
> +                       ret |= range->handler(kvm, &gfn_range);
> +               }
> +       }
> +
> +       if (range->flush_on_ret && ret)
> +               kvm_flush_remote_tlbs(kvm);
> +
> +       if (found_memslot)
> +               KVM_MMU_UNLOCK(kvm);
> +}
> +
> +static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
> +                                         struct kvm_gfn_range *range)
> +{
> +       /*
> +        * Unconditionally add the range to the invalidation set, regardless of
> +        * whether or not the arch callback actually needs to zap SPTEs.  E.g.
> +        * if KVM supports RWX attributes in the future and the attributes are
> +        * going from R=>RW, zapping isn't strictly necessary.  Unconditionally
> +        * adding the range allows KVM to require that MMU invalidations add at
> +        * least one range between begin() and end(), e.g. allows KVM to detect
> +        * bugs where the add() is missed.  Relaxing the rule *might* be safe,
> +        * but it's not obvious that allowing new mappings while the attributes
> +        * are in flux is desirable or worth the complexity.
> +        */
> +       kvm_mmu_invalidate_range_add(kvm, range->start, range->end);
> +
> +       return kvm_arch_pre_set_memory_attributes(kvm, range);
> +}
> +
> +/* Set @attributes for the gfn range [@start, @end). */
> +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> +                                    unsigned long attributes)
> +{
> +       struct kvm_mmu_notifier_range pre_set_range = {
> +               .start = start,
> +               .end = end,
> +               .handler = kvm_pre_set_memory_attributes,
> +               .on_lock = kvm_mmu_invalidate_begin,
> +               .flush_on_ret = true,
> +               .may_block = true,
> +       };
> +       struct kvm_mmu_notifier_range post_set_range = {
> +               .start = start,
> +               .end = end,
> +               .arg.attributes = attributes,
> +               .handler = kvm_arch_post_set_memory_attributes,
> +               .on_lock = kvm_mmu_invalidate_end,
> +               .may_block = true,
> +       };
> +       unsigned long i;
> +       void *entry;
> +       int r = 0;
> +
> +       entry = attributes ? xa_mk_value(attributes) : NULL;
> +
> +       mutex_lock(&kvm->slots_lock);
> +
> +       /* Nothing to do if the entire range as the desired attributes. */
> +       if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
> +               goto out_unlock;
> +
> +       /*
> +        * Reserve memory ahead of time to avoid having to deal with failures
> +        * partway through setting the new attributes.
> +        */
> +       for (i = start; i < end; i++) {
> +               r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
> +               if (r)
> +                       goto out_unlock;
> +       }
> +
> +       kvm_handle_gfn_range(kvm, &pre_set_range);
> +
> +       for (i = start; i < end; i++) {
> +               r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> +                                   GFP_KERNEL_ACCOUNT));
> +               KVM_BUG_ON(r, kvm);
> +       }
> +
> +       kvm_handle_gfn_range(kvm, &post_set_range);
> +
> +out_unlock:
> +       mutex_unlock(&kvm->slots_lock);
> +
> +       return r;
> +}
> +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> +                                          struct kvm_memory_attributes *attrs)
> +{
> +       gfn_t start, end;
> +
> +       /* flags is currently not used. */
> +       if (attrs->flags)
> +               return -EINVAL;
> +       if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> +               return -EINVAL;
> +       if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> +               return -EINVAL;
> +       if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> +               return -EINVAL;
> +
> +       start = attrs->address >> PAGE_SHIFT;
> +       end = (attrs->address + attrs->size) >> PAGE_SHIFT;
> +
> +       /*
> +        * xarray tracks data using "unsigned long", and as a result so does
> +        * KVM.  For simplicity, supports generic attributes only on 64-bit
> +        * architectures.
> +        */
> +       BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
> +
> +       return kvm_vm_set_mem_attributes(kvm, start, end, attrs->attributes);
> +}
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
> +
>  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>  {
>         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> @@ -4641,6 +4841,10 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>         case KVM_CAP_BINARY_STATS_FD:
>         case KVM_CAP_SYSTEM_EVENT_DATA:
>                 return 1;
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       case KVM_CAP_MEMORY_ATTRIBUTES:
> +               return kvm_supported_mem_attributes(kvm);
> +#endif
>         default:
>                 break;
>         }
> @@ -5034,6 +5238,18 @@ static long kvm_vm_ioctl(struct file *filp,
>                 break;
>         }
>  #endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +       case KVM_SET_MEMORY_ATTRIBUTES: {
> +               struct kvm_memory_attributes attrs;
> +
> +               r = -EFAULT;
> +               if (copy_from_user(&attrs, argp, sizeof(attrs)))
> +                       goto out;
> +
> +               r = kvm_vm_ioctl_set_mem_attributes(kvm, &attrs);
> +               break;
> +       }
> +#endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
>         case KVM_CREATE_DEVICE: {
>                 struct kvm_create_device cd;
>
> --
> 2.39.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
