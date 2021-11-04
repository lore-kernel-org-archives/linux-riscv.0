Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B5FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 21:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D3F61213
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 21:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24D3F61213
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTmjqPFXWiN41TgYKtkkYPDNqbvbpnWH82qr4imthQw=; b=0M55pofYKTk6BI
	Exlg9OiIuEPNlLp8v6QE/CkaOMEielUcelUT+KVlwYgO2shlQUzMec3KEOCEmOIxPkUOkVRaetbpz
	OhAHoPuqvv+jFpMTbinpaxsCulcemvAFkXdCvD6ur/SwxmmZmVhZSSha3f0ZeZGgGgOf+/Ng2CVxv
	wM06S3fewvmVQs1IgznK/LWHPt/OOSDOJLwicoU7Z1/VePNjjo28EMaH0RhN8pP4e+toMbJGJ4jpl
	eEpsCfQmXk9mRbU5twQ35Cd6JxvysaJMMw8T10t6meQ0P24jhwRPAmRdv+6ueCxW9fuNu75VoyIYY
	k+owH6e0/DOGm+ars/uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mikHe-00A02n-Bh; Thu, 04 Nov 2021 21:28:30 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mikHO-009zzm-RF
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 21:28:18 +0000
Received: by mail-io1-xd35.google.com with SMTP id e144so8564074iof.3
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 14:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kT59fOFXGdqG57cxSFiBCbx9dcYetqnRywW1gdZNmeY=;
 b=gT4nzQq0x89i6Vp5dNWtSZrRbMe0W3qbbXwW9NXWgaRs8fYbXvHzdlEGUK48g0ajas
 uHVv10bVNkjhWr3B3MYTi44+qGBwBfoBwhj+2jrlWAsr2slc13bc4BseaXy2AoLJs6t8
 xRBsjkLiRiH+rEZC9bjYDRvB0cKfRmGxlddQQ74lKlIH3DSIbhZURrg/4JSes8eUaatv
 4YcLz57IesgJy0I2f7nby9V0UuPZTikaQqcNEzddlw13/ibFXy00E0dEkzMok1oNoZqt
 ZDIYGh1maMM5k3AvqVuUpAr6S+JkIrJwFta52d8TDhA2FBg5X1Xits9o/XjdmWUTRl4X
 pAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kT59fOFXGdqG57cxSFiBCbx9dcYetqnRywW1gdZNmeY=;
 b=o1yc9s7mWDYttkfsqxya8rD2oLwTgyBo307l/9L3GYjVURBFUIipz6CoAnjMqH3J/X
 JzEjYIXF4qPXfS/dTsO6e7RDKnxZ6HgRLSlgcLWXDLEeYGkVXqwk9S/ma78LcxYNLsqX
 P5jwTNtiwrjCcVgUs/Kvii63EY7kiWbnsJ+hLyaIK1UKLly647+ppE+BhBoUbasEBnVs
 3YH32L+35clOF//t0x80LhaojTFf/CUeH7mh6F8nucbDdBn2pO10q5yoXtnQ37wMIHvS
 QdrrOKzacuvoYnh/hDjLxv51NddMXb3Cm/9UKzW6f1YkCJ8R0BqpxIkSV8X+KmEg9LJt
 cR/Q==
X-Gm-Message-State: AOAM531oB11e8GPFwthG185YjDLwBzvTp3LKk3Qv0YfCqobRTGNqbObj
 ImH0IdRWz1QggkoTNXoasfHTzGwG39aU6g+R4AP+TQ==
X-Google-Smtp-Source: ABdhPJyMIoxuukzQc6rukS1CsN0VzOsX5g2manzJn1KGK69DmvdVJ1f5vqR2wNyFb/XiaX/LmgNI1ppfR5uwGseVoTo=
X-Received: by 2002:a05:6602:1612:: with SMTP id
 x18mr282554iow.37.1636061290880; 
 Thu, 04 Nov 2021 14:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-2-seanjc@google.com>
In-Reply-To: <20211104002531.1176691-2-seanjc@google.com>
From: Ben Gardon <bgardon@google.com>
Date: Thu, 4 Nov 2021 14:27:59 -0700
Message-ID: <CANgfPd-uuPFjAHk5kVNom2Qs=UU_GX6CQ0xDLg1h_iL8t8S2aQ@mail.gmail.com>
Subject: Re: [PATCH v5.5 01/30] KVM: Ensure local memslot copies operate on
 up-to-date arch-specific data
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_142814_896575_EB12B3AE 
X-CRM114-Status: GOOD (  32.69  )
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

