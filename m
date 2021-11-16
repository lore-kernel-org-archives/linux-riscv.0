Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7C4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D0663232
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 14:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7D0663232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzDDbpEh7QW7hQHiTEjPd4AuotRP1s62K9KGSxJEPAU=; b=UXTANfJqRFZOeI
	ttJ4YE7C0Ay2C+lryz3TUkTMW6cPCNnNhohIoyxtRDq9rE6/fO6JLbQUd+n3BDxQiH9aml1X1BYmC
	w/nklH6hAEpUnwtCpSjqVfxvVo9/5SMUqvf9wSKSbF2s6CrI46JDJo3aE2dAQW0mvsDn+ys60yLTq
	crMSnGLR4PuGdChe7LvZyTZ4gxpCkpNVP2/0oenocp49Lbqkbpqk5dWpUMNm9Jot8iKZ/xkaVYNpH
	GmJLgVxsPb+f9YeXpZGlq6bYcDHtkE1sDMOHoHzfB9fKZjXhIRKzbr7T5qM5w5WLcmHKBKYs8+VHQ
	vXWP7xu4ij5Wb9yLRSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzNF-001sxt-SW; Tue, 16 Nov 2021 14:23:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzND-001sx1-DE
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 14:23:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id d5so37951102wrc.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 06:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h7kOp545uVgx+GwL0MS2uV1T/3qLsZYrxv7B/NrXjJ0=;
 b=EMhiTIADHX9DiXxs1O8k/BKoqlBWAU/GRoWm0wPlPlMvCMCar7lRLY8j/HCLDSu+9q
 bQ+5g0kVF9+WDT61LBdd4DdKHxhMr4Zex6NYFbjZ1vJSvOLWdQRmGK5reVKGuA/pMc81
 4dfOnSmhgTTZKcHCAFoG44Owt3/v3ZpnFzKRwA1i6GLVx6kpEz7DJbNOQqJfufktOBKn
 eDPGSjAugQFu1al3bgZPR9W6GMeHRPMJfV7OC8y3ZPFn6fWg3Gn/QFpMxxi8Vrsy+ofi
 lIfV0QHe8wRNtrVGNUCym2Ohe7bbx0VSh5LON5Q11cDYoKv/gu8PC1mJ9OYFB22YMLDw
 JdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h7kOp545uVgx+GwL0MS2uV1T/3qLsZYrxv7B/NrXjJ0=;
 b=srgjCkGhK+MzGNRLpfj5ruFf4snQJbssqu5FrBpXFJwZCfTxCFKLnSRMczDz3bHEF+
 24kFeVCr9YZl9ba8ijirXetE7L+7nPG2ynrFcCEH7EKcLlanv0l7Rj5Q5g/75j0Ub+zK
 6nRfbji+dnySTBSk5dJ60I+8yngdPiEKSmnLcX7frVKohX1LI8Jo8mfXgXM0t1giA+Ql
 72x1EtuF1C7jKLdlRGbvhqZN+LQxdFK/6icv6gHZSwmQQKPPhBj7+JgXeIwKCvZklv6d
 ec+n6EIvzNfdlP08nBHJuGGeGOA4UFL8pXvr8POcNLeZpyeSTS33xditx+N7Mpiv8Jzm
 wruQ==
X-Gm-Message-State: AOAM530NhptJxd/z6jOCW9CVa16ngCKTRsjvF0JDW5XCSzT8p9B2FKJ5
 aFpf+AykVVUHNmtQxSTiUK2XC6yiuY8H4bmeIdObcA==
X-Google-Smtp-Source: ABdhPJy1qTUFimPfD6YE2YJwCxkMQbs6CZrlUst3mZPNkbsBqE7ARnXVPNrMOA8ymxY0gvwCyDiplZvMikGY4x4mz6A=
X-Received: by 2002:a5d:628f:: with SMTP id k15mr9997324wru.363.1637072625270; 
 Tue, 16 Nov 2021 06:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20211104164107.1291793-1-seanjc@google.com>
 <20211104164107.1291793-2-seanjc@google.com>
In-Reply-To: <20211104164107.1291793-2-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Nov 2021 19:47:08 +0530
Message-ID: <CAAhSdy1sREo9KT_99kbz70RYLsXr1aCSapxxpraZ6ZOxh1P+kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: RISC-V: Unmap stage2 mapping when
 deleting/moving a memslot
To: Sean Christopherson <seanjc@google.com>
Cc: Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, KVM General <kvm@vger.kernel.org>,
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_062347_479086_5698FDAC 
X-CRM114-Status: GOOD (  13.79  )
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

On Thu, Nov 4, 2021 at 10:11 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Unmap stage2 page tables when a memslot is being deleted or moved.  It's
> the architectures' responsibility to ensure existing mappings are removed
> when kvm_arch_flush_shadow_memslot() returns.
>
> Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> Signed-off-by: Sean Christopherson <seanjc@google.com>

The Fixes tag should be
Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")

Otherwise it looks good to me.

I have queued this patch for fixes.

Thanks,
Anup

> ---
>  arch/riscv/kvm/mmu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index d81bae8eb55e..fc058ff5f4b6 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -453,6 +453,12 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>                                    struct kvm_memory_slot *slot)
>  {
> +       gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
> +       phys_addr_t size = slot->npages << PAGE_SHIFT;
> +
> +       spin_lock(&kvm->mmu_lock);
> +       stage2_unmap_range(kvm, gpa, size, false);
> +       spin_unlock(&kvm->mmu_lock);
>  }
>
>  void kvm_arch_commit_memory_region(struct kvm *kvm,
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