On Wed, Nov 3, 2021 at 5:26 PM Sean Christopherson <seanjc@google.com> wrote:
>
> When modifying memslots, snapshot the "old" memslot and copy it to the
> "new" memslot's arch data after (re)acquiring slots_arch_lock.  x86 can
> change a memslot's arch data while memslot updates are in-progress so
> long as it holds slots_arch_lock, thus snapshotting a memslot without
> holding the lock can result in the consumption of stale data.
>
> Fixes: b10a038e84d1 ("KVM: mmu: Add slots_arch_lock for memslot arch fields")
> Cc: stable@vger.kernel.org
> Cc: Ben Gardon <bgardon@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 47 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 31 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 3f6d450355f0..99e69375c4c9 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1531,11 +1531,10 @@ static struct kvm_memslots *kvm_dup_memslots(struct kvm_memslots *old,
>
>  static int kvm_set_memslot(struct kvm *kvm,
>                            const struct kvm_userspace_memory_region *mem,
> -                          struct kvm_memory_slot *old,
>                            struct kvm_memory_slot *new, int as_id,
>                            enum kvm_mr_change change)
>  {
> -       struct kvm_memory_slot *slot;
> +       struct kvm_memory_slot *slot, old;
>         struct kvm_memslots *slots;
>         int r;
>
> @@ -1566,7 +1565,7 @@ static int kvm_set_memslot(struct kvm *kvm,
>                  * Note, the INVALID flag needs to be in the appropriate entry
>                  * in the freshly allocated memslots, not in @old or @new.
>                  */
> -               slot = id_to_memslot(slots, old->id);
> +               slot = id_to_memslot(slots, new->id);

Since new is guaranteed to have the same id as old (at least prior to
this change) this is a no-op change, so no problem here.
This could be a separate commit which would have no functional change
but only worth extracting if you send a v2.

>                 slot->flags |= KVM_MEMSLOT_INVALID;
>
>                 /*
> @@ -1597,6 +1596,26 @@ static int kvm_set_memslot(struct kvm *kvm,
>                 kvm_copy_memslots(slots, __kvm_memslots(kvm, as_id));
>         }
>
> +       /*
> +        * Make a full copy of the old memslot, the pointer will become stale
> +        * when the memslots are re-sorted by update_memslots(), and the old
> +        * memslot needs to be referenced after calling update_memslots(), e.g.
> +        * to free its resources and for arch specific behavior.  This needs to
> +        * happen *after* (re)acquiring slots_arch_lock.
> +        */
> +       slot = id_to_memslot(slots, new->id);
> +       if (slot) {
> +               old = *slot;
> +       } else {
> +               WARN_ON_ONCE(change != KVM_MR_CREATE);
> +               memset(&old, 0, sizeof(old));
> +               old.id = new->id;
> +               old.as_id = as_id;
> +       }
> +
> +       /* Copy the arch-specific data, again after (re)acquiring slots_arch_lock. */
> +       memcpy(&new->arch, &old.arch, sizeof(old.arch));
> +

Is new->arch not initialized before this function is called? Does this
need to be here, or could it be moved above into the first branch of
the if statement?
Oh I see you removed the memset below and replaced it with this. I
think this is fine, but it might be easier to reason about if we left
the memset and moved the memcopy into the if.
No point in doing a memcpy of zeros here.

>         r = kvm_arch_prepare_memory_region(kvm, new, mem, change);
>         if (r)
>                 goto out_slots;
> @@ -1604,14 +1623,18 @@ static int kvm_set_memslot(struct kvm *kvm,
>         update_memslots(slots, new, change);
>         slots = install_new_memslots(kvm, as_id, slots);
>
> -       kvm_arch_commit_memory_region(kvm, mem, old, new, change);
> +       kvm_arch_commit_memory_region(kvm, mem, &old, new, change);
> +
> +       /* Free the old memslot's metadata.  Note, this is the full copy!!! */
> +       if (change == KVM_MR_DELETE)
> +               kvm_free_memslot(kvm, &old);
>
>         kvfree(slots);
>         return 0;
>
>  out_slots:
>         if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
> -               slot = id_to_memslot(slots, old->id);
> +               slot = id_to_memslot(slots, new->id);
>                 slot->flags &= ~KVM_MEMSLOT_INVALID;
>                 slots = install_new_memslots(kvm, as_id, slots);
>         } else {
> @@ -1626,7 +1649,6 @@ static int kvm_delete_memslot(struct kvm *kvm,
>                               struct kvm_memory_slot *old, int as_id)
>  {
>         struct kvm_memory_slot new;
> -       int r;
>
>         if (!old->npages)
>                 return -EINVAL;
> @@ -1639,12 +1661,7 @@ static int kvm_delete_memslot(struct kvm *kvm,
>          */
>         new.as_id = as_id;
>
> -       r = kvm_set_memslot(kvm, mem, old, &new, as_id, KVM_MR_DELETE);
> -       if (r)
> -               return r;
> -
> -       kvm_free_memslot(kvm, old);
> -       return 0;
> +       return kvm_set_memslot(kvm, mem, &new, as_id, KVM_MR_DELETE);
>  }
>
>  /*
> @@ -1718,7 +1735,6 @@ int __kvm_set_memory_region(struct kvm *kvm,
>         if (!old.npages) {
>                 change = KVM_MR_CREATE;
>                 new.dirty_bitmap = NULL;
> -               memset(&new.arch, 0, sizeof(new.arch));
>         } else { /* Modify an existing slot. */
>                 if ((new.userspace_addr != old.userspace_addr) ||
>                     (new.npages != old.npages) ||
> @@ -1732,9 +1748,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
>                 else /* Nothing to change. */
>                         return 0;
>
> -               /* Copy dirty_bitmap and arch from the current memslot. */
> +               /* Copy dirty_bitmap from the current memslot. */
>                 new.dirty_bitmap = old.dirty_bitmap;
> -               memcpy(&new.arch, &old.arch, sizeof(new.arch));
>         }
>
>         if ((change == KVM_MR_CREATE) || (change == KVM_MR_MOVE)) {
> @@ -1760,7 +1775,7 @@ int __kvm_set_memory_region(struct kvm *kvm,
>                         bitmap_set(new.dirty_bitmap, 0, new.npages);
>         }
>
> -       r = kvm_set_memslot(kvm, mem, &old, &new, as_id, change);
> +       r = kvm_set_memslot(kvm, mem, &new, as_id, change);
>         if (r)
>                 goto out_bitmap;
>
> --
> 2.33.1.1089.g2158813163f-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
